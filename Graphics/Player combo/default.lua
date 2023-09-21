local c;
local cf;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");
local LowerJudge={0,0};
local p=((player=='PlayerNumber_P1') and 1 or 2);

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = THEME:GetMetric("Combo", "LabelMinZoom");
local LabelMaxZoom = THEME:GetMetric("Combo", "LabelMaxZoom");

local t = Def.ActorFrame {
	Def.ActorFrame {
		Name="ComboFrame";
		LoadFont( "combo", "marv" ) .. {
			Name="NumberW1";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "perf" ) .. {
			Name="NumberW2";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "great" ) .. {
			Name="NumberW3";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadFont( "combo", "normal") .. {
			Name="NumberNormal";
			OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
		};
		LoadActor("_combomarv") .. {
			Name="LabelW1";
			--InitCommand = cmd(zoomx,3);
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_comboperfect") .. {
			Name="LabelW2";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_combogreat") .. {
			Name="LabelW3";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
		LoadActor("_combonormal") .. {
			Name="LabelNormal";
			OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
		};
	};
	InitCommand = function(self)
		c = self:GetChildren();
		cf = c.ComboFrame:GetChildren();
		cf.NumberW1:visible(false);
		cf.NumberW2:visible(false);
		cf.NumberW3:visible(false);
		cf.NumberNormal:visible(false);
		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(false);
		LowerJudge[p]=0;
	end;
	JudgmentMessageCommand = function(self,params)
		if params.Player ~= player then return end;
		if params.TapNoteScore=='TapNoteScore_W1' and LowerJudge[p]<1 then
			LowerJudge[p]=1;
		elseif params.TapNoteScore=='TapNoteScore_W2' and LowerJudge[p]<2 then
			LowerJudge[p]=2;
		elseif params.TapNoteScore=='TapNoteScore_W3' and LowerJudge[p]<3 then
			LowerJudge[p]=3;
		elseif params.TapNoteScore=='TapNoteScore_W4' and LowerJudge[p]<4 then
			LowerJudge[p]=4;
		elseif params.TapNoteScore=='TapNoteScore_CheckpointMiss' 
			or params.TapNoteScore=='TapNoteScore_W5' 
			or params.TapNoteScore=='TapNoteScore_Miss' then
			LowerJudge[p]=0;
		end;
	end;
	ComboCommand=function(self, param)
		local iCombo = param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);
			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
			return;
		end

		cf.LabelW1:visible(false);
		cf.LabelW2:visible(false);
		cf.LabelW3:visible(false);
		cf.LabelNormal:visible(true);

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, 0.9 );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		param.LabelZoom = scale( iCombo, 0, 100, 0.8, 0.9 );
		

		--param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, 2 );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, 0.9);




		cf.NumberW1:settext( string.format("%i", iCombo) );
		cf.NumberW2:settext( string.format("%i", iCombo) );
		cf.NumberW3:settext( string.format("%i", iCombo) );
		cf.NumberNormal:settext( string.format("%i", iCombo) );





		local Number_X = -20;
		local Label_X = -13;
		local Label_Y = -42;

		if iCombo < 10 then

		    Number_X = -20;
		    Label_X = -13;

		end


		if iCombo > 9 then

			Number_X = -8;
		    Label_X = -4;

		end

		if iCombo > 99 then

			param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, 1, 1 );
			param.Zoom = clamp( param.Zoom, 1, 1);
			param.LabelZoom = scale( iCombo, 0, 100, 0.8, 0.9 );
			param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, 0.9);
			Number_X = 27;
			Label_X = 27;
			Label_Y = -34;
			

		end

		if iCombo > 999 then
			param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, 0.825, 0.825 );
			param.Zoom = clamp( param.Zoom, 0.825, 0.825 );
			Number_X = 34;
			Label_X = 34;
			Label_Y = -41;
		end

		if iCombo > 9999 then
			param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, 0.66, 0.66 );
			param.Zoom = clamp( param.Zoom, 0.66, 0.66 );
			param.LabelZoom = scale( iCombo, 0, 100, 0.8, 0.8 );
			param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, 0.8);
			Number_X = 40;
			Label_X = 40;
			Label_Y = -45;
		end

		if iCombo > 99999 then
			param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, 0.55, 0.55 );
			param.Zoom = clamp( param.Zoom, 0.55, 0.55 );
			param.LabelZoom = scale( iCombo, 0, 100, 0.6, 0.6 );
			param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, 0.6);
			Number_X = 45;
			Label_X = 45;
			Label_Y = -47;
			
		end

		if iCombo > 999999 then
			param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, 2.55, 2.55 );
			param.Zoom = clamp( param.Zoom, 0.55, 0.55 );
			param.LabelZoom = scale( iCombo, 0, 100, 0.6, 0.6 );
			param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, 0.6);
			Number_X = 55;
			Label_X = 55;
			Label_Y = -47;
		end




		
		cf.NumberW1:x(Number_X);
		cf.NumberW2:x(Number_X);
		cf.NumberW3:x(Number_X);
		cf.NumberNormal:x(Number_X);

		cf.LabelW1:x(Label_X);
		cf.LabelW2:x(Label_X);
		cf.LabelW3:x(Label_X);
		cf.LabelNormal:x(Label_X);

		cf.LabelW1:y(Label_Y);
		cf.LabelW2:y(Label_Y);
		cf.LabelW3:y(Label_Y);
		cf.LabelNormal:y(Label_Y);







		if LowerJudge[p]==1 then
			cf.NumberW1:visible(true);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(true);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==2 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(true);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(true);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==3 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(true);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(true);
			cf.LabelNormal:visible(false);
		elseif LowerJudge[p]==4 then
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(true);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(true);
		else
			cf.NumberW1:visible(false);
			cf.NumberW2:visible(false);
			cf.NumberW3:visible(false);
			cf.NumberNormal:visible(false);

			cf.LabelW1:visible(false);
			cf.LabelW2:visible(false);
			cf.LabelW3:visible(false);
			cf.LabelNormal:visible(false);
		end
		-- Pulse
		Pulse( cf.NumberW1, param );
		Pulse( cf.NumberW2, param );
		Pulse( cf.NumberW3, param );
		Pulse( cf.NumberNormal, param );
		PulseLabel( cf.LabelW1, param );
		PulseLabel( cf.LabelW2, param );
		PulseLabel( cf.LabelW3, param );
		PulseLabel( cf.LabelNormal, param );
		-- Milestone Logic
	end;
};

return t;