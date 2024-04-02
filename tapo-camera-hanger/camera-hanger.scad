$fn = 40;
height = 30;

diameter = 25.4*1.5;
thickness = 6;

difference() {
  cylinder(h = height, d = diameter + thickness);
  cylinder(h = height, d = diameter);
  translate([0, -diameter/2, height/2])
    cube([diameter, diameter, height], center = true);
}

//  translate([0, -diameter/2, height/2])
//    cube([diameter, diameter, height], center = true);

translate([-(diameter + thickness)/2, -10, 0])
  cube([thickness/2, 10, height]);

translate([diameter/2, -80, 0])
  cube([thickness/2, 80, height]);

front_offset = 38;
back_offset = 24;
tapo_stem_diameter = 12;

translate([-front_offset-back_offset+diameter/2, -80+thickness/2, 0]) {
  rotate([90, 0, 0]) {
    difference() {
      union() {
        cube([front_offset + back_offset, height, thickness/2]);
        translate([0, 0, -thickness])
          cube([thickness, height, thickness]);
      }
      translate([front_offset, height/2, 0])
        cylinder(h = thickness, d = tapo_stem_diameter);
        translate([0, (height-tapo_stem_diameter)/2, -thickness])
        cube([front_offset, tapo_stem_diameter, thickness*2]);
    }

  }
}
