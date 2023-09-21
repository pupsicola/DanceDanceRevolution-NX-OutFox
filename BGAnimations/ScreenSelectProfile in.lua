local t = Def.ActorFrame{

	LoadActor(THEME:GetPathB("","_door/loading"))..{
	InitCommand=cmd(x,1155;y,680;diffusealpha,1;);
	OnCommand=cmd(decelerate,0.25;addx,-50;diffusealpha,0;draworder,7;);
	};

};


return t;
