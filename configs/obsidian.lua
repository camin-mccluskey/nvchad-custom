local options = {
  dir = "~/Obsidian-camin-vault",
  completion = {
    nvim_cmp = true,
  },
  daily_notes = {
    folder = "Daily",
  },
  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart { "open", url } -- Mac OS
  end,
  -- newly created notes should just use the title as the filename
  note_id_func = function(title)
    local sane_name = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      -- sane_name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
      -- I don't see why we can't just use the title as is
      sane_name = title
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ in 1, 4 do
        sane_name = sane_name .. string.char(math.random(65, 90))
      end
    end
    return sane_name
  end,

  -- we don't want this plugin to manager frontmatter
  disable_frontmatter = false,

  -- b/c configured on Obsidian instance
  use_advanced_uri = true,
  -- forces :ObsidianOpen to bring app to foreground
  open_app_foreground = false,
  finder = "telescope.nvim",
}

return options
