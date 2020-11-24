use <__common.scad>;
include <__init_variables.scad>;

function valid_corners(corners) = len([for(u =corners) if(vect_contains(Positions(), u)) u]) == len(corners);
function Corners(values) = valid_corners(values) ? values : [];


function cornerLeftBottom(corners) = vect_contains(corners, leftbottom) || vect_contains(corners, bottom) || vect_contains(corners, all) || vect_contains(corners, left);
function cornerRightBottom(corners) = vect_contains(corners, rightbottom)|| vect_contains(corners, bottom) || vect_contains(corners, all) ||vect_contains(corners, right);
function cornerBottom(corners) = (vect_contains(corners, leftbottom) && vect_contains(corners, rightbottom))  || vect_contains(corners, all);
function cornerLeftTop(corners) = vect_contains(corners, lefttop)|| vect_contains(corners, top) || vect_contains(corners, all) || vect_contains(corners, left);
function cornerRightTop(corners) = vect_contains(corners, righttop)|| vect_contains(corners, top) || vect_contains(corners, all) ||vect_contains(corners, right);
function cornerTop(corners) = (vect_contains(corners, lefttop) && vect_contains(corners, righttop)) || vect_contains(corners, all);
function cornerNone(corners) = is_empty_list(corners) || vect_contains(corners, none);
function cornerAll(corners) = !is_empty_list(corners) && vect_contains(corners, all);
