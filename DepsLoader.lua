local dependencies = {
    ["dependencies/forceBoss.luau"] = "https://raw.githubusercontent.com/Solzzzz1/Logs/refs/heads/main/forceBoss.luau",
    ["dependencies/giveItems.luau"] = "https://raw.githubusercontent.com/Solzzzz1/Logs/refs/heads/main/giveItems.luau",
    ["dependencies/propImpulse.luau"] = "https://raw.githubusercontent.com/Solzzzz1/Logs/refs/heads/main/propImpulse.lua",
    ["dependencies/tpPropsToCenter.luau"] = "https://raw.githubusercontent.com/Solzzzz1/Logs/refs/heads/main/tpPropsToCenter.luau"
}

if not isfolder("dependencies") then
    makefolder("dependencies")
end

for PATH, Url in pairs(dependencies) do
    if not isfile(PATH) then
        local success, content = pcall(function()
            return game:HttpGet(Url)
        end)
        if success then
            writefile(PATH, content)
        else
            warn("Failed to download: " .. PATH)
        end
    end
end

print("Dependencies downloaded")
















































