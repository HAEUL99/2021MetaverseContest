local cube = Script.Parent
local area_list_num = {}

local function Camera_Add(player)
    table.insert(area_list_num, player)
end

Game:ConnectEventFunction("Camera_Mult", Camera_Add)

local function Reset()
    area_list_num = {}
end
Game:ConnectEventFunction("Reset", Reset)


local function EnterSelfCam()
    local character = LocalPlayer:GetRemotePlayer():GetCharacter()
    if #area_list_num >= 2 then 
       for key, value in pairs(area_list_num) do
            if value == character:GetName() then 
                 FillStart(5)
            end
        end
       
    end
end


Game.EnterSelfCamera:Connect(EnterSelfCam)
