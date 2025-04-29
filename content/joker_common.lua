local polishedjoker = { -- Polished Joker: Scored glass cards gain +6 Mult
  object_type = "Joker",
  name = "hlucn_polishedjoker",
  key = "polishedjoker",
  config = {extra = {mult = 6}},
  atlas = "jokeratlas",
  pos = {x = 0, y = 0},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_glass
    return {vars = {card.ability.extra.mult}}
  end,
  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      if context.other_card and context.other_card.ability.name == "Glass Card" then
        return{mult = card.ability.extra.mult}
      end
    end
  end
}
local rendererror = { -- Rendering Error: 1 in 2 chance to give +20 Mult
  object_type = "Joker",
  name = "hlucn_rendererror",
  key = "rendererror",
  config = {extra = {mult = 20, odds = 2}},
  atlas = "jokeratlas",
  pos = {x = 2, y = 0},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.mult, (G.GAME.probabilities.normal or 1),  card.ability.extra.odds}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if pseudorandom("rendererror") < G.GAME.probabilities.normal / card.ability.extra.odds then
        return{mult = card.ability.extra.mult}
      end
    end
  end
}
local arcanist = { -- Arcanist: +1 consumable slot
  object_type = "Joker",
  name = "hlucn_arcanist",
  key = "arcanist",
  config = {extra = {slots = 1}},
  atlas = "jokeratlas",
  pos = {x = 6, y = 0},
  rarity = 1,
  cost = 4,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.slots}}
  end,
  add_to_deck = function(self, card, from_debuff)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slots
  end
}
local sleepparalysis = { -- Sleep Paralysis Demon: When booster pack is skipped, 1 in 3 chance to create a spectral card
  object_type = "Joker",
  name = "hlucn_sleepparalysis",
  key = "sleepparalysis",
  config = {extra = {odds = 3}},
  atlas = "jokeratlas",
  pos = {x = 7, y = 0},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
  end,
  calculate = function(self, card, context)
    if context.skipping_booster then
      if pseudorandom("sleepparalysis") < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
          func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
              play_sound("timpani")
              local new = create_card("Spectral", G.consumeables, nil, nil, false, false, nil, "hlucn_sleepparalysis")
              new:add_to_deck()
              G.consumeables:emplace(new)
              card:juice_up()
            end
            return true
          end
        }))
      end
    end
  end
}
local tinyfrog = { -- Tiny Frog: x1.5 Mult if remaining hands is even
  object_type = "Joker",
  name = "hlucn_tinyfrog",
  key = "tinyfrog",
  config = {extra = {multcurr = 1.5}},
  atlas = "jokeratlas",
  pos = {x = 0, y = 1},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.multcurr}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.current_round.hands_left % 2 == 0 then
        return{xmult = card.ability.extra.multcurr}
      end
    end
  end
}

return{
  items = {
    polishedjoker,
    rendererror,
    arcanist,
    sleepparalysis,
    tinyfrog
  }
}