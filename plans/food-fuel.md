# Houses as Food-Burning Worker Refreshment Stations

## Overview
Convert houses into burner assembling machines that use food as fuel to transform tired workers into refreshed workers.

## Implementation Details

### House Modifications
- Convert house entities to use `energy_source = {type = "burner", fuel_categories = {"food"}, effectivity = X}`
- Create a new fuel category "food" for edible items
- Add `fuel_category = "food"` and `fuel_value = "X kJ"` to food items
- Configure crafting_speed and module_slots based on house size

### Worker Processing
- Create recipes for each house that take "tycoon-tired-worker" and produce "tycoon-worker"
- Larger houses should have higher crafting_speed but lower energy effectivity
- Recipe should require short processing time (e.g., 1-2 seconds)

### Balancing
Small house: 75% fuel efficiency, processes 1 worker at a time
Medium house: 65% fuel efficiency, processes 2 workers at a time
Large house: 50% fuel efficiency, processes 4 workers at a time

### Food Items as Fuel
Assign different fuel values to food items based on complexity:
- Basic (bread, vegetables): 500kJ
- Prepared meals: 1000kJ
- Gourmet dishes: 2000kJ