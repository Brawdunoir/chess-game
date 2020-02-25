int depPieceEnnemie[][] = new int[8][8];
int sauvegardeEchecEtMat[][] = new int[8][8];
//indices roi noir
int CRN = 0;
int LRN = 0;

//indices roi blanc
int CRB = 0;
int LRB = 0;

//indices pièces ennemies non définies
int c1 = -1;
int l1 = -1;


//et leur valeur
int v1;


//Le roi peut-il bouger ?
boolean roiToujoursEchec = false;
//Pour "passer à travers" le roi lors des déplacement (sert à la première étape)
boolean premiereEtapeMat = false;

void testMat()
{
  testRoiEchec();
  roiToujoursEchec = false;
  if (roiBlancEchec == 1 || roiNoirEchec == 1)
  {
    positionRois();
    premiereEtape();
    positionRois();

    if (roiToujoursEchec == true)
    {
      deuxiemeEtape();
      positionRois();

      if (roiToujoursEchec == true)
      {
        troisiemeEtape();
         if(roiToujoursEchec == true)
         {
           if(roiNoirEchec == 1)
           {
             roiNoirEchec = 2;
             fin = true;
             gagnant = "blancs";
           }
           if(roiBlancEchec == 1)
           {
             roiBlancEchec = 2;
             fin = true;
             gagnant = "noirs";
           }
         }
      }
    }
  }
}


void positionRois()
{
  for (int l=0; l<8; l++) //On balaie le tableau afin de sauvegarder les indices des Rois
  {
    for (int c=0; c<8; c++)
    {
      if (tableau[l][c] == 16)
      {
        CRN = c;
        LRN = l;
      }
      if (tableau[l][c] == 6)
      {
        CRB = c;
        LRB = l;
      }
    }
  }
}

void indicePieceEnnemieBlanches()
{
  //********************************************************ROI NOIR********************************************************

  //On simule le déplacement de toutes les pieces BLANCHES pour savoir si elles peuvent prendre le roi NOIR
  testRoiEchecEnCours = true;
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c]; //cf deplacementPieces (puisqu'on ne clique pas dessus, on doit quand même savoir la valeur de la pièce pour connnaître ses déplacements)
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
      //Si une pièce peut prendre le roi, on note sa valeur et ses indices
      if (plateau[LRN][CRN] == 3)
      {
        if (c1 == -1 && l1 == -1)
        {
          c1 = c;
          l1 = l;
          v1 = valeurActuelle;
        } 
      }
      
      reinitialiserCases();
      
    }
  }
  testRoiEchecEnCours = false;
}


void indicePieceEnnemieNoires()
{
  //********************************************************ROI BLANC********************************************************

  //On simule le déplacement de toutes les pieces NOIRES pour savoir si elles peuvent prendre le roi BLANC
  testRoiEchecEnCours = true;
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c]; //cf deplacementPieces (puisqu'on ne clique pas dessus, on doit quand même savoir la valeur de la pièce pour connnaître ses déplacements)
      switch(tableau[l][c])
      {
      case 11:
        dPionBlanc(l, c);
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
      //Si une pièce peut prendre le roi, on note sa valeur et ses indices
      if (plateau[LRB][CRB] == 3)
      {
        if (c1 == -1 && l1 == -1)
        {
          c1 = c;
          l1 = l;
          v1 = valeurActuelle;
        } 
      }
      reinitialiserCases();
    }
  }
  testRoiEchecEnCours = false;
}

void priseParPieceAmieBlanches()
{
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c]; //cf deplacementPieces (puisqu'on ne clique pas dessus, on doit quand même savoir la valeur de la pièce pour connnaître ses déplacements)
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
  //On regarde si une de ses pièces peut prendre la piece ennemie qui le met en echec (si il y a 2 pieces ou plus, le roi ne peut être sauvé que par un de ses propres déplacement)
  if (c1 != -1 && l1 != -1)
  {
    if (plateau[l1][c1] == 3)
    {
      roiToujoursEchec = false;
    }
  }
}
void priseParPieceAmieNoire()
{
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      valeurActuelle = tableau[l][c]; //cf deplacementPieces (puisqu'on ne clique pas dessus, on doit quand même savoir la valeur de la pièce pour connnaître ses déplacements)
      switch(tableau[l][c])
      {
      case 11:
        dPionBlanc(l, c);
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
  //On regarde si une de ses pièces peut prendre la piece ennemie qui le met en echec
  if (c1 != -1 && l1 != -1)
  {
    if (plateau[l1][c1] == 3)
    {
      roiToujoursEchec = false;
    }
  }
}

void depPieceEnnemie()
{
  switch(v1)
  {
  case 12:
    dTour(l1, c1);
    break;
  case 14:
    dFou(l1, c1);
    break;
  case 15:
    dDame(l1, c1);
    break;
  case 2:
    dTour(l1, c1);
    break;
  case 4:
    dFou(l1, c1);
    break;
  case 5:
    dDame(l1, c1);
    break;
  }
  for (int l=0; l<8; l++)
  {
    for (int c=0; c<8; c++)
    {
      if (plateau[l][c] == 2)
      {
        depPieceEnnemie[l][c] = 2; //On met des 2 où la pièce peut se déplacer
      }
    }
  }
  reinitialiserCases();
}

void depPieceAmie()
{
  if (roiNoirEchec == 1)
  {
    reinitialiserCases();
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
        }
        for (int x =0; x<8; x++)
        {
          for (int y=0; y <8; y++)
          {
            if (plateau[y][x] == depPieceEnnemie[y][x]) //si il y a un point d'intersection entre leur deux trajectoires
            {
              
              faireSauvegardeEmplacementPiecesEchecEtMat();
              ////on change de place la pièce
              tableau[l][c] = 0;
              tableau[y][x] = 11;
              
              reinitialiserCases();
              
              testRoiEchec(); //on fait un testRoiEchec
              
              if(roiNoirEchec == 0 && valeurActuelle != 0) //si le roi n'est plus echec, c'est fini, on remet la pièce à sa place et on sort des boucles
              {              
                roiToujoursEchec = false;
                appliquerSauvegardeEchecEtMat();
                testRoiEchec();
                
              }
              else if (roiNoirEchec == 1 || valeurActuelle == 0) //sinon on remet juste la piece à sa place et on continue
              {
                appliquerSauvegardeEchecEtMat();
              }
              
            }
          }
        }
      }
    }
  } else if (roiBlancEchec == 1)
  {
    for (int l=0; l<8; l++)
    {
      for (int c=0; c<8; c++)
      {
        reinitialiserCases();
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
        }
        for (int x =0; x<8; x++)
        {
          for (int y=0; y <8; y++)
          {
            if (plateau[y][x] == depPieceEnnemie[y][x]) //si il y a un point d'intersection entre leur deux trajectoires
            {
              faireSauvegardeEmplacementPiecesEchecEtMat();
              //on change de place la pièce
              tableau[l][c] = 0;
              tableau[y][x] = 1;
              
              reinitialiserCases();
              
              testRoiEchec(); //on fait un testRoiEchec
              if(roiBlancEchec == 0) //si le roi n'est plus echec, c'est fini, on remet la pièce à sa place et on sort des boucles
              {
                roiToujoursEchec = false;
                appliquerSauvegardeEchecEtMat();
                testRoiEchec();
                break;
              }
              else if (roiBlancEchec == 1 || valeurActuelle == 0) //sinon on remet juste la piece à sa place et on continue
              {
                appliquerSauvegardeEchecEtMat();
              }
            }
          }
        }
        reinitialiserCases();
      }
    }
  }
}



