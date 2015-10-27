return Def.ActorFrame {
	Def.Quad {
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_TOP)
				:vertalign(bottom)
				:diffuse(color("#000000"))
				:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
		end,
		BeginCommand = function(self)
			self
				:zwrite(1)
				:z(1)
				:blend("BlendMode_NoEffect")
		end,
		OffCommand = function(self)
			self
				:accelerate(0.4)
				:y(SCREEN_BOTTOM)
		end
	},
	Def.BitmapText {
		Font = "_venacti bold 24px",
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 40)
				:horizalign(center)
				:shadowlength(0)
				:wrapwidthpixels(500)
				:strokecolor(color("#a200ff"))
				:settext(THEME:GetString("ScreenCaution", "CautionText"))
		end,
		BeginCommand = function(self)
			self:ztest(1)
		end
	}
}
