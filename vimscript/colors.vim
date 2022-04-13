
" signs and hl for debugging
exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')
exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')
sign define DapBreakpoint text= texthl=DebugBreakpoint
sign define DapStopped text=→ texthl=DebugStopped linehl=Visual

" exec 'hi! link DiagnosticSignError DiagnosticError'
" exec 'hi! link DiagnosticSignWarn DiagnosticWarn'
" exec 'hi! link DiagnosticSignInfo DiagnosticInfo'
" exec 'hi! link DiagnosticSignHint DiagnosticHint'

exec 'hi DiagnosticSignError guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('DiagnosticError'),'fg')
exec 'hi DiagnosticSignWarn guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('DiagnosticWarn'),'fg')
exec 'hi DiagnosticSignInfo guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('DiagnosticInfo'),'fg')
exec 'hi DiagnosticSignHint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('DiagnosticHint'),'fg')
