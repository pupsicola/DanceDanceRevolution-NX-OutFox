local t = LoadFallbackB();

t[#t+1]= LoadActor("helpbar" ) .. {
InitCommand=cmd(Center;zoom,0.667;draworder,-5;diffusealpha,0;linear,0.25;diffusealpha,1;);
OffCommand=cmd(linear,0.25;diffusealpha,0;);
};


t[#t+1] = Def.BitmapText {
		Font = "Common Normal",
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-620;y,SCREEN_CENTER_Y+343;zoom,0.545;shadowlengthy,2;diffusealpha,1;),
		OnCommand=function(self)
			self:settext("&START; Confirm   &BACK; Exit   &SELECT; Song Options   &LEFT; or &RIGHT; Change Selection   &UP;&UP; or &DOWN;&DOWN; Change Difficulty   &LEFT; + &RIGHT; Change Sort")
			end;	
		OffCommand=cmd(zoom,0;);
		};

-- t[#t+1] = Def.ActorFrame {
		-- LoadActor("fade") .. {
		-- OnCommand=cmd(draworder,-500;diffusealpha,1;zoom,2;x,SCREEN_CENTER_X+325;y,SCREEN_CENTER_Y);
		-- OffCommand=cmd(linear,0.25;diffusealpha,0;);
		-- };
-- };

t[#t+1]=LoadActor("flash") .. {
			OnCommand=cmd(diffusealpha,0.25;blend,'BlendMode_Add';zoom,1.3;Center;heartbeat;effectclock,'beat';effectmagnitude,2,1.01,1.0;effectoffset,0.5;)
		};

t[#t+1]= LoadActor("pane" ) .. {
InitCommand=cmd(zoom,1.1;addy,-45;draworder,-5;wag;effectmagnitude,-1,-1,-0.5;effecttiming,7,0,7,0;addx,-400;fov,90;rotationy,-5;diffusealpha,0;addz,100;);
OnCommand=cmd(decelerate,0.8;addx,400;diffusealpha,1;addz,-100;bob;effectmagnitude,0,4,0;effecttiming,4,0,4,0;);
OffCommand=cmd(decelerate,0.5;addx,-400;diffusealpha,0;addz,100;);
};



t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/loading"))..{
	InitCommand=cmd(x,1155;y,680;addx,50;diffusealpha,0;);
	OffCommand=cmd(sleep,0.25;decelerate,0.25;addx,-50;diffusealpha,1;draworder,7;);
	};
};

t[#t+1] = Def.ActorFrame {
		LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;draworder,500)
		};
};

t[#t+1] = StandardDecorationFromFileOptional("Clock","Clock")..{
InitCommand=cmd(visible,ThemePrefs.Get("ScreenClock") == "On");
};

return t;
