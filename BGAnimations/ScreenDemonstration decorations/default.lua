local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenLogo", "decorations/3dlogo"))..{
		InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+505;y,SCREEN_CENTER_Y+315;zoom,0.3;draworder,500;)
	}
};

--JacketBG
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "On";bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
	LoadActor("cd")..{
	InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X+410 or SCREEN_CENTER_X+240;fov,40;rotationy,25;y,SCREEN_CENTER_Y;zoom,Center1Player() and 0.75 or 1.1;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;);
	OnCommand=cmd(diffusealpha,1);
};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "Off");
	LoadActor("smallmusic")..{
	InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X+375 or SCREEN_CENTER_X;fov,Center1Player() and 40 or 0;rotationy,Center1Player() and 25 or 0;y,Center1Player() and SCREEN_CENTER_Y-10 or SCREEN_CENTER_Y-330;zoom,Center1Player() and 0.75 or 0.5;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;);
	OnCommand=cmd(diffusealpha,1);
};
};

t[#t+1] = LoadActor("title")..{
	OnCommand=cmd(diffusealpha,0.5;x,SCREEN_RIGHT-140;y,SCREEN_TOP+34;draworder,1;zoom,0.7;diffuseblink;);
	OffCommand=cmd();
}

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(draworder,1);
	StandardDecorationFromFileOptional("StageFrame","StageFrame");
	StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
	StandardDecorationFromFileOptional("SongTitle","SongTitle");
};


return t