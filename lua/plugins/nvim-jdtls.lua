return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local nvim_jdtls = require("jdtls")
            local config = {
                cmd = {'/usr/bin/jdtls'},
                root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
            }
            nvim_jdtls.start_or_attach(config)
        end,

    }
}
