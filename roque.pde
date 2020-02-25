//savoir si l'on a déjà bougé les tours ou le roi 
boolean dTB1 = false; //indices 7,0
boolean dTB2 = false; //7,7
boolean dTN1 = false; //0,0
boolean dTN2 = false; //0,7
boolean dRN = false; //0,4
boolean dRB = false; //7,4

//quel roque veut-on faire ?
boolean PRB = true; //Petit Roque Blanc
boolean GRB = false; //Grand Roque Blanc
boolean PRN = false; //Petit Roque Noir
boolean GRN = false; //Grand Roque Noir

boolean simulationRoqueEnCours = false; //pour afficher le déplacement des pions en diagonale, par soucis de simplification le temps de la simulation

void verifRoque()
{
  verificatonDeplacementPiecesRoque();
  verifDeplacementRoque();
}

void verificatonDeplacementPiecesRoque()
{
  // on vérifie si une tour ou le roi ont déjà bougé
 if(tableau[7][0] != 2 && dTB1 == false) dTB1 = true;
 if(tableau[7][7] != 2 && dTB2 == false) dTB2 = true;
 if(tableau[0][0] != 12 && dTN1 == false) dTN1 = true;
 if(tableau[0][7] != 12 && dTN2 == false) dTN2 = true;
 if(tableau[0][4] != 16 && dRN == false) dRN = true;
 if(tableau[7][4] != 6 && dRB == false) dRB = true;
}
void messageRoqueDebutant()
{
  if(modeDebutant == true)
  {
    if((tourBlanc == true && PRB == true) || (tourNoir == true && PRN == true)) phrasePrincipale = "Petit Roque possible !";
    if((tourBlanc == true && GRB == true) || (tourNoir == true && GRN == true)) phrasePrincipale = "Grand Roque possible !";
  }
}
void verifDeplacementRoque()
{
  //********************Petit Roque Blanc********************
  if(dRB == false && dTB2 == false && tableau[7][5] == 0 && tableau[7][6] == 0)
  { 
    simulationRoqueEnCours = true;
    testRoiEchecEnCours = true;
    simulationDepNoirs();
    simulationRoqueEnCours = false;
    testRoiEchecEnCours = false;
    
    if (plateau[7][5] != 2 && plateau[7][6] != 2 && plateau[7][7] != 3 && plateau[7][4] != 3)
    {
      PRB = true;
    }
    else PRB = false;
    reinitialiserCases();
  }
  else PRB = false;
  //********************Grand Roque Blanc********************
  if(dRB == false && dTB1 == false && tableau[7][1] == 0 && tableau[7][2] == 0 && tableau[7][3] == 0)
  {
    simulationRoqueEnCours = true;
    testRoiEchecEnCours = true;
    simulationDepNoirs();
    simulationRoqueEnCours = false;
    testRoiEchecEnCours = false;
    
    if (plateau[7][1] != 2 && plateau[7][2] != 2 && plateau[7][3] != 2 && plateau[7][0] != 3 && plateau[7][4] != 3)
    {
      GRB = true;
    }
    else GRB = false;
    
    reinitialiserCases(); 
  }
  else GRB = false;
  
  //********************Petit Roque Noir********************
  if(dRN == false && dTN2 == false && tableau[0][5] == 0 && tableau[0][6] == 0)
  {
    simulationRoqueEnCours = true;
    testRoiEchecEnCours = true;
    simulationDepBlancs();
    simulationRoqueEnCours = false;
    testRoiEchecEnCours = false;
    
    if(plateau[0][5] != 2 && plateau[0][6] != 2 && plateau[0][7] != 3 && plateau[0][4] != 3)
    {
      PRN = true;
    }
    else PRN = false;
    reinitialiserCases();
  }
  else PRN = false;
  
  //********************Grand Roque Noir********************
  if(dRN == false && dTN1 == false && tableau[0][1] == 0 && tableau[0][2] == 0 && tableau[0][3] == 0)
  {
    simulationRoqueEnCours = true;
    testRoiEchecEnCours = true;
    simulationDepBlancs();
    simulationRoqueEnCours = false;
    testRoiEchecEnCours = false;
    
    if(plateau[0][1] != 2 && plateau[0][2] != 2 && plateau[0][3] != 2 && plateau[0][0] != 3 && plateau[0][4] != 3)
    {
      GRN = true;
    }
    else GRN = false;
    reinitialiserCases();
  }
  else GRN = false;
}

void afficherRoque()
{
  if(tourBlanc == true && PRB == true) plateau[7][7] = 4;
  if(tourBlanc == true && GRB == true) plateau[7][0] = 4;
  
  if(tourNoir == true && PRN == true) plateau[0][7] = 4;
  if(tourNoir == true && GRN == true) plateau[0][0] = 4;
}

void faireRoque()
{
  
  //Roque Blanc
  if(PRB == true && colonne == 7 && ligne == 7)
  {
    //on fait le changement de place des pièces & on les supprime
    tableau[7][4] = 0;
    tableau[7][7] = 0;
    tableau[7][6] = 6;
    tableau[7][5] = 2;
    verifRoque();
  }
  if(GRB == true && colonne == 0 && ligne == 7)
  {
    tableau[7][4] = 0;
    tableau[7][0] = 0;
    tableau[7][3] = 2;
    tableau[7][2] = 6;
    verifRoque();
  }
  
  //Roque Noir
  if(PRN == true && colonne == 7 && ligne == 0)
  {
    //on fait le changement de place des pièces & on les supprime
    tableau[0][4] = 0;
    tableau[0][7] = 0;
    tableau[0][6] = 16;
    tableau[0][5] = 12;
    verifRoque();
  }
  if(GRN == true && colonne == 0 && ligne == 0)
  {
    tableau[0][4] = 0;
    tableau[0][0] = 0;
    tableau[0][3] = 12;
    tableau[0][2] = 16;
    verifRoque();
  }
}