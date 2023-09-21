local t = Def.ActorFrame {};
local offsetx = -404;


t[#t+1] = LoadActor("DetailFrame")..{
			InitCommand=cmd(shadowlengthy,2;zoom,0.65;x,SCREEN_CENTER_X+offsetx-40;y,SCREEN_CENTER_Y+213);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				
				myScoreSet = TopRecord(PLAYER_1);
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:diffusealpha(1);
					else
						self:diffusealpha(0.5);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

--FC Ring
t[#t+1] = Def.ActorFrame {
InitCommand=cmd(addy,-110);
	LoadActor(THEME:GetPathG("Player","Spin FullCombo"))..{
	InitCommand=cmd(player,PLAYER_1;zoom,0.5;shadowlengthy,2;x,SCREEN_CENTER_X+28+5+offsetx;y,SCREEN_CENTER_Y+80+187;horizalign,center;draworder,2);
	OffCommand=cmd(bouncebegin,0.15;zoom,0);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_1);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
					--player profile
					profile = PROFILEMAN:GetProfile(PLAYER_1);
				else
					--machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local temp=#scores;
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					if scores[1] then
						-- self:addx(-31);
						-- self:addy(13.5);
						for i=1,temp do 
							if scores[i] then
								topscore = scores[i];
								assert(topscore);
								local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
												+topscore:GetTapNoteScore("TapNoteScore_HitMine")+topscore:GetHoldNoteScore("HoldNoteScore_LetGo")
								local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
								local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
								local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
								local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
								local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
								local hasUsedLittle = string.find(topscore:GetModifiers(),"Little")
								if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 and (not hasUsedLittle) and topscore:GetGrade()~="Grade_Failed"  then
										if (goods+greats+perfects) == 0 then
												self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
												self:glowblink();
												self:effectperiod(0.20);
												self:zoom(0.3);
												break;
										elseif goods+greats == 0 then
												self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
												--self:glowshift();
												self:zoom(0.3);
												break;
										elseif (misses+boos+goods) == 0 then
												self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W3"],0.75));
												self:stopeffect();
												self:zoom(0.3);
												if i==1 then
													self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W3"],1));
												end;
												break;
										elseif (misses+boos) == 0 then
												self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W4"],0.75));
												self:stopeffect();
												self:zoom(0.3);
												if i==1 then
													self:diffuse(BoostColor(GameColor.Judgment["JudgmentLine_W4"],1));
												end;
												break;
										end;
										self:diffusealpha(0.8);
								else
										self:diffusealpha(0);
								end;
							else
								self:diffusealpha(0);
								break;
							end;
						end;
					else
							self:diffusealpha(0);
					end;
			else
				self:diffusealpha(0);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	
	
	
};

--grades
t[#t+1] = Def.ActorFrame {
InitCommand=cmd(addy,-110);
	Def.Quad{
	InitCommand=cmd(player,PLAYER_1;zoom,0.6;bob;effectmagnitude,0,0.5,0;effecttiming,1,0,1,0;shadowlengthy,2;x,SCREEN_CENTER_X+offsetx+5;y,SCREEN_CENTER_Y+100+167.5;horizalign,center;draworder,2);
	OffCommand=cmd(bouncebegin,0.15;zoom,0);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_1);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
			end;

			local profile, scorelist;
			local text = "";
			if SongOrCourse and StepsOrTrail then
				local st = StepsOrTrail:GetStepsType();
				local diff = StepsOrTrail:GetDifficulty();
				local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
					-- player profile
					profile = PROFILEMAN:GetProfile(PLAYER_1);
				else
					-- machine profile
					profile = PROFILEMAN:GetMachineProfile();
				end;

				scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				assert(scorelist);
					local scores = scorelist:GetHighScores();
					assert(scores);
					local topscore=0;
					if scores[1] then
						topscore = scores[1]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					local temp=#scores;
						if scores[1] then
							for i=1,temp do 
								topgrade = scores[1]:GetGrade();
								curgrade = scores[i]:GetGrade();
								assert(topgrade);
								if scores[1]:GetScore()>1  then
									if scores[1]:GetScore()==1000000 and scores[1]:GetGrade() =="Grade_Tier07" then --AutoPlayHack
										self:LoadBackground(THEME:GetPathG("myMusicWheel","Tier01"));
										self:diffusealpha(1);
										break;
									else --Normal
										if ToEnumShortString(curgrade) ~= "Failed" then --current Rank is not Failed
											self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(curgrade)));
											self:diffusealpha(1);
											break;
										else --current Rank is Failed
											if i == temp then
												self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(curgrade)));
												self:diffusealpha(1);
												break;
											end;
										end;
									end;
								else
									self:diffusealpha(0);
								end;
							end;
						else
							self:diffusealpha(0);
						end;
			else
				self:diffusealpha(0);
			end;
			
			
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	
};


