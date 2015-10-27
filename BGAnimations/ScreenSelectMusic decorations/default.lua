local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player)
	end

	local t = Def.StepsDisplay {
		InitCommand = function(self)
			self:Load("StepsDisplay", GAMESTATE:GetPlayerState(pn))
		end
	}

	if pn == PLAYER_1 then
		t.CurrentStepsP1ChangedMessageCommand = function(self)
			set(self, pn)
		end

		t.CurrentTrailP1ChangedMessageCommand = function(self)
			set(self, pn)
		end
	else
		t.CurrentStepsP2ChangedMessageCommand = function(self)
			set(self, pn)
		end

		t.CurrentTrailP2ChangedMessageCommand = function(self)
			set(self, pn)
		end
	end

	return t
end

local frame = LoadFallbackB()

table.insert(frame, Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X + 140, SCREEN_CENTER_Y - 20)
	end,
	OnCommand = function(self)
		self
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end,
	Def.Sprite {
		Texture = "_banner mask",
		InitCommand = function(self)
			self
				:y(-74)
				:zwrite(1)
				:z(1)
				:blend(Blend.NoEffect)
		end
	},
	Def.ActorProxy {
		BeginCommand = function(self)
			self:SetTarget(SCREENMAN:GetTopScreen():GetChild("Banner"))
		end,
		InitCommand = function(self)
			self:y(-74)
		end
	},
	Def.Sprite {
		Texture = "_banner frame"
	}
})

table.insert(frame, Def.BitmapText {
	Font = "Common Normal",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X - 160, SCREEN_CENTER_Y + 94)
			:playcommand("Set")
	end,
	OnCommand = function(self)
		self
			:shadowlength(2)
			:diffusealpha(0)
			:linear(0.5)
			:diffusealpha(1)
	end,
	OffCommand = function(self)
		self
			:linear(0.5)
			:diffusealpha(0)
	end,
	SetCommand=function(self)
		self:settext(string.gsub(GAMESTATE:GetSongOptionsString(), ", ", "\n"))

		if GAMESTATE:IsAnExtraStage() then
			self:diffuseblink()
		end
	end,
	SongOptionsChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

table.insert(frame, Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X - 44, SCREEN_CENTER_Y - 10)
	end,
	Def.Sprite {
		Texture = "wheel cursor glow",
		InitCommand = function(self)
			self
				:blend(Blend.Add)
				:diffuseshift()
		end
	},
	Def.Sprite {
		Texture = "wheel cursor normal"
	}
})

for pn in ivalues(PlayerNumber) do
	local MetricsName = "OptionsArea" .. PlayerNumberToString(pn)
	local spacing_x = THEME:GetMetric("ModIconRowSelectMusic", "SpacingX")
	local spacing_y = THEME:GetMetric("ModIconRowSelectMusic", "SpacingY")
	local num = THEME:GetMetric("ModIconRowSelectMusic", "NumModIcons")

	table.insert(frame, Def.ActorFrame {
		InitCommand = function(self)
			self:name(MetricsName)
			ActorUtil.LoadAllCommandsAndSetXY(self, Var "LoadingScreen")
		end,
		Def.ActorFrame {
			InitCommand = function(self)
				self:xy(
					(-1 - (num - 1) / 2) * spacing_x,
					(-1 - (num - 1) / 2) * spacing_y
				)
			end,
			Def.Sprite {
				Texture = "option icon header"
			},
			Def.BitmapText {
				Font = "_terminator two 18px",
				InitCommand = function(self)
					self
						:y(-4)
						:settext(PlayerNumberToLocalizedString(pn))
						:diffuse(PlayerColor(pn))
						:shadowlength(0)
				end
			}
		},
		Def.ModIconRow {
			InitCommand = function(self)
				self:Load("ModIconRowSelectMusic", pn)
			end,
			OnCommand = function(self)
				self
					:zoomy(0)
					:linear(0.5)
					:zoomy(1)
			end,
			OffCommand = function(self)
				self
					:linear(0.5)
					:zoomy(0)
			end
		}
	})
