local last_spectral_floral = nil

local consuse = set_consumeable_usage
function set_consumeable_usage(card)
  consuse(card)
  if card.config.center.set == "Spectral" or card.config.center.set == "Floral" and card.config.center.key ~= "c_hlucn_maternity" then
    last_spectral_floral = card.config.center.key
  end
end

local startrun = Game.start_run
function Game:start_run(args)
  startrun(self, args)
  last_spectral_floral = nil
end

function mhallu.MaternityGetLast()
  return last_spectral_floral
end

local makecard = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  if _type == "Planet" and next(SMODS.find_card("j_hlucn_cosmos", false)) then
    forced_key = "c_black_hole"
  end
  if not _type == "Joker" and forced_key and G.P_CENTERS[forced_key].set == "Planet" and next(SMODS.find_card("j_hlucn_cosmos", false)) then
    forced_key = "c_black_hole"
  end
  local card = makecard(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  return card
end

return{
  items = {}
}