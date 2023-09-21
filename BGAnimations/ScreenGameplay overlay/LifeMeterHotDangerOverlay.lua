local t = Def.ActorFrame{};

if  GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" then
	--Player 1 Hot


	--Player 2 Hot
	t[#t+1] = Def.Quad{
		InitCommand=cmd(player,"PlayerNumber_P2";zoomto,(SCREEN_WIDTH/2.83),28;diffuseshift;effectcolor1,color("0,0,0,0.3");effectcolor2,color("0,0,0,0");effectperiod,0.05;x,SCREEN_CENTER_X + 370;y,37;visible,false;);
		HealthStateChangedMessageCommand=function(self, param)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'battery') == false then --battery hot has been defined in Live Meter Battery folder.
				if  param.PlayerNumber =='PlayerNumber_P2' then
					if param.HealthState == "HealthState_Hot" then
						self:visible(true);
					else
						self:visible(false);
					end;
				end;
			end;
		end;
	};
end;

--Player 1 Danger
t[#t+1] = LoadActor("danger 2x1")..{
		InitCommand=cmd(player,"PlayerNumber_P1";x,SCREEN_CENTER_X - 190;y,37;visible,false;zoom,1.5);
		HealthStateChangedMessageCommand=function(self, param)
			
			if  param.PlayerNumber =='PlayerNumber_P1' then
				if param.HealthState == "HealthState_Danger" then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
};
--Player 2 Danger
t[#t+1] = LoadActor("danger 2x1")..{
		InitCommand=cmd(player,"PlayerNumber_P2";x,SCREEN_CENTER_X + 190;y,37;visible,false;zoomx,1.5;zoomy,1.5);
		HealthStateChangedMessageCommand=function(self, param)
			
			if  param.PlayerNumber =='PlayerNumber_P2' then
				if param.HealthState == "HealthState_Danger" then
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		end;
};

return t;