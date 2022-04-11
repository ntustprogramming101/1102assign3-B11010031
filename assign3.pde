final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered, 
        soil0 ,soil1, soil2, soil3, soil4, soil5 ,life ,
        stone1, stone2, groundhogDownImg, groundhogLeftImg, groundhogRightImg, groundhogIdleImg;
PImage bg, soil8x24;

// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;

int soilWidth = 80;
int soilHeight = 80;

float healthY=10;
float groundhogIdleX=320;
float groundhogIdleY=80;
float groundhogIdleSpeed = 80;
float groundhogIdleWidth = 80;
float bgY = 0;
float sunY = 50;
float downTime=0;
float rightTime=0;
float leftTime=0;

//animation
int animation;
final int groundhog_IDLE = 0;
final int groundhog_LEFT = 1;
final int groundhog_RIGHT = 2;
final int groundhog_DOWN = 3;
 
int groundhogState = groundhog_IDLE;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  life = loadImage("img/life.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  groundhogDownImg=loadImage("img/groundhogDown.png");
  groundhogLeftImg=loadImage("img/groundhogLeft.png");
  groundhogRightImg=loadImage("img/groundhogRight.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, bgY, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,sunY,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
      //soil5
  		for(int soil_5=0 ; soil_5 < width ; soil_5 += soilWidth){
        for( int soil_5Y=0 ; soil_5Y < 80*24 ; soil_5Y += soilHeight ){
          image(soil5, soil_5, 160+soil_5Y);}}
       //soil4
       for(int soil_4=0 ; soil_4 < width ; soil_4 += soilWidth){
        for( int soil_4Y=0 ; soil_4Y < 80*20 ; soil_4Y += soilHeight ){
          image(soil4, soil_4, 160+soil_4Y);}}
       //soil3
       for(int soil_3=0 ; soil_3 < width ; soil_3 += soilWidth){
        for( int soil_3Y=0 ; soil_3Y < 80*16 ; soil_3Y += soilHeight ){
          image(soil3, soil_3, 160+soil_3Y);}}     
       //soil2
       for(int soil_2=0 ; soil_2 < width ; soil_2 += soilWidth){
        for( int soil_2Y=0 ; soil_2Y < 80*12 ; soil_2Y += soilHeight ){
          image(soil2, soil_2, 160+soil_2Y);}}     
       //soil1
       for(int soil_1=0 ; soil_1 < width ; soil_1 += soilWidth){
        for( int soil_1Y=0 ; soil_1Y < 80*8 ; soil_1Y += soilHeight ){
          image(soil1, soil_1, 160+soil_1Y);}}     
       //soil0  
       for(int soil_0=0 ; soil_0 < width ; soil_0 += soilWidth){
        for( int soil_0Y=0 ; soil_0Y < 80*4 ; soil_0Y += soilHeight ){
          image(soil0, soil_0, 160+soil_0Y);}} 
    //stone
      //stone01
        float stX;
        float stY=0;
        for(int i=0 ; i<8 ; i++){
          stX = i*80;
          stY += 80;
         image(stone1, stX, 80+stY);}
         
       //stone23
       float st1X;
       float st1Y =0;
        for(int k=0 ; k<9 ;k++){
         for(int j=0 ; j<10 ; j++){
           st1X = j*320;     
           st1Y = k*80;
           if( k==1 || k==4 || k==5 ||k==8){
            image(stone1, 80+st1X, 720+st1Y);
            image(stone1, 80+st1X+80, 720+st1Y);}
           if( k==2 || k==3 || k==6 ||k==7){
            image(stone1, st1X-80, 720+st1Y);
            image(stone1, st1X, 720+st1Y);}
         }}
       //stone45
       float st2X;
       float st2Y =0;
         for(int k=0 ; k<9 ;k++){
           for(int j=0 ; j<10 ; j++){
           st2X = j*240;     
           st2Y = k*80;
           if ( k==0 || k==3 ||k==6){
           image(stone1, st2X+80, 1440+st2Y);
           image(stone1, st2X+160, 1440+st2Y);}
           if (k==1|| k==4 ||k==7){
           image(stone1, st2X, 1440+st2Y);
           image(stone1, st2X+80, 1440+st2Y);}
           if (k==2 || k==5){
           image(stone1, st2X-80, 1440+st2Y);
           image(stone1, st2X, 1440+st2Y);}
             }
           }
         
       
         
       float st3X;
       float st3Y =0;
          for(int i=9 ; i>0 ; i--){
          st3X = i*80;
          st3Y += 80;
           image(stone2, st3X+400, 1360+st3Y);
           image(stone2, st3X+160, 1360+st3Y);
           image(stone2, st3X-80, 1360+st3Y);
           image(stone2, st3X-320, 1360+st3Y);
           image(stone2, st3X-560, 1360+st3Y);
           
           
       
     }
        


		// Player
    //groundhog
      groundhogIdleImg=loadImage("img/groundhogIdle.png");
    
    // Health UI
    for(int i=0;i<playerHealth;i++){
      image(life,10+i*70,10);
    }
         
     if( playerHealth == 0){
          gameState = GAME_OVER;
        }
    //move
  if(animation<15){
    animation++;
    
    switch(groundhogState){
      case groundhog_LEFT:
        if(groundhogIdleX < 0) groundhogIdleX= 0;
        groundhogIdleX -= 80/15.0;
        break;
      case groundhog_RIGHT:
        if(groundhogIdleX + groundhogIdleWidth > width ) groundhogIdleX = width- groundhogIdleWidth ;
        groundhogIdleX += 80/15.0;
        break;
      case groundhog_DOWN:
        if(groundhogIdleY + groundhogIdleWidth > 2080 ) 
                groundhogIdleY =2080-groundhogIdleWidth;
        bgY += 80/15.0;
        sunY += 80/15.0;
        groundhogIdleY += 80/15.0;
        cameraOffsetY -= 80/15.0;

        
        healthY+= 80/15.0;
        

        if(cameraOffsetY<=-1600){cameraOffsetY=-1600; healthY =1610;}
        break; }
        }
    else{ groundhogState = groundhog_IDLE; }
   
  //display
  switch(groundhogState){
    case groundhog_IDLE:
      image(groundhogIdleImg,groundhogIdleX,groundhogIdleY);
      break;
    case groundhog_LEFT:
      image(groundhogLeftImg,groundhogIdleX,groundhogIdleY);
      break;
    case groundhog_RIGHT:
      image(groundhogRightImg,groundhogIdleX,groundhogIdleY);
      break;
    case groundhog_DOWN:
      image(groundhogDownImg,groundhogIdleX,groundhogIdleY);      

      

 break;
  }



		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
        playerHealth = 2;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
      switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      println(playerHealth);
      break;
    }

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(keyCode){
      case DOWN:
      debugMode = true;
     
      break;

    }
}

void keyReleased(){
            if( groundhogState == groundhog_IDLE){
            animation = 0;
            
            switch(keyCode){
              case LEFT:
                groundhogState = groundhog_LEFT;
                 if(groundhogIdleX < 0) groundhogIdleX= 0;
                break;
              case RIGHT:
                groundhogState = groundhog_RIGHT;
                if(groundhogIdleX + groundhogIdleWidth > width ) groundhogIdleX = width- groundhogIdleWidth ;
                break;
              case DOWN:
                groundhogState = groundhog_DOWN;
                if(groundhogIdleY + groundhogIdleWidth > 2075 ) {
                groundhogIdleY =2000;
                groundhogState = groundhog_IDLE ;
                }
                
                println(groundhogIdleY);
                break;
                }
               }
}
