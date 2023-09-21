local sBannerPath = THEME:GetPathG("Common", "fallback banner");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd();
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(480,480);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(480,480);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:LoadBackground(song:GetJacketPath());
						self:setsize(480,480);
					elseif song:HasBackground() then
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(480,480);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(480,480);
					end;
				else
					self:diffusealpha(1);
			end;
		end;
		end;
	OffCommand=cmd();
	};
};

return t;