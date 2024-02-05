use <eCad/Displays.scad>

include <eCad/KiCADColors.scad>



vertPCBOffset=[26.8,0,0];
vertPCBDims=[11,3.9,1.6];

translate([0,0,2.8]) VIM_878_DP();

color(pcbGreenCol) translate([0,0,-1.6]) linear_extrude(1.6) difference(){
  square([60,25],true);
  //translate([vertPCBOffset.x,vertPCBOffset.y]) offset(1) square();
}

//glass thickness=2.2mm


translate(vertPCBOffset) rotate([90,0,-90]) verticalPCB();
module verticalPCB(){
  
  color(pcbGreenCol){
    translate([0,vertPCBDims.y/2,-vertPCBDims.z/2])  cube(vertPCBDims,true);
    translate([0,-1.6/2,-vertPCBDims.z/2])  cube([vertPCBDims.x/2,1.6,1.6],true);
  }
  
  for (ix=[-1,0,1])
    translate([ix*4,vertPCBDims.y-1,0])  LED0603();

}

module LED0603(){
  //e.g. https://www.vishay.com/docs/83173/tlmx1100.pdf
  ovDims=[1.6,0.8,0.6];
  color(whiteBodyCol) linear_extrude(ovDims.z) square([ovDims.x,ovDims.y],true);
  color(metalGreyPinCol) for (ix=[-1,1,])
    translate([ix*(ovDims.x-0.3)/2,0]) linear_extrude(0.2) square([0.3,0.5],true);
}