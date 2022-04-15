return {{
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
        require("core.utils").packer_lazy_load "neoscroll.nvim"
    end
}, {
    "Pocco81/AutoSave.nvim",
    config = function()
        local autosave = require "autosave"

        autosave.setup {
            enabled = true,
            execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
            events = {"InsertLeave", "TextChanged"},
            conditions = {
                exists = true,
                filetype_is_not = {},
                modifiable = true
            },
            clean_command_line_interval = 2500,
            on_off_commands = true,
            write_all_buffers = false
        }
    end
}, {
    "Pocco81/TrueZen.nvim",
    cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
    config = function()
        -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
    end
}, {
    "luukvbaal/stabilize.nvim",
    config = function()
        require("stabilize").setup()
    end
}, {
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    config = function()
        require("telescope").setup {
            extensions = {
                media_files = {
                    filetypes = {"png", "webp", "jpg", "jpeg"},
                    find_cmd = "rg" -- find command (defaults to `fd`)
                }
            }
        }
        require("telescope").load_extension "media_files"
    end
}}
