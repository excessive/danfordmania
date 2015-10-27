return Def.ActorFrame {
	Def.Sprite {
		Texture = "bg",
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end
	}
}
