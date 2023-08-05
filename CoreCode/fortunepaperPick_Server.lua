--오미쿠지샵
local shop_s = Script.Parent
local Owner = nil

local function StartShopSet(player) 
    if Owner ~= nil then
       return
    end
    
    Owner = player:GetCharacter()
    -- 클라이언트 이벤트 StartSetShopClient를 호출함.
    shop_s:SendEventToClient(player:GetPlayerName(), "StartSetShopClient") 
    -- 클라이언트 이벤트 IsCharacterShopSet를 호출함. (매개변수 true)
    shop_s:BroadcastEvent("IsCharacterShopSet", true)
    -- 운세통 attach
    Game:SendEventToClient(player:GetPlayerName(), "itemattach", 2)
    -- ProgressUI 띄움.
    Game:SendEventToClient(player:GetPlayerName(),"IsPressedforShop")
    wait(10)
    -- 미션 완료 UI 뛰움.
    Game:SendEventToClient(player:GetPlayerName(), "FillStart", 2)
    
end
-- shop_s객체의 서버 이벤트 StartShopSet에 StartShopSet()함수 연결
shop_s:ConnectEventFunction("StartShopSet", StartShopSet)


local function EndShopSet(player)
   if Owner ~= player:GetCharacter() then
       return
   end
   player:GetCharacter():Detach()
   shop_s:SendEventToClient(player:GetPlayerName(), "EndShopSetClient")
   shop_s:BroadcastEvent("IsCharacterShopSet", false)
   --item 제거
   Game:SendEventToClient(player:GetPlayerName(), "itemattach", 2)
   wait(1)
   
   Owner = nil

end
shop_s:ConnectEventFunction("EndShopSet", EndShopSet)





