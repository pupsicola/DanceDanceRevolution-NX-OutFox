local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFileOptional("Clock","Clock")..{
InitCommand=cmd(visible,ThemePrefs.Get("ScreenClock") == "On");
};

t[#t+1] = LoadActor("p1result")..{
		InitCommand=cmd(x,SCREEN_LEFT+30;y,SCREEN_CENTER_Y-224;player,PLAYER_1;zoom,1.5);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	};
t[#t+1] = LoadActor("p2result")..{
		InitCommand=cmd(x,SCREEN_RIGHT-80;y,SCREEN_CENTER_Y-268-3;player,PLAYER_2;zoom,1.5);
		OffCommand=cmd();
	};
------------------
t[#t+1] = LoadActor( THEME:GetPathS("ScreenEvaluation", "music") ) .. {
		OnCommand=cmd(play);
	};

local eval_parts = Def.ActorFrame {}

for ip, p in ipairs(GAMESTATE:GetHumanPlayers()) do
	-- Some things to help positioning
	local step_count_offs = string.find(p, "P1") and -140 or 140
	local grade_parts_offs = string.find(p, "P1") and -320 or 320
	local p_grade = STATSMAN:GetCurStageStats():GetPlayerStageStats(p):GetGrade()
	
	-- Options
	eval_parts[#eval_parts+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(horizalign,left;x,260;y,635;zoom,0.6;shadowlengthy,2;diffusealpha,0.5;),
		OnCommand=function(self)
			self:settext(GAMESTATE:GetPlayerState(p):GetPlayerOptionsString(0))
			end;		
		OffCommand=cmd(zoom,0;);
		};
	eval_parts[#eval_parts+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(horizalign,left;x,161;y,635;zoom,0.6;shadowlengthy,2;diffusealpha,0.75;),
		OnCommand=function(self)
			self:settext("Song Options:")
			end;	
		OffCommand=cmd(zoom,0;);
		};
end

