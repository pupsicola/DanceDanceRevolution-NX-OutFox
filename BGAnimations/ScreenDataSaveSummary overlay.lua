local x = Def.ActorFrame{

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			SCREENMAN:GetTopScreen():Finish();
		end;
	end;

};



function SetRank02(Rank02, minValue)
	
	if minValue >=1.98 then
		Rank02 = "True God";
	elseif minValue >=1.80 then
		Rank02 = "Dazu God";
	elseif minValue >=1.60 then
		Rank02 = "God";
	elseif minValue >=1.40 then
		Rank02 = "Deity";
	elseif minValue >=1.20 then
		Rank02 = "Phoenix";
	elseif minValue >=1.00 then
		Rank02 = "Dragon";
	elseif minValue >=0.85 then
		Rank02 = "Emperor";
	elseif minValue >=0.70 then
		Rank02 = "King";
	elseif minValue >=0.55 then
		Rank02 = "Shogun";
	elseif minValue >=0.40 then
		Rank02 = "Noble";
	elseif minValue >=0.30 then
		Rank02 = "Knight";
	elseif minValue >=0.20 then
		Rank02 = "Samurai";
	elseif minValue >=0.10 then
		Rank02 = "Warrior";
	elseif minValue >0 then
		Rank02 = "Beginner";
	else
		Rank02 = "???";
		
	end
	
	return Rank02;
end


function SetRankFromRadarValue(selectRank, SingleTable, DoubleTable)
	local Rank01;
	local Rank02 = "123";

	local singleMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);
	local doubleMax = math.max(DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);
	local singleMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);
	local doubleMin = math.min(DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);
	
	local totalMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5],
								DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);

	-- local totalMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5],
								-- DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);
	
	if totalMax == SingleTable[1] or totalMax==DoubleTable[1] then
		Rank01 = "Stream";
	elseif totalMax == SingleTable[2] or totalMax==DoubleTable[2] then
		Rank01 = "Voltage";
	elseif totalMax == SingleTable[3] or totalMax==DoubleTable[3] then
		Rank01 = "Air";
	elseif totalMax == SingleTable[4] or totalMax==DoubleTable[4] then
		Rank01 = "Freeze";
	else
		Rank01 = "Chaos";
	end
	
	if (totalMax == SingleTable[1] or 
		totalMax == SingleTable[2] or 
		totalMax == SingleTable[3] or 
		totalMax == SingleTable[4] or
		totalMax == SingleTable[5]) then
	
		Rank02 = SetRank02(Rank02,singleMin);
	else
		Rank02 = SetRank02(Rank02,doubleMin);
	end
	
	if Rank02 == "???" then
		Rank01 ="???"
	end

	selectRank:settext(Rank01.." ".. Rank02);
end;





