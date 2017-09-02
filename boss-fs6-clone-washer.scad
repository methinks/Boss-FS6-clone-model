//rendering config
$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

wallThickness = 2;
jackHole = 9.4;
washerR = jackHole + 3;
washerInnerR = jackHole - 0.2;
properJackHole = 5.7;
outerWasherThickness = 1;

difference() {
    union() {
        cylinder(r=washerR, h=outerWasherThickness);
        translate([0, 0, outerWasherThickness])
        cylinder(r=washerInnerR, h=wallThickness/2);
    }
    
    translate([0, 0, -1])
    cylinder(r=properJackHole, h=wallThickness + 2);
}