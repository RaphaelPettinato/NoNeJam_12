if (eye_life == 0 and !closed) {
    image_speed = 1;
    closed = true;
    alarm[0] = 10 * 60;
};

if (image_index == 3) {
    image_index = 3;
    image_speed = 0;
};