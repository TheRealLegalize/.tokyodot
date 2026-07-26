-- TokyoNight Night colors (Monochrome Material Dark version)
local colors = {
    rosewater = "cccccc", -- Нежный акцент (mTertiary)
    flamingo  = "dddddd", -- Яркий акцент/ошибка (mError)
    pink      = "dddddd", -- Яркий акцент/пурпурный
    mauve     = "dddddd", -- Маджента/фиолетовый
    red       = "dddddd", -- Красный (mError)
    maroon    = "dddddd", -- Темно-красный акцент
    peach     = "aaaaaa", -- Оранжевый/персиковый (mPrimary)
    yellow    = "aaaaaa", -- Желтый (mPrimary)
    green     = "cccccc", -- Зеленый (green)
    teal      = "cccccc", -- Бирюзовый (cyan)
    sky       = "cccccc", -- Небесно-голубой (cyan)
    sapphire  = "a7a7a7", -- Сапфировый (blue)
    blue      = "a7a7a7", -- Синий (blue)
    lavender  = "828282", -- Лавандовый/светло-серый text (mOnSurface)

    text      = "828282", -- Основной текст (mOnSurface)
    subtext1  = "5d5d5d", -- Вторичный текст (mOnSurfaceVariant)
    subtext0  = "5d5d5d", -- Чуть более темный текст

    overlay2  = "3c3c3c", -- Границы / выделение элементов (mOutline)
    overlay1  = "3c3c3c", -- Активные разделители
    overlay0  = "191919", -- Неактивные разделители / панельки

    surface2  = "191919", -- Самый светлый из темных фонов (mSurfaceVariant)
    surface1  = "191919", -- Альтернативный фон панелей
    surface0  = "191919", -- Фон неактивных вкладок / элементов

    base      = "111111", -- Основной глубокий фон (mSurface)
    mantle    = "111111", -- Промежуточный темный фон
    crust     = "000000", -- Абсолютно черный для теней и подложек (mShadow)
}

-- Автоматически создаём переменные для Hyprland
for name, hex in pairs(colors) do
    _G[name] = hex
    _G[name .. "Alpha"] = hex
    _G[name .. "Alphaff"] = hex .. "ff"
end
