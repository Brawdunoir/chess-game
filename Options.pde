boolean coche = false;
void Option ()
{
  background(160,101,61);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(70);
  text("Options", width/2,50);
  fill(240, 221, 206);
  text("Options", 496,46);
  image (FlecheG,20, 620, 150,90);
  fill(97,54,33);
  textSize(20);
  text("Menu",90,660);
  if (mouseX > 20 && mouseX < 170 && mouseY >= 645 && mouseY <= 685) 
  {
   cursor(HAND);
  }
  else cursor(ARROW);
  textSize(50);
  text("Mode débutant",width/2,height/2);
  fill(240, 221, 206);
  text("Mode débutant", 497,347);
  if (modeDebutant == true)                                   //Indique que le mode débutant est activé
  {
    image(cocheVrai,265,315,60,60);
  }
  else 
  {
    image(cocheVide,265,315,60,60);
  }
  
}