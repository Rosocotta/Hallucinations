return {
  descriptions = {
    Back = {
      b_hlucn_d20deck = {
        name = "D20 Deck",
        text = {
          "Start the run with a",
          "{C:dark_edition}Negative {T:j_oops,C:attention}Oops! All 6s{}",
          "{C:red}-1{} consumable slot"
        }
      },
      b_hlucn_pristinedeck = {
        name = "Pristine Deck",
        text = {
          "Start the run with",
          "a {C:hlucn_pristine}Pristine{} Joker",
          "{C:red}-2{} hands every round"
        }
      },
      b_hlucn_aluminumdeck = {
        name = "Aluminum Deck",
        text = {
          "Start with extra {C:gold}$16{}",
          "Earn no {C:attention}Interest{}"
        }
      },
      b_hlucn_badecondeck = {
        name = "Failing Economy Deck",
        text = {
          "Go up to {C:red}-$10{} in debt",
          "Lose all money at the",
          "end of the {C:attention}shop{}"
        }
      }
    },
    Joker = {
      -- Pristine Jokers
      j_hlucn_zephyr = {
        name = "Zephyr",
        text = {
          "{C:red}+#1#{} discards",
          "This Joker gains {X:mult,C:white}X#2#{} Mult for",
          "every card discarded this round",
          "{C:inactive}(Currently {X:mult,C:white}X#3# {C:inactive} Mult){}"
        }
      },
      j_hlucn_cosmos = {
        name = "Cosmos",
        text = {
          "All {C:planet}Planet{} cards are {C:spectral}Black Hole{}",
          "When {C:attention}Boss Blind{} is defeated, creates",
          "{C:attention}2 {C:planet}Planet{} cards"
        }
      },
      j_hlucn_argil = {
        name = "Argil",
        text = {
          "{C:chips}+#2#{} Chips for each",
          "{C:attention}Blind{} skipped this run",
          "Once per round, creates a {C:attention}Double Tag{}",
          "when a {C:attention}Joker{} is sold",
          "{C:inactive}(Currently {C:chips}#3# {C:inactive}Chips){}",
          "{C:inactive}({C:attention}Double Tag {C:inactive}#1#){}"
        }
      },
      j_hlucn_deluge = {
        name = "Deluge",
        text = {
          "{C:blue}+#1#{} hand size",
          "Every {C:attention}played card{}",
          "counts in scoring"
        }
      },
      j_hlucn_nihil = {
        name = "Nihil",
        text = {
          "{C:attention}Retriggers{} all played cards",
          "{C:attention}#1#{} times for each",
          "empty {C:attention}Joker{} slot",
          "{C:inactive}(Currently {C:attention}#2# {C:inactive}retriggers){}"
        }
      },
      -- Common Jokers
      j_hlucn_polishedjoker = {
        name = "Polished Joker",
        text = {
          "Played {C:attention}Glass{} cards",
          "give {C:mult}+#1#{} Mult when scored"
        }
      },
      j_hlucn_rendererror = {
        name = "Rendering Error",
        text = {
          "{C:green}#2# in #3#{} chance",
          "to give {C:mult}+#1#{} Mult"
        }
      },
      j_hlucn_arcanist = {
        name = "Arcanist",
        text = {
          "{C:attention}+#1#{} consumable slot"
        }
      },
      j_hlucn_sleepparalysis = {
        name = "Sleep Paralysis Demon",
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "a {C:spectral}Spectral{} card when",
          "any {C:attention}Booster Pack{} is skipped",
          "{C:inactive}(Must have room){}"
        }
      },
      j_hlucn_tinyfrog = {
        name = "Tiny Frog",
        text = {
          "{X:mult,C:white}X#1#{} Mult if hands",
          "remaining is {C:attention}even{}"
        }
      },
      j_hlucn_nonogram = {
        name = "Nonogram",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "if scored hand contains",
          "only number cards",
          "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Chips){}"
        }
      },
      j_hlucn_sudoku = {
        name = "Sudoku",
        text = {
          "This Joker gains {C:mult}+#2#{} Mult",
          "for every {C:attention}consecutive{} hand",
          "played that does not",
          "contain a {C:attention}Pair{}",
          "{C:inactive}(Currently {C:mult}+#1# {C:inactive}Mult){}"
        }
      },
      j_hlucn_recycling = {
        name = "Recycling",
        text = {
          "Earns {C:gold}$#1#{} when",
          "a {C:attention}consumable{} is used"
        }
      },
      j_hlucn_birdhieroglyph = {
        name = "Bird Hieroglyph",
        text = {
          "Earns {C:gold}$#1#{} each hand",
          "{C:gold}$-#2#{} for each card",
          "in played hand"
        }
      },
      j_hlucn_pridefuljoker = {
        name = "Prideful Joker",
        text = {
          "Played {C:attention}Wild{} cards",
          "give {C:mult}+#1#{} Mult when scored"
        }
      },
      -- Uncommon Jokers
      j_hlucn_mach5 = {
        name = "Mach 5",
        text = {
          "Played {C:attention}5s{} become",
          "{C:attention}Steel{} cards when scored"
        }
      },
      j_hlucn_bowlingball = {
        name = "Bowling Ball",
        text = {
          "Gives {C:money}$#1#{} when hand is played",
          "Gives {C:money}$1{} more each subsquent hand",
          "Resets when discard is used",
          "{C:inactive}(Cannot give more than {C:money}$#2#{C:inactive}){}"
        }
      },
      j_hlucn_moonshine = {
        name = "Moonshine",
        text = {
          "Adds {C:dark_edition}Negative{} to",
          "all consumables when sold"
        }
      },
      j_hlucn_feeltheburn = {
        name = "FEEL THE BURN",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult when",
          "a playing card is destroyed",
          "{C:inactive}(Currently {C:mult}+#2# {C:inactive}Mult){}"
        }
      },
      j_hlucn_brickwall = {
        name = "Brick Wall Joker",
        text = {
          "Each {C:attention}Stone{} card",
          "held in hand",
          "gives {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_hlucn_radioactivedice = {
        name = "Radioactive Dice",
        text = {
          "{C:attention}Irridated{} cards always give",
          "{C:mult}+15{} Mult when hands",
          "remaining is even and",
          "{C:mult}+0{} Mult when hands",
          "remaining is odd"
        }
      },
      j_hlucn_sunflower = {
        name = "Sunflower",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "when a {V:1}Floral{} card is used",
          "{C:inactive}(Currently {X:mult,C:white}X#2# {C:inactive} Mult){}"
        }
      },
      j_hlucn_floraljoker = {
        name = "Floral Joker",
        text = {
          "{V:1}Prosperous Packs{} are",
          "more common"
        }
      },
      j_hlucn_miasmajoker = {
        name = "Miasma Joker",
        text = {
          "Destroys a random",
          "card held in hand",
          "when hand is played"
        }
      },
      j_hlucn_visualnoise = {
        name = "Visual Noise",
        text = {
          "Randomizes the {C:attention}Enhancment{}",
          "of each card scored"
        }
      },
      j_hlucn_garnetjoker = {
        name = "Garnet Joker",
        text = {
          "Retriggers played {C:attention}Mult{}",
          "and {C:attention}Bonus{} cards if",
          "played hand contains {C:attention}both{}"
        }
      },
      -- Rare Jokers
      j_hlucn_hourglass = {
        name = "Peculiar Hourglass",
        text = {
          "Creates a {C:dark_edition}Negative {C:common}Common{}",
          "{C:attention}Joker{} if no discards were",
          "used by end of the round",
          "Destroys itself if you",
          "have no {C:attention}discards{}"
        }
      },
      j_hlucn_promopencil = {
        name = "Promotional Pencil",
        text = {
          "Earn {C:gold}$#1#{} for each",
          "{C:attention}Joker{} at end of round",
          "{C:inactive}(Currently {C:gold}$#2#{C:inactive}){}"
        }
      },
      j_hlucn_luckystar = {
        name = "Lucky Star",
        text = {
          "{C:green}#1# in #2#{} chance for {C:chips}+#3#{} Chips",
          "{C:green}#1# in #2#{} chance for {C:mult}+#4#{} Mult",
          "{C:green}#1# in #2#{} chance for {X:mult,C:white}X#5#{} Mult",
          "{C:green}#1# in #2#{} chance to earn {C:gold}$#6#{}"
        }
      },
      j_hlucn_aceofjoker = {
        name = "Ace of Jokers",
        text = {
          "Played {C:attention}Aces{}",
          "give {X:mult,C:white}X#1#{} Mult",
          "when scored"
        }
      },
      j_hlucn_runictablet = {
        name = "Runic Tablet",
        text = {
          "{C:attention}Inscribed{} cards can increase up to {X:mult,C:white}X2.75{} Mult",
          "{C:attention}Inscribed{} cards reset to {X:mult,C:white}X1.5{} Mult",
          "if they have {X:mult,C:white}X2.75{} Mult"
        }
      },
      j_hlucn_liquidkarma = {
        name = "Liquid Karma",
        text = {
          "Played cards ard {C:attention}debuffed{}",
          "if hands remaining is {C:attention}even{}",
          "Retrigger scored cards {C:attention}#1#{} times",
          "if hands remaining is {C:attention}odd{}"
        }
      },
      -- Resin Jokers
      j_hlucn_oxresin = {
        name = "The Ox Resin",
        text = {
          "Earns {C:gold}$#1#{} if",
          "played hand is most",
          "played {C:attention}poker hand{}",
        }
      },
      j_hlucn_houseresin = {
        name = "The House Resin",
        text = {
          "{X:mult,C:white}X#1#{} Mult on {C:attention}first{}",
          "{C:attention}hand{} of round if",
          "no discards were used"
        }
      },
      j_hlucn_clubresin = {
        name = "The Club Resin",
        text = {
          "All played {C:attention}Club{} cards",
          "become {C:attention}Mult{} cards",
          "when scored"
        }
      },
      j_hlucn_fishresin = {
        name = "The Fish Resin",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{}",
          "Mult for every hand",
          "played this round",
          "{C:inactive}(Currently {X:mult,C:white}X#1# {C:inactive} Mult){}"
        }
      },
      j_hlucn_windowresin = {
        name = "The Window Resin",
        text = {
          "All played {C:attention}Diamond{} cards",
          "become {C:attention}Gold{} cards",
          "when scored"
        }
      },
      j_hlucn_hookresin = {
        name = "The Hook Resin",
        text = {
          "This Joker gains {C:chips}+#2# Chips",
          "for every card discarded",
          "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Mult){}"
        }
      },
      j_hlucn_manacleresin = {
        name = "The Manacle Resin",
        text = {
          "Each card held",
          "in hand gives",
          "{C:mult}+#1#{} Mult"
        }
      },
      j_hlucn_wallresin = {
        name = "The Wall Resin",
        text = {
          "{X:mult,C:white}X#1#{} Mult"
        }
      },
      j_hlucn_wheelresin = {
        name = "The Wheel Resin",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "give {C:attention}+#3#{} hand size"
        }
      },
      j_hlucn_armresin = {
        name = "The Arm Resin",
        text = {
          "Creates the {C:blue}Planet{} card",
          "for final played {C:attention}poker hand{}",
          "at end of round",
          "{C:inactive}(Must have room){}"
        }
      },
      j_hlucn_psychicresin = {
        name = "The Psychic Resin",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "if played hand has",
          "exactly {C:attention}5{} cards",
          "{C:inactive}(Currently {X:mult,C:white}X#1# {C:inactive}Mult){}"
        }
      },
      j_hlucn_goadresin = {
        name = "The Goad Resin",
        text = {
          "All played {C:attention}Spade{} cards",
          "become {C:attention}Bonus{} cards",
          "when scored"
        }
      },
      j_hlucn_waterresin = {
        name = "The Water Resin",
        text = {
          "{C:chips}+#1#{} Chips if you",
          "have no discards remaining"
        }
      },
      j_hlucn_serpentresin = {
        name = "The Serpent Resin",
        text = {
          "After play or discard",
          "draw #1# more card"
        }
      },
      j_hlucn_pillarresin = {
        name = "The Pillar Resin",
        text = {
          "Every played {C:attention}card{}",
          "permanently gains",
          "{C:mult}+#1#{} Mult when scored"
        }
      },
      j_hlucn_eyeresin = {
        name = "The Eye Resin",
        text = {
          "{C:mult}+#1#{} Mult if played hand",
          "is not the last hand played",
          "{C:inactive}(Currently {C:attention}#2#{C:inactive}){}"
        }
      },
      j_hlucn_mouthresin = {
        name = "The Mouth Resin",
        text = {
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "per {C:attention}consecutive{} hand of the",
          "{C:attention}same{} hand type played",
          "{C:inactive}(Currently {X:mult,C:white}#1# {C:inactive} Mult){}"
        }
      },
      j_hlucn_plantresin = {
        name = "The Plant Resin",
        text = {
          "This Joker gains {C:chips}+#2#{} Chips",
          "for each {C:attention}face{} card scored",
          "{C:inactive}(Currently {C:chips}+#1# {C:inactive}Chips){}"
        }
      },
      j_hlucn_needleresin = {
        name = "The Needle Resin",
        text = {
          "Earns {C:gold}$#1#{} at",
          "end of round if",
          "{C:attention}Blind{} was defeated",
          "in {C:attention}1{} hand"
        }
      },
      j_hlucn_headresin = {
        name = "The Head Resin",
        text = {
          "All played {C:attention}Heart{} cards",
          "become {C:attention}Glass{} cards",
          "when scored"
        }
      },
      j_hlucn_toothresin = {
        name = "The Tooth Resin",
        text = {
          "Earns {C:gold}$#1#{}",
          "each hand"
        }
      },
      j_hlucn_faceresin = {
        name = "The Face Resin",
        text = {
          "Retrigger all",
          "played {C:attention}face{} cards",
        }
      },
      j_hlucn_flintresin = {
        name = "The Flint Resin",
        text = {
          "{V:1}Balances{} Chips and Mult",
          "{C:attention}before{} hand is scored"
        }
      },
      j_hlucn_crimsonheartresin = {
        name = "Crimson Heart Resin",
        text = {
          "Cards can't",
          "be {C:attention}debuffed{}"
        }
      },
      j_hlucn_ceruleanbellresin = {
        name = "Cerulean Bell Resin",
        text = {
          "Select {C:attention}#1#{}",
          "more card"
        }
      },
      j_hlucn_amberacornresin = {
        name = "Amber Acorn Resin",
        text = {
          "{C:attention}Face down{} playing",
          "cards held in hand",
          "give {X:mult,C:white}X#1#{} Mult",
          "Cards in hand are {C:attention}flipped{}",
          "when hand is played"
        }
      },
      j_hlucn_verdantleafresin = {
        name = "Verdant Leaf Resin",
        text = {
          "{C:attention}+#3#{} Joker Slot",
          "This Joker gains {X:mult,C:white}X#2#{} Mult",
          "when a card is {C:attention}sold",
          "{C:inactive}(Currently {X:mult,C:white}X#1# {C:inactive}Mult)"
        }
      },
      j_hlucn_violetvesselresin = {
        name = "Violet Vessel Resin",
        text = {
          "All {C:attention}Jokers{} give",
          "{X:mult,C:white}X#1#{} Mult"
        }
      }
    },
    Enhanced = {
      m_hlucn_inscribed = {
        name = "Inscribed Card",
        text = {
          "This card gains {X:mult,C:white}X#1#{} Mult when scored",
          "{C:inactive}(Currently {X:mult,C:white}X#2# {C:inactive} Mult){}",
          "{C:inactive,s:0.85}(This effect can't exceed {X:mult,C:white,s:0.85}X#3# {C:inactive,s:0.85} Mult){}"
        }
      },
      m_hlucn_irridated = {
        name = "Irridated Card",
        text = {
          "{C:mult}+#1#-#2#{} Mult",
          "no rank or suit"
        }
      }
    },
    Tarot = {
      c_hlucn_scarab = {
        name = "The Scarab",
        text = {
          "Enhances {C:attention}#1#{} selected",
          "card into an",
          "{C:attention}Irridated{} card"
        }
      },
      c_hlucn_bagel = {
        name = "The Bagel",
        text = {
          "{C:edition,E:1,s:2}YOU WIN!{}"
        }
      }
    },
    Spectral = {
      c_hlucn_esper = {
        name = "Esper",
        text = {
          "Add a {V:1}Turqoise Seal{}",
          "to {C:attention}#1#{} selected",
          "card in your hand"
        }
      }
    },
    Floral = {
      c_hlucn_prestige = {
        name = "Prestige",
        text = {
          "Converts {C:attention}#1#{} selected card",
          "into a {C:attention}King{} with a",
          "random {C:attention}seal{}"
        }
      },
      c_hlucn_famine = {
        name = "Famine",
        text = {
          "Destroys all cards in hand",
          "that are not {C:attention}enhanced{}"
        }
      },
      c_hlucn_capricious = {
        name = "Capricious",
        text = {
          "{C:green}#1# in #2#{} chance to create",
          "{C:attention}#3#{} random {C:spectral}Spectral{} cards",
          "{C:inactive}(Must have room){}"
        }
      },
      c_hlucn_literature = {
        name = "Literature",
        text = {
          "Enhances {C:attention}#1#{}",
          "selected card into",
          "an {C:attention}Inscribed{} card"
        }
      },
      c_hlucn_alchemy = {
        name = "Alchemy",
        text = {
          "Converts {C:attention}#2#{} random cards",
          "in hand into the same {C:attention}Suit{}",
          "and half the {C:attention}Rank{}",
          "of the selected card",
          "{C:inactive}(Ranks are rounded down){}"
        }
      },
      c_hlucn_dissolve = {
        name = "Dissolve",
        text = {
          "Destroys a random {C:attention}Joker{}",
          "Creates {C:attention}#1#{} random {V:1}Floral{} cards"
        }
      },
      c_hlucn_escalate = {
        name = "Escalate",
        text = {
          "Increases rank of all cards",
          "in hand by {C:attention}1{}"
        }
      },
      c_hlucn_maternity = {
        name = "Maternity",
        text = {
          "Creates the last",
          "{C:spectral}Spectral{} or {V:1}Floral{} card",
          "used during this run",
          "{s:0.8,V:1}Maternity {s:0.8}excluded{}"
        }
      },
      c_hlucn_specimen = {
        name = "Specimen",
        text = {
          "{C:green}#1# in #2#{} chance to",
          "create a {V:1,E:1}Pristine{} Joker",
          "{C:inactive}(Must have room){}"
        }
      }
    },
    Lunacy = {
      c_hlucn_absorb = {
        name = "Absorb",
        text = {
          "Creates the {V:1}Resin{} Joker of",
          "the current {C:attention}Boss Blind{}",
          "{C:inactive}(Must have room){}"
        }
      },
      c_hlucn_comprehend = {
        name = "Comprehend",
        text = {
          "{C:attention}Transforms{} #1# selected Joker",
          "into a new Joker",
          "of the same {C:attention}rarity{}"
        }
      },
      c_hlucn_conceptualize = {
        name = "Conceptualize",
        text = {
          "Destroys the leftmost Joker",
          "{C:attention}Transforms{} the rightmost Joker",
          "into a {C:attention}Blueprint{}"
        }
      },
      c_hlucn_memorize = {
        name = "Memorize",
        text = {
          "Destroys selected playing card",
          "Create a {C:attention}tag{} corresponding to",
          "the destroyed card's {C:attention}edition{}"
        }
      },
      c_hlucn_release = {
        name = "Release",
        text = {
          "Destroys all {C:attention}Booster Packs{}",
          "Earn {C:money}${} equal to half",
          "the {C:attention}total cost{} of them",
          "{C:inactive}Total is rounded down{}"
        }
      },
      c_hlucn_understand = {
        name = "Understand",
        text = {
          "Disables the current",
          "{C:attention}Boss Blind{}"
        }
      },
      c_hlucn_unburden = {
        name = "Unburden",
        text = {
          "Costs {C:money}$#2#{} to use",
          "Destroys a random Joker",
          "Gives {C:attention}+#1#{} Consumable slot"
        }
      },
      c_hlucn_lament = {
        name = "Lament",
        text = {
          "Selected Joker becomes",
          "{C:attention}Eternal{} and {C:edition}Foil{}"
        }
      },
      c_hlucn_fantasize = {
        name = "Fantasize",
        text = {
          "Creates a random {C:rare}Rare{}",
          "{V:1}Hallucinations{} Joker"
        }
      }
    },
    Other = {
      p_hlucn_florid_small_1 = {
        name = "Prosperous Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Floral{} cards to",
          "be used immediately"
        }
      },
      p_hlucn_florid_small_2 = {
        name = "Prosperous Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Floral{} cards to",
          "be used immediately"
        }
      },
      p_hlucn_florid_medium = {
        name = "Jumbo Prosperous Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Floral{} cards to",
          "be used immediately"
        }
      },
      p_hlucn_florid_large = {
        name = "Mega Prosperous Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Floral{} cards to",
          "be used immediately"
        }
      },
      p_hlucn_lunacy_small_1 = {
        name = "Madness Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Lunacy{} cards"
        }
      },
      p_hlucn_lunacy_small_2 = {
        name = "Madness Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Lunacy{} cards"
        }
      },
      p_hlucn_lunacy_medium = {
        name = "Jumbo Madness Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Lunacy{} cards"
        }
      },
      p_hlucn_lunacy_large = {
        name = "Mega Madness Pack",
        text = {
          "Choose {C:attention}#1#{} of up to",
          "{C:attention}#2#{} {V:1}Lunacy{} cards"
        }
      },
      hlucn_turqoise_seal = {
        name = "Turqoise Seal",
        text = {
          "When played in a hand that",
          "triggers the {C:attention}Boss Blind{}",
          "destroy this card and",
          "create a {C:spectral}Spectral{} card",
          "{C:inactive}(Must have room){}"
        }
      }
    }
  },
  misc = {
    challenge_names = {
      c_hlucn_testchall = "Test Challenge"
    },
    labels = {
      k_hlucn_pristine = "Pristine",
      k_hlucn_resin = "Resin",
      hlucn_turqoise_seal = "Turqoise Seal"
    },
    dictionary = {
      k_hlucn_florid_pack = "Prosperous Pack",
      k_hlucn_lunacy_pack = "Madness Pack",
      k_hlucn_pristine = "Pristine",
      k_hlucn_resin = "Resin",
      
      hlucn_msg_reset = "Reset...",
      hlucn_msg_nyoom = "Zoom!",
      hlucn_msg_alert = "!!!",
      hlucn_msg_gettag = "Created Tag!",
      hlucn_msg_repeat = "Again!",
      hlucn_msg_upgrade = "Upgraded!",
      hlucn_msg_jgenerate = "Joker Created!",
      hlucn_msg_destroy_1 = "Obliterated...",
      hlucn_msg_destroy_2 = "Destroyed!",
      hlucn_msg_debuffed = "Debuffed...",
      hlucn_msg_nothing = "Nothing...",
      hlucn_msg_enhance = "Enhanced!",
      hlucn_msg_success = "Success!",
      hlucn_msg_balanced = "Balanced!",
    }
  }
}