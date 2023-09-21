--[[return Def.ActorFrame {
	LoadActor( "../ready" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X+3;y,SCREEN_CENTER_Y+1;glow,color("1,1,1,0");zoomy,0;zoomx,1.34;sleep,0.0000;accelerate,0.133;zoomy,0.807;zoomx,1;decelerate,0.066;zoomy,1.192;glow,color("1,1,1,0.5");sleep,0.016;accelerate,0.033;glow,color("1,1,1,0");zoomy,1);
		OnCommand=cmd(sleep,0.907;diffusealpha,0);
	};
}]]--

local t = Def.ActorFrame{}


t[#t+1] = Def.ActorFrame {
			
	LoadActor( THEME:GetPathB("_shared","models/Ready") )..{
		OnCommand=cmd(rotationx,90;zoom,800;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10;addx,-500;diffusealpha,1;decelerate,0.5;addx,450;rotationx,10;diffusealpha,1;linear,1;addx,100;rotationx,-10;accelerate,0.25;addx,850;rotationx,-105;diffusealpha,1;linear,0;diffusealpha,0;);
	};

};

return t
