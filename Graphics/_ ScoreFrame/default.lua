local t = Def.ActorFrame{};

--P1 ScoreFrame
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "NX");
		LoadActor("normal")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Minus");
		LoadActor("gold")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Gold");
		LoadActor("a3gold")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Blue");
		LoadActor("a20blue")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
		t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A20 Gold");
		LoadActor("a20gold")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "A3 Blue");
		LoadActor("a3blue")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
	t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Cyberia Style");
		LoadActor("cyberia")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
		t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(visible,ThemePrefs.Get("FrameStyle") == "Supernova");
		LoadActor("supernova")..{
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX");y,SCREEN_CENTER_Y+292;zoom,0.75;);
	}
	};
	
	


--Meter BG in ScreenGamplay decorations
end

--GetCourseSongIndex()

--P2 ScoreFrame
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	t[#t+1] = LoadActor("normal")..{
		InitCommand=cmd(x,SCREEN_RIGHT-198;y,SCREEN_CENTER_Y+295;rotationy,180;zoom,1.5;);
	}


end

return t