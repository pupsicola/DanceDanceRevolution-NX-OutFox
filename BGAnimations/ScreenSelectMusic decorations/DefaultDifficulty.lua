local t = Def.ActorFrame {};
local function GetEdits( in_Song, in_StepsType )
	if in_Song then
		local sSong = in_Song;
		local sCurrentStyle = GAMESTATE:GetCurrentStyle();
		local sStepsType = in_StepsType;
		local iNumEdits = 0;
		if sSong:HasEdits( sStepsType ) then
			local tAllSteps = sSong:GetAllSteps();
			for i,Step in pairs(tAllSteps) do
				if Step:IsAnEdit() and Step:GetStepsType() == sStepsType then
					iNumEdits = iNumEdits + 1;
				end
			end
			return iNumEdits;
		else
			return iNumEdits;
		end
	else
		return 0;
	end
end;
t[#t+1] = Def.ActorFrame {
	-- LoadActor("_Background");
};
--

-- Set a fixed list of difficulties to go through.
local DiffList = {
	"Difficulty_Beginner",
	"Difficulty_Easy",
	"Difficulty_Medium",
	"Difficulty_Hard",
	"Difficulty_Challenge",
	"Difficulty_Edit"
}
for idx,diff in pairs(DiffList) do
	local sDifficulty = ToEnumShortString( diff );
	local eachHeight = 23;
	local tLocation = {
		Beginner	= eachHeight*0,
		Easy 		= eachHeight*0.9,
		Medium		= eachHeight*1.81,
		Hard		= eachHeight*2.72,
		Challenge	= eachHeight*3.64,
		Edit 		= eachHeight*4.56,
	};
	-- Outfox note:
	-- There are 18 different difficulties available. So, if these are not defined in tLocation, it will fail.
	-- So for now, prevent loading of those.
	local diffLocationY = tLocation[sDifficulty] or tLocation["Edit"]
	t[#t+1] = Def.ActorFrame {
		SetCommand=function(self)
			local c = self:GetChildren();
			local song = GAMESTATE:GetCurrentSong()
			local bHasStepsTypeAndDifficulty = false;
			local meter = "00";
			if song then
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				bHasStepsTypeAndDifficulty = song:HasStepsTypeAndDifficulty( st, diff );
				local steps = song:GetOneSteps( st, diff );
				if steps then
					meter = steps:GetMeter();
					append = ""
				end
			else
				meter=0;
			end
			
		    c.Meter:settextf( "%01d", meter );
			local curDiff1;
			local curDiff2;
			if GAMESTATE:IsPlayerEnabled(PLAYER_1) then 
				 curDiff1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
			else
				self:visible(0);
			end
			
			
			
			if bHasStepsTypeAndDifficulty then
				if curDiff1==diff or curDiff2==diff then
					self:playcommand("Show");
				else
					self:playcommand("UnSelect");
					
				end
			else
				self:playcommand("Hide");
			end


		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");

--		LoadActor("cursorglow")..{--��ܪ����w
--			ShowCommand=cmd(stoptweening;zoom,1.2;linear,0.2;diffusealpha,1;zoomy,0.78;zoomx,1);
--			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffusealpha,0);
--			InitCommand=cmd(x,28;y,tLocation[sDifficulty];shadowlengthy,1;zoom,1;diffuseshift;effectcolor2,color("1,1,1,0.5");effectcolor1,color("1,1,1,1"));
--			UnSelectCommand=cmd(stoptweening;decelerate,0.2;diffusealpha,0;zoom,1.2);
--		};

		LoadActor("StepsDisplay ticks")..{--���ϼ�
			Name="Meter";
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,CustomDifficultyToColor( sDifficulty ););
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,color( "0.5,0.5,0.5,0.5"));
			InitCommand=cmd(x,0-76;y,diffLocationY+1.3;shadowlengthy,2;zoom,0.44;);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,CustomDifficultyToColor( sDifficulty ));
		};
		
		LoadFont("_sf rounded pro 28px") .. { --���״y�z
			Name="Meter";
			Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
			ShowCommand=cmd(stoptweening;linear,0.1;;diffuse,color("1,1,1,1");strokecolor, color( "0,0,0,0" );zoomx,0.40);
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,color( "0.5,0.5,0.5,0.5" );zoomx,0.40);
			InitCommand=cmd(horizalign,left;x,0-70;y,diffLocationY+2;shadowlengthy,2;zoomx,0.40;zoomy,0.4);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,color("1,1,1,1");strokecolor, color( "0,0,0,0" );zoomx,0.40);
		};

		
		LoadFont("_sf rounded pro 28px") .. { --�Ʀr
			Name="Meter";
			Text="0";
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,color( "1,1,1,1" );strokecolor, color( "0,0,0,1" ));
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,color( "0.5,0.5,0.5,0.5" );strokecolor, color( "0.1,0.1,0.1,0.5" ));
			InitCommand=cmd(x,0-85;y,diffLocationY+2;shadowlengthy,2;zoom,0.45;strokecolor,CustomDifficultyToDarkColor(sDifficulty));
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,2;diffuse,color( "1,1,1,1" );strokecolor, color( "0,0,0,1" ));
		};
		

		OffCommand=cmd(linear,0.5;diffusealpha,0;);
	};
	t[#t+1] = Def.ActorFrame {
		SetCommand=function(self)
			local c = self:GetChildren();
			local song = GAMESTATE:GetCurrentSong()
			local bHasStepsTypeAndDifficulty = false;
			
			local meter = "00";
			if song then
				local st = GAMESTATE:GetCurrentStyle():GetStepsType()
				bHasStepsTypeAndDifficulty = song:HasStepsTypeAndDifficulty( st, diff );
				local steps = song:GetOneSteps( st, diff );
				if steps then
					meter = steps:GetMeter();
					append = ""
				end
			else
				meter="00";
			end
			
		    c.Meter:settextf( "%01d", meter );
			--c.Only1Meter:settextf( "%01d", meter );
			--c.Meter:settext(meter );
			local curDiff1;
			local curDiff2;
			
			if GAMESTATE:IsPlayerEnabled(PLAYER_2) then 
				curDiff2 = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty();
			else
				self:visible(0);
			end
			
			
			if bHasStepsTypeAndDifficulty then
				if curDiff1==diff or curDiff2==diff then
					self:playcommand("Show");
				else
					self:playcommand("UnSelect");
				end
			else
				self:playcommand("Hide");
			end

		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(queuecommand,"Set");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");

		
		--���ϼ�

		--��ܪ����
		
		--Difficulty Number Strings
		LoadActor("StepsDisplay ticks")..{
			Name="Meter";
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,CustomDifficultyToColor( sDifficulty );zoomx,2.5);
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color( "0.5,0.5,0.5,0.5");zoomx,0);
			InitCommand=cmd(x,13-99410;y,diffLocationY+0.2;shadowlengthy,1;zoomy,0.45;zoomx,2.5);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,CustomDifficultyToColor( sDifficulty );zoomx,0);
		};

		--Difficulty Name Strings
		LoadFont("_sf rounded pro 28px") .. {
			Name="Meter";
			Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
			--ShowCommand=cmd(stoptweening;linear,0.1;diffuse,CustomDifficultyToColor( sDifficulty );strokecolor,CustomDifficultyToDarkColor(sDifficulty);zoomx,0.40);
			ShowCommand=cmd(stoptweening;linear,0.1;;diffuse,color("1,1,1,1");strokecolor, color( "0,0,0,0" );zoomx,0.40);
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color( "0.5,0.5,0.5,0.5" );strokecolor, color( "0.1,0.1,0.1,0.5" );zoomx,0.40);
			InitCommand=cmd(horizalign,left;x,42+370+2-168;y,diffLocationY;shadowlengthy,1;zoomx,0.40;zoomy,0.4);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color("1,1,1,1");strokecolor, color( "0,0,0,0" );zoomx,0.40);
		};

		
		LoadFont("_sf rounded pro 28px") .. {
			Name="Meter";
			Text="0"; --(sDifficulty == "Edit") and "0 Edits" or "0";
			--ShowCommand=cmd(stoptweening;linear,0.1;diffuse,color( "1,1,1,1" );strokecolor,CustomDifficultyToDarkColor(sDifficulty));
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,color( "1,1,1,1" );strokecolor, color( "0,0,0,1" ));
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color( "0.5,0.5,0.5,0.5" );strokecolor, color( "0.1,0.1,0.1,0.5" ));
			InitCommand=cmd(x,-28+377-41.5;y,diffLocationY-7;shadowlengthy,1;zoomx,0.75;zoomy,0.8;strokecolor,CustomDifficultyToDarkColor(sDifficulty));
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1.1;diffuse,color( "1,1,1,1" );strokecolor, color( "0,0,0,1" ));
		};
		
		LoadFont("_sf rounded pro 28px") .. {--only 1 ���״y�z
			Name="Diff";
			Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,CustomDifficultyToColor( sDifficulty );shadowlengthy,1;zoomx,1.25);
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color( "0.5,0.5,0.5,0" );strokecolor, color( "0.1,0.1,0.1,0" );zoomx,1.20);
			InitCommand=cmd(x,99230;y,0;shadowlengthy,1;zoomx,1.20;zoomy,1.2;);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1.1;diffuse,color( "0.52,0.52,0.52,0" );strokecolor, color( "0.15,0.15,0.15,0" );zoomx,1.20);
		};
		
		LoadFont("_sf rounded pro 28px") .. {--only 1 �Ʀr
			Name="Only1Meter";
			Text="0"; --(sDifficulty == "Edit") and "0 Edits" or "0";
			ShowCommand=cmd(stoptweening;linear,0.1;diffuse,color( "0,0,0,1" );shadowlengthy,1.1;);
			HideCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1;diffuse,color( "0.5,0.5,0.5,0" );strokecolor, color( "0.1,0.1,0.1,0" ));
			InitCommand=cmd(x,99230;y,80;shadowlengthy,1;zoomx,0.95;zoomy,0.95;shadowlengthy,1.1;);
			UnSelectCommand=cmd(stoptweening;decelerate,0.2;shadowlengthy,1.1;diffuse,color( "0.70,0.70,0.70,0" );strokecolor, color( "0.15,0.15,0.15,0" ));
		};
		OffCommand=cmd(linear,0.5;diffusealpha,0;);
	};
	
end
return t