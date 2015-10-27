return Def.ActorFrame {
	LoadActor("arrow") .. {
		InitCommand = function(self)
			self
				:y(8)
				:shadowlengthx(0)
				:shadowlengthy(2)
		end
	},
	Def.BitmapText {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:y(-8)
				:settext("Barely")
				:shadowlengthx(0)
				:shadowlengthy(2)
				:strokecolor(color("#00000077"))
		end
	}
}