t[#t+1] = eval_parts

--P1 Frames--
t[#t+1] = LoadActor("panejudg")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19-22;x,SCREEN_CENTER_X-245;visible,GAMESTATE:IsHumanPlayer(PLAYER_1););
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
	self:diffusealpha(0);
	else
	self:diffusealpha(1);
	end;
	end;
	};

t[#t+1] = LoadActor("judgebg.lua")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-7-22;x,SCREEN_CENTER_X-245;visible,GAMESTATE:IsHumanPlayer(PLAYER_1);diffusealpha,1;zoom,0.675);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	};
t[#t+1] = LoadActor("panehs")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-3-19-22;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1););
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
	self:diffusealpha(0);
	else
	self:diffusealpha(1);
	end;
	end;
	};
	
	t[#t+1] = LoadActor("panenote")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y-150-3.5;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_1););
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
	self:diffusealpha(0);
	else
	self:diffusealpha(1);
	end;
	end;
	};




--P2 Frames--
t[#t+1] = LoadActor("DefaultFrame.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-7-22;x,SCREEN_CENTER_X+330-80-5;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);zoom,0.675);
		OffCommand=cmd();
};

t[#t+1] = LoadActor("judgebg.lua")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-7-22;x,SCREEN_CENTER_X+245;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,0;zoom,0.675);
	OnCommand=function(self)
		PanelOnCommandControlEvaluation("OpenPanes2", self, PLAYER_2);
	end;
		OffCommand=cmd();
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
t[#t+1] = LoadActor("cal_back.png")..{
	InitCommand=cmd(y,SCREEN_CENTER_Y+160-9-10-22;x,SCREEN_CENTER_X+330-40+30-80+20-5-10;visible,GAMESTATE:IsHumanPlayer(PLAYER_2);diffusealpha,0;zoom,0.675);
	OnCommand=function(self)
		PanelOnCommandControlEvaluation("OpenPanes4", self, PLAYER_2);
	end;
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_2 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(1);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	};
	
	--Song Info BG
t[#t+1] = LoadActor("_songinfobg")..{
	OnCommand=cmd(x,SCREEN_CENTER_X-170;y,SCREEN_CENTER_Y-145;zoom,0.93);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
};
	
	--Score

t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("ScreenEvaluation", "ScoreNumber");
			InitCommand=cmd(shadowlengthy,3;x,SCREEN_CENTER_X-13;y,SCREEN_CENTER_Y-102;zoom,0.87;player,PLAYER_1;playcommand,"Set");
			SetCommand = function(self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
				self:Load("RollingNumbersEvaluation");
				self:targetnumber(score);
			end;
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
		};



--Grade	
	
t[#t+1] = LoadActor("grade")..{
	InitCommand=cmd(bob;effectmagnitude,0,0.5,0;effecttiming,1,0,1,0;diffusealpha,1;draworder,11;addx,224;zoom,0.6;addy,99);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
};
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(diffusealpha,1;draworder,11;addx,110-20;addy,-30);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	CodeMessageCommand=function(self,params)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		local pn= params.PlayerNumber
		if pn==PLAYER_1 then
			if params.Name=="OpenPanes1"then
				self:diffusealpha(1);
			elseif params.Name=="OpenPanes2"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes3"then
				self:diffusealpha(0);
			elseif params.Name=="OpenPanes4"then
				self:diffusealpha(0);
			elseif params.Name=="ClosePanes"then
				self:diffusealpha(0);
			end;
		end;
	end;
	--FCTextP1--
	LoadActor("NFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-65;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local pssp1 = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1")
			if pssp1:FullComboOfScore('TapNoteScore_W4') and 
			not pssp1:FullComboOfScore('TapNoteScore_W3') and
			not pssp1:FullComboOfScore('TapNoteScore_W2') and
			not pssp1:FullComboOfScore('TapNoteScore_W1') 
			then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.4))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_1);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_1)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("GFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-65;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if((staw =="StageAward_SingleDigitW3") or (staw =="StageAward_OneW3") or (staw =="StageAward_FullComboW3")) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.4))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_1);
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_1)
		end;
	};	
	LoadActor("PFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-65;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if((staw =="StageAward_SingleDigitW2") or (staw =="StageAward_OneW2") or (staw =="StageAward_FullComboW2")) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.4))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_1);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_1)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("MFC")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-65;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
			if (staw =="StageAward_FullComboW1")    then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.4))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_1);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_1)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);

	};
};
t[#t+1] = Def.ActorFrame{
	--FCTextP2--
	LoadActor("NFC")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local pssp2 = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2")
			if pssp2:FullComboOfScore('TapNoteScore_W4') and 
			not pssp2:FullComboOfScore('TapNoteScore_W3') and
			not pssp2:FullComboOfScore('TapNoteScore_W2') and
			not pssp2:FullComboOfScore('TapNoteScore_W1') and 
			not GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'little') then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,1))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_2);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_2)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("GFC")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
		local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if((staw =="StageAward_SingleDigitW3") or (staw =="StageAward_OneW3") or (staw =="StageAward_FullComboW3") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_2);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_2)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};	
	LoadActor("PFC")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if((staw =="StageAward_SingleDigitW2") or (staw =="StageAward_OneW2") or (staw =="StageAward_FullComboW2") ) then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_2);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_2)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);
	};
	LoadActor("MFC")..{
		InitCommand=cmd(player,PLAYER_2;x,SCREEN_CENTER_X+355+40;y,SCREEN_CENTER_Y+180;zoom,0;diffusealpha,0);
		OnCommand=function(self)
			local staw = STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P2"):GetStageAward();
			if (staw =="StageAward_FullComboW1") then
				(cmd(sleep,0.316;linear,0.266;diffusealpha,1;zoom,0.675))(self);
			end;
			PanelOnCommandControlEvaluation("OpenPanes1", self, PLAYER_2);
		end;
		CodeMessageCommand=function(self,params)
			PanelCodeMessageControlEvaluation("OpenPanes1", self, params, PLAYER_2)
		end;
		OffCommand=cmd(linear,0.2;zoom,0);

	};
};


