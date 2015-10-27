return Def.ActorFrame {
	LoadActor("pay") .. {
		Condition = GAMESTATE:GetCoinMode() == "CoinMode_Pay",
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 120)
				:diffuseshift()
				:effectcolor1(0.5, 0.5, 0.5, 1)
				:effectcolor2(1, 1, 1, 1)
		end
	},
	LoadActor("free") .. {
		Condition = GAMESTATE:GetCoinMode() == "CoinMode_Free",
		OnCommand = function(self)
			self
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y - 60)
				:diffuseshift()
				:effectcolor1(0.5, 0.5, 0.5, 1)
				:effectcolor2(1, 1, 1, 1)
		end
	},
	LoadActor("jp") .. {
		Condition = GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit",
		Stretch = 1,
		NumTilesHigh = 1,
		TilesStartY = 380,
		TilesSpacingX = 10000,
		TileVelocityX = -300,
		OnCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 50)
		end
	},
	LoadActor("dp") .. {
		Condition = GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit",
		Stretch = 1,
		NumTilesHigh = 1,
		TilesStartY = 380,
		TilesSpacingY = 10000,
		TileVelocityX = -300,
		OnCommand = function(self)
			self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y + 50)
		end
	},
}
