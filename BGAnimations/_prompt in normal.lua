return Def.ActorFrame {
	OnCommand = function(self)
		self:sleep(0.3)
	end,
	Def.Sound {
		File = THEME:GetPathS("", "_prompt"),
		StartTransitioningCommand = function(self)
			self:play()
		end
	}
}
