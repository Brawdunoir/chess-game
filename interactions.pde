//N = +10 ou B = +0
//P = 1; T = 2; C = 3; F = 4; D = 5; R = 6;

//variables pour connaître les index
int colonne;
int ligne;
boolean dansEchequier = true;
boolean pieceSelec = false;
boolean pieceBlanche;

//valeurs de la dernière pièce choisie
int valeurPP = 0;
int xPP = 0;
int yPP = 0;

int pause=0, memo_temps_ecoule=0, memo_temps_current, retour=0;


void keyPressed()
{
  if (fin == false)
  {
  if (key==8)
  {
    retour = 1;//demande une confirmation pour quitter
  }
  }
  if (modeDebutant == true)//Active la pause pour le mode débutant
  {
    if (fin ==false)
    {
    if ((key=='p') && (pause==1))
  {
   if (tourBlanc==true) reboursStart1= (hour()*3600 + minute()* 60 + second())-memo_temps_ecoule;//Enlève le temps écoulé pour remettre le chrono à l'heure
         else reboursStart2= (hour()*3600 + minute()* 60 + second())-memo_temps_ecoule;
 
   pause=0;
  }
  
  else if ((key=='p') && (pause==0))
  {
   if (tourBlanc==true) memo_temps_ecoule = time_current-reboursStart1 ; //calcule le temps écoulé durant la pause pour le joueur 1
         else memo_temps_ecoule = time_current-reboursStart2 ;//calcule le temps écoulé durant la pause pour le joueur 2 
         
    memo_temps_current=time_current; //sauvegarde le temps actuel au début de la pause

   pause=1;
  }
  }
  }
  switch(key)
  {
  case '1':
    choixPromotion = 2;
    promotionPion();
    break;
  case '2':
    choixPromotion = 3;
    promotionPion();
    break;
  case '3':
    choixPromotion = 4;
    promotionPion();
    break;
  case '4':
    choixPromotion = 5;
    promotionPion();
    break;
  }
}



void mousePressed()
{   //*************PROMOTION PION*************
  if(promotionPionBlanc == true || promotionPionNoir == true)
  {
  
  if(mouseX > 680 && mouseX < 765 && mouseY > 280 && mouseY < 370) //la reine
  {
    choixPromotion = 5;
    promotionPion();
  }
  else if(mouseX > 765 && mouseX < 835 && mouseY > 280 && mouseY < 370) //le fou
  {
    choixPromotion = 4;
    promotionPion();
  }
  else if(mouseX > 835 && mouseX < 925 && mouseY > 280 && mouseY < 370) //le cavalier
  {
    choixPromotion = 3;
    promotionPion();
  }
  else if(mouseX > 925 && mouseX < 1000 && mouseY > 280 && mouseY < 370) //la tour
  {
    choixPromotion = 2;
    promotionPion();
  }
  }
  //*************FIN PROMOTION PION*************
  
  if (Regles==true)
  { 
    if (Deplace = true)                                                     //Donne une troisième possibilité de navigation à partir de la deuxième page des règles
    { 
      if (mouseX > 20 && mouseX < 170 && mouseY >= 605 && mouseY <= 640)
      {
        Defil = 0;
      }
    }
    
    
    
    if (mouseX > 20 && mouseX < 170 && mouseY >= 645 && mouseY <= 685)    //Permet de naviguer sur toutes les pages des règles.
    {
      Defil = Defil-1;
    }
    if (Defil < 9)
    {
      if (mouseX > 840 && mouseX < 1000 && mouseY >= 645 && mouseY <= 685) 
      {
        Defil = Defil+1;
      }
    }
  }
  if (pause==0 && fin == false)
  {
  if (mouseButton == LEFT)
  {
    navigationMenu(); //pour naviguer dans le menu

    positionSouris(); //cherches les informations concernant la position de la pièce sélectionné (et sa nature) ou si l'on clique en dehors de l'échequier

    if (dansEchequier == true)
    {
      deplacementPiece();
    } else
    {
      defautCases(); //On efface cases vertes et rouges
    }
  }
  }
  
   if (pause == 1)
   {
     if (mouseX > 450 && mouseX < 550 && mouseY >= 230 && mouseY <= 270)
{
  if (tourBlanc==true) reboursStart1= (hour()*3600 + minute()* 60 + second())-memo_temps_ecoule; //enlève la pause
         else reboursStart2= (hour()*3600 + minute()* 60 + second())-memo_temps_ecoule;
 
   pause=0;
}
     if (mouseX > 450 && mouseX < 550 && mouseY >= 330 && mouseY <= 370)//affiche les règles
{
  Regles = true;
  Defil = 1;
}
     if (mouseX > 450 && mouseX < 550 && mouseY >= 430 && mouseY <= 470) //demande une confirmation de quitter
{
   retour = 1;
}
  }  
if (retour == 1)
{
 if (mouseX > 405 && mouseX < 435 && mouseY >= 395 && mouseY <= 435) //quitte le jeu
  {
    Menu = true;
    Jouer = false;
    defautCases();
    defautPieces();
    lancerChrono = false;
    lancerRebours = false;
    test = false;
    tourBlanc = true;
    fin = false;
    pause = 0;
    retour= 0;
  } 
  if (mouseX > 565 && mouseX < 595 && mouseY >= 395 && mouseY <= 435) //annule la confiramtion de quitter
  {
  retour = 0;
  }
}
 if (fin == true)
 {
   if (mouseX > 480  && mouseX < 520 && mouseY >= 400 && mouseY <= 440)
   {
     Menu = true;
    Jouer = false;
    defautCases();
    defautPieces();
    lancerChrono = false;
    lancerRebours = false;
    test = false;
    tourBlanc = true;
    fin = false;
    pause = 0;
    retour= 0;                                                  
   }
  }
}


