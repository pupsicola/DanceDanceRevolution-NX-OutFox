local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
		Def.ActorFrame {
		
		LoadActor("blackbg") .. {
			OnCommand=cmd(zoom,1.3;Center;)
		};

		LoadActor("jacket") .. {
			InitCommand=cmd();
			OnCommand=cmd(Center;zoom,2.665;diffusealpha,0.5;)
		};
		
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("jacket") .. {
				InitCommand=cmd(Center;zoom,2.665;diffusealpha,0;);
				ShowCommand=cmd(diffusealpha,0.5;decelerate,1;zoom,3;diffusealpha,0);
				HideCommand=cmd(diffusealpha,0;zoom,2.665;);
		};
		};
		
		Def.ActorFrame{
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("_LoadingBar")..{
				InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;texcoordvelocity,0.2,0;Center;zoomx,3;zoomy,500;thump;effectclock,'beat';effectmagnitude,2,1,1;effectoffset,0;);
				ShowCommand=cmd(diffusealpha,0.1);
				HideCommand=cmd(diffusealpha,0);
		};
		};
		};

		Def.ActorFrame{
		Name="Danger";
		Def.ActorFrame{
			Name="Bad";
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Danger" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("_Danger")..{
				InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;texcoordvelocity,0.2,0;Center;zoomx,3;zoomy,500;thump;effectclock,'beat';effectmagnitude,2,1,1;effectoffset,0;);
				ShowCommand=cmd(diffusealpha,0.1);
				HideCommand=cmd(diffusealpha,0);
			};
		}
		},
		
		LoadActor("darkoverlay") .. {
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0.5;y,Center1Player() and SCREEN_CENTER_Y or SCREEN_CENTER_Y-2000;)
		};
		
		LoadActor("dark2") .. {
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0.5;y,Center1Player() and SCREEN_CENTER_Y-2000 or SCREEN_CENTER_Y;)
		};
		
		LoadActor("halftone") .. {
		OnCommand=cmd(diffusealpha,0.25;texcoordvelocity,0,0.05;effectclock,'beat';effectmagnitude,2,1,1;set_use_effect_clock_for_texcoords,true;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;y,Center1Player() and SCREEN_CENTER_Y or SCREEN_CENTER_Y-2000;)
		};
		
		LoadActor("tone") .. {
		OnCommand=cmd(diffusealpha,0.25;texcoordvelocity,0,0.05;effectclock,'beat';effectmagnitude,2,1,1;set_use_effect_clock_for_texcoords,true;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,Center1Player() and SCREEN_CENTER_X-4000 or SCREEN_CENTER_X+70;)
		};
		

		Def.ActorFrame{
		InitCommand=cmd(rotationy,-25;fov,115;y,SCREEN_CENTER_Y;x,Center1Player() and SCREEN_LEFT+100 or SCREEN_LEFT-10000;);
		LoadActor("cylinder")..{
			OnCommand=cmd(zoom,0.45;blend,'BlendMode_Add';diffusealpha,0.1;texcoordvelocity,0,0.05;effectclock,'beat';effectmagnitude,2,1,1;set_use_effect_clock_for_texcoords,true;);
			};
		};
		
		Def.ActorFrame{
		InitCommand=cmd(rotationy,Center1Player() and 25 or 15;fov,115;y,SCREEN_CENTER_Y;x,Center1Player() and SCREEN_RIGHT-100 or SCREEN_RIGHT-850;);
		LoadActor("cylinder")..{
			OnCommand=cmd(zoom,Center1Player() and 0.45 or 0.57;blend,'BlendMode_Add';diffusealpha,0.1;texcoordvelocity,0,0.05;effectclock,'beat';effectmagnitude,2,1,1;set_use_effect_clock_for_texcoords,true;);
			};
		};
		
		LoadActor("spiral") .. {
		InitCommand=cmd(x,Center1Player() and SCREEN_CENTER_X or SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y;diffusealpha,0.05;zoom,1.2;rotationx,-45;blend,'BlendMode_Add';effectperiod,10;spin;effectmagnitude,0,0,5)
		};
		
		Def.ActorFrame{
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("particlenormal") .. {
			InitCommand=cmd(diffusealpha,0;);
			ShowCommand=cmd(diffusealpha,0.25;);
			HideCommand=cmd(diffusealpha,0;);
		};
		};
		};
		
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			InitCommand=cmd(diffusealpha,0.1;fov,100;blend,'BlendMode_Add';x,Center1Player() and SCREEN_CENTER_X or SCREEN_CENTER_X+225;y,SCREEN_CENTER_Y-50;rotationx,-35;spin;effectmagnitude,0,0,2;effectclock,'beat';);
			LoadActor("note")..{
			OnCommand=cmd();
			ShowCommand=cmd(linear,1;diffusealpha,3;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.8;effectclock,'beat';);
			HideCommand=cmd(linear,1;diffusealpha,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,1;effectclock,'beat';);
			};
		};

		LoadActor("flash") .. {
			OnCommand=cmd(diffusealpha,0.45;blend,'BlendMode_Add';zoom,1.3;Center;heartbeat;effectclock,'beat';effectmagnitude,2.0,1.01,1.0;)
		};
		
					LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};

	};
};


return t;