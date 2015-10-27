local c
local player = Var "Player"

local JCommands = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "JudgmentW1Command" ),
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "JudgmentW2Command" ),
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "JudgmentW3Command" ),
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "JudgmentW4Command" ),
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "JudgmentW5Command" ),
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "JudgmentMissCommand" )
}

local TNSFrames = {
	TapNoteScore_W1 = 0,
	TapNoteScore_W2 = 1,
	TapNoteScore_W3 = 2,
	TapNoteScore_W4 = 3,
	TapNoteScore_W5 = 4,
	TapNoteScore_Miss = 5
}

return Def.ActorFrame {
	Def.Sprite {
		Texture = "_judgments",
		Name = "Judgment",
		InitCommand = function(self)
			self
				:pause()
				:visible(false)
		end,
		ResetCommand = function(self)
			self
				:finishtweening()
				:xy(0, 0)
				:stopeffect()
				:visible(false)
		end
	},
	InitCommand = function(self)
		c = self:GetChildren()
	end,
	JudgmentMessageCommand = function(self, param)
		if param.Player ~= player then return end
		if param.HoldNoteScore then return end

		local iNumStates = c.Judgment:GetNumStates()
		local iFrame = TNSFrames[param.TapNoteScore]

		if not iFrame then return end

		if iNumStates == 12 then
			iFrame = iFrame * 2

			if not param.Early then
				iFrame = iFrame + 1
			end
		end

		self:playcommand("Reset")

		c.Judgment:visible(true)
		c.Judgment:setstate(iFrame)
		JCommands[param.TapNoteScore](c.Judgment)
	end
}
