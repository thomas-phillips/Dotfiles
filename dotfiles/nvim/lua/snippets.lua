local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- stylua: ignore
ls.add_snippets("rust", {
	s("test_mod", {
		t(
			{
				"#[cfg(test)]",
				"mod test {",
				"use super::*;",
				"",
			}
		),
		i(0, "test"),
		t({ "", "}" })
	}),

	s("test_func", {
		t({ "#[test]", "fn test_" }),
		i(1, "name"),
		t({ "() {", "" }),
		i(0),
		t({ "", "}" }),
	}),
})
