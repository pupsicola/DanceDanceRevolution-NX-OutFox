local t = Def.ActorFrame{};

--JacketBG
t[#t+1] = LoadActor("tinyframe")..{
	InitCommand=cmd(y,-150+150;zoom,1.2;);
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd();
};

--Jacket
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,-125+150;x,-130;draworder,1;diffusealpha,1;zoom,0.25;diffusealpha,1);
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

--Song Information
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px") .. {
	OffCommand=cmd(diffusealpha,0;);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		-- if vSong then
			sText = vSong:GetDisplayFullTitle()
		-- end
		-- if vCourse then
		-- 	sText = vSong:GetDisplayFullTitle()
		-- end
		self:zoom(0.8);
		self:settext( sText );
		self:horizalign(left);
		self:playcommand( "On" );
		self:maxwidth(310);
		self:y(-135+150);
		self:x(-80);
		self:draworder(1);
	end;
}

--Artist Information
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px") .. {
	OnCommand=cmd(diffusealpha,0.5);
		OffCommand=cmd(diffusealpha,0;);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		-- if vSong then
			sText = vSong:GetDisplayArtist()
		-- end
		-- if vCourse then
		-- 	sText = vSong:GetDisplayArtist()
		-- end
		self:zoom(0.6);
		self:settext( sText );
		self:horizalign(left);
		self:playcommand( "On" );
		self:maxwidth(350);
		self:y(-105+150);
		self:x(-80);
		self:draworder(1);
	end;
}



	
return t