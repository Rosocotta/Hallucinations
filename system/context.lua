SMODS.ObjectType({
  key = "MHalluRareJoker",
  default = "j_hlucn_luckystar",
  cards = {},
  inject = function(self)
    SMODS.ObjectType.inject(self)
  end
})
SMODS.Rarity({
  key = "pristine",
  badge_colour = HEX("FF7FED"),
  default_weight = 0
})
SMODS.Rarity({
  key = "resin",
  badge_colour = HEX("990000"),
  default_weight = 0
})
SMODS.Atlas({
  key = "jokeratlas",
  path = "jokeratlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "resinatlas",
  path = "resinatlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "floridatlas",
  path = "floridatlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "lunacyatlas",
  path = "lunacyatlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "cardatlas",
  path = "cardatlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "consumeatlas",
  path = "consumeatlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "boosteratlas",
  path = "boosteratlas.png",
  px = 71,
  py = 95
})
SMODS.Atlas({
  key = "pristineatlas",
  path = "pristineatlas.png",
  px = 71,
  py = 95
})
SMODS.UndiscoveredSprite({
  key = "Florid",
  atlas = "floridatlas",
  path = "floridatlas.png",
  pos = {x = 4, y = 1},
  px = 71,
  py = 95
})
SMODS.UndiscoveredSprite({
  key = "Lunacy",
  atlas = "lunacyatlas",
  path = "lunacyatlas.png",
  pos = {x = 4, y = 1},
  px = 71,
  py = 95
})