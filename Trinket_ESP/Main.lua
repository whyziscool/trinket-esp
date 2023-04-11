local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Camera = Workspace.CurrentCamera
local RenderStepped = RunService.RenderStepped

local Cache = {}
local TrinketType = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevZse/Rogue_Lineage/main/Trinket_ESP/TrinketType.lua"))()

local function NewDrawing(Type, Properties)
	local Drawing = Drawing.new(Type)
	
	for i, v in pairs(Properties) do
		Drawing[i] = v
	end
	
	return Drawing
end

local function NewESP(Object, Info)
	local ESP = {}
	
	ESP.Box = NewDrawing('Square', {
		Thickness = 1,
		ZIndex = 1
	})
	
	ESP.BoxOutline = NewDrawing('Square', {
		Color = Color3.fromRGB(0, 0, 0),
		Thickness = 3,
	})
	
	ESP.Name = NewDrawing('Text', {
		Center = true,
		Font = 2,
		Outline = true,
		Size = 16
	})
	
	Cache[Object] = {
		Info = Info,
		ESP = ESP
	}
end

local function RemoveESP(Object)
	if Cache[Object] then
		for _, v in pairs(Cache[Object].ESP) do
			v:Remove()
		end
		
		Cache[Object] = nil
	end
end

local function Update()
	for i, v in pairs(Cache) do
		if not i or not i.Parent then
			RemoveESP(i); continue
		end
		
		local Pos, InView = Camera:WorldToViewportPoint(i.Position)
		if not InView then
			v.ESP.Box.Visible = false; v.ESP.BoxOutline.Visible = false; v.ESP.Name.Visible = false; continue
		end
		
		local ScaleFactor = 1 / (Pos.Z * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 100
		local Size = 16 * ScaleFactor
		
		v.ESP.Box.Color = v.Info.Color
		v.ESP.Box.Position = Vector2.new(Pos.X - (Size / 2), Pos.Y - (Size / 2))
		v.ESP.Box.Size = Vector2.new(Size, Size)
		v.ESP.Box.Visible = true
		
		v.ESP.BoxOutline.Position = v.ESP.Box.Position
		v.ESP.BoxOutline.Size = v.ESP.Box.Size
		v.ESP.BoxOutline.Visible = true
		
		v.ESP.Name.Color = v.Info.Color
		v.ESP.Name.Text = v.Info.Name
		v.ESP.Name.Position = Vector2.new(Pos.X, Pos.Y - Size * 0.5 - v.ESP.Name.TextBounds.Y * 1.5)
		v.ESP.Name.Visible = true
	end
end

for _, v in pairs(Workspace:GetChildren()) do
	if v:FindFirstChildWhichIsA('ClickDetector', true) and v:FindFirstChild('ID') then
		NewESP(v, TrinketType(v))
	end
end

Workspace.ChildAdded:Connect(function(Object)
	if Object:FindFirstChildWhichIsA('ClickDetector', true) and Object:FindFirstChild('ID') then
		NewESP(Object, TrinketType(Object))
	end
end)

RenderStepped:Connect(Update)
