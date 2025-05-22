local M = {}

M.base_30 = {
  white = "#edeff0",
  darker_black = "#060809",
  black = "#0c0e0f", --  nvim bg
  black2 = "#141617",
  lighter_black = "#121415",
  one_bg = "#161819",
  one_bg2 = "#1f2122",
  one_bg3 = "#27292a",
  grey = "#343637",
  grey_fg = "#3e4041",
  grey_fg2 = "#484a4b",
  light_grey = "#505253",
  red = "#DF5B61",
  baby_pink = "#EE6A70",
  pink = "#e8646a",
  line = "#1b1d1e",
  green = "#78B892",
  vibrant_green = "#81c19b",
  nord_blue = "#5A84BC",
  blue = "#6791C9",
  yellow = "#ecd28b",
  sun = "#f6dc95",
  purple = "#c58cec",
  dark_purple = "#BC83E3",
  teal = "#70b8ca",
  orange = "#E89982",
  cyan = "#67AFC1",
  statusline_bg = "#101213",
  lightbg = "#1d1f20",
  pmenu_bg = "#78B892",
  folder_bg = "#6791C9",
}

M.base_16 = {
  base00 = "#0B0E14",
  base01 = "#1c1f25",
  base02 = "#24272d",
  base03 = "#2b2e34",
  base04 = "#33363c",
  base05 = "#bfc6d4",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",
  base08 = "#bfc6d4", -- imports, vars etc regular color, need to fix try/catch
  base09 = "#0fc78a", -- constants, numbers etc
  base0A = "#0fc78a", -- classes, types etc
  base0B = "#067953", -- strings
  base0C = "#47ebb4", -- support such as init (brackets too unfortunately)
  base0D = "#47ebb4", -- functions, methods,
  base0E = "#0fc78a", -- keywords
  base0F = "#ffffff", -- inline brackets
}

M.type = "dark"

M = require("base46").override_theme(M, "dark_sea")

return M
