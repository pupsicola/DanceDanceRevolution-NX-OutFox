local song = GAMESTATE:GetCurrentSong();
local t = Def.ActorFrame{};
local dt = 0;
--nt = 3.604 --fct = 4.872

if not GAMESTATE:IsDemonstration() then



	t[#t+1] = Def.ActorFrame {


--Sound
LoadActor("../_failed") .. {
	OnCommand=cmd(sleep,dt;queuecommand,"Play");
	PlayCommand=cmd(play);
};



		

		Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("1,0,0,0");blend,Blend.Multiply);
		OnCommand=cmd(smooth,1;diffuse,color("0.75,0,0,0.75");decelerate,2;diffuse,color("0,0,0,1"));
		};
		Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("1,1,1,1");diffusealpha,0);
		OnCommand=cmd(finishtweening;diffusealpha,1;decelerate,1.25;diffuse,color("1,0,0,0"));
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
		OnCommand=cmd(diffusealpha,0.1;blend,'BlendMode_Add';texcoordvelocity,-0.01,0;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
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
			LoadActor( "failed" )..{
				OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1;sleep,dt;sleep,0.116;linear,0.217;diffusealpha,1;draworder,500;);
			};

		}
	else
		t[#t+1] = Def.ActorFrame {
			--Left
			LoadActor( "failed" )..{
				OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1;sleep,dt;sleep,0.116;linear,0.217;diffusealpha,1;draworder,500;);
			};

		}
	end

end

return t;