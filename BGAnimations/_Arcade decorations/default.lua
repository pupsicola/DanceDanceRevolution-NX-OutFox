local t = Def.ActorFrame {};

--Frame BG
	t[#t+1] = Def.ActorFrame {
		LoadActor( "bg" )..{
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-58);
		};
	};

--Messages
t[#t+1] = Def.ActorFrame {
	LoadFont("_sf rounded pro 24px") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-57;);
	Text="...";
	OnCommand=cmd(playcommand,"Refresh");
	CoinInsertedMessageCommand=cmd(playcommand,"Refresh");
	CoinModeChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local bCanPlay = GAMESTATE:EnoughCreditsToJoin();
		local bReady = GAMESTATE:GetNumSidesJoined() > 0;
		if bCanPlay or bReady then
			--self:settext(THEME:GetString("ScreenTitleJoin","HelpTextJoin"));
			self:settext("Press Start");
			self:shadowlengthy,2;
			self:diffuseshift();
			self:effectcolor1(1,1,1,0);
			self:effectcolor2(1,1,1,1);
			self:effectperiod(0.666);
		else
			--self:settext(THEME:GetString("ScreenTitleJoin","HelpTextWait"));
			self:settext("Insert Coins");
		end
	end;
	};
};

return t