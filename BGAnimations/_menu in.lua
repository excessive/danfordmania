return Def.ActorFrame {
	Def.Sprite {
		Texture = THEME:GetPathB("", "_moveon"),
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(1)
				:linear(0.2)
				:diffusealpha(0)
				:zoomx(1)
				:zoomy(0)
		end
	}
}
