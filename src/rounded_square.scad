use <__common/__common.scad>;
use <__common/__logging.scad>;
use <__common/__math.scad>;
use <__common/__points.scad>;
use <__common/__corners.scad>;
use <__common/__testing.scad>;
module rounded_square(size=[10,10], r=2.5, corners=[15/*ALL*/]) {
    assertTrue(is_2d_point(size), "Size must be two dimensional!");
    assertTrue(valid_corners(corners),"Unexpected corner passed");
    module square_corner(rounded=false) {
        if(!rounded) {
            square([r*2, r*2]);
        } else {
            translate([r,r])
            circle(r=r);
        }
    }
    hull() {
        hull() {
            //lb
            square_corner(cornerLeftBottom(corners));
            //rb
            translate([size.x - r*2, 0, 0])
                square_corner(cornerRightBottom(corners));
        }
        translate([0, size.y - (r * 2), 0])
            hull() {
                //lt
                square_corner(cornerLeftTop(corners));
                //rt
                translate([size.x-r*2, 0, 0])
                    square_corner(cornerRightTop(corners));
            }
    }
}
