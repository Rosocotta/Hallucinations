local testchall = {
  object_type = "Challenge",
  key = "testchall",
  rules = {
    custom = {},
    modifiers = {
      {id = "discards", value = 99},
      {id = "dollars", value = 999999999999999999}
    }
  },
  restrictions = {
    banned_cards = {},
    banned_other = {}
  },
  jokers = {
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
    {id = "j_joker"},
  },
  consumeables = {
  },
  vouchers = {
    {id = "v_clearance_sale"},
    {id = "v_liquidation"},
    {id = "v_overstock_norm"},
    {id = "v_overstock_plus"},
    {id = "v_retcon"}
  },
  deck = {
    type = "Challenge Deck",
  }
}

return{
  items = {
    --testchall
  }
}