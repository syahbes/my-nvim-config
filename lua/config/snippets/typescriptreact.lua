local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to get component name from filename
local function get_component_name()
  local filename = vim.fn.expand("%:t:r") -- Get filename without extension
  if filename == "" then
    return "Component"
  end
  -- Capitalize first letter
  return filename:sub(1,1):upper() .. filename:sub(2)
end

return {
  -- StyleSheet snippet
  s("rnss", {
    t("const styles = StyleSheet.create({"),
    t({"", "  "}),
    i(1),
    t({"", "})"}),
  }),

  -- React Native component snippet
  s("rnfc", {
    t("import { View, Text, StyleSheet } from 'react-native';"),
    t({"", ""}),
    t({"const "}),
    f(get_component_name, {}),
    t({" = () => {", "  return (", "    <View style={styles.container}>"}),
    t({"", "      <Text>"}),
    f(get_component_name, {}),
    t({"</Text>", "    </View>", "  );", "};", ""}),
    t({"const styles = StyleSheet.create({", "  container: {", "    "}),
    i(1),
    t({"", "  },", "});", ""}),
    t({"export default "}),
    f(get_component_name, {}),
    t(";"),
  }),
}
