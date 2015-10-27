return Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenWithMenuElements", "underlay")),
	LoadActor( THEME:GetPathB("", "_moveon") ) .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end
	},
	Def.Actor {
		BeginCommand = function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then
				self:sleep(0.3)
			end

			self:queuecommand("Save")
		end,
		SaveCommand = function()
			SCREENMAN:GetTopScreen():Continue()
		end
	}
}
