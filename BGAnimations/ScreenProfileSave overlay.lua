local x = Def.ActorFrame{};

x[#x+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/saving"))..{
	InitCommand=cmd(x,1105;y,680;diffusealpha,1;sleep,0.5;decelerate,0.25;diffusealpha,0;addx,-50;draworder,7;);
	};
};


x[#x+1] = StandardDecorationFromFileOptional("Clock","Clock");


x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0.5); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;