return function(...)
    for _, props in shared._services.Workspace.Props.Model:GetChildren() do
        local args = {
            [1] = props;
            [2] = true
        }
        
        shared._services.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GrabRemote"):FireServer(unpack(args))
        task.wait(0.05)
        local args = {
            [1] = props;
            [2] = false
        }
        
        shared._services.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GrabRemote"):FireServer(unpack(args))
        task.wait(0.05)
        pcall(function()
            props:ApplyImpulse(
                Vector3.new(
                    0,
                    5000,
                    0
                )
            )
        end)
        task.wait(0.09)
    end
end
