local gc = Var("GameCommand")
local st = gc:GetStyle():GetStyleType()
local max_stages = PREFSMAN:GetPreference("SongsPerPlay")
local master_pn = GAMESTATE:GetMasterPlayerNumber()
local pad_file = ""

if st == "StyleType_OnePlayerOneSide"
or st == "StyleType_OnePlayerTwoSides" then
	pad_file = st .. " " .. master_pn
elseif st == "StyleType_TwoPlayersTwoSides" then
	pad_file = st
else
	assert(0)
end

return Def.ActorFrame {
	Def.Sprite {
		Texture = "preview " .. st,
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X - 150, SCREEN_CENTER_Y + 190)
				:vertalign(bottom)
		end,
		OnCommand = function(self)
			self
				:cropbottom(1)
				:fadebottom(1)
				:linear(0.2)
				:cropbottom(0)
				:fadebottom(0)
		end,
		OffCommand = function(self)
			self
				:croptop(0)
				:fadetop(0)
				:linear(0.2)
				:croptop(1)
				:fadetop(1)
		end,
		GainFocusCommand = function(self)
			self:visible(true)
		end,
		LoseFocusCommand = function(self)
			self:visible(false)
		end
	},
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X + 156, SCREEN_CENTER_Y + 52)
		end,
		OnCommand = function(self)
			self
				:addy(280)
				:decelerate(0.22)
				:addy(-280)
		end,
		OffCommand = function(self)
			self
				:accelerate(0.22)
				:addy(280)
		end,
		GainFocusCommand = function(self)
			self:visible(true)
		end,
		LoseFocusCommand = function(self)
			self:visible(false)
		end,
		Def.Sprite {
			Texture = "card frame " .. st
		},
		Def.BitmapText {
			Font = "_sf square head 26px",
			InitCommand = function(self)
				self
					:y(-51)
					:settext(string.upper(gc:GetText()))
					:maxwidth(500)
					:shadowlength(0)
			end
		},
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:horizalign(left)
					:xy(-12, -2)
					:maxwidth(300)
					:shadowlength(0)
					:diffuse(color("#000000"))
			end,
			BeginCommand=function(self)
				if st == "StyleType_OnePlayerTwoSides" then
					self:settext("ONE PLAYER USES\nTWO CONTROLLERS");
				else
					self:settext("EACH PLAYER USES\nONE CONTROLLER");
				end
			end
		},
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:horizalign(right)
					:xy(98, 42)
					:settext("MAX STAGE/")
					:maxwidth(300)
					:shadowlength(0)
					:diffuse(color("#32d545"))
			end
		},
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:horizalign(right)
					:xy(120, 42)
					:settext(max_stages)
					:maxwidth(100)
					:shadowlength(0)
					:diffuse(color("#259c33"))
			end
		},
		Def.Sprite {
			Texture = "card " .. pad_file,
			InitCommand = function(self)
				self:xy(-82, 8)
			end
		}
	},
	Def.ActorFrame {
		InitCommand = function(self)
			self:xy(
				SCREEN_CENTER_X + 20 + gc:GetIndex() * 106,
				SCREEN_CENTER_Y - 90
			)
		end,
		OnCommand = function(self)
			self:runcommandsonleaves(function(self)
				self
					:diffusealpha(0)
					:sleep(gc:GetIndex() / 12)
					:linear(0.16)
					:diffusealpha(1)
			end)
		end,
		OffCommand = function(self)
			self:runcommandsonleaves(function(self)
				self
					:diffusealpha(1)
					:sleep(gc:GetIndex() / 12)
					:linear(0.16)
					:diffusealpha(0)
			end)
		end,
		Def.Sprite {
			Texture = "icon frame focus",
			GainFocusCommand = function(self)
				self:visible(true)
			end,
			LoseFocusCommand = function(self)
				self:visible(false)
			end
		},
		Def.Sprite {
			Texture = "icon frame nofocus",
			GainFocusCommand = function(self)
				self:visible(false)
			end,
			LoseFocusCommand = function(self)
				self:visible(true)
			end
		},
		Def.Sprite {
			Texture = "icon glow",
			InitCommand = function(self)
				self:blend(Blend.Add)
			end,
			GainFocusCommand = function(self)
				self
					:diffuseshift()
					:visible(true)
			end,
			LoseFocusCommand = function(self)
				self
					:stopeffect()
					:visible(false)
			end
		},
		Def.BitmapText {
			Font = "_terminator two 18px",
			InitCommand = function(self)
				self
					:y(-28)
					:settext(string.upper(gc:GetText()))
					:shadowlength(0)
					:maxwidth(80)
			end
		},
		Def.ActorFrame {
			InitCommand = function(self)
				self:y(10)
			end,
			Def.Sprite {
				Texture = "icon " .. pad_file
			}
		}
	}
}
