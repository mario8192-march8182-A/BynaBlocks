-- Engine/Instance.luau
-- BynaBlocks Instance System

local Instance = {}

local Classes = {
	Part = true,
	Folder = true,
	Model = true,
	Workspace = true,
	Script = true,
	Player = true
}

local function CreateObject(className)
	assert(
		Classes[className],
		("Unknown class '%s'"):format(tostring(className))
	)

	local object = {
		ClassName = className,
		Name = className,

		Parent = nil,
		Children = {},

		Archivable = true
	}

	function object:GetChildren()
		return self.Children
	end

	function object:GetDescendants()
		local descendants = {}

		local function Scan(target)
			for _, child in ipairs(target.Children) do
				table.insert(descendants, child)
				Scan(child)
			end
		end

		Scan(self)

		return descendants
	end

	function object:FindFirstChild(name)
		for _, child in ipairs(self.Children) do
			if child.Name == name then
				return child
			end
		end

		return nil
	end

	function object:AddChild(child)
		if child.Parent then
			child.Parent:RemoveChild(child)
		end

		table.insert(self.Children, child)
		child.Parent = self
	end

	function object:RemoveChild(child)
		for i, v in ipairs(self.Children) do
			if v == child then
				table.remove(self.Children, i)
				child.Parent = nil
				return
			end
		end
	end

	function object:Destroy()
		for _, child in ipairs(self.Children) do
			child:Destroy()
		end

		self.Children = {}

		if self.Parent then
			self.Parent:RemoveChild(self)
		end
	end

	return object
end

function Instance.new(className)
	return CreateObject(className)
end

return Instance
