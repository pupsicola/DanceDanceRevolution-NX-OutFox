local t = Def.ActorFrame{};
local OffsetX = 192;
local SleepOffset = 0;

function StageTopRecord(pn) --回傳最高分的那個紀錄
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

local playMode = GAMESTATE:GetPlayMode()
if playMode ~= 'PlayMode_Regular' and playMode ~= 'PlayMode_Rave' and playMode ~= 'PlayMode_Battle' then
	curStage = playMode;
end;
local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

local t = Def.ActorFrame{}
local song = GAMESTATE:GetCurrentSong();

function isExtraSavior(STitle)
	if STitle == "宇宙(ソラ)への片道切符" or STitle == "Electric Dance System Music" or STitle == "TECH-NOID" or STitle == "Sora e no katamichi kippu" or STitle == "Cytokinesis" or STitle == "S!ck" or STitle == "Illegal Function Call" or STitle == "STERLING SILVER" or STitle == "STERLING SILVER (U1 overground mix)" or STitle == "Far east nightbird" or STitle == "Far east nightbird kors k Remix -DDR edit ver-" or STitle == "Angelic Jelly" or STitle == "Grand Chariot" or STitle == "Sephirot" or STitle == "StrayedCatz" or STitle == "ZEPHYRANTHES" or STitle == "Triple Counter" or STitle == "Renai kansoku" or STitle == "恋愛観測" or STitle == "Koisuru uchuu sensou!!" or STitle == "Koisuru☆uchuu sensou!!" or STitle == "恋する☆宇宙戦争っ!!" or STitle == "朧" or STitle == "打打打打打打打打打打" then
		return true;
	else
		return false;
	end
end;

function isExtraExclusive(STitle)
	if STitle == "New Century" or STitle == "RISING FIRE HAWK" or STitle == "Astrogazer" or STitle == "Come to Life" or STitle == "Emera" or STitle == "Start a New Day" or STitle == "Ishtar" or STitle == "out of focus" or STitle == "Neutrino" or STitle == "Cosy Catastrophe" then
		return true;
	else
		return false;
	end
end;


t[#t+1] = LoadActor("jacket") .. {
			OnCommand=cmd(Center;zoom,2.665;diffusealpha,0;linear,1;diffusealpha,0.25;)
};

--Sound
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","_door/loading"))..{
		InitCommand=cmd(x,1155;y,680;diffusealpha,1;);
		OnCommand=cmd(decelerate,0.25;addx,-50;diffusealpha,0;draworder,7;);
	};
};



t[#t+1] = LoadActor("ScoreDispay")..{
	OnCommand=cmd(diffusealpha,0;zoom,1.1;y,-235;addx,-210;decelerate,1;playcommand,"Set";addx,200;);
			SetCommand=function(self)
				myScoreSet = TopRecord(PLAYER_1);
				local temp = myScoreSet["topDate"];
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:diffusealpha(1);
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

t[#t+1] = LoadActor("cd")..{
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-23;diffusealpha,0;zoom,1.75;decelerate,1;zoom,1.35;diffusealpha,1;);
};

t[#t+1] = Def.ActorFrame {
	LoadActor("eventstage")..{
		OnCommand=cmd(play);
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

return t
