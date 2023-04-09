local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Camera = Workspace.CurrentCamera
local RenderStepped = RunService.RenderStepped

local Cache = {}
local Trinkets = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevZse/Rogue_Lineage/main/Trinket_ESP/Main.lua"))()

local function NewDrawing(Type, Properties)
	local Drawing = Drawing.new(Type)

	for i, v in pairs(Properties) do
		Drawing[i] = v
	end

	return Drawing
end

local function NewESP(Obj)
	local ESP = {}

	ESP.Box = NewDrawing('Square', {
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		ZIndex = 1
	})

	ESP.BoxOutline = NewDrawing('Square', {
		Color = Color3.fromRGB(0, 0, 0),
		Thickness = 3,
	})

	ESP.Name = NewDrawing('Text', {
		Center = true,
		Color = Color3.fromRGB(255, 255, 255),
		Font = 2,
		Outline = true,
		Size = 12
	})

	Cache[Obj] = ESP
end

local function RemoveESP(Obj)
	if Cache[Obj] then
		for _, v in pairs(Cache[Obj]) do
			v:Remove()
		end
		Cache[Obj] = nil
	end
end

local function Update()
	for i, v in pairs(Cache) do
		if not i or not i.Parent then
			RemoveESP(i); continue
		end

		local Pos, InView = Camera:WorldToViewportPoint(i.Position)
		if not InView then
			v.Box.Visible = false; v.BoxOutline.Visible = false; v.Name.Visible = false; continue
		end

		local ScaleFactor = 1 / (Pos.Z * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 100
		local Width, Height = 16 * ScaleFactor, 16 * ScaleFactor

		v.Box.Position = Vector2.new(Pos.X - (Width / 2), Pos.Y - (Height / 2))
		v.Box.Size = Vector2.new(Width, Height)
		v.Box.Visible = true

		v.BoxOutline.Position = v.Box.Position
		v.BoxOutline.Size = v.Box.Size
		v.BoxOutline.Visible = true

		v.Name.Text = i.Name
		v.Name.Position = Vector2.new(Pos.X, Pos.Y - Height * 0.5 - v.Name.TextBounds.Y * 1.5)
		v.Name.Visible = true
	end
end

RenderStepped:Connect(Update)
