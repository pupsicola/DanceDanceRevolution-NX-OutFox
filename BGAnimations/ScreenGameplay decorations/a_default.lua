local t = LoadFallbackB()



local customscore=GetCustomScoreMode();
 local cscore="SuperNOVA2";
 if not GAMESTATE:IsCourseMode() then
 local stepcnt={0,0}
 t[#t+1] = Def.Actor{
     JudgmentMessageCommand = function(self, params)
		if STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player):GetFailed() == false then
         if params.TapNoteScore and
          params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
          params.TapNoteScore ~= 'TapNoteScore_HitMine' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
          params.TapNoteScore ~= 'TapNoteScore_None'
         then
             if customscore=="old" then
                 Scoring[scoreType](params, 
                     STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
             elseif customscore=="5b2" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             elseif customscore=="5b1" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b1(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             else
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5a2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             end;
         end
		 end
     end;
     InitCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Init();
         end;
     end;
     OffCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Out();
         end;
     end;
 };
 end;
 

t[#t+1] = LoadActor("OptionsHack.lua")..{
	InitCommand=cmd(draworder,1);
};



if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowFastSlow") then
		t[#t+1] = LoadActor("TimingJudgements.lua")..{
			InitCommand=cmd(draworder,1);
		};
	end
end


--options--
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,2;zoomy,2;x,WideScale(SCREEN_CENTER_X-221,SCREEN_CENTER_X-296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-265);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
		-- CurrentSongChangedMessageCommand=function(self)
			-- if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				-- self:y(SCREEN_CENTER_Y-276);
			-- else
				-- self:y(SCREEN_CENTER_Y+252);
			-- end;
		-- end;
	};
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
		InitCommand=cmd(player,PLAYER_2;zoomx,2;zoomy,2;x,WideScale(SCREEN_CENTER_X+221,SCREEN_CENTER_X+296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:y(SCREEN_CENTER_Y-265);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
		--CurrentSongChangedMessageCommand=cmd(playcommand,"On");
	};
	
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(draworder,1);
	StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
	StandardDecorationFromFileOptional("ScoreFrameP2","ScoreFrameP2");
	StandardDecorationFromFileOptional("SongFrame","SongFrame");
	StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
	StandardDecorationFromFileOptional("StageFrame","StageFrame");
	StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
	StandardDecorationFromFileOptional("SongTitle","SongTitle");
};
	
