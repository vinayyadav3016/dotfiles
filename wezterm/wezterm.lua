-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- fullscreen bug
config.native_macos_fullscreen_mode = true
-- config.window_decorations = "RESIZE"

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'Solarized (dark) (terminal.sexy)'

-- use only bash
--
config.default_prog = { '/opt/homebrew/bin/bash' }

-- change title
-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return ' '
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return ' '
  --return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
        { Background = { Color = 'black' } },
        { Text = ' ' },
      }
    end
    -- if tab.is_last_active then
    --   -- Green color and append '*' to previously active tab.
    --   return {
    --     { Background = { Color = 'green' } },
    --     { Text = ' ' },
    --   }
    -- end
    return { }
    -- return {
    --   { Background = { Color = 'green' } },
    --   { Text = ' ' },
    -- }
    -- return title
  end
)

-- Finally, return the configuration to wezterm:
return config
