local t = Def.ActorFrame{};


--CaloriesP1--
--BigNumber--
local pn = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,right;settext,"0000";x,SCREEN_CENTER_X-370-30;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#fff200");maxwidth,80);
			StepMessageCommand=function(self)
				local pssp1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);
				local CaloriesBurnedP1 = pssp1:GetCaloriesBurned();
				self:settextf("%04.3f",CaloriesBurnedP1)
			end;
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:y(SCREEN_CENTER_Y+271.5);--self:y(SCREEN_CENTER_Y-306.5);
				else
					self:y(SCREEN_CENTER_Y+271.5);
			end;
		end;
		--CurrentSongChangedMessageCommand=cmd(playcommand,"On");
	};
--kcal--
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,left;settext,"kcal";x,SCREEN_CENTER_X-370-30+10;y,SCREEN_CENTER_Y+271+2;draworder,50;diffuse,color("#fff200");zoom,0.85);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:y(SCREEN_CENTER_Y+271.5);--self:y(SCREEN_CENTER_Y-305);
				else
					self:y(SCREEN_CENTER_Y+271+2);
			end;
		end;
		--CurrentSongChangedMessageCommand=cmd(playcommand,"On");
	};
--CaloriesP2--
--BigNumber--
local pn = GAMESTATE:GetMasterPlayerNumber()
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,right;settext,"0000";x,SCREEN_CENTER_X+370+50;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#fff200");maxwidth,80);
			StepMessageCommand=function(self)
				local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2);
				local CaloriesBurnedP2 = pssp2:GetCaloriesBurned();
				self:settextf("%04.3f",CaloriesBurnedP2)
			end;
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y+271.5);--self:y(SCREEN_CENTER_Y-306.5);
				else
					self:y(SCREEN_CENTER_Y+271.5);
			end;
		end;
	};
--kcal--
t[#t+1] = LoadFont("_Bolster","21px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,left;settext,"kcal";x,SCREEN_CENTER_X+370+10+50;y,SCREEN_CENTER_Y+271+2;draworder,50;diffuse,color("#fff200");zoom,0.85);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y+271.5);--self:y(SCREEN_CENTER_Y-305);
				else
					self:y(SCREEN_CENTER_Y+271+2);
			end;
		end;
	};
return t;