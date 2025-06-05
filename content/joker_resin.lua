local oxresin = { -- Ox Resin: Earns $2 if played hand is most played poker hand
  object_type = "Joker",
  name = "hlucn_oxresin",
  key = "oxresin",
  config = {extra = {cash = 2}},
  atlas = "resinatlas",
  pos = {x = 0, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.cash}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      local togive = true
      local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
      for i, j in pairs(G.GAME.hands) do
        if i ~= context.scoring_name and j.played > play_more_than and j.visible then
          togive = false
        end
      end
      if togive then
        ease_dollars(card.ability.extra.cash)
        return{message = "$" .. card.ability.extra.cash, colour = G.C.GOLD}
      end
    end
  end
}
local houseresin = { -- House Resin: X3 Mult on first hand if no discards have been used
  object_type = "Joker",
  name = "hlucn_houseresin",
  key = "houseresin",
  config = {extra = {multval = 3}},
  atlas = "resinatlas",
  pos = {x = 1, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
        return {xmult = card.ability.extra.multval}
      end
    end
  end
}
local clubresin = { -- Club Resin: Played Club cards become Mult cards
  object_type = "Joker",
  name = "hlucn_clubresin",
  key = "clubresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 2, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_mult
    return {}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if mhallu.get_suit(c, nil) == "Clubs" and not c.debuff then
          targets[#targets+1] = c
          c:set_ability(G.P_CENTERS.m_mult, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_enhance"), colour = G.C.SUITS.Clubs}
      end
    end
  end
}
local fishresin = { -- Fish Resin: Gains X0.3 mult for every hand played this round
  object_type = "Joker",
  name = "hlucn_fishresin",
  key = "fishresin",
  config = {extra = {multcurr = 1, multscale = 0.3}},
  atlas = "resinatlas",
  pos = {x = 3, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multcurr, card.ability.extra.multscale}}
  end,
  calculate = function(self, card, context)
    if context.after and not context.blueprint then
      card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
      return{message = localize("hlucn_msg_upgrade"), colour = G.C.RED}
    end
    if context.joker_main then
      if card.ability.extra.multcurr > 1 then
        return{xmult = card.ability.extra.multcurr}
      end
    end
    if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
      card.ability.extra.multcurr = 1
      return{message = localize("hlucn_msg_reset"), colour = G.C.RED}
    end
  end
}
local windowresin = { -- Window Resin: Played Diamond cards become Gold cards
  object_type = "Joker",
  name = "hlucn_windowresin",
  key = "windowresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 4, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_gold
    return {}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if mhallu.get_suit(c, nil) == "Diamonds" and not c.debuff then
          targets[#targets+1] = c
          c:set_ability(G.P_CENTERS.m_gold, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_enhance"), colour = G.C.SUITS.Diamonds}
      end
    end
  end
}
local hookresin = { -- Hook Resin: +1 Chips for each card discarded
  object_type = "Joker",
  name = "hlucn_hookresin",
  key = "hookresin",
  config = {extra = {chipcurr = 0, chipscale = 1}},
  atlas = "resinatlas",
  pos = {x = 5, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.chipcurr, card.ability.extra.chipscale}}
  end,
  calculate = function(self, card, context)
    if context.discard and not context.blueprint then
      card.ability.extra.chipcurr = card.ability.extra.chipcurr + card.ability.extra.chipscale
      return{message = "+" .. card.ability.extra.chipcurr, colour = G.C.BLUE}
    end
    if context.joker_main then
      if card.ability.extra.chipcurr > 0 then
        return{chips = card.ability.extra.chipcurr}
      end
    end
  end
}
local manacleresin = { -- Manacle Resin: +4 Mult for each card held in hand
  object_type = "Joker",
  name = "hlucn_manacleresin",
  key = "manacleresin",
  config = {extra = {multval = 4}},
  atlas = "resinatlas",
  pos = {x = 6, y = 0},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.hand and context.other_card and not context.end_of_round then
      if context.other_card.debuff then
        return{message = localize("hlucn_msg_debuffed"), colour = G.C.RED}
      else
        return{mult = card.ability.extra.multval}
      end
    end
  end
}
local wallresin = { -- Wall Resin: X2.5 Mult
  object_type = "Joker",
  name = "hlucn_wallresin",
  key = "wallresin",
  config = {extra = {xmultval = 2.5}},
  atlas = "resinatlas",
  pos = {x = 0, y = 1},
  rarity  = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.xmultval}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return{xmult = card.ability.extra.xmultval}
    end
  end
}
local wheelresin = { -- Wheel Resin: 1 in 3 chance for +2 hand size
  object_type = "Joker",
  name = "hlucn_wheelresin",
  key = "wheelresin",
  config = {extra = {odds = 3, handsize = 2, active = false}},
  atlas = "resinatlas",
  pos = {x = 1, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.handsize}}
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      if pseudorandom("wheelresin") < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.hand:change_size(card.ability.extra.handsize)
        card.ability.extra.active = true
        return{message = localize("hlucn_msg_success"), colour = G.C.GREEN}
      end
    end
    if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.active then
      card.ability.extra.active = false
      G.hand:change_size(-card.ability.extra.handsize)
    end
    if context.selling_self and card.ability.extra.active then
      card.ability.extra.active = false
      G.hand:change_size(-card.ability.extra.handsize)
    end
  end
}
local armresin = { -- Arm Resin: Creates Planet card of last played poker hand
  object_type = "Joker",
  name = "hlun_armresin",
  key = "armresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 2, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  calculate = function(self, card, context)
    if context.end_of_round and context.cardarea == G.jokers and G.consumeables.config.card_limit > #G.consumeables.cards then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
            if G.GAME.last_hand_played then
                local planet = 0
                for _, i in pairs(G.P_CENTER_POOLS.Planet) do
                    if i.config.hand_type == G.GAME.last_hand_played then
                        planet = i.key
                    end
                end
                local newcard = create_card("Planet", G.consumeables, nil, nil, false, false, planet, nil)
                newcard:add_to_deck()
                G.consumeables:emplace(newcard)
            end
          return true
      end)}))
      return{message = localize("hlucn_msg_alert"), colour = G.C.BLUE}
    end
  end
}
local psychicresin = { -- Psychic Resin: X0.1 Mult per consecutive hand played with 5 cards
  object_type = "Joker",
  name = "hlucn_psychicresin",
  key = "psychicresin",
  config = {extra = {multcurr = 1, multscale = 0.1}},
  atlas = "resinatlas",
  pos = {x = 3, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multcurr, card.ability.extra.multscale}}
  end,
  calculate = function(self, card, context)
    if context.before then
      if #context.full_hand == 5 then
        card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.RED}
      else
        card.ability.extra.multcurr = 1
        return{message = localize("hlucn_msg_reset"), colour = G.C.RED}
      end
    end
    if context.joker_main and card.ability.extra.multcurr > 1 then
      return{xmult = card.ability.extra.multcurr}
    end
  end
}
local goadresin = { -- Goad Resin: Played Spade cards become Bonus cards
  object_type = "Joker",
  name = "hlucn_goadresin",
  key = "goadresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 4, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
    return {}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if mhallu.get_suit(c, nil) == "Spades" and not c.debuff then
          targets[#targets+1] = c
          c:set_ability(G.P_CENTERS.m_bonus, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_enhance"), colour = G.C.SUITS.Spades}
      end
    end
  end
}
local waterresin = { -- Water Resin: +115 Chips at 0 discards
  object_type = "Joker",
  name = "hlucn_waterresin",
  key = "waterresin",
  config = {extra = {chipsval = 115}},
  atlas = "resinatlas",
  pos = {x = 5, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.chipsval}}
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.discards_left == 0 then
      return{chips = card.ability.extra.chipsval}
    end
  end
}
local serpentresin = { -- Draw +1 card after hand played or discard
  object_type = "Joker",
  name = "hlucn_serpentresin",
  key = "serpentresin",
  config = {extra = {draws = 1, active = false}},
  atlas = "resinatlas",
  pos = {x = 6, y = 1},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.draws}}
  end,
  calculate = function(self, card, context)
    if context.discard or context.joker_main and not context.blueprint then
      card.ability.extra.active = true
      return{}
    end
    if context.hand_drawn and card.ability.extra.active then
      card.ability.extra.active = false
      G.FUNCS.draw_from_deck_to_hand(card.ability.extra.draws)
      return{}
    end
  end
}
local pillarresin = { -- Pillar Resin: Scored cards get +1 Mult permanently
  object_type = "Joker",
  name = "hlucn_pillarresin",
  key = "pillarresin",
  config = {extra = {multval = 1}},
  atlas = "resinatlas",
  pos = {x = 0, y = 2},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval}}
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if not context.other_card.debuff then
        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.multval
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.RED}
      end
    end
  end
}
local eyeresin = { -- Eye Resin: +25 Mult if hand played is not last hand played
  object_type = "Joker",
  name = "hlucn_eyeresin",
  key = "eyeresin",
  config = {extra = {multval = 25, lastplayed = "None"}},
  atlas = "resinatlas",
  pos = {x = 1, y = 2},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval, card.ability.extra.lastplayed}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if context.scoring_name ~= card.ability.extra.lastplayed then
        card.ability.extra.lastplayed = context.scoring_name
        return{mult = card.ability.extra.multval}
      end
    end
  end
}
local mouthresin = { -- Mouth Resin: X0.1 if hand is the same as last hand played
  object_type = "Joker",
  name = "hlucn_mouthresin",
  key = "mouthresin",
  config = {extra = {multcurr = 1, multscale = 0.1, lastplayed = "None"}},
  atlas = "resinatlas",
  pos = {x = 2, y = 2},
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multcurr, card.ability.extra.multscale, card.ability.extra.lastplayed}}
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      if context.scoring_name == card.ability.extra.lastplayed or lastplayed == "None" then
        card.ability.extra.lastplayed = context.scoring_name
        card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.RED}
      else
        card.ability.extra.lastplayed = context.scoring_name
        card.ability.extra.multcurr = 1
        return{message = localize("hlucn_msg_reset"), colour = G.C.RED}
      end
    end
    if context.joker_main then
      if card.ability.extra.multcurr > 1 then
        return{xmult = card.ability.extra.multcurr}
      end
    end
  end
}
local plantresin = { -- Plant Resin: +6 Chips for each scored face card
  object_type = "Joker",
  name = "hlucn_plantresin",
  key = "plantresin",
  config = {extra = {chipcurr = 0, chipscale = 6}},
  atlas = "resinatlas",
  pos = {x = 3, y = 2},
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.chipcurr, card.ability.extra.chipscale}}
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local increase = 0
      for i = 1, #context.scoring_hand do
        if context.scoring_hand[i]:is_face() and not context.scoring_hand[i].debuff then
          increase = increase + card.ability.extra.chipscale
        end
      end
      if increase > 0 then
        card.ability.extra.chipcurr = card.ability.extra.chipcurr + increase
        return{message = localize("hlucn_msg_upgrade"), colour = G.C.BLUE}
      end
    end
    if context.joker_main then
      if card.ability.extra.chipcurr > 0 then
        return{chips = card.ability.extra.chipcurr}
      end
    end
  end
}
local needleresin = { -- Needle Resin: $9 if blind is defeated in 1 hand
  object_type = "Joker",
  name = "hlucn_needleresin",
  key = "needleresin",
  config = {extra = {income = 9, active = false}},
  atlas = "resinatlas",
  pos = {x = 4, y = 2},
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.income}}
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint then
      if G.GAME.current_round.hands_played == 1 then
        card.ability.extra.active = true
      end
    end
    if context.setting_blind and not context.blueprint then
      card.ability.extra.active = false
    end
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.active then
      return card.ability.extra.income
    end
  end
}
local headresin = { -- Goad Resin: Played Heart cards become Glass cards
  object_type = "Joker",
  name = "hlucn_headresin",
  key = "headresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 5, y = 2},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_glass
    return {}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if mhallu.get_suit(c, nil) == "Hearts" and not c.debuff then
          targets[#targets+1] = c
          c:set_ability(G.P_CENTERS.m_glass, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_enhance"), colour = G.C.SUITS.Hearts}
      end
    end
  end
}
local toothresin = { -- Tooth Resin: Earn $2 each hand
  object_type = "Joker",
  name = "hlucn_toothresin",
  key = "toothresin",
  config = {extra = {income = 2}},
  atlas = "resinatlas",
  pos = {x = 6, y = 2},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.income}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      ease_dollars(card.ability.extra.income)
      return{message = "$" .. card.ability.extra.income, colour = G.C.GOLD}
    end
  end
}
local faceresin = { -- Face Resin: Retrigger all face cards
  object_type = "Joker",
  name = "hlucn_faceresin",
  key = "faceresin",
  config = {extra = {triggers = 1}},
  atlas = "resinatlas",
  pos = {x = 0, y = 3},
  rarity = "hlucn_resin",
  cost = 8,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.triggers}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition then
      if context.other_card:is_face() and not context.other_card.debuff then
        return{message = localize("hlucn_msg_repeat"), colour = HEX("3B1F28"), repetitions = card.ability.extra.triggers}
      end
    end
  end
}
local flintresin = { -- Flint Resin: Balances Chips and Mult before scoring
  object_type = "Joker",
  name = "hlucn_flintresin",
  key = "flintresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 1, y = 3},
  rarity = "hlucn_resin",
  cost = 8,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {colours = {HEX("CC73D9")}}}
  end,
  calculate = function(self, card, context)
    if context.hlucn_initial_step and not context.blueprint then
      local balanced = mhallu.balance_score(hand_chips, mult)
      G.E_MANAGER:add_event(Event({
        trigger = "before",
        func = function()
          play_sound("gong", 0.94, 0.3)
          play_sound("gong", 0.94 * 1.5, 0.2)
          play_sound("tarot1", 1.5)
          return true
        end
      }))
      return {chips = balanced[1], mult = balanced[2], remove_default_message = true, message = localize("hlucn_msg_balanced"), colour = HEX("CC73D9")}
    end
  end
}
local crimsonheartresin = { -- Crimson Heart Resin: Cards can't be debuffed
  object_type = "Joker",
  name = "hlucn_crimsonheartresin",
  key = "crimsonheartresin",
  config = {},
  atlas = "resinatlas",
  pos = {x = 2, y = 3},
  rarity = "hlucn_resin",
  cost = 16,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  update = function(self, card, dt)
    if G.jokers then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].debuff then
          G.jokers.cards[i].debuff = false
        end
      end
    end
    if G.hand then
      for i = 1, #G.hand.cards do
        if G.hand.cards[i].debuff then
          G.hand.cards[i].debuff = false
        end
      end
    end
    if G.deck then
      for i = 1, #G.deck.cards do
        if G.deck.cards[i].debuff then
          G.deck.cards[i].debuff = false
        end
      end
    end
    if G.consumeables then
      for i = 1, #G.consumeables.cards do
        if G.consumeables.cards[i].debuff then
          G.consumeables.cards[i].debuff = false
        end
      end
    end
  end
}
local ceruleanbellresin = { -- Cerulean Bell Resin: +1 Selection Limit
  object_type = "Joker",
  name = "hlucn_ceruleanbellresin",
  key = "ceruleanbellresin",
  config = {extra = {limit = 1}},
  atlas = "resinatlas",
  pos = {x = 3, y = 3},
  rarity = "hlucn_resin",
  cost = 16,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.limit}}
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.limit
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.limit
  end
}
local amberacornresin = { -- Amber Acorn Resin: Face down cards give X1.15 Mult in hand. Flips cards in hand when hand is played
  object_type = "Joker",
  name = "hlucn_amberacornresin",
  key = "amberacornresin",
  config = {extra = {multval = 1.15}},
  atlas = "resinatlas",
  pos = {x = 4, y = 3},
  rarity = "hlucn_resin",
  cost = 16,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval}}
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      for i = 1, #G.hand.cards do
        G.hand.cards[i]:flip()
      end
    end
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card.facing == "back" then
        return{xmult = card.ability.extra.multval}
      end
    end
  end
}
local verdantleafresin = { -- Verdant Leaf Resin: +1 Joker Slot. Gains X0.1 Mult when a card is sold
  object_type = "Joker",
  name = "hlucn_verdantleafresin",
  key = "verdantleafresin",
  config = {extra = {multcurr = 1, multscale = 0.1, slots = 1}},
  atlas = "resinatlas",
  pos = {x = 5, y = 3},
  rarity = "hlucn_resin",
  cost = 16,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multcurr, card.ability.extra.multscale, card.ability.extra.slots}}
  end,
  add_to_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
  end,
  calculate = function(self, card, context)
    if context.selling_card and not context.blueprint then
      card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
      return{message = "X" .. card.ability.extra.multcurr, colour = G.C.RED}
    end
    if context.joker_main then
      return{xmult = card.ability.extra.multcurr}
    end
  end
}
local violetvesselresin = { -- Violet Vessel Resin:  All jokers give X1.5 Mult
  object_type = "Joker",
  name = "hlucn_violetvesselresin",
  key = "violetvesselresin",
  config = {extra = {multval = 1.5}},
  atlas = "resinatlas",
  pos = {x = 6, y = 3},
  rarity = "hlucn_resin",
  cost = 16,
  blueprint_compat = true,
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multval}}
  end,
  calculate = function(self, card, context)
    if context.joker_main or context.other_joker then
      return{xmult = card.ability.extra.multval}
    end
  end
}
return{
  items = {
    oxresin,
    houseresin,
    clubresin,
    fishresin,
    windowresin,
    hookresin,
    manacleresin,
    wallresin,
    wheelresin,
    armresin,
    psychicresin,
    goadresin,
    waterresin,
    serpentresin,
    pillarresin,
    eyeresin,
    mouthresin,
    plantresin,
    needleresin,
    headresin,
    toothresin,
    faceresin,
    flintresin,
    crimsonheartresin,
    ceruleanbellresin,
    amberacornresin,
    verdantleafresin,
    violetvesselresin
  }
}