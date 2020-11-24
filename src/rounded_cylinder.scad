use <__common/__common.scad>;
use <__common/__logging.scad>;
use <__common/__math.scad>;
use <__common/__points.scad>;
use <__common/__corners.scad>;
use <__common/__testing.scad>;
module rounded_cylinder(d=undef, r=undef, h=10) {
    assertFalse(d == r && d == undef,"Expected r or d to be present");
    c_d = 10;
    if(d == undef && r != undef) {
        c_d = r*2;
    } else if (d != undef && r == undef) {
        c_d = d;
    } else if (d != undef && r != undef) {
        //radius has priority
        c_d = r*2;
    }
    dbg(["Using diameter: ", c_d]);
    translate([0,0,c_d/2])
    hull() {
        sphere(d = c_d);
        translate([0, 0, h - c_d])
            sphere(d = c_d);
    }
}
