local t = Def.ActorFrame {};
-- Holy fcuk yes it's finally working (inefficient as it may be)
local function RivalScore(pn,rival)
local t=Def.ActorFrame {
InitCommand=cmd(addy,-30+3);
	-- LoadFont("_squareslab711 lt bt Bold 24px")..{
		-- InitCommand=cmd(zoom,0.9;shadowlength,2;x,SCREEN_CENTER_X-245-135;y,SCREEN_CENTER_Y+80+4-22;horizalign,left;diffuse,color("White");strokecolor,color("#000000"));
		-- BeginCommand=cmd(playcommand,"Set");
		-- SetCommand=function(self)
			-- local SongOrCourse, StepsOrTrail;
			-- if GAMESTATE:IsCourseMode() then
				-- SongOrCourse = GAMESTATE:GetCurrentCourse();
				-- StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
			-- else
				-- SongOrCourse = GAMESTATE:GetCurrentSong();
				-- StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
			-- end;

			-- local profile, scorelist;
			-- local text = "";
			-- if SongOrCourse and StepsOrTrail then
				-- local st = StepsOrTrail:GetStepsType();
				-- local diff = StepsOrTrail:GetDifficulty();
				-- local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				-- if PROFILEMAN:IsPersistentProfile(pn) then-- player profile
					
					-- profile = PROFILEMAN:GetProfile(pn);
					-- name = profile:GetDisplayName();
				-- else-- machine profile
					
					-- profile = PROFILEMAN:GetMachineProfile();
					-- name = "STEP";
				-- end;

				-- scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
				-- assert(scorelist)
				-- local scores = scorelist:GetHighScores();
				-- local topscore=0;
				-- if scores[rival] then
					-- topscore = scores[rival]:GetScore();
				-- end;
				-- assert(topscore);
				-- if topscore ~= 0  then
					-- self:settext(scores[rival]:GetName());
				-- else
					-- text = "- - - - - - -";
				-- end;
			-- else
				-- text = "- - - - - - -";
			-- end;
			-- self:settext(text);
		-- end;
		-- CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		-- CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		-- CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
		-- CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	-- };
	Def.RollingNumbers {
		InitCommand=cmd(zoom,1.0;shadowlength,0;x,SCREEN_CENTER_X-245+200;y,SCREEN_CENTER_Y+68-10;horizalign,right;diffuse,color("White"));
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
	Def.Quad{
	InitCommand=cmd(zoom,0.34;shadowlength,2;x,SCREEN_CENTER_X-245+22-50;y,SCREEN_CENTER_Y+80;horizalign,center;draworder,1);
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
					local topscore=0;
					if scores[rival] then
						topscore = scores[rival]:GetScore();
					end;
					assert(topscore);
					local topgrade;
					if scores[rival] then
						topgrade = scores[rival]:GetGrade();
						assert(topgrade);
						if scores[rival]:GetScore()>1  then
							if scores[rival]:GetScore()==1000000 and topgrade=="Grade_Tier07" then
								self:LoadBackground(THEME:GetPathG("myMusicWheel","Tier01"));
								self:diffusealpha(0);
							else
								self:LoadBackground(THEME:GetPathG("myMusicWheel",ToEnumShortString(topgrade)));
								self:diffusealpha(0);
							end;	
						else
							self:diffusealpha(0);
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
	LoadActor(THEME:GetPathG("Player","Badge FullCombo"))..{
	InitCommand=cmd(zoom,1;shadowlength,2;x,SCREEN_CENTER_X-245+22+22-50;y,SCREEN_CENTER_Y+80+8;horizalign,center;draworder,2);
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
								self:glowshift();
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

t[#t+1] = LoadActor("ScoreFrame")..{
	InitCommand=cmd(player,PLAYER_1;vertalign,top;x,SCREEN_CENTER_X-245;y,SCREEN_CENTER_Y+10;zoom,1);
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,1)..{
	InitCommand=cmd();
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,2)..{
	InitCommand=cmd(addy,38);
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,3)..{
	InitCommand=cmd(addy,38+38);
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,4)..{
	InitCommand=cmd(addy,38+38+38);
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,5)..{
	InitCommand=cmd(addy,38+38+38+38);
	OffCommand=cmd();
	};
t[#t+1] = RivalScore(PLAYER_1,6)..{
	InitCommand=cmd(addy,38+38+38+38+38);
	OffCommand=cmd();
	};


return t;