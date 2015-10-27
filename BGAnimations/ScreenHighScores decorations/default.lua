local frame = Def.ActorFrame {}

table.insert(frame, Def.ActorFrame {})

local NumColumns = THEME:GetMetric(Var "LoadingScreen", "NumColumns")

for i=1, NumColumns do
	table.insert(frame, Def.Sprite {
		Texture = "difficulty pill",
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 60 + 80 * (i - 1), SCREEN_CENTER_Y - 154)
		end
	})

	local st = THEME:GetMetric(Var "LoadingScreen", "ColumnStepsType" .. i)
	local dc = THEME:GetMetric(Var "LoadingScreen", "ColumnDifficulty" .. i)
	local ct = "CourseType_Nonstop"
	local s = GetCustomDifficulty(st, dc, ct)

	table.insert(frame, Def.BitmapText {
		Font = "_venacti Bold 13px",
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X - 60 + 80 * (i - 1), SCREEN_CENTER_Y - 158)
				:uppercase(true)
				:settext(CustomDifficultyToLocalizedString(s))
				:diffuse(CustomDifficultyToColor(s))
				:shadowlength(0)
		end
	})
end

table.insert(frame, Def.BitmapText {
	Font = "_terminator two 24px",
	InitCommand = function(self)
		self
			:settext("SINGLE")
			:diffuse(color("#a38b00"))
			:xy(SCREEN_CENTER_X - 220, SCREEN_CENTER_Y - 160)
			:shadowlength(0)
			:strokecolor(color("#00000000"))
	end
})

table.insert(frame, Def.BitmapText {
	Font = "_terminator two 30px",
	InitCommand = function(self)
		self
			:settext("Best Scores")
			:uppercase(true)
			:diffuse(color("#FFFFFF"))
			:xy(SCREEN_CENTER_X - 130, SCREEN_CENTER_Y - 206)
			:shadowlength(0)
			:strokecolor(color("#3b009c44"))
	end
})

return frame
