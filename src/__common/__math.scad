FLOOR=1;//floor rounding
CEIL=2;//ceiling rounding
Rounding = [FLOOR,CEIL];
/* round number either with FLOOR or CEIL as method */
function round_number(value,method) = method == FLOOR ? floor(value) : (method == CEIL? ceil(value) : value);

/* radius to diameter */
function r_to_d(r) = r*2;
/* diameter to radius */
function d_to_r(d) = d/2;
