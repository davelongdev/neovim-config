-- create ls variable and import luasnip
local ls = require "luasnip"

-- ls.parser.parse_snippet(<text>, <vscode-style snippet>)
ls.add_snippets(
  'all', {
    -- available in any filetype
    ls.parser.parse_snippet("expand", "this is what was expanded"),
  }
)
