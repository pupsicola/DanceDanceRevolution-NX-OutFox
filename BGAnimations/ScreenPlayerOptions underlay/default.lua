return Def.ActorFrame {
	
	LoadActor( "Back" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-240-50;y,SCREEN_CENTER_Y+10;zoom,1);
		OnCommand=cmd(addx,-400;linear,0.25;addx,400);
		OffCommand=cmd(linear,0.25;addx,-500);
	};
	
	LoadActor( "OptionsLabels" )..{
		InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);x,SCREEN_CENTER_X-310-100+166-134+30-50-10;y,SCREEN_CENTER_Y-18;draworder,1;zoom,0.5;);
		OnCommand=cmd(addx,-400;linear,0.125;addx,400);
		OffCommand=cmd(linear,0.25;addx,-500);
	};

		LoadActor( THEME:GetPathS("common", "start") ).. {
		OnCommand=cmd(play);
	};
	LoadActor( "../_swoosh_out" ).. {
		OffCommand=cmd(play);
	}
}