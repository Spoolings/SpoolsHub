-- ServerScriptService

local Players = game:GetService("Players")

local function highlightPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight", character)
    highlight.Archivable = true
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
end

local function refreshHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        highlightPlayer(player)
    end
end

-- Initial highlight
refreshHighlights()

-- Repeat every second
local refreshInterval = 1 -- seconds
local refreshHandle = coroutine.wrap(function()
    while true do
        task.wait(refreshInterval)
        refreshHighlights()
    end
end)
refreshHandle()