function TopRecord(pn) --回傳最高分的那個紀錄
	local SongOrCourse, StepsOrTrail;
	local myScoreSet = {
		["HasScore"] = 0;
		["SongOrCourse"] =0;
		["topscore"] = 0;
		["topW1"]=0;
		["topW2"]=0;
		["topW3"]=0;
		["topW4"]=0;
		["topW5"]=0;
		["topMiss"]=0;
		["topOK"]=0;
		["topEXScore"]=0;
		["topMAXCombo"]=0;
		["topDate"]=0;
		};
		
	if GAMESTATE:IsCourseMode() then
		SongOrCourse = GAMESTATE:GetCurrentCourse();
		StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
	else
		SongOrCourse = GAMESTATE:GetCurrentSong();
		StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
	end;

	local profile, scorelist;
	
	if SongOrCourse and StepsOrTrail then
		local st = StepsOrTrail:GetStepsType();
		local diff = StepsOrTrail:GetDifficulty();
		local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

		if PROFILEMAN:IsPersistentProfile(pn) then
			-- player profile
			profile = PROFILEMAN:GetProfile(pn);
		else
			-- machine profile
			profile = PROFILEMAN:GetMachineProfile();
		end;

		scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
		assert(scorelist);
		local scores = scorelist:GetHighScores();
		assert(scores);
		-- local topscore=0;
		-- local topW1=0;
		-- local topW2=0;
		-- local topW3=0;
		-- local topW4=0;
		-- local topW5=0;
		-- local topMiss=0;
		-- local topOK=0;
		-- local topEXScore=0;
		-- local topMAXCombo=0;
		if scores[1] then
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 1;
			myScoreSet["topscore"] = scores[1]:GetScore();
			myScoreSet["topW1"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1");
			myScoreSet["topW2"]  = scores[1]:GetTapNoteScore("TapNoteScore_W2");
			myScoreSet["topW3"]  = scores[1]:GetTapNoteScore("TapNoteScore_W3");
			myScoreSet["topW4"]  = scores[1]:GetTapNoteScore("TapNoteScore_W4");
			myScoreSet["topW5"]  = scores[1]:GetTapNoteScore("TapNoteScore_W5");
			myScoreSet["topMiss"]  = scores[1]:GetTapNoteScore("TapNoteScore_W5")+scores[1]:GetTapNoteScore("TapNoteScore_Miss");
			myScoreSet["topOK"]  = scores[1]:GetHoldNoteScore("HoldNoteScore_Held");
			--myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
			if (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" ) >=0) then --If it is not a random course
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"] = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"] = (StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_TapsAndHolds" )*3+StepsOrTrail:GetRadarValues( pn ):GetValue( "RadarCategory_Holds" )*3)*scores[1]:GetPercentDP();
				end
			else --If it is Random Course then the scores[1]:GetPercentDP() value will be -1
				if scores[1]:GetGrade() ~= "Grade_Failed" then
					myScoreSet["topEXScore"]  = scores[1]:GetTapNoteScore("TapNoteScore_W1")*3+scores[1]:GetTapNoteScore("TapNoteScore_W2")*2+scores[1]:GetTapNoteScore("TapNoteScore_W3")+scores[1]:GetHoldNoteScore("HoldNoteScore_Held")*3;
				else
					myScoreSet["topEXScore"]  = 0;
				end
			end
			myScoreSet["topMAXCombo"]  = scores[1]:GetMaxCombo();
			myScoreSet["topDate"]  = scores[1]:GetDate() ;
		else
			myScoreSet["SongOrCourse"]=1;
			myScoreSet["HasScore"] = 0;
		end;
	else
		myScoreSet["HasScore"] = 0;
		myScoreSet["SongOrCourse"]=0;
		
	end
	return myScoreSet;

end;

t[#t+1] = LoadFont("_helvetica-condensed-light 24px")..{
			InitCommand=cmd(shadowlengthy,2;zoom,0.48;maxwidth,215;cropright,0.5;x,SCREEN_CENTER_X+15+offsetx;y,SCREEN_CENTER_Y+175;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				local temp = myScoreSet["topDate"];
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:settext( temp);
						self:diffusealpha(0.5);
					else
						self:diffusealpha(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- Topscore
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.8;x,SCREEN_CENTER_X-29+offsetx;y,SCREEN_CENTER_Y+158;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersCourseData");
				else
					self:Load("RollingNumbersSongData");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topscore"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
					else
						self:diffusealpha(0);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topW1
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+199;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topW1"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topW2
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+219;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topW2"];
						
						self:diffusealpha(1);
						
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topW3
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+239;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topW3"];
						
						self:diffusealpha(1);
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topW4
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+259;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topW4"];
						
						self:diffusealpha(1);
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topOK
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+279;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topOK"];
						
						self:diffusealpha(1);
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};

t[#t+1] = Def.RollingNumbers { -- topMiss
			File = THEME:GetPathF("_avantgarde-book","40px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.7;x,SCREEN_CENTER_X+offsetx+50;y,SCREEN_CENTER_Y+299;horizalign,right;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:Load("RollingNumbersJudgment");
				else
					self:Load("RollingNumbersJudgment");
				end
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
					
						local topscore = myScoreSet["topMiss"];
						
						self:diffusealpha(1);
						self:targetnumber(topscore);
					else
						self:diffusealpha(0.5);
						self:targetnumber(0);
					end
				else
					self:diffusealpha(0.5);
				end
			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentCourseChangedMessageCommand=cmd(queuecommand,"Set");
};


return t;