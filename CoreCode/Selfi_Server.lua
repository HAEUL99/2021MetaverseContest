local cube = Script.Parent
local area_list = {}


cube:SetCharacterCollisionResponse(Enum.CollisionResponse.Overlap)
local function BeginOverlapEvent(self, target) 
    if target ~= nil and target:IsCharacter() then
        table.insert(area_list, target:GetName())
        Game:BroadcastEvent("Reset")
        for i = 1, #area_list, 1 do
            Game:BroadcastEvent("Camera_Mult", area_list[i])
        end  
        
    end
end

cube.OnBeginOverlapEvent:Connect(BeginOverlapEvent) 

local function EndOverlapEvent(self, target) 
    if target ~= nil and target:IsCharacter() then
        for key, value in pairs(area_list) do
            if value == target:GetName() then
                 table.remove(area_list, key)
            end
        end
        Game:BroadcastEvent("Reset")
        for i = 1, #area_list, 1 do
            Game:BroadcastEvent("Camera_Mult", area_list[i]) 
        end  
        
    end
end
cube.OnEndOverlapEvent:Connect(EndOverlapEvent) 



