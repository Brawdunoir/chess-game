 int tableauPriseEnPassant[][] = new int[8][8];
boolean priseEnPassant = false;

boolean faireRoqueBlanc = false;
boolean faireRoqueNoir = false;

void dPionBlanc(int l, int c)
{
  if (l != 0) //si le pion n'est pas dans la dernière ligne du tableau donc qu'il peut se déplacer
  {
    //****************************************************SECTION DEPLACEMENT****************************************************
    if (tableau[l-1][c] == 0 && simulationRoqueEnCours == false) //si il n'y pas de pièce devant, on peut se déplacer
    {
      if (l==6 && tableau[l-2][c] == 0) plateau[l-2][c] = 2; //lors du premier dép, peut se déplacer de 2 cases
      plateau[l-1][c] = 2; //déplement en ligne droite
    }

  //****************************************************SECTION PRISE****************************************************
    if (c < 7) //on vérifie qu'on ne sort pas du tableau
    {
      if (tableau[l-1][c+1] != 0 && ennemie(l-1, c+1) == true) plateau[l-1][c+1] = 3; //on peut manger cette en diagonale s'il y a une piece ennemie
      
      if(tableau[3][c+1] == 11 && tableau[2][c+1] == 0 && tableauPriseEnPassant[1][c+1] == 11 && tableau[3][c] == 1 && l == 3)//PRISE EN PASSANT
      {
        plateau [l-1][c+1] = 3;
        priseEnPassant = true;
        phrasePrincipale = "Prise en passant\npossible";
      }
      if (simulationRoqueEnCours == true) plateau[l-1][c+1] = 2; //affiche comme déplacement les cases de prise
    }
    if (c > 0) //on vérifie qu'on ne sort pas du tableau
    {
      if (tableau[l-1][c-1] != 0 && ennemie(l-1, c-1) == true) plateau[l-1][c-1] = 3; //on peut manger cette en diagonale s'il y a une piece ennemie
      if(tableau[3][c-1] == 11 && tableau[2][c-1] == 0 && tableauPriseEnPassant[1][c-1] == 11 && tableau[3][c] == 1 && l == 3) //PRISE EN PASSANT
      {
        plateau [l-1][c-1] = 3;
        priseEnPassant = true;
        phrasePrincipale = "Prise en passant\npossible";
      }
      
      if (simulationRoqueEnCours == true) plateau[l-1][c-1] = 2; //affiche comme déplacement les cases de prise
    }
  }
}

void dPionNoir(int l, int c)
{
  
  if (l != 7) //si le pion n'est pas dans la première ligne du tableau et donc qu'il peut se déplacer
  {
    //****************************************************SECTION DEPLACEMENT****************************************************
    if (l != 7 && tableau[l+1][c] == 0 && simulationRoqueEnCours == false) //s'il n'y a pas de pièce devant, on peut se déplacer
    {
      if (l==1 && tableau[l+2][c] == 0) plateau[l+2][c] = 2; //lors du premier dép, peut se déplacer de 2 cases
      plateau[l+1][c] = 2; //déplacement ligne droite normal 1 case
    }

  //****************************************************SECTION PRISE****************************************************
    if (c < 7) //on vérifie qu'on ne sort pas du tableau
    {
      if (tableau[l+1][c+1] != 0 && ennemie (l+1, c+1) == true) plateau[l+1][c+1] = 3; //on peut manger cette en diagonale s'il y a une piece ennemie
      
      if(tableau[4][c+1] == 1 && tableau[5][c+1] == 0 && tableauPriseEnPassant[6][c+1] == 1 && tableau[4][c] == 11 && l == 4) //PRISE EN PASSANT
      {
        plateau [l+1][c+1] = 3;
        priseEnPassant = true;
        phrasePrincipale = "Prise en passant\npossible";
      }
      if(simulationRoqueEnCours == true) plateau[l+1][c+1] = 2; //affiche comme déplacement les cases de prise
    }
    if (c > 0) //on vérifie qu'on ne sort pas du tableau
    {
      if (tableau[l+1][c-1] != 0 && ennemie(l+1, c-1) == true) plateau[l+1][c-1] = 3; //on peut manger cette en diagonale s'il y a une piece ennemie
      
      if(tableau[4][c-1] == 1 && tableau[5][c-1] == 0 && tableauPriseEnPassant[6][c-1] == 1 && tableau[4][c] == 11 && l == 4) //PRISE EN PASSANT
      {
        plateau [l+1][c-1] = 3;
        priseEnPassant = true;
        phrasePrincipale = "Prise en passant\npossible";
      }
      if(simulationRoqueEnCours ==true) plateau[l+1][c-1] = 2; //affiche comme déplacement les cases de prise
    }
  }
}

