local background = Def.Sprite {
	Texture   = THEME:GetPathG("ScreenWithMenuElements", "background"),
	OnCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end
}

return Def.ActorFrame { background }
