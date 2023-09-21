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
----------------------------------------------------------------------------
return Def.ActorFrame {
Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5);
	OnCommand=function(self)
		
	self:Load(THEME:GetPathG("StageInformation/Stage","Blue BG" ));
	-- self:diffusealpha(0):zoom(3)
	-- :linear(0.264):diffusealpha(1):zoom(1.5):sleep(1.732):linear(0.04):zoomx(3):zoomy(0.1):sleep(0.1):zoomy(0):diffusealpha(0);
	-- end;
	self:diffusealpha(0):zoom(3)
	:linear(0.164):diffusealpha(0.7):zoom(2.5):sleep(0.2):linear(0.4):zoom(2.3):sleep(0.2):linear(0.15):zoom(1.8):sleep(1.032):linear(0.04):diffusealpha(0):zoomx(1.8):zoomy(0);
	end;
	};

	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5);
	OnCommand=function(self)
		-- if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle' or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then 
			self:Load(THEME:GetPathG("", "StageInformation/Stage " .. ToEnumShortString(sStage) ));
		-- elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage oni"));
		-- elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage Nonstop"));
		-- elseif (GAMESTATE:Env()).EndlessState then
		-- 	self:Load(THEME:GetPathG("ScreenStageInformation", "Stage endless"));
		-- end;
	-- self:diffusealpha(0):zoom(3)
	-- :linear(0.264):diffusealpha(1):zoom(1.5):sleep(1.732):linear(0.04):diffusealpha(0):zoomx(1.8):zoomy(0);
	self:diffusealpha(0):zoom(3)
	:linear(0.164):diffusealpha(1):zoom(2.5):sleep(0.2):linear(0.4):zoom(2.3):sleep(0.2):linear(0.15):zoom(1.8):sleep(1.032):linear(0.04):diffusealpha(0):zoomx(1.8):zoomy(0);
	end;
	};
	
	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X-700;y,SCREEN_CENTER_Y;zoom,2.5;blend,Blend.Add);
	OnCommand=function(self)
			self:Load(THEME:GetPathG("", "StageInformation/Stage " .. ToEnumShortString(sStage) ));
	self:diffusealpha(1):zoom(2.4):linear(0.164):zoom(2.4):x(SCREEN_CENTER_X):linear(0.25):diffusealpha(0.5):zoom(5):linear(0.25):diffusealpha(0):zoom(6);
	end;
	};
	
	Def.Sprite{
	InitCommand=cmd(x,SCREEN_CENTER_X+700;y,SCREEN_CENTER_Y;zoom,2.5;blend,Blend.Add);
	OnCommand=function(self)
			self:Load(THEME:GetPathG("", "StageInformation/Stage " .. ToEnumShortString(sStage) ));
	self:diffusealpha(1):zoom(2.4):linear(0.164):zoom(2.4):x(SCREEN_CENTER_X):linear(0.25):diffusealpha(0.5):zoom(5):linear(0.25):diffusealpha(0):zoom(6);
	end;
	};
};