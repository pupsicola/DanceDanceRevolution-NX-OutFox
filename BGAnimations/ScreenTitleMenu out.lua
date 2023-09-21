local t = Def.ActorFrame{};
	
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/loading"))..{
	InitCommand=cmd(x,1155;y,680;addx,50;diffusealpha,0;);
	OffCommand=cmd(sleep,0.25;decelerate,0.25;addx,-50;diffusealpha,1;draworder,7;);
	};
};


return t
