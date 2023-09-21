local hour, min = Hour(), Minute()

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("","clockbacking"))..{
	InitCommand=cmd(zoom,0.5;addx,-57);
	};
};

t[#t+1] = Def.ActorFrame {
	LoadFont("Common Normal")..{
	InitCommand=cmd(horizalign,right;shadowlengthy,2;zoom,0.8;addy,2.5;addx,-17-25;maxwidth,SCREEN_WIDTH;playcommand,"Update");
					UpdateCommand=function(self)
					local hour, min = Hour(), Minute()
					if hour > 12 then
						hour = hour - 12
					elseif hour == 0 then
						hour = 12
					end	
					self:settext(string.format('%02i:%02i', hour, min))
	end
	};
	LoadFont("Common Normal")..{
				Text="",
				InitCommand=cmd(x,-17;y,4;shadowlengthy,2;horizalign,right;zoom,0.6;playcommand,"Update"),
				UpdateCommand=function(self)
					local hour = Hour()
					if hour < 12 then
						self:settext("AM")
					else
						self:settext("PM")

					end
				end
			}
};

return t;