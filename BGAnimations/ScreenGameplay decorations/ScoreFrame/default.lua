local t = Def.ActorFrame{
    CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
};	

--Players
for _,pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    t[#t+1] = Def.ActorFrame{
        InitCommand=cmd(zoom,0.75;x,Center1Player() and SCREEN_CENTER_X-8 or SCREEN_CENTER_X-377;y,SCREEN_CENTER_Y+332;addy,100;sleep,0;decelerate,2;addy,-100;);
		Def.ActorFrame{
			LoadActor("score_counter",pn);
		};
    };
end

return t;