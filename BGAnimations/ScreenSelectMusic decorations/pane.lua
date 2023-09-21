local t = LoadFallbackB();


t[#t+1]= LoadActor("../_music_out" ) .. {
	OffCommand=function(self)
		(cmd(play))(self);
	end;
};





-- Legacy StepMania 4 Function
--???
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState( player );
	end

	local t = Def.StepsDisplay {
		InitCommand=cmd(Load,"StepsDisplay",GAMESTATE:GetPlayerState(pn););
	};

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		t.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		t.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return t;
end											  


--default difficulty stuff
local function GetDifListY(d)
	local r=0;
	if d == "Difficulty_Beginner" then
		r=(31.5*0);
	elseif d == "Difficulty_Easy" then
		r=(31.5*1);
	elseif d == "Difficulty_Medium" then
		r=(31.5*2);
	elseif d == "Difficulty_Hard" then
		r=(31.5*3);
	elseif d == "Difficulty_Challenge" then
		r=(31.5*4);
	elseif d == "Difficulty_Edit" then
		r=(31.5*5);
	end;
	return r;
end;

local function GetDifListX(self,pn,offset,fade)
	if pn==PLAYER_1 then
		--self:horizalign(left);
		self:x(SCREEN_CENTER_X+150-offset+125);
		if fade>0 then
			self:faderight(fade);
		end;
	else
		--self:horizalign(right);
		self:x(SCREEN_CENTER_X+150+offset+150);
		if fade>0 then
			self:fadeleft(fade);
		end;
	end;
	return r;
end;

--diff list x and y

--每個難度的分數列表
local function DrawDifList(pn,diff)
	local t=Def.ActorFrame {
		InitCommand=cmd(player,pn;y,SCREEN_CENTER_Y-115;x,-75;zoom,1.0);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
		song=GAMESTATE:GetCurrentSong();
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
--難度別最高分數資訊
		Def.RollingNumbers {
			File = THEME:GetPathF("_sf rounded pro", "20px");
			InitCommand=cmd(shadowlengthy,2;zoom,0.65;strokecolor,Color("Outline"));
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0;);
			SetCommand=function(self)
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				local song=GAMESTATE:GetCurrentSong();
				local course = GAMESTATE:GetCurrentCourse();

				if song then
					GetDifListX(self,pn,270,0);
					--self:y(GetFlexDifListY(diff, st, song));
					self:y(GetDifListY(diff)+2);
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = song:GetOneSteps( st, diff );
						if PROFILEMAN:IsPersistentProfile(pn) then
							-- player profile
							profile = PROFILEMAN:GetProfile(pn);
						else
							-- machine profile
							profile = PROFILEMAN:GetMachineProfile();
						end;
						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						assert(scores);
						local topscore=0;
						if scores[1] then
							topscore = scores[1]:GetScore();
						end;
						assert(topscore);
						--topscore=10;
						-- self:diffuse(CustomDifficultyToLightColor(diff));
						-- self:strokecolor(CustomDifficultyToDarkColor(diff));
						self:diffuse(color("1,1,1,1"));
						self:strokecolor(color("0.2,0.2,0.2,1"));
						self:diffusealpha(1);
						-- if pn==PLAYER_1 then
							-- self:settextf("%09d   %s",topscore,THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
						-- else
							-- self:settextf("%s   %09d",THEME:GetString("CustomDifficulty",ToEnumShortString(diff)),topscore);
						-- end;
						if pn==PLAYER_1 and topscore ~= 0  then
							self:Load("RollingNumbersSongData");
							self:targetnumber(topscore);
						elseif pn==PLAYER_2 and topscore ~= 0  then
							self:Load("RollingNumbersSongData");
							self:targetnumber(topscore);
						else 
							self:settextf("");
						end;
						
						
					else
						self:settext("");
					end;
				else
					self:settext("");			
				end;
			end;
			
			
		};
		
    Def.ActorFrame{
      InitCommand=function(s) s:x(90) end,
      LoadActor(THEME:GetPathG("StageIn","Spin FullCombo"))..{
        InitCommand=function(s) s:shadowlength(1):zoom(0):draworder(5):x(24):diffusealpha(0.8) end,
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
        SetCommand=function(self)
          local st=GAMESTATE:GetCurrentStyle():GetStepsType();
          local song=GAMESTATE:GetCurrentSong();
          local course = GAMESTATE:GetCurrentCourse();
          if song then
		  	GetDifListX(self,pn,285,0);
			self:y(GetDifListY(diff)+0.5);
            if song:HasStepsTypeAndDifficulty(st,diff) then
              local steps = song:GetOneSteps( st, diff );
              if PROFILEMAN:IsPersistentProfile(pn) then
                profile = PROFILEMAN:GetProfile(pn);
              else
                profile = PROFILEMAN:GetMachineProfile();
              end;
              scorelist = profile:GetHighScoreList(song,steps);
              assert(scorelist);
              local scores = scorelist:GetHighScores();
              assert(scores);
              local topscore;
              if scores[1] then
                topscore = scores[1];
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

							elseif goods+greats == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
								--self:glowshift();

							elseif (misses+boos+goods) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
								self:stopeffect();

							elseif (misses+boos) == 0 then
								self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
								self:stopeffect();

                  end;
                  self:visible(true)
                  self:zoom(0.15);
                else
                  self:visible(false)
                end;
              else
                self:visible(false)
              end;
            else
              self:visible(false)
            end;
          else
            self:visible(false)
          end;
        end
      };
	  };
---Grade
	
			Def.Quad{
			InitCommand=cmd(shadowlengthy,2;zoom,0.30;cropright,0.01;);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0;);
			SetCommand=function(self)
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				
				local song=nil;
				song=GAMESTATE:GetCurrentSong();
				
				if song then
					GetDifListX(self,pn,208,0);
					--self:y(GetFlexDifListY(diff, st, song));
					self:y(GetDifListY(diff)+1);
					if song:HasStepsTypeAndDifficulty(st,diff) then
						local steps = song:GetOneSteps( st, diff );
						if PROFILEMAN:IsPersistentProfile(pn) then
							-- player profile
							profile = PROFILEMAN:GetProfile(pn);
						else
							-- machine profile
							profile = PROFILEMAN:GetMachineProfile();
						end;
						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						assert(scores);
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
				else
					self:diffusealpha(0);
				end;
			end;
			
		};

		
	};
	return t;
