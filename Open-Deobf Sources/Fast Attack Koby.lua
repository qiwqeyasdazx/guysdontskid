task.spawn(function()
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    repeat task.wait() until game:IsLoaded()
    repeat task.wait() until LP and LP.Character
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhDangNhoEm/TuanAnhIOS/refs/heads/main/koby"))()
    end)
    if not success then
        warn("Falha ao executar auto-load:", err)
    end
end)