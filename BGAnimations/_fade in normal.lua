return Def.Quad {
	InitCommand = function(self)
		self
			:diffuse(color("#000000"))
			:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
	end,
	StartTransitioningCommand = function(self)
		self
			:diffusealpha(1)
			:linear(0.3)
			:diffusealpha(0)
	end
}
