function ExplanationText(s, delay, length)
	return Def.ActorFrame {
		Def.Sprite {
			Texture = "text frame",
			OnCommand = function(self)
				self
					:xy(SCREEN_CENTER_X + 160, SCREEN_CENTER_Y + 40)
					:diffusealpha(0)
					:sleep(delay)
					:linear(0.5)
					:diffusealpha(1)
					:sleep(length)
					:linear(0.5)
					:diffusealpha(0)
			end
		},
		Def.BitmapText {
			Font = "_venacti Bold 24px",
			OnCommand = function(self)
				self
					:xy(SCREEN_CENTER_X + 160, SCREEN_CENTER_Y + 40)
					:settext(s)
					:diffusetopedge(color("#FFFFFF"))
					:diffusebottomedge(color("#fefb00"))
					:wrapwidthpixels(250)
					:shadowlength(0)
					:cropright(1)
					:sleep(delay)
					:linear(0.5)
					:cropright(0)
					:sleep(length)
					:linear(0.5)
					:diffusealpha(0)
			end
		}
	}
end

function Circle(xpos, ypos, delay, length)
	return Def.ActorFrame {
		OnCommand = function(self)
			self
				:x(xpos, ypos)
				:draworder(1)
		end,
		Def.Sprite {
			Texture = "circle",
			OnCommand = function(self)
				self
					:cropleft(0.6)
					:cropright(0.6)
					:croptop(0.5)
					:cropbottom(0.0)
					:sleep(delay + 0.0)
					:linear(0.2)
					:cropleft(0)
					:glowshift()
					:sleep(length-0.2)
					:linear(0.5)
					:diffusealpha(0)
			end
		},
		Def.Sprite {
			Texture = "circle",
			OnCommand = function(self)
				self
					:cropleft(0.0)
					:cropright(1)
					:croptop(0.0)
					:cropbottom(0.5)
					:sleep(delay + 0.2)
					:linear(0.4)
					:cropright(0)
					:glowshift()
					:sleep(length-0.6)
					:linear(0.5)
					:diffusealpha(0)
			end
		},
		Def.Sprite {
			Texture = "circle",
			OnCommand = function(self)
				self
					:cropleft(1)
					:cropright(0.0)
					:croptop(0.5)
					:cropbottom(0.0)
					:sleep(delay + 0.6)
					:linear(0.2)
					:cropleft(0.4)
					:glowshift()
					:sleep(length - 0.8)
					:linear(0.5)
					:diffusealpha(0)
			end
		}
	}
end

function Arrow(xpos, ypos, delay, length)
	return Def.ActorFrame {
		Def.Sprite {
			Texture = "arrow",
			OnCommand = function(self)
				self
					:xy(xpos, ypos)
					:diffusealpha(0)
					:sleep(delay)
					:addx(50)
					:linear(0.5)
					:diffusealpha(1)
					:addx(-50)
					:sleep(length)
					:linear(0.5)
					:diffusealpha(0)
					:draworder(10)
			end
		}
	}
end

return Def.ActorFrame {
	Def.Sprite {
		Texture = "how to play",
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(0)
				:zoom(4)
				:sleep(0.0)
				:linear(0.3)
				:diffusealpha(1)
				:zoom(1.8)
				:sleep(1.7)
				:linear(0.3)
				:zoom(1)
				:addx(160)
				:addy(-150)
				:draworder(10)
		end
	},
	ExplanationText("When the arrows rise to this point, step on the matching panels.", 5, 9),
	Circle(SCREEN_CENTER_X - 160, SCREEN_CENTER_Y - 120, 5, 3),
	ExplanationText("Step on both panels if two different arrows appear at the same time.", 15, 5),
	ExplanationText("If you misstep repeatedly, you life meter will decrease until the game is over.", 21, 4),
	Arrow(SCREEN_CENTER_X - 60, SCREEN_CENTER_Y - 175, 21, 2 )
}
