require "nvchad.options"

local opt = vim.opt
opt.cmdheight = 0

opt.nu = true
opt.relativenumber = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append "@-@"

opt.updatetime = 50

opt.splitbelow = true
opt.splitright = true

opt.smartcase = true
opt.ignorecase = true

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

-- prevent o from adding comments
opt.formatoptions:remove "o"

opt.shada = { "'10", "<0", "s10", "h" }

opt.inccommand = "split"
