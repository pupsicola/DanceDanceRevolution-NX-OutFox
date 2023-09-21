local t = Def.ActorFrame{};

--Logo
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","ScreenWithMenuElements background/bg"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH*1,SCREEN_HEIGHT*1);
	};
};

return t
