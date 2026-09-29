local colors = {
  base      =  "181818",
  mantle    =  "161616",
  crust     =  "2d2d2d",
  surface0  =  "2f2f2f",
  surface1  =  "3b434d",
  surface2  =  "4f565f",
  text      =  "c4e0ff",
  subtext0  =  "9db3cc",
  subtext1  =  "9db3cc",
  overlay0  =  "768699",
  red       =  "eb0000",
  green     =  "00eb07",
  yellow    =  "eb8700",
  blue      =  "006ceb",
  purple    =  "7900eb",
  cyan      =  "00beeb",

  bred       =  "ff1414",
  bgreen     =  "18ff1f",
  byellow    =  "ff9f14",
  bblue      =  "147eff",
  bpurple    =  "9514ff",
  bcyan      =  "14d2ff",
}

colors.accent = colors.yellow
colors.inactive = colors.surface1

for name, hex in pairs(colors) do
  _G[name] = hex
  _G[name .. "Alpha"] = hex
  _G[name .. "Alphaff"] = hex .. "ff"
end
