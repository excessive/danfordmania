return Def.ActorFrame {
	Def.Sprite {
		Texture = "top"
	},
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(-284, -6)
		end,
		Def.Sprite {
			Name = "HeaderText",
			Texture = "bar",
			InitCommand = function(self)
				self
					:y(4)
					:horizalign(left)
			end,
			OnCommand = function(self)
				self
					:cropright(1)
					:bounceend(0.32)
					:cropright(0)
			end,
			OffCommand = function(self)
				self
					:cropright(0)
					:bouncebegin(0.32)
					:cropright(1)
			end
		},
		Def.BitmapText {
			Font = "_sf sports night ns upright 26px header text",
			InitCommand = function(self)
				self
					:xy(64, -7)
					:horizalign(left)
					:shadowlength(0)
					:settext(ScreenString("HeaderText"))
					:skewx(-0.15)
					:zoomx(1.2)
					:maxwidth(250)
			end,
			OnCommand = function(self)
				self
					:faderight(1)
					:cropright(1)
					:linear(0.32)
					:faderight(0)
					:cropright(0)
			end,
			OffCommand = function(self)
				self
					:faderight(0)
					:cropright(0)
					:linear(0.32)
					:faderight(1)
					:cropright(1)
			end
		},
		Def.BitmapText {
			Name = "HeaderSubText",
			Font = "_venacti 10px header subtext",
			InitCommand = function(self)
				self
					:xy(64, 11)
					:horizalign(left)
					:shadowlength(0)
					:settext(ScreenString("HeaderSubText"))
					:zoomx(1.2)
			end,
			OnCommand = function(self)
				self
					:zoomy(0.5)
					:faderight(1)
					:cropright(1)
					:linear(0.32)
					:faderight(0)
					:cropright(0)
					:zoomy(1)
			end,
			OffCommand = function(self)
				self
					:faderight(0)
					:cropright(0)
					:linear(0.32)
					:faderight(1)
					:cropright(1)
			end
		},
		Def.Sprite {
			Texture = "arrow"
		},
		Def.Sprite {
			Texture = "ring shadow",
			InitCommand = function(self)
				self
					:xy(-1.5, 2)
					:spin()
					:effectmagnitude(0, 0, 20)
			end
		},
		Def.Sprite {
			Texture = "ring diffuse",
			InitCommand = function(self)
				self
					:xy(-1.5, -3)
					:spin()
					:effectmagnitude(0, 0, 20)
			end
		},
		UpdateScreenHeaderMessageCommand = function(self, params)
			local header    = self:GetChild("HeaderText")
			local subHeader = self:GetChild("HeaderSubText")
			header:settext(params.Header)
			subHeader:settext(params.Subheader)
		end
	}
}
