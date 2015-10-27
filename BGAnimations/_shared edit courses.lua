return Def.ActorFrame {
	Def.ActorFrame {
		OnCommand = function(self)
			self:xy(SCREEN_CENTER_X + 180, SCREEN_CENTER_Y)
		end,
		OffCommand = function(self)
			self
				:accelerate(0.5)
				:addx(SCREEN_WIDTH / 2)
		end,
		Def.BitmapText {
			Font = "Common Normal",
			OnCommand = function(self)
				self
					:horizalign(left)
					:xy(-80, -130)
					:playcommand("CurrentCourseChanged")
			end,
			CurrentCourseChangedMessageCommand = function(self)
				local c = GAMESTATE:GetCurrentCourse()

				if c then
					self:settext(c:GetDisplayFullTitle())
				else
					self:settext("")
				end
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			OnCommand = function(self)
				self
					:horizalign(left)
					:xy(-80, -100)
					:playcommand("CurrentTrailP1Changed")
			end,
			CurrentTrailP1ChangedMessageCommand = function(self)
				local t = GAMESTATE:GetCurrentTrail(PLAYER_1)

				if t then
					self:settext(string.format("%s, %s",
						GameManager.StepsTypeToLocalizedString(t:GetStepsType()),
						CourseDifficultyToLocalizedString(t:GetDifficulty())
					)
				else
					self:settext("")
				end
			end
		}
	}
}
