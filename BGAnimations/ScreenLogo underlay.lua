return Def.ActorFrame {
	Def.Sprite {
		Texture = THEME:GetPathG(Var "LoadingScreen","GameLogo "..GAMESTATE:GetCurrentGame():GetName()),
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
		end,
		OnCommand = function(self)
			self
				:zoomy(0)
				:bounceend(0.5)
				:zoomy(1)
				:glowshift()
				:effectperiod(2.5)
				:effectcolor1(1, 1, 1, 0.0)
				:effectcolor2(1, 1, 1, 0.5)
		end
	}
}
