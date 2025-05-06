local florid = {
  object_type = "ConsumableType",
  key = "Floral",
  primary_colour = HEX("267F00"),
  secondary_colour = HEX("D1C170"),
  collection_rows = {5, 4},
  shop_rate = 0.0,
  loc_txt = {
    name = "Floral",
    collection = "Floral Cards",
    undiscovered = {
      name = "Undiscovered",
      text = {""}
    }
  }
}
local pack1 = {
  object_type = "Booster",
  key = "florid_small_1",
  atlas = "boosteratlas",
  pos = {x = 0, y = 0},
  config = {extra = 2, choose = 1},
  cost = 4,
  weight = 0.85,
  draw_hand = true,
  discovered = false,
  get_weight = function(self)
    if next(SMODS.find_card("j_hlucn_floraljoker")) then
      return 1.1
    else
      return 0.85
    end
  end,
  create_card = function(self, card)
    return create_card("Floral", G.pack_cards, nil, nil, true, false, nil, "hlucn_prestige")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("D1C170")}
      }
    }
  end,
  group_key = "k_hlucn_florid_pack"
}
local pack2 = {
  object_type = "Booster",
  key = "florid_small_2",
  atlas = "boosteratlas",
  pos = {x = 1, y = 0},
  config = {extra = 2, choose = 1},
  cost = 4,
  weight = 0.85,
  draw_hand = true,
  discovered = false,
  get_weight = function(self)
    if next(SMODS.find_card("j_hlucn_floraljoker")) then
      return 1.1
    else
      return 0.85
    end
  end,
  create_card = function(self, card)
    return create_card("Floral", G.pack_cards, nil, nil, true, false, nil, "hlucn_prestige")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("D1C170")}
      }
    }
  end,
  group_key = "k_hlucn_florid_pack"
}
local pack3 = {
  object_type = "Booster",
  key = "florid_medium",
  atlas = "boosteratlas",
  pos = {x = 2, y = 0},
  config = {extra = 4, choose = 1},
  cost = 6,
  weight = 0.85,
  draw_hand = true,
  discovered = false,
  get_weight = function(self)
    if next(SMODS.find_card("j_hlucn_floraljoker")) then
      return 1.1
    else
      return 0.85
    end
  end,
  create_card = function(self, card)
    return create_card("Floral", G.pack_cards, nil, nil, true, false, nil, "hlucn_prestige")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("D1C170")}
      }
    }
  end,
  group_key = "k_hlucn_florid_pack"
}
local pack4 = {
  object_type = "Booster",
  key = "florid_large",
  atlas = "boosteratlas",
  pos = {x = 3, y = 0},
  config = {extra = 4, choose = 2},
  cost = 8,
  weight = 0.85,
  draw_hand = true,
  discovered = false,
  get_weight = function(self)
    if next(SMODS.find_card("j_hlucn_floraljoker")) then
      return 1.1
    else
      return 0.85
    end
  end,
  create_card = function(self, card)
    return create_card("Floral", G.pack_cards, nil, nil, true, false, nil, "hlucn_prestige")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("D1C170")}
      }
    }
  end,
  group_key = "k_hlucn_florid_pack"
}
local prestige = {
  object_type = "Consumable",
  key = "prestige",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 0, y = 0},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {self.config.extra.selections}}
  end,
  can_use = function(self, card)
    return #G.hand.highlighted == self.config.extra.selections
  end,
  use = function(self, card, area, copier)
    local target = G.hand.highlighted[1]
    target:flip()
    delay(0.15)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.25,
      func = function()
        play_sound("timpani")
        mhallu.change_base(target, nil, "K")
        target:set_seal(SMODS.poll_seal({guaranteed = true, type_key = "prestige"}), true, false)
        target:flip()
        return true
      end
    }))
    G.hand:unhighlight_all()
  end
}
local famine = {
  object_type = "Consumable",
  key = "famine",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 1, y = 0},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  can_use = function(self, card)
    return #G.hand.cards > 0
  end,
  use = function(self, card, area, copier)
    for _, c in ipairs(G.hand.cards) do
      if c.ability.effect == "Base" then
        c:start_dissolve(nil, c == G.hand.cards[#G.hand.cards])
        SMODS.calculate_context({remove_playing_cards = true, removed = {c}})
      end
    end
  end
}
local capricious = {
  object_type = "Consumable",
  key = "capricious",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 2, y = 0},
  config = {extra = {odds = 2, count = 2}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds, self.config.extra.count}}
  end,
  can_use = function(self, card)
    return G.consumeables.config.card_limit > #G.consumeables.cards
  end,
  use = function(self, card, area, copier)
    if pseudorandom("capricious") < G.GAME.probabilities.normal / self.config.extra.odds then
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          for i=1, math.min(self.config.extra.count, G.consumeables.config.card_limit - #G.consumeables.cards) do
            if G.consumeables.config.card_limit > #G.consumeables.cards then
              if i == 1 then
                play_sound("timpani")
              end
              local new = create_card("Spectral", G.consumeables, nil, nil, false, false, nil, "hlucn_capricious")
              new:add_to_deck()
              G.consumeables:emplace(new)
            end
          end
          return true
        end
      }))
      
    end
  end
}
local inscribed = {
  object_type = "Enhancement",
  key = "inscribed",
  atlas = "cardatlas",
  pos = {x = 0, y = 0},
  config = {extra = {scale = 0.05, current = 1, max = 2}},
  loc_vars = function(self, info_queue, card)
    return {vars = {card and card.ability.extra.scale or self.config.extra.scale, card and card.ability.extra.current or self.config.extra.current, card and card.ability.extra.max or self.config.extra.max}}
  end,
  calculate = function(self, card, context)
    if next(SMODS.find_card("j_hlucn_runictablet")) then
      card.ability.extra.max = 2.75
    else
      card.ability.extra.max = 2
    end
    if card.ability.extra.current > card.ability.extra.max then
      card.ability.extra.current = card.ability.extra.max
    end
    if context.cardarea == G.play and context.main_scoring then
      if card.ability.extra.current == card.ability.extra.max and next(SMODS.find_card("j_hlucn_runictablet")) then
        card.ability.extra.current = 1.5
      elseif card.ability.extra.current < card.ability.extra.max then
        card.ability.extra.current = card.ability.extra.current + card.ability.extra.scale
      end
      if card.ability.extra.current > 1 then
        return {xmult = card.ability.extra.current}
      end
    end
  end
}
local literature = {
  object_type = "Consumable",
  key = "literature",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 3, y = 0},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_hlucn_inscribed
    return {vars = {self.config.extra.selections}}
  end,
  can_use = function(self, card)
    return #G.hand.highlighted == self.config.extra.selections
  end,
  use = function(self, card, area, copier)
    local target = G.hand.highlighted[1]
    target:flip()
    delay(0.15)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.25,
      func = function()
        play_sound("timpani")
        target:set_ability(G.P_CENTERS.m_hlucn_inscribed, nil, true)
        target:flip()
        return true
      end
    }))
    G.hand:unhighlight_all()
  end
}
local alchemy = {
  object_type = "Consumable",
  key = "alchemy",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 0, y = 1},
  config = {extra = {selections = 1, targets = 3}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {self.config.extra.selections, self.config.extra.targets}}
  end,
  can_use = function(self, card)
    return #G.hand.highlighted == self.config.extra.selections and #G.hand.cards > self.config.extra.selections
  end,
  use = function(self, card, area, copier)
    local core = G.hand.highlighted[1]
    local hits = {}
    while #hits < self.config.extra.targets do
      local check = pseudorandom_element(G.hand.cards, pseudoseed("hlucn_alchemy_check"))
      if check ~= core then
        hits[#hits + 1] = check
      end
    end
    local half = core:get_id()
    if half < 4 then
      half = "A"
    else
      half = mhallu.infoToInst(math.floor(half/2), "RL")
    end
    local tosuit = mhallu.get_suit(core, "L")
    for _, c in ipairs(hits) do
      c:flip()
    end
    delay(0.4)
    for _, c in ipairs(hits) do
      mhallu.change_base(c, tosuit, half)
      c:flip()
    end
    G.hand:unhighlight_all()
  end
}
local dissolve = {
  object_type = "Consumable",
  key = "dissolve",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 1, y = 1},
  config = {extra = {count = 2}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {self.config.extra.count, colours = {HEX("D1C170")}}}
  end,
  can_use = function(self, card)
    return #G.jokers.cards > 0 and G.consumeables.config.card_limit > #G.consumeables.cards
  end,
  use = function(self, card, area, copier)
    local target = pseudorandom_element(G.jokers.cards, pseudoseed("hlucn_dissolve_check"))
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        target.T.r = -0.2
        target:juice_up(0.3, 0.4)
        target.states.drag.is = true
        target.children.center.pinch.x = true
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.3,
          func = function()
            G.jokers:remove_card(target)
            target:remove()
            target = nil
            return true
          end
        }))
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.25,
      func = function()
        for i=1, math.min(self.config.extra.count, G.consumeables.config.card_limit - #G.consumeables.cards) do
          if G.consumeables.config.card_limit > #G.consumeables.cards then
            if i == 1 then
              play_sound("timpani")
            end
            local new = create_card("Floral", G.consumeables, nil, nil, false, false, nil, "hlucn_dissolve")
            new:add_to_deck()
            G.consumeables:emplace(new)
          end
        end
        return true
      end
    }))
  end
}
local escalate = {
  object_type = "Consumable",
  key = "escalate",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 2, y = 1},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {}
  end,
  can_use = function(self, card)
    return #G.hand.cards > 0
  end,
  use = function(self, card, area, copier)
    for _, c in ipairs(G.hand.cards) do
      c:flip()
    end
    delay(0.15)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.25,
      func = function()
        for _, c in ipairs(G.hand.cards) do
          local nextrank = c:get_id() + 1
          if nextrank == 15 then nextrank = 2 end
          nextrank = mhallu.infoToInst(nextrank, "RL")
          mhallu.change_base(c, nil, nextrank)
          c:flip()
        end
        play_sound("timpani")
        return true
      end
    }))
  end
}
local maternity = {
  object_type = "Consumable",
  key = "maternity",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 3, y = 1},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    if mhallu.MaternityGetLast() ~= nil then
      info_queue[#info_queue+1] = G.P_CENTERS[mhallu.MaternityGetLast()]
      print(tostring(mhallu.MaternityGetLast()))
    end
    return {vars = {colours = {HEX("D1C170")}}}
  end,
  can_use = function(self, card)
    return mhallu.MaternityGetLast() ~= nil
  end,
  use = function(self, card, area, copier)
    local tomake = mhallu.MaternityGetLast()
    G.E_MANAGER:add_event(Event({
      trigger = "immediate",
      func = function()
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          play_sound("timpani")
          local new = create_card("Spectral_Floral", G.consumeables, nil, nil, false, false, tomake, nil)
          new:add_to_deck()
          G.consumeables:emplace(new)
        end
        return true
      end
    }))
  end
}
local specimen = {
  object_type = "Consumable",
  key = "specimen",
  set = "Floral",
  atlas = "floridatlas",
  pos = {x = 4, y = 0},
  config = {extra = {odds = 5}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return {vars = {(G.GAME.probabilities.normal or 1), self.config.extra.odds, colours = {HEX("FF7FED")}}}
  end,
  can_use = function(self, card)
    return G.jokers.config.card_limit > #G.jokers.cards
  end,
  use = function(self, card, area, copier)
    if pseudorandom("specimen") < G.GAME.probabilities.normal / self.config.extra.odds then
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          if G.jokers.config.card_limit > #G.jokers.cards then
            play_sound("timpani")
            local new = create_card("Joker", G.jokers, nil, "hlucn_pristine", false, false, nil, "hlucn_specimen")
            new:add_to_deck()
            G.jokers:emplace(new)
          end
          return true
        end
      }))
    end
  end
}
return{
  items = {
    florid,
    pack1,
    pack2,
    pack3,
    pack4,
    prestige,
    famine,
    capricious,
    inscribed,
    literature,
    alchemy,
    dissolve,
    escalate,
    maternity,
    specimen
  }
}