shared.name = "dependencies"
shared._loadContent = function(path)
    local c=readfile(path)
    local f=loadstring(c)
    if f then f() else warn("Failed to load") end
end
shared.require = function(moduleName)
  return shared._loadContent(shared.name.."/"..moduleName)
end
shared.fileExists = function(name)
    local s,e = pcall(function()
        return readfile(shared.name.."/"..name)    
    end)

    if not s and e then return false else return true end
end
shared.readfilesrc = function(modName)
    local result = ""
    pcall(function()
        result = readfile(shared.name.."/"..modName)    
    end)
    return result
end
shared.createFile = function(name,source)
    writefile(shared.name.."/"..name, source)
    print("wrote " .. name .. "")
end
shared.httpget = function(URL)
    return game:HttpGet(URL)
end
shared.globalEnv = getgenv()
httpget = shared.httpget;
globalEnv = getgenv();

shared.loadDeps = function(...)
    return globalEnv.loadstring(shared.httpget("https://raw.githubusercontent.com/Solzzzz1/Logs/refs/heads/main/DepsLoader.lua"))() 
end
shared.loadDeps()
