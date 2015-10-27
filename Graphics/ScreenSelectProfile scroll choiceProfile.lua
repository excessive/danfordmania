return Def.ActorFrame {
	LoadActor(
		PROFILEMAN
			:GetLocalProfile(Var("GameCommand"):GetProfileID())
			:GetCharacter()
			:GetIconPath()
	) .. {
		InitCommand = function(self)
			self:x(20)
		end
	},
	Def.BitmapText {
		Font = "Common Normal",
		Text = PROFILEMAN
			:GetLocalProfile(Var("GameCommand"):GetProfileID())
			:GetDisplayName(),
		OnCommand = function(self)
			self
				:diffusealpha(0)
				:linear(0.3)
				:diffusealpha(1)
		end,
		OffCommand = function(self)
			self
				:linear(0.3)
				:diffusealpha(0)
		end,
		InitCommand = function(self)
			self
				:x(50)
				:halign(0)
				:shadowlength(2)
		end,
		GainFocusCommand = function(self)
			self
				:stoptweening()
				:diffuseshift()
				:effectperiod(0.5)
				:effectcolor1(1, 0.5, 0.5, 1)
				:effectcolor2(0.5, 0.25, 0.25, 1)
				:linear(0)
				:zoom(1.0)
		end,
		LoseFocusCommand = function(self)
			self
				:stoptweening()
				:stopeffect()
				:linear(0)
				:zoom(0.9)
		end,
		DisabledCommand = function(self)
			self:diffuse(0.5, 0.5, 0.5, 1)
		end
	},
	Def.BitmapText {
		Font = "Common Normal",
		Text = PROFILEMAN
			:GetLocalProfile(Var("GameCommand")
			:GetProfileID())
			:GetNumTotalSongsPlayed() .. " song(s) played",
		OnCommand = function(self)
			self
				:diffusealpha(0)
				:linear(0.3)
				:diffusealpha(1)
		end,
		OffCommand = function(self)
			self
				:linear(0.3)
				:diffusealpha(0)
		end,
		InitCommand = function(self)
			self
				:x(280)
				:halign(0)
				:shadowlength(2)
		end,
		GainFocusCommand = function(self)
			self
				:stoptweening()
				:diffuseshift()
				:effectperiod(0.5)
				:effectcolor1(1, 0.5, 0.5, 1)
				:effectcolor2(0.5, 0.25, 0.25, 1)
				:linear(0)
				:zoom(1.0)
		end,
		LoseFocusCommand = function(self)
			self
				:stoptweening()
				:stopeffect()
				:linear(0)
				:zoom(0.9)
		end,
		DisabledCommand = function(self)
			self:diffuse(0.5, 0.5, 0.5, 1)
		end
	}
}
