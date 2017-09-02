//rendering config
$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

//common vars between lid and box
lidBevel = 1.8;
  
boxX = 100;
boxY = 60;
boxHeight = 30;

boxEdgeR = 3;
wallThickness = 2;

screwTubeR = 2.8;
screwHoleDiameter = 3.05;
screwOffset = wallThickness + screwTubeR * 1.05;
screwXPos = boxX / 2 - screwOffset;
screwYPos = boxY / 2 - screwOffset;
screwHeadR = 2.6;
screwHeadZ = 2;

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