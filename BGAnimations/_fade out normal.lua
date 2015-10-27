return Def.Quad {
	InitCommand = function(self)
		self
			:diffuse(color("#000000"))
			:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
	end,
	StartTransitioningCommand = function(self)
		self
			:diffusealpha(0)
			:linear(0.3)
			:diffusealpha(1)
	end
}
