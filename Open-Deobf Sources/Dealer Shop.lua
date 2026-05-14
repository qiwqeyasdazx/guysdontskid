local vu14 = vu10.LocalPlayer
v496:AddButton({
    Name = "Devil Fruit Shop",
    Callback = function()
        require(vu14.PlayerGui.Main.UIController.FruitShop):Open("FruitDealer")
    end
})
v496:AddButton({
    Name = "Advanced Fruit Dealer",
    Callback = function()
        require(vu14.PlayerGui.Main.UIController.FruitShop):Open("AdvancedFruitDealer")
    end
})