local ls = require("luasnip")
local snippet = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("go", {

	-- error check
	snippet("iferr", {
		t({ "if err != nil {", "\treturn " }),
		i(0, "err"),
		t({ "", "}" }),
	}),

	-- main method boilerplate
	snippet("main", {
		t({ "func main() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- generic function
	snippet("func", {
		t({ "func " }),
		i(1),
		t({ "(" }),
		i(2),
		t({ ") " }),
		i(3),
		t({ "{", "\t" }),
		i(4),
		t({ "", "}" }),
	}),

	-- function with receiver
	snippet("rfunc", {
		t({ "func (" }),
		i(1),
		t({ ") " }),
		i(2),
		t({ "(" }),
		i(3),
		t({ ") " }),
		i(4),
		t({ "{", "\t" }),
		i(5),
		t({ "", "}" }),
	}),

	-- test function
	snippet("tfunc", {
		t({ "func Test" }),
		i(1),
		t({ "(t *testing.T) {", "\t" }),
		i(2),
		t({ "", "}" }),
	}),
})