--StatsP1--
t[#t+1] = LoadActor("statsP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);addy,185-3-6-20;zoom,1.2575;x,SCREEN_CENTER_X-270+80+20+5;diffusealpha,1);
	OffCommand=cmd(zoom,0;);
	};
-- rival scores P1
t[#t+1] = LoadActor("scoresP1")..{
		InitCommand=cmd(x,490;addy,7;diffusealpha,1;draworder,3;visible,GAMESTATE:IsHumanPlayer(PLAYER_1));
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
};


t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(fov,0;blend,'BlendMode_Add';x,SCREEN_CENTER_X-368;y,SCREEN_CENTER_Y-290;rotationy,0;wag;effectmagnitude,15,-10,0;effecttiming,5,0,5,0;);
			LoadActor( THEME:GetPathB("_shared","models/Results") )..{
			OnCommand=cmd(diffusealpha,1;zoom,3000;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
			OffCommand=cmd(linear,0.25;diffusealpha,0;);
			};
		};
};


--style text
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(x,SCREEN_CENTER_X-521;y,SCREEN_CENTER_Y-175;visible,GAMESTATE:IsHumanPlayer(PLAYER_1)diffusealpha,1;shadowlengthy,2;zoom,0.45;horizalign,right;);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
	local style = GAMESTATE:GetCurrentStyle();
		if style:GetStyleType() == "StyleType_OnePlayerTwoSides" then
			self:settext("DOUBLE");
			self:diffuse(color("#f700d7"));
		elseif style:GetStyleType() == "StyleType_OnePlayerOneSide" then
			self:settext("SINGLE");
			self:diffuse(color("#ffffff"));
		elseif style:GetStyleType() == "StyleType_TwoPlayersTwoSides" then
			self:settext("VERSUS");
			self:diffuse(color("#f78c03"));
		end;
	end;
	};
	






-- life graph
local function GraphDisplay(pn)
	local t = Def.ActorFrame {
		OnCommand=cmd(x,0;zoom,2;);
		Def.GraphDisplay {
			InitCommand=cmd(Load,"GraphDisplay"..ToEnumShortString(pn);x,0;y,0;);
			BeginCommand=function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats();
				self:Set( ss, ss:GetPlayerStageStats(pn) );
				self:player( pn );
				self:x(0);
			end
		};
	};
	return t;
end

if ShowStandardDecoration("GraphDisplay") then
	for pn in ivalues(PlayerNumber) do
		t[#t+1] = StandardDecorationFromTable("GraphDisplay"..ToEnumShortString(pn), GraphDisplay(pn));
	end
end

-- combo graph
local function ComboGraph( pn )
	local t = Def.ActorFrame {
			OnCommand=cmd(x,0;zoom,2;);
		Def.ComboGraph {
			InitCommand=cmd(Load,"ComboGraph"..ToEnumShortString(pn);x,0;y,0;);
			BeginCommand=function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats();
				self:Set( ss, ss:GetPlayerStageStats(pn) );
				self:player( pn );
				self:x(0);
			end
		};
	};
	return t;
end

if ShowStandardDecoration("ComboGraph") then
	for pn in ivalues(PlayerNumber) do
		t[#t+1] = StandardDecorationFromTable("ComboGraph"..ToEnumShortString(pn), ComboGraph(pn));
	end;
end;







		
if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.StepsDisplay {
			InitCommand=cmd(Load,"StepsDisplayEvaluation",pn;SetFromGameState,pn;);
			UpdateNetEvalStatsMessageCommand=function(self,param)
				if GAMESTATE:IsPlayerEnabled(pn) then
					-- self:SetFromSteps(param.Steps)
				end;
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "StepsDisplay" .. ToEnumShortString(pn), t2 );
	end
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "StageAward" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "StageAward"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local tStats = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats() or STATSMAN:GetCurStageStats();
			tStats = tStats:GetPlayerStageStats(pn);
			if tStats:GetStageAward() then
				self:settext( THEME:GetString( "StageAward", ToEnumShortString( tStats:GetStageAward() ) ) );
			else
				self:settext( "" );
			end
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PeakComboAward" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PeakComboAward"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local tStats = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats() or STATSMAN:GetCurStageStats();
			tStats = tStats:GetPlayerStageStats(pn);
			if tStats:GetPeakComboAward() then
				self:settext( THEME:GetString( "PeakComboAward", ToEnumShortString( tStats:GetPeakComboAward() ) ) );
			else
				self:settext( "" );
			end
		end;
	};
end

--song jacket--
t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(x,SCREEN_CENTER_X-378;y,SCREEN_CENTER_Y-145;diffusealpha,1;draworder,1;zoom,0.78;);
	Def.Sprite {
		OnCommand=function(self)
		local course = GAMESTATE:GetCurrentCourse();
		if GAMESTATE:IsCourseMode() then
			if course then
				self:LoadBackground(course:GetBannerPath());
				self:setsize(220,220);
			else
				-- default to the Banner of the first song in the course
				self:Load(THEME:GetPathG("","Common fallback jacket"));
				self:setsize(220,220);
			end
		else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:setsize(220,220);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(220,220);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(220,220);
					end;
				else
					self:diffusealpha(0);	
			end;
		end;
		end;
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	};
};




