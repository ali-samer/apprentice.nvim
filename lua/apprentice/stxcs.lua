
local hsl = require("lush.hsl")

return {
  -- Base colors
  ["Bad Character"] = hsl("#F75464"),

  ["Braces and Operators"] = {
    Braces = hsl("#BCBEC4"),
    Brackets = hsl("#BCBEC4"),
    Comma = hsl("#BCBEC4"),
    Dot = hsl("#BCBEC4"),
    ["Initializer list [Bold]"] = hsl("#FFFFFF"),
    ["Operator sign"] = hsl("#BCBEC4"),
    ["Overloaded operator"] = hsl("#5F8C8A"),
    Parantheses = hsl("#BCBEC4"),
    Semicolon = hsl("#BCBEC4"),
  },

  ["Class/struct/enum/union"] = hsl("#B5B6E3"),

  Comments = {
    ["Block comment"] = hsl("#7A7E85"),
    ["Line comment"] = hsl("#7A7E85"),
    Doxygen = {
      Tag = hsl("#67A37C"),
      ["Tag value"] = hsl("#ABADB3"),
      Text = hsl("#67A37C"),
    },
  },

  ["Conditionally non-compiled code"] = hsl("#686A4E"),

  ["Enum constant [Italic]"] = hsl("#C77DBB"),

  Functions = {
    Call = hsl("#BCBEC4"),
    Declaration = hsl("#56A8F5"),
  },

  Keywords = {
    ["'this' keyword"] = hsl("#CF8E6D"),
    Keyword = hsl("#CF8E6D"),
  },

  Label = hsl("#BCBEC4"),
  ["Macro name"] = hsl("#908B25"),
  Namespace = hsl("#B5B6E3"),
  Number = hsl("#2AACB8"),

  Parameters = {
    ["Macro parameter"] = hsl("#FFFFFF"),
    Parameter = hsl("#BCBEC4"),
  },

  Preprocessor = {
    ["Directive <Metadata>"] = hsl("#B3AE60"),
    ["Header path <String->String text>"] = hsl("#6AAB73"),
  },

  ["Semantic highlighting"] = hsl("#FFFFFF"),

  String = {
    ["Escape Sequence"] = {
      Invalid = { Foreground = hsl("#CF8E6D"), Effects = { Underwaved = hsl("#FA6675") } },
      Valid = hsl("#CF8E6D"),
    },
    ["Format specifier in string argument"] = hsl("#CF8E6D"),
    ["String text"] = hsl("#6AAB73"),
  },

  ["Struct field"] = hsl("#9373A5"),

  Templates = {
    Concept = hsl("#B5B6E3"),
    ["Deduction guide"] = hsl("#56A8F5"),
    ["Dependent code"] = hsl("#BCBEC4"),
    Type = hsl("#B9BCD1"),
    ["Value [Italic]"] = hsl("#C77DBB"),
  },

  ["Typedef (e.g., typedef struct Struct {int field;} Typedef;)"] = hsl("#B9BCD1"),

  Variables = {
    Extern = hsl("#BCBEC4"),
    Global = hsl("#BCBEC4"),
    Local = hsl("#BCBEC4"),
  },
}
