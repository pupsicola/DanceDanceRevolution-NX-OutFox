local t = Def.ActorFrame{};
local v = FILEMAN:DoesFileExist(GAMESTATE:GetCurrentSong():GetMusicPath():sub(1, -4).."avi")

t[#t+1] = LoadActor("nxbg")..{
InitCommand=cmd(visible,ThemePrefs.Get("NXBG") == "Auto" and v == false);

};

t[#t+1] = LoadActor("nxbg")..{
InitCommand=cmd(visible,ThemePrefs.Get("NXBG") == "On");

};

t[#t+1] = LoadActor("ScreenFilter");

return t;