version = '0.21.5'

xplr.config.general.show_hidden = true

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
    .. ";"
    .. xpm_path
    .. "/?.lua;"
    .. xpm_path
    .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',
    { name = 'sayanarijit/fzf.xplr' },
    { name = 'sayanarijit/tree-view.xplr' },
    { name = 'prncss-xyz/icons.xplr' },
    { name = 'dtomvan/extra-icons.xplr' },
    { name = 'sayanarijit/map.xplr' }
  },
  auto_install = true,
  auto_cleanup = true,
})

require("fzf").setup()
require("tree-view").setup()
require("icons").setup()
require("extra-icons").setup()

-- layout
xplr.config.layouts.builtin.default = {
  Dynamic = "custom.tree_view.render",
}
