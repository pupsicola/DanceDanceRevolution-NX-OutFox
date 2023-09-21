local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame {
  LoadActor(THEME:GetPathS("","Profile_start"))..{
		OnCommand=cmd(play);
	};

};

t[#t+1] = Def.ActorFrame {
  LoadActor(THEME:GetPathS("","Profile_In"))..{
		OnCommand=cmd(play);
	};
};

t[#t+1] = LoadActor( THEME:GetPathS("","Profile_start") )..{
			OffCommand=cmd(play);
		};

t[#t+1] = LoadActor("_normal_door_close");

--Glow
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(CenterX);
	OnCommand=cmd(queuecommand,"Animate");
	AnimateCommand=cmd(diffuseshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0.9;effectperiod,2.5);
	LoadActor(THEME:GetPathB("","_door/glow (doubleres).png"))..{
		InitCommand=cmd(y,SCREEN_TOP+172;zoom,1.5;diffusealpha,0;linear,2.5;diffusealpha,1;);
	};
	LoadActor(THEME:GetPathB("","_door/glow (doubleres).png"))..{
		InitCommand=cmd(y,SCREEN_BOTTOM-172;zoomy,-1;zoom,-1.5;diffusealpha,0;linear,2.5;diffusealpha,1;);
	};
};
return t
