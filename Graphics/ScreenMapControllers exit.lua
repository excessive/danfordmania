return Def.BitmapText {
	Text = "Exit",
	Font = "Common Normal",
	InitCommand = function(self)
		self
			:x(SCREEN_CENTER_X)
			:zoom(0.75)
			:shadowlength(0)
			:diffuse(color("#808080"))
	end,
	OnCommand = function(self)
		self
			:diffusealpha(0)
			:decelerate(0.5)
			:diffusealpha(1)
	end,
	OffCommand = function(self)
		self
			:stoptweening()
			:accelerate(0.3)
			:diffusealpha(0)
			:queuecommand("Hide")
	end,
	HideCommand = function(self)
		self:hidden(true)
	end,
	GainFocusCommand = function(self)
		self
			:diffuseshift()
			:effectcolor1(color("#FFFFFF"))
			:effectcolor2(color("#808080"))
	end,
	LoseFocusCommand = function(self)
		self:stopeffect()
	end
}
