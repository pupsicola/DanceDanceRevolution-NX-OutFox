local t = Def.ActorFrame{};

--Hacky way to get the transition.
t[#t+1] = Def.ActorFrame {
	LoadActor("__swooshDDRA") .. {
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	
	
};



t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/bottom"))..{
	InitCommand=cmd(FullScreen;Center;diffusealpha,1;);
	OnCommand=cmd(linear,0.3;addy,500;);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/top"))..{
	InitCommand=cmd(FullScreen;Center;diffusealpha,1;draworder,5;);
	OnCommand=cmd(linear,0.3;addy,-500;);
	};
};
	
t[#t+1] = LoadActor( "ScreenGameplay out/cleared" )..{
	InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
	OnCommand=cmd(linear,0.1;zoomy,0);
};


return t
