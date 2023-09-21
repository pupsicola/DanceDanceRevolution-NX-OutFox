function GetSongBanner(song)
	if song then
		local path = song:GetBannerPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback banner")
end


return Def.CourseContentsList {

	MaxSongs = 10;
    NumItemsToDraw = 5;
	ShowCommand=cmd(bouncebegin,0.3;zoomy,1);
	HideCommand=cmd(linear,0.3;zoomy,0);
	SetCommand=function(self)
		self:SetFromGameState();
		self:SetCurrentAndDestinationItem(3);
		self:SetPauseCountdownSeconds(1);
		self:SetSecondsPauseBetweenItems( 0.000 );
--		self:SetTransformFromFunction(transform);
		--
		self:SetDestinationItem(100);
		self:SetLoop(true);
		self:SetMask(294,72);
	end;
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");

	Display = Def.ActorFrame { 
		InitCommand=cmd(setsize,294,72);

		LoadActor(THEME:GetPathG("CourseEntryDisplay","base")) .. {
-- 			InitCommand=cmd(diffusetopedge,Color("Invisible"));
			SetSongCommand=function(self, params)
				self:diffuse( color("#FFFFFF") );
				--self:cropright(0.66);
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;glow,color("1,1,1,0.5");decelerate,0.1;glow,color("0,0,0,0")))(self);
			end;
		};
				LoadActor(THEME:GetPathG("CourseEntryDisplay","base")) .. {
-- 			InitCommand=cmd(diffusetopedge,Color("Invisible"));
			SetSongCommand=function(self, params)
				--self:cropright(0.7);
				self:diffuse( color("#FFFFFF") );
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;glow,color("1,1,1,0.5");decelerate,0.1;glow,color("0,0,0,0")))(self);
			end;
		};
		
		LoadActor(THEME:GetPathG("CourseEntryDisplay","bar")) .. {
-- 			InitCommand=cmd(diffusetopedge,Color("Invisible"));
			SetSongCommand=function(self, params)
				if params.Difficulty then
-- 					self:diffuse( SONGMAN:GetSongColor(params.Song) );
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				else
					self:diffuse( color("#FFFFFF") );
-- 					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				end

				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;glow,color("1,1,1,0.5");decelerate,0.1;glow,color("1,1,1,0")))(self);
			end;
		};
		
		
		
		-----SongBanner--------------------------------------------
		Def.Sprite {
			Name="SongBanner";
			SetSongCommand=function(self, params)
				if params.Song then
					self:Load(GetSongGPath(params.Song));
				else
					self:load("UnknownBanner.png");
				end
				self:scaletoclipped( 60,60 );
				self:x(-83);
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			end;
		};
		
		--------------Song Text
		LoadFont("_helveticaneuelt pro 65 md 20px") .. {
			Text="0";
			InitCommand=cmd(x,-45;y,-22;maxwidth,250;horizalign,left;zoom,0.75;shadowlength,1);
			SetSongCommand=function(self, params)
			self:diffuse( color("0,0,0,1") );
			self:strokecolor( color("1,1,1,1"));
				if params.Secret ==true then
					self:settext("??????");
				else
					if params.Song then
						self:settext(params.Song:GetDisplayFullTitle());
					end;
				end;
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;))(self);
			end;
		}; 
		
		LoadFont("_helveticaneuelt pro 65 md 20px") .. {
			Text="0";
			InitCommand=cmd(x,-45;y,-7;maxwidth,350;horizalign,left;zoom,0.5;shadowlength,1);
			SetSongCommand=function(self, params)
			self:diffuse( color("0,0,0,1") );
			self:strokecolor( color("1,1,1,1"));
				if params.Secret ==true then
					self:settext("??????");
				else
					if params.Song then
						self:settext(params.Song:GetDisplayArtist());
					end;
				end;
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;))(self);
			end;
		}; 
		
		
		

		LoadFont("CourseEntryDisplay","number") .. {
			InitCommand=cmd(x,-114-8;y,-18;shadowlength,1);
			SetSongCommand=function(self, params) 
				self:settext(string.format("%i", params.Number)); 

				(cmd(finishtweening;zoom,0.5;zoomy,0.5*1.5;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;zoomy,0.5*1;zoomx,0.5*1.1;glow,color("1,1,1,0.5");decelerate,0.1;zoom,0.5;glow,color("1,1,1,0")))(self);
			end;
		}; 
		
 		LoadFont("CourseEntryDisplay","difficulty") .. {
			Text="0";
			InitCommand=cmd(x,125;y,18;zoom,0.45;shadowlength,1);
			SetSongCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
				self:settext( params.Meter );
				self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,0.5))(self);
			end;
		}; 
		
		LoadActor(THEME:GetPathG("CourseEntryDisplay","metertick")) .. {
			InitCommand=cmd(x,-35;y,18;shadowlength,1);
			SetSongCommand=function(self, params)
				if params.Difficulty then
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				else
					self:diffuse( color("#FFFFFF") );
				end
				
			    if tonumber(params.Meter) ~= nil then
				(cmd(finishtweening;horizalign,left;zoomx,0;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;glow,color("1,1,1,0.5");decelerate,0.1;glow,color("1,1,1,0");decelerate,0.1;zoomx,(params.Meter)*5/100))(self);
				else
					(cmd(finishtweening;horizalign,left;zoomx,0;diffusealpha,0;))(self);
				end;
			end;
		};
		
		
		
		
--[[ 		LoadFont("Common","normal") .. {
			OnCommand=cmd(x,0;y,-8;zoom,0.7;shadowlength,0);
			DifficultyChangedCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
				self:settext( params.Meter );
				self:diffuse( CourseDifficultyColors[params.Difficulty] );
			end;
		}; --]]

--[[ 		LoadFont("Common","normal") .. {
			OnCommand=cmd(x,SCREEN_CENTER_X-192;y,SCREEN_CENTER_Y-230;horizalign,right;shadowlength,0);
			SetSongCommand=function(self, params) self:settext(params.Modifiers); end;
		}; --]]

	};
};