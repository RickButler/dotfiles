local capabilities = vim.lsp.protocol.make_client_capabilities();
local path = vim.fn.stdpath("data") .. "/lspinstall/clojure/clojure-lsp";
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local M = {
	cmd = {"clojure-lsp"},
	filetypes = {
		"clojure",
		"edn"
	},
	autostart = true,
	root_dir = (require("lspconfig")).util.root_pattern("project.clj", "deps.edn", ".git"),
	capabilities = capabilities
};

return M;