void positionSouris()
{
  int colonne_mem = (mouseX- 30)/80; //donne l'index colonne
  int ligne_mem = (mouseY-30)/80; //donne l'index ligne

  if (colonne_mem >= 0 && colonne_mem < 8 && ligne_mem >= 0 && ligne_mem < 8 && mouseX >= 30 && mouseX <= 670 &&
    mouseY >= 30 && mouseY <= 700) //garde fou pour eviter de planter le programme & ne prendre que l'échéquier et pas autour
  {
    //assignation varibale GLOBALE
    colonne = colonne_mem; 
    ligne = ligne_mem;

    //on est dans l'echequier
    dansEchequier = true;

    //Piece sur cette case ?
    if (tableau[ligne][colonne] != 0) pieceSelec = true;
    else pieceSelec = false;

    //Piece blanche ?
    if (tableau[ligne][colonne] == 1 || tableau[ligne][colonne] == 2 || tableau[ligne][colonne] == 3 || tableau[ligne][colonne] == 4
      || tableau[ligne][colonne] == 5 || tableau[ligne][colonne] == 6) pieceBlanche = true;
    else pieceBlanche = false;
  } else dansEchequier = false; //on est en dehors de l'echequier
}
//***************************************************************************************************************************************************************************************************
void deplacementPiece()
{
  faireSauvegardeEmplacementPieces(); //on fait une sauvegarde de l'emplacement des pièces

  if (plateau[ligne][colonne] == 4) //on fait le roque s'il est possible
  {
    faireRoque(); //déplace les pièces
    verifications();
    defautCases(); //on enlève les cases vertes ect...
  }
  else if (pieceSelec == true && plateau[ligne][colonne] != 3) //si une piece est sélectionnée et qu'on ne peut pas la manger
  {
    defautCases(); //On efface cases vertes et rouges créées précédemment

    valeurPP = tableau[ligne][colonne]; //garde en mémoire la dernière valeur de la piece précedente

    //garde en mémoire la position de la pièce précédente
    xPP = ligne; 
    yPP = colonne;

    if (tourBlanc)
    {
      switch(tableau[ligne][colonne]) //on regarde le déplacement possible suivant la pièce sélectionnée
      {
      case 1:
        dPionBlanc(ligne, colonne);
        break;
      case 2:
        dTour(ligne, colonne);
        break;
      case 3:
        dCavalier(ligne, colonne);
        break;
      case 4:
        dFou(ligne, colonne);
        break;
      case 5:
        dDame(ligne, colonne);
        break;
      case 6:
        dRoi(ligne, colonne);
        break;
      }
    } else
    {
      switch(tableau[ligne][colonne]) //on regarde le déplacement possible suivant la pièce sélectionnée
      {
      case 11:
        dPionNoir(ligne, colonne);
        break;
      case 12:
        dTour(ligne, colonne);
        break;
      case 13:
        dCavalier(ligne, colonne);
        break;
      case 14:
        dFou(ligne, colonne);
        break;
      case 15:
        dDame(ligne, colonne);
        break;
      case 16:
        dRoi(ligne, colonne);
        break;
      }
    }
  }
  else if (pieceSelec == false && plateau[ligne][colonne] == 3 && priseEnPassant == true) //PRISE EN PASSANT
  {
    tableau[ligne][colonne] = valeurPP; //on bouge la pièce
    tableau[xPP][yPP] = 0; //on vide l'ancien emplacement de la pièce
    if(tourBlanc == true) tableau[ligne+1][colonne] = 0; //on supprime également le pion adverse, "pris en passant" !
    if(tourNoir == true) tableau[ligne-1][colonne] =0; //on supprime également le pion adverse, "pris en passant" !
    reinitialiserCases();
    verifications();
    defautCases();
    
    priseEnPassant = false;
  }
  else if (pieceSelec == false && plateau[ligne][colonne] == 2) //Si on sélectionne une case vide, et qu'on peut se déplacer sur la case, on se déplace
  {
    tableau[ligne][colonne] = valeurPP; //on bouge la pièce
    tableau[xPP][yPP] = 0; //on vide l'ancien emplacement de la pièce
    reinitialiserCases();
    verifications();
    defautCases();
  } else if (pieceSelec == true && plateau[ligne][colonne] == 3)
  {
    tableau[ligne][colonne] = valeurPP; //On bouge la pièce
    tableau[xPP][yPP] = 0; //on vide l'ancien emplacement de la pièce
    reinitialiserCases();
    verifications();
    defautCases();
  } else defautCases(); //On efface cases vertes et rouges
  
  if(priseEnPassant !=  true) remplirPriseEnPassant(); //on remplit le tableau de la prise en passant ! (cf. déplacement pièces)
}

