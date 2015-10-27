return Def.Sound {
	File = THEME:GetPathS("", "_prompt"),
	StartTransitioningCommand = function(self)
		self:play()
	end
}
