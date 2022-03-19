"===========================================================
"------------------------CheatSheet-------------------------
"===========================================================

"--------------------------COMMON---------------------------
SPC xt => :wa :tabclose   (close current tab)
SPC xx => :wa :qa         (close everything)
SPC xq => :qa!            (close everything and dont save)

"-------------------------TELESCOPE-------------------------
SPC ff => find_files                  (find file in project)
SPC fg => live_grep                   (find in project)
SPC fc => current_buffer_fuzzy_find   (find in current buffer)
SPC fb => buffers                     (see buffers)
SPC fh => help_tags                   (see help options)
SPC fn => neoclip                     (local clipboard)

"------------------------VIMSPECTOR-------------------------
" Begin/End
SPC dd  => Start               (start debugging)
SPC dx  => Reset               (quit debugging)
SPC dX  => ClearBreakpoints    (remove all breakpoints)
" In debug
J       => StepOver       (step over function)
K       => StepOut        (step out of function)
L       => StepInto       (step into function)
SPC d_  => Restart        (restart execution)
SPC dn  => Continue       (continue til breakpoint)
SPC drc => RunToCursor    (run til cursor)
SPC di  => BalloonEval    (show info about something)
" Setup
SPC dh  => ToggleBreakpoint               (toggle breakpoint)
SPC de  => ToggleConditionalBreakpoint    (toggle cond breakpoint, idk)

"----------------------------COC----------------------------
SPC rn   => coc-rename             (rename variable)
C-A-l    => coc-format             (format buffer)
SPC cd   => coc-definition         (goto definition)
SPC cy   => coc-type-definition    (goto type definition)
SPC ci   => coc-implementation     (goto implementation)
SPC cr   => coc-references         (goto references)
SPC ct   => show_documentation     (shows type of variable)

"----------------------------GIT----------------------------
SPC gg   => :Git                (await git command)
SPC gs   => :G<CR>              (git status)
SPC gc   => :Git coma           (git commit -a -m "")
SPC gp   => :Git push<CR>       (push commits)
SPC gh   => :diffget //2<CR>    (select left side of merge conflict)
SPC gl   => :diffget //3<CR>    (select right side of merge conflict)
