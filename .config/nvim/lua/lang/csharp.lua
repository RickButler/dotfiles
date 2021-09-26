local pid = vim.fn.getpid()
local path = '/mnt/c/Users/rbutler/.local/share/nvim/lspinstall/csharp/omnisharp/run'


local M = {
	cmd = { path, "--languageserver" , "--hostPID", tostring(pid) };
}

return M