--song title--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(shadowlengthy,2;horizalign,left;x,SCREEN_CENTER_X-250-30;y,SCREEN_CENTER_Y-215+5;zoom,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
		if song or course then
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();
			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayFullTitle();
			end;
			
			if GAMESTATE:IsCourseMode() then
				self:diffuse(color("#ffffff"))
			elseif GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2() then	
				self:diffuse(color("#ffffff"))
			elseif GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then 
				self:diffuse(color("#ffffff"))
			else
				self:diffuse(color("#ffffff"))
			end
			self:diffusealpha(1);
			self:maxwidth(392);
			self:settext(tit);
			--self:diffuse(Color("Black"));
		else
			self:diffusealpha(0);
		end;
	end;
};
if not GAMESTATE:IsCourseMode() then

--artist--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(shadowlengthy,2;horizalign,left;x,SCREEN_CENTER_X-250-30;y,SCREEN_CENTER_Y-175;zoom,0.8;draworder,2);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
	OnCommand=function(self)
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
			
			if GAMESTATE:IsCourseMode() then
				self:diffuse(color("#ffffff"))
			elseif GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2() then	
				self:diffuse(color("#ffffff"))
			elseif GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then 
				self:diffuse(color("#ffffff"))
			else
				self:diffuse(color("#ffffff"))
			end
			self:diffusealpha(0.5);
			self:maxwidth(490);
			self:settext(tit);
		else
			self:diffusealpha(0);
		end;
	end;
};
end;

	t[#t+1] = LoadFont("_sf rounded pro 28px").. {

			InitCommand=function(self)

				local dispnameP1 = PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
				local dispnamelengthP1 = string.len(dispnameP1);

				self:player(PLAYER_1);
				self:horizalign(right);
				self:settext(dispnameP1);
				self:x(SCREEN_CENTER_X-515);self:y(SCREEN_CENTER_Y-224);
				self:draworder(50);
				self:diffuse(color("#FFFFFF"));
				self:zoomy(1);

				if dispnamelengthP1 >= 8 then
					--expand
					self:maxwidth(80*1.0);
					self:zoomx(1.69*1.0);
				else
					--constant width
					self:zoomx(1.02*1.0);
				end;

			end;
			
					OffCommand=cmd(linear,0.25;diffusealpha,0;);
			
	};
	t[#t+1] = LoadFont("_sf rounded pro 28px").. {

			InitCommand=function(self)

				local dispnameP2 = PROFILEMAN:GetProfile(PLAYER_2):GetDisplayName();
				local dispnamelengthP2 = string.len(dispnameP2);

				self:player(PLAYER_2);
				self:horizalign(left);
				self:settext(string.upper(dispnameP2));
				self:x(SCREEN_CENTER_X+474);self:y(SCREEN_CENTER_Y-270);
				self:draworder(50);
				self:diffuse(color("#FFFFFF"));
				self:zoomy(0.74);

				if dispnamelengthP2 >= 8 then
					--expand
					self:maxwidth(80*1.0);
					self:zoomx(1.69*1.0);
				else
					--constant width
					self:zoomx(1.02*1.0);
				end;

			end;
			
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	};







