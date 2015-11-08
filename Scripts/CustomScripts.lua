function JudgmentTransformCommand( self, params )
	local y = -30
	if params.bReverse then y = y * -1 end
	self:x( 0 )
	self:y( y )
end

function JudgmentTransformSharedCommand( self, params )
	local y = -30
	if params.bReverse then y = y * -1 end
	self:x( 0 )
	self:y( y )
end

function ComboTransformCommand( self, params )
	-- +/- 17 offset for ITG placement
	local y = 30 + 17
	if params.bReverse then y = y * -1 end

	if params.bCentered then
		if params.bReverse then
			y = y - 30
		else
			y = y + 30
		end
	end
	self:x( 0 )
	self:y( y )
end
