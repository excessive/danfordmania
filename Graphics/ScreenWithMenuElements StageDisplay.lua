local frame = Def.ActorFrame {
	BeginCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentSongChangedMessageCommand = function(self)
		self
			:finishtweening()
			:playcommand("Set")
	end
}

function MakeBitmapTest()
	return LoadFont(Var "LoadingScreen", "StageDisplay") .. {
		InitCommand = function(self)
			self
				:y(2)
				:shadowlength(0)
		end
	}
end

for s in ivalues(Stage) do
	table.insert(frame, MakeBitmapTest() .. {
		SetCommand = function(self, params)
			local Stage = GAMESTATE:GetCurrentStage()
			local StageIndex = GAMESTATE:GetCurrentStageIndex()
			local screen = SCREENMAN:GetTopScreen()

			if screen and screen.GetStageStats then
				local ss = screen:GetStageStats()
				Stage = ss:GetStage()
				StageIndex = ss:GetStageIndex()
			end

			self
				:visible(Stage == s)
				:settext(StageToLocalizedString(Stage))
				:diffuse(StageToColor(s))
				:strokecolor(StageToStrokeColor(s))
		end
	})
end

return frame
