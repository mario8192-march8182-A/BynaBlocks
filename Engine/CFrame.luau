-- Engine/CFrame.luau
-- BynaBlocks CFrame

local Vector3 = require("Engine.Vector3")

local CFrame = {}
CFrame.__index = CFrame

function CFrame.new(x, y, z, rx, ry, rz)
	local self = setmetatable({}, CFrame)

	self.Position = Vector3.new(
		x or 0,
		y or 0,
		z or 0
	)

	self.Rotation = Vector3.new(
		rx or 0,
		ry or 0,
		rz or 0
	)

	return self
end

function CFrame.fromPosition(position)
	return CFrame.new(
		position.X,
		position.Y,
		position.Z
	)
end

function CFrame.fromRotation(rx, ry, rz)
	return CFrame.new(
		0,
		0,
		0,
		rx,
		ry,
		rz
	)
end

function CFrame:Clone()
	return CFrame.new(
		self.Position.X,
		self.Position.Y,
		self.Position.Z,
		self.Rotation.X,
		self.Rotation.Y,
		self.Rotation.Z
	)
end

function CFrame:GetPosition()
	return self.Position
end

function CFrame:GetRotation()
	return self.Rotation
end

function CFrame.__add(a, b)
	return CFrame.new(
		a.Position.X + b.X,
		a.Position.Y + b.Y,
		a.Position.Z + b.Z,
		a.Rotation.X,
		a.Rotation.Y,
		a.Rotation.Z
	)
end

function CFrame.__sub(a, b)
	return CFrame.new(
		a.Position.X - b.X,
		a.Position.Y - b.Y,
		a.Position.Z - b.Z,
		a.Rotation.X,
		a.Rotation.Y,
		a.Rotation.Z
	)
end

function CFrame.__tostring(cf)
	return string.format(
		"CFrame(Pos=%s Rot=%s)",
		tostring(cf.Position),
		tostring(cf.Rotation)
	)
end

return CFrame
