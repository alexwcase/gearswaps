--1.20.2016
-------------------------------------------------------------------------------------------------------------------
-- Global settings
-------------------------------------------------------------------------------------------------------------------
 
-- You'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.
-- I really recommend if you use this, it's on a full keyboard it uses a lot of keybinds.  If you are imaginative there is enough keybinds using window and app key to go around though.  A supported macro keyboard also helps.  I use a Strix Tactic Pro that a windower developer kindly made work with Windower.
--
 
display_hud = true -- can toggle with app/menu key + 0
display_states = false -- can toggle with app/menu key + 8
--app/menu key + 9 will force the hud to refresh in case of any bugs/to trouble shoot bugs
base_icon_dir = 'C:/Program Files (x86)/Windower4/addons/Gearswap/data/icons/' --had to use absolute pathing, set this to the icon directory
hud_x_pos = 0 --important to update these if you have a smaller screen
hud_y_pos = 550
hud_draggable = false -- really recommend leaving it false for now, after the icons were introduced it gets kind of buggy.
hud_font_size = 12
-- hud_icon_width = 32 --the size of icons from plugins folder, if you change the icons in icon folder you gave above, set the width height here
-- hud_icon_height = 32 --the size of icons from plugins folder, if you change the icons in icon folder you gave above, set the width height here
hud_transparency = 180 -- a value of 0 (invisible) to 255 (no transparency at all)
debug_gs1 = false --outputs info if you're trying to debug sets
--Whether to let organizer see these sets or not, or to leave them at home, cramped inventory means I don't need to always have all these
usemephitas = false --will equip mephitas +1 ring if you are near full mana, can be useful to do just before conduit etc
use_melee = true
use_enfeeb = true
use_nuking = true
use_resistant = true
shattersoul_set = true
exp_rings = true
load_debugging = false
inwkr = 0

cureIV = true --Macros use cure3 or cure4
useall_bp_reduction_gear = true --if doing salvage useful to use all the bp reduction gear you can

