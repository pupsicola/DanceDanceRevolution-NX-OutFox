local t = Def.ActorFrame {};

t[#t+1] = LoadActor("bar") .. {
	InitCommand=cmd();
	OnCommand=cmd(zoom,1.2;diffusealpha,0;linear,0.2;diffusealpha,1;y,-3);
	OffCommand=cmd(linear,0.2;diffusealpha,0);
};

return t