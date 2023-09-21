local song = GAMESTATE:GetCurrentSong();
local t = Def.ActorFrame{};
local dt = 1.235;
--nt = 3.604 --fct = 4.872

if not GAMESTATE:IsDemonstration() then



	t[#t+1] = Def.ActorFrame {


--Sound
LoadActor("../_failed") .. {
	OnCommand=cmd(sleep,dt;queuecommand,"Play");
	PlayCommand=cmd(play);
};

	-- Cleared song --
    LoadActor("../ClearedSwoosh") .. {
		StartTransitioningCommand=cmd(play);
	};

--Sound
LoadActor("../__swooshDDRA") .. {
	OnCommand=cmd(sleep,dt;queuecommand,"Play");
	PlayCommand=cmd(play);
};


		--Black BG
		Def.Quad{
			OnCommand=cmd(Center;FullScreen;diffusecolor,Color.White;draworder,1;diffusealpha,0;sleep,dt;diffusealpha,1;sleep,0.164;linear,0.6;diffusealpha,0;);
		};
		Def.Quad{
			OnCommand=cmd(Center;FullScreen;diffusecolor,Color.Black;diffusealpha,0;sleep,dt;sleep,0.434;linear,0.033;diffusealpha,1;);
		};
		Def.Quad{
			OnCommand=cmd(Center;FullScreen;diffusecolor,color("#000000");diffusealpha,0;sleep,dt;sleep,0.434;linear,0.033;diffusealpha,1;linear,0.5;diffusealpha,0.1);
		};
		Def.Quad{
			OnCommand=cmd(blend,Blend.Add;Center;FullScreen;diffusecolor,Color.Black;diffusealpha,0;sleep,dt;sleep,0.434;linear,0.033;diffusealpha,1;linear,0.3;diffusealpha,0);
		};
		



	}
	


t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/bottom"))..{
	InitCommand=cmd(FullScreen;Center;diffusealpha,0;addy,200;);
	OnCommand=cmd(sleep,dt;diffusealpha,1;linear,0.15;addy,-200;);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/top"))..{
	InitCommand=cmd(FullScreen;Center;diffusealpha,0;addy,-200;draworder,5;);
	OnCommand=cmd(sleep,dt;diffusealpha,1;linear,0.15;addy,200;);
	};
};

t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_door/halftone"))..{
		OnCommand=cmd(blend,'BlendMode_Add';texcoordvelocity,-0.01,0;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0;sleep,dt;linear,0.2;diffusealpha,0.1;)
		};
};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("","_door/flash"))..{
	InitCommand=cmd(FullScreen;Center;diffusealpha,0;draworder,6;);
	OnCommand=cmd(sleep,dt;diffusealpha,1;blend,Blend.Add;zoom,20;zoomx,30;zoomy,10;linear,0.2;zoomy,1;linear,0.1;zoomy,0.05;linear,0.5;diffusealpha,0);
	};
};


	if not GAMESTATE:IsCourseMode() and song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
		-- t[#t+1] = Def.ActorFrame {
			
			-- LoadActor( "tohoku" )..{--Left
				-- OnCommand=cmd(zoom,1.5;x,SCREEN_LEFT-556;y,SCREEN_CENTER_Y;sleep,dt;sleep,0.116;linear,0.217;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
			-- };
			
			-- LoadActor( "tohoku" )..{--Right
				-- OnCommand=cmd(zoom,1.5;x,SCREEN_RIGHT+556;y,SCREEN_CENTER_Y;sleep,dt;sleep,0.116;linear,0.217;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
			-- };
			
			-- LoadActor( "tohoku" )..{--Glow
				-- OnCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,dt;sleep,0.283;diffusealpha,0.5;zoom,1.7;linear,0.017;diffusealpha,1;linear,0.133;diffusealpha,0;zoom,2.25);
			-- };
		-- }
		t[#t+1] = Def.ActorFrame {
			--Left
			LoadActor( "cleared" )..{
				OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1.5;sleep,dt;sleep,0.116;linear,0.217;diffusealpha,1;);
			};


		}
	else
		t[#t+1] = Def.ActorFrame {
			--Left
			LoadActor( "cleared" )..{
				OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1;sleep,dt;sleep,0.116;linear,0.217;diffusealpha,1;);
			};

		}
	end

end

return t;