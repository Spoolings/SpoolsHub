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






-- Assuming you have a function to get the dominant color of an entity
function getEntityColor(entity)
    local r, g, b = getColorFromEntity(entity) -- Replace with actual implementation
    return r, g, b
end

-- Define a "bright red" color
local brightRed = {r = 255, g = 0, b = 0}

-- Function to check if a color is close to bright red
function isBrightRed(color)
    local r, g, b = color
    -- Implement color difference calculation here (e.g., Euclidean distance)
    local distance = math.sqrt((r - brightRed.r)^2 + (g - brightRed.g)^2 + (b - brightRed.b)^2)
    return distance < threshold -- Adjust the threshold as needed
end

-- In your main ESP loop:
for _, entity in ipairs(entities) do
    local color = getEntityColor(entity)
    if isBrightRed(color) then
        -- Highlight the entity as a target
        highlightEntity(entity)
    end
end
