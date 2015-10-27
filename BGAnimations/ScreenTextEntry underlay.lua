return Def.ActorFrame {
	Def.Sprite {
		Texture = THEME:GetPathG("", "OptionRowSimple Frame"),
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 20)
		end
	}
}
