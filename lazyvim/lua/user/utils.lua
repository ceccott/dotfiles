local M = {}

function M.load_env(file)
	local vars = {}
	for line in io.lines(file) do
		local k, v = line:match("([^=]+)=(.+)")
		if k and v then
			vars[k] = v
		end
	end
	return vars
end

function M.get_git_root()
	local git_root = vim.fn.system("git rev-parse --show-toplevel")
	if vim.v.shell_error == 0 then
		return vim.fn.fnamemodify(git_root, ":p"):gsub("\n", "")
	else
		return "~"
	end
end

return M
