--Inventory UI
--인벤토리 버튼 클릭하여, 아이템 장착
--인벤토리의 message 버튼 클릭하여, 운세쪽지 보기
local Player = LocalPlayer:GetRemotePlayer()
local attachcheck = false
local attachitem = nil
local clickitem = nil
local Item1 = Workspace.candle
local Item2 = Workspace.message
local Item3 = Workspace.key
local Item4 = Workspace.hotdog
local Item5 = Workspace.message1

local Button1 = Script.Parent.Button1
local Button2 = Script.Parent.Button2
local Button3 = Script.Parent.Button3

local message1 = Script.Parent.message1
local message2 = Script.Parent.message2
local message3 = Script.Parent.message3
local message4 = Script.Parent.message4
local message5 = Script.Parent.message5
local message6 = Script.Parent.message6

--Button2누를경우(운세쪽지 관련)
local mess_press = Script.Parent.mess_press

local button_see = mess_press.Button_see
local button_get = mess_press.Button_get
local button_cancle = mess_press.Button_cancle

local A_me = Script.Parent.Parent.ScreenUIA.A_me
local B_me = Script.Parent.Parent.ScreenUIB.B_me
local C_me = Script.Parent.Parent.ScreenUIC.C_me
local D_me = Script.Parent.Parent.ScreenUID.D_me
local E_me = Script.Parent.Parent.ScreenUIE.E_me

mess_press:SetVisible(false)
A_me:SetVisible(false)
B_me:SetVisible(false)
C_me:SetVisible(false)
D_me:SetVisible(false)
E_me:SetVisible(false)
Button2:SetVisible(false)
message1:SetVisible(false)
message2:SetVisible(false)
message3:SetVisible(false)
message4:SetVisible(false)
message5:SetVisible(false)
message6:SetVisible(false)

-- 아이템을 attach 또는 detach해 줌.
local function itemattach(i) -- i: attach 또는 detach할 아이템의 번호
    if i == 1 then -- 초 
        clickitem = Item1 
    elseif i == 2 then -- 운세통(운세쪽지 뽑는 통) 
        clickitem = Item2
    elseif i == 3 then -- 열쇠
        clickitem = Item3
    elseif i == 5 then -- 운세쪽지
        clickitem = Item5
    else
        clickitem = Item4 -- 폭죽
    end                 
    
    if attachcheck == false then -- 플레이어가 어떤 아이템도 들고 있지 않으면,
        createPos = clickitem:GetTransform():GetLocation()
        temp = Game:CreateObject(clickitem,createPos) -- 아이템 객체 생성
        temp:AttachTo(Player, Enum.Bone.RHand)   -- 아이템을 플레이어 손에 붙여줌
        attachitem = clickitem -- 붙인 아이템 객체를 저장
        Game:SendEventToServer("SetItem", i) -- 서버에 아이템 번호를 매개변수로 하는 SetItem 이벤트 전달
        attachcheck = true
    else -- 플레이어가 어떤 아이템을 들고 있으면,
        if attachitem == clickitem then -- 그 아이템이 클릭한 아이템이면,
            Game:DeleteObject(temp) -- 아이템 객체 제거
            attachitem = nil  -- 붙인 아이템 객체 null 처리
            Game:SendEventToServer("SetItem", 0) -- SetItem이 0(없음) 이벤트를 서버에 전달
            attachcheck = false 
        
        else -- 플레이어가 들고있는 아이템과 클릭한 아이템이 다르면,
            Game:DeleteObject(temp) -- 현재 들고있는 아이템 객체 제거
            Game:SendEventToServer("SetItem", 0) -- SetItem이 0(없음) 이벤트를 서버에 전달
            createPos = clickitem:GetTransform():GetLocation()
            temp = Game:CreateObject(clickitem,createPos) -- 클릭한 아이템 객체 생성
            temp:AttachTo(Player, Enum.Bone.RHand) -- 아이템을 플레이어 손에 붙여줌
            Game:SendEventToServer("SetItem", i) -- 서버에 아이템 번호를 매개변수로 하는 SetItem 이벤트 전달
            attachitem = clickitem -- 붙인 아이템 객체를 저장

        end
    end
end
Game:ConnectEventFunction("itemattach", itemattach) -- 게임내 itemattach 이벤트에 itemattach함수를 연결함
 
local function PressEvent(self)
   itemattach(1) -- itemattach함수 실행
end
Button1.OnPressEvent:Connect(PressEvent) -- Button1을 클릭하면, PressEvent() 실행

local function PressEvent(self)
   mess_press:SetVisible(true)   
end
Button2.OnPressEvent:Connect(PressEvent)

local function PressEvent(self)
   itemattach(3)
end
Button3.OnPressEvent:Connect(PressEvent)
--[[
local function PressEvent(self)
   itemattach(4)
end
Button4.OnPressEvent:Connect(PressEvent)
]]--
--Button2누를경우(운세쪽지 관련)
local function PressEvent(self)
    mess_press:SetVisible(false)   
end
button_cancle.OnPressEvent:Connect(PressEvent)

local function PressEvent(self)
    itemattach(5)
end
button_get.OnPressEvent:Connect(PressEvent)

local function PressEvent(self)
    if randomnum <= 4 then
        A_me:SetVisible(true)
        wait(10)
        A_me:SetVisible(false)
    elseif randomnum <= 24 then
        B_me:SetVisible(true)
        wait(10)
        B_me:SetVisible(false) 
    elseif randomnum <= 76 then
        C_me:SetVisible(true)
        wait(10)
        C_me:SetVisible(false) 
    elseif randomnum <= 96 then
        D_me:SetVisible(true)
        wait(10)
        D_me:SetVisible(false) 
    else
        E_me:SetVisible(true)
        wait(10)
        E_me:SetVisible(false)                     
    end
  
end
button_see.OnPressEvent:Connect(PressEvent)

-- 아이템 장착후 사용했으면, 버튼 이미지 바꿈
local function IsDoubleButton1()
   Button1:SetBackgroundColor(Color.new(46, 42, 33, 255))
end

Game:ConnectEventFunction("IsDoubleButton1", IsDoubleButton1)

local function IsDoubleButton2()
    Button2:SetVisible(false)
    message1:SetVisible(false)
    message2:SetVisible(false)
    message3:SetVisible(false)
    message4:SetVisible(false)
    message5:SetVisible(false)
    message6:SetVisible(false)
end

Game:ConnectEventFunction("IsDoubleButton2", IsDoubleButton2)

local function IsDoubleButton3()
    Button3:SetBackgroundColor(Color.new(46, 42, 33, 255))
end

Game:ConnectEventFunction("IsDoubleButton3", IsDoubleButton3)

local function IsDoubleButton4()
    Button4:SetBackgroundColor(Color.new(46, 42, 33, 255))
end

Game:ConnectEventFunction("IsDoubleButton4", IsDoubleButton4)
        
