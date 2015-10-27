local frame = LoadFallbackB()

table.insert(frame, StandardDecorationFromFile("StageFrame", "StageFrame"))

table.insert(frame, Def.Sprite {
	Texture = "_warning",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			:vertalign(top)
			:wag()
			:effectmagnitude(0, 0, 10)
			:effectperiod(2)
	end,
	OnCommand = function(self)
		self:diffusealpha(0)
	end,
	ShowDangerAllMessageCommand = function(self)
		self
			:stoptweening()
			:accelerate(0.3)
			:diffusealpha(1)
	end,
	HideDangerAllMessageCommand = function(self)
		self
			:stoptweening()
			:accelerate(0.3)
			:diffusealpha(0)
	end
})

table.insert(frame, StandardDecorationFromFile("LifeFrame", "LifeFrame"))
table.insert(frame, StandardDecorationFromFile("ScoreFrame", "ScoreFrame"))
table.insert(frame, StandardDecorationFromFile("LeftFrame", "LeftFrame"))
table.insert(frame, StandardDecorationFromFile("RightFrame", "RightFrame"))

if ShowStandardDecoration("ModIconRows") then
	for pn in ivalues(PlayerNumber) do
		table.insert(frame,
			StandardDecorationFromTable("ModIconRow" .. ToEnumShortString(pn),
			Def.ModIconRow {
				InitCommand = function(self)
					self:Load("ModIconRowGameplay" .. ToEnumShortString(pn), pn)
				end
			})
		)
	end
end

return frame
