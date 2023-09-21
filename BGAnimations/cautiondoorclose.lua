local t = Def.ActorFrame{};

--Hacky way to get the transition.
t[#t+1] = Def.ActorFrame {
	LoadActor("__swooshDDRA") .. {
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};



t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/caution"))..{
	InitCommand=cmd(draworder,7;x,SCREEN_CENTER_X-0;y,SCREEN_CENTER_Y-0;zoom,1.25;diffusealpha,0;bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
	OnCommand=cmd(sleep,0.15;decelerate,1;zoom,1;diffusealpha,1;sleep,1.65;decelerate,0.5;zoom,0.75;diffusealpha,0;);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/music"))..{
	InitCommand=cmd(x,1093;addx,50;y,680;diffusealpha,0;);
	OffCommand=cmd(sleep,2.5;decelerate,0.25;addx,-50;diffusealpha,1;draworder,7;);
	};
};

return t