void roiPeutBouger()
{
  int L = 0;
  int C = 0;
  boolean peutBouger = false;
  
  premiereEtapeMat = true;
  
  if (roiNoirEchec == 1) //si on traite le cas du roi NOIR ->
  {
    //On simule le déplacement de toutes les pieces BLANCHES pour savoir si elles peuvent prendre le roi NOIR
    testRoiEchecEnCours = true;
    simulationRoqueEnCours = true; //le pion voit ses cases de piece converties en cases de déplacement (parce que c'est ce que l'on cherche)
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
    testRoiEchecEnCours = false;
    simulationRoqueEnCours = false;
    L = LRN; //on copie les index du roi
    C = CRN;
  } else if (roiBlancEchec == 1) //si on traite le cas du roi BLANC ->
  {
    //On simule le déplacement de toutes les pieces NOIRES pour savoir si elles peuvent prendre le roi BLANC
    testRoiEchecEnCours = true;
    simulationRoqueEnCours = true; //le pion voit ses cases de piece converties en cases de déplacement (parce que c'est ce que l'on cherche)
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
    testRoiEchecEnCours = false;
    simulationRoqueEnCours = false;
    L = LRB; //on copie les index du roi
    C = CRB;
  }
  premiereEtapeMat = false;
  
  
  //Les instructions sont là pour vérifier qu'on ne sort pas du tableau
  if(L-1 > 0)
  {
    if(C-1 > 0)
    {
      if(plateau[L-1][C-1] != 2 && tableau[L-1][C-1] == 0) peutBouger = true;
    }
    if(C+1 < 8)
    {
      if(plateau[L-1][C+1] != 2  && tableau[L-1][C+1] == 0) peutBouger = true;
    }
    
    if(plateau[L-1][C] != 2  && tableau[L-1][C] == 0) peutBouger = true;  
  }
  
  
  if(L+1 < 8)
  {
    if(C-1 > 0)
    {
      if(plateau[L+1][C-1] != 2  && tableau[L+1][C-1] == 0) peutBouger = true; 
    }
    
    if(C+1 < 8)
    {
      if(plateau[L+1][C+1] != 2  && tableau[L+1][C+1] == 0) peutBouger = true;
    }
    
    if(plateau[L+1][C] != 2  && tableau[L+1][C] == 0) peutBouger = true;
  }
  if(peutBouger == true) roiToujoursEchec = false;
  else roiToujoursEchec = true;
  
  defautCases();
}

void faireSauvegardeEmplacementPiecesEchecEtMat()
{
  for (int l = 0; l<8; l++)
  {
    for (int c = 0; c< 8; c++)
    {
      sauvegardeEchecEtMat[l][c] = tableau[l][c];
    }
  }
}

void appliquerSauvegardeEchecEtMat()
{
  for (int l = 0; l<8; l++)
  {
    for (int c = 0; c< 8; c++)
    {
      tableau[l][c] = sauvegardeEchecEtMat[l][c];
    }
  }
}

void premiereEtape()
{
  roiPeutBouger(); //on regarde si le roi peut bouger ou non pour se sortir de l'échec
}

void deuxiemeEtape()
{
  if (roiNoirEchec == 1)
  {
    indicePieceEnnemieBlanches();
    priseParPieceAmieNoire();
  } else if (roiBlancEchec == 1)
  {
    indicePieceEnnemieNoires();
    priseParPieceAmieBlanches();
  }
}

void troisiemeEtape()
{
  if (v1 != 1 || v1 != 11 || v1 != 3 || v1 != 13 || v1 != 6 || v1 != 16) //si la pièce qui pose problème n'est pas un roi, un cavalier ou un pion, on peut se mettre en travers (peut-être) entre elle et notre roi
  {
    //On déclare les cases sur lesquelles elle peut se déplacer
    depPieceEnnemie();
    depPieceAmie();
  } else roiToujoursEchec = true; //sinon le roi est directement échec et mat
}