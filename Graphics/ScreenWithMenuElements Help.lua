return Def.HelpDisplay {
	File = THEME:GetPathF("HelpDisplay", "text"),
	InitCommand = function(self)
		self:SetTipsColonSeparated(
			THEME:GetMetric(Var "LoadingScreen", "HelpText")
		)
	end,
	SetHelpTextCommand = function(self, params)
		self:SetTipsColonSeparated(params.Text)
	end
}
