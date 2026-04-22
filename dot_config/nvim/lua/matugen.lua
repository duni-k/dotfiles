 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#d4d4d4', -- Default Background
     base01 = '#e8e8e8', -- Lighter Background (status bars)
     base02 = '#dedede', -- Selection Background
     base03 = '#777777', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#9e9e9e', -- Dark Foreground (status bars)
     base05 = '#696969', -- Default Foreground
     base06 = '#696969', -- Light Foreground
     base07 = '#696969', -- Lightest Foreground
     -- Accent colors
     base08 = '#222222', -- Variables, XML Tags, Errors
     base09 = '#333333', -- Integers, Constants
     base0A = '#505058', -- Classes, Search Background
     base0B = '#555555', -- Strings, Diff Inserted
     base0C = '#7e1b1b', -- Regex, Escape Chars
     base0D = '#7e1b1b', -- Functions, Methods
     base0E = '#1b1b7e', -- Keywords, Storage
     base0F = '#a05656', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
