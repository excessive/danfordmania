local function CreditsText(pn)
	function update(self)
		self:settext(ScreenSystemLayerHelpers.GetCreditsMessage(pn))
	end

	function UpdateVisible(self)
		local screen = SCREENMAN:GetTopScreen()
		local bShow = true

		if screen then
			bShow = THEME:GetMetric(screen:GetName(), "ShowCoinsAndCredits")
		end

		self:visible(bShow)
	end

	return Def.BitmapText {
		Font = "Common Normal",
		InitCommand = function(self)
			local x, y

			if pn == PLAYER_1 then
				x = "CreditsP1X"
				y = "CreditsP1Y"
			elseif pn == PLAYER_2 then
				x = "CreditsP2X"
				y = "CreditsP2Y"
			end

			self
				:xy(
					THEME:GetMetric(Var "LoadingScreen", x),
					THEME:GetMetric(Var "LoadingScreen", y)
				)
				:shadowlength(0)
				:strokecolor(color("#000000AA"))

		end,
		RefreshCreditTextMessageCommand = update,
		CoinInsertedMessageCommand = update,
		PlayerJoinedMessageCommand = update,
		ScreenChangedMessageCommand = UpdateVisible
	}
end

return Def.ActorFrame {
	Def.ActorFrame {
		Def.Quad {
			InitCommand = function(self)
				self
					:zoomtowidth(SCREEN_WIDTH)
					:zoomtoheight(30)
					:horizalign(left)
					:vertalign(top)
					:y(SCREEN_TOP)
					:diffusetopedge(color("#FFFFFF"))
					:diffusebottomedge(color("#000000"))
					:diffusealpha(0)
			end,
			OnCommand = function(self)
				self
					:finishtweening()
					:x(SCREEN_LEFT)
					:diffusealpha(0.3)
					:addx(-SCREEN_WIDTH)
					:linear(0.5)
					:addx(SCREEN_WIDTH)
			end,
			OffCommand = function(self)
				self
					:sleep(3)
					:linear(0.5)
					:diffusealpha(0)
			end
		},
		LoadFont(Var "LoadingScreen","SystemMessage") .. {
			Name="Text";
			InitCommand = function(self)
				self
					:maxwidth(750)
					:horizalign(left)
					:vertalign(top)
					:y(SCREEN_TOP + 10)
					:strokecolor(color("#000000"))
					:shadowlength(0)
					:diffusealpha(0)
			end,
			OnCommand = function(self)
				self
					:finishtweening()
					:x(SCREEN_LEFT + 10)
					:diffusealpha(1)
					:addx(-SCREEN_WIDTH)
					:linear(0.5)
					:addx(SCREEN_WIDTH)
			end,
			OffCommand = function(self)
				self
					:sleep(3)
					:linear(0.5)
					:diffusealpha(0)
			end
		},
		SystemMessageMessageCommand = function(self, params)
			self
				:GetChild("Text")
				:settext(params.Message)
				:playcommand("On")

			if params.NoAnimate then
				self:finishtweening();
			end

			self:playcommand("Off")
		end,
		HideSystemMessageMessageCommand = function(self)
			self:finishtweening()
		end
	},
	CreditsText(PLAYER_1),
	CreditsText(PLAYER_2)
}