end

table.insert(frame, Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X - 120, SCREEN_CENTER_Y - 170)
	end,
	OnCommand = function(self)
		self
			:addx(-SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	Def.Sprite {
		Texture = THEME:GetPathG("MusicSortDisplay","frame")
	},
	Def.BitmapText {
		Font = "_sf square head 13px",
		InitCommand = function(self)
			self
				:maxwidth(300)
				:playcommand("Set")
				:x(10)
				:shadowlength(0)
				:diffuse(color("#fbfb57"))
				:strokecolor(color("#696800"))
		end,
		SetCommand = function(self)
			local so = GAMESTATE:GetSortOrder()

			if so ~= nil then
				self:settext(string.upper(SortOrderToLocalizedString(so)))
			end
		end,
		SortOrderChangedMessageCommand = function(self)
			self:playcommand("Set")
		end
	}
})

table.insert(frame, LoadFont(Var "LoadingScreen", "OptionsMessage") .. {
		InitCommand = function(self)
			self
				:settext("Press &START; again for options")
				:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				:zoom(1.5)
				:pause()
		end,
		OnCommand = function(self)
			self
				:visible(false)
				:draworder(111)
		end,
		ShowPressStartForOptionsCommand = function(self)
			self
				:visible(true)
				:setstate(0)
				:faderight(0.3)
				:fadeleft(0.3)
				:cropleft(-0.3)
				:cropright(1.3)
				:linear(0.4)
				:cropright(-0.3)
		end,
		ShowEnteringOptionsCommand = function(self)
			self
				:settext("Entering options...")
				:finishtweening()
				:setstate(1)
				:sleep(0.25)
				:playcommand("HidePressStartForOptions")
		end,
		HidePressStartForOptionsCommand = function(self)
			self
				:linear(0.4)
				:cropleft(1.3)
		end
})

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PaneDisplay" .. PlayerNumberToString(pn)

	table.insert(frame, Def.PaneDisplay {
		MetricsGroup = "PaneDisplay",
		PlayerNumber = pn,
		InitCommand = function(self)
			self
				:player(pn)
				:playcommand("Set")
				:name(MetricsName)

			ActorUtil.LoadAllCommandsAndSetXY(self, Var "LoadingScreen")
		end,
		SetCommand = function(self)
			self:SetFromGameState()
		end,
		CurrentStepsP1ChangedMessageCommand = function(self)
			self:playcommand("Set")
		end,
		CurrentTrailP1ChangedMessageCommand = function(self)
			self:playcommand("Set")
		end,
		SortOrderChangedMessageCommand = function(self)
			self:playcommand("Set")
		end
	})
end

table.insert(frame, Def.BPMDisplay {
	File = THEME:GetPathF("BPMDisplay", "bpm"),
	Name = "BPMDisplay",
	InitCommand = function(self)
		self
			:horizalign(right)
			:xy(SCREEN_CENTER_X + 294, SCREEN_CENTER_Y - 9)
			:zoomx(0.8)
			:shadowlengthx(0)
			:shadowlengthy(2)
			:shadowcolor(color("#000000"))
	end,
	OnCommand = function(self)
		self
			:stoptweening()
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end,
	SetCommand = function(self)
		self:SetFromGameState()
	end,
	CurrentSongChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

table.insert(frame, LoadActor("_bpm label") .. {
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X + 280, SCREEN_CENTER_Y - 10)
			:horizalign(left)
	end,
	OnCommand = function(self)
		self
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end
})

table.insert(frame, Def.Sprite {
	Texture = "temp bpm meter",
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X + 230, SCREEN_CENTER_Y - 22)
	end,
	OnCommand = function(self)
		self
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end
})

