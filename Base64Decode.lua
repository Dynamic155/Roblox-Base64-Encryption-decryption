local base64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local function fromBinary(bin)
	local num = 0
	for i = 1, #bin do
		local bit = bin:sub(i, i)
		num = num + tonumber(bit) * 2^(#bin - i)
	end
	return num
end


local function toBinary(num)
	local bin = ""
	for i = 7, 0, -1 do
		local bit = math.floor(num / 2^i) % 2
		bin = bin .. bit
	end
	return bin
end

local function base64Decode(input)
	local paddingLength = 0
	if input:sub(-2) == "==" then
		paddingLength = 2
		input = input:sub(1, -3)
	elseif input:sub(-1) == "=" then
		paddingLength = 1
		input = input:sub(1, -2)
	end

	local binaryStr = ""
	for i = 1, #input do
		local char = input:sub(i, i)
		local index = base64chars:find(char) - 1
		binaryStr = binaryStr .. toBinary(index):sub(3)
	end

	binaryStr = binaryStr:sub(1, #binaryStr - paddingLength * 2)

	local decoded = ""
	for i = 1, #binaryStr, 8 do
		local byte = binaryStr:sub(i, i + 7)
		if #byte == 8 then
			decoded = decoded .. string.char(fromBinary(byte))
		end
	end

	return decoded
end

print(base64Decode("SGVsbG8sIFJvYmxveCE=="))
