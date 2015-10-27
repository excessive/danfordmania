return LoadActor("StepsDisplayList cursor p1") .. {
	InitCommand = function(self)
		self:zoomx(-1)
	end
}
