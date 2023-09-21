local t = Def.ActorFrame{};


--Logo

t[#t+1] = Def.ActorFrame {
		LoadActor("blackbg") .. {
			OnCommand=cmd(zoom,1.3;Center;diffusealpha,1;decelerate,1;diffusealpha,0;draworder,1;)
		};
	LoadActor( "3dlogo" )..{
		InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+15;y,SCREEN_CENTER_Y-0;diffusealpha,0;zoom,1.4;draworder,500;accelerate,0.5;diffusealpha,1;zoom,1.1)
	}
};

t[#t+1] = Def.ActorFrame {
		LoadActor( "3dlogo" )..{
		InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+15;y,SCREEN_CENTER_Y-0;diffusealpha,0;zoom,1.1;draworder,500;sleep,0.5;diffusealpha,0.5;decelerate,0.5;diffusealpha,0;zoom,1.4)
	}
};


return t