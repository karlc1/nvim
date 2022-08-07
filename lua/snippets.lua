local ls = require("luasnip")
local snippet = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- require("luasnip.session.snippet_collection").clear_snippets("go")

-- local snippet = ls.s

-- local shortcut = function(val)
-- 	if type(val) == "string" then
-- 		return { t({ val }), i(0) }
-- 	end
--
-- 	if type(val) == "table" then
-- 		for k, v in ipairs(val) do
-- 			if type(v) == "string" then
-- 				val[k] = t({ v })
-- 			end
-- 		end
-- 	end
--
-- 	return val
-- end
--
-- local snippet = ls.s
-- local make = function(tbl)
-- 	local result = {}
-- 	for k, v in pairs(tbl) do
-- 		table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
-- 	end
--
-- 	return result
-- end
--

ls.add_snippets("go", {

	snippet("iferr", {
		t({ "if err != nil {", "\treturn err" }),
		i(0),
		t({ "", "}" }),
	}),

	snippet("main", {
		t({ "func main() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	snippet("tfunc", {
		t({ "func Test" }),
		i(1),
		t({ "(t *testing.T){", "\t" }),
		i(2),
		t({ "", "}" }),
	}),
})
--
-- ls.add_snippets(
-- 	"go",
-- 	make({
-- 		main = {
-- 			t({ "func main() {", "\t" }),
-- 			i(0),
-- 			t({ "", "}" }),
-- 		},
--
-- 		iferr = {
-- 			t({ "if err != nil {", "\t" }),
-- 			t({ "return err" }),
-- 			i(0),
-- 			t({ "", "}" }),
-- 		},
--
-- 		ef = {
-- 			i(1, { "val" }),
-- 			t(", err := "),
-- 			i(2, { "f" }),
-- 			t("("),
-- 			i(3),
-- 			t(")"),
-- 			i(0),
-- 		},
--
-- 		-- TODO: Fix this up so that it actually uses the tree sitter thing
-- 		ie = { "if err != nil {", "\treturn err", i(0), "}" },
-- 	})
-- )

-- ls.add_snippets("go", {
-- 	s("f", fmt("func {}({}) {} {{\n\t{}\n}}", { i(1, "name"), i(2), i(3), i(0) })),
-- })