table.insert(frame, Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end,
	OnCommand = function(self)
		self
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end,

	BeginCommand = function(self)
		self:visible(false)
	end,
	Def.Sprite {
		Texture = "bpm meter",
		InitCommand = function(self)
			self
				:setstate(0)
				:pause()
		end
	},
	Def.Quad {
		InitCommand = function(self)
			self
				:diffuse(color("#FFFFFF"))
				:setsize(120, 16)
				:horizalign(right)
				:addx(60)
		end,
		BeginCommand = function(self)
			self
				:zwrite(1)
				:z(1)
				:blend(Blend.NoEffect)
		end,
		UpdateCommand=function(self)
			local function CalcZoomX(fBpm)
				local fWidth

				if fBpm > 300 then
					fWidth = 120
				elseif fBpm < 60 then
					fWidth = 0
				else
					fWidth = scale(fBpm, 60, 300, 0, 120)
				end

				local fSpacing = 12
				local fWidth2 = fSpacing * math.floor(
					(fWidth + fSpacing / 2) / fSpacing
				)

				return fWidth2 / 120
			end
		end
	},
	Def.Sprite {
		Texture = "bpm meter",
		InitCommand = function(self)
			self
				:setstate(1)
				:pause()
				:glowshift()
				:effectcolor1(color("1, 1, 1, 0"))
				:effectcolor2(color("1, 1, 1, 0.1"))
				:effectclock("bgm")
		end,
		BeginCommand = function(self)
			self:ztest(1)
		end
	}
})

