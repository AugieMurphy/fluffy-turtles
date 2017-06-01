
import java.awt.Polygon; 
import java.util.LinkedList; 

Islander leader;

public void setup(){
  size(600,600);
  leader = new Islander(525,75,"Leader");
  leader.addSpeech("BUT, maybe I can help you... \n complete these quests and \n then  come find me. I'll \n get you off of this island.");
  leader.addSpeech("I hope you have another \n boat. Nobody's left \n this island in years.");
  leader.addSpeech("Were you in a shipwreck \n during the storm \n last night?");
  leader.addSpeech("I've never seen you \n before.");
  leader.addSpeech("That's strange...");
}

public void draw(){
  
  background(0xffE5EFFF);
  
  // draw dock
  stroke(0xff67452F);
  strokeWeight(4);
  fill(0xff987B68);
  rect(190,220,410,25);
  rect(190,250,75,380);
  rect(400,290,200,25);
 
  
  translate(0,-150);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  
  translate(-75*6,150);
  
  //draw sand
  beginShape();
  stroke(0xffB26E00);
  fill(0xffFFEB86);
  curveVertex(0,600);
  curveVertex(0,600);
  curveVertex(0,575);
  curveVertex(300,525);
  curveVertex(600,450);
  curveVertex(600,600);
  curveVertex(600,600);
  endShape();
  
  stroke(0xff67452F);
  fill(0xff987B68);
  rect(400,320,75,275);
  
  //draw ocean
  noStroke();
  fill(0xff94D6E8, 79);
  rect(0,350,600,250);
  
  leader.addCrown();
  leader.display();
}
void mouseClicked(){
  if( leader.isHotspot() ){ leader.speakSwitch(); }
}