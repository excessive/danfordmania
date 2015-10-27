local frame = Def.ActorFrame {
	InitCommand = function(self)
		self:runcommandsonleaves(function(self)
			self:ztest(true)
		end)
	end
}

table.insert(frame, Def.Sprite {
	Texture = "frame",
	InitCommand = function(self)
		self:diffusealpha(0.1)
	end
})

table.insert(frame, Def.TextBanner {
	InitCommand = function(self)
		self
			:xy(-196, 0)
			:Load("TextBannerHighScores")
	end,
	SetCommand=function(self, params)
		if params.Song then
			self:SetFromSong(params.Song)
			self:diffuse(SONGMAN:GetSongColor(params.Song))
		else
			self:SetFromString(params.Course:GetTitle())
			self:diffuse(SONGMAN:GetCourseColor(params.Course))
		end
	end
})

local c
local Scores = Def.ActorFrame {
	InitCommand = function(self)
		c = self:GetChildren()
	end
}
table.insert(frame, Scores)

local NumColumns = THEME:GetMetric(Var "LoadingScreen", "NumColumns")

for i=1, NumColumns do
	local x_pos = -60 + 80 * (i - 1)

	table.insert(Scores, LoadFont(Var "LoadingScreen","Name") .. {
		Name = i .. "Name",
		InitCommand = function(self)
			self
				:xy(x_pos, 6)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000"))
				:maxwidth(68)
		end
	})

	table.insert(Scores, LoadFont(Var "LoadingScreen","Score") .. {
		Name = i .. "Score",
		InitCommand = function(self)
			self
				:xy(x_pos, -10)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000"))
				:maxwidth(68)
		end
	})

	table.insert(Scores, Def.Sprite {
		Texture = "filled",
		Name = i .. "Filled",
		InitCommand = function(self)
			self:x(x_pos)
		end
	})

	table.insert(Scores, Def.Sprite {
		Texture = "empty",
		Name = i .. "Empty",
		InitCommand = function(self)
			self:x(x_pos)
		end
	})
end

local sNoScoreName = THEME:GetMetric("Common", "NoScoreName")

Scores.SetCommand = function(self, params)
	local pProfile = PROFILEMAN:GetMachineProfile()

	for name, child in pairs(c) do
		child:visible(false)
	end

	for i=1, NumColumns do
		c[i .. "Empty"]:visible(true)
	end

	local Current = params.Song or params.Course

	if Current then
		for i, CurrentItem in pairs(params.Entries) do
			if CurrentItem then
				local name = c[i .. "Name"]
				local score = c[i .. "Score"]
				local filled = c[i .. "Filled"]
				local empty = c[i .. "Empty"]

				name:visible(true)
				score:visible(true)
				filled:visible(true)
				empty:visible(false)

				local hsl = pProfile:GetHighScoreList(Current, CurrentItem)
				local hs = hsl and hsl:GetHighScores()

				if hs and #hs > 0 then
					name:settext(hs[1]:GetName())
					score:settext(FormatPercentScore(hs[1]:GetPercentDP()))
				else
					name:settext(sNoScoreName)
					score:settext(FormatPercentScore(0))
				end
			end
		end
	end
end

return frame
