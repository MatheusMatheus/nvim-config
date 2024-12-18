local config = require "nvchad.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

require("java").setup {
    jdk = {
        auto_install = false,
    },
}
require("lspconfig").jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "java" },
    handlers = {
        ["$/progress"] = function(_, result, ctx) end,
    },
    servers = {
        jdtls = {
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-23",
                                path = "/home/matheus_lindo/work/devtools/jdklink",
                                default = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
