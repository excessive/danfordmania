return Def.ActorFrame {
	Def.Quad {
		Name = "ItemBase",
		InitCommand = function(self)
			self
				:zoomto(270, 32)
				:diffuse(color("0,0,0,0.5"))
		end
	},
	Def.Quad {
		Name = "ItemBottomBorder",
		InitCommand = function(self)
			self
				:y(16)
				:zoomto(270, 2)
				:diffuse(color("1,1,1,0.5"))
		end
	}
}
