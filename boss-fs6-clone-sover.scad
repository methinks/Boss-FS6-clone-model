use <boxes.scad>;
use <screw_holes.scad>;

include <boss-fs6-clone-common.scad>;

coverZ = 2;

bevelX = boxX - wallThickness * 2 - 0.5;
bevelY = boxY - wallThickness * 2 - 0.5;

screwHoleHeight = coverZ + lidBevel;

difference() {
    union() {
        translate([0, 0, coverZ / 2])
        roundedBox([boxX, boxY, coverZ], boxEdgeR, true);
        
        translate([0, 0, coverZ / 2 + coverZ])
        roundedBox([bevelX, bevelY, lidBevel], boxEdgeR, true);
    }
    
    Screw(screwXPos, screwYPos, screwHoleDiameter);
    Screw(-screwXPos, screwYPos, screwHoleDiameter);
    Screw(-screwXPos, -screwYPos, screwHoleDiameter);
    Screw(screwXPos, -screwYPos, screwHoleDiameter);
}

module Screw(screwXPos, screwYPos, screwR) {
    translate([screwXPos, screwYPos, -1])
    color([0.8, 0.5, 0.5])
    cylinder(r=screwR / 2, h=screwHoleHeight + 2);
 
    translate([screwXPos, screwYPos, -1])
    cylinder(r=screwHeadR, h=screwHeadZ + 1);
}