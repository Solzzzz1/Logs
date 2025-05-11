return function(...)
    local players = shared._services.Players:GetPlayers()
    local random = players[math.random(1, #players)]
    repeat
        random = players[math.random(1, #players)]
        task.wait()
    until random.Team.Name == "Survivors"

    print("Our random chosen survivor is : " .. random.Name)
    for _, Tools in shared._services.Players.LocalPlayer.Backpack:GetChildren() do
        Tools.Parent = shared._services.Players.LocalPlayer.Character;
        task.wait(0.2)
        local args = {
            Tools.Name,
            random
        }
        shared._services.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GiveItem"):FireServer(unpack(args))
        task.wait(0.1)
        warn("Gave " .. Tools.Name .. "!")
    end
end
