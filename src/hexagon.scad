/*hexagon with diameter d and height h*/
module hexagon2d(d=10) {
    circle(d=d, $fn=6/*6 since we want hexagons*/);
}
module hexagon3d(d=10, h=10) {
    circle(d=d, $fn=6/*6 since we want hexagons*/);
}
module hexagon(d=10, h=undef) {
    if(h != undef) {
        hexagon2d(d=d, h=h);
    } else {
        hexagon2d(d);
    }
}
