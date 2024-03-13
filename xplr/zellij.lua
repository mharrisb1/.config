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
  Vertical = {
    config = {
      constraints = {
        { Length = 3 },
        { Min = 1 },
        { Length = 3 },
      },
    },
    splits = {
      "SortAndFilter",
      "Table",
      "InputAndLogs",
    },
  }
  -- Dynamic = "custom.tree_view.render",
}

xplr.config.layouts.builtin.default = xplr.util.layout_replace(
  xplr.config.layouts.builtin.default,
  "Table",
  xplr.config.layouts.custom.tree_view_fullscreen
)

-- keybindings
xplr.config.modes.builtin.default = {
  name = "default",
  key_bindings = {
    on_key = {
      ["#"] = {
        messages = {
          "PrintAppStateAndQuit",
        },
      },
      ["."] = {
        help = "show hidden",
        messages = {
          {
            ToggleNodeFilter = { filter = "RelativePathDoesNotStartWith", input = "." },
          },
          "ExplorePwdAsync",
        },
      },
      [":"] = {
        help = "action",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "action" },
        },
      },
      ["G"] = {
        help = "go to bottom",
        messages = {
          "PopMode",
          "FocusLast",
        },
      },
      ["ctrl-a"] = {
        help = "select/unselect all",
        messages = {
          "ToggleSelectAll",
        },
      },
      ["ctrl-f"] = {
        help = "search",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "search" },
          { SetInputBuffer = "" },
        },
      },
      ["ctrl-i"] = {
        help = "next visited path",
        messages = {
          "NextVisitedPath",
        },
      },
      ["ctrl-o"] = {
        help = "last visited path",
        messages = {
          "LastVisitedPath",
        },
      },
      [")"] = {
        help = "next deep branch",
        messages = {
          "NextVisitedDeepBranch",
        },
      },
      ["("] = {
        help = "prev deep branch",
        messages = {
          "PreviousVisitedDeepBranch",
        },
      },
      ["ctrl-r"] = {
        help = "refresh screen",
        messages = {
          "ClearScreen",
        },
      },
      ["ctrl-u"] = {
        help = "clear selection",
        messages = {
          "ClearSelection",
        },
      },
      ["ctrl-w"] = {
        help = "switch layout",
        messages = {
          { SwitchModeBuiltin = "switch_layout" },
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "delete" },
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["enter"] = {
        help = "open file in new pane",
        messages = {
          {
            BashExecSilently0 = [===[
              zellij run --close-on-exit -- hx "${XPLR_FOCUS_PATH:?}"
            ]===],
          }
        }
      },
      ["f"] = {
        help = "filter",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "filter" },
        },
      },
      ["g"] = {
        help = "go to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to" },
        },
      },
      ["left"] = {
        help = "back",
        messages = {
          "Back",
        },
      },
      -- ["q"] = {
      --   help = "quit",
      --   messages = {
      --     "Quit",
      --   },
      -- },
      ["r"] = {
        help = "rename",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "rename" },
          {
            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
          },
        },
      },
      ["ctrl-d"] = {
        help = "duplicate as",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "duplicate_as" },
          {
            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
          },
        },
      },
      ["right"] = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["s"] = {
        help = "sort",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "sort" },
        },
      },
      ["space"] = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      ["up"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["~"] = {
        help = "go home",
        messages = {
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
          },
        },
      },
      ["page-up"] = {
        help = "scroll up",
        messages = {
          "ScrollUp",
        },
      },
      ["page-down"] = {
        help = "scroll down",
        messages = {
          "ScrollDown",
        },
      },
      ["{"] = {
        help = "scroll up half",
        messages = {
          "ScrollUpHalf",
        },
      },
      ["}"] = {
        help = "scroll down half",
        messages = {
          "ScrollDownHalf",
        },
      },
      ["ctrl-n"] = {
        help = "next selection",
        messages = {
          "FocusNextSelection",
        },
      },
      ["ctrl-p"] = {
        help = "prev selection",
        messages = {
          "FocusPreviousSelection",
        },
      },
      ["m"] = {
        help = "move to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "move_to" },
          { SetInputBuffer = "" },
        },
      },
      ["c"] = {
        help = "copy to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "copy_to" },
          { SetInputBuffer = "" },
        },
      },
      ["o"] = {
        help = "toggle expansion",
        messages = {
          "PopMode",
          { CallLuaSilently = "custom.tree_view.toggle" },
        },
      }
    },
    on_number = {
      help = "input",
      messages = {
        "PopMode",
        { SwitchModeBuiltin = "number" },
        "BufferInputFromKey",
      },
    },
  },
}

xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["space"]
xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]
xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]
xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["down"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
    xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"] -- compatibility workaround
xplr.config.modes.builtin.default.key_bindings.on_key["?"] =
    xplr.config.general.global_key_bindings.on_key["f1"]
