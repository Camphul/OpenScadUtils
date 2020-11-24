use<__common.scad>;
function Point(x,y,z=undef) = z == undef ? [x, y] : [x, y, z];
function Size(x,y,z=undef) =  z == undef ? [x, y] : [x, y, z];
/* if point is valid 2d point*/
function is_2d_point(point) = (is_num_list(point) && len(point) == 2) ? true : false;
/* if point is valid 3d point*/
function is_3d_point(point) = (is_num_list(point) && len(point) == 3) ? true : false;
function is_valid_point(point) = is_num_list(point) && 2 >= len(point) <= 3;

module validate_point(point) {
    assert(is_valid_point, "Invalid datatype for passed point(not a vector with 2 or 3 number elements)");
}