void navigationMenu()
{
  if (Menu==true)
  {
    if (mouseX > 745 && mouseX < 860 && mouseY >= 280 && mouseY <= 350) //lance le jeu
    { 
      Jouer = true;
      Menu = false;
    }
    if (mouseX > 745 && mouseX < 860 && mouseY >= 380 && mouseY <= 450) //affiche les règles
    {
      Regles = true;
      Menu = false;
      Defil =1;
    }
    if (mouseX > 745 && mouseX < 860 && mouseY >= 480 && mouseY <= 550)//affiches les options
    {
      Option = true;
      Menu = false;
    }
  }
  

if (Option == true)
  {
    if (mouseX > 20 && mouseX < 170 && mouseY >= 645 && mouseY <= 685) //quitter les options
    {
      Option = false;
      Menu= true;
    }
    if(modeDebutant == false)  //active le mode débutant
    {
    if (mouseX > 265 && mouseX < 305 && mouseY >= 315 && mouseY <= 375) 
    {
      modeDebutant = true;
    }
    }
    else if(modeDebutant == true)//désactive le mode débutant
    {
    if (mouseX > 265 && mouseX < 305 && mouseY >= 315 && mouseY <= 375) 
    {
      modeDebutant = false;
    }
    }
  }
}

void faireSauvegardeEmplacementPieces()
{
  for (int l = 0; l<8; l++)
  {
    for (int c = 0; c< 8; c++)
    {
      sauvegarde[l][c] = tableau[l][c];
    }
  }
}


void appliquerSauvegarde()
{
  for (int l = 0; l<8; l++)
  {
    for (int c = 0; c< 8; c++)
    {
      tableau[l][c] = sauvegarde[l][c];
    }
  }
}

void remplirPriseEnPassant()
{
  for (int l = 0; l<8; l++)
  {
    for (int c = 0; c< 8; c++)
    {
      tableauPriseEnPassant[l][c] = sauvegarde[l][c];
    }
  }
}

void verifications()
{
  verifRoque();
  testEmplacementPromotionPion();
  testEchec();
}