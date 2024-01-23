-- create ls variable and import luasnip
local ls = require "luasnip"

--add custom snippets

-- ls.parser.parse_snippet(<text>, <vscode-style snippet>)
ls.add_snippets({
-- all file types
  'all', {
    ls.parser.parse_snippet(
      'hw',
      'hello world'),
  },
  'js', {
    ls.parser.parse_snippet(
      'cl',
      'console.log($0)'),
  },
  'lua', {
    ls.parser.parse_snippet(
      'lf',
      'local $1 = function($2)/n $0/nend'),
  }
})
