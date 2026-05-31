-- Services/AccountService.luau

local AccountService = {}

AccountService.CurrentUser = nil
AccountService.Users = {}

function AccountService:Register(username, password)
	if self.Users[username] then
		return false, "User already exists"
	end

	local user = {
		Id = #self.Users + 1,
		Username = username,
		Password = password
	}

	self.Users[username] = user

	return true, user
end

function AccountService:Login(username, password)
	local user = self.Users[username]

	if not user then
		return false, "User not found"
	end

	if user.Password ~= password then
		return false, "Invalid password"
	end

	self.CurrentUser = user

	return true, user
end

function AccountService:Logout()
	self.CurrentUser = nil
end

function AccountService:GetCurrentUser()
	return self.CurrentUser
end

return AccountService
