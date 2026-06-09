execute unless data entity @s data.attacker_id run data modify entity @s data.attacker_id set value -1
function sulstalk:sully/interactions/physical/hitbox with entity @s data
execute unless data entity @s data.following_entity_id run data modify entity @s data.following_entity_id set value -1
function sulstalk:sully/interactions/entity_to_entity/entity_logic with entity @s data
function sulstalk:sully/interactions/entity_to_entity/reset_rotation

function sulstalk:sully/interactions/die_in_void
function sulstalk:sully/interactions/water
function sulstalk:sully/interactions/create_pure_light
function sulstalk:sully/interactions/destroy
function sulstalk:sully/interactions/consume_cake
function sulstalk:sully/interactions/silence_jukebox
function sulstalk:sully/interactions/place_obsidian
function sulstalk:sully/interactions/drop_fire_charge
function sulstalk:sully/interactions/launched_by_firework
function sulstalk:sully/interactions/pick_up_items with entity @s data
#function sulstalk:sully/interactions/trail
#function sulstalk:sully/interactions/trail2
function sulstalk:sully/interactions/trail3