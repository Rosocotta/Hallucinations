local irridated = {
  object_type = "Enhancement",
  key = "irridated",
  atlas = "cardatlas",
  pos = {x = 1, y = 0},
  config = {extra = {minmult = 0, maxmult = 15}},
  replace_base_card = true,
  no_rank = true,
  no_suit = true,
  always_scores = true,
  loc_vars = function(self, info_queue, card)
    return{vars = {card.ability.extra.minmult, card.ability.extra.maxmult}}
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      if next(SMODS.find_card("j_hlucn_radioactivedice", false)) then
        if G.GAME.current_round.hands_left % 2 == 0 then
          return{mult = 15}
        else
          return{message = localize("hlucn_msg_nothing"), colour = G.C.INACTIVE}
        end
      else
        local togive = pseudorandom("hlucn_irridated", card.ability.extra.minmult, card.ability.extra.maxmult)
        if togive == 0 then
          return{message = localize("hlucn_msg_nothing"), colour = G.C.INACTIVE}
        else
          return{mult = togive}
        end
      end
    end
  end
}
local scarab = {
  object_type = "Consumable",
  key = "scarab",
  set = "Tarot",
  atlas = "consumeatlas",
  pos = {x = 0, y = 0},
  config = {extra = {selections = 1}},
  cost = 3,
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_hlucn_irridated
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
        target:set_ability(G.P_CENTERS.m_hlucn_irridated, nil, true)
        target:flip()
        return true
      end
    }))
    G.hand:unhighlight_all()
  end
}
local bagel = { -- :3
  object_type = "Consumable",
  key = "bagel",
  set = "Tarot",
  atlas = "consumeatlas",
  pos = {x = 1, y = 0},
  config = {},
  no_collection = true,
  hidden = true,
  soul_rate = 0,
  loc_vars = function(self, info_queue, card)
    return{}
  end,
  can_use = function(self, card)
    return true
  end,
  use = function(self, card, area, copier)
    play_sound("win")
  end
}
local turqoise = {
  object_type = "Seal",
  key = "turqoise",
  atlas = "cardatlas",
  pos = {x = 2, y = 0},
  config = {},
  badge_colour = HEX("6DDDB6"),
  loc_vars = function(self, info_queue, card)
    return{}
  end,
  calculate = function(self, card, context)
    if context.after and context.cardarea == G.play and G.GAME.blind.triggered then
      G.E_MANAGER:add_event(Event({
        func = function()
          if G.consumeables.config.card_limit > #G.consumeables.cards then
            play_sound("timpani")
            local new = create_card("Spectral", G.consumeables, nil, nil, false, false, nil, "hlucn_sleepparalysis")
            new:add_to_deck()
            G.consumeables:emplace(new)
            card:start_dissolve(false, false)
          end
          return true
        end
      }))
    end
  end
}
local esper = {
  object_type = "Consumable",
  key = "esper",
  set = "Spectral",
  atlas = "consumeatlas",
  pos = {x = 2, y = 0},
  config = {extra = {selections = 1}},
  discovered = false,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = {set = "Other", key = "hlucn_turqoise_seal"}
    return {vars = {self.config.extra.selections, colours = {HEX("6DDDB6")}}}
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
        target:set_seal("hlucn_turqoise")
        target:flip()
        return true
      end
    }))
    G.hand:unhighlight_all()
  end
}

return{
  items = {
    irridated,
    scarab,
    bagel,
    turqoise,
    esper
  }
}