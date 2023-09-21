local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame {
	LoadActor( "color" )..{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_WeightedMultiply');
	};
	LoadActor( "thanks" )..{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_NoEffect';zwrite,true;clearzbuffer,false;sleep,0.334;linear,2.933;zoom,0.791;);
	};
	LoadActor( "konami" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-217;blend,'BlendMode_NoEffect';zwrite,true;clearzbuffer,false;);
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffusecolor,color("#FFFFFF");ztest,true);
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffusecolor,color("#FFFFFF");diffusealpha,0;sleep,3.5;linear,0.233;diffusealpha,1;);
	};
};


t[#t+1] = Def.ActorFrame {
	SOUND:PlayAnnouncer("game over")
};

return t;