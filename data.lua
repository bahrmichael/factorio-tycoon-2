-- This file is executed during the data stage
-- It loads all prototype definitions

require("prototypes.items.index")
require("prototypes.recipes.index")
require("prototypes.entities.index")
require("prototypes.technologies.index")

-- Tile definitions
require("prototypes.tile.tiles-nauvis")

-- Planet map generation
require("prototypes.planet.planet-nauvis-map-gen")

-- Autoplace controls
require("prototypes.autoplace-controls.nauvis-soil")