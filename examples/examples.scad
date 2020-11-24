module example_pattern(r) {
    // The octogon
    rotate([0,0,22.5])
        circle(r=r, center=true, $fn=8);

    // The square
    l = 2 * r * sin(22.5);
    translate([r,r,0])
        rotate([0,0,45])
            square([l,l], center=true);
}

module examples() {
    spray_pattern([80,80],[
            [ 10, 0], // For the first move, we will translate on x by two times the radius
            [ 0, 10], // For the second move, we will translate on y by two times the radius
        ])
    example_pattern(5);
    translate([100,0,0])
        honeycombs(d=6,dimensions=[80,80],wall=1);
    lib_help();
}
examples();
