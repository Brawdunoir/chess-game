boolean promotionPionNoir = false;
boolean promotionPionBlanc = false;
int xPionPromotion = 0;
int yPionPromotion = 0;
int choixPromotion;

void testEmplacementPromotionPion()
{
  for (int c = 0; c < 8; c++)
  {
    if (tableau[0][c] == 1) //si il y a un pion blanc sur la première ligne
    {
      promotionPionBlanc = true; //PROMOTION !
      xPionPromotion = c; //on met les coordonnées du pion dans ces variables
      yPionPromotion = 0;
    }
    if (tableau[7][c] == 11) //si il y a un pion noir sur la dernière ligne
    {
      promotionPionNoir = true; //PROMOTION !
      xPionPromotion = c;
      yPionPromotion = 7;
    }
  }
}

void interfacePromotion()
{
  phrasePrincipale = "Appuie sur la pièce\nque tu veux !";
  if(promotionPionBlanc == true)
  {
    image(TourBlanche,920,280,90,90);
    image(CavalierBlanc,840,280,90,90);
    image(fouBlanc,760,280,90,90);
    image(reineBlanche,680,280,90,90);
  }
  else if(promotionPionNoir == true)
  {
    image(TourNoire,920,280,90,90);
    image(CavalierNoir,840,280,90,90);
    image(fouNoir,760,280,90,90);
    image(reineNoire,680,280,90,90);
  }
  if(mouseX > 690 && mouseX < 750 && mouseY > 280 && mouseY < 370) //la reine
  {
    cursor(HAND);
  }
  else if(mouseX > 770 && mouseX < 820 && mouseY > 280 && mouseY < 370) //le fou
  {
    cursor(HAND);
  }
  else if(mouseX > 840 && mouseX < 930 && mouseY > 280 && mouseY < 370) //le cavalier
  {
    cursor(HAND);
  }
  else if(mouseX > 940 && mouseX < 1000 && mouseY > 280 && mouseY < 370) //la tour
  {
    cursor(HAND);
  }
  else cursor(ARROW);
  }

void promotionPion()
{
  
  if (promotionPionBlanc == true)
  {
    tableau[yPionPromotion][xPionPromotion] = choixPromotion;
  } 
  else if (promotionPionNoir == true)
  {
    choixPromotion = choixPromotion + 10; //On ajoute 10 pour que ça corresponde à des pièces noires
    tableau[yPionPromotion][xPionPromotion] = choixPromotion;
  }
  promotionPionBlanc = false;
  promotionPionNoir = false;
  
  xPionPromotion = 0;
  yPionPromotion = 0;
}