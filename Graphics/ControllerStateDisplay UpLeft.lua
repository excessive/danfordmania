return LoadActor(THEME:GetPathG("ControllerStateDisplay","Center")) .. {
	InitCommand = function(self)
		self:xy(-8, -8)
	end
}
