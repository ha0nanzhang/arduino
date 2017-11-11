arduinoWidth = 54;
arduinoLength = 69;
arduinoUsbWidth = 13;
arduinoUsbHeight = 15;
arduinoUsbX = 9.5;
arduinoPowerWidth = 9.5;
arduinoPowerHeight = 15;
arduinoPowerX = 3.5;

breadboardWidth=56;
breadboardLength=165;
breadboardHeight=7;

wallThickness = 5;
wallHeight = 20;
bottomThickness = 2;

drill=3.2;

//whole box
difference()
{
    union()
    {
        cube([140, 170, 20], center=true);
    }
    
    translate([0, 0, 1])
       cube([135, 160, 18 ], center=true);
    
    translate([-35,-48.5, -0])
    {
        // USB hole
	translate([	-1*((arduinoWidth/2.0)-(arduinoUsbWidth/2.0)-arduinoUsbX),
			-1*(arduinoLength/2.0)-(wallThickness/2.0),
			-1*(wallHeight/2.0 - arduinoUsbHeight/2.0)+bottomThickness/2.0])
	{
		cube([arduinoUsbWidth, 11, wallHeight], center=true);
	}

	// Power hole
	translate([	((arduinoWidth/2.0)-(arduinoPowerWidth/2.0)-arduinoPowerX),
			-1*(arduinoLength/2.0)-(wallThickness/2.0),
			-1*(wallHeight/2.0 - arduinoPowerHeight/2.0)+bottomThickness/2.0])
	{
		cube([arduinoPowerWidth, 11,wallHeight], center=true);
	}
	
	// Drill holes
	
    translate ([arduinoWidth/2-drill/2-1,-arduinoLength/2+12.5+drill/2,0]) cylinder (r=drill/2, h=10*drill, center=true);
    
	translate ([-arduinoWidth/2+drill/2+1,-arduinoLength/2+14+drill/2,0]) cylinder (r=drill/2, h=10*drill, center=true);
    
	translate ([arduinoWidth/2-drill/2-6,+arduinoLength/2-1-drill/2,0]) cylinder (r=drill/2, h=10*drill, center=true);
    
	translate ([-arduinoWidth/2+drill/2+16,+arduinoLength/2-1-drill/2,0]) cylinder (r=drill/2, h=10*drill, center=true);}
        
    
    
}

//partition between arduino and compartment tray
translate([-35, 0, 0])
union()
{    
    cube([64.5, wallThickness, wallHeight], center=true);        
}


//section for breadboard

translate([3, -85, -10])
difference() 
{
      union() 
      {  
        translate([-6, 0, 0])
          cube([wallThickness, breadboardLength, wallHeight]);
      }
       
      translate([0, 0, 6])
        cube([breadboardWidth, breadboardLength, breadboardHeight]);  
};
