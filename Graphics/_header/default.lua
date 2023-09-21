return Def.ActorFrame {
	LoadFont("_sf rounded pro 20px") .. {
		Name="HeaderText";
		Text=Screen.String("HeaderText");
		
		InitCommand=cmd(x,0;y,-90;zoom,0.9;shadowlengthy,2;diffuse,1,1,1,1;diffusecolor,Color("White"););
		--OnCommand=cmd(skewx,-0.125;strokecolor,Color("Outline");diffusebottomedge,color("0.875,0.875,0.875"));
		OnCommand=function(self)
			if Screen.String("HeaderText") == 'SELECT MUSIC' or Screen.String("HeaderText") == 'SELECT COURSE' then
				self:diffusealpha(0);
			else
				self:diffusealpha(1);
			end
			if Screen.String("HeaderText") == 'RESULTS' then
				self:x(-0);
			end
			if Screen.String("HeaderText") == 'SELECT COURSE MODE' then
				self:zoomx(2);
			end
			(cmd(sleep,0.2;linear,0.0833;y,4))(self);
		end;
		OffCommand=cmd(linear,0.2;y,-38);
		UpdateScreenHeaderMessageCommand=function(self,param)
			self:settext(param.Header);
		end;
	};
	

}
