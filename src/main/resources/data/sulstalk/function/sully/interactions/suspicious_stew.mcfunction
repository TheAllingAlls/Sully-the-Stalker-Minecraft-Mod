scoreboard objectives add sulstalk_stew_timer trigger ""
scoreboard objectives add sulstalk_stew_type trigger ""
scoreboard objectives add sulstalk_stew_player_holding trigger ""
scoreboard objectives add sulstalk_stew_player_used_count minecraft.used:minecraft.suspicious_stew ""
scoreboard objectives add sulstalk_stew_player_used dummy ""

execute unless score @s sulstalk_stew_player_holding matches 0..1 run scoreboard players set @s sulstalk_stew_player_holding 0
execute unless score @s sulstalk_stew_player_used = @s sulstalk_stew_player_used run scoreboard players operation @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count

##STEW TYPES: BUFF | DEBUFF | TIME
#   0: Fire Resistance | Half Hearts | 5 Minutes
#   1: Regeneration | Max Hunger | 5 Minutes
#   2: Jump Boost & Resistance | Nausea | 2 Minutes | 30 Seconds
#   3: Strength | Mining Fatigue | 2 Minutes
#   4: Resistance | Weakness & Slowness | 5 Minutes
#   5: Saturation & Speed | Three-Quarters Hearts | 5 Minutes
#   6: Strength & Resistance & Shield (Unbreaking 2, No Block Cooldown) | Pillager Raid Spawn | 5 Minutes
#   7: Strength & Resistance | 3 Angry Endermen | 3 Minutes
#   8: Resistance | 5 Bogged | 3 Minutes
#   9: 64 Blocks of Wool & 16 Snowballs | 3 Wardens & Place Sculk Patches (Deep Dark) | N/A
#   10: Nothing | Time is set to Night & Time Stops | 2 Days
##

execute if items entity @s weapon.* suspicious_stew[custom_name="Sully's Suspicious Stew",item_name="Sully's Suspicious Stew"] run scoreboard players set @s sulstalk_stew_player_holding 1
execute unless items entity @s weapon.* suspicious_stew[custom_name="Sully's Suspicious Stew",item_name="Sully's Suspicious Stew"] if score @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count run scoreboard players set @s sulstalk_stew_player_holding 0
execute if score @s sulstalk_stew_player_holding matches 1 unless score @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count run scoreboard players set @s sulstalk_stew_player_holding 2

# execute if score @s sulstalk_stew_player_holding matches 2 store result score @s sulstalk_stew_type run random value 0..10
execute if score @s sulstalk_stew_player_holding matches 2 run scoreboard players set @s sulstalk_stew_type 8

execute if score @s sulstalk_stew_player_holding matches 2 run scoreboard players operation @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count











