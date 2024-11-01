local function fib(n)
    if n < 2 then
        return n
    else
        return fib(n-1) + fib(n-2)
    end
end

print(fib(40))

--[[
$ time luajit -joff fib01.lua
102334155
real    0m4.533s
user    0m4.469s
sys     0m0.002s
]]