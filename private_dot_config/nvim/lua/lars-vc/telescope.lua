local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            path_display = {"truncate"},
            color_devicons=true,
        },
        live_grep = {
            path_display = {"shorten"},
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            },
            n = {
                ["<C-c>"] = "close",
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            }
        }
    },
    extensions = {
        neoclip = {
          on_complete = {
                function(picker)
                  local mode = vim.fn.mode()
                  local keys = mode ~= "n" and "<ESC>" or ""
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys .. [[^v$<C-g>]], true, false, true), "n", true)
                  -- should you have more callbacks, just pop the first one
                  table.remove(picker._completion_callbacks, 1)
                end,
            },
        },
    }
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')

-- Neoclip setup
local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end
require('neoclip').setup {
    --enable_persistent_history = true
    filter = function(data)
        return not all(data.event.regcontents, is_whitespace)
    end,
}
