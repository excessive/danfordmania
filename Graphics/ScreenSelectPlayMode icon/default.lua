local gc        = Var("GameCommand")
local master_pn = GAMESTATE:GetMasterPlayerNumber()
local pad_file  = ""
local colors    = {
	[0] = color("#00e110"),
	[1] = color("#e4e100"),
	[2] = color("#fba500"),
	[3] = color("#ff0000"),
	[4] = color("#1cd8ff")
}
local c = colors[gc:GetIndex()]

return Def.ActorFrame {
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X + 140, SCREEN_CENTER_Y)
		end,
		GainFocusCommand = function(self)
			self:visible(true)
		end,
		LoseFocusCommand = function(self)
			self:visible(false)
		end,
		Def.Sprite {
			Texture = string.format("preview %s", gc:GetName()),
			InitCommand = function(self)
				self
					:y(170)
					:vertalign(bottom)
			end,
			OnCommand = function(self)
				self
					:rotationx(90)
					:diffusealpha(0)
					:linear(0.11)
					:diffusealpha(0.5)
					:rotationx(0)
					:linear(0.11)
					:diffusealpha(1)
			end,
			OffCommand = function(self)
				self
					:rotationy(90)
					:diffusealpha(1)
					:linear(0.2)
					:rotationy(90)
					:diffusealpha(0)
			end
		},
		Def.BitmapText {
			Font = "_terminator two 40px",
			InitCommand = function(self)
				self
					:x(94)
					:settext(string.upper(gc:GetText()))
					:shadowlength(0)
					:zoom(1.3)
					:zoomtowidth(300)
					:rotationz(-90)
					:diffuse(c)
					:strokecolor(color("#00000044"))
					:shadowlengthx(4)
					:shadowlengthy(0)
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:addy(-50)
					:decelerate(0.2)
					:diffusealpha(1)
					:addy(50)
			end,
			OffCommand = function(self)
				self
					:diffusealpha(1)
					:accelerate(0.2)
					:diffusealpha(0)
					:addy(-50)
			end
		},
		Def.BitmapText {
			Font = "_venacti Bold 24px",
			InitCommand = function(self)
				self
					:horizalign(right)
					:vertalign(bottom)
					:xy(70, 150)
					:settext(ScreenString(gc:GetName().."Explanation"))
					:shadowlengthx(0)
					:shadowlengthy(3)
					:maxwidth(500)
					:diffuse(c)
					:strokecolor(color("#00000044"))
			end,
			OnCommand = function(self)
				self
					:zoomy(0)
					:diffusealpha(0.5)
					:linear(0.18)
					:zoomy(1)
					:diffusealpha(1)
			end,
			OffCommand = function(self)
				self
					:zoomy(1)
					:diffusealpha(1)
					:linear(0.18)
					:zoomy(0.2)
					:diffusealpha(0)
			end,
		},
	},
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 150, SCREEN_CENTER_Y - 104 + gc:GetIndex() * 50)
		end,
		Def.Sprite {
			Texture = "cursor",
			InitCommand = function(self)
				self:xy(20, 2)
			end,
			GainFocusCommand = function(self)
				self:visible(true)
			end,
			LoseFocusCommand = function(self)
				self:visible(false)
			end,
			OnCommand = function(self)
				self
					:cropright(1)
					:faderight(1)
					:linear(0.2)
					:cropright(0)
					:faderight(0)
			end,
			OffCommand = function(self)
				self
					:cropleft(0)
					:fadeleft(0)
					:linear(0.2)
					:cropleft(1)
					:fadeleft(1)
			end
		},
		Def.Sprite {
			Texture = string.format("icon %s", gc:GetName()),
			InitCommand = function(self)
				self:xy(124, 2)
			end,
			GainFocusCommand = function(self)
				self:visible(true)
			end,
			LoseFocusCommand = function(self)
				self:visible(false)
			end,
			OnCommand = function(self)
				self
					:addx(-90)
					:diffusealpha(0)
					:decelerate(0.12)
					:diffusealpha(0.5)
					:addx(90)
					:linear(0.12)
					:diffusealpha(1)
			end,
			OffCommand = function(self)
				self
					:sleep(0.18)
					:bouncebegin(0.12)
					:zoom(0)
					:diffusealpha(0)
			end
		},
		Def.BitmapText {
			Font = "_terminator two 30",
			InitCommand = function(self)
				self
					:y(-6)
					:settext(string.upper(gc:GetText()))
					:maxwidth(350)
					:diffuse(c)
					:strokecolor(color("#0000004F"))
					:shadowlengthx(0)
					:shadowlengthy(4)
					:shadowcolor(color("#00000044"))
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:linear(0.2)
					:diffusealpha(1)
			end,
			OffCommand = function(self)
				self
					:diffusealpha(1)
					:sleep(gc:GetIndex() / 16)
					:linear(0.1)
					:diffusealpha(0)
			end
		}
	}
}
