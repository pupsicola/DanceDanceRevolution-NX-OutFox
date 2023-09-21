local t = Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_swoosh normal") ) .. {
		StartTransitioningCommand=cmd(play);
	};
	---- DOOR OPEN > CLOSE  CLOSE > OPEN
	--LoadActor(THEME:GetPathB("","_doors open.lua"));
	
	LoadActor("Score.mp3")..{
		StartTransitioningCommand=cmd(stop;sleep,0.5;play);
	};

};

if (STATSMAN:GetCurStageStats():AllFailed()) then
	t[#t+1]=LoadActor(THEME:GetPathB("","_fail_doors open.lua"));
else
	t[#t+1]=LoadActor(THEME:GetPathB("","_cleared_doors open.lua"));
end



return t;
