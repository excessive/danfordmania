return Def.ActorFrame {
	Def.Sprite {
		Texture = "focus",
		GainFocusCommand = function(self)
			self:visible(true)
		end,
		LoseFocusCommand = function(self)
			self:visible(false)
		end
	},
	Def.Sprite {
		Texture = "nofocus",
		GainFocusCommand = function(self)
			self:visible(false)
		end,
		LoseFocusCommand = function(self)
			self:visible(true)
		end
	}
}
