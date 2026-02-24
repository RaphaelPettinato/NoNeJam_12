// Inherit the parent event
event_inherited();

var _player_life = other.player_life;

if (_player_life > 0 and _player_life < 3) 
{
    other.player_life++;
}