-------------------------------------------------------------------------------------------------------------------
-- Key bindings, and toggles/switches using mote's libraries.  Feel free to change key bindings
-- ! = alt, ^ = ctrl, @ = windows key, # = menu key/app key,-- putting % after any of these disables the keybind if you are typing in a chat window
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Perp', 'Melee')
    state.CastingMode:options('Normal', 'Resistant','PDT')
    --state.IdleMode:options('Normal', 'PDT')
    state.damagetaken = M{['description']="Damage Taken",'None','PDT'}
    --state.damagetaken = M{['description']="Damage Taken",'None','DT', 'PDT', 'MDT'} --can use this line instead and cycle more damage resistance types
    state.petdamagetaken = M{['description']="Pet Damage Taken",'None','DT'}
    state.cpmode = M(false, 'CP Mode')
    state.movement = M(false, 'Movement Mode')
    state.tplock = M(false, 'Staff Lock')
    state.impactmode = M(false, 'Impact Debuff Mode')
    state.favor = M{['description'] = 'Favor Mode'}
    state.favor:options('mpsaver','allout')
    state.burstmode = M{['description'] = 'Burst Mode'}
    state.burstmode:options('Normal','Burst')
    state.pullmode = M(false, 'Pull Mode')
    state.bpmagicacc = M(false, 'BP Accuracy Mode')
 
    --gear.perp_staff = {name="Gridarvor"}
   
    select_default_macro_book()
    send_command('bind !%numpad1 gs c smn carbuncle')
    send_command('bind !%numpad2 gs c smn fenrir')
    send_command('bind !%numpad3 gs c smn ifrit')
    send_command('bind !%numpad4 gs c smn titan')
    send_command('bind !%numpad5 gs c smn leviathan')
    send_command('bind !%numpad6 gs c smn garuda')
    send_command('bind !%numpad7 gs c smn shiva')
    send_command('bind !%numpad8 gs c smn ramuh')
    send_command('bind !%numpad9 gs c smn diabolos')
    send_command('bind !%numpad0 gs c smn caitsith')
    send_command('bind !%numpadenter gs c smn atomos')
    send_command('bind !%numpad. gs c smn lightspirit')

    send_command('bind !%delete input /ja "Avatar\'s Favor"')
    send_command('bind !%pagedown input /ja "Apogee"')
    send_command('bind !%end input /ja "Sublimation"')

    send_command('bind @%numpad0 gs c warpring')
    send_command('bind #0 gs c toggle_hud')
    send_command('bind #9 gs c force_hud_refresh')
    send_command('bind #8 gs c toggle_states')

    if cureIV then
	    send_command('alias stp_m1 input /ma "Cure IV" <p0>')
	    send_command('alias stp_m2 input /ma "Cure IV" <p1>')
	    send_command('alias stp_m3 input /ma "Cure IV" <p2>')
	    send_command('alias stp_m4 input /ma "Cure IV" <p3>')
	    send_command('alias stp_m5 input /ma "Cure IV" <p4>')
	    send_command('alias stp_m6 input /ma "Cure IV" <p5>')
	    send_command('alias stp_m7 input /ma "Cure IV"')
    else
	    send_command('alias stp_m1 input /ma "Cure III" <p0>')
	    send_command('alias stp_m2 input /ma "Cure III" <p1>')
	    send_command('alias stp_m3 input /ma "Cure III" <p2>')
	    send_command('alias stp_m4 input /ma "Cure III" <p3>')
	    send_command('alias stp_m5 input /ma "Cure III" <p4>')
	    send_command('alias stp_m6 input /ma "Cure III" <p5>')
	    send_command('alias stp_m7 input /ma "Cure III"')
    end
    --send_command('alias stp_m8 input /ma "Regen II"')
    send_command('alias stp_m8 gs c nukemode')
    send_command('alias stp_m9 gs c supportmode')
    send_command('alias stp_m10 gs c switch_dualbox_binds')
    send_command('alias stp_m11 gs c release')
    send_command('alias stp_m12 input /pet "Retreat" <me>')
    send_command('alias stp_m13 input /pet "Assault" <t>')
    send_command('alias stp_m14 input /ma "Light Spirit" <me>')

    --if you don't use a macro keyboard then you could use these
    send_command('bind ^%numpad1 gs c release')
    send_command('bind ^%numpad2 input /pet "Retreat" <me>')
    send_command('bind ^%numpad3 input /pet "Assault" <t>')

    send_command('alias stp_m11 gs c release')
    send_command('alias stp_m12 input /pet "Retreat" <me>')
    send_command('alias stp_m13 input /pet "Assault" <t>')
    send_command('alias stp_m14 input /ma "Light Spirit" <me>')

    --shortcuts
    send_command('alias si input /ma sneak;wait 4;input /ma invisible')
    send_command('alias sn input /ma sneak')
    send_command('alias in input /ma invisible')
    send_command('alias f1 input /ma fire;wait 3.5;input /ma fire')
    send_command('alias t1 input /ma thunder;wait 3.5;input /ma thunder')
    send_command('alias p input /ma paralyna')
    send_command('alias l input /ma aurorastorm')
    send_command('alias po input /ma poisona')
    send_command('alias e input /ma erase')
    send_command('alias c input /ma cursna')
    send_command('alias s input /ma silena')
    send_command('alias b input /ma blindna')
    send_command('alias bu input /ma stoneskin;wait 4.9;input /ma aquaveil;wait 4.6;input /ma refresh;wait 4.5;input /ma regen')
    send_command('alias ss input /ma stoneskin')
    send_command('alias bl input /ma blink')
    send_command('alias r input /ma refresh')
    send_command('alias rr input /ma reraise')
    send_command('alias rg lua r gearswap')

    --alt
    send_command('bind !1 gs c pact cure')
    send_command('bind !2 gs c pact curaga')
    send_command('bind !3 gs c pact buffoffense')
    send_command('bind !4 gs c pact buffdefense')
    send_command('bind !5 gs c pact buffspecial')
    send_command('bind !6 gs c pact debuff1')
    send_command('bind !7 gs c pact debuff2')
    send_command('bind !8 gs c pact sleep')
    send_command('bind !9 gs c pact misc2')
    --send_command('bind !0 input /item "Ginger Cookie" <stnpc>; wait 1; input /item "Ginger Cookie" <lastst>; wait 1;input /item "Ginger Cookie" <lastst>') --halloween event.. >.>

    --ctrl
    send_command('bind ^1 gs c pact nuke2')
    send_command('bind ^2 gs c pact nuke4')
    send_command('bind ^3 gs c pact bp70')
    send_command('bind ^4 gs c pact bp75')
    send_command('bind ^5 gs c pact bprage1')
    send_command('bind ^6 gs c pact astralflow')
    send_command('bind ^7 gs c pact misc1')
    --send_command('bind ^9 gs c pact misc3')
    --send_command('bind ^9 input /pet "Release" <me>')

    --send_command('bind ^0 gs c pact misc4')

    --send_command('bind ^o gs c switchmode')
    --send_command('bind ^o gs c switch_dualbox_binds')
    
    send_command('bind !q gs c siphon')
    send_command('bind !o input /map')
    send_command('bind !%numpad+ input /map')
    send_command('bind !%numpad- gs c fleet_wind')
    send_command('bind f11 gs c cycle damagetaken')
    send_command('bind !f11 gs c cycle petdamagetaken')
    send_command('bind ^f11 gs c toggle pullmode')
    send_command('bind f10 gs c toggle movement')
    send_command('bind ^f10 gs c cycle favor')
    send_command('bind !f10 gs c cycle impactmode')
    send_command('bind !f9 gs c cycle burstmode')
    send_command('bind ^f9 gs c cycle bpmagicacc')
    --send_command('bind ^[ gs c cpmode')
    send_command('bind ^[ gs c toggle cpmode')
    send_command('bind ![ gs c toggle tplock')
    send_command('bind ^] gs c buffrotation')
    --send_command('bind %numpad1 setkey f8 down;wait .1;setkey f8 up;input /pet "Flaming Crush" <t>')
    send_command('bind %numpad1 input /pet "Flaming Crush" <t>')
    send_command('bind %numpad3 setkey f8 down;wait .1;setkey f8 up;wait .1;input /pet "Assault" <t>')
    --send_command('bind %numpad3 setkey f8 down;wait .1;setkey f8 up;input /pet "Sleepga" <t>')
    --send_command('bind %numpad3 input /pet "Flaming Crush" <t>')
    --send_command('bind !%numpad. gs c smn lightspirit')

    setup_hud() -- HUD for summoner, don't modify this line --
end
 
-------------------------------------------------------------------------------------------------------------------
-- Sets, modify these :D
-------------------------------------------------------------------------------------------------------------------
 
