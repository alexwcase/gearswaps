-------------------------------------------------------------------------------------------------------------------
-- ctrl+F12 cycles Idle modes


-------------------------------------------------------------------------------------------------------------------
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
							-- THE STUFF YOU CARE ABOUT STARTS AFTER LINE 101 --
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

function job_setup()

	get_combat_form()

end


function user_setup()
        state.IdleMode:options('Normal', 'Reraise')
		state.OffenseMode:options('Normal', 'PetDT')
		state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'HighAcc', 'MaxAcc',}
        send_command('bind ^f8 gs c cycle CorrelationMode')
       
       -- Custom Binds --
       send_command('bind ^%numpad3 input /pet "Fight" <t>')
       send_command('bind ^%numpad2 input /pet "Heel" ')

       send_command('bind !%delete input /ja "Reward"')
       send_command('bind !%pagedown input /ja "Unleash"')
       send_command('bind !%end input /pet "Spur"')

       send_command('bind ^1 gs c Ready one')
       send_command('bind ^2 gs c Ready two')
       send_command('bind ^3 gs c Ready three')

       
 end
     

-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
	'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
	'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
	'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
	'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
	'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
	'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
	'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
	'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
	'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
	'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
	'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
	'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Frogkick','Ripper Fang','Scythe Tail','Chomp Rush'}

		
mab_ready_moves = S{
	 'Cursed Sphere','Venom','Toxic Spit',
	 'Venom Spray','Bubble Shower',
	 'Fireball','Plague Breath',
	 'Snow Cloud','Acid Spray','Silence Gas','Dark Spore',
	 'Charged Whisker','Purulent Ooze','Aqua Breath','Stink Bomb',
	 'Nectarous Deluge','Nepenthic Plunge','Foul Waters','Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
	 'Soporific','Geist Wall','Numbing Noise','Spoil','Hi-Freq Field',
	 'Sandpit','Sandblast','Filamented Hold',
	 'Spore','Infrasonics','Chaotic Eye',
	 'Blaster','Intimidate','Noisome Powder','TP Drainkiss','Jettatura','Spider Web',
	 'Corrosive Ooze','Molting Plumage','Swooping Frenzy',
	 'Pestilent Plume',}


-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.


function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	-- Unbinds the Jug Pet, Reward, Correlation, Treasure, PetMode, MDEF Mode hotkeys.
	send_command('unbind !=')
	send_command('unbind ^=')
	send_command('unbind !f8')
	send_command('unbind ^f8')
	send_command('unbind @f8')
	send_command('unbind ^f11')



	send_command('unbind ^3')
	send_command('unbind ^2')
	send_command('unbind ^1')
	send_command('unbind 1')
	send_command('unbind 2')
	send_command('unbind 3')

end



		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		-- HERE IS THE BEGINNING OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED FOR EDITING GEAR --
		

