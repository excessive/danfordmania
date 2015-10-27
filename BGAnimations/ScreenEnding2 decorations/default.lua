local frame = LoadFallbackB()

table.insert(frame, LoadActor("bg") .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end
})

table.insert(frame, LoadActor( "song background scroller" ) .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X - 174, SCREEN_CENTER_Y)
	end
})

table.insert(frame, LoadActor( "credits" ) .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X + 114, SCREEN_CENTER_Y)
	end
})

table.insert(frame, LoadActor("team") .. {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y - 30)
	end,
	OnCommand = function(self)
		self
			:sleep(1)
			:decelerate(0.7)
			:addx(274)
			:rotationz(90)
	end
})

return frame
