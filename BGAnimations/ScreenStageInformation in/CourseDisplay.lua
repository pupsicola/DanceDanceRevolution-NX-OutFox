if not GAMESTATE:IsCourseMode() then return Def.ActorFrame{} end; -- short circuit
local course = GAMESTATE:GetCurrentCourse()

local t = Def.ActorFrame{



	-- banner
	
	Def.Quad {
		InitCommand=cmd(Center;zoomto,486,486;diffuse,Color("Black"));
		OnCommand=cmd(diffuse,color("#000000");Center;setsize,486,486;diffusealpha,0;zoom,4;sleep,1.9;linear,0.2;diffusealpha,1;zoom,1);
	};
	
	Def.Sprite{
		InitCommand=cmd(Center);
		BeginCommand=function(self)
			if course then
				self:LoadBackground(course:GetBannerPath());
				self:setsize(480,480);
			else
				-- default to the Banner of the first song in the course
				self:Load(THEME:GetPathG("","Common fallback jacket"));
				self:setsize(480,480);
			end
		end;
		OnCommand=cmd(scaletoclipped,480,480;Center;diffusealpha,0;zoom,4;sleep,1.9;linear,0.2;diffusealpha,1;zoom,1;sleep,3;diffusealpha,1);
	};
	
	-- Def.Sprite{
		-- InitCommand=cmd(Center);
		-- BeginCommand=function(self)
			-- if course then
				-- self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
			-- else
				
				-- self:Load(THEME:GetPathG("","Common fallback jacket"));
			-- end
		-- end;
		-- OnCommand=cmd(scaletoclipped,320,320;Center;diffusealpha,0;zoom,4;sleep,1.9;linear,0.2;diffusealpha,1;zoom,1;sleep,3;diffusealpha,1);
	-- };
	-- alternate background
	-- Def.Sprite{
		-- InitCommand=cmd(Center;);
		-- BeginCommand=cmd(LoadFromCurrentSongBackground;scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0);
		-- OnCommand=cmd(sleep,4;playcommand,"Show");
		-- ShowCommand=function(self)
			-- if course:HasBackground() then
				-- self:accelerate(0.25)
				-- self:diffusealpha(1)
			-- end
		-- end;
	-- };
};

return t;