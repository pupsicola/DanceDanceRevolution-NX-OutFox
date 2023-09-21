local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing

local t = Def.ActorFrame {

	LoadActor("MusicWheelItem SectionCollapsed NormalPart") .. {
	InitCommand=cmd(glowshift;);
};
--banner

Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,60,60;x,-235;);
		SetMessageCommand=function(self,params)
					group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				
					self:LoadFromSongGroup(group);
				
			else
				
				-- call fallback
				self:Load( THEME:GetPathG("","_No banner") );
			end;

		end;
	};

};

return t;