table.insert(frame, Def.Sprite {
	Texture = "stop icon",
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X + 296, SCREEN_CENTER_Y - 4)
	end,
	OnCommand = function(self)
		self
			:addx(SCREEN_WIDTH * 0.6)
			:bounceend(0.5)
			:addx(-SCREEN_WIDTH * 0.6)
	end,
	OffCommand = function(self)
		self
			:bouncebegin(0.5)
			:addx(SCREEN_WIDTH * 0.6)
	end,
	SetCommand = function(self)
			local b = false
			local song = GAMESTATE:GetCurrentSong()

			if song then
				b = song:GetTimingData():HasStops()
			end

			self:visible(b)
	end,
	CurrentSongChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

table.insert(frame, Def.BitmapText {
	Font = "_venacti Bold 15px",
	InitCommand = function(self)
		self
			:horizalign(left)
			:xy(SCREEN_CENTER_X - 14, SCREEN_CENTER_Y - 24)
			:settext("xxxx")
			:shadowlengthx(0)
			:shadowlengthy(2)
			:shadowcolor(color("#000000"))
			:maxwidth(180)
	end,
	SetCommand = function(self)
		local s = "---"
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()

		if song then
			local s2 = song:GetDisplayArtist()

			if s2 ~= "" then
				s = "/" .. s2
			end
		end

		if course then
			local trail = GAMESTATE:GetCurrentTrail(
				GAMESTATE:GetMasterPlayerNumber()
			)
			local c2 = join( ", ", trail:GetArtists())

			if c2 ~= "" then
				s = c2
			end
		end

		self:settext(s)
	end,
	CurrentSongChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	DisplayLanguageChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

table.insert(frame, Def.BitmapText {
	Font = "_venacti Bold 15px",
	InitCommand = function(self)
		self
			:horizalign(right)
			:xy(SCREEN_CENTER_X + 224, SCREEN_CENTER_Y - 6)
			:settext("xxxx")
			:shadowlengthx(0)
			:shadowlengthy(2)
			:shadowcolor(color("#000000"))
			:maxwidth(156)
	end,
	SetCommand = function(self)
		local s = "---"
		local song = GAMESTATE:GetCurrentSong()
		local course = GAMESTATE:GetCurrentCourse()

		if song then
			local s2 = song:GetGenre()

			if s2 ~= "" then
				s = "_" .. s2
			end
		end

		if course then
			local postfix = "Stages"
			s = course:GetEstimatedNumStages() .. " " .. postfix
		end

		self:settext(s)
	end,
	CurrentSongChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentCourseChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

table.insert(frame, Def.Quad {
	Name = "CourseContentsListMaskTop",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X + 176, SCREEN_CENTER_Y - 56)
			:setsize(SCREEN_WIDTH / 2, 128)
			:clearzbuffer(true)
			:zwrite(true)
			:blend(Blend.NoEffect)
	end,
	ShowCommand = function(self)
		self
			:bouncebegin(0.3)
			:zoomy(1)
	end,
	HideCommand = function(self)
		self
			:linear(0.3)
			:zoomy(0)
	end
})

table.insert(frame, Def.Quad {
	Name = "CourseContentsListMaskBottom",
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X + 176, SCREEN_CENTER_Y + 172)
			:setsize(SCREEN_WIDTH / 2, 128)
			:zwrite(true)
			:blend(Blend.NoEffect)
	end,
	ShowCommand = function(self)
		self
			:bouncebegin(0.3)
			:zoomy(1)
	end,
	HideCommand = function(self)
		self
			:linear(0.3)
			:zoomy(0)
	end
})

table.insert(frame, Def.CourseContentsList {
	MaxSongs = 5,
	Display = Def.ActorFrame {
		InitCommand = function(self)
			self:setsize(270, 34)
		end,
		LoadActor("_CourseEntryDisplay bar"),
		Def.TextBanner {
			InitCommand = function(self)
				self
					:Load("TextBanner")
					:SetFromString("", "", "", "", "", "")
			end,
			SetSongCommand = function(self, params)
				if params.Song then
					self
						:SetFromSong(params.Song)
						:diffuse(SONGMAN:GetSongColor(params.Song))
				else
					self
						:SetFromString("??????????", "??????????", "", "", "", "" )
						:diffuse(color("#FFFFFF"))
				end
			end
		},
		Def.BitmapText {
			Font = "CourseEntryDisplay number",
			OnCommand = function(self)
				self
					:x(-118)
					:shadowlength(0)
			end,
			SetSongCommand = function(self, params)
				self:settext(string.format("%i", params.Number))
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			OnCommand = function(self)
				self
					:xy(SCREEN_CENTER_X - 200, -8)
					:zoom(0.7)
					:shadowlength(0)
			end,
			DifficultyChangedCommand = function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then
					return
				end

				self
					:settext(params.Meter)
					:diffuse(StepsOrTrailToColor(params.Trail))
			end
		},
		Def.BitmapText {
			Font = "Common Normal",
			OnCommand = function(self)
				self
					:xy(-SCREEN_CENTER_X * 0.2, SCREEN_CENTER_Y - 230)
					:zoom(0.75)
					:horizalign(right)
					:shadowlength(0)
			end,
			SetSongCommand = function(self, params)
				self:settext(params.Modifiers)
			end
		},
		Def.BitmapText {
			Font = "CourseEntryDisplay difficulty",
			OnCommand = function(self)
				self
					:xy(SCREEN_CENTER_X - 254, 1)
					:shadowlength(0)
					:settext("1")
			end,
			DifficultyChangedCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then
					return
				end

				self:diffuse(StepsOrTrailToColor(params.Trail))
			end
		}
	},
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X + 160, SCREEN_CENTER_Y + 91)
	end,
	OnCommand = function(self)
		self
			:zoomy(0)
			:bounceend(0.3)
			:zoom(1)
			:ztest(true)
	end,
	OffCommand = function(self)
		self
			:zoomy(1)
			:bouncebegin(0.3)
			:zoomy(0)
	end,
	ShowCommand = function(self)
		self
			:bouncebegin(0.3)
			:zoomy(1)
	end,
	HideCommand = function(self)
		self
			:linear(0.3)
			:zoomy(0)
	end,
	SetCommand = function(self)
		self
			:SetFromGameState()
			:setsecondsperitem(0.7)
			:SetSecondsPauseBetweenItems(0.7)
			:scrollwithpadding(0, 0)
	end,
	CurrentTrailP1ChangedMessageCommand = function(self)
		self:playcommand("Set")
	end,
	CurrentTrailP2ChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

for pn in ivalues(PlayerNumber) do
	local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn)

	table.insert(frame, StepsDisplay(pn) .. {
		InitCommand = function(self)
			self
				:player(pn)
				:name(MetricsName)

			ActorUtil.LoadAllCommandsAndSetXY(self, Var "LoadingScreen")
		end
	})
end

table.insert(frame, Def.ActorFrame{
	InitCommand = function(self)
		self
			:xy(SCREEN_CENTER_X - 190, SCREEN_CENTER_Y - 32)
			:diffusealpha(0)
	end,
	ShowCommand = function(self)
		self
			:stoptweening()
			:linear(0.2)
			:diffusealpha(1)
	end,
	HideCommand = function(self)
		self
			:stoptweening()
			:linear(0.2)
			:diffusealpha(0)
	end,
	Def.Sprite {
		Texture = "long balloon"
	},
	Def.BitmapText {
		Font = "_terminator two 30px",
		Name = "SongLength",
		InitCommand = function(self)
			self
				:xy(-56, -10)
				:shadowlength(0)
				:diffuse(color("#E2E2E2"))
				:diffusebottomedge(color("#CECECE"))
				:strokecolor(color("#00000000"))
		end,
		SetCommand = function(self)
			local Song = GAMESTATE:GetCurrentSong()

			if Song then
				local time = Song:MusicLengthSeconds()
				time = SecondsToMSSMsMs(time)
				time = string.sub(time, 0, string.len(time)-3)

				self:settext(time)
			else
				self:settext("")
			end
		end
	},
	Def.BitmapText {
		Font = "_venacti bold 24px",
		Name = "NumStages",
		InitCommand = function(self)
			self
				:xy(30, -6)
				:shadowlengthx(0)
				:shadowlengthy(1)
				:skewx(0)
				:zoom(0.7)
				:diffusebottomedge(color("#068EE1FF"))
				:strokecolor(color("#FF000000"))
		end,
		SetCommand = function(self)
			local Song = GAMESTATE:GetCurrentSong()

			if Song then
				local postfix = " STAGES"
				local numStages = GAMESTATE:GetNumStagesForCurrentSongAndStepsOrCourse()

				self:settext(numStages .. postfix)
			else
				self:settext("")
			end
		end
	},
	SetCommand = function(self)
		local Song = GAMESTATE:GetCurrentSong()

		self:playcommandonchildren(
			(Song and (Song:IsLong() or Song:IsMarathon())) and "Show" or "Hide"
		)
	end,
	CurrentSongChangedMessageCommand = function(self)
		self:playcommand("Set")
	end
})

if not GAMESTATE:IsCourseMode() then
	table.insert(frame, Def.StepsDisplayList {
		Name = "StepsDisplayList",
		CursorP1 = Def.ActorFrame {
			BeginCommand = function(self)
				self:visible(true)
			end,
			StepsSelectedMessageCommand = function(self, param)
				if param.Player ~= PLAYER_1 then return end
				self:visible(false)
			end,
			children = {
				Def.Sprite {
					Texture ="StepsDisplayList highlight",
					InitCommand = function(self)
						self
							:addx(-10)
							:diffusealpha(0.3)
					end,
					BeginCommand = function(self)
						self:player(PLAYER_1)
					end,
					OnCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					CurrentStepsP1ChangedMessageCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					CurrentStepsP2ChangedMessageCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					UpdateAlphaCommand=function(self)
						local s1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
						local s2 = GAMESTATE:GetCurrentSteps(PLAYER_2)

						self:stoptweening()

						if not s1 or not s2
						or s1:GetDifficulty() == s2:GetDifficulty() then
							self
								:linear(0.08)
								:diffusealpha(0.15)
						else
							self
								:linear(0.08)
								:diffusealpha(0.3)
						end
					end,
					PlayerJoinedMessageCommand = function(self, param)
						if param.Player ~= PLAYER_1 then return end
						self:visible(true)
					end
				},
				Def.ActorFrame {
					InitCommand = function(self)
						self
							:x(-150)
							:bounce()
							:effectmagnitude(-12, 0, 0)
							:effectperiod(1.0)
							:effectoffset(0.0)
							:effectclock("bgm")
					end,
					children = {
						LoadActor("StepsDisplayList cursor p1") .. {
							BeginCommand = function(self)
								self:player(PLAYER_1)
							end,
							PlayerJoinedMessageCommand = function(self, param)
								if param.Player ~= PLAYER_1 then return end
								self:visible(true)
							end
						},
						Def.BitmapText {
							Font = "_terminator two 18px",
							InitCommand = function(self)
								self
									:xy(-4, -3)
									:settext("P1")
									:diffuse(PlayerColor(PLAYER_1))
									:shadowlength(0)
							end,
							BeginCommand = function(self)
								self:player(PLAYER_1)
							end,
							PlayerJoinedMessageCommand=function(self, param)
								if param.Player ~= PLAYER_1 then return end
								self:visible(true)
							end
						}
					}
				}
			}
		},
		CursorP2 = Def.ActorFrame {
			BeginCommand = function(self)
				self:visible(true)
			end,
			StepsSelectedMessageCommand = function(self, param)
				if param.Player ~= PLAYER_2 then return end
				self:visible(false)
			end,
			children = {
				Def.Sprite {
					Texture = "StepsDisplayList highlight",
					InitCommand = function(self)
						self
							:addx(-10)
							:zoomx(-1)
							:diffusealpha(0.3)
					end,
					BeginCommand = function(self)
						self:player(PLAYER_2)
					end,
					OnCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					CurrentStepsP1ChangedMessageCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					CurrentStepsP2ChangedMessageCommand = function(self)
						self:playcommand("UpdateAlpha")
					end,
					UpdateAlphaCommand=function(self)
						local s1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
						local s2 = GAMESTATE:GetCurrentSteps(PLAYER_2)

						self:stoptweening()

						if not s1 or not s2
						or s1:GetDifficulty() == s2:GetDifficulty() then
							self:linear(0.08)
							self:diffusealpha(0.15)
						else
							self:linear(0.08)
							self:diffusealpha(0.3)
						end
					end,
					PlayerJoinedMessageCommand = function(self, param)
						if param.Player ~= PLAYER_2 then return end
						self:visible(true)
					end
				},
				Def.ActorFrame {
					InitCommand = function(self)
						self
							:x(130)
							:bounce()
							:effectmagnitude(12, 0, 0)
							:effectperiod(1.0)
							:effectoffset(0.0)
							:effectclock("bgm")
					end,
					children = {
						LoadActor("StepsDisplayList cursor p2") .. {
							BeginCommand = function(self)
								self:player(PLAYER_2)
							end,
							PlayerJoinedMessageCommand = function(self, param)
								if param.Player ~= PLAYER_2 then return end
								self:visible(true)
							end
						},
						Def.BitmapText {
							Font = "_terminator two 18px",
							InitCommand = function(self)
								self
									:xy(4, -3)
									:settext("P2")
									:diffuse(PlayerColor(PLAYER_2))
									:shadowlength(0)
							end,
							BeginCommand = function(self)
								self:player(PLAYER_2)
							end,
							PlayerJoinedMessageCommand = function(self,param )
								if param.Player ~= PLAYER_2 then return end
								self:visible(true)
							end
						}
					}
				}
			}
		},
		CursorP1Frame = Def.Actor{},
		CursorP2Frame = Def.Actor{},
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X + 166, SCREEN_CENTER_Y + 20)
		end
	})
end

table.insert(frame, Def.Quad {
	InitCommand = function(self)
		self
			:FullScreen()
			:draworder(110)
			:diffuse(color("#000000"))
			:diffusealpha(0)
	end,
	OffCommand = function(self)
		self
			:linear(0.3)
			:diffusealpha(1)
	end
})

return frame
