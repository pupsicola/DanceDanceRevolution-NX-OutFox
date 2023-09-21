local args = {...}
local player = args[1]
local short_plr = ToEnumShortString(player)

local rn_type = "RollingNumbers"
local data_source = "AScoring"

local metrics_prefix = "ScoreCustom"..short_plr
local loading_screen = Var "LoadingScreen"
local last_value = 0

return Def.ActorFrame{
	Def.RollingNumbers{
		Name="ScoreCounter"..short_plr,
		Font=THEME:GetPathF("_@fot-newrodin pro b", "40px"),
		InitCommand=function(s) 
			s:Load(rn_type)
			s:xy(player==PLAYER_1 and 10,-7)
			s:shadowlengthy(2)
		end,
		AfterStatsEngineMessageCommand=function(s,p)
			if p.Player == player then
				local value = p.Data[data_source].Score 
				if value~=last_value then 
					s:targetnumber(value) 
				last_value = value 
				end 
			end
		end
	},
	
};
