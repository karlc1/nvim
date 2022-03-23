
" signs and hl for debugging
exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')
exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')
sign define DapBreakpoint text=⊚ texthl=DebugBreakpoint
sign define DapStopped text=→ texthl=DebugStopped linehl=Visual

