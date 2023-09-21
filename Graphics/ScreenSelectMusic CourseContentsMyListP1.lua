local transform = function(self,offsetFromCenter,itemIndex,numitems)
	self:y( offsetFromCenter * 44 );
end
return Def.CourseContentsList {
	MaxSongs = 10;
    NumItemsToDraw = 6;
	ShowCommand=cmd(bouncebegin,0.3;zoomy,1);
	HideCommand=cmd(linear,0.3;zoomy,0);
	SetCommand=function(self)
		self:SetFromGameState();
		self:SetCurrentAndDestinationItem(3);
		self:SetPauseCountdownSeconds(1);
		self:SetSecondsPauseBetweenItems( 0.00 );
--		self:SetTransformFromFunction(transform);
		--
		self:SetDestinationItem(100);
		self:SetLoop(true);
		self:SetMask(480,54);
	end;
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");

	Display = Def.ActorFrame { 
		InitCommand=cmd(setsize,350,54);

		LoadActor(THEME:GetPathG("CourseEntryMyDisplay","bar")) .. {
			SetSongCommand=function(self, params)
				self:diffuserightedge( CustomDifficultyToLightColor(params.Difficulty) );
				--self:diffuseleftedge( CustomDifficultyToDarkColor(params.Difficulty) );
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;glow,color("1,1,1,0.5");decelerate,0.1;glow,color("1,1,1,0")))(self);
			end;
		};

		-- Def.TextBanner {
			-- InitCommand=cmd(x,-50;y,1;Load,"TextBanner";SetFromString,"", "", "", "", "", "");
			-- SetSongCommand=function(self, params)
				-- if params.Song then
					-- self:SetFromSong( params.Song );
					-- self:diffuse( color("#FFFFFF") );
				-- else
					-- self:SetFromString( "??????????", "??????????", "", "", "", "" );
					-- self:diffuse( color("#FFFFFF") );
				-- end
				-- (cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			-- end;
		-- };
		LoadFont("Common","Normal") .. {
			Text="0";
			InitCommand=cmd(x,-135;y,-10;maxwidth,350;horizalign,left;zoom,0.85;shadowlength,0);
			SetSongCommand=function(self, params)
			self:diffuse( color("0,0,0,1") );
			--self:strokecolor( color("1,1,1,1"));
				if params.Secret ==true then
					self:settext("??????");
				else
					if params.Song then
						self:settext(params.Song:GetDisplayFullTitle());
					end;
				end;
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;))(self);
			end;
		}; 
		
		LoadFont("Common","Normal") .. {
			Text="0";
			InitCommand=cmd(x,-135;y,10;maxwidth,350;horizalign,left;zoom,0.65;shadowlength,0);
			SetSongCommand=function(self, params)
			self:diffuse( color("0,0,0,1") );
			--self:strokecolor( color("1,1,1,1"));
				if params.Secret ==true then
					self:settext("??????");
				else
					if params.Song then
						self:settext(params.Song:GetDisplayArtist());
					end;
				end;
				(cmd(finishtweening;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;))(self);
			end;
		}; 
 
		
		Def.Sprite {
			Name="SongBanner";
			SetSongCommand=function(self, params)
				if params.Song then
					self:Load(GetSongGPath(params.Song));
				else
					self:load("UnknownBanner.png");
				end
				self:scaletoclipped( 40,40 );
				self:x(-163);
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			end;
		};
		
		LoadFont("CourseEntryDisplay","number") .. {
			InitCommand=cmd(x,-198;y,0;shadowlength,2;strokecolor,color("#999999"));
			SetSongCommand=function(self, params) 
				self:settext(string.format("%i", params.Number)); 

				(cmd(finishtweening;zoom,0.5;zoomy,0.5*1.5;diffusealpha,0;sleep,0.125*params.Number;linear,0.125;diffusealpha,1;linear,0.05;zoomy,0.5*1;zoomx,0.5*1.1;glow,color("1,1,1,0.5");decelerate,0.1;zoom,1;glow,color("1,1,1,0")))(self);
			end;
		};

 		LoadFont("Common Normal") .. {
			Text="0";
			InitCommand=cmd(x,185;y,0;zoom,0.75;strokecolor,color("#000000"));
			SetSongCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
				self:settext( params.Meter );
				self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				self:strokecolor(CustomDifficultyToDarkColor(params.Difficulty));
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			end;
		}; 
	};
};