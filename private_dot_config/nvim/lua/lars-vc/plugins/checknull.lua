local null_ls = require("null-ls")

local checker = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown", "text" },
    generator = {
        fn = function(params)
            local command = 'ltrs check -m -r -l en-US -t "' .. params.content .. '"'
            local handle = io.popen(command)
            if handle == nil then
                return
            end
            local result = handle:read("*a") -- no clue what *a is
            handle:close()
            local json = require("lars-vc.plugins.json")
            local decoded_json = json.decode(result)
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
            -- vim.diagnostic.set(namespace, 0, diagnostics, { underline = true })
            return diagnostics
        end,
    },
}

-- null_ls.register(checker)
