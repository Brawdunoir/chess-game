boolean tourBlanc = true;
boolean tourNoir = false;

void afficherTourJoueur() //On affiche à qui est le tour
{
  if(tourBlanc == true)
  { 
    textSize(25);
    fill(240, 221, 206);
    text("Blanc",795,25); 
    text("Noir", 913,25);
    fill(192,192,192);
    noStroke();
    rect(754,10,81,2);
    rect(754,10,2,70);
    rect(835,10,2,70);
    rect(754,80,83,2);
  }
 else
  { 
    textSize(25);
    fill(240,221,206);
    text("Blanc",795,25);
    text("Noir", 913,25);
    fill(192,192,192);
    noStroke();
    rect(872,10,81,2);
    rect(872,10,2,70);
    rect(953,10,2,70);
    rect(872,80,83,2);
    
  }  
}

void changementTour()
{
  if(tourBlanc == true)
  {
    tourBlanc = false;
    tourNoir = true;
    lancerRebours = false;
    chrono2 = true;
    chrono1 = false;
  }
  else
  {
    tourNoir = false;
    tourBlanc = true;
    lancerRebours= false;
    chrono1 = true;
    chrono2 = false;
  }
}