t[#t+1] = StandardDecorationFromFileOptional("GameType","GameType");
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	LoadActor("try extra1")..{
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+276);
		OnCommand=cmd(diffusealpha,0;zoom,1;linear,0.5;zoom,1;diffusealpha,1;);
		OffCommand = cmd(zoom,1;linear,0.03;zoom,1;diffusealpha,0;);
	};
		LoadActor("try extra1")..{
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+276;blend,Blend.Add);
		OnCommand=cmd(diffusealpha,0;zoom,1;linear,0.5;zoom,1;diffusealpha,1;diffuseshift;effectperiod,1;effectcolor1,color("0,0,0,0");effectcolor2,color("0.4,0.4,0.4,0.3"));
		OffCommand = cmd(zoom,1;linear,0.03;zoom,1;diffusealpha,0;);
	}
	
	
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra1" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};
t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and not GAMESTATE:IsExtraStage() and GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra2" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
	LoadActor("try extra2")..{
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+276);
		OnCommand=cmd(diffusealpha,0;zoom,1;linear,0.5;zoom,1;diffusealpha,1;);
		OffCommand = cmd(zoom,1;linear,0.03;zoom,1;diffusealpha,0;);
	};
	LoadActor("try extra2")..{
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+276;;blend,Blend.Add);
		OnCommand=cmd(diffusealpha,0;zoom,1;linear,0.5;zoom,1;diffusealpha,1;diffuseshift;effectperiod,0.8;effectcolor1,color("0,0,0,0");effectcolor2,color("0.4,0.4,0.4,0.7"));
		OffCommand = cmd(zoom,1;linear,0.03;zoom,1;diffusealpha,0;);
	}
	-- LoadActor( THEME:GetPathG("ScreenStageInformation","Stage extra2" ) ) .. {
		-- Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		-- InitCommand=cmd(Center);
		-- OnCommand=cmd(diffusealpha,0;zoom,0.85;bounceend,1;zoom,1;diffusealpha,1;sleep,0;glow,Color("White");decelerate,1;glow,Color("Invisible");smooth,0.35;zoom,0.25;y,SCREEN_BOTTOM-72);
	-- };
};

-- local StreamActualValue = (STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarActual():GetValue("RadarCategory_Stream"))*(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarPossible():GetValue("RadarCategory_Stream"));
-- local VoltageActualValue = (STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarActual():GetValue("RadarCategory_Voltage"))*(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarPossible():GetValue("RadarCategory_Voltage"));
-- local AirActualValue = (STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarActual():GetValue("RadarCategory_Air"))*(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarPossible():GetValue("RadarCategory_Air"));
-- local FreezeActualValue = (STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarActual():GetValue("RadarCategory_Freeze"))*(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarPossible():GetValue("RadarCategory_Freeze"));
-- local ChaosActualValue = (STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarActual():GetValue("RadarCategory_Chaos"))*(STATSMAN:GetCurStageStats():GetPlayerStageStats("PlayerNumber_P1"):GetRadarPossible():GetValue("RadarCategory_Chaos"));

-- t[#t+1] = LoadFont("Common Normal")..{
		-- Text="StreamActualValue:"..tostring(StreamActualValue);
		-- InitCommand=cmd(Center;diffuse,color("1,1,1,1");shadowlengthy,2;y,620);
		-- OffCommand=cmd(linear,0.15;diffusealpha,0);
	-- };
-- t[#t+1] = LoadFont("Common Normal")..{
		-- Text="ChaosActualValue:"..tostring(ChaosActualValue);
		-- InitCommand=cmd(Center;diffuse,color("1,1,1,1");shadowlengthy,2;y,600);
		-- OffCommand=cmd(linear,0.15;diffusealpha,0);
	-- };

t[#t+1] = LoadActor("SocreDiff")..{
	InitCommand=cmd(zoom,1);
};




return t