local background = Def.Sprite {
	Texture     = "background",
 	InitCommand = function(self)
		self
			:Center()
			:FullScreen()
	end
}

local logo = Def.Sprite {
	Texture     = "logo",
	InitCommand = function(self)
		self
			:Center()
			:FullScreen()
			:blend(Blend.Add)
			:sleep(6)
	end
}

return Def.ActorFrame { background, logo }
