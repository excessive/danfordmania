return Def.ActorFrame {
	Def.Sprite {
		Texture = "frame",
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 150, SCREEN_CENTER_Y)
		end,
		OnCommand = function(self)
			self
				:zoomy(1.6)
				:diffusealpha(0)
				:linear(0.18)
				:zoomy(1)
				:diffusealpha(1)
		end,
		OffCommand = function(self)
			self
				:zoomy(1)
				:diffusealpha(1)
				:linear(0.18)
				:zoomy(1.6)
				:diffusealpha(0)
		end
	}
}
