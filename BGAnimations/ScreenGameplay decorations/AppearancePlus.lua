local t = Def.ActorFrame{};

local numPlayers = GAMESTATE:GetNumPlayersEnabled()
local center1P = PREFSMAN:GetPreference("Center1Player")
local style = GAMESTATE:GetCurrentStyle();
local styleType = ToEnumShortString(style:GetStyleType());

local OptionsP1;
local OptionsP2;
OptionsP1 = GAMESTATE:GetPlayerState('PlayerNumber_P1'):GetPlayerOptionsString('ModsLevel_Preferred');
OptionsP2 = GAMESTATE:GetPlayerState('PlayerNumber_P2'):GetPlayerOptionsString('ModsLevel_Preferred');


function SaveAppearancePluShowForPlayer( PlayerUID, MyValue)

	local AppearancePlusShowFile = RageFileUtil:CreateRageFile();
	AppearancePlusShowFile:Open("Save/AppearancePlusShow/"..PlayerUID..".txt",2);
	AppearancePlusShowFile:Write(tostring(MyValue));
	AppearancePlusShowFile:Close();
end

function ReadOrCreateAppearancePluShowForPlayer(PlayerUID, MyValue)
	local AppearancePlusShowFile = RageFileUtil:CreateRageFile()
	if AppearancePlusShowFile:Open("Save/AppearancePlusShow/"..PlayerUID..".txt",1) then 
		local str = AppearancePlusShowFile:Read();
		MyValue =str;
	else
		AppearancePlusShowFile:Open("Save/AppearancePlusShow/"..PlayerUID..".txt",2);
		AppearancePlusShowFile:Write("Show");
		MyValue="Show";
	end
	AppearancePlusShowFile:Close();
	return MyValue;
end


function ReadOrCreateAppearancePlusCoverPosForPlayer(PlayerUID, MyValue)
	local AppearancePlusCoverPosFile = RageFileUtil:CreateRageFile()
	if AppearancePlusCoverPosFile:Open("Save/AppearancePlusCoverPos/"..PlayerUID..".txt",1) then 
		local str = AppearancePlusCoverPosFile:Read();
		MyValue =str;
	else
		AppearancePlusCoverPosFile:Open("Save/AppearancePlusCoverPos/"..PlayerUID..".txt",2);
		AppearancePlusCoverPosFile:Write("0");
		MyValue="0";
	end
	AppearancePlusCoverPosFile:Close();
	return MyValue;
end

function SaveAppearancePlusCoverPosForPlayer( PlayerUID, MyValue)

	local AppearancePlusCoverPosFile = RageFileUtil:CreateRageFile();
	AppearancePlusCoverPosFile:Open("Save/AppearancePlusCoverPos/"..PlayerUID..".txt",2);
	AppearancePlusCoverPosFile:Write(tostring(MyValue));
	AppearancePlusCoverPosFile:Close();
end

function InitCoverPos(self, player, CoverPosition, pos, Mode, TwoCoverMode)
	local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID(); 
	(cmd(zoom,1.5;x,pos;y,SCREEN_CENTER_Y;draworder,101))(self);
	local selfy = tonumber(ReadOrCreateAppearancePlusCoverPosForPlayer(PlayerUID,CoverPosition));
	
	if TwoCoverMode then --Hidden+&Sudden+
		if selfy > 0 then
			selfy = 0;
		end
	end
	
	
	if GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
		if Mode == "Hidden+" then
			self:y(SCREEN_CENTER_Y+SCREEN_HEIGHT/2-selfy)
		elseif Mode == "Sudden+" then
			self:y(SCREEN_CENTER_Y-SCREEN_HEIGHT/2+selfy)
		end
	else
		if Mode == "Hidden+" then
			self:y(SCREEN_CENTER_Y-SCREEN_HEIGHT/2+selfy)
		elseif Mode == "Sudden+" then
			self:y(SCREEN_CENTER_Y+SCREEN_HEIGHT/2-selfy)
		end
	end;
end

