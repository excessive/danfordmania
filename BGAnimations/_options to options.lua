return Def.ActorFrame {
	OnCommand = function(self)
		self:sleep(0.5)
	end,
	Def.Sound {
		File = THEME:GetPathS("", "_swoosh normal"),
		StartTransitioningCommand = function(self)
			self:play()
		end
	}
}
