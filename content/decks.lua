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
          local new = create_card("Joker", G.jokers, nil, "hlucn_pristine", false, false, nil, nil)
          new:add_to_deck()
          new:start_materialize()
          G.jokers:emplace(new)
        end
        return true
      end
    }))
  end
}
local aluminiumdeck = {
  object_type = "Back",
  name = "Aluminium Deck",
  key = "aluminiumdeck",
  config = {no_interest = true, dollars = 16},
  atlas = "cardatlas",
  pos = {x = 5, y = 0}
}


return{
  items = {
    d20deck,
    pristinedeck,
    aluminiumdeck
  }
}