use_dualbox = false
-- Define sets and vars used by this job file.
function init_gear_sets()
	--bpmagicstaff={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}}
        --bpmagicaccstaff = { name="Espiritus", augments={'MP+50','Pet: "Mag.Atk.Bns."+20','Pet: Mag. Acc.+20',}}
	-- bpmagicstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+6','System: 1 ID: 1796 Val: 3','Pet: Mag. Acc.+15','Pet: "Mag.Atk.Bns."+28',}}
	bpmagicstaff={ name="Keraunos", augments={'Blood Pact Dmg.+7', 'Pet: Haste+5%','Pet: "Mag.Atk.Bns."+11',}}
	bpmagicaccstaff={ name="Grioavolr", augments={'Blood Pact Dmg.+6','System: 1 ID: 1796 Val: 3','Pet: Mag. Acc.+15','Pet: "Mag.Atk.Bns."+28',}}
	smnskillstaff = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','System: 2 ID: 153 Val: 3',}}
	avatarattackstaff = { name="Espiritus", augments={'System: 2 ID: 136 Val: 14','Pet: Attack+25','System: 2 ID: 152 Val: 3',}}
	conveyance = { name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Pet: Enmity+8',}}
	BPDconveyance = { name="Conveyance Cape", augments={'Summoning magic skill +1','Blood Pact Dmg.+1', 'Blood Pact ab. del. II -2','Pet: Enmity+10',}}
	--if you don't have 3 staff you can set them all to the same one, until you do get more.  Nirvana is the best avatarattackstaff, espiritus and griovalr techinically best for the other 2 with right augs
	--if you're confused for any sets with augs or just wanna save time, just equip the gear and type //gs export lua and it will be in your data/export folder

	sets.petmab = { -- this will be used as a base for all magical bp rage, can be overridden by type of magical blood page rage later
	    head="Glyphic Horn",
	    --hands="Apogee Mitts",
	    --hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+24 Pet: "Mag.Atk.Bns."+24','Pet: "Mag.Atk.Bns."+15',}},
	    -- hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+16 Pet: "Mag.Atk.Bns."+16','Blood Pact Dmg.+9','System: 1 ID: 1792 Val: 8','Pet: Mag. Acc.+7','Pet: "Mag.Atk.Bns."+9',}},
	    hands={ name="Helios gloves" },
		body="Convoker's Doublet +1",
	    legs={ name="Helios Spats", augments={ 'Blood Pact Dmg.+6' }},
	    --legs="Enticer's Pants",
	    feet="Convoker's Pigaches +1" ,
	    main="Keraunos",
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    neck="Eidolon Pendant +1",
	    waist="Caller's Sash",
	    left_ear="Domesticator earring",
	    --right_ear="Andoaa earring",
	    right_ear="Influx earring",
	    left_ring="Fervor Ring",
	    right_ring="Evoker's ring",
	    --back="Scintillating Cape"
	    back=conveyance
	    --ring2="Globidonta Ring",
	    --back="Argochampsa mantle",

	    --head={ name="Helios Band", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}}, 
	    --body={ name="Helios Jacket", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
	    --hands={ name="Helios Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
	    --legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+5',}},
	    --feet={ name="Helios Boots", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +3','Blood Pact Dmg.+6',}},
	}

	-- Magic Accuracy setting, overrides gear above
	sets.bp_magic_acc = {
	    main=bpmagicaccstaff,
	    hands="Apogee Mitts",
	    back=conveyance
	}
	-- Physical Accuracy setting, overrides physical pact
	sets.bp_phys_acc = {
	    hands="Apogee Mitts",
	    back=conveyance
	}
	-- Hybrid Accuracy setting, overrides hybrid pact
	sets.bp_hybrid_acc = {
	    main=bpmagicaccstaff,
	    hands="Apogee Mitts",
	    back=conveyance
	}


	--this will be used for many types of wards, max your summoning skill for longer ward duration and more magic acc
	--wards can be empowered by empy bonus your call on to use it or not
	sets.smnskill = { 
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    --head="Convoker's Horn +1",
	    head="Beckoner's Horn +1",
	    body="Beckoner's Doublet +1",
	    --hands="Glyphic Bracers +1",
	    hands="Lamassu Mitts +1",
	    legs="Ngen seraweels",
	    feet="Apogee Pumps",
	    --neck="Caller's Pendant",
	    neck="Melic Torque",
	    --waist="Lucidity sash",
	    waist="Kobo Obi",
	    --left_ear="Caller's Earring",
	    left_ear="Summoning earring",
	    right_ear="Andoaa earring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    back=conveyance
	}

	--Helios Notes
	--MAX: crit 20% mab 150 bpdmg 35
	--AT: crit 19% mab 142 bpdmg 23
	--MISSING: crit 1% mab 8 bpdmg 12

	sets.cpmode = {back="Mecisto. Mantle"}

	--for when you wanna melee for self skill chains, or procing voidwatch, or just wanna crack some skulls the old fashioned way
	sets.tplock = { 
		main=bpmagicstaff
	}
	sets.inwkr = {
		neck="Arciela's Grace +1"
	}

	--Feet is your biggest -perp slot, especially with apogee+1 being a massive -9.  Evans earring can help counter this, I keep moonshade on my right ear.  Lucidity helps too ofc.  This is automatically equipped when you use fleet wind, and if you're moving between points and then engaging things a lot (such as assault) I found I could be low mana, so this mostly fixed that.
	sets.movement = { 
		left_ear="Evans earring",
		waist="Lucidity sash",
		feet="Herald's Gaiters"
	}
	
	--When you zone into mog gardens, what you wear, might have to hit f12 to force a gear update sometimes
	sets.farmer = { 
		main="Hoe",
		body="Overalls",
		legs="",
		feet="Herald's Gaiters"
	}

	--For more movement in Adoulin
	sets.adoulinmovement = { 
		body="Councilor's Garb"
	}

	--if you use organizer and want to keep some things in inventory, weird I know but it works
	sets.keep = {
		left_ring="Warp Ring",
	}
	if exp_rings then 
		sets.keep2 = {
			left_ring="Echad Ring",
			right_ring="Trizek Ring",
			back="Capacity Ring",
		}
	end
	sets.crafting = {
		left_ring="Artificer's Ring",
		right_ring="Orvail Ring",
	}
	sets.keep3= {
		left_ring="Holy Water",
		main="Remedy",
		sub="Echo Drops",
		--head="Grape Daifuku +1",
		--body="Grape Daifuku",
		--legs="Akamochi",
		feet="Akamochi +1",
		back="Rolanberry Daifuku",
		ammo="Rolanberry Daifuku +1",
		ranged="Kisamochi",
	}


		
    --------------------------------------
    -- Precast Sets
    --------------------------------------
   
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}

    sets.precast.JA['Mana Cede'] = {hands="Beckoner's bracers"}
    sets.precast.JA['Elemental Siphon'] = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Esper Stone +1",
	    head={ name="Telchine Cap", augments={'"Elemental Siphon"+30',}},
	    body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+30',}},
	    hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+30',}},
	    legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+30',}},
	    feet="Beck. Pigaches +1",
	    neck="Melic Torque",
	    waist="Kobo Obi",
	    --left_ear="",
	    right_ear="Andoaa earring",
	    left_ring="Zodiac Ring",--technically shouldn't use on light or darks day, going to add logic for it later
	    right_ring="Evoker's Ring",
	    back=conveyance
    }

    if useall_bp_reduction_gear then 
	    -- Pact delay reduction gear
	    sets.precast.BloodPactWard = { --I just stack it all because when I do salvage or a gear slot is locked by a NM it's nice
		    main=smnskillstaff, --II -2
		    --sub="Vox Grip",
		    ammo="Seraphicaller",-- II -5
		    --body="Apogee Dalmatica", -- II -2
		    body="Glyphic Doublet ", --8
		    head="Glyphic Horn",--8
		    --legs="Beckoner's Spats +1",
		    feet="Glyphic Pigaches",--5 II-1
		    hands="Glyphic Bracers",--6
		    --ear2="Evans Earring",
		    --waist="Lucidity sash",
		    back=BPDconveyance --II -2
		    --gift -10
	    }
	    -- delay 1: -15 cap (-20 equipped)
	    -- delay II: -10
	    -- gift: -10
    else
	    -- Pact delay reduction gear
	    sets.precast.BloodPactWard = { --I just stack it all because when I do salvage or a gear slot is locked by a NM it's nice
		    ammo="Seraphicaller",-- II -5
		    body="Shomonjijoe +1", --8
		    head="Convoker's Horn +1",--8
		    --gift II -10
	    }
	    -- delay 1: -15 cap (-16 equipped)
	    -- delay II: -5
	    -- gift: -10
    end

    sets.precast.BloodPactRage = sets.precast.BloodPactWard


    sets.burstmode = {}
    sets.burstmode.Burst = {
	    hands="Glyphic Bracers +1"
    }

    -- Fast cast sets for spells
    sets.precast.FC = {
	    --main="Malevolence", --5
	    main="Sucellus",--5
	    sub="Chanter's Shield",--3 
	    --head="Vanya hood", --10
	    head="Helios Circlet", -- 5
	    neck="Orunmila's Torque",--5
	    right_ear="Loquacious earring",--2
	    ear1="Enchntr. Earring +1",--2
	    hands={ name="Telchine Gloves", augments={'"Fast Cast"+3',}}, --3
	    --body="Marduk's jubbah +1",-- +6
	    body="Helios Coat", --8
	    -- body="Shango Robe", --8
	    ring1="Weatherspoon ring",--5
	    ring2="Prolix ring", -- 2
	    back="Swith cape ", --4
	    waist="Witful belt", --3
	    legs="Psycloth Lappas", --7
	    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+6','INT+8',}},--11
	    
    }
    --rahab --+2
    --marduk --+6
    --zendik --+2
    --ammo --+2
    --max obtainable 81, 83 with ammo
    --at 71 and 86 with rdm sub
    
    --sets.precast.FC['Stoneskin'] = {
	    --waist="Siegel Sash", --8
    --}
    if use_resistant then
	    sets.precast.FC.Resistant = { --this is still in the works for me, I want it to work that it makes compromises between casting speed, keeping you alive, spell interuption gear, and skill gear for that type of spell to reduce interuption rate
		    --main="Earth Staff", -- -20 PDT
		    --sub="Vox Strap",
		    --head="Vanya hood", --10
		    body="Vrikodara Jupon", --5 -3 PDT
		    hands={ name="Telchine Gloves", augments={'Mag. Acc.+12','"Fast Cast"+5','"Regen" potency+1',}}, --5
		    legs="Lengo pants", --5 -1 PDT
		    feet="Regal Pumps +1", --7
		    left_ring="Defending ring", -- -10 DT
		    right_ring="Prolix ring", -- 2
		    --neck="Wiglen Gorget", -- -6 PDT
		    back="Swith cape +1", --3
	    }
    end
    --39
    --    sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {
    --	    main="Tamaxchi",
    --	    sub="Genbu's shield",
    --	    body="Heka's kalasiris",
    --	    back="pahtli cape",
    --	    feet="Chelona boots"
    --    })
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {}
    if shattersoul_set then
	    sets.precast.WS['Shattersoul'] = { --stack INT and MAB, it's a magical WS, this isn't a very good set for it ;p
		    head="Apogee Crown",
		    body="Witching Robe",
		    hands="Apogee Mitts",
		    waist="Aswang Sash",
		    --legs="Helios Spats",
		    --feet="Helios Boots",
		    left_ear="Friomisi Earring",
		    right_ear="Moonshade Earring",
		    neck="Satlada necklace",
		    back="Toro Cape",
	    }
    end
 
   
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    --sets.midcast.FastRecast = {
    --	    main="Marin Staff",
    --	    sub="Vivid Strap",
    --	    ammo="Seraphicaller",
    --	    head="Haruspex hat",
    --	    neck="Jeweled collar",
    --	    ear2="Loquacious earring",
    --	    hands="Regimen mittens",
    --	    body="Vanir cotehardie",
    --	    ring1="Weatherspoon ring",
    --	    ring2="Prolix ring",
    --	    back="Swith cape",
    --	    waist="Witful belt",
    --	    legs="Lengo pants",
    --	    feet="Glyph pigaches +1"
    --}

    sets.midcast.Cure = {
	    main="Serenity",
	    head="Vanya hood",--10%
	    body="Vanya robe",
	    hands="Telchine gloves",--14%
	    legs="Vanya slops",
	    feet="Vanya clogs",--5%
	    left_ear="Mendicant's earring",--5%
	    right_ear="Roundel Earring",--5%
	    right_ring="Sirona's Ring",
	    left_ring="Ephedra Ring",
	    neck="Nodens Gorget",--5%
	    waist="Bishop's Sash",
	    back="Thaumaturge's Cape"
    }
    
    --Notes, but outdated
    --power:787.25
    --cure potency: 50+19 
    --haste:8+3+3+5+3+3 = 25
    --conserve mp: 18
    --enmity:-10 + -5
    sets.midcast.Cure.Aurora = {--When you are SCH subjob and cast aurorastorm it will use these items for much more potent Cure 3
	    main="Chatoyant Staff",--10%
	    waist="Hachirin-No-Obi",--10%
	    back="Twilight Cape",--5%
    }
    --potency: 10+14+5+5+5+5+10=54%  caps at 50%
    --d/w: 25%
    --Power = floor(MND・) + floor(VIT・) + Healing Magic Skill
    -- 264/2 + 185/4 + 483 = 132 + 46 + 483 = 661  caps at 700 
    sets.midcast.Cure.Self = {--cure recieved gear
	    neck="Phalaina locket",
	    waist="Gishdubar Sash",
    }
    sets.midcast.Weather = {
	    back="Twilight Cape"
    }
    sets.midcast.Refresh = {}
    sets.midcast.Refresh.Self = {
	    waist="Gishdubar Sash",
    }

    sets.midcast.Cursna = {
	    right_ring="Sirona's Ring",
	    left_ring="Ephedra Ring",
	    head="Vanya hood",
	    feet="Vanya clogs",
    }          
    sets.midcast.Cursna.Self = {
	    waist="Gishdubar Sash",
    }
    sets.midcast['Enhancing Magic'] = {
	    neck="Melic Torque", --+10
	    body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+30',}}, --+12
	    right_ear="andoaa earring", --+5
	    feet="Regal Pumps +1", --+10
    }
    sets.midcast.Stoneskin = {
	    neck="Nodens Gorget", --+30
	    --left_ear="Earthcry Earring", +10
	    --legs="Shedier Seraweels",--+35
	    waist="Siegel Sash",--+20
    }
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],sets.midcast.Stoneskin)

    if use_nuking then
	    sets.midcast['Elemental Magic'] = {
		    main="Malevolence",
		    sub="Culminus", 
		    --head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+6','MND+6','Mag. Acc.+4',}}, 
		    head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Mag. Acc.+7',}},
		    --neck="Satlada Necklace",
		    neck="Sanctity Necklace",
		    ear1="Friomisi Earring",
		    ear2="Hecate's Earring",
		    left_ring="Fenrir Ring",
		    right_ring="Fenrir Ring",
		    --waist="Aswang Sash",
		    waist="Yamabuki-no-Obi",
		    back="Toro Cape",
		    --body="Witching Robe",
		    body="Count's Garb",
		    --hands="Psycloth Manillas",
		    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+3','Mag. Acc.+11',}},
		    legs="Gyve trousers",
		    --feet="Tutyr Sabots"
		    feet="Merlinic Crackows"
	    }
    else
	    sets.midcast['Elemental Magic'] = {
		    main="Malevolence",
		    sub="Culminus", 
		    --head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','"Fast Cast"+6','MND+6','Mag. Acc.+4',}}, 
		    --neck="Satlada Necklace",
		    neck="Sanctity Necklace",
		    --waist="Aswang Sash",
		    --hands="Psycloth Manillas",
		    legs="Gyve trousers",
	    }
    end
    if use_enfeeb then    
	    sets.midcast['Enfeebling Magic'] = {
		    main="Grioavlr",--Acc+14 INT+19
		    --head="Befouled Crown",--Acc+20 Skill+16 INT+33
		    head={ name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Mag. Acc.+7',}},--Acc+44 INT+29 
		    neck="Imbodla Necklace",--INT+7 Skill+5
		    ear1="Psystorm Earring",
		    ear2="Lifestorm Earring",--Acc+12 Int+4
		    --ring1="Fenrir Ring",--Acc+2
		    --ring2="Fenrir Ring",--Acc+2
		    body="Vanya Robe",--Acc+21 Skill+20 INT+31
		    hands="Reveal. Mitts +1",--Acc+11 INT+11
		    waist="Channeler's Stone",--INT+10
		    --body="Cohort Cloak",
		    legs="Psycloth Lappas",--Acc+35 INT+40 Skill+18
		    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+6','INT+8',}},--Acc+18 INT+32
		    --feet="Psycloth Lappas",--Acc+35 INT+40 Skill+18
		    --ammo="Kalboron stone"
	    }
	    --Totals:
	    --Acc:145
	    --INT:183
	    --Skill:43
	    --combined vs hard target:371
    end
    --
    --    sets.midcast['Dark Magic'] = {
    --    }
 
    -- Avatar pact sets.  All pacts are Ability type.
   
    -- Max out Summoning Magic Skill
    sets.midcast.Pet.BloodPactWard = { --uses the smnskill set as base, if you want to override anything htat set you may do so here
    }
    sets.midcast.Pet.BloodPactWard = set_combine(sets.smnskill,sets.midcast.Pet.BloodPactWard)

    --you want to put tp bonus and + to hp here for stronger cures, smn skill won't matter this is for healing wards mostly
    sets.midcast.Pet.TPBloodPactWard = set_combine(sets.smnskill,{
	    head="Apogee Crown",
	    hands="Apogee Mitts",
	    body="Apogee Dalmatica",
	    legs="Enticer's Pants",
	    feet="Apogee Pumps"
    })

    sets.midcast.Pet.DebuffBloodPactWard = { --override your smnskill set here, these are wards that target monsters, I leave it as maxing out smn skill for magic accuracy, but you could put other things here
    }
    sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets.smnskill,sets.midcast.Pet.DebuffBloodPactWard)
       
    sets.midcast.Pet.DebuffBloodPactWard.Acc = set_combine(sets.midcast.Pet.DebuffBloodPactWard,pet.petmabacc)
   
    sets.midcast.Pet.PhysicalBloodPactRage = { --does physical damage only, like pred claws and spinning dive and volt strike
        head="Apogee Crown",
        hands={ name="Helios gloves" },
    	body="Convoker's Doublet +1",
        legs={ name="Helios Spats", augments={ 'Blood Pact Dmg.+6' }},
        feet="Convoker's Pigaches +1",
        main="Keraunos",
        sub="Vox Grip",
        ammo="Seraphicaller",
        neck="Caller's Pendant",
        waist="Moepapa stone",
        left_ear="Domesticator earring",
        right_ear="Influx earring",
        left_ring="Fervor Ring",
        right_ring="Evoker's ring",
        back="Conveyance cape"
    }
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage,{
	    hands="Apogee Mitts"
    })
    sets.midcast.Pet.HybridBloodPactRage = { --At this time is only your flaming crush set
        head="Apogee Crown",
     --    hands={ name="Helios gloves" },
    	-- body="Helios jacket",
     --    legs="Helios spats",
     --    feet="Helios boots",
     --    main="Keraunos",
        sub="Vox Grip",
        ammo="Seraphicaller",
        neck="Eidolon Pendant +1",
        waist="Caller's Sash",
        left_ear="Domesticator earring",
        right_ear="Influx earring",
        left_ring="Fervor Ring",
        right_ring="Evoker's ring",
        back=conveyance,
        hands={ name="Helios gloves" },
		body="Convoker's Doublet +1",
	    legs={ name="Helios Spats", augments={ 'Blood Pact Dmg.+6' }},
	    --legs="Enticer's Pants",
	    feet="Convoker's Pigaches +1" 
    }
    sets.midcast.Pet.HybridBloodPactRage.Acc = set_combine(sets.midcast.Pet.HybridBloodPactRage,{
	    main=bpmagicaccstaff,
	    hands="Apogee Mitts"
    })
    sets.midcast.interruption = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Convoker's Horn +1",
	    hands="Lamassu Mitts +1",
	    neck="Melic Torque",
	    waist="Lucidity sash",
	    left_ear="Evans Earring",
	    right_ear="Andoaa earring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    back=conveyance
    }
    --sets.midcast.interruption = set_combine(sets.petmab,sets.midcast.interruption)
 
    sets.midcast.Pet.MagicalBloodPactRage = {
    }
 
    sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets.petmab,sets.midcast.Pet.MagicalBloodPactRage)
    sets.midcast.Pet.MagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.MagicalBloodPactRage,pet.petmabacc)
    sets.midcast.Pet.TPMagicalBloodPactRage = set_combine(sets.petmab,{legs="Enticer's Pants"})
    sets.midcast.Pet.TPMagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.TPMagicalBloodPactRage,pet.petmabacc)
    sets.midcast.Pet.IfritMagicalBloodPactRage = set_combine(sets.petmab,{left_ring="Speaker's Ring",right_ring="Fervor Ring"})
    sets.midcast.Pet.IfritMagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.IfritMagicalBloodPactRage,sets.petmabacc)
 
    -- Spirits cast magic spells, which can be identified in standard ways.
   
    --    sets.midcast.Pet.WhiteMagic = {
    --	    ammo="Seraphicaller",
    --	    main="Tumafyrig",
    --	    head="Convoker's Horn +1 +1",
    --	    neck="Caller's Pendant",
    --	    ear1="Andoaa earring",
    --	    ear2="Summoning earring",
    --	    body="Anhur Robe",
    --	    hands="Glyphic Bracers +1 +1",
    --	    ring1="Evoker's Ring",
    --	    ring2="Globidonta Ring",
    --	    back="Conveyance cape",
    --	    waist="Lucidity sash",
    --	    legs="Marduk's Shalwar +1",
    --	    sub="Vox grip",
    --	    feet="Marduk's crackows +1"
    --    }

    --    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Helios spats"})
    -- 
    --    sets.midcast.Pet['Elemental Magic'].Resistant = {}
   
 
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
   
    -- Resting sets
    sets.resting = {
	    main="Chatoyant Staff",
	    sub="Oneiros grip",
	    waist="Fucho-no-obi",
	    legs="Assiduity pants +1",
    }
   
    -- Idle sets
    sets.idle = {
	    main=bpmagicstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Convoker's Horn +1",
	    body="Shomonjijoe +1",
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    feet="Apogee Pumps +1",
	    --neck="Wiglen Gorget",
	    --neck="Sanctity Necklace",
	    neck="Wiglen Gorget",
	    waist="Fucho-no-obi",
	    left_ear="Gelos Earring",
	    right_ear="Moonshade Earring",
	    --left_ring="Gelatinous Ring +1",
	    --left_ring="Thurandaut ring",
	    left_ring="Defending Ring",
	    right_ring="Gelatinous Ring +1",
	    --back=conveyance
	    back="Solemnity Cape",--4
    }
      sets.damagetaken = {}
      sets.damagetaken.None = {
      }
      sets.damagetaken.DT = {
	      body="Onca Suit",--10
	      hands="",
	      legs="",
	      feet="",
	      --neck="Loricate Torque +1", --5
	      neck="Loricate Torque +1", --5
	      left_ring="Defending Ring",--10
	      back="Solemnity Cape",--4
      }
      sets.damagetaken.PDT = { --
	      --main="Earth Staff", --20
	      main="Mafic Cudgel", --10
	      sub="Genmei Shield", --10
	      left_ring="Defending Ring",--10
	      right_ring="Gelatinous Ring +1",--6
	      --neck="Wiglen Gorget",--6
	      --neck="Loricate Torque +1",--5
	      neck="Loricate Torque +1", --5
	      body="Onca Suit", --10
	      hands="",
	      legs="",
	      feet="",
	      back="Solemnity Cape"--4
	      --back="Repulse Mantle"--4
	      --back="Umbra Cape"--6, 12 at night
      }
      sets.damagetaken.MDT = {--Shell V is around 24%
	      left_ring="Defending Ring",--10
	      body="Onca Suit",--10
	      back="Solemnity Cape",--4
	      neck="Loricate Torque +1", --5
	      --neck="Loricate Torque +1",--5
	      --left_ring="Vengeful Ring",--magiceva
      }
      sets.pullmode = {
	      main="Mafic Cudgel", --10
	      sub="Genmei Shield", --10
	      right_ring="Gelatinous Ring +1",--6
	      left_ring="Defending Ring",--10
	      neck="Loricate Torque +1", --5
	      --neck="Wiglen Gorget",--6
	      feet="Hippomenes Socks +1",
	      back="Solemnity Cape"--4
	      --back="Repulse Mantle"--4
	      --back="Umbra Cape"--6, 12 at night
      }
      --sets.damagetaken.MagicEvasion = {
	      --left_ring="Vengeful Ring",--9
	      --right_ring="Purity Ring",--10
	      --back="Felicitas Cape +1",--10
	      --body="Onca Suit" -- 252
	      --body 91, hands 48, legs 118, feet 118
	      --left_ear="Eabani Earrng", --8
	      --right_ear="Flashward Earrng", --8
	      --head 86
	      --
      --}
      sets.petdamagetaken = {}
      sets.petdamagetaken.DT = {
	    --main=bpmagicstaff,
	    main="Sucellus",
	    neck="Empath Necklace",
	    left_ear="Handler's Earring +1",
	    --right_ear="Handler's Earring",
	    right_ear="Rimeice earring",
	    legs="Psycloth Lappas",
      }
 
    sets.precast.FC.PDT = set_combine(sets.precast.FC, sets.damagetaken.PDT)
    sets.idle.PDT = {--mixes refresh with pdt
	    --main="Earth staff", --20
	    --sub="Oneiros Grip",
	    --main="Bolelabunga",
	    --sub="Sors shield",
	    
	    ammo="Seraphicaller",
	    head="Convoker's Horn +1",
	    body="Shomonjijoe +1",
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    feet="Convoker's Pigaches +1",
	    --neck="Wiglen Gorget", --6
	    waist="Fucho-no-obi",
	    left_ear="Andoaa earring",
	    right_ear="Moonshade Earring",
	    right_ring="Gelatinous Ring +1", --6
	    --left_ring="Thurandaut ring",
	    left_ring="Defending Ring", --10
	    --back="Repulse Mantle" --4
	    back="Solemnity Mantle"--4
    }

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: free, if you minimized perp cost already, -4 a tick with no -perp gear.  Weird I know but it's true, test it yourself
   
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    --
   
    -- -perp gear:
    -- Grivardor: -5
    -- Glyphic Horn: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convoker's Pigaches: -4
    -- total: -18
   
    -- Can make due without either the head or the body, and use +refresh items in those slots.
   

    sets.idle.PDT = {}
    --maximize summoning skill and reduce perp and use glyphic legs, tho it doesn't seem smn skill doing much for these anymore
    sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Gridarvor",right_ear="Moonshade Earring",legs="Glyphic Spats +1"})
    -- 
    --    sets.idle.Town = {
    --                main="Terra's staff",
    --                sub="Oneiros grip",
    --                head="Convoker's horn +1",
    --                neck="Loricate Torque +1",
    --                ear1="Moonshade earring",
    --                ear2="Gifted earring",
    --                body="Hagondes coat +1",
    --                hands="Serpentes cuffs",
    --                ring1="Dark ring",
    --                ring2="Dark ring",
    --                back="umbra cape",
    --                waist="Fucho-no-obi",
    --                legs="Assiduity pants +1",
    --                feet="Serpentes sabots"
    --    }
 
    -- Favor uses Caller's Horn instead of Convoker's Horn +1 for refresh
    --sets.idle.Avatar.Favor = {head="Caller's Horn +1"}
    
    sets.favor= {}
    sets.favor.mpsaver={ -- don't sacrifice refresh gear for smn skill gear
	    main="Gridarvor",
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Beckoner's Horn +1",
	    body="Hagondes Coat +1",
	    --body="Beckoner's Doublet +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Asteria Mitts +1",
	    --legs="Beckoner's Spats",
	    legs="Assiduity Pants +1",
	    --feet="Convoker's Pigaches +1",
	    --feet="Beck. Pigaches +1",
	    feet="Convoker's pigaches +1",
	    neck="Caller's Pendant",
	    waist="Lucidity sash",
	    --left_ear="Caller's Earring",
	    left_ear="Andoaa earring",
	    right_ear="Moonshade Earring",
	    --right_ear="Evans earring",
	    --left_ring="Thurandaut ring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    back=conveyance
    }
    sets.favor.allout={ -- equip all the favor and smn skill you can while not losing MP
	    --main="Gridarvor",
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Beckoner's Horn +1",
	    --body="Shomonjijoe +1",
	    body="Beckoner's Doublet +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    --hands="Glyphic Bracers +1",
	    hands="Lamassu Mitts +1",
	    --legs="Beckoner's Spats",
	    legs="Beckoner's spats +1",
	    --feet="Convoker's Pigaches +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee Pumps",
	    --neck="Caller's Pendant",
	    neck="Melic Torque",
	    waist="Lucidity sash",
	    --left_ear="Caller's Earring",
	    left_ear="Andoaa earring",
	    right_ear="Moonshade Earring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    back=conveyance
    }
       
    sets.idle.Avatar = { 
	    --ear2="Loquacious Earring",
	    --body="Hagondes coat +1",
	    --hands="Regimen mittens",
	    --ring2="Globidonta Ring",
	    --waist="Isa belt",
	    main="Keraunos",
	    sub="Vox Grip",
	    head="Glyphic Horn",
	    body="Hagondes Coat +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    --feet="Beck. Pigaches +1",
	    -- feet="Apogee pumps",
	    feet="Convoker's Pigaches +1",
	    neck="Caller's Pendant",
	    ammo="Seraphicaller",
	    waist="Lucidity sash",
	    --waist="Fucho-no-obi",
	    --left_ear="Caller's Earring",
	    --right_ear="Andoaa earring",
	    --right_ear="Evans earring",
	    left_ear="Andoaa earring",
	    right_ear="Moonshade Earring",
	    --left_ring="Paguroidea Ring",
	    --left_ring="Thurandaut ring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    back=conveyance
    }
    sets.Avatar = {}
    sets.Avatar.Haste = {
	    main=avatarattackstaff,
	    sub="Vox Grip",
	    head="Beckoner's Horn +1",
	    body="Shomonjijoe +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee pumps +1",
	    --feet="Psycloth boots",
	    --neck="Caller's Pendant",
	    neck="Empath necklace",
	    ammo="Seraphicaller",
	    --waist="Incarnation Sash",
	    waist="Moepapa Stone",
	    --waist="Fucho-no-obi",
	    --left_ear="Caller's Earring",
	    --right_ear="Handler's Earring +1",
	    left_ear="Domesticator's earring",
	    -- left_ear="Rimeice earring",
	    right_ear="Moonshade Earring",
	    --right_ear="Evans earring",
	    --left_ring="Paguroidea Ring",
	    --left_ring="Thurandaut ring",
	    --left_ring="Fervor Ring",
	    left_ring="Globidonta Ring",
	    right_ring="Evoker's ring",
	    --back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}},
	    back="Penetrating Cape"

    }
    sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Gridarvor",left_ear="Moonshade Earring",legs="Glyphic Spats +1"})
    sets.perp = sets.idle.Avatar
    
    -- -5 staff
    --    head +2
    --    body +3
    -- -3 pants +2
    --    hands +2
    --    earring +1
    -- -1 ring
    -- -2 waist
    -- -8 feet
    -- -2 earring
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    --sets.perp.Day = {body="Hagondes Coat +1"}
    --sets.perp.Weather = {neck="Caller's Pendant",body="Hagondes Coat +1"}
    sets.perp.Weather = {neck="Caller's Pendant"}
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
    --    sets.perp.Carbuncle = {
    --	    hands="Carbuncle Mitts"
    --    }
    sets.perp.Carbuncle = set_combine(sets.perp, {hands="Asteria Mitts +1"})
    sets.perp['Cait Sith'] = set_combine(sets.perp, {hands="Lamassu Mitts +1"})
    sets.perp.LightSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {main=smnskillstaff,right_ear="Moonshade Earring",legs="Glyphic Spats +1"})
    sets.perp.AirSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs="Glyphic Spats +1"})
    sets.perp.FireSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs="Glyphic Spats +1"})
    --can add other spirits too 
	    
