local x = Def.ActorFrame{};

x[#x+1] = Def.Actor {
		BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0.1); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};
x[#x+1] = LoadActor("_blue_doors open");

return x;