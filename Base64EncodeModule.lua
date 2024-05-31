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


local function base64Encode(input)
	local binaryStr = ""
	for i = 1, #input do
		binaryStr = binaryStr .. toBinary(string.byte(input, i))
	end

	local padding = ""
	while #binaryStr % 6 ~= 0 do
		binaryStr = binaryStr .. "0"
		padding = padding .. "="
	end

	local encoded = ""
	for i = 1, #binaryStr, 6 do
		local sextet = binaryStr:sub(i, i + 5)
		local index = fromBinary(sextet) + 1
		encoded = encoded .. base64chars:sub(index, index)
	end

	return encoded .. padding
end
