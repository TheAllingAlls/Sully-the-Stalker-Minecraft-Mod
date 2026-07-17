scoreboard objectives add sulstalk_nearby_entities trigger ""
scoreboard objectives add sulstalk_should_follow trigger ""
scoreboard objectives add sulstalk_follow_priority trigger ""
scoreboard objectives add sulstalk_followed_entity_id trigger ""
scoreboard objectives add sulstalk_followed_entity_health trigger ""
scoreboard objectives add sulstalk_following_entity_forget trigger ""
scoreboard objectives add sulstalk_following_entity_found trigger ""
scoreboard objectives add sulstalk_is_following_entity trigger ""
scoreboard objectives add sulstalk_following_entity_id trigger ""
scoreboard objectives add sulstalk_is_attacking_entity trigger ""
scoreboard objectives add sulstalk_following_entity_gift_chance trigger ""
scoreboard objectives add sulstalk_following_entity_gift_type trigger ""
scoreboard objectives add sulstalk_following_entity_anger trigger ""
scoreboard objectives add sulstalk_is_angry trigger ""
scoreboard objectives add sulstalk_special_ability_type trigger ""

execute unless score @s sulstalk_nearby_entities matches -1.. run scoreboard players set @s sulstalk_nearby_entities -1
execute unless score @s sulstalk_should_follow matches -1.. run scoreboard players set @s sulstalk_should_follow -1
execute unless score @s sulstalk_follow_priority matches 0.. run scoreboard players set @s sulstalk_follow_priority 0
execute unless score @s sulstalk_following_entity_forget = @s sulstalk_following_entity_forget run scoreboard players set @s sulstalk_following_entity_forget -1
execute unless score @s sulstalk_following_entity_found = @s sulstalk_following_entity_found run scoreboard players set @s sulstalk_following_entity_found -1
execute unless score @s sulstalk_is_following_entity matches -1.. run scoreboard players set @s sulstalk_is_following_entity -1
execute unless score @s sulstalk_following_entity_id = @s sulstalk_following_entity_id run scoreboard players set @s sulstalk_following_entity_id -1
execute unless score @s sulstalk_is_attacking_entity matches -1.. run scoreboard players set @s sulstalk_is_attacking_entity -1
execute unless score @s sulstalk_following_entity_anger matches -1.. run scoreboard players set @s sulstalk_following_entity_anger -1
execute unless score @s sulstalk_is_angry matches 0..1 run scoreboard players set @s sulstalk_is_angry 0
execute unless score @s sulstalk_special_ability_type matches -1..3 run scoreboard players set @s sulstalk_special_ability_type -1

execute unless score @s sulstalk_is_following_entity matches 1 run execute positioned as @s if entity @e[type=!item,type=!experience_orb,tag=!sulstalk_spawned,tag=!sulstalk_hitbox,tag=!sulstalk_storage,distance=..20] store result score @s sulstalk_nearby_entities run execute if entity @e[type=!item,type=!experience_orb,tag=!sulstalk_spawned,tag=!sulstalk_hitbox,tag=!sulstalk_storage,distance=..20,nbt={Invulnerable:0b}]
# execute if score @s sulstalk_is_following_entity matches 1 run execute run scoreboard players set @s sulstalk_nearby_entities -1
# execute if score @s sulstalk_is_following_entity matches 1 run execute run scoreboard players set @s sulstalk_should_follow 0
# execute if score @s sulstalk_nearby_entities matches 10.. positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..10]
# execute if score @s sulstalk_nearby_entities matches 5..9 positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..5]
# execute if score @s sulstalk_nearby_entities matches 1..4 positioned as @s store result score @s sulstalk_nearby_entities run execute if entity @e[distance=0.5..2]

execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_is_following_entity 0
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_id -1
execute if score @s sulstalk_following_entity_forget matches 0 run data modify entity @s data.following_entity_id set value -1
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_should_follow 0
execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_anger -1
# execute if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_forget -1

execute if score @s sulstalk_underwater matches 4 run scoreboard players set @s sulstalk_following_entity_forget 0

execute if score @s sulstalk_follow_priority matches 6 store result score @s sulstalk_should_follow run random value 1..2

