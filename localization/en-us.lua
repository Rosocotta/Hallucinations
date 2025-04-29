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
      b_hlucn_aluminiumdeck = {
        name = "Aluminium Deck",
        text = {
          "Start with extra {C:gold}$16{}",
          "Earn no {C:attention}Interest{}"
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
          "{C:inactive}(Cannot give more than {C:money}$#2# {C:inactive}){}"
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
      hlucn_turqoise_seal = "Turqoise Seal"
    },
    dictionary = {
      k_hlucn_florid_pack = "Floral Pack",
      k_hlucn_pristine = "Pristine",
      
      hlucn_msg_reset = "Reset...",
      hlucn_msg_nyoom = "Zoom!",
      hlucn_msg_alert = "!!!",
      hlucn_msg_gettag = "Created Tag!",
      hlucn_msg_repeat = "Again!",
      hlucn_msg_upgrade = "Upgraded!",
      hlucn_msg_jgenerate = "Joker Created!",
      hlucn_msg_destroy_1 = "Obliterated...",
      hlucn_msg_debuffed = "Debuffed...",
      hlucn_msg_nothing = "Nothing..."
    }
  }
}