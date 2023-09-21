local t = Def.ActorFrame {};

if GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2() then
	t[#t+1] = Def.ActorFrame {
	LoadActor("../_normalOff_door_close.lua");
};
end;


return t;