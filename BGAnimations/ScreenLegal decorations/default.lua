return Def.ActorFrame {
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		Def.Sprite {
			Texture = "frame"
		},
		Def.BitmapText {
			Font = "_terminator two 40px",
			InitCommand = function(self)
				self
					:y(-136)
					:uppercase(true)
					:settext(ScreenString("Warning"))
					:diffuse(color("#fef500"))
					:strokecolor(color("#0167d2"))
					:shadowlength(0)
			end
		},
		Def.BitmapText {
			Font = "_venacti Bold 15px",
			InitCommand = function(self)
				self
					:y(26)
					:uppercase(true)
					:settext(ScreenString("BodyText"))
					:wrapwidthpixels(500)
					:strokecolor(color("#0167d2"))
					:shadowlength(0)
					:vertspacing(2)
			end
		}
	}
}
