local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center);
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,1;diffuse,color("1,1,1,1"));
	};
};
t[#t+1] = Def.ActorFrame {
  InitCommand=cmd();
	Def.ActorFrame {
	
			LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};
		LoadActor("konami") .. {
			OnCommand=cmd(zoom,0.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
		};
		LoadActor("ScreenCompany music.ogg") .. {
			OnCommand=cmd(play);
		};
		LoadActor("pupsi") .. {
			OnCommand=cmd(zoom,0.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,3;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
		};
		LoadActor("notice") .. {
			OnCommand=cmd(zoom,0.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;);
		};
		
	};
};

return t


	



