if PREFSMAN:GetPreference("ShowSongOptions") ~= "Maybe_Ask" then
	return LoadActor(THEME:GetPathB("", "_options to options"))
end

return Def.ActorFrame {
	LoadActor(THEME:GetPathB("", "_fade out with sound")),
	Def.BitmapText {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:settext("Press &START; for options")
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 100)
				:visible(false)
		end,
		AskForGoToOptionsCommand = function(self)
			self
				:visible(true)
				:diffusealpha(0)
				:linear(0.15)
				:zoomy(1)
				:diffusealpha(1)
				:sleep(1)
				:linear(0.15)
				:diffusealpha(0)
				:zoomy(0)
		end,
		GoToOptionsCommand = function(self)
			self:visible(false)
		end
	},
	Def.BitmapText {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:settext("Entering options...")
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 100)
				:visible(false)
		end,
		AskForGoToOptionsCommand = function(self)
			self
				:visible(false)
				:linear(0.15)
				:zoomy(1)
				:diffusealpha(1)
				:sleep(1)
				:linear(0.15)
				:diffusealpha(0)
				:zoomy(0)
		end,
		GoToOptionsCommand = function(self)
			self:visible(true)
		end
	}
}