function LoadPlayerStuff(Player)
	
	local t = {};
	local pn = (Player == PLAYER_1) and 1 or 2;
	local strpn = tostring(pn);

	-- t[#t+1] = Def.ActorFrame {
		-- Name = 'JoinFrame';
		-- LoadCard(Color('Outline'),color('0,0,0,0'),Player,true);

		
		-- LoadActor( THEME:GetPathG("ScreenSelectProfile","Start") ) .. {
			-- InitCommand=cmd(shadowlength,0);
			-- OnCommand=cmd(diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5");playcommand,"Animate");
			-- AnimateCommand=cmd(smooth,0.1;zoomx,1.05;smooth,0.1;zoomx,1.0;queuecommand,"Animate");
			-- OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		-- };
		
	-- };
	
	t[#t+1] = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(),color('1,1,1,1'),Player,true);
	};
	t[#t+1] = Def.ActorFrame {
		Name = 'SmallFrame';
		InitCommand=cmd(y,96);
		
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,40;y,-70);
			OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,-90;y,-40);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,-80;y,30);
			OnCommand=cmd(diffusealpha,0;sleep,0.7;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,80;y,30);
			OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,90;y,-40);
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		
		LoadActor( THEME:GetPathG("ScreenDataSaveSummary","MyGrooveRadarBackP"..strpn) )..{
			InitCommand=cmd(zoom,0.8;y,-5;);
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.01;zoom,0;diffusealpha,0);
		};
		
		

	};

	
	
	t[#t+1] = Def.ActorFrame {
		Name = "EffectFrame";
	};
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameWBase") )..{
		Name = "FrameInstWBase";
		InitCommand=cmd(x,0;y,189;zoom,0.85);
		OnCommand=cmd(diffusealpha,0;sleep,0.55;linear,0.05;diffusealpha,1);
		OffCommand=function(self)
		(cmd(stoptweening;sleep,0.5;linear,0.05;;diffusealpha,0))(self);
		end;
	};
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameSKIP") )..{
		Name = "FrameInstWord";
		InitCommand=cmd(x,0;y,189;zoom,0.85);
		OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.3;diffusealpha,1);
		OffCommand=function(self)
		(cmd(stoptweening;linear,0.05;;diffusealpha,0))(self);
		end;
	};
	
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'SelectedProfileText';
		InitCommand=cmd(horizalign,left;x,-112;y,-137;zoomx,0.45;zoomy,0.35;shadowlength,1;diffuse,color("1,1,1,0");strokecolor,Color("Outline");maxwidth,370);
		OnCommand=cmd(sleep,0.8;linear,0.5;diffusealpha,1);
		OffCommand=cmd(stoptweening;linear,0.01;zoomy,0;diffusealpha,0);
	};
	
	t[#t+1] = LoadFont("enjoy number") .. {
		Name = 'SelectedProfileLevel';
		InitCommand=cmd(x,-90;y,-42;zoom,0;diffuse,color("1,1,1,1"));
		OnCommand=cmd(sleep,0.7;linear,0.05;diffusealpha,1;zoomy,1;zoomx,1);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectedTotalCaloriesBurned';
		InitCommand=cmd(x,80;y,-38;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,350);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.3;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectSongsPlayed';
		InitCommand=cmd(x,50;y,-112;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,150);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.4;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectHonorName';
		InitCommand=cmd(horizalign,center;skewx,-0.35;x,85;y,-129;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.8,1");strokecolor,Color("Outline");maxwidth,200);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.28;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	

	
	t[#t+1] = Def.Sprite{
		Name = 'selectedMostSongPlayed';
		InitCommand=cmd(x,65;y,-32;zoom,0;scaletoclipped,40,40);
		OnCommand=cmd(sleep,1.9;linear,0.05;diffusealpha,1;diffuse,color("1,1,1,1");zoom,1;);
		OffCommand=cmd(stoptweening;linear,0.1;scaletoclipped,0,0;);
	};
	
	t[#t+1] = Def.Sprite{
		Name = 'selectedHonorPic';
		InitCommand=cmd(x,30;y,-137;zoom,0;scaletoclipped,0,0;);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;scaletoclipped,30,30;);
		OffCommand=cmd(stoptweening;linear,0.1;scaletoclipped,0,0;);
	};
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBar") ) .. {
			Name = 'selectLvBarBack';
			InitCommand=cmd(diffusealpha,0;y,1;x,0;zoom,1;zoomy,0.2);
			OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.3;diffusealpha,1;diffuse,color("0.4,0.4,0.4,1"));
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			
	};
	
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBar") ) .. {
			Name = 'selectLvBar';
			InitCommand=cmd(diffusealpha,0;y,1;x,0;cropright,1;zoom,1;zoomy,0.2);
			OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.3;diffusealpha,1;);
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			
		};
	t[#t+1]=LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectTotalAttackrateWord';
		InitCommand=cmd(x,-10;y,-62;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,320);
		OnCommand=function(self)
			self:settext(" ");
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.15;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
		t[#t+1]=LoadFont("_helveticaneuelt pro 75 bd 60px") .. { --*****************************************************************************************************
		Name = 'LVTitle';
		InitCommand=cmd(x,-60;y,-67;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");horizalign,left);
		OnCommand=function(self)
			self:settext("Dance LV.");
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.18;zoomx,0.18))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'SPLVTitle';
		InitCommand=cmd(x,5;y,-67;zoom,0;diffuse,color("#12cff2");strokecolor,Color("#12cff2");horizalign,left);
		OnCommand=function(self)
			if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
				self:settext("SP");
			else
				self:settext(" ");
			end
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.18;zoomx,0.18))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'DPLVTitle';
		InitCommand=cmd(x,60;y,-67;zoom,0;diffuse,color("#f253ed");strokecolor,Color("#f253ed");horizalign,left);
		OnCommand=function(self)
			if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Double" then
				self:settext("DP");
				self:x(5);
			else
				self:settext(" ");
			end
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.18,zoomx,0.18))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};    

