local frame = LoadFallbackB()

table.insert(frame, Def.Sprite {
	Texture = "settings pane",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X - 200, SCREEN_TOP)
			:vertalign(top)
	end
})

table.insert(frame, Def.BitmapText {
	Font = "Common Normal",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X - 202, SCREEN_TOP + 40)
			:shadowlengthx(0)
			:shadowlengthy(2)
			:playcommand("Set")
	end,
	SetCommand = function(self)
		local s = string.format("StepMania %s", ProductVersion())

		local fmt = THEME:GetString(Var "LoadingScreen", "%d songs in %d groups")
		local text = string.format(fmt, SONGMAN:GetNumSongs(), SONGMAN:GetNumSongGroups())
		s = s .. "\n" .. text

		local fmt = THEME:GetString(Var "LoadingScreen", "%d courses in %d groups")
		local text = string.format(fmt, SONGMAN:GetNumCourses(), SONGMAN:GetNumCourseGroups())
		s = s .. "\n" .. text

		local fmt = THEME:GetString(Var "LoadingScreen", "Difficulty:")
		local text = fmt .. " " .. GetTimingDifficulty()
		s = s .. "\n" .. text

		self:settext(s)
	end
})

table.insert(frame, Def.BitmapText {
	Font = "Common Normal",
	InitCommand = function(self)
		self
			:xy(SCREEN_LEFT + 20, SCREEN_TOP + 36)
			:horizalign(left)
			:diffuse(0.6, 0.6, 0.6, 1)
			:shadowlength(2)
	end
})

return frame
