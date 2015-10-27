local pm = GAMESTATE:GetPlayMode()

-- This relies on play modes and stages having the same naming for
-- everything but Regular.
local stage = pm == "PlayMode_Regular" and GAMESTATE:GetCurrentStage()
	or "Stage_" .. string.sub(pm, 10)

return Def.ActorFrame {
	LoadActor(stage) .. {
		Name = "stage",
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		OnCommand = function(self)
			self
				:cropbottom(1)
				:sleep(0.3)
				:linear(0.3)
				:cropbottom(0)
				:sleep(1)
		end
	},
	LoadActor("glow bar") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		OnCommand = function(self)
			local stage = self:GetParent():GetChild("stage")
			local width = stage:GetWidth() + 40
			local height = stage:GetHeight() + 6

			self
				:zoomx(0)
				:zoomy(0.5)
				:diffusealpha(0)
				:addy(-height / 2)
				:accelerate(0.3)
				:zoomtowidth(width)
				:diffusealpha(0.8)
				:linear(0.3)
				:addy(height)
				:decelerate(0.2)
				:zoomtowidth(width / 2)
				:zoomy(0.5)
				:diffusealpha(0)
		end
	}
}