if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'SPLVOld';
		InitCommand=cmd(x,32;y,-67;zoom,0;diffuse,color("1,1,1,0.7");diffusebottomedge,color("0.3,0.3,0.1,1");strokecolor,Color("Outline");maxwidth,100);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.2;zoomx,0.25;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'SPLV';
		InitCommand=cmd(x,87;y,-67;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,100);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.35;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
else
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'DPLVOld';
		InitCommand=cmd(x,32;y,-67;zoom,0;diffuse,color("1,1,1,0.7");diffusebottomedge,color("0.3,0.3,0.1,1");strokecolor,Color("Outline");maxwidth,100);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.2;zoomx,0.25;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};	
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'DPLV';
		InitCommand=cmd(x,87;y,-67;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,100);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.35;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
		
end	

	t[#t+1] = Def.Sprite{
		Name = 'DanceLVArrow';
		InitCommand=cmd(x,57;y,-67;zoom,0;scaletoclipped,0,0;);
		OnCommand=cmd(zoom,0;sleep,0.95;linear,0.05;zoom,1;scaletoclipped,15,10;);
		OffCommand=cmd(stoptweening;linear,0.1;scaletoclipped,0,0;);
	};
	
	                                 --*****************************************************************************************************
	
	

	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectPercentComplete';
		InitCommand=cmd(x,65;y,-62;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,220);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.35;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectTotalCalWord';
		InitCommand=cmd(x,-10;y,-38;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,320);
		OnCommand=function(self)
			self:settext("Today Burned / ");
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.15;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_helveticaneuelt pro 65 md 60px") .. {
		Name = 'selectRank';
		InitCommand=cmd(x,25;y,-15;skewx,-0.35;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,350);
		OnCommand=function(self)
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.25;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	
	t[#t+1] = LoadFont("_helveticaneuelt pro 75 bd 60px") .. {
		Name = 'selectPlayerUID';
		InitCommand=cmd(x,35;y,-106;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.9,1");strokecolor,Color("Outline");maxwidth,420);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.45;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	

	t[#t+1] =LoadFont("_sf rounded pro 20px") .. {
		InitCommand=cmd(x,0;y,-186;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,270;shadowlength,1);
		OnCommand=function(self)
			if Player== PLAYER_1 then
				self:settext("PLAYER:1");
				self:diffuse(ColorLightTone(PlayerColor(PLAYER_1)));
			else
				self:settext("PLAYER:2");
				self:diffuse(PlayerColor(PLAYER_2));
			end
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.8;zoomx,1.35))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};	
	
	----MyGrooveRadar
	if (Player == PLAYER_1) then ---------------P1
		------New MyGrooveRadar
		if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP1" ),0,0,0,0,0,1,0)..{  --00000/Style/IsPastValue ::  Single=1 Double=2 IsPastValue=0 or 1
				Name = "GVRD1";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,Color("Yellow"));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		else
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP1" ),1,0.2,0.2,0.2,0.5,2,0)..{
				Name = "GVRD1";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,Color("Yellow"));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		end
		
		
		
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_N1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_N2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_N3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_N4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_N5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		
		
		--Old My Groove Radar
		if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP1" ),0,0,0,0,0,1,1)..{  --00000/Style/IsPastValue ::  Single=1 Double=2 IsPastValue=0 or 1
				Name = "GVRD1P";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,ColorLightTone(PlayerColor(PLAYER_1),2.5));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		else
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP1" ),0,0,0,0,0,2,1)..{
				Name = "GVRD1P";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,ColorLightTone(PlayerColor(PLAYER_1),2.5));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		end
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_O1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_O2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_O3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_O4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_O5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		
		
		
	else -----------P2
				------New MyGrooveRadar
		if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP2" ),0,0,0,0,0,1,0)..{  --00000/Style/IsPastValue ::  Single=1 Double=2 IsPastValue=0 or 1
				Name = "GVRD2";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,Color("Yellow"));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		else
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP2" ),1,0.2,0.2,0.2,0.5,2,0)..{
				Name = "GVRD2";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,Color("Yellow"));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		end
		
		
		
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_N1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_N2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_N3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_N4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_N5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,Color("Yellow");strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		
		
		--Old My Groove Radar
		if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP2" ),0,0,0,0,0,1,1)..{  --00000/Style/IsPastValue ::  Single=1 Double=2 IsPastValue=0 or 1
				Name = "GVRD2P";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,ColorLightTone(PlayerColor(PLAYER_2),2.5));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		else
			t[#t+1] = LoadActor( THEME:GetPathG("ScreenDataSaveSummary", "GrooveRadarP2" ),0,0,0,0,0,2,1)..{
				Name = "GVRD2P";
				InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,ColorLightTone(PlayerColor(PLAYER_2),2.5));
				OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
				OffCommand=cmd(linear,0.05;diffusealpha,0);
			};
		end
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_O1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_O2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_O3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_O4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_O5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		
	end;
	
	

	return t;
