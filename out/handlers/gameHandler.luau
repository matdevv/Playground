-- Compiled with roblox-ts v3.0.0
local playerManager
do
	playerManager = setmetatable({}, {
		__tostring = function()
			return "playerManager"
		end,
	})
	playerManager.__index = playerManager
	function playerManager.new(...)
		local self = setmetatable({}, playerManager)
		return self:constructor(...) or self
	end
	function playerManager:constructor()
		self.data = {}
	end
	function playerManager:playerJoin(plr)
		print(`{plr.Name} has joined!`)
		local _data = self.data
		local _plr = plr
		local _arg1 = {
			name = plr.Name,
			id = plr.UserId,
			time = 0,
		}
		_data[_plr] = _arg1
	end
end
return {
	playerManager = playerManager,
}
