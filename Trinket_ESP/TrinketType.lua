return function(Object: Instance)
	local Light: PointLight = Object:FindFirstChildWhichIsA('PointLight')
	local Mesh: SpecialMesh = Object:FindFirstChildWhichIsA("SpecialMesh")
	local Particle: ParticleEmitter = Object:FindFirstChildWhichIsA('ParticleEmitter', true)
	
	if Object:IsA('MeshPart') then
		if Object.MeshId == 'rbxassetid://5196551436' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Amulet'
			}
		elseif Object.MeshId == 'rbxassetid://923469333' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Candy'
			}
		elseif Object.MeshId == 'rbxassetid://5204003946' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Goblet'
			}
		elseif Object.MeshId == 'rbxassetid://2520762076' then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Howler Friend'
			}
		elseif Object.MeshId == 'rbxassetid://5196577540' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Old Amulet'
			}
		elseif Object.MeshId == 'rbxassetid://5196782997' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Old Ring'
			}
		elseif Object.MeshId == 'rbxassetid://5196776695' then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Ring'
			}
		elseif Object.MeshId == 'rbxassetid://5204453430' then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Scroll'
			}
		end
	elseif Object:IsA('Part') then
		if Object.Color == Color3.fromRGB(89, 34, 89) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = '???'
			}
		elseif Object.Color == Color3.fromRGB(164, 187, 190) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Diamond'
			}
		elseif Object.Color == Color3.fromRGB(0, 184, 49) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Emerald'
			}
		elseif Object.Color == Color3.fromRGB(128, 187, 219) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Fairfrozen'
			}
		elseif Object.Color == Color3.fromRGB(254, 85, 100) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Ice Essence'
			}
		elseif Particle and Particle.Color.Keypoints[1].Value == Color3.new(0.45098, 1, 0) then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Mysterious Artifact'
			}
		elseif Object.Color == Color3.fromRGB(248, 248, 248) and Mesh then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Opal'
			}
		elseif Particle and Particle.Color.Keypoints[1].Value == Color3.new(1, 0.8, 0) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Phoenix Down'
			}
		elseif Object.Color == Color3.fromRGB(255, 0, 191) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Rift Gem'
			}
		elseif Object.Color == Color3.fromRGB(255, 0, 0) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Ruby'
			}
		elseif Object.Color == Color3.fromRGB(16, 42, 220) then
			return {
				Color = Color3.fromRGB(96, 130, 182),
				Name = 'Sapphire'
			}
		elseif Object.Color == Color3.fromRGB(255, 255, 0) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Spider Cloak'
			}
		end
	elseif Object:IsA('UnionOperation') then
		if Light and Light.Color == Color3.fromRGB(255, 255, 255) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Amulet of the White King'
			}
		elseif Object.Color == Color3.fromRGB(111, 113, 125) then
			return {
				Color = Color3.fromRGB(255, 213, 128),
				Name = 'Idol of the Forgotten'
			}
		elseif Object.Color == Color3.fromRGB(248, 248, 248) and not Object.UsePartColor then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = [[Lannis's Amulet]]
			}
		elseif Object.Color == Color3.fromRGB(29, 46, 58) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Night Stone'
			}
		elseif Object.Color == Color3.fromRGB(255, 89, 89) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = [[Philosopher's Stone]]
			}
		elseif Object.Color == Color3.fromRGB(248, 217, 109) then
			return {
				Color = Color3.fromRGB(255, 0, 255),
				Name = 'Scroom Key'
			}
		end
	end
	
	return {
		Color = Color3.fromRGB(255, 255, 255),
		Name = 'Unknown'
	}
end
