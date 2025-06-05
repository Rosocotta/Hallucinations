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
    if context.individual and context.cardarea == G.play then
      if context.other_card and mhallu.get_upgrade(context.other_card, "E") == G.P_CENTERS.m_glass and not context.other_card.debuff then
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
local tinyfrog = { -- Tiny Frog: x1.75 Mult if remaining hands is even
  object_type = "Joker",
  name = "hlucn_tinyfrog",
  key = "tinyfrog",
  config = {extra = {xmult = 1.75}},
  atlas = "jokeratlas",
  pos = {x = 0, y = 1},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.xmult}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.current_round.hands_left % 2 == 0 then
        return{xmult = card.ability.extra.xmult}
      end
    end
  end
}
local nonogram = { -- Nonogram: Gains +7 Chips if scored hand contains only number cards
  object_type = "Joker",
  name = "hlucn_nonogram",
  key = "nonogram",
  config = {extra = {chipcurr = 0, chipscale = 7}},
  atlas = "jokeratlas",
  pos = {x = 9, y = 1},
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.chipcurr, card.ability.extra.chipscale}}
  end,
  calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers then
      local canscale = true
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:get_id() > 10 then
          canscale = false
        end
      end
      if canscale then
        card.ability.extra.chipcurr = card.ability.extra.chipcurr + card.ability.extra.chipscale
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.BLUE}
      end
    end
    if context.joker_main and card.ability.extra.chipcurr > 0 then
      return{chips = card.ability.extra.chipcurr}
    end
  end
}
local sudoku = { -- Sudoku: +2 Mult for each consecutive hand without a pair
  object_type = "Joker",
  name = "hlucn_sudoku",
  key = "sudoku",
  config = {extra = {multcurr = 0, multscale = 2}},
  atlas = "jokeratlas",
  pos = {x = 1, y = 2},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.multcurr, card.ability.extra.multscale}}
  end,
  calculate = function(self, card, context)
    if context.before and context.scoring_hand and not context.blueprint then
      if next(context.poker_hands["Pair"]) then
        card.ability.extra.multcurr = 0
        return{message = localize("hlucn_msg_reset"), colour = G.C.RED}
      else
        card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.RED}
      end
    end
    if context.joker_main and card.ability.extra.multcurr > 0 then
      return{mult = card.ability.extra.multcurr}
    end
  end
}
local recycling = { -- Recycling: Earns $1 when consumable is used
  object_type = "Joker",
  name = "hlucn_recycling",
  key = "recycling",
  config = {extra = {income = 1}},
  atlas = "jokeratlas",
  pos = {x = 4, y = 2},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.income}}
  end,
  calculate = function(self, card, context)
    if context.using_consumeable then
      ease_dollars(card.ability.extra.income)
      return{message = "$" .. card.ability.extra.income, colour = G.C.GOLD}
    end
  end
}
local birdhieroglyph = { -- Bird Hieroglyph: Earns $4 each hand. -$1 for every card played
  object_type = "Joker",
  name = "hlucn_birdhieroglyph",
  key = "birdhieroglyph",
  config = {extra = {income = 4, decay = 1}},
  atlas = "jokeratlas",
  pos = {x = 5, y = 2},
  rarity = 1,
  cost = 5,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.income, card.ability.extra.decay}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local togive = card.ability.extra.income - (card.ability.extra.decay * #context.scoring_hand)
      ease_dollars(togive)
      return{message = "$" .. togive, colour = G.C.GOLD}
    end
  end
}
local pridefuljoker = { -- Prideful Joker: Scored Wild Cards give +6 Mult
  object_type = "Joker",
  name = "hlucn_pridefuljoker",
  key = "pridefuljoker",
  config = {extra = {mult = 6}},
  atlas = "jokeratlas",
  pos = {x = 6, y = 2},
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    return {vars = {card.ability.extra.mult}}
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card and mhallu.get_upgrade(context.other_card, "E") == G.P_CENTERS.m_wild and not context.other_card.debuff then
        return{mult = card.ability.extra.mult}
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
    tinyfrog,
    nonogram,
    sudoku,
    recycling,
    birdhieroglyph,
    pridefuljoker
  }
}