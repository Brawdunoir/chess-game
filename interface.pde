boolean modeDebutant = false;
String phrasePrincipale = "";

void dessinerPlateau()
{
  fond();
  dessinerCases();
}

void afficherMessage()
{
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(250,0,0);//beige
  text(phrasePrincipale, 850,225);
}

//faire le fond
void fond ()
{ 
  afficherTourJoueur();
  noStroke();

  fill(97, 54, 33); //marron foncé

  rect (700, 0, 5, 700); //barre à droite
  image(contourChrono, 770, 125);
  fill(240, 221, 206);//beige
  rect (22.5, 22.5, 655, 655); //contour échequier
  image(ombres, 708, 384);


  textAlign(CENTER, CENTER);
  textSize(20);

  for (int x=0; x<8; x++)
  {
    //Indique les coordonnées des cases aux joueurs
    text(char('A'+x), 70+x*80, 10); 
    text(char('A'+x), 70+x*80, 685);
    text(char('8'-x), 10, 70+x*80);
    text(char('8'-x), 690, 70+x*80);
  }
  image(Echequier, 30, 30);
}

void pause()
{
  filter(BLUR,6);
  image(Pause,0,0);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(97,54,33);
  text("Pause",500, 162);
  fill(240, 221, 206);
  text("Pause",498, 160);
  textSize(20);
  text("Reprendre",500, 250);
  text("Règles",500, 350);
  text("Quitter partie",500, 450);
  if (mouseX > 450 && mouseX < 550 && mouseY >= 230 && mouseY <= 270) 
  {
   cursor(HAND);
  }
  else cursor(ARROW); 
  if (mouseX > 450 && mouseX < 550 && mouseY >= 330 && mouseY <= 370) 
  {
   cursor(HAND);
  }
  if (mouseX > 450 && mouseX < 550 && mouseY >= 430 && mouseY <= 470) 
  {
   cursor(HAND);
  }
}

void Retour ()
{
  filter(BLUR,6);
  image(quitter,0,0);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(97,54,33);
  text("Quitter",500, 260);
  fill(240, 221, 206);
  text("Quitter",498, 258);
  textSize(20);
  text("Voulez-vous vraiment quitter la partie ?",500, 340);
  text("Oui", 420, 415);
  text("Non", 580, 415);
  if (mouseX > 405 && mouseX < 435 && mouseY >= 395 && mouseY <= 435) 
  {
   cursor(HAND);
  }
  else cursor(ARROW); 
  if (mouseX > 565 && mouseX < 595 && mouseY >= 395 && mouseY <= 435) 
  {
   cursor(HAND);
  }
}

void menuFin() 
{   
    image(Fin,0,0);
    textAlign(CENTER, CENTER);
    textSize(30);
    if(gagnant == "noirs") fill(97,54,33); //marron
    else fill(240, 221, 206); //beige
    text("Les " + gagnant + " ont gagné\nla partie !",500, 330);
    text("Fin", 500, 420);
   if (mouseX > 480  && mouseX < 520 && mouseY >= 400 && mouseY <= 440)
   {
    cursor(HAND);                                                    
   }
   else cursor(ARROW);
}









void defautCases()
{  
  //*******************************CASES NOIRES*******************************
  for (int l = 0; l < 8; l=l+2)
  {
    for (int c = 1; c < 8; c=c+2)
    {
      plateau[l][c] = 1;
    }
  }
  for (int l = 1; l < 8; l=l+2)
  {
    for (int c = 0; c < 8; c=c+2)
    {
      plateau[l][c] = 1;
    }
  }

  //*******************************CASES BLANCHES*******************************

  for (int l = 1; l < 8; l=l+2)
  {
    for (int c = 1; c < 8; c=c+2)
    {
      plateau[l][c] = 0;
    }
  }
  for (int l = 0; l < 8; l=l+2)
  {
    for (int c = 0; c < 8; c=c+2)
    {
      plateau[l][c] = 0;
    }
  }
}





void dessinerCases()
{
  
  for (int l = 0; l < 8; l++)
  {
    for (int c = 0; c < 8; c++)
    {
      switch (plateau[l][c])
      {
      case 0 :
        fill(240, 221, 206); //beige
        break;
      case 1 :
        fill(160, 101, 61); //marron
        break;
      case 2 :
        if (modeDebutant == true)
        {
          fill(0, 232, 58);  //dessine le contour de la case en vert
          rect(c*80+30, l*80+30, 5, 80);
          rect(c*80+30, l*80+30, 80, 5);
          rect(c*80+105, l*80+30, 5, 80);
          rect(c*80+30, l*80+105, 80, 5);
          fill(0, 232, 58, 80); //dessine l'interieur de la case en vert moins opaque
        }

        break;
      case 3 :
        if (modeDebutant == true)
        {
          fill(244, 34, 34); //dessine le contour de la case en rouge
          rect(c*80+30, l*80+30, 5, 80);
          rect(c*80+30, l*80+30, 80, 5);
          rect(c*80+105, l*80+30, 5, 80);
          rect(c*80+30, l*80+105, 80, 5);
          fill(244, 34, 34, 80); //dessine le contour de la case en rouge moins opaque
        }

        break;
      case 4:
        if (modeDebutant == true)
        {
          fill(0, 0, 0);
          rect(c*80+30, l*80+30, 5, 80);
          rect(c*80+30, l*80+30, 80, 5);
          rect(c*80+105, l*80+30, 5, 80);
          rect(c*80+30, l*80+105, 80, 5);
          fill(0, 0, 0, 80);
        }

        break;
      }
      rect (c*80+30, l*80+30, 80, 80);
      if(modeDebutant == false) image(Echequier, 30, 30);
    }
  }
}


void reinitialiserCases()
{
  for (int l = 0; l < 8; l++)
  {
    for (int c = 0; c < 8; c++)
    {
      plateau[l][c] = -1;
    }
  }
}