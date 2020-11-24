use <__common/__points.scad>;

//https://github.com/nmasse-itix/OpenSCAD-Pattern-Filling
module spray_pattern(size, move_patterns) {
    assert(is_valid_point(size), "Invalid dimensions given");
    assert(is_2d_point(size), "Size must be two dimensional!");
    xn = floor(size.x / move_patterns[0].x);
    yn = floor(size.y / move_patterns[1].y);
    for (y = [0:1:yn]) {
        for (x = [0:1:xn]) {
            move = [x, y] * move_patterns;
            complement = [
                    move.x >= 0 && move.x <= size.x ? 0 : -(xn + 1) * floor(move.x / ((xn + 1) * move_patterns[0].x)),
                    move.y >= 0 && move.y <= size.y ? 0 : -(xn + 1) * floor(move.y / ((xn + 1) * move_patterns[0].y))
                ];
            adjusted_move = ([x, y] + complement) * move_patterns;
            translate(adjusted_move)
                children();
        }
    }
}
