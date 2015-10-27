return Def.ActorFrame {
	Def.ActorFrame {
		LoadActor("star field") .. {
			InitCommand = function(self)
				self
					:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
					:zoom(16)
					:customtexturerect(0, 0, 16, 16)
					:texcoordvelocity(1, 0)
			end
		},
		LoadActor("black circle") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			end
		},
		LoadActor("game star") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X - 130, SCREEN_CENTER_Y - 50)
			end,
			OnCommand = function(self)
				self
					:addx(SCREEN_WIDTH)
					:sleep(0.0)
					:decelerate(0.5)
					:addx(-SCREEN_WIDTH)
			end
		},
		LoadActor("over star") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 20)
			end,
			OnCommand = function(self)
				self
					:addx(SCREEN_WIDTH)
					:sleep(0.2)
					:decelerate(0.5)
					:addx(-SCREEN_WIDTH)
			end
		},
		LoadActor("game text") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X - 60, SCREEN_CENTER_Y - 50 + 4)
			end,
			OnCommand = function(self)
				self
					:addx(SCREEN_WIDTH)
					:sleep(0.5)
					:decelerate(0.5)
					:addx(-SCREEN_WIDTH)
			end
		},
		LoadActor("over text") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X + 66, SCREEN_CENTER_Y + 20 + 4)
			end,
			OnCommand = function(self)
				self
					:addx(SCREEN_WIDTH)
					:sleep(0.7)
					:decelerate(0.5)
					:addx(-SCREEN_WIDTH)
			end
		},
		Def.ActorFrame {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X + 114, SCREEN_CENTER_Y - 50)
			end,
			OnCommand = function(self)
				self
					:addx(SCREEN_WIDTH)
					:sleep(1)
					:rotationz(360 * 2)
					:decelerate(1)
					:addx(-SCREEN_WIDTH)
					:rotationz(0)
			end,
			LoadActor("face open"),
			LoadActor("face closed") .. {
				OnCommand = function(self)
					self
						:diffusealpha(0)
						:sleep(3)
						:diffusealpha(1)
						:sleep(0.5)
						:diffusealpha(0)
				end
			},
			Def.ActorFrame {
				InitCommand = function(self)
					self
						:xy(-54, -60)
						:zoom(0)
						:sleep(2)
						:bounceend(0.3)
						:zoom(1)
				end,
				LoadActor("balloon"),
				Def.BitmapText {
					Font = "_venacti Bold 15px",
					InitCommand = function(self)
						self
							:y(-5)
							:settext("See you next time!")
							:diffuse(color("#3f4c72"))
							:shadowcolor(color("#dcb2f2aa"))
							:wrapwidthpixels(100)
							:skewx(-0.1)
							:shadowlength(2)
					end
				}
			}
		}
	}
}
