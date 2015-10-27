return Def.ActorFrame {
	LoadActor(THEME:GetPathS("", "_extra2")) .. {
		StartTransitioningCommand=function(self)
			if GAMESTATE:HasEarnedExtraStage() then
				self:play()
			end
		end
	},
	-- Extra with ghosts
	LoadActor("_extra2") .. {
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
				:linear(0.5)
				:diffusealpha(0)
		end
	},
	LoadActor("_extra2") .. {
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
				:linear(0.5)
				:diffusealpha(0)
		end
	},
	LoadActor("_extra2") .. {
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
				:linear(0.5)
				:diffusealpha(0)
		end
	},
	LoadActor("_extra2") .. {
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
				:linear(0.5)
				:diffusealpha(0)
		end
	}
}
