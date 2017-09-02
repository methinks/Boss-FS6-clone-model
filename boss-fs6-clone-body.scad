use <boxes.scad>;
use <screw_holes.scad>;

include <boss-fs6-clone-common.scad>;

footswitchHoleDiameter = 12.4;
footswitchHoleRadius = footswitchHoleDiameter/2;
footswitchSideDistance = 30;
footswitchSideOffset = boxX / 2 - wallThickness - footswitchSideDistance;
footswitchBottomDistance = 12;
footswitchBottomOffset = (boxY / 2 - footswitchHoleRadius) - footswitchBottomDistance;

toggleHole = 6.4;
toggleHoleRadius = toggleHole/2;
toggledSideDistance = footswitchSideDistance;
toggleSideOffset = boxX / 2 - wallThickness - toggledSideDistance;
toggleTopDistance = 9;
toggleTopOffset = (boxY / 2 - toggleHoleRadius) - toggleTopDistance;

jackHole = 5.7;
jackTopOffset = boxHeight / 2;
jackSideOffset = boxY / 2;

difference()
{
    //box
    translate([0, 0, boxHeight / 2])
    roundedBox([boxX, boxY, boxHeight], boxEdgeR, true);
    
    //box shallowed
    translate([0, 0, (boxHeight / 2) + wallThickness])
    roundedBox([boxX - wallThickness * 2, boxY - wallThickness * 2, boxHeight], boxEdgeR, true);
    
    //right switch
    translate([footswitchSideOffset, footswitchBottomOffset, -1])
    cylinder(r=footswitchHoleRadius, h=wallThickness+2);
    
    //left switch
    translate([-footswitchSideOffset, footswitchBottomOffset, -1])
    cylinder(r=footswitchHoleRadius, h=wallThickness+2);
    
    //right toggle
    translate([toggleSideOffset, -toggleTopOffset, -1])
    cylinder(r=toggleHoleRadius, h=wallThickness+2);
    
    //left toggle
    translate([-toggleSideOffset, -toggleTopOffset, -1])
    cylinder(r=toggleHoleRadius, h=wallThickness+2);
    
    //jack
    rotate([90, 0, 0])
    translate([0, jackTopOffset, -jackSideOffset - 1])
    cylinder(r=jackHole, h=wallThickness+2);
}

screwHoleHeight = boxHeight - lidBevel;
screwHeight = boxHeight / 2;

Screw(screwXPos, screwYPos, screwTubeR, screwHoleDiameter);
Screw(-screwXPos, screwYPos, screwTubeR, screwHoleDiameter);
Screw(-screwXPos, -screwYPos, screwTubeR, screwHoleDiameter);
Screw(screwXPos, -screwYPos, screwTubeR, screwHoleDiameter);

module Screw(screwXPos, screwYPos, screwOutR, screwDiameter) {
    translate([screwXPos, screwYPos, 0])
    difference() {
        color([0.8, 0.5, 0.5])
        translate([0, 0, 1])
        cylinder(r=screwTubeR, h=screwHoleHeight - 1);
        translate([0, 0, boxHeight - screwHeight])
        cylinder(r=screwHoleDiameter / 2, h=screwHeight + 1);
    }
}