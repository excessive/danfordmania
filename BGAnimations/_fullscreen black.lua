return Def.Quad {
	OnCommand = function(self)
		self
		:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
		:diffuse(color("#000000"))
	end
}