void dTour(int l, int c)
{
  deplacementPriseLigneDroite(l, c);
}

void dCavalier(int l, int c)
{
  //Le cavalier se déplace en L, on crée les index des 8 déplacements possibles

  deplacementPriseCR(l+2, c-1);
  deplacementPriseCR(l+1, c-2);
  deplacementPriseCR(l-1, c-2);
  deplacementPriseCR(l-2, c-1);
  deplacementPriseCR(l-2, c+1);
  deplacementPriseCR(l-1, c+2);
  deplacementPriseCR(l+1, c+2);
  deplacementPriseCR(l+2, c+1);
}

void dFou(int l, int c)
{
  deplacementPriseDiagonale(l, c);
}

void dRoi(int l, int c)
{

  deplacementPriseCR(l+1, c); //bas
  deplacementPriseCR(l-1, c); //haut
  deplacementPriseCR(l, c+1); //droite
  deplacementPriseCR(l, c-1); //gauche
  deplacementPriseCR(l+1, c+1); //bas droite 
  deplacementPriseCR(l+1, c-1); //bas gauche
  deplacementPriseCR(l-1, c+1); //haut droite
  deplacementPriseCR(l-1, c-1); //haut gauche
  afficherRoque();
}

void dDame(int l, int c)
{
  deplacementPriseDiagonale(l, c);
  deplacementPriseLigneDroite(l, c);
}




void deplacementPriseCR(int l, int c) //mettre les cases en couleur de déplacement et de prise pour les pieces simples (cavalier, roi)
{
  //On regarde les combinaisons possibles et on met les cases en vert
  if (c < 8 && c >= 0 && l < 8 && l >= 0 && tableau[l][c] == 0)
  {
    plateau[l][c] = 2;
  }
  //On autorise la prise si unité ennemie
  else if (c < 8 && c >= 0 && l < 8 && l >= 0 && tableau[l][c] != 0 && ennemie(l, c) == true)
  {
    plateau[l][c] = 3;
  }
}


//**********************************************************************

void deplacementPriseDiagonale(int l, int c)
{ 
  //HAUT DROITE
  for (int i = 1; i < 8; i++)
  {
    if (c+i < 8 && c+i >= 0 && l-i < 8 && l-i >= 0) //on regarde les cases dans le tableau
    {
      if (tableau[l-i][c+i] != 0 && ennemie(l-i, c+i) == true) plateau[l-i][c+i] = 3; //si la case est occupée par une piece ennemie, on autorise la prise
      
      if(premiereEtapeMat == true) //quand on essaye de déterminer l'échec et mat
      {
        if (tableau[l-i][c+i] == 0 ) plateau[l-i][c+i] = 2; //si la case est libre, on autorise le déplacement
        else if (tableau[l-i][c+i] == 6 || tableau[l-i][c+i] == 16); //si la case est le roi, on ne fait rien
        else break; //sinon on sort de la boucle
      }
      else
      {
        if (tableau[l-i][c+i] == 0) plateau[l-i][c+i] = 2; //si la case est libre, on autorise le déplacement
        else break; //sinon on sort de la boucle
      }
      
    }
  }

  //HAUT GAUCHE
  for (int i = 1; i < 8; i++)
  { 
    if (c-i < 8 && c-i >= 0 && l-i < 8 && l-i >= 0)
    {
      if (tableau[l-i][c-i] != 0 && ennemie(l-i, c-i) == true) plateau[l-i][c-i] = 3;
      if(premiereEtapeMat ==true)
      {
        if (tableau[l-i][c-i] == 0) plateau[l-i][c-i] = 2;
        else if (tableau[l-i][c-i] == 6 || tableau[l-i][c-i] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l-i][c-i] == 0) plateau[l-i][c-i] = 2;
        else break;
      } 
    }
  }

//*********************************************************************************************************************************
  //BAS DROITE
  for (int i = 1; i < 8; i++)
  { 
    if (c+i < 8 && c+i >= 0 && l+i < 8 && l+i >= 0)
    {
      if (tableau[l+i][c+i] != 0 && ennemie(l+i, c+i) == true) plateau[l+i][c+i] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l+i][c+i] == 0) plateau[l+i][c+i] = 2;
        else if (tableau[l+i][c+i] == 6 || tableau[l+i][c+i] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l+i][c+i] == 0) plateau[l+i][c+i] = 2;
        else break;
      }
    }
  }

  //BAS GAUCHE
  for (int i = 1; i < 8; i++)
  { 
    if (c-i < 8 && c-i >= 0 && l+i < 8 && l+i >= 0)
    {
      if (tableau[l+i][c-i] != 0 && ennemie(l+i, c-i) == true) plateau[l+i][c-i] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l+i][c-i] == 0) plateau[l+i][c-i] = 2;
        else if (tableau[l+i][c-i] == 6 || tableau[l+i][c-i] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l+i][c-i] == 0) plateau[l+i][c-i] = 2;
        else break;
      }
    }
  }
}