end;

	
--player selection

local function DrawDifListPlayershadowp1(pn,diff)
	local t = Def.ActorFrame {
		InitCommand=cmd(player,pn;x,SCREEN_CENTER_X-10-5;y,SCREEN_TOP+245;diffuseramp;effectcolor2,Color.White;effectcolor1,color("1,1,1,0.5");effectclock,'beatnooffset');
		LoadActor("p1_shadow") .. {
			InitCommand=cmd(zoom,1);
			OnCommand=cmd(diffusealpha,0;linear,0.05;diffusealpha,1);
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(linear,0.25;diffusealpha,0;);
			SetCommand=function(self)
				if GAMESTATE:IsHumanPlayer(PLAYER_1) then
				local st=GAMESTATE:GetCurrentStyle():GetStepsType();
				local song=GAMESTATE:GetCurrentSong();
				if song then
					if song:HasStepsTypeAndDifficulty(st,diff) and diff==GAMESTATE:GetCurrentSteps(pn):GetDifficulty() then
						self:diffusealpha(1);
						self:y(GetDifListY(diff));
					else
						self:stopeffect();
						self:diffusealpha(0);
				end
				else
						self:stopeffect();
						self:diffusealpha(0);
				end;
				end

			end;
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
		};
		
		
	}
	return t;
end;

local function DrawDifListPlayershadowp1f(pn,diff)
	local t = Def.ActorFrame {
		InitCommand=cmd(player,pn;y,SCREEN_CENTER_y+400;);
		Def.ActorFrame {

			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
			--CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		};
			
	}
	return t;
end;

if not GAMESTATE:IsCourseMode() then