--    sets.perp.staff_and_grip = {main=gear.perp_staff}
   
    sets.Kiting = {}
   
    sets.latent_refresh = {sub="Oneiros grip",waist="Fucho-no-obi"}
   
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
   
    sets.engaged = sets.perp 
    sets.engaged.Perp = sets.perp
    if use_melee then
	    sets.engaged.Melee = {
		    head={ name="Telchine Cap", augments={'"Elemental Siphon"+30',}},
		    --body="Beckoner's Doublet +1",
		    --body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+15',}},
		    --hands={ name="Telchine Gloves", augments={'Pet: Regen+3'}},
		    --legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+15',}},
		    --feet="Beck. Pigaches +1",
		    body="Onca Suit",
		    neck="Subtlety spectacles",
		    --right_ring="Thurandaut ring",
		    right_ring="Evoker's Ring",
		    left_ring="Rajas ring",
		    left_ear="Bladeborn earring",
		    right_ear="Steelflash earring",
		    waist="Olseni Belt",
	    }
	 
	    sets.meleehybrid = {
		    neck="Empath Necklace",
		    left_ear="Bladeborn Earring",
		    right_ear="Steelflash Earring",
		    waist="Olseni Belt",
	    }
    else
	    sets.engaged.Melee = {
		    head={ name="Telchine Cap", augments={'"Elemental Siphon"+30',}},
		    --body="Beckoner's Doublet +1",
		    --body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+15',}},
		    --hands={ name="Telchine Gloves", augments={'Pet: Regen+3'}},
		    --legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+15',}},
		    --feet="Beck. Pigaches +1",
		    body="Onca Suit",
		    --right_ring="Thurandaut ring",
		    right_ring="Evoker's Ring",
	    }
    end
    --    sets.engaged.Acc = {
    --	    main="Ungeri Staff",
    --	    neck="Subtlety spectacles"
    --    }
end

include('SMN-lib.lua') -- Leave this line to include all the library functionality --
