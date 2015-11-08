local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local ShowMissesAt = THEME:GetMetric("Combo", "ShowMissesAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");

local t = Def.ActorFrame {
	LoadFont( "Combo", "ComboNumber" ) .. {
		Name="ComboNumber";
		OnCommand = THEME:GetMetric("Combo", "ComboNumberOnCommand");
	};
	LoadFont( "Combo", "MissesNumber" ) .. {
		Name="MissesNumber";
		OnCommand = THEME:GetMetric("Combo", "MissesNumberOnCommand");
	};
	LoadActor("_combo") .. {
		Name="ComboLabel";
		OnCommand = THEME:GetMetric("Combo", "ComboLabelOnCommand");
	};
	LoadActor("_misses") .. {
		Name="MissesLabel";
		OnCommand = THEME:GetMetric("Combo", "MissesLabelOnCommand");
	};

	InitCommand = function(self)
		c = self:GetChildren();
		c.ComboNumber:visible(false);
		c.MissesNumber:visible(false);
		c.ComboLabel:visible(false);
		c.MissesLabel:visible(false);
	end;

	ComboCommand=function(self, param)
		local iNum = param.Misses or param.Combo;

		c.ComboNumber:visible(false);
		c.MissesNumber:visible(false);
		c.ComboLabel:visible(false);
		c.MissesLabel:visible(false);

		local ShowAt;
		if param.Combo then
			ShowAt = ShowComboAt;
		else
			ShowAt = ShowMissesAt;
		end

		if not iNum  or  ShowAt == 0  or  iNum < ShowAt then
			return;
		end

		local Number;
		if param.Combo then
			Number = c.ComboNumber;
		else
			Number = c.MissesNumber;
		end
		local Label;
		if param.Combo then
			Label = c.ComboLabel;
		else
			Label = c.MissesLabel;
		end

		Number:visible(true);
		Label:visible(true);

		Number:settext( string.format("%i", iNum) );

		Pulse( Number, 0.5 );
		Pulse( Label, 0.5 );
	end;
};

return t;
