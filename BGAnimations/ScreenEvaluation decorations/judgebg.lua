local t = Def.ActorFrame {};


t[#t+1] = LoadActor("judgment");

if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowFastSlow") then
		t[#t+1] = LoadActor("timingbg");
	end
end

return t;