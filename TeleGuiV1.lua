-- ============================================
-- SCRIPT UI GỘP: LẤY TỌA ĐỘ & DỊCH CHUYỂN
-- ============================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Xóa UI cũ nếu đã tồn tại trước đó
if CoreGui:FindFirstChild("TP_Coord_UI") then
    CoreGui.TP_Coord_UI:Destroy()
end

-- TẠO GIAO DIỆN CHÍNH
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TP_Coord_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- NÚT BẤM MỞ / ẨN MENU
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 100, 0, 35)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Text = "Menu TP"
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 16
ToggleBtn.Parent = ScreenGui
ToggleBtn.Draggable = true
ToggleBtn.Active = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

-- KHUNG MENU CHÍNH
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280, 0, 310)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- TIÊU ĐỀ
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Text = "TOOL TỌA ĐỘ & TELEPORT"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Ô 1: LẤY TỌA ĐỘ
local GetPosBtn = Instance.new("TextButton")
GetPosBtn.Size = UDim2.new(0.9, 0, 0, 30)
GetPosBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
GetPosBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
GetPosBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetPosBtn.Text = "1. Lấy Tọa Độ Hiện Tại"
GetPosBtn.Font = Enum.Font.SourceSansBold
GetPosBtn.TextSize = 14
GetPosBtn.Parent = MainFrame

local GetPosCorner = Instance.new("UICorner")
GetPosCorner.CornerRadius = UDim.new(0, 6)
GetPosCorner.Parent = GetPosBtn

-- Ô 2: NHẬP TỌA ĐỘ / HIỂN THỊ TỌA ĐỘ
local CoordBox = Instance.new("TextBox")
CoordBox.Size = UDim2.new(0.63, 0, 0, 30)
CoordBox.Position = UDim2.new(0.05, 0, 0.28, 0)
CoordBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CoordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CoordBox.PlaceholderText = "Tọa độ X, Y, Z..."
CoordBox.Text = ""
CoordBox.Font = Enum.Font.SourceSans
CoordBox.TextSize = 13
CoordBox.Parent = MainFrame

local CoordCorner = Instance.new("UICorner")
CoordCorner.CornerRadius = UDim.new(0, 6)
CoordCorner.Parent = CoordBox

-- NÚT DÁN (PASTE)
local PasteBtn = Instance.new("TextButton")
PasteBtn.Size = UDim2.new(0.25, 0, 0, 30)
PasteBtn.Position = UDim2.new(0.7, 0, 0.28, 0)
PasteBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
PasteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PasteBtn.Text = "Dán"
PasteBtn.Font = Enum.Font.SourceSansBold
PasteBtn.TextSize = 14
PasteBtn.Parent = MainFrame

local PasteCorner = Instance.new("UICorner")
PasteCorner.CornerRadius = UDim.new(0, 6)
PasteCorner.Parent = PasteBtn

-- NÚT DỊCH CHUYỂN 1 LẦN
local TPOnceBtn = Instance.new("TextButton")
TPOnceBtn.Size = UDim2.new(0.9, 0, 0, 35)
TPOnceBtn.Position = UDim2.new(0.05, 0, 0.41, 0)
TPOnceBtn.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
TPOnceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TPOnceBtn.Text = "Dịch Chuyển 1 Lần"
TPOnceBtn.Font = Enum.Font.SourceSansBold
TPOnceBtn.TextSize = 15
TPOnceBtn.Parent = MainFrame

local TPOnceCorner = Instance.new("UICorner")
TPOnceCorner.CornerRadius = UDim.new(0, 6)
TPOnceCorner.Parent = TPOnceBtn

-- CẤU HÌNH AUTO TELEPORT
local AutoTitle = Instance.new("TextLabel")
AutoTitle.Size = UDim2.new(0.5, 0, 0, 25)
AutoTitle.Position = UDim2.new(0.05, 0, 0.58, 0)
AutoTitle.BackgroundTransparency = 1
AutoTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
AutoTitle.Text = "Thời gian Auto (giây):"
AutoTitle.Font = Enum.Font.SourceSans
AutoTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoTitle.TextSize = 13
AutoTitle.Parent = MainFrame

local TimeBox = Instance.new("TextBox")
TimeBox.Size = UDim2.new(0.35, 0, 0, 25)
TimeBox.Position = UDim2.new(0.6, 0, 0.58, 0)
TimeBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TimeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeBox.Text = "1" -- Mặc định 1 giây
TimeBox.Font = Enum.Font.SourceSans
TimeBox.TextSize = 14
TimeBox.Parent = MainFrame

local TimeCorner = Instance.new("UICorner")
TimeCorner.CornerRadius = UDim.new(0, 6)
TimeCorner.Parent = TimeBox

-- NÚT AUTO TELEPORT (BAT/TAT)
local AutoTPBtn = Instance.new("TextButton")
AutoTPBtn.Size = UDim2.new(0.9, 0, 0, 35)
AutoTPBtn.Position = UDim2.new(0.05, 0, 0.72, 0)
AutoTPBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
AutoTPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTPBtn.Text = "Auto Teleport: TẮT"
AutoTPBtn.Font = Enum.Font.SourceSansBold
AutoTPBtn.TextSize = 15
AutoTPBtn.Parent = MainFrame

local AutoTPCorner = Instance.new("UICorner")
AutoTPCorner.CornerRadius = UDim.new(0, 6)
AutoTPCorner.Parent = AutoTPBtn


-- ============================================
-- XỬ LÝ LOGIC SCRIPT
-- ============================================

local autoLoop = false

-- Hàm phân tích chuỗi ký tự thành Vector3
local function parseVector3(str)
    local x, y, z = str:match("([^,%s]+)%s*,%s*([^,%s]+)%s*,%s*([^,%s]+)")
    if not x then
        x, y, z = str:match("Vector3%.new%((.-)%s*,%s*(.-)%s*,%s*(.-)%)")
    end
    if x and y and z then
        return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
    end
    return nil
end

-- Hàm thực hiện Dịch chuyển
local function teleportTo(posVector)
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(posVector)
        end
    end
end

-- Toggle Menu Bật/Tắt
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- 1. Lấy Tọa độ
GetPosBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        local formatted = string.format("%.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z)
        CoordBox.Text = formatted
        if setclipboard then
            setclipboard(formatted)
        end
    end
end)

-- 2. Dán Tọa độ (Khay nhớ tạm)
PasteBtn.MouseButton1Click:Connect(function()
    if getclipboard then
        CoordBox.Text = getclipboard()
    end
end)

-- 3. Dịch chuyển 1 lần
TPOnceBtn.MouseButton1Click:Connect(function()
    local targetPos = parseVector3(CoordBox.Text)
    if targetPos then
        teleportTo(targetPos)
    else
        CoordBox.Text = "Sai định dạng X,Y,Z!"
    end
end)

-- 4. Bật / Tắt Auto Teleport
AutoTPBtn.MouseButton1Click:Connect(function()
    autoLoop = not autoLoop
    if autoLoop then
        AutoTPBtn.Text = "Auto Teleport: BẬT"
        AutoTPBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
        
        task.spawn(function()
            while autoLoop do
                local targetPos = parseVector3(CoordBox.Text)
                if targetPos then
                    teleportTo(targetPos)
                end
                local delayTime = tonumber(TimeBox.Text) or 1
                task.wait(math.max(delayTime, 0.1))
            end
        end)
    else
        AutoTPBtn.Text = "Auto Teleport: TẮT"
        AutoTPBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    end
end)
