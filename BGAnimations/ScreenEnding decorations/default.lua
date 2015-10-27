return Def.ActorFrame {
	Def.ActorFrame {
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 200)
				:draworder(1)
		end,
		Def.Sprite {
			Texture = "bar"
		},
		Def.BitmapTxt {
			Font = "_venacti Bold 15px",
			InitCommand = function(self)
				self
					:settext("Thank you for playing!")
					:horizalign(left)
					:x(-280)
					:shadowlength(0)
					:strokecolor(color("#000000"))
			end
		}
	}
}
