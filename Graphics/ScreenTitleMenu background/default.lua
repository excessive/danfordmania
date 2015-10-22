local sky = Def.Sprite {
	Texture     = "bg sky",
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end
}

local rainbow = Def.Sprite {
	Texture     = "bg rainbow",
	InitCommand = function(self)
		self
			:xy(SCREEN_LEFT, SCREEN_BOTTOM)
			:horizalign(left)
			:vertalign(bottom)
			:blend("BlendMode_Add")
			:diffusealpha(0.4)
	end
}

local orange = Def.Sprite {
	Texture     = "ring orange",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X + 50, SCREEN_CENTER_Y)
			:diffusealpha(0.5)
			:zoom(0.9)
			:rotationx(-20)
			:rotationy(28)
			:rotationz(20)
			:spin()
			:effectmagnitude(0, 0, 5)
	end
}

local blue = Def.Sprite {
	Texture     = "ring blue",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X - 100, SCREEN_CENTER_Y + 50)
			:diffusealpha(0.5)
			:zoom(0.8)
			:rotationx(-60)
			:rotationy(-20)
			:rotationz(-50)
			:spin()
			:effectmagnitude(0, 0, -5)
	end
}

return Def.ActorFrame {
	InitCommand = function(self)
		self:fov(90)
	end,
	sky,
	rainbow,
	orange,
	blue
}
