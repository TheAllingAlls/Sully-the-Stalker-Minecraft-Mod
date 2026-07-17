execute run scoreboard players set @s sulstalk_following_entity_found 0
execute as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_found 1
execute if score @s sulstalk_following_entity_found matches 0 run scoreboard players set @s sulstalk_following_entity_forget 0

execute as @e[type=player,distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id if data entity @s {abilities:{invulnerable:1b}} run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute as @e[type=!player,distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id if data entity @s {Invulnerable:1b} run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0

execute if score @s sulstalk_following_entity_forget matches 1.. as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes run rotate @e[limit=1,distance=..0.1,tag=sulstalk_spawned] facing ^ ^ ^0.1
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 1000..1200 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.05
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 700..999 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.06
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 500..699 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.07
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 300..499 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.08
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 100..299 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.09
execute unless score @s sulstalk_should_move matches -1 unless score @s sulstalk_special_ability_type matches 0 if score @s sulstalk_following_entity_forget matches 1..99 as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.1
execute if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_following_entity_anger matches ..199 as @e[distance=4.9..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_anger 1
execute if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_following_entity_anger matches ..199 as @e[type=!player,distance=4.9..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_anger 3
execute if score @s sulstalk_following_entity_forget matches 1.. as @e[distance=4.9..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 1
execute if score @s sulstalk_following_entity_forget matches 1.. as @e[type=!player,distance=4.9..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players add @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 4
execute if score @s sulstalk_following_entity_forget matches 1201.. run scoreboard players set @s sulstalk_following_entity_forget 1200
execute unless score @s sulstalk_special_ability_type matches 0.. as @e[distance=5..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.5
execute unless score @s sulstalk_special_ability_type matches 0 as @e[distance=12..50] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.5

execute as @e[type=player,distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id if score @s sulstalk_followed_entity_health matches ..10 run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute as @e[type=!player,distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id if score @s sulstalk_followed_entity_health matches ..200 run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0

execute positioned ~ ~-2 ~ as @e[type=player,distance=..1] positioned ~ ~2 ~ if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id unless data entity @s {active_effects:[{id:"minecraft:poison"}]} run effect give @s poison 1 10 true
execute positioned ~ ~-2 ~ as @e[type=player,distance=..2] positioned ~ ~2 ~ if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id if data entity @s {active_effects:[{id:"minecraft:poison"}]} unless data entity @s {active_effects:[{id:"minecraft:hunger"}]} if score @s sulstalk_followed_entity_health matches ..190 run effect give @s hunger 10 1 true
execute as @e[type=!player,distance=..2] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run damage @s 1 cramming
execute as @e[type=!player,distance=..2] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id unless data entity @s {active_effects:[{id:"minecraft:wither"}]} run effect give @s wither 2 255 false

##Anger & Special Abilities
execute unless score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_is_angry 0
execute unless score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_special_ability_type -1
execute if score @s sulstalk_following_entity_anger matches 199.. run scoreboard players set @s sulstalk_is_angry 1

execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_following_entity_forget matches 1..50 run scoreboard players set @s sulstalk_following_entity_forget 50

execute if score @s sulstalk_is_angry matches 1 unless score @s sulstalk_special_ability_type matches 0.. store result score @s sulstalk_special_ability_type run random value 1..3
execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 0.. run execute if dimension the_nether run scoreboard players set @s sulstalk_special_ability_type 1

##Big Fireball
execute rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 0 run function sulstalk:sully/interactions/entity_to_entity/big_fireball
####

##Blaze Fireballs
execute rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 1 run function sulstalk:sully/interactions/entity_to_entity/blaze_fireballs
####

##Wind Charges
execute rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 2 run function sulstalk:sully/interactions/entity_to_entity/wind_charges
####

##Powder Snowfall
execute rotated as @s run execute if score @s sulstalk_is_angry matches 1 if score @s sulstalk_special_ability_type matches 3 run function sulstalk:sully/interactions/entity_to_entity/powder_snowfall
####

# execute if score @s sulstalk_is_angry matches 1 run scoreboard players set @s sulstalk_following_entity_anger -1
####