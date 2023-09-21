local t = Def.ActorFrame {};

local lang = "en";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;
-- Holy fcuk yes it's finally working (inefficient as it may be)
local function RivalScore(pn,rival)
local t=Def.ActorFrame {
	Def.RollingNumbers {
		File = THEME:GetPathF("_sf rounded pro","17px");
		InitCommand=function(self)
			self:zoom(1);
			self:shadowlength(1);
			self:x(SCREEN_LEFT+175+72);
			--self:y(SCREEN_CENTER_Y-160-43-6.5-30+38-9+2);
			self:y(SCREEN_CENTER_Y-160-43-6.5-30+38-9);
			self:horizalign(right);
			self:diffuse(Color("White"));
			if (rival ~= 1) then
				self:diffuse(Color("White"));
			end;
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local topscore=0;
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
				assert(scorelist)
				local scores = scorelist:GetHighScores();
				
				if scores[rival] then
					topscore = scores[rival]:GetScore();
				end;
				assert(topscore);
				
			end;
			self:Load("RollingNumbersSongData");
			self:targetnumber(topscore);
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
		LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
	InitCommand=cmd(zoom,1;shadowlength,2;x,SCREEN_LEFT+175+22+22;y,SCREEN_CENTER_Y-160-43-6.5-30+45;horizalign,center;draworder,1);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local SongOrCourse, StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				SongOrCourse = GAMESTATE:GetCurrentCourse();
				StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			else
				SongOrCourse = GAMESTATE:GetCurrentSong();
				StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			end;

			local profile, scorelist;
			local text = "";
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
					local topscore;
					if scores[rival] then
						topscore = scores[rival];
						assert(topscore);
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
												+topscore:GetTapNoteScore("TapNoteScore_HitMine")+topscore:GetHoldNoteScore("HoldNoteScore_LetGo")
						local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
						local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
						local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
						local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
						local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
						local hasUsedLittle = string.find(topscore:GetModifiers(),"Little")
						if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 and (not hasUsedLittle) and topscore:GetGrade()~="Grade_Failed" then
							if (goods+greats+perfects) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
								self:glowblink();
								self:effectperiod(0.20);
								self:zoom(0.35);
							elseif goods+greats == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
								--self:glowshift();
								self:zoom(0.35);
							elseif (misses+boos+goods) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
								self:stopeffect();
								self:zoom(0.35);
							elseif (misses+boos) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
								self:stopeffect();
								self:zoom(0.35);
							end;
							self:diffusealpha(0);
						else
							self:diffusealpha(0);
						end;
					else
						self:diffusealpha(0);
					end;
			else
				self:diffusealpha(0);
			end;
			self:spin();
			self:effectmagnitude(0,0,360);
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	};
	



	};
	return t;
end

t[#t+1] = LoadActor(lang.."_ScoreFrame")..{
	InitCommand=cmd(player,PLAYER_1;vertalign,top;x,SCREEN_LEFT+137;y,SCREEN_CENTER_Y-235;zoom,1);
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

t[#t+1] = RivalScore(PLAYER_1,1)..{
	InitCommand=cmd(addy,4);
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
t[#t+1] = RivalScore(PLAYER_1,2)..{
	InitCommand=cmd(addy,31+4);
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
t[#t+1] = RivalScore(PLAYER_1,3)..{
	InitCommand=cmd(addy,31.5*2+3);
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
t[#t+1] = RivalScore(PLAYER_1,4)..{
	InitCommand=cmd(addy,31.5*3+2);
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
t[#t+1] = RivalScore(PLAYER_1,5)..{
	InitCommand=cmd(addy,31.5*4+3);
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
t[#t+1] = RivalScore(PLAYER_1,6)..{
	InitCommand=cmd(addy,31.5*5+3);
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

return t;