//**********************************************************************


void deplacementPriseLigneDroite(int l, int c)
{
  //BAS
  for (int i = 1; i < 8; i++)
  {
    if (c < 8 && c >= 0 && l+i < 8 && l+i >= 0)
    {
      if (tableau[l+i][c] != 0 && ennemie(l+i, c) == true) plateau[l+i][c] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l+i][c] == 0) plateau[l+i][c] = 2;
        else if (tableau[l+i][c] == 6 || tableau[l+i][c] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l+i][c] == 0) plateau[l+i][c] = 2;
        else break;
      }
    }
  }

  //HAUT
  for (int i = 1; i < 8; i++)
  { 
    if (c < 8 && c >= 0 && l-i < 8 && l-i >= 0)
    {
      if (tableau[l-i][c] != 0 && ennemie(l-i, c) == true) plateau[l-i][c] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l-i][c] == 0) plateau[l-i][c] = 2;
        else if (tableau[l-i][c] == 6 || tableau[l-i][c] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l-i][c] == 0) plateau[l-i][c] = 2;
        else break;
      }
    }
  }

  //GAUCHE
  for (int i = 1; i < 8; i++)
  { 
    if (c+i < 8 && c+i >= 0 && l < 8 && l >= 0)
    {
      if (tableau[l][c+i] != 0 && ennemie(l, c+i) == true) plateau[l][c+i] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l][c+i] == 0) plateau[l][c+i] = 2;
        else if (tableau[l][c+i] == 6 || tableau[l][c+i] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l][c+i] == 0) plateau[l][c+i] = 2;
        else break;
      }
    }
  }

  //DROITE
  for (int i = 1; i < 8; i++)
  { 
    if (c-i < 8 && c-i >= 0 && l < 8 && l >= 0)
    {
      if (tableau[l][c-i] != 0 && ennemie(l, c-i) == true) plateau[l][c-i] = 3;
      if(premiereEtapeMat == true)
      {
        if (tableau[l][c-i] == 0) plateau[l][c-i] = 2;
        else if (tableau[l][c-i] == 6 || tableau[l][c-i] == 16); //si la case est le roi, on ne fait rien
        else break;
      }
      else
      {
        if (tableau[l][c-i] == 0) plateau[l][c-i] = 2;
        else break;
      }
    }
  }
}

//**********************************************************************

boolean ennemie(int l, int c)
{
  boolean ennemie = false;

  if (testRoiEchecEnCours == true)
  {
    if (valeurActuelle == 1 || valeurActuelle == 2 || valeurActuelle == 3 || valeurActuelle == 4 ||valeurActuelle == 5 ||valeurActuelle == 6) //si la piece sélectionnée est une piece blanche....
    {
      if (tableau[l][c] == 16) ennemie = true; //lors d'un test de roi echec, seul le roi importe
      else ennemie = false;
    } else //sinon elle est noire....
    {
      if (tableau[l][c] == 6) ennemie = true;
      else ennemie = false;
    }
  } else
  {
    if (pieceBlanche == true) //si la piece sélectionnée est une piece blanche....
    {
      if (tableau[l][c] == 11 || tableau[l][c] == 12 || tableau[l][c] == 13 || tableau[l][c] == 14 ||tableau[l][c] == 15) ennemie = true; //et que la piece en face est noire alors ennemie = true
      else ennemie = false;
    } else //sinon elle est noire....
    {
      if (tableau[l][c] == 1 || tableau[l][c] == 2 || tableau[l][c] == 3 || tableau[l][c] == 4 ||tableau[l][c] == 5) ennemie = true; //et que la piece en face est blanche alors ennemie = true
      else ennemie = false;
    }
  }

  return ennemie;
}

void simulationDepBlancs()
{
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c];
      switch(tableau[l][c])
      {
      case 1:
        dPionBlanc(l, c);
        break;
      case 2:
        dTour(l, c);
        break;
      case 3:
        dCavalier(l, c);
        break;
      case 4:
        dFou(l, c);
        break;
      case 5:
        dDame(l, c);
        break;
      case 6:
        dRoi(l, c);
        break;
      }
    }
  }
  
}

void simulationDepNoirs()
{
  
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c];
      switch(tableau[l][c])
      {
      case 11:
        dPionNoir(l, c);
        break;
      case 12:
        dTour(l, c);
        break;
      case 13:
        dCavalier(l, c);
        break;
      case 14:
        dFou(l, c);
        break;
      case 15:
        dDame(l, c);
        break;
      case 16:
        dRoi(l, c);
        break;
      }
    }
  }
}