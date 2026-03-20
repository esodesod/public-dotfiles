-- based on https://github.com/folke/dot/blob/master/config/wezterm/tabs.lua
-- updated to Nerd Fonts v3
local wezterm = require("wezterm") --[[@as Wezterm]]

local M = {}
M.arrow_solid = ""
M.arrow_thin = ""

-- Updated for Nerd Fonts v3 (mdi -> md)
M.icons = {
  ["bash"] = wezterm.nerdfonts.dev_bash,
  ["btm"] = wezterm.nerdfonts.md_chart_donut_variant,
  ["btop"] = wezterm.nerdfonts.md_chart_areaspline,
  ["cargo"] = wezterm.nerdfonts.dev_rust,
  ["cmd.exe"] = wezterm.nerdfonts.md_console_line,
  ["curl"] = wezterm.nerdfonts.md_flattr,
  ["docker-compose"] = wezterm.nerdfonts.linux_docker,
  ["docker"] = wezterm.nerdfonts.linux_docker,
  ["fish"] = wezterm.nerdfonts.md_fish,
  ["gh"] = wezterm.nerdfonts.dev_github_badge,
  ["git"] = wezterm.nerdfonts.dev_git,
  ["go"] = wezterm.nerdfonts.seti_go,
  ["htop"] = wezterm.nerdfonts.md_chart_areaspline,
  ["k9s"] = wezterm.nerdfonts.md_kubernetes,
  ["kubectl"] = wezterm.nerdfonts.linux_docker,
  ["lazygit"] = wezterm.nerdfonts.cod_github,
  ["node"] = wezterm.nerdfonts.md_hexagon,
  ["nvim"] = wezterm.nerdfonts.custom_neovim,
  ["powershell"] = wezterm.nerdfonts.md_powershell,
  ["pwsh"] = wezterm.nerdfonts.md_powershell,
  ["ssh"] = wezterm.nerdfonts.md_ssh,
  ["vim"] = wezterm.nerdfonts.dev_vim,
  ["zsh"] = wezterm.nerdfonts.dev_terminal,
}

local function get_process_name(pane)
  -- Get the process name (e.g. /usr/bin/nvim -> nvim)
  local process_name = pane.foreground_process_name:gsub("(.*[/\\])(.*)", "%2")
  if process_name == "" then
    -- Fallback to title if process name is unavailable
    process_name = pane.title:match("^(%S+)") or ""
  end
  return process_name:lower()
end

function M.title(tab, max_width)
  local pane = tab.active_pane
  local process = get_process_name(pane)
  local title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or pane.title

  -- Match icon
  if M.icons[process] then
    title = M.icons[process] .. " " .. title
  end

  -- Zoom indicator
  local is_zoomed = false
  for _, p in ipairs(tab.panes) do
    if p.is_zoomed then
      is_zoomed = true
      break
    end
  end
  if is_zoomed then title = " " .. title end

  return " " .. wezterm.truncate_right(title, max_width - 3) .. " "
end

function M.setup(config)
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = true
  config.hide_tab_bar_if_only_one_tab = true

  wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
    if not cfg.resolved_palette or not cfg.resolved_palette.tab_bar then
      return { { Text = M.title(tab, max_width) } }
    end

    local title = M.title(tab, max_width)
    local colors = cfg.resolved_palette
    local active_bg = colors.tab_bar.active_tab.bg_color
    local inactive_bg = colors.tab_bar.inactive_tab.bg_color

    -- Find index
    local tab_idx = 1
    for i, t in ipairs(tabs) do
      if t.tab_id == tab.tab_id then tab_idx = i break end
    end

    local is_last = tab_idx == #tabs
    local next_tab = tabs[tab_idx + 1]
    local next_is_active = next_tab and next_tab.is_active

    -- Arrow Logic
    local arrow = (tab.is_active or is_last or next_is_active) and M.arrow_solid or M.arrow_thin
    local arrow_fg = colors.tab_bar.inactive_tab_edge
    local arrow_bg = inactive_bg

    if is_last then
      arrow_fg = tab.is_active and active_bg or inactive_bg
      arrow_bg = colors.tab_bar.background
    elseif tab.is_active then
      arrow_fg, arrow_bg = active_bg, inactive_bg
    elseif next_is_active then
      arrow_fg, arrow_bg = inactive_bg, active_bg
    end

    local ret = tab.is_active and
    { { Attribute = { Intensity = "Bold" } }, { Attribute = { Italic = true } } } or {}
    table.insert(ret, { Text = title })
    table.insert(ret, { Foreground = { Color = arrow_fg } })
    table.insert(ret, { Background = { Color = arrow_bg } })
    table.insert(ret, { Text = arrow })
    return ret
  end)
end

return M
