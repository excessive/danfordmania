return LoadActor("go") .. {
	OnCommand = function(self)
		self
			:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			:diffusealpha(0)
			:linear(0.5)
			:diffusealpha(1)
			:sleep(0.5)
			:linear(0.5)
			:diffusealpha(0)
	end
}
