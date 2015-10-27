return LoadActor("_name entry") .. {
	InitCommand = function(self)
		self:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
	end
}
