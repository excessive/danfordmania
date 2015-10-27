return Def.Sprite {
	Texture = THEME:GetPathG("ScreenWithMenuElements", "LeftFrame"),
	InitCommand = function(self)
		self:zoomx(-1)
	end
}
