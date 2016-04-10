-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    gs c toggle luzafring -- Toggles use of Luzaf Ring on and off
    
    Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
    for ranged weaponskills, but not actually meleeing.
    Acc on offense mode (which is intended for melee) will currently use .Acc weaponskill
    mode for both melee and ranged weaponskills.  Need to fix that in core.
--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    -- Whether to use Luzaf's Ring
    state.LuzafRing = M(false, "Luzaf's Ring")
	-- Detect Triple Shot
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false
    -- Whether a warning has been given for low ammo
    state.warned = M(false)
	state.Obi = 'ON' -- Turn Default Obi ON or OFF Here --

    define_roll_values()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')

    gear.RAbullet = "Adlivun Bullet"
    gear.WSbullet = "Orichalc. bullet"
    gear.MAbullet = "Orichalc. Bullet"
    -- gear.MAbullet = "Bronze Bullet"
    -- gear.QDbullet = "Animikii Bullet"
    gear.QDbullet = "Adlivun Bullet"
	gear.WScape = {name="Gunslinger's Cape", augments={'"Mag.Atk.Bns."+5','Enmity-4','"Phantom Roll" ability delay -2'}}
	gear.PRcape = {name="Gunslinger's Cape", augments={'"Mag.Atk.Bns."+1','Enmity-2','"Phantom Roll" ability delay -5'}}
    options.ammo_warning_limit = 15

    gear.taeon = {
    	acc={
    		tights={name="Taeon tights", augments={'Accuracy+22', '"Triple Atk."+1'}},
    		boots={name="Taeon boots", augments={'Accuracy+12', '"Triple Atk."+2'}}
   		}
	}


    -- Additional local binds
    --Melee rolls --
    send_command('bind ^%numpad1 input /ja "Fighter\'s Roll"')
    send_command('bind ^%numpad2 input /ja "Chaos Roll"')
    send_command('bind ^%numpad3 input /ja "Hunter\'s Roll"')
    send_command('bind !%numpad1 input /ja "Samurai Roll"')

    --Mage Rolls--
    send_command('bind ^%numpad4 input /ja "Wizard\'s Roll" ')
    -- send_command('bind ^%numpad5 input /pet "Heel" ')
    -- send_command('bind ^%numpad6 input /pet "Heel" ')

    --Misc. Rolls --
    send_command('bind ^%numpad7 input /pet "Heel" ')
    send_command('bind ^%numpad8 input /ja "Corsair\'s Roll"')
    send_command('bind ^%numpad9 input /ja "Bolter\'s Roll" ')
    send_command('bind ^%numpad0 input /ja "Double Up" ')


    -- send_command('bind !%delete input /ja "Reward"')
    -- send_command('bind !%pagedown input /ja "Unleash"')
    -- send_command('bind !%end input /pet "Spur"')

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Precast sets to enhance JAs
	
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
	sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes +1"}
	sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
	sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
	
		sets.Obi = {}
	sets.Obi.Thunder = {waist='Hachirin-no-Obi'}
	sets.Obi.Water = {waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {waist='Hachirin-no-Obi'}
	sets.Obi.Light = {waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {waist='Hachirin-no-Obi'}

	
	sets.precast.CorsairRoll = {head="Lanun Tricorne",hands="Chasseur's Gants", ring2="Barataria Ring", legs="Desultor Tassets", back=gear.PRcape}
	
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes"})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
	
	sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
	sets.precast.FoldDoubleBust = {hands="Chasseur's Gants +1"}
	
	sets.precast.CorsairShot = {head="Blood Mask"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Whirlpool Mask",
		body="Iuitl Vest",hands="Iuitl Wristbands",
		legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


	sets.precast.RA = {ammo=gear.RAbullet,
		head="Pursuer's Beret",neck="Ocachi Gorget",ear1="Volley Earring",ear2="Clearview Earring",
		body="Pursuer's Doublet",hands="Lanun Gants +1",ring1="Rajas Ring",ring2="Haverton Ring",
		back=gear.WScape,waist="Impulse Belt",legs="Chas. Culottes +1",feet="Scopuli Nails +1"}

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Lanun Tricorne +1",neck=gear.ElementalGorget,ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Lanun Frac +1",hands="Taeon Gloves",ring1="Stormsoul Ring",ring2="Garuda Ring",
		back="Amemet Mantle +1",waist=gear.ElementalBelt,legs="Lanun Culottes +1",feet="Lanun Bottes +1"}


	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = sets.precast.WS

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

	sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		head="Lanun Tricorne +1",neck=gear.ElementalGorget,ear1="Moonshade Earring",ear2="Clearview Earring",
		body="Pursuer's Doublet",hands="Lanun Gants +1",ring1="Rajas Ring",ring2="Garuda Ring",
		back="Buquwik Cape",waist=gear.ElementalBelt,legs="Lanun Culottes +1",feet="Scopuli Nails +1"}

	sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		head="Lanun Tricorne +1",neck=gear.ElementalGorget,ear1="Moonshade Earring",ear2="Clearview Earring",
		body="Pursuer's Doublet",hands="Pursuer's Cuffs",ring1="Rajas Ring",ring2="Garuda Ring",
		back=gear.WScape,waist=gear.ElementalBelt,legs="Lanun Culottes +1",feet="Scopuli Nails +1"}

	sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Rawhide Vest",hands="Pursurer's Cuffs",ring1="Arvina Ringlet +1",ring2=gear.ElementalRing,
		back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Lanun Bottes +1"}

	sets.precast.WS['Wildfire'].Brew = {ammo=gear.MAbullet,
		head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Rawhide Vest",hands="Pursurer's Cuffs",ring1="Arvina Ringlet +1",ring2=gear.ElementalRing,
		back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Lanun Bottes +1"}

	sets.precast.WS['Savage Blade'] = {ammo=gear.MAbullet,
		head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Rawhide Vest",hands="Pursurer's Cuffs",ring1="Arvina Ringlet +1",ring2=gear.ElementalRing,
		back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Lanun Bottes +1"}
	
	-- sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
	-- 	head="Pixie Hairpin +1",neck="Deviant Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
	-- 	body="Rawhide Vest",hands="Pursurer's Cuffs",ring1=gear.ElementalRing,ring2="Archon Ring",
	-- 	back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Lanun Bottes +1"}	

	sets.precast.WS['Leaden Salute'] = {
		ammo=gear.MAbullet,
		head="Pixie Hairpin +1",
		neck="Atzintli Necklace",
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
		body="Rawhide Vest",
		hands="Pursuer's Cuffs",
		ring1="Acumen Ring",
		ring2="Garuda Ring",
		back=gear.WScape,
		waist=gear.ElementalObi,
		legs={name="Taeon tights", augments={"Mag. Acc.+11", '"Mag. Atk. Bns."+11'}},
		feet={name="Taeon boots", augments={"Mag. Acc.+10", '"Mag. Atk. Bns."+10'}}
	}
		
	sets.precast.WS['Aeolian Edge'] = {ammo=gear.QDbullet,
		head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Lanun Frac +1",hands="Thur. Gloves +1",ring1="Fenrir Ring +1",ring2=gear.ElementalRing,
		back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Lanun Bottes +1"}
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Whirlpool Mask",
		body="Iuitl Vest",hands="Iuitl Wristbands",
		legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.CorsairShot = {ammo=gear.QDbullet,
		head="Blood Mask",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Rawhide Vest",hands="Taeon Gloves",ring1="Fenrir Ring +1",ring2=gear.ElementalRing,
		back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Chass. Bottes"}

	-- sets.midcast.CorsairShot.Acc = {ammo=gear.QDbullet,
	-- 	head="Blood Mask",neck="Deviant Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
	-- 	body="Chasseur's Frac +1",hands="Chasseur's Gants +1",ring1="Garuda Ring",ring2=gear.ElementalRing,
	-- 	back=gear.WScape,waist=gear.ElementalObi,legs="Shned. Tights +1",feet="Chass. Bottes"}
	sets.midcast.CorsairShot.Acc = {
		ammo=gear.QDbullet,
		head="Blood Mask",
		neck="Deviant Necklace",
		ear1="Lifestorm Earring",
		ear2="Psystorm Earring",
		body="Chasseur's Frac +1",
		hands="Chasseur's Gants +1",
		ring1="Garuda Ring",
		ring2=gear.ElementalRing,
		back=gear.WScape,
		waist=gear.ElementalObi,
		legs="Shned. Tights +1",
		feet="Chass. Bottes"}

	sets.midcast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		head="Blood Mask",neck="Deviant Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Chasseur's Frac +1",hands="Thur. Gloves +1",ring1="Stormsoul Ring",ring2="Garuda Ring",
		back=gear.WScape,waist=gear.ElementalObi,legs="Lanun Culottes +1",feet="Chass. Bottes"}

	sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']


	-- Ranged gear
	sets.midcast.RA = {ammo=gear.RAbullet,
		head="Pursuer's Beret",
		neck="Ocachi Gorget",
		ear1="Volley Earring",
		ear2="Clearview Earring",
		body="Pursuer's Doublet",
		hands="Lanun Gants +1",
		ring1="Rajas Ring",
		ring2="Haverton Ring",
		back=gear.WScape,
		waist="Impulse Belt",
		legs="Chas. Culottes +1",
		feet="Scopuli Nails +1"
	}
		
	sets.midcast.TS = {ammo=gear.RAbullet,
		head="Chass. Tricorne +1",neck="Ocachi Gorget",ear1="Volley Earring",ear2="Clearview Earring",
		body="Chasseur's Frac +1",hands="Lanun Gants +1",ring1="Rajas Ring",ring2="Haverton Ring",
		back=gear.WScape,waist="Impulse Belt",legs="Chas. Culottes +1",feet="Scopuli Nails +1"}

	sets.midcast.RA.Acc = {
		ammo=gear.RAbullet,
		head="Chass. Tricorne",
		neck="Waylayer's Scarf +1",
		ear1="Volley Earring",
		ear2="Clearview Earring",
		body="Chasseur's Frac +1",
		hands="Chasseur's gants",
		ring1="Hajduk Ring",
		ring2="Hajduk Ring",
		back=gear.WScape,
		waist="Eschan Stone",
		legs="Pursuer's pants",
		feet="Pursuer's gaiters"
	}
	


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	

	-- Idle sets
	sets.idle = {ammo=gear.RAbullet,
		head="Chass. Tricorne +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Mekosu. Harness",hands="Pursuer's Cuffs",ring1="Rajas Ring",ring2="Haverton Ring",
		back=gear.WScape,waist="Eschan Stone",legs="Lanun Culottes +1",feet="Lanun Bottes +1"}

	sets.idle.Town = {ammo=gear.QDbullet,
		head="Chass. Tricorne +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Pursuer's Doublet",hands="Pursuer's Cuffs",ring1="Rajas Ring",ring2="Haverton Ring",
		back=gear.WScape,waist="Eschan Stone",legs="Chas. Culottes +1",feet="Chass. Bottes"}
		

	-- Defense sets
	sets.defense.PDT = {
		head="Fugacity Beret +1",neck="Twilight Torque",
		body="Lanun Frac +1",hands="Taeon Gloves",ring1="Jelly Ring",ring2="Archonm Ring",
		back="Iximulew Cape",waist="Flume Belt",legs="Chas. Culottes +1",feet="Lanun Bottes +1"}

	sets.defense.MDT = {
	head="Fugacity Beret +1",neck="Twilight Torque",
		body="Lanun Frac +1",hands="Taeon Gloves",ring1="Minerva's Ring",ring2="Archonm Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Chas. Culottes +1",feet="Chass. Bottes"}
	

	sets.Kiting = {feet="Skadi's Jambeaux +1"}
	-- buff sets
	 sets.buff['Triple Shot'] = {body="Chasseur's Frac +1"}
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged.Melee = {
		ammo=gear.RAbullet,
		head="Rawhide Mask",
		neck="Asperity Necklace",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Rawhide Vest",
		hands={name="Taeon gloves", augments={'"Triple Atk."+2'}},
		ring1="Rajas Ring",
		ring2="Vehemence Ring",
		back="Bleating Mantle",
		waist="Chiner's Belt +1",
		legs=gear.taeon.acc.tights,
		feet=gear.taeon.acc.boots
	}
	
	sets.engaged.Acc = {
		ammo=gear.RAbullet,
		head="Ejekamal Mask",
		neck="Subtlety Spec.",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Mekosu. Harness",
		hands="Chasseur's Gants",
		ring1="Enlivened Ring",
		ring2="Cacoethic Ring",
		back="Bleating Mantle",
		waist="Anguinus Belt",
		legs=gear.taeon.acc.tights,
		feet=gear.taeon.acc.boots
	}

	sets.engaged.Melee.DW = {		
		ammo=gear.RAbullet,
		head="Rawhide Mask",
		neck="Asperity Necklace",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Rawhide Vest",
		hands={name="Taeon gloves", augments={'"Triple Atk."+2'}},
		ring1="Rajas Ring",
		ring2="Vehemence Ring",
		back="Bleating Mantle",
		waist="Chiner's Belt +1",
		legs=gear.taeon.acc.tights,
		feet=gear.taeon.acc.boots
	}

	sets.engaged.Acc.DW = {
		ammo=gear.RAbullet,
		head="Rawhide Mask",
		neck="Subtlety spec.",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Mekosu. Harness",
		hands="Chasseur's Gants",
		ring1="Enlivened Ring",
		ring2="Cacoethic Ring",
		back="Bleating Mantle",
		waist="Anguinus Belt",
		legs=gear.taeon.acc.tights,
		feet=gear.taeon.acc.boots
	}

	sets.engaged.Ranged = {
		ammo=gear.RAbullet,
		head="Pursuer's Beret",
		neck="Ocachi Gorget",
		ear1="Clearview Earring",
		ear2="Volley Earring",
		body="Pursuer's Doublet",
		hands="Pursuer's cuffs",
		ring1="Hajduk Ring",
		ring2="Hajduk Ring",
		back=gear.WScape,
		waist="Impulse Belt",
		legs="Pursuer's pants",
		feet="Pursuer's Gaiters"}
		
	sets.engaged.TS = {ammo=gear.RAbullet,
		head="Chass. Tricorne +1",neck="Ocachi Gorget",ear1="Clearview Earring",ear2="Volley Earring",
		body="Chasseur's Frac +1",hands="Lanun Gants +1",ring1="Rajas Ring",ring2="Haverton Ring",
		back=gear.WScape,waist="Impulse Belt",legs="Chas. Culottes +1",feet="Scopuli Nails +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- Check that proper ammo is available if we're using ranged attacks or similar.
    if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        do_bullet_checks(spell, spellMap, eventArgs)
    end
    -- Define proper defaults for weaponskills that use obis
    if spell.english == 'Leaden Salute' then
        gear.default.obi_waist = "Eschan Stone"
		gear.default.obi_ring = "Arvina Ringlet +1"
    elseif spell.english == 'Wildfire' then
        gear.default.obi_waist = "Eschan Stone"
		gear.default.obi_ring = "Garuda Ring"
	elseif spell.type == 'CorsairShot' then
        gear.default.obi_waist = "Eschan Stone"
		gear.default.obi_ring = "Fenrir Ring +1"
	end
    -- gear sets
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
        equip(sets.precast.LuzafRing)
    elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
        classes.CustomClass = 'Acc'
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
        if sets.precast.FoldDoubleBust then
            equip(sets.precast.FoldDoubleBust)
            eventArgs.handled = true
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
        display_roll_info(spell)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
    if buffactive['Transcendancy'] then
        return 'Brew'
    end
end


-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
        state.OffenseMode:set('Ranged')
    end
end
function job_self_command(cmdParams, eventArgs)
	if command == 'coffer' then
		cycle = 0
		invCount = windower.ffxi.get_bag_info(0).count
		if invCount == 80 then
			add_to_chat(140,'Inv. full. Ending cycle')
		elseif player.inventory["Velkk Coffer"] then
			send_command('input /item "Velkk Coffer"')
			cycle = 1
		else
			add_to_chat(140,'No Coffers found in inv.')
			send_command('findall Velkk Coffer')
		end
		if cycle == 1 then
			send_command('wait 2;gc c coffer')
		end
	end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = ''
    
    msg = msg .. 'Off.: '..state.OffenseMode.current
    msg = msg .. ', Rng.: '..state.RangedMode.current
    msg = msg .. ', WS.: '..state.WeaponskillMode.current
    msg = msg .. ', QD.: '..state.CastingMode.current

    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end
    
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end

    msg = msg .. ', Roll Size: ' .. (state.LuzafRing.value and 'Large') or 'Small'
    
    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
        ["Runeist's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Evasion"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end


-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
    local bullet_name
    local bullet_min_count = 1
    
    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if spell.element == 'None' then
                -- physical weaponskills
                bullet_name = gear.WSbullet
            else
                -- magical weaponskills
                bullet_name = gear.MAbullet
            end
        else
            -- Ignore non-ranged weaponskills
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.RAbullet
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end
    
    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    
    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
            add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
            return
        else
            add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end
	
	if spell.type == 'CorsairShot' and player.inventory["Trump Card"] and player.inventory["Trump Card"].count < 10 then
			add_to_chat(104, 'Low on trump cards!')
	end
	
    
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
        add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
        eventArgs.cancel = true
        return
    end
    
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and state.warned.value == false
        and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
        local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end
        
        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_bullets.count > options.ammo_warning_limit and state.warned then
        state.warned:reset()
    end
end