t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(zoom,5.06;x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y-75;diffusealpha,0;linear,0.25;diffusealpha,0.5;);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	Def.Banner {
		OnCommand=cmd();
		SetCommand=function(self)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:zoomtowidth(130);
						self:zoomtoheight(130);	
						self:croptop(0.274);
						self:cropbottom(0.271);
						self:faderight(0.5);
						self:fadeleft(0.5);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromCached("background",song:GetBackgroundPath())
						self:zoomtowidth(130);
						self:zoomtoheight(130);	
						self:croptop(0.274);
						self:cropbottom(0.271);
						self:faderight(0.5);
						self:fadeleft(0.5)
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(130);
						self:zoomtoheight(130);
						self:croptop(0.274);
						self:cropbottom(0.271);
						self:faderight(0.5);
						self:fadeleft(0.5)
					end;
				elseif SCREENMAN:GetTopScreen():GetNextScreenName()=="ScreenStageInformation" 
				and SCREENMAN:GetTopScreen():GetPrevScreenName()~="ScreenSelectMusic" then
						local selgrp =SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedSection();
						if not GAMESTATE:GetCurrentSong() then
							myLoadGroupJacket(selgrp, self);
							self:zoomtowidth(130);
							self:zoomtoheight(130);	
							self:croptop(0.274);
						self:cropbottom(0.271);
							self:faderight(0.5);
							self:fadeleft(0.5)
							self:stoptweening();
						else
							self:Load(THEME:GetPathG("","Common fallback jacket"));
							self:zoomtowidth(130);
							self:zoomtoheight(130);	
							self:croptop(0.274);
						self:cropbottom(0.271);
							self:faderight(0.5);
							self:fadeleft(0.5)
							self:stoptweening();							
						end;
				else
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(130);
						self:zoomtoheight(130);		
						self:croptop(0.274);
						self:cropbottom(0.271);
						self:faderight(0.5);
						self:fadeleft(0.5)						
				end;
		else
			local course = GAMESTATE:GetCurrentCourse();
			if course then
				self:x(SCREEN_CENTER_X+0);
				self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
						self:zoomtowidth(304);
						self:zoomtoheight(304);				
			end;
		end;
		self:stoptweening();
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
};

t[#t+1]=LoadActor("songtitlebg")..{
	
	OnCommand=cmd(draworder,-500;x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y;zoom,0.667;diffusealpha,0;linear,0.25;diffusealpha,1;x,SCREEN_CENTER_X;);
	};

t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(blend,'BlendMode_Add';x,SCREEN_CENTER_X-400;y,SCREEN_CENTER_Y-255;);
			LoadActor( THEME:GetPathB("_shared","models/SelectMusic") )..{
			OnCommand=cmd(diffusealpha,1;zoom,70;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
			OffCommand=cmd(linear,0.25;diffusealpha,0;);
			};
		};
};

t[#t+1] = Def.BitmapText {
		Font = "Common Normal",
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y-141;zoom,0.5;shadowlengthy,2;diffusealpha,0.5;),
		OnCommand=function(self)
			self:settext("Song Length:            BPM:")
			end;	
			BeginCommand=cmd(playcommand,"Set");
			OffCommand=cmd(decelerate,0.25;diffusealpha,0;);
			SetCommand=function(self)
				self:diffuse(color("1,1,1,1"));
				self:strokecolor(color("0.1,0.1,0.3,1"));
				myScoreSet = TopRecord(PLAYER_1);
				local temp = myScoreSet["topDate"];
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:diffusealpha(0.5);
					else
						self:diffusealpha(0.5);
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
		
t[#t+1] = StandardDecorationFromFileOptional("ShockArrowDisplayP1","ShockArrowDisplayP1") .. {
	InitCommand = cmd(x,SCREEN_CENTER_X-122+1000;draworder,5;y,SCREEN_CENTER_Y-171;zoom,0.6;);
	OffCommand = cmd(linear,0.25;diffusealpha,0;);
};

t[#t+1] = StandardDecorationFromFileOptional("SongTime","SongTime") .. {
	InitCommand = cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y-141;zoom,0.5;);
	OffCommand = cmd(diffusealpha,0;);
	SetCommand=function(self)
		local curSelection = nil;
		local length = 0.0;
		if GAMESTATE:IsCourseMode() then
			curSelection = GAMESTATE:GetCurrentCourse();
			self:playcommand("Reset");
			if curSelection then
				local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber());
				if trail then
					length = TrailUtil.GetTotalSeconds(trail);
				else
					length = 0.0;
				end;
			else
				length = 0.0;
			end;
		else
			curSelection = GAMESTATE:GetCurrentSong();
			self:playcommand("Reset");
			if curSelection then
				length = curSelection:MusicLengthSeconds();
				if curSelection:IsLong() then
					self:playcommand("Long");
				elseif curSelection:IsMarathon() then
					self:playcommand("Marathon");
				else
					self:playcommand("Reset");
				end
			else
				length = 0.0;
				self:playcommand("Reset");
			end;
							myScoreSet = TopRecord(PLAYER_1);
				local temp = myScoreSet["topDate"];
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:settext( temp);
						self:diffusealpha(1);
					else
						self:diffusealpha(1);
					end
				else
					self:diffusealpha(0);
					end;
		end;
		self:settext( SecondsToMSS(length) );
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	
};


