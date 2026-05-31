-- Engine/Vector3.luau
-- BynaBlocks Vector3

local Vector3 = {}
Vector3.__index = Vector3

function Vector3.new(x, y, z)
	local self = setmetatable({}, Vector3)

	self.X = x or 0
	self.Y = y or 0
	self.Z = z or 0

	return self
end

function Vector3:Magnitude()
	return math.sqrt(
		self.X * self.X +
		self.Y * self.Y +
		self.Z * self.Z
	)
end

function Vector3:Unit()
	local mag = self:Magnitude()

	if mag == 0 then
		return Vector3.new(0, 0, 0)
	end

	return Vector3.new(
		self.X / mag,
		self.Y / mag,
		self.Z / mag
	)
end

function Vector3:Dot(other)
	return
		self.X * other.X +
		self.Y * other.Y +
		self.Z * other.Z
end

function Vector3:Clone()
	return Vector3.new(
		self.X,
		self.Y,
		self.Z
	)
end

function Vector3.__add(a, b)
	return Vector3.new(
		a.X + b.X,
		a.Y + b.Y,
		a.Z + b.Z
	)
end

function Vector3.__sub(a, b)
	return Vector3.new(
		a.X - b.X,
		a.Y - b.Y,
		a.Z - b.Z
	)
end

function Vector3.__mul(a, b)
	if type(a) == "number" then
		return Vector3.new(
			a * b.X,
			a * b.Y,
			a * b.Z
		)
	end

	if type(b) == "number" then
		return Vector3.new(
			a.X * b,
			a.Y * b,
			a.Z * b
		)
	end

	error("Vector3 multiplication requires a number")
end

function Vector3.__div(a, b)
	if type(b) ~= "number" then
		error("Vector3 division requires a number")
	end

	return Vector3.new(
		a.X / b,
		a.Y / b,
		a.Z / b
	)
end

function Vector3.__tostring(v)
	return string.format(
		"Vector3(%s, %s, %s)",
		v.X,
		v.Y,
		v.Z
	)
end

Vector3.zero = Vector3.new(0, 0, 0)
Vector3.one = Vector3.new(1, 1, 1)

return Vector3
