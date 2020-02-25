int roiBlancEchec = 0; //0 = pas échec, 1 = échec, 2 = échec et mat
int roiNoirEchec = 0; //0 = pas échec, 1 = échec, 2 = échec et mat

int valeurActuelle; //valeur dans la case du tableau lors du balayage pour savoir s'il s'agit d'une pièce blanche ou noir, car le boolean piece blanche n'est pas accessible puisque absence de clic
boolean testRoiEchecEnCours = false;

boolean dejaEchec = false; //simplement pour choisir le message à afficher

void testEchec()
{
  
  testRoiEchec();
  testMat();

  if (tourBlanc == true) //si c'est le tour du blanc
  {
    if (roiBlancEchec == 1) //le roi blanc est en echec donc on fait recommencer le tour
    {
      if(dejaEchec == false) phrasePrincipale = "Impossible de faire\n ce déplacement";
      else phrasePrincipale = "Déplacement impossible\n(toujours échec)";
      appliquerSauvegarde();
    } 
    else if (roiNoirEchec == 1)
    {
      phrasePrincipale = "Roi noir en échec";
      changementTour();
      dejaEchec = true;
    } else if (roiBlancEchec == 0)
    {
      changementTour();
      phrasePrincipale = "";
      dejaEchec = false;
      messageRoqueDebutant();
    }
  }
  
  
  else //si c'est le tour du noir
  {
    if (roiNoirEchec == 1)
    {
      if(dejaEchec == false) phrasePrincipale = "Impossible de faire\n ce déplacement";
      else phrasePrincipale = "Déplacement impossible\n(toujours échec)";
      appliquerSauvegarde();
    }
    else if(roiBlancEchec == 1)
    {
      phrasePrincipale = "Roi blanc en échec";
      changementTour();
      dejaEchec = true;
    }
    else if(roiNoirEchec == 0)
    {
      changementTour();
      phrasePrincipale = "";
      messageRoqueDebutant();
      dejaEchec = false;
    }
  }

}

void testRoiEchec()
{
  //indices roi noir
  int CRN = 0;
  int LRN = 0;
  //indices roi blanc
  int CRB = 0;
  int LRB = 0;

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

  //********************************************************ROI NOIR********************************************************

  //On simule le déplacement de toutes les pieces BLANCHES pour savoir si elles peuvent prendre le roi NOIR
  testRoiEchecEnCours = true;
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
  if (plateau[LRN][CRN] == 3) //si le roi peut être pris...
  {

    roiNoirEchec = 1; //il est echec
  } 
  else //sinon le roi est libre
  {
    roiNoirEchec = 0;
  }

  reinitialiserCases(); //on remet les cases normales

  //********************************************************ROI BLANC********************************************************

  //On simule le déplacement de toutes les pieces NOIRES pour savoir si elles peuvent prendre le roi BLANC
  testRoiEchecEnCours = true;
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
  if (plateau[LRB][CRB] == 3) //si le roi peut être pris...
  {
    roiBlancEchec = 1;
  } else
  {
    roiBlancEchec = 0;
  }

  reinitialiserCases();
  valeurActuelle = 0;
}