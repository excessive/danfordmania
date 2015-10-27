return Def.ActorFrame {
	LoadActor(THEME:GetPathS("", "_swoosh normal") ) .. {
		StartTransitioningCommand = function(self)
			self:play()
		end
	},
	Def.Actor {
		OnCommand = function(self)
			self:sleep(2)
		end
	},
	LoadSongBackground() .. {
		Condition = not STATSMAN:GetCurStageStats():AllFailed(),
		OnCommand = function(self)
			self
				:diffusealpha(1)
				:linear(0.4)
				:diffusealpha(0)
		end
	},
	LoadActor("_black") .. {
		Condition = STATSMAN:GetCurStageStats():AllFailed(),
		InitCommand = function(self)
			self:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
		end,
		OnCommand = function(self)
			self
				:diffusealpha(1)
				:linear(0.2)
				:diffusealpha(0)
		end
	}
}
