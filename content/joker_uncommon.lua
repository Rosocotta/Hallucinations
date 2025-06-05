local mach5 = { -- Mach 5: Played 5s become Steel cards when scored
  object_type = "Joker",
  name = "hlucn_mach5",
  key = "mach5",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 1, y = 0},
  rarity = 2,
  cost = 7,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_steel
    return {}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.before and not context.blueprint then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 5 and not c.debuff then
          targets[#targets+1] = c
          c:set_ability(G.P_CENTERS.m_steel, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_nyoom"), colour = G.C.INACTIVE}
      end
    end
  end
}
local bowlingball = { -- Bowling Ball: Gain $1 when hand played. Increases income by $1 when hand played (max $4). Resets when discard is used.
  object_type = "Joker",
  name = "hlucn_bowlingball",
  key = "bowlingball",
  config = {extra = {income = 1, max = 4}},
  atlas = "jokeratlas",
  pos = {x = 3, y = 0},
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.income, card.ability.extra.max}}
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      ease_dollars(card.ability.extra.income)
      if card.ability.extra.income < card.ability.extra.max then
        card.ability.extra.income = card.ability.extra.income + 1
      end
      return{message = "$" .. card.ability.extra.income - 1, colour = G.C.GOLD}
    end
    if context.pre_discard then
      card.ability.extra.income = 1
      return{message = localize("hlucn_msg_reset"), colour = G.C.GOLD}
    end
  end
}
local moonshine = { -- Moonshine: Adds negative to held consumables when sold
  object_type = "Joker",
  name = "hlucn_moonshine",
  key = "moonshine",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 4, y = 0},
  rarity = 2,
  cost = 6,
  eternal_compat = false,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  calculate = function(self, card, context)
    if context.selling_self then
      for _, c in ipairs(G.consumeables.cards) do
        c:set_edition("e_negative", false, false)
      end
    end
  end
}
local feeltheburn = { -- FEEL THE BURN: Gains +9 Mult when a card is destroyed
  object_type = "Joker",
  name = "hlucn_feeltheburn",
  key = "feeltheburn",
  config = {extra = {multscale = 9, multcurr = 0}},
  atlas = "jokeratlas",
  pos = {x = 5, y = 0},
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.multscale, card.ability.extra.multcurr}}
  end,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
      card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale*#context.removed
      return{message = localize("hlucn_msg_upgrade"), colour = G.C.MULT}
    end
    if context.joker_main then
      return{mult = card.ability.extra.multcurr}
    end
  end
}
local brickwall = { -- Brick Wall Joker: Stone cards held in hand gain x1.2 Mult
  object_type = "Joker",
  name = "hlucn_brickwall",
  key = "brickwall",
  config = {extra = {xmult = 1.2}},
  atlas = "jokeratlas",
  pos = {x = 8, y = 0},
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    return {vars = {card.ability.extra.xmult}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.hand and context.other_card and not context.end_of_round then
      if context.other_card.ability.name == "Stone Card" then
        if context.other_card.debuff then
          return{message = localize("hlucn_msg_debuffed"), colour = G.C.RED}
        else
          return{xmult = card.ability.extra.xmult}
        end
      end
    end
  end
}
local radioactivedice = { -- Radioactive Dice: Irridated cards always give +15 when hands remaining is even, but always give +0 when hands remaining is odd.
  object_type = "Joker",
  name = "hlucn_radioactivedice",
  key = "radioactivedice",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 1, y = 1},
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_hlucn_irridated
    return{}
  end
}
local sunflower = { -- Sunflower: Gains x0.4 Mult when Floral card is used
  object_type = "Joker",
  name = "hlucn_sunflower",
  key = "sunflower",
  config = {extra = {multscale = 0.4, multcurr = 1}},
  atlas = "jokeratlas",
  pos = {x = 2, y = 1},
  rarity = 2,
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.multscale, card.ability.extra.multcurr, colours = {HEX("D1C170")}}}
  end,
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint then
      if context.consumeable.ability.set == "Floral" then
        card.ability.extra.multcurr = card.ability.extra.multcurr + card.ability.extra.multscale
        return{message = "X" .. card.ability.extra.multcurr, colour = G.C.RED}
      end
    end
    if context.joker_main then
      return{xmult = card.ability.extra.multcurr}
    end
  end
}
local floraljoker = { -- Floral Joker: Prosperous Packs are more common
  object_type = "Joker",
  name = "hlucn_floraljoker",
  key = "floraljoker",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 4, y = 1},
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {colours = {HEX("D1C170")}}}
  end
}
local miasmajoker = { -- Miasma Joker: Destroys a random playing card in hand
  object_type = "Joker",
  name = "hlucn_miasmajoker",
  key = "miasmajoker",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 8, y = 1},
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  calculate = function(self, card, context)
    if context.joker_main and #G.hand.cards > 0 then
      local target = pseudorandom_element(G.hand.cards, pseudoseed("hlucn_miasmajoker"))
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.1,
        func = function()
          if mhallu.get_upgrade(target, "E") == "Glass Card" then
            SMODS.calculate_context({card_destroyed = true, glass_shattered = {target}})
            target:shatter()
          else
            SMODS.calculate_context({remove_playing_cards = true, removed = {target}})
            target:start_dissolve(nil, false)
          end
          return true
        end
      }))
      return {message = localize("hlucn_msg_destroy_2"), colour = G.C.RED}
    end
  end
}
local visualnoise = { -- Visual Noise: Randomizes card enhancements
  object_type = "Joker",
  name = "hlucn_visualnoise",
  key = "visualnoise",
  config = {},
  atlas = "jokeratlas",
  pos = {x = 2, y = 2},
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  calculate = function(card, self, context)
    if context.before then
      local targets = {}
      for i, c in ipairs(context.scoring_hand) do
        if not c.debuff then
          targets[#targets+1] = c
          local enhance = SMODS.poll_enhancement({key = 'hlucn_visualnoise', guaranteed = true})
          c:set_ability(enhance, nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              c:juice_up()
              return true
            end
          }))
        end
      end
      if #targets > 0 then
        return{message = localize("hlucn_msg_enhance"), colour = HEX("FF00FF")}
      end
    end
  end
}
local garnetjoker = { -- Garnet Joker: Retriggers Mult and Bonus cards if hand contains both
  object_type = "Joker",
  name = "hlucn_garnetjoker",
  key = "garnetjoker",
  config = {extra = {triggers = 1, active = false}},
  atlas = "jokeratlas",
  pos = {x = 3, y = 2},
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  unlocked = true,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue+1] = G.P_CENTERS.m_mult
    return {}
  end,
  calculate = function(self, card, context)
    if context.before then
      local isbonus = false
      local ismult = false
      for i = 1, #context.scoring_hand do
        if mhallu.get_upgrade(context.scoring_hand[i], "E") == G.P_CENTERS.m_bonus then
          isbonus = true
        end
      end
      for i = 1, #context.scoring_hand do
        if mhallu.get_upgrade(context.scoring_hand[i], "E") == G.P_CENTERS.m_mult then
          ismult = true
        end
      end
      if isbonus and ismult then
        card.ability.extra.active = true
      end
    end
    if context.cardarea == G.play and context.repetition then
      if card.ability.extra.active then
        if mhallu.get_upgrade(context.other_card, "E") == G.P_CENTERS.m_mult or mhallu.get_upgrade(context.other_card, "E") == G.P_CENTERS.m_bonus then
          return{message = localize("hlucn_msg_repeat"), colour = HEX("841335"), repetitions = card.ability.extra.triggers}
        end
      end
    end
    if context.end_of_round then
      card.ability.extra.active = false
    end
  end
}
return{
  items = {
    mach5,
    bowlingball,
    moonshine,
    feeltheburn,
    brickwall,
    radioactivedice,
    sunflower,
    floraljoker,
    miasmajoker,
    visualnoise,
    garnetjoker
  }
}