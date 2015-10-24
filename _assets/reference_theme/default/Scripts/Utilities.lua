-- Find a key in tab with the given value.
function FindValue(tab, value)
	for key, name in tab do
		if value == name then
			return key
		end
	end

	return nil
end

-- Return the index of a true value in list.
function FindSelection( list )
	for index, on in list do
		if on then
			return index
		end
	end

	return nil
end

-- Look up each value in a table, returning a table with the resulting strings.
function TableStringLookup( t, group )
	local ret = { }
	for key, val in t do
		Trace(val)
		ret[key] = THEME:GetString(group,val)
	end
	return ret
end

function split( delimiter, text )
	local list = {}
	local pos = 1
	while 1 do
		local first,last = string.find( text, delimiter, pos )
		if first then
			table.insert( list, string.sub(text, pos, first-1) )
			pos = last+1
		else
			table.insert( list, string.sub(text, pos) )
			break
		end
	end
	return list
end

function join( delimiter, list )
	local ret = list[1]
	for i = 2,table.getn(list) do
	ret = ret .. delimiter .. list[i]
	end
	return ret or ""
end

function wrap(val,n)
	local x = val
	Trace( "wrap "..x.." "..n )
	if x<0 then 
		x = x + (math.ceil(-x/n)+1)*n;
	end
	Trace( "adjusted "..x )
	local ret = math.mod(x,n)
	Trace( "ret "..ret )
	return ret
end

function fapproach( val, other_val, to_move )
	if val == other_val then return val end
	local fDelta = other_val - val
	local fSign = fDelta / math.abs( fDelta )
	local fToMove = fSign*to_move
	if math.abs(fToMove) > math.abs(fDelta) then
		fToMove = fDelta	-- snap
	end
	val = val + fToMove
	return val
end

function tableshuffle( t )
	local ret = { }
	for i=1,table.getn(t) do
		table.insert( ret, math.random(i), t[i] );
	end
	return ret
end

function tableslice( t, num )
	local ret = { }
	for i=1,table.getn(t) do
		table.insert( ret, i, t[i] );
	end
	return ret
end


function GetRandomSongBackground()
	for i=0,50 do
		local song = SONGMAN:GetRandomSong()
		if song then
			local path = song:GetBackgroundPath()
			if path then return path end
		end
	end
	return THEME:GetPathG("", "_blank")
end

function GetSongBackground()
	local song = GAMESTATE:GetCurrentSong()
	if song then
		local path = song:GetBackgroundPath()
		if path then return path end
	end
	return THEME:GetPathG("Common","fallback background")
end

function StepsOrTrailToCustomDifficulty( stepsOrTrail )
	if lua.CheckType("Steps", stepsOrTrail) then
		return StepsToCustomDifficulty( stepsOrTrail );
	end
	if lua.CheckType("Trail", stepsOrTrail) then
		return TrailToCustomDifficulty( stepsOrTrail );
	end
end


-- (c) 2005 Glenn Maynard, Chris Danford
-- All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, and/or sell copies of the Software, and to permit persons to
-- whom the Software is furnished to do so, provided that the above
-- copyright notice(s) and this permission notice appear in all copies of
-- the Software and that both the above copyright notice(s) and this
-- permission notice appear in supporting documentation.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
-- THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS
-- INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT
-- OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.

