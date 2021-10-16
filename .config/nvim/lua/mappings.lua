local opts = { noremap=true, silent=true }
-- find files using Telescope command-line sugar
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>Telescope git_files<CR>', opts)

-- file tree mappings
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>NvimTreeFindFile<CR>', opts)

-- debugger mappings
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>dd', "<cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', '<S-F11>', "<cmd>lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-S-F5>', "<cmd>lua require'dap'.restart()<CR>", opts)
vim.api.nvim_set_keymap('n', '<S-F5>', "<cmd>lua require'dap'.disconnect()<CR>", opts)
vim.api.nvim_set_keymap('n', '<S-F9>', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
-- TODO: add non fn-button related shortcuts

-- debugger options
require('dap')
vim.fn.sign_define('DapBreakpoint', {text='B', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='debugPC', numhl=''})

-- enable loading of vscode launch.json settings files
require('dap.ext.vscode').load_launchjs()

-- debugger telescope integration
vim.api.nvim_set_keymap('n', '<leader>dc', "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>dC', "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>db', "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>dv', "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", opts)