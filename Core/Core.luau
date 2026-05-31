-- Engine/Core.luau
-- BynaBlocks Engine Core

local Core = {}

Core.Name = "BynaBlocks"
Core.Version = "0.1.0-alpha"

local Services = {}

function Core:RegisterService(name, service)
	assert(type(name) == "string", "Service name must be a string")
	assert(service ~= nil, "Service cannot be nil")

	Services[name] = service

	print(string.format(
		"[Core] Registered service '%s'",
		name
	))
end

function Core:GetService(name)
	local service = Services[name]

	if not service then
		error(string.format(
			"[Core] Service '%s' not found",
			tostring(name)
		))
	end

	return service
end

function Core:HasService(name)
	return Services[name] ~= nil
end

function Core:GetVersion()
	return self.Version
end

function Core:GetName()
	return self.Name
end

function Core:Init()
	print("====================================")
	print("      BynaBlocks Engine")
	print("      Version " .. self.Version)
	print("====================================")
end

function Core:Shutdown()
	print("[Core] Shutting down...")
end

return Core
