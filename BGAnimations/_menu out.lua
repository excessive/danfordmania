return Def.ActorFrame {
	Def.Sprite {
		Texture = THEME:GetPathB("", "_moveon"),
		OnCommand = function(self)
			self
				:hibernate(0.1)
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:zoomx(1)
				:zoomy(0)
				:diffusealpha(0)
				:linear(0.35)
				:diffusealpha(1)
				:zoom(1)
		end
	}
}
