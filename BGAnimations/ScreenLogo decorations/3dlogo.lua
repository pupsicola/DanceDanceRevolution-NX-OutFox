local t = Def.ActorFrame{};

-- t[#t+1] = Def.ActorFrame{
	-- OnCommand=cmd();
		-- Def.ActorFrame{
			-- InitCommand=cmd(fov,0;blend,'BlendMode_Add';x,0;y,-25;z,-100;);
			-- LoadActor( THEME:GetPathB("_shared","models/Flames") )..{
			-- OnCommand=cmd(draworder,-500;rotationz,5;diffusealpha,0.5;zoom,1550;);
			-- };
		-- };
-- };

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd();
		Def.ActorFrame{
			InitCommand=cmd(fov,0;blend,'BlendMode_Add';x,270;y,-15;);
			LoadActor( THEME:GetPathB("_shared","models/NX") )..{
			OnCommand=cmd(draworder,-500;diffusealpha,1;zoom,420;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
			};
		};
};

t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(draworder,500;fov,0;blend,'BlendMode_Add';x,-60;y,60;z,60;);
			LoadActor( THEME:GetPathB("_shared","models/Logo") )..{
			OnCommand=cmd(diffusealpha,1;zoom,500;);
			};
		};
};

t[#t+1] = Def.ActorFrame{
OnCommand=cmd(rotationx,-45;rotationy,30);
		Def.ActorFrame{
			InitCommand=cmd(draworder,500;fov,0;blend,'BlendMode_Add';x,-300;y,20;z,170;spin;effectmagnitude,0.0,0.0,10;);
			LoadActor( THEME:GetPathB("_shared","models/Pad") )..{
			OnCommand=cmd(diffusealpha,1;zoom,120;);
			};
		};
};



return t