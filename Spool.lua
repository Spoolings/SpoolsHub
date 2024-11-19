-- ServerScriptService

local Players = game:GetService("Players")

-- Function to highlight a player's character
local function highlightPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight", character)
    highlight.Archivable = true
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red fill color
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- White outline
    highlight.FillTransparency = 0.5 -- Semi-transparent fill
    highlight.OutlineTransparency = 0 -- No transparency on the outline
end

-- Highlight all existing players
for _, player in pairs(Players:GetPlayers()) do
    highlightPlayer(player)
end

-- Highlight new players when they join
Players.PlayerAdded:Connect(highlightPlayer)
