# Base64 Encoding and Decoding in Lua

This project provides functions to encode and decode strings using Base64 in Lua. It includes helper functions for binary string manipulation and handles padding correctly to ensure accurate decoding.

![Image of encryption]((https://i.imgur.com/X2pCBUT.png)

## Features

- **Base64 Encoding**: Converts a string to its Base64 representation.
- **Base64 Decoding**: Converts a Base64 encoded string back to its original form.
- **Binary Conversion Helpers**: Functions to convert numbers to binary strings and vice versa.

## Usage

### Encoding a String

To encode a string to Base64:

```lua
local testString = "Hello, World!"
local encoded = base64Encode(testString)
print("Encoded:", encoded)
```

### Decoding a Base64 String

To decode a Base64 encoded string:

```lua
-- You can specify encoded text, or just decode the other text.
local decoded = base64Decode(encoded)
print("Decoded:", decoded)
```

## Contributing

If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.
