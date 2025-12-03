local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("rnss", {
    t("const styles = StyleSheet.create({"),
    t({"", "  "}),
    i(1),
    t({"", "})"}),
  }),
}
