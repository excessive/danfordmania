return Def.ActorFrame {
	Def.Sprite {
		Texture = "../_black",
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:zoomtowidth(SCREEN_WIDTH)
				:zoomtoheight(120)
				:diffusealpha(0.7)
		end
	},
	Def.Sprite {
		Texture = "demonstration",
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffuseblink()
				:effectperiod(1)
		end
	}
}