-- t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
-- t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP2","ScoreFrameP2");
-- t[#t+1] = StandardDecorationFromFileOptional("SongFrame","SongFrame");
-- t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
-- t[#t+1] = StandardDecorationFromFileOptional("StageFrame","StageFrame");
-- t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
-- t[#t+1] = StandardDecorationFromFileOptional("SongTitle","SongTitle");
	
	
--songinfo--
t[#t+1] = LoadFont("_arial black 28px")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-58-11;zoom,0.9;draworder,50;strokecolor,color("#000000"));
	OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.25;diffusealpha,1);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
			local text = song:GetDisplayFullTitle();
				self:diffusealpha(1);
				self:maxwidth(480);
				self:settext(text);
			end;
		end;
	end;
};
--artist--
t[#t+1] = LoadFont("_arial black 28px")..{
	InitCommand=cmd(horizalign,center;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-58+14;zoom,0.7;draworder,50;strokecolor,color("#000000"));
	OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.25;diffusealpha,1);
	OffCommand=cmd(sleep,2;linear,0.15;diffusealpha,0);
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
		local text = song:GetDisplayArtist();
			self:diffusealpha(1);
			self:maxwidth(460);
			self:settext(text);
		end;
		end;
	end;
};





local showCal = true;

if ReadPrefFromFile("UserPrefGameplayShowCalories") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowCalories") then
		showCal = true;
	else
		showCal = false;
	end
end
--MeterP1
if GAMESTATE:IsPlayerEnabled(PLAYER_1) and showCal == false then
--BG--
	t[#t+1] = LoadActor("diffmain")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_LEFT+198;y,SCREEN_CENTER_Y+295;zoom,0;draworder,50;);
		OnCommand=function(self)
			local diffP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
			local sDifficulty = ToEnumShortString( diffP1 );
			self:diffuse(CustomDifficultyToColor( sDifficulty ));
			self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local diffP1 = GAMESTATE:GetCurrentTrail(PLAYER_1):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetDifficulty();
				local sDifficulty = ToEnumShortString( diffP1 );
				self:diffuse(CustomDifficultyToColor( sDifficulty ));
				self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
			end;
		end;
	};
	t[#t+1] = LoadActor("diffmask")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_LEFT+198;y,SCREEN_CENTER_Y+295;zoom,1.5;draworder,50;);
		OnCommand=function(self)
			self:diffuse(color("0,0,0,1"));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				self:diffuse(color("0,0,0,1"));
			end;
		end;
	};

--LEVEL--
--t[#t+1] = LoadFont("_helvetica-condensed-light 24px")..{
--			InitCommand=cmd(player,PLAYER_1;horizalign,right;settext,"LEVEL";x,SCREEN_CENTER_X-370-30;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#ffffff");maxwidth,80;zoomy,0.4;zoomx,1.3);
--			OnCommand=function(self)
--				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
--					self:y(SCREEN_CENTER_Y+278.5);--self:y(SCREEN_CENTER_Y-306.5);
--				else
--					self:y(SCREEN_CENTER_Y+278.5);
--			end;
--		end;
--	};

--PLAYER1 DisplayName--
--t[#t+1] = LoadFont("_atrox 44px")..{
t[#t+1] = LoadFont("_commador extended 32px")..{

			InitCommand=function(self)

				local dispnameP1 = PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
				local dispnamelengthP1 = string.len(dispnameP1);

				self:player(PLAYER_1);
				self:horizalign(center);
				self:settext(string.upper(dispnameP1));


				self:x(SCREEN_CENTER_X-370-30+24);self:y(SCREEN_CENTER_Y+277.0);
				self:draworder(50);
				self:diffuse(color("#feec0a"));
				self:zoomy(0.6);

				if dispnamelengthP1 >= 8 then
					--expand
					self:maxwidth(80);
					self:zoomx(1.69);
				else
					--constant width
					self:zoomx(1.02);
				end;

			end;

			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:addx(-14);
					self:y(SCREEN_CENTER_Y-291.0);
				end;
			end;
	};

--2019 05 13 this wont work

--calculate (stepstype + meter) width P1--
local cs_sDiffWidthP1 = 0;
local cs_sMeterWidthP1 = 0;
local cs_diffP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
local cs_sDifficulty = ToEnumShortString(cs_diffP1);
local cs_meterP1 = tonumber(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());

--kokodewanai
if cs_meterP1 <= 0 then
	cs_sMeterWidthP1 = 18;
elseif cs_meterP1 <= 9 then
	cs_sMeterWidthP1 = 18 ;
elseif cs_meterP1 <= 99 then
	cs_sMeterWidthP1 = 0;
else
	cs_sMeterWidthP1 = -18;
end;


--kokodewanai
if cs_sDifficulty == 'Beginner' then
	cs_sDiffWidthP1 = 85;
elseif cs_sDifficulty == 'Easy' then
	cs_sDiffWidthP1 = 52;
elseif cs_sDifficulty == 'Medium' then
	cs_sDiffWidthP1 = 84;
elseif cs_sDifficulty == 'Hard' then
	cs_sDiffWidthP1 = 62;
elseif cs_sDifficulty == 'Challenge' then
	cs_sDiffWidthP1 = 86;
else
	cs_sDiffWidthP1 = 40;
end;

--kokodewanai
local totalWidthP1 = cs_sDiffWidthP1+cs_sMeterWidthP1;
local additionXPosP1 = totalWidthP1/2-42;


--2019 05 13 to this




t[#t+1] = LoadFont("_commador extended 32px")..{

	InitCommand=function(self)
		self:settext("Xronier");
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
		self:zoomy(0.53);
		self:zoomx(0.69);
		self:diffusecolor(1,1,1,1);
	end;

	OnCommand=function(self)
		self:y(SCREEN_CENTER_Y);
	end;

};


--number--
t[#t+1] = LoadFont("_squareslab711 lt bt Bold 24px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,left;x,SCREEN_CENTER_X-370-30+10;y,SCREEN_CENTER_Y+270;draworder,50;diffuse,color("#ffffff");strokecolor,color("#000000");zoomy,0.90;zoomx,1.2);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
					self:y(SCREEN_CENTER_Y+270+7);
				else
					self:y(SCREEN_CENTER_Y+270+7);
				end;
				local meterP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
				self:settext(meterP1);
			end;
			CurrentSongChangedMessageCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					local meterP1 = GAMESTATE:GetCurrentTrail(PLAYER_1):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetMeter();
					self:settext(meterP1);
				end;
			end;
};
end;


--MeterP2
if GAMESTATE:IsPlayerEnabled(PLAYER_2) and showCal == false then
--BG--
	t[#t+1] = LoadActor("diffmain")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_RIGHT-198;y,SCREEN_CENTER_Y+295;rotationy,180;zoom,1.5;draworder,50;);
		OnCommand=function(self)
			local diffP2 = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
			local sDifficulty = ToEnumShortString( diffP2 );
			self:diffuse(CustomDifficultyToColor( sDifficulty ));
			self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local diffP2 = GAMESTATE:GetCurrentTrail(PLAYER_2):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetDifficulty();
				local sDifficulty = ToEnumShortString( diffP2 );
				self:diffuse(CustomDifficultyToColor( sDifficulty ));
				self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
			end;
		end;
	};
	t[#t+1] = LoadActor("diffmask")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_RIGHT-198;y,SCREEN_CENTER_Y+295;rotationy,180;zoom,1.5;draworder,50;);
		OnCommand=function(self)
			self:diffuse(color("0,0,0,0.8"));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				self:diffuse(color("0,0,0,0.8"));
			end;
		end;
	};
--LEVEL--
t[#t+1] = LoadFont("_helvetica-condensed-light 24px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,right;settext,"LEVEL";x,SCREEN_CENTER_X+370+50;y,SCREEN_CENTER_Y+271.5;draworder,50;diffuse,color("#ffffff");maxwidth,80;zoomy,0.4;zoomx,1.3);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y+278.5);--self:y(SCREEN_CENTER_Y-306.5);
				else
					self:y(SCREEN_CENTER_Y+278.5);
			end;
		end;
	};
--number--
t[#t+1] = LoadFont("_squareslab711 lt bt Bold 24px")..{
			InitCommand=cmd(player,PLAYER_2;horizalign,left;x,SCREEN_CENTER_X+370+10+50;y,SCREEN_CENTER_Y+271+2;draworder,50;diffuse,color("#ffffff");strokecolor,color("#000000");zoomy,0.90;zoomx,1.2);
			OnCommand=function(self)
				if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
					self:y(SCREEN_CENTER_Y+270+7);--self:y(SCREEN_CENTER_Y-305);
				else
					self:y(SCREEN_CENTER_Y+270+7);
				end;
				local meterP2 = GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter();
				self:settext(meterP2);
			end;
			CurrentSongChangedMessageCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					local meterP2 = GAMESTATE:GetCurrentTrail(PLAYER_2):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetMeter();
					self:settext(meterP2);
				end;
			end;
};
end;

if showCal then
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
end;


return t