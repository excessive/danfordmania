return LoadActor("ScreenGameplay LeftFrame") .. {
	InitCommand = function(self)
		self:zoomx(-1)
	end
}
