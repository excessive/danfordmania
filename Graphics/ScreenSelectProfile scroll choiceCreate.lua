return Def.BitmapText {
	Font = "Common Normal",
	Text = "Create New",
	OnCommand = function(self)
		self
			:diffusealpha(0)
			:linear(0.3)
			:diffusealpha(1)
	end,
	OffCommand = function(self)
		self
			:linear(0.3)
			:diffusealpha(0)
	end,
	InitCommand = function(self)
		self
			:halign(0)
			:shadowlength(2)
	end,
	GainFocusCommand = function(self)
		self
			:stoptweening()
			:diffuseshift()
			:effectperiod(0.5)
			:effectcolor1(1, 0.5, 0.5, 1)
			:effectcolor2(0.5, 0.25, 0.25, 1)
			:linear(0)
			:Zoom(1.0)
	end,
	LoseFocusCommand = function(self)
		self
			:stoptweening()
			:stopeffect()
			:linear(0)
			:zoom(0.9)
	end,
	DisabledCommand = function(self)
		self:diffuse(0.5, 0.5, 0.5, 1)
	end
}
