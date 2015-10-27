return Def.Sprite {
	Texture = THEME:GetPathB("", "_black.png"),
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			:zoomtowidth(SCREEN_WIDTH)
			:zoomtoheight(SCREEN_HEIGHT)
			:diffusealpha(0)
			:linear(0.3)
			:diffusealpha(0.75)
	end
}
