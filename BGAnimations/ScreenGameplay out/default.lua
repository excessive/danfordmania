return Def.ActorFrame {
	LoadSongBackground() .. {
		OnCommand = function(self)
			self
				:diffusealpha(0)
				:sleep(0.5)
				:linear(0.5)
				:diffusealpha(1)
		end
	},
	-- Cleared
	Def.ActorFrame {
		Condition = GAMESTATE:GetPlayMode() ~= PLAY_MODE_BATTLE
			and GAMESTATE:GetPlayMode() ~= PLAY_MODE_RAVE
			and not GAMESTATE:IsDemonstration(),
		LoadActor("extra1") .. {
			Condition = GAMESTATE:IsExtraStage(),
			StartTransitioningCommand = function(self)
				self:hide_if(not GAMESTATE:HasEarnedExtraStage())
			end
		},
		LoadActor("extra2") .. {
			Condition = GAMESTATE:IsExtraStage2(),
			StartTransitioningCommand = function(self)
				self:hide_if(not GAMESTATE:HasEarnedExtraStage())
			end
		},
		LoadActor("cleared") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			end,
			StartTransitioningCommand = function(self)
				self:hide_if(GAMESTATE:HasEarnedExtraStage())
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:sleep(1)
					:linear(0.5)
					:diffusealpha(1)
					:sleep(2)
			end
		}
	},
	-- Winner
	Def.ActorFrame {
		Condition = GAMESTATE:GetPlayMode() == PLAY_MODE_BATTLE
			or GAMESTATE:GetPlayMode() == PLAY_MODE_RAVE,
		LoadActor("p1 win") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			end,
			StartTransitioningCommand = function(self)
				self:hide_if(not GAMESTATE:IsWinner(PLAYER_1))
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:sleep(1.5)
					:linear(0.5)
					:diffusealpha(1)
					:sleep(2)
			end
		},
		LoadActor("p2 win") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			end,
			StartTransitioningCommand = function(self)
				self:hide_if(not GAMESTATE:IsWinner(PLAYER_2))
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:sleep(1.5)
					:linear(0.5)
					:diffusealpha(1)
					:sleep(2)
			end
		},
		LoadActor("draw") .. {
			InitCommand = function(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			end,
			StartTransitioningCommand = function(self)
				self:hide_if(not GAMESTATE:IsDraw())
			end,
			OnCommand = function(self)
				self
					:diffusealpha(0)
					:sleep(1.5)
					:linear(0.5)
					:diffusealpha(1)
					:sleep(2)
			end
		}
	},
	-- Demonstration
	Def.ActorFrame {
		Condition = GAMESTATE:IsDemonstration(),
		Def.Quad {
			InitCommand = function(self)
				self
					:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
					:diffuse(color("0,0,0,1"))
			end,
			OnCommand = function(self)
				self
					:sleep(1.5)
					:diffusealpha(0)
			end
		}
	}
}
