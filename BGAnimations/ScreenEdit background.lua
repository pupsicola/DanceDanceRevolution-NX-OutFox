local t = Def.ActorFrame {
	LoadActor("_bluebg");
	Def.Quad {
		InitCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_WIDTH/2;y,SCREEN_HEIGHT/2;diffuse,color("0,0,0,1");diffusealpha,0.5)
	};
}

return t;