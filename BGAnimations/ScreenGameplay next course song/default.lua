return Def.ActorFrame {
	Def.Quad {
		InitCommand = function(self)
			self
				:diffuse(color("#000000"))
				:stretchto(SCREEN_LEFT, SCREEN_TOP, SCREEN_RIGHT, SCREEN_BOTTOM)
		end,
		StartCommand = function(self)
			self
				:diffusealpha(0)
				:sleep(1)
				:linear(0.5)
				:diffusealpha(1)
		end,
		FinishCommand = function(self)
			self
				:sleep(1)
				:linear(0.5)
				:diffusealpha(0)
		end
	},
	Def.Sprite {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		BeforeLoadingNextCourseSongMessageCommand = function(self)
			self:LoadFromSongBanner(SCREENMAN:GetTopScreen():GetNextCourseSong())
		end,
		StartCommand = function(self)
			self
				:scaletoclipped(512, 160)
				:diffusealpha(0)
				:sleep(1)
				:linear(0.5)
				:diffusealpha(1)
		end,
		FinishCommand = function(self)
			self
				:sleep(1)
				:linear(0.5)
				:diffusealpha(0)
		end
	}
}
