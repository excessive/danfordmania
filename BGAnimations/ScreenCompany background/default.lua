return Def.ActorFrame {
	Def.Sprite {
		Texture = "background",
	 	InitCommand = function(self)
			self
				:Center()
				:FullScreen()
		end
	},
	Def.Sprite {
		Texture = "logo",
		InitCommand = function(self)
			self
				:Center()
				:FullScreen()
				:blend(Blend.Add)
				:sleep(6)
		end
	},
	Def.Sound {
		File = THEME:GetPathS("ScreenCompany", "music"),
		InitCommand = function(self)
			self:play()
		end
	}
}
