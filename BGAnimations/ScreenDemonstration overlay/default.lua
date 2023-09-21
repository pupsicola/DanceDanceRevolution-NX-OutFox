local t = Def.ActorFrame {};


t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X-4 or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")-4;y,SCREEN_TOP+55;);
	Def.Quad {
		InitCommand=cmd(zoomto,426,10;diffusealpha,1;diffuse,color("0,0,0,1"););
	};
};

t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X-4 or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")-4;y,SCREEN_TOP+50;draworder,2;);

		Def.SongMeterDisplay{
			InitCommand=cmd(SetStreamWidth,421;zoomy,1.3;y,2;);
			Stream=LoadActor("meter stream");
			Tip=LoadActor("tip")..{
				OnCommand=cmd(zoom,0;sleep,1.8;zoom,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,.5");effectclock,"beat";effectperiod,4;);
			};
		};
	};


};

		t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X-4 or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")-4;y,SCREEN_TOP+25;);
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("bubbles")..{
			InitCommand=cmd(diffusealpha,0;zoom,0.53;cropbottom,0.28;croptop,0.4;blend,'BlendMode_Add';texcoordvelocity,0,0.5;);
			ShowCommand=cmd(diffusealpha,1;);
			HideCommand=cmd(diffusealpha,0;);
		};
		};
		};



t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "NX");
		LoadActor("frame")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);
};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Minus");
		LoadActor("goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Gold");
		LoadActor("a3goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Gold");
		LoadActor("a20goldframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Blue");
		LoadActor("a20blueframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Blue");
		LoadActor("a3frame")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Cyberia Style");
		LoadActor("cyberiaframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};

t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Supernova");
		LoadActor("supernovaframe")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_TOP+25;zoom,1;);

};
};


for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo", pn) .. {
	};
end;

t[#t+1] = LoadActor("OniGameOverDisplay");



t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,661+18;zoom,0.35);
			LoadActor("bg")..{
			};
		};
};

t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Press Start";
		InitCommand=cmd(horizalign,center;shadowlengthy,2;x,SCREEN_CENTER_X;zoom,0.6;y,661+20;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.05,1.0;);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };
	 

	 
return t