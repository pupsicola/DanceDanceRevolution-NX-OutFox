local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_sf rounded pro 28px") .. {
		Text=gc:GetText();
		InitCommand=cmd(y,101.5;shadowlengthy,2;zoom,0.75);
		OnCommand=cmd();
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;diffuseshift;effectcolor2,color("1,1,1,1");effectcolor1,color("1,1,1,0.75"));
		LoseFocusCommand=cmd(stopeffect;diffusealpha,0.5);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	};

};
