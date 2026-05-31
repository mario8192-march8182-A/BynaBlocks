local Signal = {}
Signal.__index = Signal

function Signal.new()
	local self = setmetatable({}, Signal)
	self._connections = {}
	return self
end

function Signal:Connect(callback)
	local connection = {
		Connected = true
	}

	function connection:Disconnect()
		self.Connected = false
	end

	table.insert(self._connections, {
		Connection = connection,
		Callback = callback
	})

	return connection
end

function Signal:Fire(...)
	for _, listener in ipairs(self._connections) do
		if listener.Connection.Connected then
			listener.Callback(...)
		end
	end
end

return Signal
