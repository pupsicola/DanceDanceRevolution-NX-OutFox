local t = Def.ActorFrame {};

--眔籔程蔼だ计畉
local function GetBestScoreByPn(pn)
	local scoreTop=0;
	local st=GAMESTATE:GetCurrentStyle():GetStepsType();
	local song = GAMESTATE:GetCurrentSong();
	local course = GAMESTATE:GetCurrentCourse();
	local diff = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetPlayedSteps()[1]:GetDifficulty();
	local trail = GAMESTATE:GetCurrentTrail(pn);
	local curScore = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore();
	
	if (song and GAMESTATE:GetPlayMode()=='PlayMode_Regular') then
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
			local topscore=0;
			if scores[1] then
				topscore = scores[1]:GetScore();
			end;
			if(topscore == curScore) then
				if scores[2] then
					topscore = scores[2]:GetScore();
				else
					topscore = 0;
				end
			end
			scoreTop = topscore;
		else
			scoreTop=0;
		end;
	elseif course then
		if PROFILEMAN:IsPersistentProfile(pn) then
			profile = PROFILEMAN:GetProfile(pn);
		else
			profile = PROFILEMAN:GetMachineProfile();
		end;
		scorelist = profile:GetHighScoreList(course,trail);
		assert(scorelist);
		local scores = scorelist:GetHighScores();
		assert(scores);
		local topscore=0;
		if scores[1] then
			topscore = scores[1]:GetScore();
		end;
		
		if(topscore == curScore) then
			if scores[2] then
				topscore = scores[2]:GetScore();
			else
				topscore = 0;
			end
		end
		scoreTop = topscore;
		
	else
		scoreTop=0;			
	end;
	return scoreTop;
end

local function GetCurScoreByPn(pn)
	local curScore = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore();
	return curScore;
end

--逼程蔼だ计畉狾だ皌
local function arrangeScoreDiff(pn,sd,simbol,sdColor)
	local scDiffX = 0;
	local scDiffY = 0;
	local Offsetx = 176;
	if(pn == PLAYER_1) then
		scDiffX = SCREEN_CENTER_X-Offsetx;
		scDiffY = 340+9999;
	else
		scDiffX = SCREEN_CENTER_X+Offsetx+290;
		scDiffY = 340+9999;
	end
	
	return Def.ActorFrame {
			

			LoadFont("_avantgarde-book 40px")..{
				InitCommand=cmd(shadowlength,0;zoomy,0.4;zoomx,0.5;diffusealpha,0;horizalign,right);
				OffCommand=cmd(stoptweening;decelerate,0.05;diffusealpha,0;);
				OnCommand=function(self)
					self:x(scDiffX);
					self:y(scDiffY);
					local sd3 = (math.abs(sd))%1000;
					local sd2 = ((math.abs(sd))/1000)%1000;
					local sd1 = ((math.abs(sd))/1000000)%1000000;
					local sd0 = ((math.abs(sd))/1000000000)%1000000000;
					if(math.abs(sd)<=999) then
						self:settext(simbol..sd3);
					elseif (math.abs(sd)<=999999 and math.abs(sd)>=1000) then
						self:settextf(simbol.."%01d"..",".."%03d",sd2,sd3);
					elseif (math.abs(sd)<=999999999 and math.abs(sd)>=1000000) then
						self:settextf(simbol.."%01d"..",".."%03d"..",".."%03d",sd1,sd2,sd3);
					else
						self:settextf(simbol.."%01d"..",".."%03d"..",".."%03d"..",".."%03d",sd0,sd1,sd2,sd3);
					end
					self:maxwidth(200);
					self:diffuse(color(sdColor));
					self:strokecolor(color("0.2,0.2,0.2,1"));
					(cmd(addx,-200;diffusealpha,0;sleep,2.3;linear,0.2;diffusealpha,0.8;addx,200))(self);
					
				end
			};
		};
end

if (GAMESTATE:IsPlayerEnabled('PlayerNumber_P1')) then
	local sd = GetCurScoreByPn(PLAYER_1)- GetBestScoreByPn(PLAYER_1);
	if(sd == 0) then
		-- sd = GetCurScoreByPn(PLAYER_1);
		sd = 0;
	end
	local simbol = "";
	local sdColor = "";
	if sd >= 0 then
		simbol = '+';
		sdColor = "#1cd8ff";
	else
		simbol = '-';
		sdColor = "1,0.2,0.2,1";
	end
	
	t[#t+1] = arrangeScoreDiff(PLAYER_1,sd,simbol,sdColor);
end

if (GAMESTATE:IsPlayerEnabled('PlayerNumber_P2')) then
	local sd = GetCurScoreByPn(PLAYER_2) - GetBestScoreByPn(PLAYER_2);
	if(sd == 0) then
		-- sd = GetCurScoreByPn(PLAYER_2);
		sd = 0;
	end
	local simbol = "";
	local sdColor = "";
	if sd >= 0 then
		simbol = '+';
		sdColor = "#1cd8ff";
	else
		simbol = '-';
		sdColor = "1,0.2,0.2,1";
	end
	
	t[#t+1] = arrangeScoreDiff(PLAYER_2,sd,simbol,sdColor);
end

return t;