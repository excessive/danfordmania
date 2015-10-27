return Def.ActorFrame {
	Def.ActorFrame {
		Def.Quad {
			InitCommand = function(self)
				self
					:horizalign(left)
					:zoomtowidth(120)
					:zoomtoheight(SCREEN_HEIGHT)
					:diffuse(color("#000000"))
					:diffuserightedge(color("#00000011"))
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			InitCommand = function(self)
				self
					:xy(60, -220)
					:settext(ScreenString("Help"))
					:strokecolor(color("#00000077"))
			end
		},
		InitCommand = function(self)
			self:xy(SCREEN_LEFT, SCREEN_CENTER_Y)
		end,
		EditCommand = function(self)
			self:playcommand("Show")
		end,
		PlayingCommand = function(self)
			self:playcommand("Hide")
		end,
		RecordCommand = function(self)
			self:playcommand("Hide")
		end,
		RecordPausedCommand = function(self)
			self:playcommand("Hide")
		end,
		ShowCommand = function(self)
			self
				:stoptweening()
				:accelerate(0.25)
				:x(SCREEN_LEFT)
		end,
		HideCommand = function(self)
			self
				:stoptweening()
				:accelerate(0.25)
				:x(SCREEN_LEFT - 192)
		end
	},
	Def.ActorFrame {
		Def.Quad {
			InitCommand = function(self)
				self
					:horizalign(right)
					:zoomtowidth(120)
					:zoomtoheight(SCREEN_HEIGHT)
					:diffuse(color("#000000"))
					:diffuseleftedge(color("#00000011"))
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			InitCommand = function(self)
				self
					:xy(-60, -220)
					:settext(ScreenString("Info"))
					:strokecolor(color("#00000077"))
			end
		},
		InitCommand = function(self)
			self:xy(SCREEN_RIGHT, SCREEN_CENTER_Y)
		end,
		EditCommand = function(self)
			self:playcommand("Show")
		end,
		PlayingCommand = function(self)
			self:playcommand("Hide")
		end,
		RecordCommand = function(self)
			self:playcommand("Hide")
		end,
		RecordPausedCommand = function(self)
			self:playcommand("Hide")
		end,
		ShowCommand = function(self)
			self
				:stoptweening()
				:accelerate(0.25)
				:x(SCREEN_RIGHT)
		end,
		HideCommand = function(self)
			self
				:stoptweening()
				:accelerate(0.25)
				:x(SCREEN_RIGHT + 192)
		end
	}
}
