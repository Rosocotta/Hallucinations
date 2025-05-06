function mhallu.infoToInst(input, kind) --Converts various info into another form used by the game
  if kind == "R" or kind == "RL" then
    if type(input) == type("a") then
      if input == "2" then return 2
      elseif input == "3" then return 3
      elseif input == "4" then return 4
      elseif input == "5" then return 5
      elseif input == "6" then return 6
      elseif input == "7" then return 7
      elseif input == "8" then return 8
      elseif input == "9" then return 9
      elseif input == "10" then return 10
      elseif input == "11" or input == "J" or input == "Jack" then return 11
      elseif input == "12" or input == "Q" or input == "Queen" then return 12
      elseif input == "13" or input == "K" or input == "King" then return 13
      elseif input == "14" or input == "A" or input == "Ace" then return 14
      else return input
      end
    else
      if kind == "RL" then
        if input < 10 then return tostring(input)
        elseif input == 10 then return "T"
        elseif input == 11 then return "J"
        elseif input == 12 then return "Q"
        elseif input == 13 then return "K"
        elseif input == 14 then return "A"
        else return input
        end
      else
        if input < 11 then return tostring(input)
        elseif input == 11 then return "Jack"
        elseif input == 12 then return "Queen"
        elseif input == 13 then return "King"
        elseif input == 14 then return "Ace"
        else return input
        end
      end
    end
  end
  if kind == "E" then
    if type(input) == type("a") then
      if input == "Bonus Card" then return G.P_CENTERS.m_bonus
      elseif input == "Mult Card" then return G.P_CENTERS.m_mult
      elseif input == "Stone Card" then return G.P_CENTERS.m_stone
      elseif input == "Gold Card" then return G.P_CENTERS.m_gold
      elseif input == "Steel Card" then return G.P_CENTERS.m_steel
      elseif input == "Glass Card" then return G.P_CENTERS.m_glass
      elseif input == "Lucky Card" then return G.P_CENTERS.m_lucky
      elseif input == "Wild Card" then return G.P_CENTERS.m_wild
      elseif input == "Inscribed Card" then return G.P_CENTERS.m_hlucn_inscribed
      elseif input == "Irridated Card" then return G.P_CENTERS.m_hlucn_irridated
      else return input
      end
    else
      if input == G.P_CENTERS.m_bonus then return "Bonus Card"
      elseif input == G.P_CENTERS.m_mult then return "Mult Card"
      elseif input == G.P_CENTERS.m_stone then return "Stone Card"
      elseif input == G.P_CENTERS.m_gold then return "Gold Card"
      elseif input == G.P_CENTERS.m_steel then return "Steel Card"
      elseif input == G.P_CENTERS.m_glass then return "Glass Card"
      elseif input == G.P_CENTERS.m_lucky then return "Lucky Card"
      elseif input == G.P_CENTERS.m_wild then return "Wild Card"
      elseif input == G.P_CENTERS.m_hlucn_inscribed then return "Inscribed Card"
      elseif input == G.P_CENTERS.m_hlucn_irridated then return "Irridated Card"
      else return input
      end
    end
  end
  if kind == "D" then
    if type(input) == type("a") then
      if input == "holo" then return G.P_CENTERS.e_holo
      elseif input == "foil" then return G.P_CENTERS.e_foil
      elseif input == "polychrome" then return G.P_CENTERS.e_polychrome
      elseif input == "negative" then return G.P_CENTERS.e_negative
      else return input
      end
    else
      if input == G.P_CENTERS.e_holo then return "holo"
      elseif input == G.P_CENTERS.e_foil then return "foil"
      elseif input == G.P_CENTERS.e_polychrome then return "polychrome"
      elseif input == G.P_CENTERS.e_negative then return "negative"
      else return input
      end
    end
  end
end

function mhallu.get_suit(card, ver) --Returns the suit of a playing card
  if ver == "L" then
    if card:is_suit("Hearts") or card:is_suit("H") then return "H"
    elseif card:is_suit("Spades") or card:is_suit("S") then return "S"
    elseif card:is_suit("Diamonds") or card:is_suit("D") then return "D"
    elseif card:is_suit("Clubs") or card:is_suit("C") then return "C"
    else return input
    end
  else
    if card:is_suit("Hearts") or card:is_suit("H") then return "Hearts"
    elseif card:is_suit("Spades") or card:is_suit("S") then return "Spades"
    elseif card:is_suit("Diamonds") or card:is_suit("D") then return "Diamonds"
    elseif card:is_suit("Clubs") or card:is_suit("C") then return "Clubs"
    else return input
    end
  end
end

function mhallu.get_upgrade(card, upgrade) --Returns what upgrade a playing card has as a string
  if upgrade == "E" or "Enhancement" then return mhallu.infoToInst(card.ability.effect, "E") end
  if upgrade == "D" or "Edition" then return mhallu.infoToInst(card.edition.type, "D") end
  if upgrade == "G" or "Seal" then return card:get_seal() end
end

function mhallu.change_base(card, suit, rank) --Custom change_base that uses the custom functions
  local loc_ran = card:get_id()
  local loc_sui = mhallu.get_suit(card, "L")
  if rank then loc_ran = rank end
  if suit then loc_sui = suit end

  if rank and type(loc_ran) ~= type("a") then loc_ran = mhallu.infoToInst(loc_ran, "RL") end
  card:set_base(G.P_CARDS[loc_sui .. "_" .. loc_ran])
  return card
end

function mhallu.temp_debuff(card) --Debuffs cards until end of round
  card:set_debuff(true)
  while card.debuffed == true do
    if G.STATES.NEW_ROUND then
      card:set_debuff(false)
    end
  end
end

return{
  name = "funcs",
  items = {}
}