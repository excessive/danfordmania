return LoadActor("_footer shared") .. {
	InitCommand = function(self)
		self:draworder(-1)
	end
}