-- BST gearsets
function init_gear_sets()


	-- PRECAST SETS
        sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
		
		sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves",body="Mirke Wardecors",}
		
		sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
		
        sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
		
		sets.precast.JA.Tame = {head="Totemic Helm +1",}
		
		sets.precast.JA.Spur = {feet="Nukumi Ocreae +1"}

        
	--This is what will equip when you use Reward.  No need to manually equip Pet Food Theta.
		sets.precast.JA.Reward = {
				ammo="Pet Food Theta",
				ring1="Aquasoul Ring",
				head="Khimaira Bonnet",
				neck="Noetic Torque",
				ear1="Lifestorm Earring",
				ear2="Ferine Earring",
				body="Totemic Jackcoat ",
				hands="Leyline Gloves",
				ring2="Aquasoul Ring",
				back="Pastoralist's Mantle",
				waist="Engraved Belt",
				legs="Totemic Trousers",
				feet="Totemic Gaiters"}

	--This is your base FastCast set that equips during precast for all spells/magic.
    sets.precast.FC = {
				ring2="Lebeche Ring",
				ammo="Impatiens",
				neck="Voltsurge Torque",
				head={ name="Taeon Chapeau", augments={'"Fast Cast"+2',}},
				body={ name="Taeon Tabard", augments={'Pet: "Mag.Atk.Bns."+23','"Fast Cast"+4',}},
				hands="Leyline Gloves",
				legs={ name="Taeon Tights", augments={'Pet: DEF+17','"Fast Cast"+4',}},
				feet={ name="Taeon Boots", augments={'Pet: "Mag.Atk.Bns."+24','"Fast Cast"+2',}},
				ring1="Prolix Ring",
				waist="Ninurta's Sash",}
			
         			
	sets.midcast.Stoneskin = {
			head="Taeon Chapeau",
			neck="Stone Gorget",
			ear1="Earthcry Earring",
			ear2="Lifestorm Earring",
			body="Totemic Jackcoat +1",
			hands="Stone Mufflers",
			ring1="Aquasoul Ring",
			ring2="Aquasoul Ring",
			back="Pastoralist's Mantle",
			waist="Crudelis Belt",
			legs="Haven Hose",
			feet="Amm Greaves"}

				
        -- WEAPONSKILLS
		
		
        -- Default weaponskill set.
	sets.precast.WS = {
			ammo="Cheruski Needle",
			head="Nukumi Cabasset +1",
			neck="Asperity Necklace",
			ear1="Flame Pearl",
			ear2="Brutal Earring",
			body="Nukumi Gausape +1",
			hands="Boor Bracelets",
			ring1="Pyrosoul Ring",
			ring2="Ifrit Ring",
			back="Buquwik Cape",
			waist="Windbuffet Belt +1",
			legs="Nukumi Quijotes +1",
			feet="Nukumi Ocreae +1"}

	
        -- Specific weaponskill sets.
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Breeze Gorget"})
				
    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {
			ammo="Floestone",
            neck="Justiciar's Torque",
			ear1="Tati Earring +1",
			ear2="Brutal Earring",
			body="Mes'yohi Haubergeon",
			hands="Nomkahpa Mittens +1",
			ring1="Ramuh Ring +1",
            back="Vespid Mantle",
			legs="Mikinaak Cuisses",
			feet="Vanir Boots"})
			
		
	sets.precast.WS['Primal Rend'] = {
			head="Taeon Chapeau",
			body="Tot. Jackcoat +1",
			hands="Leyline Gloves",
			legs="Taeon Tights",
			feet="Taeon Boots",
			neck="Stoicheion Medal",
			waist="Salire Belt",
			left_ear="Hecate's Earring",
			right_ear="Friomisi Earring",
			left_ring="Epona's Ring",
			right_ring="Rajas Ring",
			back="Argocham. Mantle",}

	
		
	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'],{ammo="Erlene's Notebook",
			head="Highwing Helm",
			neck="Stoicheion Medal",
			ear1="Moonshade Earring",
			ear2="Friomisi Earring",
			body="Taeon Tabard",
			hands="Taeon Gloves",
			ring1="Acumen Ring",
			ring2="Carb. Ring",
			back="Toro Cape",
			waist="Salire Belt",
			legs="Taeon Tights",
			feet="Taeon Boots",})

	-- PET SIC & READY MOVES


