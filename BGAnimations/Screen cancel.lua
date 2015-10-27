return Def.ActorFrame {
	Def.Sound {
		File = THEME:GetPathS("", "_cancel"),
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
	Def.Quad {
		OnCommand = function(self)
			self
				:finishtweening()
				:diffuse(color("#000000"))
				:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
				:cropleft(1)
				:fadeleft(.5)
				:linear(0.5)
				:cropleft(-0.5)
		end
	}
}
