local skynet = require "skynet" 
local socket = require "skynet.socket"

local function accept(clientfd,addr)
    skynet.newservice("agent",clientfd,addr)--创建一个agent服务（lua虚拟机）
end

skynet.start(function()
    -- body
    local listenfd=socket.listen("0.0.0.0",8888)
    skynet.uniqueservice("redis")
    skynet.uniqueservice("hall")
    socket.start(listenfd,accept) --绑定listenfd到accept函数
end)
