local Settings = self:AddTab("Settings");
local SettingsMenu = Settings:AddLeftGroupboxForSettings("Menu");
SettingsMenu:AddLabelForSettings("Background Color"):AddColorPickerForSettings("SettingsMenuBackgroundColor", {
    Default = Library.BackgroundColor
});
SettingsMenu:AddLabelForSettings("Main Color"):AddColorPickerForSettings("SettingsMenuMainColor", {
    Default = Library.MainColor
});
SettingsMenu:AddLabelForSettings("Accent Color"):AddColorPickerForSettings("SettingsMenuAccentColor", {
    Default = Library.AccentColor
});
SettingsMenu:AddLabelForSettings("Inline Color"):AddColorPickerForSettings("SettingsMenuInlineColor", {
    Default = Library.InlineColor
});
SettingsMenu:AddLabelForSettings("Outline Color"):AddColorPickerForSettings("SettingsMenuOutlineColor", {
    Default = Library.OutlineColor
});
SettingsMenu:AddLabelForSettings("Font Color"):AddColorPickerForSettings("SettingsMenuFontColor", {
    Default = Library.FontColor
});
Options.SettingsMenuBackgroundColor:OnChanged(function() 
    Library.BackgroundColor = Options.SettingsMenuBackgroundColor.Value;
    Library.ColorPicker = Options.SettingsMenuBackgroundColor.Value;
    Library.ColorPickerDark = Library:GetDarkerColor(Library.ColorPicker);
    Library:UpdateColorsUsingRegistry()
end);
Options.SettingsMenuMainColor:OnChanged(function() 
    Library.MainColor = Options.SettingsMenuMainColor.Value;
    Library:UpdateColorsUsingRegistry()
end);
Options.SettingsMenuAccentColor:OnChanged(function() 
    Library.AccentColor = Options.SettingsMenuAccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library:UpdateColorsUsingRegistry()
end);
Options.SettingsMenuInlineColor:OnChanged(function() 
    Library.InlineColor = Options.SettingsMenuInlineColor.Value;
    Library:UpdateColorsUsingRegistry()
end);
Options.SettingsMenuOutlineColor:OnChanged(function()
    Library.OutlineColor = Options.SettingsMenuOutlineColor.Value;
    Library:UpdateColorsUsingRegistry()
end);
Options.SettingsMenuFontColor:OnChanged(function()
    Library.FontColor = Options.SettingsMenuFontColor.Value;
    Library:UpdateColorsUsingRegistry()
end);

SettingsMenu:AddButton("Default Theme",function()
    Options.SettingsMenuBackgroundColor:SetValueRGB(Color3.fromRGB(5,5,20));
    Options.SettingsMenuMainColor:SetValueRGB(Color3.fromRGB(0,15,30));
    Options.SettingsMenuAccentColor:SetValueRGB(Color3.fromRGB(0,180,240));
    Options.SettingsMenuInlineColor:SetValueRGB(Color3.fromRGB(10,30,40));
    Options.SettingsMenuOutlineColor:SetValueRGB(Color3.fromRGB(0,0,5));
    Options.SettingsMenuFontColor:SetValueRGB(Color3.fromRGB(255,255,255));
    Library.BackgroundColor = Options.SettingsMenuBackgroundColor.Value;
    Library.MainColor       = Options.SettingsMenuMainColor.Value;
    Library.AccentColor     = Options.SettingsMenuAccentColor.Value;
    Library.InlineColor     = Options.SettingsMenuInlineColor.Value;
    Library.OutlineColor    = Options.SettingsMenuOutlineColor.Value;
    Library.FontColor       = Options.SettingsMenuFontColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library:UpdateColorsUsingRegistry()
end);

SettingsMenu:AddToggleForSettings("SettingsMenuKeybinds",{
    Text = "Show Keybinds Menu",
    Default = false
});

Toggles.SettingsMenuKeybinds:OnChanged(function()
    Library:SetKeybindVisibility(Toggles.SettingsMenuKeybinds.Value)
end);

SettingsMenu:AddToggleForSettings("SettingsMenuWatermark",{
    Text = "Show Watermark",
    Default = true
});

Toggles.SettingsMenuWatermark:OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.SettingsMenuWatermark.Value);
end);

SettingsMenu:AddButtonForSettings('Unload', function() Library:Unload() end)

Library:OnUnload(function()
    warn("Unloaded")
    Library.Unloaded = true
end);
