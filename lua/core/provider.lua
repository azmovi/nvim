local opts = {
    python3_host_prog = '/path/to/py3nvim/bin/python',
    loaded_ruby_provider = 0,
    loaded_perl_provider = 0,
    loaded_node_provider = 0,
}


-- Set options from table
for opt, val in pairs(opts) do
	vim.g[opt] = val
end
