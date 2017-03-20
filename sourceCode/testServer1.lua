--server cannot reply the client's messenge
local socket = require("socket")
host = host or "*"
port = port or 8080
if arg then
	host = arg[1] or host
	port = arg[2] or port
end
print("Binding to host '" ..host.. "' and port " ..port.. "...")
s = assert(socket.bind(host, port))
i, p   = s:getsockname()
assert(i, p)
print("Waiting connection from talker on " .. i .. ":" .. p .. "...")
c = assert(s:accept())
print("Connected! Messenge from client:")
l, e = c:receive()
while not e do
	print(l)
	l, e = c:receive()
end
print(e)