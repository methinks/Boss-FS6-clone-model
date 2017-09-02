use <boxes.scad>;
use <screw_holes.scad>;

include <boss-fs6-clone-common.scad>;

footswitchHoleDiameter = 12.4;
footswitchHoleRadius = footswitchHoleDiameter/2;
footswitchSideDistance = 18;
footswitchSideOffset = boxX / 2 - wallThickness - footswitchSideDistance;
footswitchBottomDistance = boxY /2 - footswitchHoleRadius;
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
    rotate([90, 0, 0])
    translate([toggleSideOffset, jackTopOffset, -jackSideOffset - 1])
    cylinder(r=toggleHoleRadius, h=wallThickness+2);
    
    //left toggle
    rotate([90, 0, 0])
    translate([-toggleSideOffset, jackTopOffset, -jackSideOffset - 1])
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

separatorWidth = 2;
separatorLength = boxY - wallThickness;
separatorHeight = boxHeight - wallThickness - lidBevel;
jackCompartmentWidth = 28;
compartmentCablesApertureZ = 7;
compartmentCablesApertureY = 15;
compartmentOffset = jackCompartmentWidth / 2 + separatorWidth / 2;

Separator(jackCompartmentWidth / 2);
Separator(-jackCompartmentWidth / 2);

module Separator(x) {
    translate([x, 0, 0])
    difference() {
        translate([-separatorWidth/2, -separatorLength / 2, wallThickness])
        cube([separatorWidth, separatorLength, separatorHeight]);
        
        rotate([0, 90, 0])
        translate([-separatorHeight - 2, 0, 0])
        roundedBox([compartmentCablesApertureZ, compartmentCablesApertureY, separatorWidth + 2], boxEdgeR, true);
    }
}