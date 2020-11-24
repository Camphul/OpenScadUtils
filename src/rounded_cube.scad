use <__common/__common.scad>;
use <__common/__logging.scad>;
use <__common/__math.scad>;
use <__common/__points.scad>;
use <__common/__corners.scad>;
use <__common/__testing.scad>;
module rounded_cube(size=[10,10,10], r=2.5, corners=[15/*ALL*/]) {
    assertTrue(is_3d_point(size), "Size must be two dimensional!");
    assertTrue(valid_corners(corners),"Unexpected corner passed");
    module cube_corner(rounded=false) {
        if(!rounded) {
            cube([r*2, r*2, size.z]);
        } else {
            translate([r,r, r])
            union() {
                cylinder(r = r, h = size.z - r * 2);
                translate([0, 0, size.z - r*2])
                    sphere(r = r);
                sphere(r = r);
            }
        }
    }
    hull() {
        hull() {
            //lb
            cube_corner(cornerLeftBottom(corners));
            //rb
            translate([size.x - r*2, 0, 0])
                cube_corner(cornerRightBottom(corners));
        }
        translate([0, size.y - (r * 2), 0])
            hull() {
                //lt
                cube_corner(cornerLeftTop(corners));
                //rt
                translate([size.x-r*2, 0, 0])
                    cube_corner(cornerRightTop(corners));
            }
    }
   // square(size);
}
