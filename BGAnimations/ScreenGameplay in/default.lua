local t = Def.ActorFrame{}

if not GAMESTATE:IsDemonstration() then

--Sound
	t[#t+1] = Def.ActorFrame {
		LoadActor("../__swooshDDRA") .. {
			OnCommand=cmd(play);
		};
	};


--White Flare

t[#t+1] = Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(Center;FullScreen;diffusecolor,Color.White;draworder,1;diffusealpha,1;linear,0.3;diffusealpha,0;);
	};
};
--White flash
t[#t+1] = LoadActor( "../_door/whiteflash" )..{
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5;linear,0.3;zoom,5);
		};


t[#t+1] = Def.ActorFrame {
		LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;draworder,500)
		};
};

t[#t+1] = LoadActor("cd")..{
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-23;zoom,1.35;sleep,1.6;decelerate,0.5;zoom,1;diffusealpha,0;);
};

end
--ScoreFrameOffAction

return t