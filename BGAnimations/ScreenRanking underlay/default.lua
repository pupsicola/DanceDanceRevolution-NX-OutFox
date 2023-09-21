return Def.ActorFrame{

	LoadActor("giantpane")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.619;diffusealpha,0;addy,-1000;);
	OnCommand=cmd(decelerate,1.1;diffusealpha,1;addy,1000;);
	};

	LoadActor("line")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-85;diffusealpha,0;zoomtowidth,0;);
		OnCommand=cmd(sleep,.1;decelerate,1;zoomx,1.03;diffusealpha,1);
	};
	
	LoadActor("line")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+77;diffusealpha,0;zoomtowidth,0;);
		OnCommand=cmd(sleep,0.1;decelerate,1;zoomx,1.03;diffusealpha,1);
	};
	
	LoadActor("mask")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM+5;zoomto,SCREEN_WIDTH,91;zwrite,true;blend,'BlendMode_NoEffect';vertalign,bottom;);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;zoomto,SCREEN_WIDTH,78;zwrite,true;blend,'BlendMode_NoEffect';);
	};

	Def.ActorFrame{
		LoadActor("header")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+50;addy,-50;diffusealpha,0;zoom,0.6;decelerate,1;addy,50;diffusealpha,1;);
		};
	};
};