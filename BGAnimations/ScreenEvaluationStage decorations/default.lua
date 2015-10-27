function GraphDisplay(pn)
	return Def.ActorFrame {
		Def.GraphDisplay {
			InitCommand = function(self)
				self:Load("GraphDisplay")
			end,
			BeginCommand = function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats()

				self
					:Set(ss, ss:GetPlayerStageStats(pn))
					:player(pn)
			end
		}
	}
end

function ComboGraph(pn)
	return Def.ActorFrame {
		Def.ComboGraph {
			InitCommand = function(self)
				self:Load("ComboGraph")
			end,
			BeginCommand = function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats()

				self
					:Set(ss, ss:GetPlayerStageStats(pn))
					:player(pn)
			end
		}
	}
end


local frame = LoadFallbackB()

if ShowStandardDecoration("GraphDisplay") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame, StandardDecorationFromTable(
			"GraphDisplay" .. ToEnumShortString(pn),
			GraphDisplay(pn)
		))
	end
end

if ShowStandardDecoration("ComboGraph") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame, StandardDecorationFromTable(
			"ComboGraph" .. ToEnumShortString(pn),
			ComboGraph(pn)
		))
	end
end

if ShowStandardDecoration("ItsARecord") then
	for pn in ivalues(PlayerNumber) do
		-- only check if player exists, don't draw for both if one doesn't exist
		if GAMESTATE:IsSideJoined(pn) then
			table.insert(frame, StandardDecorationFromTable(
				"ItsARecord" .. ToEnumShortString(pn),
				Def.ActorFrame {
					BeginCommand = function(self)
						local pss = SCREENMAN
							:GetTopScreen()
							:GetStageStats()
							:GetPlayerStageStats(pn)
						local index = pss:GetMachineHighScoreIndex()

						if index == 0 then
							self
								:GetChild("Record")
								:visible(true)

							self
								:GetChild("NoRecord")
								:visible(false)

							return
						end

						local pSongOrCourse = GAMESTATE:GetCurrentCourse()
							or GAMESTATE:GetCurrentSong()
						local pSteps = GAMESTATE:GetCurrentSteps(pn)
						local hsl = PROFILEMAN
							:GetMachineProfile()
							:GetHighScoreList(pSongOrCourse,pSteps)
						local hs = hsl:GetHighScores()[1]
						local hsName = hs:GetName()
						local hsPerc = FormatPercentScore(hs:GetPercentDP())

						self
							:GetChild("Record")
							:visible(false)

						self
							:GetChild("NoRecord")
							:visible(true)

						if hsl then
							self
								:GetChild("NoRecord")
								:settext(hsName .. ":\n" .. hsPerc)
						else
							self
								:GetChild("NoRecord")
								:settext("")
						end
					end,
					Def.BitmapText {
						Font = "_sf sports night ns upright 16px",
						InitCommand = function(self)
							self
								:name("Record")
								:settext("It's a New\nRecord!!!")
								:diffuse(color("#fffc00"))
								:strokecolor(color("#807e00"))
								:vertspacing(-2)
								:shadowlength(0)
								:glowshift()
						end
					},
					Def.BitmapText {
						Font = "Common Normal",
						InitCommand = function(self)
							self
								:name("NoRecord")
								:strokecolor(color("#706f43"))
								:shadowlength(0)
						end
					}
				}
			))
		end
	end
end

if ShowStandardDecoration("TimingDifficulty") then
	table.insert(frame, StandardDecorationFromFile(
		"TimingDifficultyFrame",
		"TimingDifficultyFrame"
	))

	table.insert(frame, StandardDecorationFromTable(
		"TimingDifficultyNumber",
		LoadFont(Var "LoadingScreen", "TimingDifficultyNumber") .. {
			InitCommand = function(self)
				self:settext(GetTimingDifficulty())
			end
		}
	))
end

if ShowStandardDecoration("ModIconRows") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame, StandardDecorationFromTable(
			"ModIconRow" .. ToEnumShortString(pn),
			Def.ModIconRow {
				InitCommand = function(self)
					self:Load("ModIconRowEvaluation" .. ToEnumShortString(pn), pn)
				end
			}
		))
	end
end

if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame, StandardDecorationFromTable(
			"StepsDisplay" .. ToEnumShortString(pn),
			Def.StepsDisplay {
				InitCommand = function(self)
					self
						:Load("StepsDisplayEvaluation", pn)
						:SetFromGameState(pn)
				end
			}
		))
	end
end

if ShowStandardDecoration("StageAward") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame, StandardDecorationFromFile(
			"StageAward" .. ToEnumShortString(pn),
			"StageAward"
		) .. {
			BeginCommand = function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats()
				self:playcommand("Set", {
					StageAward = ss:GetPlayerStageStats(pn):GetStageAward()
				})
			end
		})
	end
end

for i in ivalues(EarnedExtraStage) do
	if i ~= "EarnedExtraStage_No" then
		table.insert(frame, StandardDecorationFromFile(
			"TryExtraStage",
			"Try" .. ToEnumShortString(i)
		) .. {
			BeginCommand = function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats()
				self:visible(i == ss:GetEarnedExtraStage())
			end
		})
	end
end

return frame
