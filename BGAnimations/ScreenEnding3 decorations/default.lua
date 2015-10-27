local frame = LoadFallbackB()

table.insert(frame, LoadActor("bg") .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end
})

table.insert(frame, LoadActor("picture scroller") .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y - 20)
	end
})

return frame
