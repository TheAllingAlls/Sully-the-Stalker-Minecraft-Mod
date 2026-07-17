scoreboard objectives add sulstalk_stew_timer trigger ""
scoreboard objectives add sulstalk_stew_type trigger ""
scoreboard objectives add sulstalk_stew_last_type trigger ""
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
#   11: Resistance | 2 Illusioners | 3 Minutes
##

execute if items entity @s weapon.* suspicious_stew[custom_name="Sully's Suspicious Stew",item_name="Sully's Suspicious Stew"] run scoreboard players set @s sulstalk_stew_player_holding 1
execute unless items entity @s weapon.* suspicious_stew[custom_name="Sully's Suspicious Stew",item_name="Sully's Suspicious Stew"] if score @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count run scoreboard players set @s sulstalk_stew_player_holding 0
execute if score @s sulstalk_stew_player_holding matches 1 unless score @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count run scoreboard players set @s sulstalk_stew_player_holding 2

execute if score @s sulstalk_stew_player_holding matches 2 if score @s sulstalk_stew_type matches 1.. run scoreboard players set @s sulstalk_stew_timer 0
execute if score @s sulstalk_stew_type matches 1.. run scoreboard players operation @s sulstalk_stew_last_type = @s sulstalk_stew_type
execute if score @s sulstalk_stew_player_holding matches 2 store result score @s sulstalk_stew_type run random value 0..11
execute if score @s sulstalk_stew_player_holding matches 2 if score @s sulstalk_stew_type = @s sulstalk_stew_last_type unless score @s sulstalk_stew_timer matches 1.. store result score @s sulstalk_stew_type run random value 0..11

execute if score @s sulstalk_stew_player_holding matches 2 run scoreboard players operation @s sulstalk_stew_player_used = @s sulstalk_stew_player_used_count











