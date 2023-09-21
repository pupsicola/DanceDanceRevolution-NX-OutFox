local t = Def.ActorFrame {};
	t[#t+1] =  Def.ActorFrame {
		OnCommand=cmd(sleep,1);
		LoadActor("../_evalOut")..{
			OffCommand=cmd(play);
		};
}


t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/saving"))..{
	InitCommand=cmd(x,1105;y,680;diffusealpha,0;addx,50;decelerate,0.25;diffusealpha,1;addx,-50;draworder,7;);
	};
};


return t;