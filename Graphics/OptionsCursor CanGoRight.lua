return LoadActor("OptionsCursor CanGoLeft") .. {
	InitCommand = function(self)
		self:zoomx(-1)
	end
}
