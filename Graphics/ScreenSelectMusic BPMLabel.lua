return Def.ActorFrame {

	LoadActor(THEME:GetPathG("BPM", "BPMFrame"))..{
	Name="BPMDisplay";
	SetCommand=function(self) 
	self:SetFromGameState() 
		-- if GAMESTATE:IsCourseMode() or GAMESTATE:IsExtraStage()==true or GAMESTATE:IsExtraStage2()==true then
		-- self:diffuse(color("#ffffff")); 
		-- else
		-- self:diffuse(color("#000000")); 
		-- end
		
	end;
	}
};