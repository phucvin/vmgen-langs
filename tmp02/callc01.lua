local ffi = require("ffi")
ffi.cdef[[
int abs(int);
]]
-- print(ffi.C.abs(-24))
local n = 0
for i = 1,100000000 do
    n = n + ffi.C.abs(-i)
end
print(n)

--[[
$ time luajit -joff callc01.lua
5.00000005e+15

real    0m10.839s
user    0m10.802s
sys     0m0.005s
]]