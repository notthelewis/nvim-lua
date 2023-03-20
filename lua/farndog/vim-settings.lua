-- Editor niceness
vim.o.autoindent = true;
vim.o.scrolloff = 8;
vim.o.updatetime = 300;
vim.nowrap = true;

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


--vim.cmd([[hi ColorColumn guibg=#272727]])
vim.cmd([[hi ColorColumn guibg=#4F4946]]);
