local M = {};
local common = require("lang.common");
local langs = {
	csharp = require("lang.csharp"),
	lua = {},
	clojure = {}
};

for name, settings in pairs(langs) do
	for key, value in pairs(common) do
		if settings[key] == nil then
			settings[key] = value;
		end;
	end;
	M[name] = settings;
end;

return M;
