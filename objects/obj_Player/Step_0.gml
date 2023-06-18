key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check_pressed(vk_space)
key_jump_hold = keyboard_check(vk_space)

state()
wall_collision(obj_Solid)

x += vect.x
y += vect.y
