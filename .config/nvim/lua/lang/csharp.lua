local pid = vim.fn.getpid();
local path = vim.fn.stdpath("data") .. "/lspinstall/csharp/omnisharp/run";
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local M = {
	cmd = {
		path,
		"--languageserver",
		"--hostPID",
		tostring(pid)
	},
	filetypes = {
		"cs",
		"vb"
	},
	autostart = true,
	root_dir = (require("lspconfig")).util.root_pattern("*.sln", "*.csproj", ".git"),
	capabilities = capabilities
};

return M;