t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")..{
	InitCommand = cmd(x,SCREEN_CENTER_X-170;y,SCREEN_CENTER_Y-141;zoom,0.5;);
	OffCommand = cmd(diffusealpha,0;);
	SetCommand=function(self)
								myScoreSet = TopRecord(PLAYER_1);
				local temp = myScoreSet["topDate"];
				if (myScoreSet["SongOrCourse"]==1) then
					if (myScoreSet["HasScore"]==1) then
						self:diffusealpha(1);
					else
						self:diffusealpha(1);
					end
				else
					self:diffusealpha(0);
					end;
			end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
};



t[#t+1] = Def.ActorFrame { --song jacket
 	InitCommand=cmd(zoom,2;x,SCREEN_CENTER_X-470;y,SCREEN_CENTER_Y-73;diffusealpha,1;draworder,1;diffusealpha,0;linear,0.5;diffusealpha,1;);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	Def.Banner {
		OnCommand=cmd(ztest,false;);
		SetCommand=function(self)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:zoomtowidth(130);
						self:zoomtoheight(130);					
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromCached("background",song:GetBackgroundPath())
						self:zoomtowidth(130);
						self:zoomtoheight(130);							
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(130);
						self:zoomtoheight(130);							
					end;
				elseif SCREENMAN:GetTopScreen():GetNextScreenName()=="ScreenStageInformation" 
				and SCREENMAN:GetTopScreen():GetPrevScreenName()~="ScreenSelectMusic" then
						local selgrp =SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedSection();
						if not GAMESTATE:GetCurrentSong() then
							myLoadGroupJacket(selgrp, self);
							self:zoomtowidth(130);
							self:zoomtoheight(130);	
							self:stoptweening();
						else
							self:Load(THEME:GetPathG("","Common fallback jacket"));
							self:zoomtowidth(130);
							self:zoomtoheight(130);	
							self:stoptweening();							
						end;
				else
						self:diffusealpha(1);
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(130);
						self:zoomtoheight(130);							
				end;
		else
			local course = GAMESTATE:GetCurrentCourse();
			if course then
				self:x(SCREEN_CENTER_X+0);
				self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
						self:zoomtowidth(304);
						self:zoomtoheight(304);				
			end;
		end;
		self:stoptweening();
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		};
};



t[#t+1]=LoadActor("_SSM_GrooveRadar")..{
	
	OnCommand=cmd(x,SCREEN_CENTER_X-69-435;y,SCREEN_CENTER_Y+207-22;zoom,0.9;diffusealpha,0;linear,0.5;diffusealpha,1;);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayArtist();
			end;
			self:diffusealpha(1);
		else
			self:diffusealpha(0.5);
		end;
	end;
	
	};
	
--GrooveRadar by Razorblade (Obtained from XX--STARLiGHT--twopointzero) -Curilang

for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = create_ddr_groove_radar("radar",0,0,pn,120,color("0,0,0,0.5"),{color("0,0,0,0.5"),color("0,0,0,0.5"),color("0,0,0,0.5"),color("0,0,0,0.5"),color("0,0,0,0.5")}, "accelerate", 0.133)..{
		InitCommand=function(s) s:xy(_screen.cx-504,_screen.cy+192) end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.75):linear(0.25):diffusealpha(1) end,
	};
end

--GrooveRadar by Razorblade (Obtained from XX--STARLiGHT--twopointzero) -Curilang

