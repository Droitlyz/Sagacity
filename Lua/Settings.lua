local Settings = {} do

    function Settings:createMenuBox(MenuBox)
        MenuBox:AddLabelForSettings("Background Color"):AddColorPickerForSettings("SettingsMenuBackgroundColor", {Default = self.Library.BackgroundColor});
        MenuBox:AddLabelForSettings("Main Color"):AddColorPickerForSettings("SettingsMenuMainColor", {Default = self.Library.MainColor});
        MenuBox:AddLabelForSettings("Accent Color"):AddColorPickerForSettings("SettingsMenuAccentColor", {Default = self.Library.AccentColor});
        MenuBox:AddLabelForSettings("Inline Color"):AddColorPickerForSettings("SettingsMenuInlineColor", {Default = self.Library.InlineColor});
        MenuBox:AddLabelForSettings("Outline Color"):AddColorPickerForSettings("SettingsMenuOutlineColor", {Default = self.Library.OutlineColor});
        MenuBox:AddLabelForSettings("Font Color"):AddColorPickerForSettings("SettingsMenuFontColor", {Default = self.Library.FontColor});
        Options.SettingsMenuBackgroundColor:OnChanged(function()
            self.Library.BackgroundColor = Options.SettingsMenuBackgroundColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        Options.SettingsMenuMainColor:OnChanged(function()
            self.Library.MainColor = Options.SettingsMenuMainColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        Options.SettingsMenuAccentColor:OnChanged(function()
            self.Library.AccentColor = Options.SettingsMenuAccentColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        Options.SettingsMenuInlineColor:OnChanged(function()
            self.Library.InlineColor = Options.SettingsMenuInlineColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        Options.SettingsMenuOutlineColor:OnChanged(function()
            self.Library.OutlineColor = Options.SettingsMenuOutlineColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        Options.SettingsMenuFontColor:OnChanged(function()
            self.Library.FontColor = Options.SettingsMenuFontColor.Value
            self.Library:UpdateColorsUsingRegistry()
        end);
        MenuBox:AddButtonForSettings("Default Theme", function()
            Options.SettingsMenuBackgroundColor:SetValueRGB(Color3.fromRGB(5, 5, 20));
            Options.SettingsMenuMainColor:SetValueRGB(Color3.fromRGB(0, 15, 30));
            Options.SettingsMenuAccentColor:SetValueRGB(Color3.fromRGB(0, 180, 240));
            Options.SettingsMenuInlineColor:SetValueRGB(Color3.fromRGB(10, 30, 40));
            Options.SettingsMenuOutlineColor:SetValueRGB(Color3.fromRGB(0, 0, 5));
            Options.SettingsMenuFontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
            self.Library.BackgroundColor = Options.SettingsMenuBackgroundColor.Value
            self.Library.MainColor = Options.SettingsMenuMainColor.Value
            self.Library.AccentColor = Options.SettingsMenuAccentColor.Value
            self.Library.InlineColor = Options.SettingsMenuInlineColor.Value
            self.Library.OutlineColor = Options.SettingsMenuOutlineColor.Value
            self.Library.FontColor = Options.SettingsMenuFontColor.Value
            self.Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor)
            self.Library:UpdateColorsUsingRegistry()
        end);
        MenuBox:AddToggleForSettings("SettingsMenuKeybinds", {Text = "Show Keybinds Menu"})
        Toggles.SettingsMenuKeybinds:OnChanged(function() self.Library:SetKeybindVisibility(Toggles.SettingsMenuKeybinds.Value) end);
        MenuBox:AddToggleForSettings("SettingsMenuWatermark", {Text = "Show Watermark"})
        Toggles.SettingsMenuWatermark:OnChanged(function() self.Library:SetWatermarkVisibility(Toggles.SettingsMenuWatermark.Value) end);
        MenuBox:AddButtonForSettings("Unload", function() self.Library:Unload() end)
        self.Library:OnUnload(function() warn("Unloaded");self.Library.Unloaded = true end);

    end;

    function Settings:createSettingsMenu(MenuBox)
        assert(self.Library)
        self:createMenuBox(MenuBox)
    end

end
return Settings;
