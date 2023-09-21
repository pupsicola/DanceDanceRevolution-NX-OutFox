local t = Def.ActorFrame{};

t[#t+1] = LoadActor("_maze") .. {
		OnCommand=cmd(Center;effectperiod,10;spin;effectmagnitude,0,0,2.2)
		};

return t;