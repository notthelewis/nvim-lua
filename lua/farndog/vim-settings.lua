-- Editor niceness
vim.o.autoindent = true;
vim.o.scrolloff = 8;
vim.o.updatetime = 300;
vim.o.showtabline = 0
vim.wo.wrap = false;

-- Historic file edits
vim.o.swapfile = false;
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.o.undofile = true;

-- Search settings
vim.o.hlsearch = false;
vim.o.incsearch = true;
vim.o.ignorecase = true;
vim.o.smartcase = true;

-- Tab size
vim.o.tabstop = 4;
vim.o.softtabstop = 4;
vim.o.shiftwidth = 4;
vim.o.expandtab = true;

-- Numbers
vim.wo.number = true;
vim.wo.relativenumber = true;
vim.wo.colorcolumn = '120'


vim.cmd([[hi ColorColumn guibg=#4F4946]]);
