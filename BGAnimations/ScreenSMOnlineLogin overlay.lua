return Def.ActorFrame {
	Def.BitmapText {
		Font = "_venacti Bold 15px",
		Text = ScreenString("Depending on the server you're connected to, you may have to register for an account on their website."),
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 70)
				:shadowlength(1)
				:wrapwidthpixels(SCREEN_WIDTH * 0.75)
		end,
		OnCommand = function(self)
			self
				:cropright(1)
				:linear(0.5)
				:cropright(0)
		end,
		OffCommand = function(self)
			self
				:accelerate(0.3)
				:addx(SCREEN_WIDTH)
		end
	}
}