end;

--Update Internal Stuff
function UpdateInternal(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local style = (GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single") and "S" or "D";
	local seltext = self:GetChild('SelectedProfileText');
	local joinframe = self:GetChild('JoinFrame');
	local smallframe = self:GetChild('SmallFrame');
	local bigframe = self:GetChild('BigFrame');
	local selLevel = self:GetChild('SelectedProfileLevel');
	local selTotalCaloriesBurned = self:GetChild('selectedTotalCaloriesBurned');
	local selectRank = self:GetChild('selectRank');
	local selectPlayerUID = self:GetChild('selectPlayerUID');
	local selMostSongPlayed = self:GetChild('selectedMostSongPlayed');
	local selHonorPic = self:GetChild('selectedHonorPic');
	local selHonorName = self:GetChild('selectHonorName');
	local selSongsPlayed = self:GetChild('selectSongsPlayed');
	local selLvBar = self:GetChild('selectLvBarBack');
	local selLvBar = self:GetChild('selectLvBar');
	local selPercentComplete = self:GetChild('selectPercentComplete');
	local selTotalAttackrateWord = self:GetChild('selectTotalAttackrateWord');
	local LVTitle = self:GetChild('LVTitle');
	local SPLVTitle = self:GetChild('SPLVTitle');
	local DPLVTitle = self:GetChild('DPLVTitle');
	local SPLV = self:GetChild('SPLV');
	local SPLVOld = self:GetChild('SPLVOld');
	local DPLV = self:GetChild('DPLV');
	local DPLVOld = self:GetChild('DPLVOld');
	local DanceLVArrow = self:GetChild('DanceLVArrow');
	local selPlayerUID;
	local selGVRD = (Player == PLAYER_1) and self:GetChild('GVRD1') or self:GetChild('GVRD2');
	local selGVRDP = (Player == PLAYER_1) and self:GetChild('GVRD1P') or self:GetChild('GVRD2P');
	local selGVRDValue_N1 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_N1') or self:GetChild('GVRD2Value_N1');
	local selGVRDValue_N2 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_N2') or self:GetChild('GVRD2Value_N2');
	local selGVRDValue_N3 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_N3') or self:GetChild('GVRD2Value_N3');
	local selGVRDValue_N4 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_N4') or self:GetChild('GVRD2Value_N4');
	local selGVRDValue_N5 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_N5') or self:GetChild('GVRD2Value_N5');
	local selGVRDValue_O1 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_O1') or self:GetChild('GVRD2Value_O1');
	local selGVRDValue_O2 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_O2') or self:GetChild('GVRD2Value_O2');
	local selGVRDValue_O3 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_O3') or self:GetChild('GVRD2Value_O3');
	local selGVRDValue_O4 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_O4') or self:GetChild('GVRD2Value_O4');
	local selGVRDValue_O5 = (Player == PLAYER_1) and self:GetChild('GVRD1Value_O5') or self:GetChild('GVRD2Value_O5');
	
	selPlayerUID = PROFILEMAN:GetProfile(Player):GetGUID();
				
				selectPlayerUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));
				local RadarFile = RageFileUtil:CreateRageFile()
				
				--New Radar Value
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."1.txt",1) then --Stram--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_N1:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_N1:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."2.txt",1) then --Voltage--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_N2:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_N2:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."3.txt",1) then --Air--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_N3:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_N3:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."4.txt",1) then --Freeze--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_N4:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_N4:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."5.txt",1) then --Chaos--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_N5:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_N5:settext("0");
				end
				
				--Old Radar Value
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."1P.txt",1) then --Stream--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_O1:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_O1:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."2P.txt",1) then --Voltage--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_O2:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_O2:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."3P.txt",1) then --Air--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_O3:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_O3:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."4P.txt",1) then --Freeze--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_O4:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_O4:settext("0");
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_"..style.."5P.txt",1) then --Chaos--
					local str = RadarFile:Read();
					CurrentValue = tonumber(str);
					selGVRDValue_O5:settext(string.format("%0.1f", CurrentValue*100));
				else
					selGVRDValue_O5:settext("0");
				end

				RadarFile:Close();
				
				------Calculate Rank
				local RadarValueTableSingle = {};
				local RadarValueTableDouble = {};
				
				----------Single Radar 
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_S1.txt",1) then --Stram--
					local str = RadarFile:Read();
					RadarValueTableSingle[1] = tonumber(str);
				else
					RadarValueTableSingle[1] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_S2.txt",1) then --Voltage--
					local str = RadarFile:Read();
					RadarValueTableSingle[2] = tonumber(str);
				else
					RadarValueTableSingle[2] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_S3.txt",1) then --Air--
					local str = RadarFile:Read();
					RadarValueTableSingle[3] = tonumber(str);
				else
					RadarValueTableSingle[3] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_S4.txt",1) then --Freeze--
					local str = RadarFile:Read();
					RadarValueTableSingle[4] = tonumber(str);
				else
					RadarValueTableSingle[4] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_S5.txt",1) then --Chaos--
					local str = RadarFile:Read();
					RadarValueTableSingle[5] = tonumber(str);
				else
					RadarValueTableSingle[5] = 0;
				end
				
				----------Double Radar 
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_D1.txt",1) then --Stram--
					local str = RadarFile:Read();
					RadarValueTableDouble[1] = tonumber(str);
				else
					RadarValueTableDouble[1] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_D2.txt",1) then --Voltage--
					local str = RadarFile:Read();
					RadarValueTableDouble[2] = tonumber(str);
				else
					RadarValueTableDouble[2] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_D3.txt",1) then --Air--
					local str = RadarFile:Read();
					RadarValueTableDouble[3] = tonumber(str);
				else
					RadarValueTableDouble[3] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_D4.txt",1) then --Freeze--
					local str = RadarFile:Read();
					RadarValueTableDouble[4] = tonumber(str);
				else
					RadarValueTableDouble[4] = 0;
				end
				if RadarFile:Open("Save/MyGrooveRadar/"..selPlayerUID.."_D5.txt",1) then --Chaos--
					local str = RadarFile:Read();
					RadarValueTableDouble[5] = tonumber(str);
				else
					RadarValueTableDouble[5] = 0;
				end
				
				RadarFile:Close();
				
				--***********************************************
				local LVSingle = 0;
				local LVSingleOld = 0;
				local LVDouble = 0;
				local LVDoubleOld = 0;
				
				local DanceLVFile = RageFileUtil:CreateRageFile()
				
				if GAMESTATE:GetCurrentStyle():GetStepsType() == "StepsType_Dance_Single" then
					if DanceLVFile:Open("Save/DanceLV/"..selPlayerUID.."_SP.txt",1) then --SPLV--
						local str = DanceLVFile:Read();
						CurrentValue = tonumber(str);
						SPLV:settext(string.format("%0.2f", CurrentValue*10));
						LVSingle=CurrentValue;
						DanceLVFile:Close();
					else
						SPLV:settext("0.0");
					end
					if DanceLVFile:Open("Save/DanceLV/"..selPlayerUID.."_SP_Old.txt",1) then --SPLV--
						local str = DanceLVFile:Read();
						CurrentValue = tonumber(str);
						SPLVOld:settext(string.format("%0.2f", CurrentValue*10));
						LVSingleOld=CurrentValue;
						DanceLVFile:Close();
					else
						SPLVOld:settext("0.0");
					end
					
					if LVSingle > LVSingleOld then
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVUpArrow")); 	
					elseif LVSingle < LVSingleOld then
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVDownArrow")); 	
					else
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVFlatArrow")); 
					end
					
					
				else
					if DanceLVFile:Open("Save/DanceLV/"..selPlayerUID.."_DP.txt",1) then --DPLV--
						local str = DanceLVFile:Read();
						CurrentValue = tonumber(str);
						DPLV:settext(string.format("%0.2f", CurrentValue*10));
						LVDouble=CurrentValue;
						DanceLVFile:Close();
					else
						DPLV:settext("0.0");
					end
					if DanceLVFile:Open("Save/DanceLV/"..selPlayerUID.."_DP_Old.txt",1) then --DPLV--
						local str = DanceLVFile:Read();
						CurrentValue = tonumber(str);
						DPLVOld:settext(string.format("%0.2f", CurrentValue*10));
						LVDoubleOld=CurrentValue;
						DanceLVFile:Close();
					else
						DPLVOld:settext("0.0");
					end
					if LVDouble > LVDoubleOld then
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVUpArrow")); 	
					elseif LVDouble < LVDoubleOld then
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVDownArrow")); 	
					else
						DanceLVArrow:Load(THEME:GetPathG("ScreenSelectProfile","DanceLVFlatArrow")); 
					end
				end
				
				
	
				local PcntCompleteSingle = PROFILEMAN:GetProfile(Player):GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Single');
				local PcntCompleteDouble = PROFILEMAN:GetProfile(Player):GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Double');
				--HonorName
				
				if LVSingle>LVDouble then
					PcntLarger = LVSingle;
				else 
					PcntLarger = LVDouble;
				end
				PcntLarger = PcntLarger*100;
				
				if PcntLarger==0 then
					selHonorName:settext('--');
					selHonorPic:Load(THEME:GetPathB("","_ability/000"));
				elseif PcntLarger>=0 and PcntLarger<10 then
					selHonorName:settext('stone');
					if PcntLarger >8 then selHonorPic:Load(THEME:GetPathB("","_ability/008")); 
					elseif PcntLarger >6 then selHonorPic:Load(THEME:GetPathB("","_ability/006")); 
					elseif PcntLarger >4 then selHonorPic:Load(THEME:GetPathB("","_ability/004"));
					elseif PcntLarger >2 then selHonorPic:Load(THEME:GetPathB("","_ability/002")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/000")); 					
					end
				elseif PcntLarger>=10 and PcntLarger<20 then
					selHonorName:settext('soap bubble');
					if PcntLarger >18 then selHonorPic:Load(THEME:GetPathB("","_ability/018")); 
					elseif PcntLarger >16 then selHonorPic:Load(THEME:GetPathB("","_ability/016")); 
					elseif PcntLarger >14 then selHonorPic:Load(THEME:GetPathB("","_ability/014"));
					elseif PcntLarger >12 then selHonorPic:Load(THEME:GetPathB("","_ability/012")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/010")); 					
					end
				elseif PcntLarger>=20 and PcntLarger<30 then
					selHonorName:settext('pencil');
					if PcntLarger >28 then selHonorPic:Load(THEME:GetPathB("","_ability/028")); 
					elseif PcntLarger >26 then selHonorPic:Load(THEME:GetPathB("","_ability/026")); 
					elseif PcntLarger >24 then selHonorPic:Load(THEME:GetPathB("","_ability/024"));
					elseif PcntLarger >22 then selHonorPic:Load(THEME:GetPathB("","_ability/022")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/020")); 					
					end
				elseif PcntLarger>=30 and PcntLarger<40 then
					selHonorName:settext('macaron');
					if PcntLarger >38 then selHonorPic:Load(THEME:GetPathB("","_ability/038")); 
					elseif PcntLarger >36 then selHonorPic:Load(THEME:GetPathB("","_ability/036")); 
					elseif PcntLarger >34 then selHonorPic:Load(THEME:GetPathB("","_ability/034"));
					elseif PcntLarger >32 then selHonorPic:Load(THEME:GetPathB("","_ability/032")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/030")); 					
					end
				elseif PcntLarger>=40 and PcntLarger<50 then
					selHonorName:settext('lotus');
					if PcntLarger >48 then selHonorPic:Load(THEME:GetPathB("","_ability/048")); 
					elseif PcntLarger >46 then selHonorPic:Load(THEME:GetPathB("","_ability/046")); 
					elseif PcntLarger >44 then selHonorPic:Load(THEME:GetPathB("","_ability/044"));
					elseif PcntLarger >42 then selHonorPic:Load(THEME:GetPathB("","_ability/042")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/040")); 					
					end
				elseif PcntLarger>=50 and PcntLarger<60 then
					selHonorName:settext('beetle');
					if PcntLarger >58 then selHonorPic:Load(THEME:GetPathB("","_ability/058")); 
					elseif PcntLarger >56 then selHonorPic:Load(THEME:GetPathB("","_ability/056")); 
					elseif PcntLarger >54 then selHonorPic:Load(THEME:GetPathB("","_ability/054"));
					elseif PcntLarger >52 then selHonorPic:Load(THEME:GetPathB("","_ability/052")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/050")); 					
					end
				elseif PcntLarger>=60 and PcntLarger<70 then
					selHonorName:settext('jellyfish');
					if PcntLarger >68 then selHonorPic:Load(THEME:GetPathB("","_ability/068")); 
					elseif PcntLarger >66 then selHonorPic:Load(THEME:GetPathB("","_ability/066")); 
					elseif PcntLarger >64 then selHonorPic:Load(THEME:GetPathB("","_ability/064"));
					elseif PcntLarger >62 then selHonorPic:Load(THEME:GetPathB("","_ability/062")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/060")); 					
					end
				elseif PcntLarger>=70 and PcntLarger<80 then
					selHonorName:settext('hummingbird');
					if PcntLarger >78 then selHonorPic:Load(THEME:GetPathB("","_ability/078")); 
					elseif PcntLarger >76 then selHonorPic:Load(THEME:GetPathB("","_ability/076")); 
					elseif PcntLarger >74 then selHonorPic:Load(THEME:GetPathB("","_ability/074"));
					elseif PcntLarger >72 then selHonorPic:Load(THEME:GetPathB("","_ability/072")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/070")); 					
					end
				elseif PcntLarger>=80 and PcntLarger<90 then
					selHonorName:settext('kaleidoscope');
					if PcntLarger >88 then selHonorPic:Load(THEME:GetPathB("","_ability/088")); 
					elseif PcntLarger >86 then selHonorPic:Load(THEME:GetPathB("","_ability/086")); 
					elseif PcntLarger >84 then selHonorPic:Load(THEME:GetPathB("","_ability/084"));
					elseif PcntLarger >82 then selHonorPic:Load(THEME:GetPathB("","_ability/082")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/080")); 					
					end
				elseif PcntLarger>=90 and PcntLarger<100 then
					selHonorName:settext('prism');
					if PcntLarger >98 then selHonorPic:Load(THEME:GetPathB("","_ability/098")); 
					elseif PcntLarger >96 then selHonorPic:Load(THEME:GetPathB("","_ability/096")); 
					elseif PcntLarger >94 then selHonorPic:Load(THEME:GetPathB("","_ability/094"));
					elseif PcntLarger >92 then selHonorPic:Load(THEME:GetPathB("","_ability/092")); 
					else selHonorPic:Load(THEME:GetPathB("","_ability/090")); 					
					end
				elseif PcntLarger>=100  then
					selHonorName:settext('prism');
					selHonorPic:Load(THEME:GetPathB("","_ability/100"));
				end
				selHonorPic:shadowlength(1);
				
				local Lv = (math.ceil(math.sqrt(PROFILEMAN:GetProfile(Player):GetTotalCaloriesBurned())));
				local pcnt =((PROFILEMAN:GetProfile(Player):GetTotalCaloriesBurned())-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				local totalPcnt = (PcntCompleteSingle + PcntCompleteDouble) / 2;
					--totalPcnt = PcntLarger;				
				--local pcnt =((PROFILEMAN:GetProfile(Player):GetTotalCaloriesBurned())-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				bigframe:visible(true);
				seltext:settext(PROFILEMAN:GetProfile(Player):GetDisplayName());
				selLevel:settext(math.ceil(math.sqrt(PROFILEMAN:GetProfile(Player):GetTotalCaloriesBurned())) );
				selTotalCaloriesBurned:settext((math.ceil(PROFILEMAN:GetProfile(Player):GetCaloriesBurnedToday()))..' kCals.');
				selMostSongPlayed:Load(GetSongGPath(PROFILEMAN:GetProfile(Player):GetLastPlayedSong()));
				selMostSongPlayed:visible(false);
				--selSongsPlayed:settext(tostring(math.ceil(PROFILEMAN:GetProfile(Player):GetNumTotalSongsPlayed())));
				(cmd(linear,0.5;diffusealpha,1;decelerate,1.5;cropright,1-pcnt))(selLvBar);
				--selLvBar:cropright(1-pcnt);
				selPercentComplete:settext("");
				--selPercentComplete:settext(string.format("%6.2f", PcntLarger).." %");
				
				
				
				-----Rank From Radar Value
				SetRankFromRadarValue(selectRank,RadarValueTableSingle,RadarValueTableDouble);
	
end

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
x[#x+1] = Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y;zoom,1.5);
			OnCommand=function(self)
				UpdateInternal(self, PLAYER_1);
			end;
			OffCommand=cmd();
			children = LoadPlayerStuff(PLAYER_1);
		};
end
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
x[#x+1] = Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+260;y,SCREEN_CENTER_Y;zoom,1.5);
			OnCommand=function(self)
				UpdateInternal(self, PLAYER_2);
			end;
			OffCommand=cmd();
			children = LoadPlayerStuff(PLAYER_2);
		};
end


return x;