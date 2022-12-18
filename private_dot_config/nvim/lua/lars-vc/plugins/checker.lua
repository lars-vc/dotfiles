-- A grammar checker using languagetool (currently using ltrs since it provides linenumbers)
local job = require("plenary.job")
local namespace = vim.api.nvim_create_namespace("checker")
local function main()
    -- Get buffer text
    local buftext = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

    -- TODO: Clean text (e.g. if latex use yalafi or markdown remove #?)

    -- Parse text
    job:new({
        command = "ltrs",
        -- command = "dummy",
        -- args = { "-m", "-r" }, -- m: get linenum, r: json, l: language, t: text input
        args = { "-m", "-r", "-l", "en-US", "-t", '"' .. buftext .. '"' }, -- m: get linenum, r: json, l: language, t: text input
        -- args = { '-m -r -l en-US -t "' .. buftext .. '"' }, -- m: get linenum, r: json, l: language, t: text input
        on_exit = function(j, exit_code)
            -- if exit_code ~= 0 then
            --     vim.notify("Something went wrong with Checker")
            --     print(exit_code)
            --     return
            -- end
            if true then
                vim.pretty_print(j:result())
                return
            end
            local json = require("lars-vc.plugins.json")
            local decoded_json = json.decode(j:result())
            local diagnostics = {}
            for _, match in ipairs(decoded_json["matches"]) do
                -- TODO: Severities based on typo or other stuff
                local len = math.min(#match["replacements"], 4)
                local repl = ""
                for i = 1, len do
                    repl = repl .. match["replacements"][i]["value"] .. ", "
                end
                repl = repl:sub(1, -3)
                local diag = {
                    source = "Checker",
                    severity = vim.diagnostic.severity.WARN,
                    lnum = match["moreContext"]["line_number"],
                    col = match["moreContext"]["line_offset"],
                    end_col = match["moreContext"]["line_offset"] + match["length"],
                    message = match["message"] .. repl,
                }
                table.insert(diagnostics, diag)
            end

            -- Show diagnostics
            vim.diagnostic.set(namespace, 0, diagnostics, { underline = true })
        end,
        on_stdout = function(line)
            vim.notify(line)
        end,
    }):start()
    -- local command = 'ltrs check -m -r -l en-US -t "' .. buftext .. '"'
    -- local handle = io.popen(command)
    -- if handle == nil then
    --     return
    -- end
    -- local result = handle:read("*a") -- no clue what *a is
    -- handle:close()
    -- local json = require("lars-vc.plugins.json")
    -- local decoded_json = json.decode(result)
    -- local diagnostics = {}
    -- for _, match in ipairs(decoded_json["matches"]) do
    --     -- TODO: Severities based on typo or other stuff

    --     local len = math.min(#match["replacements"], 4)
    --     local repl = ""
    --     for i = 1, len do
    --         repl = repl .. match["replacements"][i]["value"] .. ", "
    --     end
    --     repl = repl:sub(1, -3)
    --     local diag = {
    --         source = "Checker",
    --         severity = vim.diagnostic.severity.WARN,
    --         lnum = match["moreContext"]["line_number"],
    --         col = match["moreContext"]["line_offset"],
    --         end_col = match["moreContext"]["line_offset"] + match["length"],
    --         message = match["message"] .. repl,
    --     }
    --     table.insert(diagnostics, diag)
    -- end
    --
    -- -- Show diagnostics
    -- vim.diagnostic.set(namespace, 0, diagnostics, { underline = true })
end

local function test()
    job:new({
        -- command = "ltrs",
        command = "dummy",
        args = { "-e", "-r", "--test", "-u" }, -- m: get linenum, r: json, l: language, t: text input
        -- args = { "-m", "-r", "-l", "en-US", "-t", '"' .. buftext .. '"' }, -- m: get linenum, r: json, l: language, t: text input
        -- args = { '-m -r -l en-US -t "' .. buftext .. '"' }, -- m: get linenum, r: json, l: language, t: text input
        on_exit = function(j, exit_code)
            -- if exit_code ~= 0 then
            --     vim.notify("Something went wrong with Checker")
            --     print(exit_code)
            --     return
            -- end
            vim.pretty_print(j:result())
        end,
    }):start()
end

-- TODO: plenary async
vim.keymap.set("n", "<leader>oz", main, { noremap = true })
vim.keymap.set("n", "<leader>oy", test, { noremap = true })
