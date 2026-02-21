// movement
var _vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));

y += _vertical;
x += _horizontal;