##Stew Functionality
#Stew Type 0
execute if score @s sulstalk_stew_type matches 0 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 0 if score @s sulstalk_stew_timer matches 5900..6000 run title @s actionbar "Fire Resistance, at the cost of half of your Health. Temporary."
execute if score @s sulstalk_stew_type matches 0 unless data entity @s {active_effects:[{id:"minecraft:fire_resistance"}]} run effect give @s fire_resistance 300 255 false
execute if score @s sulstalk_stew_type matches 0 run attribute @s max_health modifier add sulstalk:suspicious_stew_half_hearts -0.5 add_multiplied_total
execute if score @s sulstalk_stew_type matches 0 if score @s sulstalk_stew_timer matches 6000 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 1
execute if score @s sulstalk_stew_type matches 1 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 1 if score @s sulstalk_stew_timer matches 5900..6000 run title @s actionbar "Good Regeneration, at the loss of all your Hunger. Temporary."
execute if score @s sulstalk_stew_type matches 1 unless data entity @s {active_effects:[{id:"minecraft:regeneration"}]} run effect give @s regeneration 300 5 false
execute if score @s sulstalk_stew_type matches 1 unless data entity @s {active_effects:[{id:"minecraft:hunger"}]} run effect give @s hunger 300 100 false
execute if score @s sulstalk_stew_type matches 1 if score @s sulstalk_stew_timer matches 6000 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 2
execute if score @s sulstalk_stew_type matches 2 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 2400
execute if score @s sulstalk_stew_type matches 2 if score @s sulstalk_stew_timer matches 2300..2400 run title @s actionbar "Overpowering Resistance and Jump Boost. Nausea. Temporary."
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:jump_boost"}]} run effect give @s jump_boost 120 3 false
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 120 3 false
execute if score @s sulstalk_stew_type matches 2 unless data entity @s {active_effects:[{id:"minecraft:nausea"}]} run effect give @s nausea 120 0 false
execute if score @s sulstalk_stew_type matches 2 if score @s sulstalk_stew_timer matches 2400 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 3
execute if score @s sulstalk_stew_type matches 3 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 2400
execute if score @s sulstalk_stew_type matches 3 if score @s sulstalk_stew_timer matches 2300..2400 run title @s actionbar "Strength, at the cost of Mining Fatigue. Temporary."
execute if score @s sulstalk_stew_type matches 3 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 120 1 false
execute if score @s sulstalk_stew_type matches 3 unless data entity @s {active_effects:[{id:"minecraft:mining_fatigue"}]} run effect give @s mining_fatigue 120 0 false
execute if score @s sulstalk_stew_type matches 3 if score @s sulstalk_stew_timer matches 2400 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 4
execute if score @s sulstalk_stew_type matches 4 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 4 if score @s sulstalk_stew_timer matches 5900..6000 run title @s actionbar "Resistance, at the cost of Weakness and Slowness. Temporary."
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 300 2 false
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:weakness"}]} run effect give @s weakness 300 1 false
execute if score @s sulstalk_stew_type matches 4 unless data entity @s {active_effects:[{id:"minecraft:slowness"}]} run effect give @s slowness 300 1 false
execute if score @s sulstalk_stew_type matches 4 if score @s sulstalk_stew_timer matches 6000 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 5
execute if score @s sulstalk_stew_type matches 5 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 5 if score @s sulstalk_stew_timer matches 5900..6000 run title @s actionbar "Saturation and Speed, at the cost of some of your Health. Temporary."
execute if score @s sulstalk_stew_type matches 5 unless data entity @s {active_effects:[{id:"minecraft:saturation"}]} run effect give @s saturation 300 1 false
execute if score @s sulstalk_stew_type matches 5 unless data entity @s {active_effects:[{id:"minecraft:speed"}]} run effect give @s speed 300 1 false
execute if score @s sulstalk_stew_type matches 5 run attribute @s max_health modifier add sulstalk:suspicious_stew_three_quarters_hearts -0.25 add_multiplied_total
execute if score @s sulstalk_stew_type matches 5 if score @s sulstalk_stew_timer matches 6000 positioned as @s run playsound minecraft:entity.elder_guardian.ambient ambient @s ~ ~ ~ 100 1 0
#
#Stew Type 6
execute if score @s sulstalk_stew_type matches 6 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 6000
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5900..6000 run title @s actionbar "A village erects, but so does some outposts of the nearby pillagers. They will raid you - fight back with your strength and special shield."
execute if score @s sulstalk_stew_type matches 6 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 300 1 false
execute if score @s sulstalk_stew_type matches 6 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 300 2 false
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 6000 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} run effect give @s bad_omen 1 0 false
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 unless items entity @s container.* shield[enchantments={unbreaking:2,thorns:1},blocks_attacks={disable_cooldown_scale:0}] run give @s shield[enchantments={unbreaking:2,thorns:1},blocks_attacks={disable_cooldown_scale:0,block_sound:"minecraft:item.shield.block"},lore=[{"text":"Cannot be disabled by certain attacks when held up","italic":false,"color":gray}]]
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ plains run place structure village_plains ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ sunflower_plains run place structure village_plains ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ desert run place structure village_desert ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ savanna run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ savanna_plateau run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ windswept_savanna run place structure village_savanna ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ snowy_beach run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ snowy_plains run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ snowy_slopes run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ snowy_taiga run place structure village_snowy ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ taiga run place structure village_taiga ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ old_growth_pine_taiga run place structure village_taiga ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking if biome ~ ~ ~ old_growth_spruce_taiga run place structure village_taiga ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking unless biome ~ ~ ~ plains unless biome ~ ~ ~ sunflower_plains unless biome ~ ~ ~ desert unless biome ~ ~ ~ savanna unless biome ~ ~ ~ savanna_plateau unless biome ~ ~ ~ windswept_savanna unless biome ~ ~ ~ snowy_beach unless biome ~ ~ ~ snowy_plains unless biome ~ ~ ~ snowy_slopes unless biome ~ ~ ~ snowy_taiga unless biome ~ ~ ~ taiga unless biome ~ ~ ~ old_growth_pine_taiga unless biome ~ ~ ~ old_growth_spruce_taiga run place structure village_plains ~ ~ ~
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^ ^ ^-50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^50 ^ ^-50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^-50 ^ ^-50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^ ^ ^50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^50 ^ ^50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5995 positioned as @s positioned over motion_blocking rotated as @s run place structure pillager_outpost ^-50 ^ ^50
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5300 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} positioned as @s rotated as @s run playsound minecraft:event.raid.horn hostile @s ^10 ^ ^10 100 1 0
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5299 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} positioned as @s rotated as @s run playsound minecraft:event.raid.horn hostile @s ^-10 ^ ^10 100 1 0
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5298 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} positioned as @s rotated as @s run playsound minecraft:event.raid.horn hostile @s ^-10 ^ ^-10 100 1 0
execute if score @s sulstalk_stew_type matches 6 if score @s sulstalk_stew_timer matches 5297 unless data entity @s {active_effects:[{id:"minecraft:raid_omen"}]} positioned as @s rotated as @s run playsound minecraft:event.raid.horn hostile @s ^10 ^ ^-10 100 1 0
#
#Stew Type 7
execute if score @s sulstalk_stew_type matches 7 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 3600
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3500..3600 run title @s actionbar "Hostile Endermen teleport towards you. Strength and resistance is given."
execute if score @s sulstalk_stew_type matches 7 unless data entity @s {active_effects:[{id:"minecraft:strength"}]} run effect give @s strength 180 1 false
execute if score @s sulstalk_stew_type matches 7 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 180 2 false
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 run weather clear
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon enderman ~ ~ ~
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=enderman] run data modify entity @s angry_at set from entity @e[distance=..1,type=player,limit=1] UUID
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=enderman] run spreadplayers ~ ~ 5 10 false @s
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3599 positioned as @s as @e[distance=..11,type=enderman] positioned as @s run playsound minecraft:entity.enderman.teleport hostile @s ~ ~ ~ 100 1 0
execute if score @s sulstalk_stew_type matches 7 if score @s sulstalk_stew_timer matches 3598 positioned as @s as @e[distance=..11,type=enderman] positioned as @s run playsound minecraft:entity.enderman.scream hostile @s ~ ~ ~ 100 1 0
#
#Stew Type 8
execute if score @s sulstalk_stew_type matches 8 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 3600
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3500..3600 run title @s actionbar "Poisonous Skeletons arrive. They will not burn in daylight. You are given resistance as defense."
execute if score @s sulstalk_stew_type matches 8 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 180 2 false
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"},head:{count:1,id:"minecraft:leather_helmet"}}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"},head:{count:1,id:"minecraft:leather_helmet"}}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"},head:{count:1,id:"minecraft:leather_helmet"}}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"},head:{count:1,id:"minecraft:leather_helmet"}}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon bogged ~ ~ ~ {equipment:{mainhand:{count:1,id:"minecraft:bow"},head:{count:1,id:"minecraft:leather_helmet"}}}
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=bogged] run spreadplayers ~ ~ 2 5 false @s
execute if score @s sulstalk_stew_type matches 8 if score @s sulstalk_stew_timer matches 3600 positioned as @s run playsound minecraft:entity.bogged.ambient hostile @s ~ ~ ~ 100 1 0
#
#Stew Type 9
execute if score @s sulstalk_stew_type matches 9 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 100
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 1..100 run title @s actionbar "The Deep Dark crawls to you. You are given wool and snowballs to hide and distract."
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 100 unless items entity @s container.* white_wool[count=64] run give @s white_wool 64
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 100 unless items entity @s container.* snowball[count=16] run give @s snowball 16
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 99 positioned as @s run summon warden ~ ~ ~ {Brain:{memories:{"minecraft:is_emerging":{value:{},ttl:100L},"minecraft:dig_cooldown":{value:{},ttl:1200L}}}}
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 98 positioned as @s run summon warden ~ ~ ~ {Brain:{memories:{"minecraft:is_emerging":{value:{},ttl:100L},"minecraft:dig_cooldown":{value:{},ttl:1200L}}}}
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 97 positioned as @s run summon warden ~ ~ ~ {Brain:{memories:{"minecraft:is_emerging":{value:{},ttl:100L},"minecraft:dig_cooldown":{value:{},ttl:1200L}}}}
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 96 positioned as @s as @e[distance=..1,type=warden] run spreadplayers ~ ~ 10 20 false @s
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s run playsound minecraft:entity.warden.emerge hostile @s ~ ~ ~ 100 1 0
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~ ~ ~10
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~ ~ ~
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~ ~ ~-10
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~10 ~ ~
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~10 ~ ~10
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~10 ~ ~-10
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~-10 ~ ~
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~-10 ~ ~10
execute if score @s sulstalk_stew_type matches 9 if score @s sulstalk_stew_timer matches 95 positioned as @s as @e[distance=..20,type=warden] positioned as @s positioned over motion_blocking run place feature sculk_patch_deep_dark ~-10 ~ ~-10
#
#Stew Type 10
execute if score @s sulstalk_stew_type matches 10 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 48000
execute if score @s sulstalk_stew_type matches 10 if score @s sulstalk_stew_timer matches 47990..48000 run title @s actionbar "The time begins shifting... This night will last for twice as long."
execute if score @s sulstalk_stew_type matches 10 positioned as @s as @e[tag=sulstalk_storage,distance=..1] unless score @s sulstalk_daytime_storage matches 14000..23000 run time add 100t
execute if score @s sulstalk_stew_type matches 10 if score @s sulstalk_stew_timer matches 48000 run time pause
execute if score @s sulstalk_stew_type matches 10 if score @s sulstalk_stew_timer matches 48000 run gamerule players_sleeping_percentage 101
#
#Stew Type 11
execute if score @s sulstalk_stew_type matches 11 unless score @s sulstalk_stew_timer matches 1.. run scoreboard players set @s sulstalk_stew_timer 3600
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3500..3600 run title @s actionbar "Illusioners. They turn invisible and attempt to fake you out. Resistance is provided to protect yourself."
execute if score @s sulstalk_stew_type matches 11 unless data entity @s {active_effects:[{id:"minecraft:resistance"}]} run effect give @s resistance 180 2 false
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon illusioner ~ ~ ~
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3600 positioned as @s run summon illusioner ~ ~ ~
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3600 positioned as @s as @e[distance=..1,type=illusioner] run spreadplayers ~ ~ 2 5 false @s
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3599 positioned as @s run playsound minecraft:entity.illusioner.ambient hostile @s ~ ~ ~ 100 1 0
execute if score @s sulstalk_stew_type matches 11 if score @s sulstalk_stew_timer matches 3599 positioned as @s run playsound minecraft:entity.illusioner.prepare_mirror hostile @s ~ ~ ~ 100 1 0
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
execute if score @s sulstalk_stew_timer matches 0 run time resume
execute if score @s sulstalk_stew_timer matches 0 if score @s sulstalk_stew_type matches 10 run time set day
execute if score @s sulstalk_stew_timer matches 0 if score @s sulstalk_stew_last_type matches 10 run time set day
execute if score @s sulstalk_stew_timer matches 0 if score @s sulstalk_stew_type matches 10 run gamerule players_sleeping_percentage 100
execute if score @s sulstalk_stew_timer matches 0 if score @s sulstalk_stew_last_type matches 10 run gamerule players_sleeping_percentage 100
#
#Reset Stew Conditions
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_type
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_timer
execute if score @s sulstalk_stew_timer matches 0 run scoreboard players reset @s sulstalk_stew_effect_timer
#
###