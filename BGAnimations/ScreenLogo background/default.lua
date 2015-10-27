return Def.ActorFrame {
	InitCommand = function(self)
		self:fov(90)
	end,
	Def.Sprite {
		Texture = "background",
		InitCommand = function(self)
			self:Center()
			self:FullScreen()
		end
	},
	Def.Sprite {
		Texture = "ring orange",
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X + 50, SCREEN_CENTER_Y)
				:diffusealpha(0.5)
				:zoom(0.9)
				:spin()
				:rotationx(-20)
				:rotationy(28)
				:rotationz(20)
				:effectmagnitude(0, 0, 5)
		end
	},
	Def.Sprite {
		Texture = "ring blue",
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X - 100, SCREEN_CENTER_Y + 50)
				:diffusealpha(0.5)
				:zoom(0.8)
				:spin()
				:rotationx(-60)
				:rotationy(-20)
				:rotationz(-50)
				:effectmagnitude(0, 0, -5)
		end
	}
}