t[#t+1]=LoadActor("_SSM_radarScanLine")..{
		InitCommand=cmd(zoom,0.55;x,SCREEN_CENTER_X-69-435;y,SCREEN_CENTER_Y+207+7-22;diffusealpha,0;linear,0.5;diffusealpha,1;);	
		OnCommand=cmd(spin);
		OffCommand=cmd(stoptweening;linear,0.25;diffusealpha,0;);
			CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayArtist();
			end;
			self:diffusealpha(1);
		else
			self:diffusealpha(0.5);
		end;
	end;
		};

	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Beginner');
	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Easy');
	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Medium');
	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Hard');
	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Challenge');
	t[#t+1]=DrawDifListPlayershadowp1(PLAYER_1,'Difficulty_Edit');

t[#t+1]=LoadActor("LabelGroove")..{
	
	OnCommand=cmd(x,SCREEN_CENTER_X-69-435;y,SCREEN_CENTER_Y+207-22;zoom,0.9;diffusealpha,0;linear,0.5;diffusealpha,1;);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayArtist();
			end;
			self:diffusealpha(1);
		else
			self:diffusealpha(0.5);
		end;
	end;
	
	};

--Default Difficulty List
t[#t+1] = LoadActor("DefaultDifficulty.lua")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-165-5;y,SCREEN_CENTER_Y-115;zoom,1.5);
	OnCommand=cmd(diffusealpha,0;linear,0.05;diffusealpha,1);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);

};

	
	if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Beginner');
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Easy');
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Medium');
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Hard');
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Challenge');
	t[#t+1]=DrawDifList(PLAYER_1,'Difficulty_Edit');
	end
	
end;


t[#t+1] = LoadActor("scoresP1")..{
		InitCommand=cmd(draworder,3;addy,349-7;x,-12+438;zoom,0.9;diffusealpha,0;linear,0.5;diffusealpha,1;);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
};

t[#t+1] = LoadActor("detailp1")..{
		InitCommand=cmd(draworder,3;x,115+50;zoom,0.95;diffusealpha,0;linear,0.5;diffusealpha,1;);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
};

-- Song Title

t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-355+40-6;shadowlengthy,3;y,SCREEN_CENTER_Y+12-195-7;draworder,2;zoom,0.8;diffusealpha,0;linear,0.5;diffusealpha,1;);
	OnCommand=cmd(playcommand,"CurrentSongChangedMessage");
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayMainTitle();
			end;
			self:diffusealpha(1);
			self:maxwidth(420);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};
--artist--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,left;shadowlengthy,2.5;x,SCREEN_CENTER_X-355+40-6;y,SCREEN_CENTER_Y+45-195-12.5;zoom,0.6;draworder,2;diffusealpha,0;linear,0.5;diffusealpha,0.5;);
	OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
				
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayArtist();
			end;
			self:diffusealpha(0.5);
			self:maxwidth(550);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};--]]

--Group Names
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px") ..{
	InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X-355+40-6;y,SCREEN_CENTER_Y+27-195;zoom,1;diffuse,color("#ffffff");shadowlengthy,2;maxwidth,340);
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	SetCommand=function(self)
		if SCREENMAN:GetTopScreen():GetNextScreenName()=="ScreenStageInformation" 
		then --Ensure not the Sort Screen (Left+Right)
			if SCREENMAN:GetTopScreen():GetPrevScreenName()~="ScreenSelectMusic" then --Ensure not the Option Screen (Select)
				local selgrp =SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedSection();
				local seltype = SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedType();

				
				if seltype == "WheelItemDataType_Section" then
					local groupName = TranslateGroupName(selgrp);
				
					self:settext(groupName);
					self:rainbowscroll(false);
					self:stoptweening();
					
					
					
				elseif seltype == "WheelItemDataType_Roulette" then
					self:settext("Roulette");
					self:rainbowscroll(true);
					self:stoptweening();
				elseif seltype == "WheelItemDataType_Random" then
					self:settext("Random");
					self:rainbowscroll(true);
					self:stoptweening();
				elseif seltype == "WheelItemDataType_Portal" then
					self:settext("PORTAL");
					self:stoptweening();
				else
					self:settext("");
					self:stoptweening();
				end;
				
				if GAMESTATE:IsExtraStage()==true or GAMESTATE:IsExtraStage2()==true then	
					self:diffuse(color("#ffffff"))
				else
					self:diffuse(color("#ffffff"))
				end
			end;
		end;
	end;
	CodeMessageCommand=cmd(playcommand,'Set');
} 





return t;
