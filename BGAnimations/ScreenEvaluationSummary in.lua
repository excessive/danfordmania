return Def.ActorFrame {
	LoadActor(THEME:GetPathS("", "_swoosh normal")) .. {
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
	Def.Actor {
		OnCommand = function(self)
			self:sleep(1.3)
		end
	},
	LoadActor("_moveon") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:zoomy(1)
				:diffusealpha(1)
				:linear(0.5)
				:diffusealpha(0)
				:zoomy(0)
		end
	}
}
