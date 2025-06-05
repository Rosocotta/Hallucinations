local lunacy = {
  object_type = "ConsumableType",
  key = "Lunacy",
  default = "c_hlucn_absorb",
  primary_colour = HEX("B66F85"),
  secondary_colour = HEX("733240"),
  collection_rows = {5, 4},
  shop_rate = 0.0,
  loc_txt = {
    name = "Lunacy",
    collection = "Lunacy Cards",
    undiscovered = {
      name = "Undiscovered",
      text = {""}
    }
  }
}
local pack1 = {
  object_type = "Booster",
  key = "lunacy_small_1",
  atlas = "boosteratlas",
  pos = {x = 0, y = 1},
  config = {extra = 9, choose = 1},
  cost = 5,
  weight = 0.6,
  draw_hand = false,
  select_card = "consumeables",
  discovered = false,
  create_card = function(self, card)
    return create_card("Lunacy", G.pack_cards, nil, nil, true, false, nil, "hlucn_lunacy_small_1")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("733240")}
      }
    }
  end,
  group_key = "k_hlucn_lunacy_pack"
}
local pack2 = {
  object_type = "Booster",
  key = "lunacy_small_2",
  atlas = "boosteratlas",
  pos = {x = 1, y = 1},
  config = {extra = 2, choose = 1},
  cost = 5,
  weight = 0.6,
  draw_hand = false,
  select_card = "consumeables",
  discovered = false,
  create_card = function(self, card)
    return create_card("Lunacy", G.pack_cards, nil, nil, true, false, nil, "hlucn_lunacy_small_2")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("733240")}
      }
    }
  end,
  group_key = "k_hlucn_lunacy_pack"
}
local pack3 = {
  object_type = "Booster",
  key = "lunacy_medium",
  atlas = "boosteratlas",
  pos = {x = 2, y = 1},
  config = {extra = 4, choose = 1},
  cost = 7,
  weight = 0.55,
  draw_hand = false,
  select_card = "consumeables",
  discovered = false,
  create_card = function(self, card)
    return create_card("Lunacy", G.pack_cards, nil, nil, true, false, nil, "hlucn_lunacy_medium")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("733240")}
      }
    }
  end,
  group_key = "k_hlucn_lunacy_pack"
}
local pack4 = {
  object_type = "Booster",
  key = "lunacy_large",
  atlas = "boosteratlas",
  pos = {x = 3, y = 1},
  config = {extra = 4, choose = 2},
  cost = 9,
  weight = 0.5,
  draw_hand = false,
  select_card = "consumeables",
  discovered = false,
  create_card = function(self, card)
    return create_card("Lunacy", G.pack_cards, nil, nil, true, false, nil, "hlucn_lunacy_large")
  end,
  loc_vars = function(self, info_queue, card)
    return{
      vars = {
        card and card.ability.choose or self.config.choose,
        card and card.ability.extra or self.config.extra,
        colours = {HEX("733240")}
      }
    }
  end,
  group_key = "k_hlucn_lunacy_pack"
}
local absorb = {
  object_type = "Consumable",
  key = "absorb",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 0, y = 0},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    if G.GAME.blind and mhallu.get_boss_id() ~= "nil" then
      local toinfo = "j_hlucn_" .. mhallu.get_boss_id() .. "resin"
      info_queue[#info_queue+1] = G.P_CENTERS[toinfo]
    end
    return {vars = {colours = {HEX("990000")}}}
  end,
  can_use = function(self, card)
    return G.GAME.blind.boss and mhallu.get_boss_id() ~= "nil" and G.jokers.config.card_limit > #G.jokers.cards
  end,
  use = function(self, card, area, copier)
    local tomake = "j_hlucn_" .. mhallu.get_boss_id() .. "resin"
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.15,
      func = function()
        if G.jokers.config.card_limit > #G.jokers.cards then
          play_sound("timpani")
          local new = create_card("Joker", G.jokers, nil, "hlucn_resin", false, false, tomake, nil)
          new:add_to_deck()
          G.jokers:emplace(new)
        end
        return true
      end
    }))
  end
}
local comprehend = {
  object_type = "Consumable",
  key = "comprehend",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 1, y = 0},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {self.config.extra.selections}}
  end,
  can_use = function(self, card)
    return #G.jokers.highlighted == self.config.extra.selections
  end,
  use = function(self, card, area, copier)
    mhallu.transform_joker(G.jokers.highlighted[1], nil)
  end
}
local conceptualize = {
  object_type = "Consumable",
  key = "conceptualize",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 2, y = 0},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS["j_blueprint"]
    return{}
  end,
  can_use = function(self, card)
    return #G.jokers.cards >= 2 and not G.jokers.cards[1].ability.eternal
  end,
  use = function(self, card, area, copier)
    local leftmost = G.jokers.cards[1]
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        leftmost.T.r = -0.2
        leftmost:juice_up(0.3, 0.4)
        leftmost.states.drag.is = true
        leftmost.children.center.pinch.x = true
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.3,
          func = function()
            G.jokers:remove_card(leftmost)
            leftmost:remove()
            leftmost = nil
            return true
          end
        }))
        return true
      end
    }))
    mhallu.transform_joker(G.jokers.cards[#G.jokers.cards], "j_blueprint")
  end
}
local memorize = {
  object_type = "Consumable",
  key = "memorize",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 3, y = 0},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {self.config.extra.selections}}
  end,
  can_use = function(self, card)
    return #G.hand.highlighted == self.config.extra.selections and G.hand.highlighted[1].edition
  end,
  use = function(self, card, area, copier)
    local target = G.hand.highlighted[1]
    add_tag(Tag("tag_" .. target.edition.type))
    target:start_dissolve(nil, target == G.hand.cards[#G.hand.cards])
    SMODS.calculate_context({remove_playing_cards = true, removed = {target}})
  end
}
local release = {
  object_type = "Consumable",
  key = "release",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 4, y = 0},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{}
  end,
  can_use = function(self, card)
    return G.shop and #G.shop_booster.cards > 0
  end,
  use = function(self, card, area, copier)
    local togive = 0
    for _, target in ipairs(G.shop_booster.cards) do
      togive = togive + target.cost
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
    end
    ease_dollars(math.floor(togive/2))
  end
}
local understand = {
  object_type = "Consumable",
  key = "understand",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 0, y = 1},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{}
  end,
  can_use = function(self, card)
    return G.GAME.blind.boss
  end,
  use = function(self, card, area, copier)
    G.GAME.blind:disable()
  end
}
local unburden = {
  object_type = "Consumable",
  key = "unburden",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 1, y = 1},
  config = {extra = {slots = 1, cost = 8}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {self.config.extra.slots, self.config.extra.cost}}
  end,
  can_use = function(self, card)
    local available = false
    for _, item in ipairs(G.jokers.cards) do
      if not item.ability.eternal then
        available = true
      end
    end
    return #G.jokers.cards > 0 and G.GAME.dollars >= self.config.extra.cost and available
  end,
  use = function(self, card, area, copier)
    local target = nil
    local seen = {}
    while target == nil and #seen < #G.jokers.cards do
      target = pseudorandom_element(G.jokers.cards, pseudoseed("hlucn_dissolve_check"))
      if not seen[target] then table.insert(seen, #seen+1, target) end
      if target.ability.eternal then target = nil end
    end
    if target then
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
      ease_dollars(-self.config.extra.cost)
      G.consumeables.config.card_limit = G.consumeables.config.card_limit + self.config.extra.slots
    end
  end
}
local lament = {
  object_type = "Consumable",
  key = "lament",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 2, y = 1},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.e_foil
    info_queue[#info_queue+1] = {key="eternal",set="Other"}
    return{vars = {self.config.extra.selections}}
  end,
  can_use = function(self, card)
    return #G.jokers.highlighted == self.config.extra.selections
  end,
  use = function(self, card, area, copier)
    local target = G.jokers.highlighted[1]
    target.ability.eternal = true
    target:set_edition("e_foil")
  end
}
local fantasize = {
  object_type = "Consumable",
  key = "fantasize",
  set = "Lunacy",
  atlas = "lunacyatlas",
  pos = {x = 3, y = 1},
  config = {},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    return{vars = {colours = {HEX("98777b")}}}
  end,
  can_use = function(self, card)
    return G.jokers.config.card_limit > #G.jokers.cards
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
          if G.jokers.config.card_limit > #G.jokers.cards then
            play_sound("timpani")
            local new = create_card("MHalluRareJoker", G.jokers, nil, nil, false, false, nil, "hlucn_fantasize")
            new:add_to_deck()
            G.jokers:emplace(new)
          end
          return true
        end
      }))
  end
}


return{
  items = {
    lunacy,
    pack1,
    pack2,
    pack3,
    pack4,
    absorb,
    comprehend,
    conceptualize,
    memorize,
    release,
    understand,
    unburden,
    lament,
    fantasize
  }
}