shared.name = "dependencies"
shared._loadContent = function(path)
    local c=readfile(path)
    local f=loadstring(c)
    if f then f() else warn("Failed to load") end
end
shared.require = function(moduleName)
  return shared._loadContent(shared.name.."/"..moduleName)
end
