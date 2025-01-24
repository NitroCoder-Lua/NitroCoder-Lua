-- This script should be placed in **StarterPlayer -> StarterPlayerScripts**.

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local targetPlayer = nil -- The player to look at (can be set to another player, here it's the first other player in the game)

-- Function to set the target player you want to always face
local function setTargetPlayer()
    -- Find the first player in the game who is not the current player
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player then
            targetPlayer = p
            break
        end
    end
end

-- Make sure to set the target player when the player joins the game
setTargetPlayer()

-- Function to update the camera's orientation to always face the target player's head
local function updateCamera()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        local targetHead = targetPlayer.Character.Head
        local targetPosition = targetHead.Position

        -- Make the camera position update so it always faces the target head
        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
    end
end

-- Run the updateCamera function every frame
game:GetService("RunService").RenderStepped:Connect(function()
    updateCamera()
end)