execute unless score @s sulstalk_should_follow matches 1 run execute unless score @s sulstalk_is_following_entity matches 1 run execute unless score @s sulstalk_follow_priority matches 5 if score @s sulstalk_nearby_entities matches 1.. store result score @s sulstalk_should_follow run random value 1..200
execute unless score @s sulstalk_should_follow matches 1 run execute if score @s sulstalk_nearby_entities matches 10.. run scoreboard players set @s sulstalk_follow_priority 1
execute unless score @s sulstalk_should_follow matches 1 run execute if score @s sulstalk_nearby_entities matches 5..9 run scoreboard players set @s sulstalk_follow_priority 2
execute unless score @s sulstalk_should_follow matches 1 run execute if score @s sulstalk_nearby_entities matches 3..4 run scoreboard players set @s sulstalk_follow_priority 3
execute unless score @s sulstalk_should_follow matches 1 run execute if score @s sulstalk_nearby_entities matches 1..2 run scoreboard players set @s sulstalk_follow_priority 4
execute unless score @s sulstalk_should_follow matches 1 run execute positioned as @s if entity @e[distance=..5,type=player,nbt={abilities:{invulnerable:0b}}] run scoreboard players set @s sulstalk_follow_priority 5
execute unless score @s sulstalk_should_follow matches 1 run execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_follow_priority matches 5 store result score @s sulstalk_should_follow run random value 1..100

execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_following_entity_forget matches 0 run scoreboard players set @s sulstalk_following_entity_forget -1
execute if score @s sulstalk_is_following_entity matches 1 run execute unless score @s sulstalk_following_entity_id matches -1 if score @s sulstalk_following_entity_forget matches -1 store result score @s sulstalk_following_entity_forget run random value 400..1200
execute if score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_following_entity_forget matches 1.. run scoreboard players remove @s sulstalk_following_entity_forget 1

##Health stored in score is multiplied by 100 to account for decimals sneaking in, therefore 20 hp is 2000
execute positioned as @s as @e[type=!item,type=!experience_orb,tag=!sulstalk_spawned,tag=!sulstalk_hitbox,distance=..30] if data entity @s Health store result score @s sulstalk_followed_entity_health run data get entity @s Health 100

execute positioned as @s as @e[distance=..20,type=!item,type=!experience_orb,tag=!sulstalk_spawned,tag=!sulstalk_hitbox] if score @s sulstalk_followed_entity_health = @s sulstalk_followed_entity_health unless predicate {condition:entity_scores,entity:this,scores:{sulstalk_followed_entity_id:{}}} store result score @s sulstalk_followed_entity_id run data get entity @s UUID[0]

execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_follow_priority matches 1 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=random,limit=1,distance=..20,scores={sulstalk_followed_entity_id=-2147483647..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_follow_priority matches 2 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=nearest,limit=1,distance=..10,scores={sulstalk_followed_entity_id=-2147483647..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_follow_priority matches 3 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=random,limit=1,distance=..5,scores={sulstalk_followed_entity_id=-2147483647..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_follow_priority matches 4 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[sort=nearest,limit=1,distance=..2,scores={sulstalk_followed_entity_id=-2147483647..}] UUID[0]
execute unless score @s sulstalk_is_following_entity matches 1 run execute if score @s sulstalk_should_follow matches 1 if score @s sulstalk_follow_priority matches 5..6 positioned as @s store result score @s sulstalk_following_entity_id run data get entity @e[type=player,nbt={abilities:{invulnerable:0b}},sort=nearest,limit=1,distance=..20,scores={sulstalk_followed_entity_id=-2147483647..}] UUID[0]
execute if predicate {condition:entity_scores,entity:this,scores:{sulstalk_following_entity_id:{}}} store result entity @s data.following_entity_id int 1 run scoreboard players get @s sulstalk_following_entity_id

execute positioned as @s as @e[distance=..100] if score @s sulstalk_followed_entity_id = @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_following_entity_id run scoreboard players set @e[limit=1,distance=..0.1,tag=sulstalk_spawned] sulstalk_is_following_entity 1

execute positioned as @s rotated as @s if score @s sulstalk_is_following_entity matches 1 run function sulstalk:sully/interactions/entity_to_entity/entity_follow_logic