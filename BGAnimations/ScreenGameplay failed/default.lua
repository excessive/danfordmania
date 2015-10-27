return Def.ActorFrame {
	LoadActor( THEME:GetPathS("", "_failed") ) .. {
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
	Def.Actor {
		OnCommand = function(self)
			self:sleep(5)
		end
	},
	LoadActor("../_black.png") .. {
		InitCommand = function(self)
			self:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
		end,
		OnCommand = function(self)
			self
				:diffusealpha(0)
				:sleep(0.5)
				:linear(0.5)
				:diffusealpha(1)
		end
	},
	-- Failed with ghosts
	LoadActor("failed") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(0)
				:zoom(4)
				:sleep(0.5)
				:decelerate(0.6)
				:diffusealpha(0.4)
				:zoom(0.6)
				:accelerate(0.4)
				:zoom(1)
				:decelerate(0.2)
				:zoom(1.1)
				:linear(0.1)
				:zoom(1.0)
				:sleep(2)
		end
	},
	LoadActor("failed") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(0)
				:zoom(4)
				:sleep(0.6)
				:decelerate(0.6)
				:diffusealpha(0.4)
				:zoom(0.6)
				:accelerate(0.4)
				:zoom(1)
				:decelerate(0.2)
				:zoom(1.1)
				:linear(0.1)
				:zoom(1.0)
				:sleep(2)
		end
	},
	LoadActor("failed") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(0)
				:zoom(4)
				:sleep(0.7)
				:decelerate(0.6)
				:diffusealpha(0.4)
				:zoom(0.6)
				:accelerate(0.4)
				:zoom(1)
				:decelerate(0.2)
				:zoom(1.1)
				:linear(0.1)
				:zoom(1.0)
				:sleep(2)
		end
	},
	LoadActor("failed") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:diffusealpha(0)
				:zoom(4)
				:sleep(0.8)
				:decelerate(0.6)
				:diffusealpha(0.4)
				:zoom(0.6)
				:accelerate(0.4)
				:zoom(1)
				:decelerate(0.2)
				:zoom(1.1)
				:linear(0.1)
				:zoom(1.0)
				:sleep(2)
		end
	}
}
