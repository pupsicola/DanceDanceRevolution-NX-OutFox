InitUserPrefs();

local t = Def.ActorFrame {
	OnCommand=function(self)
		if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
			Trace("ThemePrefs doesn't exist; creating file")
			ThemePrefs.ForceSave()
		end

		ThemePrefs.Save()
	end;
};
t[#t+1] = Def.ActorFrame {
InitCommand=cmd();
		LoadActor( "ScreenLogo decorations/3dlogo" )..{
		InitCommand=cmd(wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;rotationx,-10;x,SCREEN_CENTER_X-140;y,SCREEN_CENTER_Y+7;diffusealpha,0;zoom,0.8;draworder,500;addx,-100;decelerate,0.5;diffusealpha,1;addx,100);
		OffCommand=cmd(decelerate,0.25;addx,-100;diffusealpha,0;);
	};
};

-- t[#t+1] = Def.ActorFrame {
		-- LoadActor( "ScreenLogo decorations/3dlogo" )..{
		-- InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+15;y,SCREEN_CENTER_Y-20;diffusealpha,0;zoom,1.1;draworder,500;sleep,0.5;diffusealpha,0.5;decelerate,0.5;diffusealpha,0;zoom,1.4)
	-- }
-- };

t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Version 1.2.1";
		InitCommand=cmd(horizalign,left;diffuse,color("1,1,1,1");shadowlengthy,2;x,18;zoom,0.45;y,661+40);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };

	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y;addx,100;addz,-50;fov,90;rotationy,15;zoom,0.8;decelerate,0.5;diffusealpha,1;addx,-100;addz,50;);
		LoadActor(THEME:GetPathB("","_Arcade decorations/bg"))..{
			OnCommand=cmd(bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
					OffCommand=cmd(decelerate,0.25;addx,100;diffusealpha,0;);
		};
	};

	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_Arcade decorations/yoshi"))..{
			OnCommand=cmd(bob;effectmagnitude,0,1,0;effecttiming,2,0,2,0;zoom,0.6;x,SCREEN_CENTER_X+600;y,SCREEN_BOTTOM+50;sleep,0.5;decelerate,0.25;y,SCREEN_BOTTOM-40;linear,0.1;y,SCREEN_BOTTOM-36;);
					OffCommand=cmd(linear,0.25;diffusealpha,0;);
		};
	};


t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="DDR © Konami";
		InitCommand=cmd(horizalign,right;diffuse,color("1,1,1,1");shadowlengthy,2;y,70;x,1190;zoom,0.45;y,661+20);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };
	 
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Theme by pupsi";
		InitCommand=cmd(horizalign,right;diffuse,color("1,1,1,1");shadowlengthy,2;x,1190;zoom,0.45;y,661+40);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };

t[#t+1] = Def.ActorFrame {
InitCommand=cmd();
	LoadActor( "ScreenWithMenuElements background/rounded" )..{
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
	};
};

t[#t+1] = StandardDecorationFromFileOptional("Clock","Clock")..{
InitCommand=cmd(visible,ThemePrefs.Get("ScreenClock") == "On");
};


return t