--This is your base Ready move set, activating for physical Ready moves. Merlin/D.Tassets are accounted for already. 
	sets.midcast.Pet.WS = {
			main="Arktoi",
			ammo="Demonry Core",
			neck="Empath Necklace",
			ear1="Ferine Earring",
			head="Totemic Helm",
			body={ name="Acro Surcoat", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Pet: "Dbl. Atk."+5',}},
			hands="Ferine Manoplas +1",
			legs="Totemic Trousers",
			feet="Totemic gaiters",
			back="Pastoralist's Mantle",
			ring1="Thurandaut Ring",
			ear2="Domesticator's Earring",
			sub="Digirbalag",
			waist="Hurch'lan Sash",}
	
	sets.midcast.Pet.Neutral = set_combine(sets.midcast.Pet.WS, {  
			main="Arktoi",
			ammo="Demonry Core",
			neck="Empath Necklace",
			ear1="Sabong Earring",
			head="Despair Helm",
			body={ name="Acro Surcoat", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Pet: "Dbl. Atk."+5',}},
			hands="Nukumi Manoplas +1",
			legs={ name="Acro Breeches", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+3',}},
			feet={ name="Acro Leggings", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+3',}},
			back="Pastoralist's Mantle",
			ring1="Thurandaut Ring",
			ear2="Domesticator's Earring",
			sub="Digirbalag",
			waist="Hurch'lan Sash",})
			
			
	sets.midcast.Pet.HighAcc = set_combine(sets.midcast.Pet.WS, {
			main="Odium",
			ear1="Handler's Earring +1",
			head="Despair Helm",
			body="Valorous Mail",
			legs="Wisent Kecks",
			feet="Valorous Greaves",
			hands="Nukumi Manoplas +1",
			ammo="Demonry Core",
			neck="Empath Necklace",
			waist="Incarnation Sash",
			ear2="Handler's Earring",
			sub="Digirbalag",
			ring1="Thurandaut Ring",
			back="Pastoralist's Mantle",})
			
	sets.midcast.Pet.MaxAcc = set_combine(sets.midcast.Pet.WS, {
			main="Malevolence",
			ear1="Handler's Earring +1",
			head="Valorous Mask",
			body="Valorous Mail",
			legs="Wisent Kecks",
			feet="Valorous Greaves",
			hands="Nukumi Manoplas +1",
			ammo="Demonry Core",
			neck="Empath Necklace",
			waist="Incarnation Sash",
			ear2="Handler's Earring",
			sub="Digirbalag",
			ring1="Thurandaut Ring",
			back="Pastoralist's Mantle",})

--This will equip for Magical Ready moves like Fireball
	sets.midcast.Pet.MabReady = set_combine(sets.midcast.Pet.WS, {
			main="Skullrender",
			head={ name="Taeon Chapeau", augments={'Pet: "Mag.Atk.Bns."+24',}},
			body={ name="Taeon Tabard", augments={'Pet: "Mag.Atk.Bns."+23','"Fast Cast"+4',}},
			hands={ name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+24',}},
			legs={ name="Acro Breeches", augments={'Pet: Mag. Acc.+24',}},
			feet={ name="Taeon Boots", augments={'Pet: "Mag.Atk.Bns."+24','"Fast Cast"+2',}},
			back="Argocham. Mantle",
			sub={ name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+16','Pet: TP Bonus+180',}},
			ring1="Thurandaut Ring",})
	
	
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1",}
		
	sets.midcast.Pet.ReadyRecast = {sub="Charmer's Merlin",legs="Desultor Tassets",}

      
        
        -- IDLE SETS (TOGGLE between RERAISE and NORMAL with CTRL+F12)
		
		
		-- Base Idle Set (when you do NOT have a pet out)
    sets.idle = {
			main="Kumbhakarna",
			head="Anwig Salade",
			ring2="Succor Ring",
			neck="Empath Necklace",
			ear2="Handler's Earring +1",
			ammo="Demonry Core",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			legs="Nukumi Quijotes +1",
			feet="Skadi's Jambeaux +1",
			ring1="Thurandaut Ring",
			sub="Astolfo",
			back="Pastoralist's Mantle",
			waist="Isa Belt",
			ear1="Handler's Earring",}

			
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	
		-- Idle Set that equips when you have a pet out and not fighting an enemy.
	sets.idle.Pet = set_combine(sets.idle, {
			main="Arktoi",
			ear2="Handler's Earring +1",
			ring2="Succor Ring",
			head="Acro Helm",
			neck="Empath Necklace",
			ammo="Demonry Core",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			legs="Ferine Quijotes +1",
			feet="Acro Leggings",
			ring1="Thurandaut Ring",
			sub="Astolfo",
			back="Pastoralist's Mantle",
			waist="Isa Belt",
			ear1="Handler's Earring",})
		
		-- Idle set that equips when you have a pet out and ARE fighting an enemy.
	sets.idle.Pet.Engaged = set_combine(sets.idle, {
			main="Izizoeksi",
			head="Anwig Salade",
			neck="Empath Necklace",
			ammo="Demonry Core",
			ear2="Handler's Earring +1",
			ring1="Thurandaut Ring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			legs="Nukumi Quijotes +1",
			feet="Acro Leggings",
			sub="Astolfo",
			back="Pastoralist's Mantle",
			waist="Isa Belt",
			ring2="Succor Ring",
			ear1="Handler's Earring",})
        


        -- MELEE (SINGLE-WIELD) SETS
	
	sets.engaged = {
			main="Aymur",
			ammo="Ginsen",
			head={ name="Taeon Chapeau", augments={'Accuracy+23','"Triple Atk."+2',}},
			neck="Asperity Necklace",
			ear1="Handler's Earring",
			body="Nukumi Gausape +1",
			hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			ear2="Handler's Earring +1",
			legs={ name="Taeon Tights", augments={'Accuracy+17 Attack+17','"Triple Atk."+2',}},
			feet={ name="Taeon Boots", augments={'Accuracy+25','"Triple Atk."+2','CHR+9',}},}
			
	sets.engaged.PetDT = {
			main="Odium",
			ammo="Ginsen",
			head={ name="Taeon Chapeau", augments={'Accuracy+23','"Triple Atk."+2',}},
			neck="Asperity Necklace",
			ear1="Handler's Earring",
			body="Nukumi Gausape +1",
			hands={ name="Taeon Gloves", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			ear2="Handler's Earring +1",
			legs={ name="Taeon Tights", augments={'Accuracy+17 Attack+17','"Triple Atk."+2',}},
			feet={ name="Taeon Boots", augments={'Accuracy+25','"Triple Atk."+2','CHR+9',}},}
				
	     -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
		
	sets.engaged.DW = {
			main="Aymur",
			sub="Kumbhakarna",
			head="Taeon Chapeau",
			body="Tot. Jackcoat +1",
			hands="Taeon Gloves",
			legs="Taeon Tights",
			feet="Taeon Boots",
			neck="Asperity Necklace",
			waist="Patentia Sash",
			ear1="Dudgeon Earring",
			ear2="Heartseeker Earring",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",}
			
	sets.engaged.DW.PetDT = {
			main="Malevolence",
			sub="Odium",
			head="Taeon Chapeau",
			body="Tot. Jackcoat +1",
			hands="Taeon Gloves",
			legs="Taeon Tights",
			feet="Taeon Boots",
			neck="Asperity Necklace",
			waist="Patentia Sash",
			ear1="Dudgeon Earring",
			ear2="Heartseeker Earring",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Atheling Mantle",}
	
			
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED -- 
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --
			-- THIS IS THE END OF THE GEARSWAP AS FAR AS YOU SHOULD BE CONCERNED --


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

     
	

-- Define class for Sic and Ready moves.
        if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
                classes.CustomClass = "WS"
		equip(sets.midcast.Pet.ReadyRecast)
        end
end



function job_pet_midcast(spell, action, spellMap, eventArgs)

	equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))
	
-- Equip monster correlation gear, as appropriate
    

	if mab_ready_moves:contains(spell.english) and pet.status == 'Engaged' then
 equip(sets.midcast.Pet.MabReady)
 end
 
	if buffactive['Unleash'] then
                hands="Regimen Mittens"
        end
 
	
 
 		
		
	-- If Pet TP, before bonuses, is less than a certain value, equip Ferine Manoplas +1 or +2
	
        end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)

end

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Correlation Mode' then
		state.CorrelationMode:set(newValue)
	end
end

function get_combat_form()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		state.CombatForm:set('DW')
	else
	     state.CombatForm:reset()
	     end

end


-------------------------------------------------------------------------------------------------------------------
-- Ready Move Presets - Credit to Bomberto
-------------------------------------------------------------------------------------------------------------------

pet_tp=0
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'ready' then
        ready_move(cmdParams)
        eventArgs.handled = true
    end
    if cmdParams[1] == 'pet_tp' then
	    pet_tp = tonumber(cmdParams[2])
    end
end
 
function ready_move(cmdParams)
     local move = cmdParams[2]:lower()
 
     local ReadyMove = ''
     if move == 'one' then
       ReadyMove = ReadyMoveOne
     elseif move == 'two' then
       ReadyMove = ReadyMoveTwo
     else
       ReadyMove = ReadyMoveThree
     end
 
     send_command('input /pet "'.. ReadyMove ..'" <me>')
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', Corr.: '..state.CorrelationMode.value

    if state.JugMode.value ~= 'None' then
        add_to_chat(8,'-- Jug Pet: '.. PetName ..' -- (Pet Info: '.. PetInfo ..', '.. PetJob ..')')
    end

    add_to_chat(28,'Ready Moves: 1.'.. ReadyMoveOne ..'  2.'.. ReadyMoveTwo ..'  3.'.. ReadyMoveThree ..'')
    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function pet_info_update()
    if pet.isvalid then
        PetName = pet.name

        if pet.name == 'DroopyDortwin' or pet.name == 'PonderingPeter' or pet.name == 'HareFamiliar' or pet.name == 'KeenearedSteffi' or pet.name == 'LuckyLulush' then
            PetInfo = "Rabbit, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Foot Kick';ReadyMoveTwo = 'Whirl Claws';ReadyMoveThree = 'Wild Carrot'
        elseif pet.name == 'SunburstMalfik' or pet.name == 'AgedAngus' or pet.name == 'HeraldHenry' or pet.name == 'CrabFamiliar' or pet.name == 'CourierCarrie' then
            PetInfo = "Crab, Aquan";PetJob = 'Paladin';ReadyMoveOne = 'Big Scissors';ReadyMoveTwo = 'Scissor Guard';ReadyMoveThree = 'Bubble Curtain'
        elseif pet.name == 'WarlikePatrick' or pet.name == 'LizardFamiliar' or pet.name == 'ColdbloodedComo' or pet.name == 'AudaciousAnna' then
            PetInfo = "Lizard, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Tail Blow';ReadyMoveTwo = 'Brain Crush';ReadyMoveThree = 'Fireball'
        elseif pet.name == 'ScissorlegXerin' or pet.name == 'BouncingBertha' then
            PetInfo = "Chapuli, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Sensilla Blades';ReadyMoveTwo = 'Tegmina Buffet';ReadyMoveThree = 'Tegmina Buffet'
        elseif pet.name == 'RhymingShizuna' or pet.name == 'SheepFamiliar' or pet.name == 'LullabyMelodia' or pet.name == 'NurseryNazuna' then
            PetInfo = "Sheep, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Lamb Chop';ReadyMoveTwo = 'Rage';ReadyMoveThree = 'Sheep Song'
        elseif pet.name == 'AttentiveIbuki' or pet.name == 'SwoopingZhivago' then
            PetInfo = "Tulfaire, Bird";PetJob = 'Warrior';ReadyMoveOne = 'Swooping Frenzy';ReadyMoveTwo = 'Pentapeck';ReadyMoveThree = 'Molting Plumage'
        elseif pet.name == 'AmiableRoche' or pet.name == 'TurbidToloi' then
            PetInfo = "Pugil, Aquan";PetJob = 'Warrior';ReadyMoveOne = 'Recoil Dive';ReadyMoveTwo = 'Water Wall';ReadyMoveThree = 'Intimidate'
        elseif pet.name == 'BrainyWaluis' or pet.name == 'FunguarFamiliar' or pet.name == 'DiscreetLouise' then
            PetInfo = "Funguar, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Frogkick';ReadyMoveTwo = 'Spore';ReadyMoveThree = 'Silence Gas'              
        elseif pet.name == 'HeadbreakerKen' or pet.name == 'MayflyFamiliar' or pet.name == 'ShellbusterOrob' or pet.name == 'MailbusterCetas' then
            PetInfo = "Fly, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Somersault';ReadyMoveTwo = 'Cursed Sphere';ReadyMoveThree = 'Venom'               
        elseif pet.name == 'RedolentCandi' or pet.name == 'AlluringHoney' then
            PetInfo = "Snapweed, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Tickling Tendrils';ReadyMoveTwo = 'Stink Bomb';ReadyMoveThree = 'Nectarous Deluge'
        elseif pet.name == 'CaringKiyomaro' or pet.name == 'VivaciousVickie' then
            PetInfo = "Raaz, Beast";PetJob = 'Monk';ReadyMoveOne = 'Sweeping Gouge';ReadyMoveTwo = 'Zealous Snort';ReadyMoveThree = 'Zealous Snort'
        elseif pet.name == 'HurlerPercival' or pet.name == 'BeetleFamiliar' or pet.name == 'PanzerGalahad' then
            PetInfo = "Beetle, Vermin";PetJob = 'Paladin';ReadyMoveOne = 'Power Attack';ReadyMoveTwo = 'Rhino Attack';ReadyMoveThree = 'Hi-Freq Field'
        elseif pet.name == 'BlackbeardRandy' or pet.name == 'TigerFamiliar' or pet.name == 'SaberSiravarde' or pet.name == 'GorefangHobs' then
            PetInfo = "Tiger, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Razor Fang';ReadyMoveTwo = 'Claw Cyclone';ReadyMoveThree = 'Roar'
        elseif pet.name == 'ColibriFamiliar' or pet.name == 'ChoralLeera' then
            PetInfo = "Colibri, Bird";PetJob = 'Red Mage';ReadyMoveOne = 'Pecking Flurry';ReadyMoveTwo = 'Pecking Flurry';ReadyMoveThree = 'Pecking Flurry'
        elseif pet.name == 'SpiderFamiliar' or pet.name == 'GussyHachirobe' then
            PetInfo = "Spider, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Sickle Slash';ReadyMoveTwo = 'Acid Spray';ReadyMoveThree = 'Spider Web'
        elseif pet.name == 'GenerousArthur' or pet.name == 'GooeyGerard' then
            PetInfo = "Slug, Amorph";PetJob = 'Warrior';ReadyMoveOne = 'Purulent Ooze';ReadyMoveTwo = 'Corrosive Ooze';ReadyMoveThree = 'Corrosive Ooze'
        elseif pet.name == 'ThreestarLynn' or pet.name == 'DipperYuly' then
            PetInfo = "Ladybug, Vermin";PetJob = 'Thief';ReadyMoveOne = 'Spiral Spin';ReadyMoveTwo = 'Sudden Lunge';ReadyMoveThree = 'Noisome Powder'
        elseif pet.name == 'SharpwitHermes' or pet.name == 'FlowerpotBill' or pet.name == 'FlowerpotBen' or pet.name == 'Homunculus' or pet.name == 'FlowerpotMerle' then
            PetInfo = "Mandragora, Plantoid";PetJob = 'Monk';ReadyMoveOne = 'Head Butt';ReadyMoveTwo = 'Leaf Dagger';ReadyMoveThree = 'Wild Oats'
        elseif pet.name == 'AcuexFamiliar' or pet.name == 'FluffyBredo' then
            PetInfo = "Acuex, Amorph";PetJob = 'Black Mage';ReadyMoveOne = 'Foul Waters';ReadyMoveTwo = 'Pestilent Plume';ReadyMoveThree = 'Pestilent Plume'
        elseif pet.name == 'FlytrapFamiliar' or pet.name == 'VoraciousAudrey' or pet.name == 'PrestoJulio' then
            PetInfo = "Flytrap, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Soporific';ReadyMoveTwo = 'Palsy Pollen';ReadyMoveThree = 'Gloeosuccus'
        elseif pet.name == 'EftFamiliar' or pet.name == 'AmbusherAllie' or pet.name == 'BugeyedBroncha' or pet.name == 'SuspiciousAlice' then
            PetInfo = "Eft, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Nimble Snap';ReadyMoveTwo = 'Cyclotail';ReadyMoveThree = 'Geist Wall'
        elseif pet.name == 'AntlionFamiliar' or pet.name == 'ChopsueyChucky' or pet.name == 'CursedAnnabelle' then
            PetInfo = "Antlion, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Mandibular Bite';ReadyMoveTwo = 'Venom Spray';ReadyMoveThree = 'Sandblast'
        elseif pet.name == 'MiteFamiliar' or pet.name == 'LifedrinkerLars' or pet.name == 'AnklebiterJedd' then
            PetInfo = "Diremite, Vermin";PetJob = 'Dark Knight';ReadyMoveOne = 'Double Claw';ReadyMoveTwo = 'Spinning Top';ReadyMoveThree = 'Filamented Hold'
        elseif pet.name == 'AmigoSabotender' then
            PetInfo = "Cactuar, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Needle Shot';ReadyMoveTwo = '??? Needles';ReadyMoveThree = '??? Needles'
        elseif pet.name == 'CraftyClyvonne' or pet.name == 'BloodclawShashra' then
            PetInfo = "Lynx, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Blaster';ReadyMoveTwo = 'Chaotic Eye';ReadyMoveThree = 'Charged Whisker'
        elseif pet.name == 'SwiftSieghard' or pet.name == 'FleetReinhard' then
            PetInfo = "Raptor, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Scythe Tail';ReadyMoveTwo = 'Ripper Fang';ReadyMoveThree = 'Chomp Rush'
        elseif pet.name == 'DapperMac' or pet.name == 'SurgingStorm' or pet.name == 'SubmergedIyo' then
            PetInfo = "Apkallu, Bird";PetJob = 'Monk';ReadyMoveOne = 'Beak Lunge';ReadyMoveTwo = 'Wing Slap';ReadyMoveThree = 'Wing Slap'
        elseif pet.name == 'FatsoFargann' then
            PetInfo = "Leech, Amorph";PetJob = 'Warrior';ReadyMoveOne = 'Suction';ReadyMoveTwo = 'Acid Mist';ReadyMoveThree = 'Drain Kiss'
        elseif pet.name == 'FaithfulFalcorr' then
            PetInfo = "Hippogryph, Bird";PetJob = 'Thief';ReadyMoveOne = 'Back Heel';ReadyMoveTwo = 'Choke Breath';ReadyMoveThree = 'Fantod'
        elseif pet.name == 'CrudeRaphie' then
            PetInfo = "Adamantoise, Lizard";PetJob = 'Paladin';ReadyMoveOne = 'Tortoise Stomp';ReadyMoveTwo = 'Harden Shell';ReadyMoveThree = 'Aqua Breath'
        elseif pet.name == 'MosquitoFamilia' or pet.name == 'Left-HandedYoko' then
            PetInfo = "Mosquito, Vermin";PetJob = 'Dark Knight';ReadyMoveOne = 'Infected Leech';ReadyMoveTwo = 'Gloom Spray';ReadyMoveThree = 'Gloom Spray'
        end
    else
        PetName = 'None';PetJob = 'None';PetInfo = 'None';ReadyMoveOne = 'None';ReadyMoveTwo = 'None';ReadyMoveThree = 'None'
    end
end

function pet_buff_timer(spell)
    if spell.english == 'Reward' then
        send_command('timers c "Pet: Regen" 180 down '..RewardRegenIcon..'')
    elseif spell.english == 'Spur' then
        send_command('timers c "Pet: Spur" 90 down '..SpurIcon..'')
    elseif spell.english == 'Run Wild' then
        send_command('timers c "'..spell.english..'" '..RunWildDuration..' down '..RunWildIcon..'')
    end
end

function clear_pet_buff_timers()
    send_command('timers c "Pet: Regen" 0 down '..RewardRegenIcon..'')
    send_command('timers c "Pet: Spur" 0 down '..SpurIcon..'')
    send_command('timers c "Run Wild" 0 down '..RunWildIcon..'')
end

function display_mode_info()
    if DisplayModeInfo == 'true' then
        send_command('text AccuracyText create Acc. Mode: Normal')
        send_command('text AccuracyText pos '..TextBoxX..' '..TextBoxY..'')
        send_command('text AccuracyText size '..TextSize..'')
        TextBoxY = TextBoxY + (TextSize + 6)
        send_command('text CorrelationText create Corr. Mode: Neutral')
        send_command('text CorrelationText pos '..TextBoxX..' '..TextBoxY..'')
        send_command('text CorrelationText size '..TextSize..'')
        TextBoxY = TextBoxY + (TextSize + 6)
        send_command('text PetModeText create Pet Mode: PetOnly')
        send_command('text PetModeText pos '..TextBoxX..' '..TextBoxY..'')
        send_command('text PetModeText size '..TextSize..'')
        TextBoxY = TextBoxY + (TextSize + 6)
        send_command('text JugPetText create Jug Mode: Meaty Broth')
        send_command('text JugPetText pos '..TextBoxX..' '..TextBoxY..'')
        send_command('text JugPetText size '..TextSize..'')
    end
end

function update_display_mode_info()
    if DisplayModeInfo == 'true' then
        send_command('text AccuracyText text Acc. Mode: '..state.OffenseMode.value..'')
        send_command('text CorrelationText text Corr. Mode: '..state.CorrelationMode.value..'')
        send_command('text PetModeText text Pet Mode: '..state.PetMode.value..'')
        send_command('text JugPetText text Jug Mode: '..state.JugMode.value..'')
    end
end