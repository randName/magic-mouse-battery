// AA battery
aa_r = 7;
aa_l = 47;
aa_c = 1.5;

$fn = 100;

module AA(thick){
 difference(){
  cylinder(r=aa_r, h=aa_l, center=true);
  cylinder(r=aa_r-thick, h=aa_l-thick*2, center=true);
  cylinder(r=aa_c, h=aa_l+4, center=true);
 }
}

module pack(dist,thick){
 difference(){
  union(){
   translate([dist/2, 0, 0]) AA(thick);
   translate([0, -thick*1.5, 0]) cube([dist-aa_r*2+thick, thick, aa_l], center=true);
   translate([-dist/2, 0, 0]) AA(thick);
   translate([0, aa_r/2, 0]) cube([aa_r*2+dist, aa_r, aa_l], center=true);
  }
  translate([0, aa_r/2, 0]) cube([(aa_r-thick)*2+dist, aa_r+0.1, aa_l-thick*2], center=true);
  translate([0, (aa_r-thick)/2, 0]) cube([aa_r, aa_r+1.5, aa_l-thick*2], center=true);
  translate([dist/2, 0, 0]) cylinder(r=aa_c, h=aa_l+4, center=true);
  translate([-dist/2, 0, 0]) cylinder(r=aa_c, h=aa_l+4, center=true);
 }
}

module skid(dist, thick, poke, sweep){
 translate([(dist-thick)/2+aa_r, aa_r, 0]) cube([thick, poke, aa_l], center=true);
 translate([(thick-dist)/2-aa_r, aa_r, 0]) cube([thick, poke, aa_l], center=true);
 translate([aa_r-thick+(dist+sweep)/2, aa_r+poke/2, 0]) cube([sweep, thick, aa_l], center=true);
 translate([thick-aa_r-(dist+sweep)/2, aa_r+poke/2, 0]) cube([sweep, thick, aa_l], center=true);
}


/*difference(){
 union(){
  translate([0,-8.5,aa_l/2])
  {
	pack(15, 1.25);
	skid(15,1.25,1,2.5);
  }
  translate([0,8.5,aa_l/2]) mirror([0,1,0])
  {
	pack(15, 1.25);
	skid(15,1.25,1,2.5);
  }
 }
 translate([0,0,aa_l]) cube([50,50,aa_l], center=true);
}*/

difference(){
 union(){
  translate([0,-5,aa_l/2]) pack(15, 1.25);
  translate([0,5,aa_l/2]) mirror([0,1,0]) pack(15, 1.25);
 }
 translate([0,0,aa_l]) cube([50,50,aa_l], center=true);
 cube([50,2,aa_l+1],center=true);
}