##Stew Functionality
#Stew Type 0
execute if score @s sulstalk_stew_type matches 0 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 0 unless data entity @s {active_effects:[{id:"minecraft:fire_resistance"}]} run effect give @s fire_resistance 300 255 false
execute if score @s sulstalk_stew_type matches 0 run attribute @s max_health modifier add sulstalk:suspicious_stew_half_hearts -0.5 add_multiplied_total
#
#Stew Type 1
execute if score @s sulstalk_stew_type matches 1 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 1 unless data entity @s {active_effects:[{id:"minecraft:regeneration"}]} run effect give @s regeneration 300 5 false
execute if score @s sulstalk_stew_type matches 1 unless data entity @s {active_effects:[{id:"minecraft:hunger"}]} run effect give @s hunger 300 100 false
#
#Stew Type 2
execute if score @s sulstalk_stew_type matches 2 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 2400
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:jump_boost"}]} run effect give @s jump_boost 120 3 false
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 120 10 false
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:nausea"}]} run effect give @s nausea 30 0 false
#
#Stew Type 3
execute if score @s sulstalk_stew_type matches 3 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 2400
execute if score @s sulstalk_stew_type matches 3 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 120 1 false
execute if score @s sulstalk_stew_type matches 3 unless data entity @s {active_effects:[{id:"minecraft:mining_fatigue"}]} run effect give @s mining_fatigue 120 0 false
#
#Stew Type 4
execute if score @s sulstalk_stew_type matches 4 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 300 2 false
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:weakness"}]} run effect give @s weakness 300 1 false
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:slowness"}]} run effect give @s slowness 300 1 false
#
#Stew Type 5
execute if score @s sulstalk_stew_type matches 5 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 5 unless data entity @s {active_effects:[{id:"minecraft:saturation"}]} run effect give @s saturation 300 1 false
execute if score @s sulstalk_stew_type matches 5 unless data entity @s {active_effects:[{id:"minecraft:speed"}]} run effect give @s speed 300 1 false
execute if score @s sulstalk_stew_type matches 5 run attribute @s max_health modifier add sulstalk:suspicious_stew_three_quarters_hearts -0.25 add_multiplied_total
#
#Stew Type 6
execute if score @s sulstalk_stew_type matches 6 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 6 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 300 1 false
execute if score @s sulstalk_stew_type matches 6 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 300 2 false
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 6000 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} run effect give @s raid_omen 10 5 false
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 unless items entity @s container.* shield[enchantments={unbreaking:2,thorns:1},blocks_attacks={disable_cooldown_scale:0}] run give @s shield[enchantments={unbreaking:2,thorns:1},blocks_attacks={disable_cooldown_scale:0,block_sound:"minecraft:item.shield.block"}]
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ plains run place structure village_plains ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ sunflower_plains run place structure village_plains ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ desert run place structure village_desert ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ savanna run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ savanna_plateau run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ windswept_savanna run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ snowy_beach run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ snowy_plains run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ snowy_slopes run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ snowy_taiga run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ taiga run place structure village_taiga ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ old_growth_pine_taiga run place structure village_taiga ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5990 if biome ~ ~ ~ old_growth_spruce_taiga run place structure village_taiga ~ ~ ~
#
#Stew Type 7
execute if score @s sulstalk_stew_type matches 7 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 3600
execute if score @s sulstalk_stew_type matches 7 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 180 1 false
execute if score @s sulstalk_stew_type matches 7 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 180 2 false
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=enderman] run data modify entity @s angry_at set from entity @e[distance=..1,type=player,limit=1] UUID
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=enderman] run spreadplayers ~ ~ 5 10 false @s
#
#Stew Type 8
execute if score @s sulstalk_stew_type matches 8 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 3600
execute if score @s sulstalk_stew_type matches 8 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 180 2 false
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"}},head:{count:1,id:"minecraft:leather_helmet"}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"}},head:{count:1,id:"minecraft:leather_helmet"}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"}},head:{count:1,id:"minecraft:leather_helmet"}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=bogged] run spreadplayers ~ ~ 2 5 false @s
#
#Stew Type 9
execute if score @s sulstalk_stew_type matches 9
#
#Stew Type 10
execute if score @s sulstalk_stew_type matches 10
#


#Timer Countdown
execute if score @s sulstalk_stew_timer matches 1.. run scoreboard players remove @s sulstalk_stew_timer 1
#
#Remove Stew Effects
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s fire_resistance
execute if score @s sulstalk_stew_timer matches 0 run attribute @s max_health modifier remove sulstalk:suspicious_stew_half_hearts
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s regeneration
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s hunger
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s jump_boost
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s resistance
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s nausea
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s strength
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s mining_fatigue
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s weakness
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s slowness
execute if score @s sulstalk_stew_timer matches 0 run effect clear @s speed
execute if score @s sulstalk_stew_timer matches 0 run attribute @s max_health modifier remove sulstalk:suspicious_stew_three_quarters_hearts
#
#Reset Stew Conditions
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_type
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_timer
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_effect_timer
#
##