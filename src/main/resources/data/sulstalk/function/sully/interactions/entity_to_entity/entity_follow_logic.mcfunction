$execute positioned as @s store success score @s sulstalk_following_entity_found run execute if entity @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1]
execute positioned as @s if score @s sulstalk_following_entity_found matches 0 run scoreboard players set @s sulstalk_following_entity_forget 0

$execute positioned as @s run execute as @e[type=player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] if data entity @s {abilities:{invulnerable:1b}} run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 0
$execute positioned as @s run execute as @e[type=!player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] if data entity @s {Invulnerable:1b} run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 0

$execute run execute if score @s sulstalk_following_entity_forget matches 1.. positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100] facing entity @s eyes run rotate @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] facing ^ ^ ^0.1
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 1000..1200 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.05
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 700..999 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.06
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 500..699 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.07
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 300..499 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.08
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 100..299 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.09
$execute run execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 1..99 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.1
$execute run execute if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_following_entity_anger matches ..199 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},limit=1,distance=4.9..50] run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_anger 1
$execute run execute if score @s sulstalk_following_entity_forget matches 1.. positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},limit=1,distance=4.9..50] run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 1
$execute run execute if score @s sulstalk_following_entity_forget matches 1.. positioned as @s as @e[type=!player,scores={sulstalk_followed_entity_id=$(following_entity_id)},limit=1,distance=4.9..50] run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 4
$execute run execute unless score @s sulstalk_special_ability_type matches 0.. positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},limit=1,distance=5..50] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.5
$execute run execute unless score @s sulstalk_special_ability_type matches 0 positioned as @s as @e[scores={sulstalk_followed_entity_id=$(following_entity_id)},limit=1,distance=12..50] facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] ^ ^ ^0.5

$execute positioned as @s run execute as @e[type=player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] if score @s sulstalk_followed_entity_health matches ..10 run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 0
$execute positioned as @s run execute as @e[type=!player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] if score @s sulstalk_followed_entity_health matches ..200 run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_forget 0

$execute run execute as @e[type=player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] unless data entity @s {active_effects:[{id:"minecraft:poison"}]} positioned as @s positioned ~ ~2 ~ if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..1,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_id run effect give @s poison 1 10 true
$execute run execute as @e[type=player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] if data entity @s {active_effects:[{id:"minecraft:poison"}]} unless data entity @s {active_effects:[{id:"minecraft:darkness"}]} if score @s sulstalk_followed_entity_health matches ..190 positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_id run effect give @s darkness 10 1 true
$execute run execute as @e[type=!player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] positioned as @s positioned ~ ~ ~ if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_id run damage @s 1 cramming
$execute run execute as @e[type=!player,scores={sulstalk_followed_entity_id=$(following_entity_id)},distance=..100,limit=1] unless data entity @s {active_effects:[{id:"minecraft:wither"}]} positioned as @s positioned ~ ~ ~ if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] sulstalk_following_entity_id run effect give @s wither 2 255 false

##Anger & Special Abilities
execute run execute unless score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_is_angry 0
execute run execute unless score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_special_ability_type -1
execute run execute if score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_is_angry 1

execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_following_entity_forget matches 1..50 run scoreboard players set @s sulstalk_following_entity_forget 50

execute run execute if score @s sulstalk_is_angry matches 1 unless score @s sulstalk_special_ability_type matches 0.. store result score @s sulstalk_special_ability_type run random value 1..3
execute run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 0.. run execute if dimension the_nether run scoreboard players set @s sulstalk_special_ability_type 1

##Big Fireball
execute positioned as @s rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 0 run function sulstalk:sully/interactions/entity_to_entity/big_fireball
####

##Blaze Fireballs
execute positioned as @s rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 1 run function sulstalk:sully/interactions/entity_to_entity/blaze_fireballs
####

##Wind Charges
execute positioned as @s rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 2 run function sulstalk:sully/interactions/entity_to_entity/wind_charges
####

##Powder Snowfall
execute positioned as @s rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 3 run function sulstalk:sully/interactions/entity_to_entity/powder_snowfall
####

# execute if score @s sulstalk_is_angry matches 1 run scoreboard players set @s sulstalk_following_entity_anger -1
####