local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(zoom,15;blend,'BlendMode_Add';y,-237+15;wag;effectmagnitude,15,-10,0;effecttiming,5,0,5,0;);
			OnCommand=cmd();
			LoadActor( THEME:GetPathB("_shared","models/NowPlaying") )..{
			OnCommand=cmd();
			};
		};
};

--JacketBG
t[#t+1] = LoadActor("cdbg")..{
	InitCommand=cmd();
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd();
};


t[#t+1]=Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("TargetScore") == "Off");
	LoadActor("TargetScore")..{
	InitCommand=cmd(x,-250;zoom,1;diffusealpha,0;);
			OnCommand=function(self)
				myScoreSet = StageTopRecord(PLAYER_1);
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						local topscore = myScoreSet["topscore"];
						self:diffusealpha(1);
					else
						self:diffusealpha(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
	};

	Def.RollingNumbers { -- Topscore
			File = THEME:GetPathF("_sf pro rounded","24px");
			InitCommand=cmd(shadowlength,0;zoom,0.75;maxwidth,240;x,-188;y,14;horizalign,right;);
			OnCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersCourseData");
				else
					self:Load("RollingNumbersSongData");
				end
				self:diffuse(color("white"));
				myScoreSet = StageTopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topscore"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
					else
						self:diffusealpha(0);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
};	
};

--Jacket
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,-40+12+15;draworder,1;diffusealpha,1;zoom,1.1;zoom,1;diffusealpha,1);
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(300,300);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(300,300);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:LoadBackground(song:GetJacketPath());
						self:setsize(300,300);
					elseif song:HasBackground() then
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(300,300);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(300,300);
					end;
				else
					self:diffusealpha(1);
			end;
		end;
		end;
	OffCommand=cmd();
	};
};


--songinfo--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,center;y,141+15+15;zoom,0.8;draworder,50;shadowlengthy,2;);
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
			local text = song:GetDisplayFullTitle();
				self:diffusealpha(1);
				self:maxwidth(370);
				self:settext(text);
			end;
		end;
	end;
};
--artist--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,center;y,167+22+15;zoom,0.6;draworder,50;shadowlengthy,2;);
	OnCommand=cmd(diffusealpha,0.5);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
		local text = song:GetDisplayArtist();
			self:diffusealpha(0.5);
			self:maxwidth(450);
			self:settext(text);
		end;
		end;
	end;
};

	
return t