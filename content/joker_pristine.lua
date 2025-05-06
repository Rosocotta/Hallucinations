local zephyr = { -- Zephyr: +1 Discards. Gains x0.1 Mult for every card discarded. Resets after each round.
  object_type = "Joker",
  name = "hlucn_zephyr",
  key = "zephyr",
  config = {extra = {discards = 1, xscale = 0.1, xcurr = 1}},
  atlas = "pristineatlas",
  pos = {x = 0, y = 0},
  soul_pos = {x = 0, y = 1},
  rarity = "hlucn_pristine",
  cost = 20,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.discards, card.ability.extra.xscale, card.ability.extra.xcurr}}
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
    ease_discard(card.ability.extra.discards)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
    ease_discard(-card.ability.extra.discards)
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      card.ability.extra.xcurr = card.ability.extra.xcurr + card.ability.extra.xscale
      return{message = ("X" .. card.ability.extra.xcurr), colour = G.C.RED}
    end
    if context.joker_main then
      return{xmult = card.ability.extra.xcurr}
    end
    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.xcurr = 1
      return{message = localize("hlucn_msg_reset"), colour = G.C.RED}
    end
  end
}
local cosmos = { -- Cosmos: All planet cards are Black Hole. Creates 2 Planet cards after boss blind is defeated
  object_type = "Joker",
  name = "hlucn_cosmos",
  key = "cosmos",
  config = {extra = {count = 2}},
  atlas = "pristineatlas",
  pos = {x = 1, y = 0},
  soul_pos = {x = 1, y = 1},
  rarity = "hlucn_pristine",
  cost = 20,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.c_black_hole
    return {vars = {card.ability.extra.count}}
  end,
  calculate = function(self, card, context)
    if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers then
      for i=1, math.min(self.config.extra.count, G.consumeables.config.card_limit - #G.consumeables.cards) do
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          if i == 1 then
            play_sound("timpani")
          end
          local new = create_card("Planet", G.consumeables, nil, nil, false, false, nil, "hlucn_cosmos")
          new:add_to_deck()
          G.consumeables:emplace(new)
        end
      end
      return{message = localize("hlucn_msg_alert"), colour = G.C.SECONDARY_SET.Planet}
    end
  end
}
local argil = { -- Argil: Gains 44 Chips for every blind skipped. Creates double tag when joker is sold (once per round)
  object_type = "Joker",
  name = "hlucn_argil",
  key = "argil",
  config = {extra = {active = true, chipscale = 44}},
  atlas = "pristineatlas",
  pos = {x = 2, y = 0},
  soul_pos = {x = 2, y = 1},
  rarity = "hlucn_pristine",
  cost = 20,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = {set = "Tag", key = "tag_double"}
    if card.ability.extra.active then
      return{vars = {"available", card.ability.extra.chipscale, G.GAME.skips*card.ability.extra.chipscale}}
    else
      return{vars = {"unavailable", card.ability.extra.chipscale, G.GAME.skips*card.ability.extra.chipscale}}
    end
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return{chips = G.GAME.skips*card.ability.extra.chipscale}
    end
    if context.selling_card and card.ability.extra.active then
      add_tag(Tag("tag_double"))
      card.ability.extra.active = false
      return{message = localize("hlucn_msg_gettag"), colour = G.C.SECONDARY_SET.Enhanced}
    end
    if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.active == false and not context.blueprint then
      card.ability.extra.active = true
      return{message = localize("hlucn_msg_reset"), colour = G.C.GREEN}
    end
  end
}
local deluge = { -- Deluge: +4 hand size. All played cards score.
  object_type = "Joker",
  name = "hlucn_deluge",
  key = "deluge",
  config = {extra = {handsize = 4}},
  atlas = "pristineatlas",
  pos = {x = 3, y = 0},
  soul_pos = {x = 3, y = 1},
  rarity = "hlucn_pristine",
  cost = 20,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.handsize}}
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.handsize)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.handsize)
  end,
  calculate = function(self, card, context)
    if context.modify_scoring_hand then
      card = card
      return{add_to_hand = true}
    end
  end
}
local nihil = { -- Nihil: Retriggers all played cards 2 times for each empty joker slot
  object_type = "Joker",
  name = "hlucn_nihil",
  key = "nihil",
  config = {extra = {triggers = 2, empty = 0}},
  atlas = "pristineatlas",
  pos = {x = 4, y = 0},
  soul_pos = {x = 4, y = 1},
  rarity = "hlucn_pristine",
  cost = 20,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.triggers, card.ability.extra.empty*card.ability.extra.triggers}}
  end,
  calculate = function(self, card, context)
    card.ability.extra.empty = G.jokers.config.card_limit - #G.jokers.cards
    for i=1, #G.jokers.cards do
      if G.jokers.cards[i].ability.name == "hlucn_nihil" or G.jokers.cards[i].ability.name == "Joker Stencil" then card.ability.extra.empty = card.ability.extra.empty + 1 end
    end
    if context.cardarea == G.play and context.repetition then
      return{message = localize("hlucn_msg_repeat"), colour = HEX("000000"), repetitions = card.ability.extra.empty*card.ability.extra.triggers}
    end
  end
}

return{
  items = {
    zephyr,
    cosmos,
    argil,
    deluge,
    nihil
  }
}