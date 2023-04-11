return function(Object: Instance)
	local Particle: ParticleEmitter = Object:FindFirstChildWhichIsA("PointLight", true)
	local Light: PointLight = Object:FindFirstChildWhichIsA("PointLight")
	
	if Object:IsA('MeshPart') then
		if Object.MeshId == 'rbxassetid://5196551436' then
			return 'Amulet'
		elseif Object.MeshId == 'rbxassetid://923469333' then
			return 'Candy'
		elseif Object.MeshId == 'rbxassetid://5204003946' then
			return 'Goblet'
		elseif Object.MeshId == 'rbxassetid://2520762076' then
			return 'Howler Friend'
		elseif Object.MeshId == 'rbxassetid://5196577540' then
			return 'Old Amulet'
		elseif Object.MeshId == 'rbxassetid://5196782997' then
			return 'Old Ring'
		elseif Object.MeshId == 'rbxassetid://5196776695' then
			return 'Ring'
		elseif Object.MeshId == 'rbxassetid://5204453430' then
			return 'Scroll'
		end
	elseif Object:IsA('Part') then
		if Object.Color == Color3.fromRGB(89, 34, 89) then
			return '???'
		elseif Object.Color == Color3.fromRGB(164, 187, 190) then
			return 'Diamond'
		elseif Object.Color == Color3.fromRGB(0, 184, 49) then
			return 'Emerald'
		elseif Object.Color == Color3.fromRGB(128, 187, 219) then
			return 'Fairfrozen'
		elseif Object.Color == Color3.fromRGB(254, 85, 100) then
			return 'Ice Essence'
		elseif Object.Color == Color3.fromRGB(248, 248, 248) then
			return 'Opal'
		elseif Object.Color == Color3.fromRGB(255, 0, 191) then
			return 'Rift Gem'
		elseif Object.Color == Color3.fromRGB(16, 42, 220) then
			return 'Sapphire'
		elseif Object.Color == Color3.fromRGB(255, 255, 0) then
			return 'Spider Cloak'
		end
	elseif Object:IsA('UnionOperation') then
		if Light.Color == Color3.fromRGB(255, 255, 255) then
			return 'Amulet of the White King'
		elseif Object.Color == Color3.fromRGB(111, 113, 125) then
			return 'Idol of the Forgotten'
		elseif Object.Color == Color3.fromRGB(248, 248, 248) and not Object.UsePartColor then
			return [[Lannis's Amulet]]
		elseif Object.Color == Color3.fromRGB(29, 46, 58) then
			return 'Night Stone'
		elseif Object.Color == Color3.fromRGB(255, 89, 89) then
			return [[Philosopher's Stone]]
		elseif Object.Color == Color3.fromRGB(248, 217, 109) then
			return 'Scroom Key'
		end
	end
	
	return "Unkown"
end