function ControlCoverPos(self, params, player, CoverPosition, Mode, TwoCoverMode)
	if params.PlayerNumber == player then
		local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID(); 
		
		if params.Name == "AppearancePlusShow" then
			local MyValue= "Show";
			MyValue = ReadOrCreateAppearancePluShowForPlayer(PlayerUID, MyValue);
			if MyValue == "Show" then
				self:diffusealpha(0);
				MyValue = "Hidden";
			else
				MyValue= "Show";
				self:diffusealpha(1);
			end;
			SaveAppearancePluShowForPlayer( PlayerUID, MyValue);
			return;
		end;
		
		local yDelta = 0;
		if TwoCoverMode then --Hidden+&Sudden+
			if params.Name == "AppearancePlusHarsher" then
				yDelta = 5;
			elseif params.Name == "AppearancePlusEasier" then
				yDelta = -5;
			elseif params.Name == "AppearancePlusHarsherMore" then
				yDelta = 25;	
			elseif params.Name == "AppearancePlusEasierMore" then
				yDelta = -25;	
			end;

		else
			if params.Name == "AppearancePlusHarsher" then
				yDelta = 10;
			elseif params.Name == "AppearancePlusEasier" then
				yDelta = -10;
			elseif params.Name == "AppearancePlusHarsherMore" then
				yDelta = 50;	
			elseif params.Name == "AppearancePlusEasierMore" then
				yDelta = -50;	
			end;
		end
		
		self:diffusealpha(1);
		
		local selfy = tonumber(ReadOrCreateAppearancePlusCoverPosForPlayer(PlayerUID,CoverPosition));
		selfy = selfy+yDelta;
		
		if TwoCoverMode then --Hidden+&Sudden+
			if selfy >0 then 
				selfy = 0
			elseif selfy < -SCREEN_HEIGHT/2 then
				selfy = -SCREEN_HEIGHT/2
			end;
		else
			if selfy >SCREEN_HEIGHT/2 then 
				selfy = SCREEN_HEIGHT/2
			elseif selfy < -SCREEN_HEIGHT/2 then
				selfy = -SCREEN_HEIGHT/2
			end;
		end	
		self:linear(0.1);
		
		if GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
			if Mode == "Hidden+" then
				self:y(SCREEN_HEIGHT-selfy);
			elseif Mode == "Sudden+" then
				self:y(selfy);
			end
		else
			if Mode == "Hidden+" then
				self:y(selfy);
			elseif Mode == "Sudden+" then
				self:y(SCREEN_HEIGHT-selfy);
			end
		end;
		SaveAppearancePlusCoverPosForPlayer(PlayerUID,selfy)
	end;
end

function AddCoverLayer(FileName, player, CoverPosition, pos, Mode, TwoCoverMode)
	t[#t+1] = LoadActor(FileName)..{
		InitCommand=function(self)
			InitCoverPos(self, player, CoverPosition, pos, Mode, TwoCoverMode);
		end;
		CodeMessageCommand = function(self, params)
			ControlCoverPos(self, params, player, CoverPosition, Mode, TwoCoverMode);
		end;
	};
end




