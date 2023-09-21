local t = Def.ActorFrame{};

--Hacky way to get the transition.
t[#t+1] = Def.ActorFrame {
	LoadActor("../_myblank_nothing");
};

t[#t+1] = LoadActor("../_swoosh_out")..{
  OnCommand=cmd(queuecommand,"Play");
  PlayCommand=cmd(play);
};

return t