data:extend({
  {
    type = "autoplace-control",
    name = "tycoon-wetland",
    richness = true,
    order = "b-a",
    category = "terrain"
  },
  {
    type = "noise-layer",
    name = "tycoon-wetland"
  }
})

data.raw["tile"]["tycoon-wetland"].autoplace = {
  probability_expression = {
    type = "multiply",
    arguments = {
      { type = "constant", value = 0.4 },
      {
        type = "function-application",
        function_name = "clamp",
        arguments = {
          {
            type = "add",
            arguments = {
              {
                type = "function-application",
                function_name = "distance-from",
                arguments = {{ type = "literal-string", value = "water" }}
              },
              { type = "constant", value = -0.3 }
            }
          },
          { type = "constant", value = 0 },
          { type = "constant", value = 1 }
        }
      }
    }
  },
  richness_expression = { type = "constant", value = 1 }
}