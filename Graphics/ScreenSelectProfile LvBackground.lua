local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("ScreenSelectProfile LvBack02") .. {
		InitCommand=cmd(blend,Blend.Add;shadowlength,0;zoom,0;spin;effectmagnitude,0,0,180);
		OnCommand=cmd(zoom,1;rotationz,180;linear,0.5;rotationz,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};	
	
	
	LoadActor("ScreenSelectProfile LvBack01") .. {
		InitCommand=cmd(shadowlength,0;zoom,0);
		OnCommand=cmd(zoom,1;);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};

};


return t;