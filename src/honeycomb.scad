use <__common/__common.scad>;
use <__common/__logging.scad>;
use <__common/__math.scad>;
use <__common/__points.scad>;
use <hexagon.scad>;

/*honeycombs*/
module honeycombs(d=6, dimensions=[100,100,1],wall=1, inverse=false) {
    assert(is_valid_point(dimensions), "Invalid dimensions given");
    dimension_x = dimensions[0];
    dimension_y = dimensions[1];
    spacing = cos(60) * d + wall;
    comb_r = d/2;
    dbg(["Dimensions X:", dimension_x, " Y: ", dimension_y]);
    module honeycomb() {
        hexagon2d(d=d);
    }
    /* xy row of honeycombs*/
    module combs_xy() {
        angled_spacing = spacing * cos(30);
        angled_r = comb_r*cos(30);
        y_step = angled_r +  spacing;
        x_step = comb_r*3/2 + angled_spacing*2;
        for(y_offset = [0 : y_step : dimension_y + y_step], x_offset=[0 : x_step : dimension_x + x_step]) {
            translate([x_offset, y_offset]) {
                honeycomb();
            }
            translate([x_offset + comb_r*3/4 + angled_spacing, y_offset + (angled_r + spacing)/2]) {
                honeycomb();
            }
        }
    }
    module combs_xy_correct_inversion() {
        if(inverse) {
            combs_xy();
        } else {
            difference() {
                square([dimension_x, dimension_y]);
                combs_xy();
            }
        }
    }
    if(is_2d_point(dimensions)) {
        //2D
        combs_xy_correct_inversion();
    } else {
        //3D
        dimension_z = dimensions.z;
        linear_extrude(dimension_z)
            combs_xy_correct_inversion();
    }
}
