return LoadActor(THEME:GetPathB("ScreenWithMenuElements","overlay")) .. {
	Def.ActorFrame {
		InitCommand = function(self)
			self:x(-200)
		end,
		Def.Sprite {
			Texture = "notify"
		},
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:y(-15)
					:shadowlength(0)
					:diffuse(color("#000000"))
					:settext("\"JOY4\" IS NOT MAPPED")
					:skewx(-0.1)
			end
		}
	},
	Def.ActorFrame {
		InitCommand = function(self)
			self:x(200)
		end,
		Def.Sprite {
			Texture = "notify",
			OnCommand = function(self)
				self:zoomx(-1)
			end
		},
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:y(-15)
					:shadowlength(0)
					:diffuse(color("#000000"))
					:settext("P2: PRESS START TO JOIN\nTHIS IS 2 LINES OF TEXT")
					:skewx(-0.1)
			end
		}
	}
}
