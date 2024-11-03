local i = 0
while i < 1000000000 do
    i = i + 1
end
print(i)

--[[
$ time luajit -joff loop1m.lua
1000000000
real    0m5.436s
user    0m5.413s
sys     0m0.009s
]]