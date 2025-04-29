local hourglass = { -- Peculiar Hourglass: If no discards are used, creates a negative common joker at end of round. Destroyed if player has 0 discards.
  object_type = "Joker",
  name = "hlucn_hourglass",
  key = "hourglass",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 9, y = 0},
  rarity = 3,
  cost = 9,
  blueprint_compat = true,
  eternal_compat = false,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    return {}
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.cardarea == G.jokers then
      if G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 then
        play_sound("timpani")
        local new = create_card("Joker", G.jokers, nil, 0, false, false, nil, "hlucn_hourglass")
        new:set_edition("e_negative", false, false)
        new:add_to_deck()
        G.jokers:emplace(new)
        return {message = localize("hlucn_msg_jgenerate"), colour = G.C.PURPLE}
      end
      if G.GAME.current_round.discards_left < 1 and not context.blueprint then
        card:start_dissolve(false, false)
        return {message = localize("hlucn_msg_destroy_1"), colour = G.C.RED}
      end
    end
  end
}
local promopencil = { -- Promotional Pencil: Earns $2 for every joker
  object_type = "Joker",
  name = "hlucn_promopencil",
  key = "promopencil",
  config = {extra = {count = 2}},
  atlas = "jokeratlas",
  pos = {x = 3, y = 1},
  rarity = 3,
  cost = 11,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.count, ((G.jokers and card.ability.extra.count * #G.jokers.cards) or 2)}}
  end,
  calculate_dollar_bonus = function()
    return card.ability.extra.count * #G.jokers.cards
  end
}
local luckystar = { -- Lucky Star: Various chance based effects
  object_type = "Joker",
  name = "hlucn_luckystar",
  key = "luckystar",
  config = {extra = {odds = 4, chipsval = 180, multval = 20, xmultval = 2.5, cash = 4}},
  atlas = "jokeratlas",
  pos = {x = 5, y = 1},
  rarity = 3,
  cost = 12,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.chipsval, card.ability.extra.multval, card.ability.extra.xmultval, card.ability.extra.cash}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local ychip = 0
      local ymult = 0
      local yxmult = 1
      local ymoney = 0
      if pseudorandom("luckystar1") < G.GAME.probabilities.normal / card.ability.extra.odds then
        ychip = card.ability.extra.chipsval
      end
      if pseudorandom("luckystar2") < G.GAME.probabilities.normal / card.ability.extra.odds then
        ymult = card.ability.extra.multval
      end
      if pseudorandom("luckystar3") < G.GAME.probabilities.normal / card.ability.extra.odds then
        yxmult = card.ability.extra.xmultval
      end
      if pseudorandom("luckystar4") < G.GAME.probabilities.normal / card.ability.extra.odds then
        ymoney = card.ability.extra.cash
      end
      if ymoney > 0 then
        ease_dollars(ymoney)
      end
      return{chips = ychip, mult = ymult, xmult = yxmult}
    end
  end
}
local aceofjoker = { -- Ace Of Jokers: Scored Aces give x2 Mult
  object_type = "Joker",
  name = "hlucn_aceofjoker",
  key = "aceofjoker",
  config = {extra = {xmultval = 2}},
  atlas = "jokeratlas",
  pos = {x = 6, y = 1},
  rarity = 3,
  cost = 13,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.xmultval}}
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:get_id() == 14 then
        return{xmult = card.ability.extra.xmultval}
      end
    end
  end
}
local runictablet = { -- Runic Tablet: Inscribed cards cap increased to x2.75 Inscribed cards at x2.75 mult are reduced to x1.5 mult
  object_type = "Joker",
  name = "hlucn_runictablet",
  key = "runictablet",
  config = {extra = {triggers = 1}},
  atlas = "jokeratlas",
  pos = {x = 7, y = 1},
  rarity = 3,
  cost = 13,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_hlucn_inscribed
    return{}
  end
}

return{
  items = {
    hourglass,
    promopencil,
    luckystar,
    aceofjoker,
    runictablet
  }
}