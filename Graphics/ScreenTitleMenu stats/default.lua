-- Statistics Panel
local panel = Def.Sprite {
	Texture     = "panel",
	InitCommand = function(self)
		self
			:xy(0, -2)
			:vertalign("VertAlign_Top")
	end
}

-- Statistics
local stats = Def.BitmapText {
	Font        = "Common Normal",
	InitCommand = function(self)
		local s = "StepMania " .. ProductVersion()

		local fmt  = THEME:GetString(Var "LoadingScreen", "%d songs in %d groups")
		local text = string.format(
			fmt,
			SONGMAN:GetNumSongs(),
			SONGMAN:GetNumSongGroups()
		)
		s = s .. "\n" .. text

		local fmt  = THEME:GetString(Var "LoadingScreen", "%d courses in %d groups")
		local text = string.format(
			fmt,
			SONGMAN:GetNumCourses(),
			SONGMAN:GetNumCourseGroups()
		)
		s = s .. "\n" .. text

		if PREFSMAN:GetPreference("UseUnlockSystem") then
			local fmt  = THEME:GetString(Var "LoadingScreen", "%d unlocks")
			local text = string.format(
				fmt,
				UNLOCKMAN:GetNumUnlocks()
			)
			s = s .. "\n" .. text
		end

		local fmt  = THEME:GetString(Var "LoadingScreen", "Gametype:") .. " %s"
		local text = string.format(
			fmt,
			GAMESTATE:GetCurrentGame():GetName()
		)
		s = s .. "\n" .. text

		local fmt  = THEME:GetString(Var "LoadingScreen", "Difficulty:") .. " %s"
		local text = string.format(
			fmt,
			GetTimingDifficulty()
		)
		s = s .. "\n" .. text

		self
			:xy(-2, 44)
			:shadowlengthx(0)
			:shadowlengthy(2)
			:settext(s)
	end
}

return Def.ActorFrame { panel, stats }