function AppearancePlusMain(pn)
	local player = pn;
	local pNum = (player == PLAYER_1) and 1 or 2
	local OptionString = (player == PLAYER_1)  and OptionsP1 or OptionsP2;
	local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID()  
	local CoverPosition = 0;
	
	local pos = SCREEN_CENTER_X;
	-- [ScreenGameplay] PlayerP#Player*Side(s)X
	if center1P then
		pos = SCREEN_CENTER_X
	else
		local metricName = string.format("PlayerP%i%sX",pNum,styleType)
		pos = THEME:GetMetric("ScreenGameplay",metricName)
	end
	
	local MyValue = ReadOrCreateAppearancePlusValueForPlayer(PlayerUID,MyValue);
	
	if MyValue == "Hidden" then
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString..',Hidden,');
	elseif MyValue == "Sudden" then	
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString..',Sudden,');
	elseif MyValue == "Stealth" then
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString..',Stealth,');
	elseif MyValue == "Hidden+" then
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString);
		
		if GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Single" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("UpperCoverSingle", player, CoverPosition, pos, "Hidden+",false);
			else
				AddCoverLayer("LowerCoverSingle", player, CoverPosition, pos, "Hidden+",false);
			end
		elseif GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Double" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("UpperCoverDouble", player, CoverPosition, pos, "Hidden+",false);
			else
				AddCoverLayer("LowerCoverDouble", player, CoverPosition, pos, "Hidden+",false);
			end
		end
	elseif MyValue == "Sudden+" then
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString);
		
		if GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Single" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("LowerCoverSingle", player, CoverPosition, pos, "Sudden+",false);
			else
				AddCoverLayer("UpperCoverSingle", player, CoverPosition, pos, "Sudden+",false);
			end
		elseif GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Double" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("LowerCoverDouble", player, CoverPosition, pos, "Sudden+",false);
			else
				AddCoverLayer("UpperCoverDouble", player, CoverPosition, pos, "Sudden+",false);
			end
		end
	elseif MyValue == "Hidden+&Sudden+" then
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString);
		
		if GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Single" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("UpperCoverSingle", player, CoverPosition, pos, "Hidden+",true);
				CoverPosition = 0;
				AddCoverLayer("LowerCoverSingle", player, CoverPosition, pos, "Sudden+",true);
			else
				AddCoverLayer("UpperCoverSingle", player, CoverPosition, pos, "Sudden+",true);
				CoverPosition = 0;
				AddCoverLayer("LowerCoverSingle", player, CoverPosition, pos, "Hidden+",true);
			end
		elseif GAMESTATE:GetCurrentStyle():GetStepsType()=="StepsType_Dance_Double" then
			if not GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				AddCoverLayer("UpperCoverDouble", player, CoverPosition, pos, "Hidden+",true);
				CoverPosition = 0;
				AddCoverLayer("LowerCoverDouble", player, CoverPosition, pos, "Sudden+",true);
			else
				AddCoverLayer("UpperCoverDouble", player, CoverPosition, pos, "Sudden+",true);
				CoverPosition = 0;
				AddCoverLayer("LowerCoverDouble", player, CoverPosition, pos, "Hidden+",true);
			end
		end
	else
		OptionString = string.gsub(OptionString, "(Sudden,)", "");
		OptionString = string.gsub(OptionString, "(Stealth,)", "");
		OptionString = string.gsub(OptionString, "(Hidden,)", "");
		GAMESTATE:GetPlayerState(player):SetPlayerOptions('ModsLevel_Preferred',OptionString);
	end
	
	
end;


if	GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
	AppearancePlusMain('PlayerNumber_P1');
end


if	GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
	AppearancePlusMain('PlayerNumber_P2');
end



-- if numPlayers == 1 then
	-- local player = GAMESTATE:GetMasterPlayerNumber()
	-- local pNum = (player == PLAYER_1) and 1 or 2
	-- local OptionString = (player == PLAYER_1)  and OptionsP1 or OptionsP2;
	-- local PlayerUID = PROFILEMAN:GetProfile(player):GetGUID()  
	-- local CoverPosition = 0;
	
	
	
	
	
	
	-- t[#t+1] = LoadFont("_helvetica-condensed-light 24px")..{
			-- InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
			-- OnCommand=function(self)
				-- self:settext(GAMESTATE:GetPlayerState('PlayerNumber_P1'):GetPlayerOptionsString('ModsLevel_Preferred'));
		-- end;
	-- };
	
	-- t[#t+1] = Def.Quad{
		-- Name="SinglePlayerCover";
		-- InitCommand=cmd(x,pos;CenterY;zoomto,filterWidth*1.5,SCREEN_HEIGHT;diffusecolor,filterColor;diffusealpha,filterAlphas[player];fadeleft,1/32;faderight,1/32);
	-- };
	
	
-- else

-- end



return t;