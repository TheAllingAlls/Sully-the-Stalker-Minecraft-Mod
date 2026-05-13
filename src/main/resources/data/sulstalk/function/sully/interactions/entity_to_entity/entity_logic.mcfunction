scoreboard objectives add sulstalk_nearby_entities trigger ""
scoreboard objectives add sulstalk_should_follow trigger ""
scoreboard objectives add sulstalk_follow_priority trigger ""
scoreboard objectives add sulstalk_followed_entity_id trigger ""
scoreboard objectives add sulstalk_following_entity_forget trigger ""
scoreboard objectives add sulstalk_is_following_entity trigger ""
scoreboard objectives add sulstalk_following_entity_id trigger ""
scoreboard objectives add sulstalk_is_attacking_entity trigger ""

execute unless score @s sulstalk_nearby_entities matches -1.. run scoreboard players set @s sulstalk_nearby_entities -1
execute unless score @s sulstalk_should_follow matches -1.. run scoreboard players set @s sulstalk_should_follow -1
execute unless score @s sulstalk_follow_priority matches 0.. run scoreboard players set @s sulstalk_follow_priority 0
execute unless score @s sulstalk_following_entity_forget matches -1.. run scoreboard players set @s sulstalk_following_entity_forget -1
execute unless score @s sulstalk_is_following_entity matches -1.. run scoreboard players set @s sulstalk_is_following_entity -1
execute unless score @s sulstalk_following_entity_id matches -999999999..999999999 run scoreboard players set @s sulstalk_following_entity_id -1
execute unless score @s sulstalk_is_attacking_entity matches -1.. run scoreboard players set @s sulstalk_is_attacking_entity -1

execute unless score @s sulstalk_is_following_entity matches 1 positioned as @s if entity @e[type=!item,tag=!sulstalk_spawned,tag=!sulstalk_hitbox,tag=!sulstalk_storage,distance=..20] store result score @s sulstalk_nearby_entities run execute if entity @e[type=!item,tag=!sulstalk_spawned,tag=!sulstalk_hitbox,tag=!sulstalk_storage,distance=..20,nbt={Invulnerable:0b}]
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_nearby_entities -1
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_should_follow 0
# execute if score @s sulstalk_nearby_entities matches 10.. positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..10]
# execute if score @s sulstalk_nearby_entities matches 5..9 positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..5]
# execute if score @s sulstalk_nearby_entities matches 1..4 positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..2]

execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_is_following_entity 0
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_id -1
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_should_follow 0
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_forget -1

execute unless score @s sulstalk_should_follow matches 1 unless score @s sulstalk_is_following_entity matches 1 unless score @s sulstalk_follow_priority matches 5 if score @s sulstalk_nearby_entities matches 1.. store result score @s sulstalk_should_follow run random value 1..200
execute unless score @s sulstalk_should_follow matches 1 run scoreboard players set @s sulstalk_follow_priority 0
execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_nearby_entities matches 10.. run scoreboard players set @s sulstalk_follow_priority 1
execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_nearby_entities matches 5..9 run scoreboard players set @s sulstalk_follow_priority 2
execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_nearby_entities matches 3..4 run scoreboard players set @s sulstalk_follow_priority 3
execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_nearby_entities matches 1..2 run scoreboard players set @s sulstalk_follow_priority 4
execute unless score @s sulstalk_should_follow matches 1 positioned as @s if entity @e[distance=..5,type=player,nbt={abilities:{invulnerable:0b}}] run scoreboard players set @s sulstalk_follow_priority 5
execute unless score @s sulstalk_should_follow matches 1 unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 5 store result score @s sulstalk_should_follow run random value 1..100

execute if score @s sulstalk_is_following_entity matches 1 unless score @s sulstalk_following_entity_forget matches 1.. store result score @s sulstalk_following_entity_forget run random value 200..1200
execute if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 1.. run scoreboard players remove @s sulstalk_following_entity_forget 1

execute if score @s sulstalk_follow_priority matches 6 run scoreboard players set @s sulstalk_should_follow 1
execute if score @s sulstalk_follow_priority matches 6 run tellraw @a "NO"

execute positioned as @s as @e[limit=1,distance=..20,type=!item,tag=!sulstalk_spawned,tag=!sulstalk_hitbox] if data entity @s Health unless score @s sulstalk_followed_entity_id matches -999999999.. store result score @s sulstalk_followed_entity_id run data get entity @s UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 1 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=random,limit=1,distance=..20,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 2 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=nearest,limit=1,distance=..10,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 3 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=random,limit=1,distance=..5,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 4 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=nearest,limit=1,distance=..2,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_follow_priority matches 5 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[type=player,nbt={abilities:{invulnerable:0b}},sort=nearest,limit=1,distance=..20,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]
execute if score @s sulstalk_follow_priority matches 6 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[type=player,nbt={abilities:{invulnerable:0b}},sort=nearest,limit=1,distance=..20,scores={sulstalk_followed_entity_id=-999999999..}] UUID[0]

execute positioned as @s as @e[scores={sulstalk_followed_entity_id=-999999999..}] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_is_following_entity 1
execute positioned as @s as @e[type=player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {abilities:{invulnerable:1b}} if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute positioned as @s as @e[type=!player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {Invulnerable:1b} if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute if score @s sulstalk_is_following_entity matches 1 positioned as @s as @e[scores={sulstalk_followed_entity_id=-999999999..}] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id facing entity @s eyes rotated ~ ~-5 run tp @e[limit=1,distance=..0.1,tag=sulstalk_spawned] ^ ^ ^0.1
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=player,scores={sulstalk_followed_entity_id=-999999999..}] unless data entity @s {active_effects:[{id:"minecraft:poison"}]} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned] sulstalk_following_entity_id run effect give @s poison 1 10 true
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {active_effects:[{id:"minecraft:poison"}]} unless data entity @s {active_effects:[{id:"minecraft:darkness"}]} if data entity @s {Health:1.0f} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned] sulstalk_following_entity_id run effect give @s darkness 10 1 true
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {Health:0.0f} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=!player,scores={sulstalk_followed_entity_id=-999999999..}] unless data entity @s {active_effects:[{id:"minecraft:wither"}]} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..2,tag=sulstalk_spawned] sulstalk_following_entity_id run effect give @s wither 1 10 false
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=!player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {Health:1.0f} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
execute if score @s sulstalk_is_following_entity matches 1 as @e[type=!player,scores={sulstalk_followed_entity_id=-999999999..}] if data entity @s {Health:0.0f} positioned as @s if score @s sulstalk_followed_entity_id = @e[limit=1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_forget 0
