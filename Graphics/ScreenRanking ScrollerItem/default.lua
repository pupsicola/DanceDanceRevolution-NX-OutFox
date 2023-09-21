local t = Def.ActorFrame{
	InitCommand=cmd(runcommandsonleaves,cmd(ztest,true));
	LoadActor("_song frame")..{
	InitCommand=cmd(zoom,0.68);
	};

	LoadFont("Common Normal")..{
		--maxwidth,264
		InitCommand=cmd(x,-292;halign,0;zoom,0.6;shadowlength,1;wrapwidthpixels,264;maxheight,58);
		SetCommand=function(self, params)
			if params.Song then
				self:settext( params.Song:GetDisplayFullTitle() );
			end
		end;
	};
};

local c
local Scores = Def.ActorFrame{
	InitCommand=function(self) c = self:GetChildren(); end;
};

for i=1,4 do
	Scores[#Scores+1] = LoadFont("Common Normal")..{
		Name="Name"..i;
		InitCommand=cmd(x,scale(i,1,4,-48,240);y,-8;zoom,0);
	};
	Scores[#Scores+1] = LoadFont("_futurist numbers metallic")..{
		Name="Score"..i;
		InitCommand=cmd(x,scale(i,1,4,-48,240);y,1;zoom,0.6);
	};
end

Scores.SetCommand=function(self,param)
	local profile = PROFILEMAN:GetMachineProfile();
	for name, child in pairs(c) do child:visible(false); end
	local sel = param.Song
	if not sel then return end

	for i, item in pairs(param.Entries) do
		if item then
			local hsl = profile:GetHighScoreList(sel, item);
			local hs = hsl and hsl:GetHighScores();

			assert(c["Name"..i])
			assert(c["Score"..i])

			c["Name"..i]:visible(true)
			c["Score"..i]:visible(true)
			if hs and #hs > 0 then
				if hs[1]:GetPercentDP()*100.0 == 100 then
					c["Name"..i]:settext( hs[1]:GetName() );
					c["Name"..i]:diffuse(color("1,1,1,1"));
					c["Score"..i]:settext( "100%" );
					c["Score"..i]:diffuse(color("1,1,1,1"));
				elseif (hs[1]:GetPercentDP()*100.0 >= 80.0) then
					c["Name"..i]:settext( hs[1]:GetName() );
					c["Name"..i]:diffuse(color("1,1,1,0.75"));
					c["Score"..i]:settext( FormatPercentScore( hs[1]:GetPercentDP() ) );
					c["Score"..i]:diffuse(color("1,1,1,0.75"));
				else
					c["Name"..i]:settext( hs[1]:GetName() );
					c["Name"..i]:diffuse(color("1,1,1,0.5"));
					c["Score"..i]:settext( FormatPercentScore( hs[1]:GetPercentDP() ) );
					c["Score"..i]:diffuse(color("1,1,1,0.5"));
				end
			else
				c["Name"..i]:settext( "---" );
				c["Name"..i]:diffuse(color("1,1,1,0.25"));
				c["Score"..i]:settext( "0%");
				c["Score"..i]:diffuse(color("1,1,1,0.25"));
			end
		end
	end
end;

t[#t+1] = Scores

return t