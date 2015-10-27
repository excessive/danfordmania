return Def.ActorFrame {
	Def.Sound {
		File = THEME:GetPathS("", "_swoosh normal"),
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
	LoadActor(THEME:GetPathB("", "_fade in normal"))
}
