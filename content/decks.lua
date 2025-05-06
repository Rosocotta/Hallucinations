local d20deck = {
  object_type = "Back",
  name = "D20 Deck",
  key = "d20deck",
  config = {consumable_slot = -1},
  atlas = "cardatlas",
  pos = {x = 3, y = 0},
  apply = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        if G.jokers.config.card_limit > #G.jokers.cards then
          local new = create_card("Joker", G.jokers, nil, nil, false, false, "j_oops", nil)
          new:add_to_deck()
          new:start_materialize()
          G.jokers:emplace(new)
          new:set_edition("e_negative", false, false)
        end
        return true
      end
    }))
  end
}
local pristinedeck = {
  object_type = "Back",
  name = "Pristine Deck",
  key = "pristinedeck",
  config = {hands = -2},
  atlas = "cardatlas",
  pos = {x = 4, y = 0},
  apply = function(self)
    G.E_MANAGER:add_event(Event({
      func = function()
        if G.jokers.config.card_limit > #G.jokers.cards then
          local new = create_card("Joker", G.jokers, nil, "hlucn_pristine", false, false, nil, "hlucn_pristinedeck")
          new:add_to_deck()
          new:start_materialize()
          G.jokers:emplace(new)
        end
        return true
      end
    }))
  end
}
local aluminumdeck = {
  object_type = "Back",
  name = "Aluminum Deck",
  key = "aluminumdeck",
  config = {no_interest = true, dollars = 16},
  atlas = "cardatlas",
  pos = {x = 5, y = 0}
}
local badecondeck = {
  object_type = "Back",
  name = "Failing Economy Deck",
  key = "badecondeck",
  config = {},
  atlas = "cardatlas",
  pos = {x = 0, y = 1},
  apply = function(self)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at - 10
  end,
  calculate = function(self, back, context)
    if context.ending_shop and G.GAME.dollars > 0 then
      ease_dollars(-G.GAME.dollars)
    end
  end
}


return{
  items = {
    d20deck,
    pristinedeck,
    aluminumdeck,
    badecondeck
  }
}