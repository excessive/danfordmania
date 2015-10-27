return Def.Actor {
	OnCommand = function(self)
		self:sleep(ScreenMetric("InDelay"))
	end
}
