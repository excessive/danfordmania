return Def.ActorFrame {
	LoadActor(THEME:GetPathS("", "_swoosh normal")) .. {
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
   LoadActor("_moveon") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		OnCommand = function(self)
			self
				:diffusealpha(0)
				:sleep(1)
				:linear(0.3)
				:diffusealpha(1)
				:sleep(0.5)
		end
	}
}
