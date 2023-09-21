return Def.ActorFrame {
					LoadActor( "../CourseModeBG" )..{
				InitCommand=cmd();
				OnCommand=function(self)
					if GAMESTATE:IsCourseMode() then	
						(cmd(visible,1))(self);
					else
						(cmd(visible,0))(self);
					end;
				end;
			};

	LoadActor("Full")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(diffusealpha,1;linear,0.25;diffusealpha,0);
	};
	LoadActor( "Explanation" )..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-100-80);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(diffusealpha,1;linear,0.25;diffusealpha,0);
	};
}