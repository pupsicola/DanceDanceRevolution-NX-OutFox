local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing

local t = Def.ActorFrame {
	-- Fallback banner in case one isn't available.
	-- Def.Sprite {
		-- Texture=THEME:GetPathG("Common", "fallback jacket"),
		-- InitCommand=cmd(x,120;scaletoclipped,60,60;zoom,9;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
	-- },
	Def.Sprite {
		Name="BannerBG";
		InitCommand=cmd(x,120;scaletoclipped,60,60;zoom,9;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
		BackgroundCommand=cmd(x,120;scaletoclipped,60,60;zoom,9;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
		BannerCommand=cmd(x,120;scaletoclipped,60,60;zoom,9;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
		JacketCommand=cmd(x,120;scaletoclipped,60,60;zoom,9;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:visible(true):Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) then
					self:visible(true):LoadFromCached("background",Song:GetBackgroundPath())
					-- self:visible(true):Load( Song:GetBackgroundPath() );
					self:playcommand("Background");
				elseif ( Song:GetBannerPath() ~= nil ) and ( bAllowJackets ) then
					self:visible(true):LoadFromCached("banner", Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:visible(false)
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:visible(true):Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:visible(true):Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:visible(false)
				end
			else
				self:visible(false)
			end;
		end;
	};


	LoadActor(THEME:GetPathG("MusicWheelItem", "ModeItem")) .. {};

	LoadActor("diff1") .. {
	OnCommand=cmd(x,-211;y,46;zoom,0.5);
	};
	
	LoadActor("grade1") .. {
	OnCommand=cmd(x,-168;zoom,0.71;);
	};

--banner
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(scaletoclipped,60,60;x,-210);
		BackgroundCommand=cmd(scaletoclipped,60,60);
		BannerCommand=cmd(scaletoclipped,60,60);
		JacketCommand=cmd(scaletoclipped,60,60);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) then
					self:Load( Song:GetBackgroundPath() );
					self:playcommand("Background");
				elseif ( Song:GetBannerPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath );
				  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:Load( sJacketPath );
					self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end
			else
				self:Load( bAllowJackets and sJacketPath or sBannerPath );
				self:playcommand( bAllowJackets and "Jacket" or "Banner" );
			end;
		end;
	};
};
return t;