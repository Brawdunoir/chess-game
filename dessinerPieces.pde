//N = +10 ou B = +0
//P = 1; T = 2; C = 3; F = 4; D = 5; R = 6;

int piecesMortes[][] = new int [4][8];

//nombre de .... sur l'échéquier :
int pb = 0;
int pn = 0;
int rn = 0;
int rb = 0;
int tn = 0;
int tb = 0;
int fb = 0;
int fn = 0;
int cb = 0;
int cn = 0;

void balayerTableau()
{
  //On réinitialise le nombre de pièces sur l'échéquier
  pb = 0;
  pn = 0;
  rn = 0;
  rb = 0;
  fn = 0;
  fb = 0;
  tn = 0;
  tb = 0;
  cn = 0;
  cb = 0;
  //Coordonnées pour dessiner les pièces
  int x;
  int y;
  //Grosseur de la pièce
  int L;
  
  
  
  // On balaye le tableau 
  for (int l = 0; l < 8; l ++)
  {
    for (int c = 0; c < 8; c ++)
    {
      //On initialise les coordonnées
      x = c * 80 +30;
      y = l * 80 +30;
      L = 80;
      //Suivant la valeur, on attribue des images aux cases du tableau
      switch (tableau[l][c])
      {
      case 1 :
        image(pionBlanc, x, y,L,L);
        pb++;
        break;
      case 2 :
        image(TourBlanche,x,y,L,L);
        tb++;
        break;
      case 3 :
        image(CavalierBlanc,x,y,L,L);
        cb++;
        break;
      case 4 :
        image(fouBlanc, x, y,L,L);
        fb++;
        break;
      case 5 :
        image(reineBlanche, x,y,L,L);
        rb++;
        break;
      case 6 :
        image(roiBlanc,x,y,L,L);
        break;
      case 11 :
        image(pionNoir, x, y,L,L);
        pn++;
        break;
      case 12 :
        image(TourNoire,x,y,L,L);
        tn++;
        break;
      case 13 :
        image(CavalierNoir,x,y,L,L);
        cn++;
        break;
      case 14 :
        image(fouNoir, x, y,L,L);
        fn++;
        break;
      case 15 :
        image(reineNoire, x,y,L,L);
        rn++;
        break;
      case 16 :
        image(roiNoir,x,y,L,L);
        break;
      }
    }
  }
  
  remplirPiecesMortes();
  
  // On balaye le tableau nommé "Pieces mortes"
  for (int l = 0; l < 4; l ++)
  {
    for (int c = 0; c < 8; c ++)
    {
      //On initialise les coordonnées
      x = c * 35 + 710;
      y = l * 60 + 400;
      L = 40;
      //Suivant la valeur, on attribue des images aux cases du tableau
      switch (piecesMortes[l][c])
      {
      case 1 :
        image(pionBlanc, x, y,L,L);
        break;
      case 2 :
        image(TourBlanche,x,y,L,L);
        break;
      case 3 :
        image(CavalierBlanc,x,y,L,L);
        break;
      case 4 :
        image(fouBlanc, x, y,L,L);
        break;
      case 5 :
        image(reineBlanche, x,y,L,L);
        break;
      case 6 :
        image(roiBlanc,x,y,L,L);
        break;
      case 11 :
        image(pionNoir, x, y,L,L);
        break;
      case 12 :
        image(TourNoire,x,y,L,L);
        break;
      case 13 :
        image(CavalierNoir,x,y,L,L);
        break;
      case 14 :
        image(fouNoir, x, y,L,L);
        break;
      case 15 :
        image(reineNoire, x,y,L,L);
        break;
      case 16 :
        image(roiNoir,x,y,L,L);
        break;
      }
    }
  }
}

void remplirPiecesMortes()
{
  //***PIECES NOIRES***
  //Les pions
  for(int i = 0; i < 8-pn; i++)
  {
    piecesMortes[0][i] = 11;
  }
  
  //Les tours
  if(tn == 1)
  {
    piecesMortes[1][0] = 12;
  }
  else if(tn == 0)
  {
    piecesMortes[1][0] = 12;
    piecesMortes[1][7] = 12;
  }
  
  //Les cavaliers
  if(cn ==1)
  {
    piecesMortes[1][1] = 13;
  }
  else if(cn == 0)
  {
    piecesMortes[1][1] = 13;
    piecesMortes[1][6] = 13;
  }
  
  //Les fous
  if(fn == 1)
  {
    piecesMortes[1][2] = 14;
  }
  else if(fn==0)
  {
    piecesMortes[1][2] = 14;
    piecesMortes[1][5] = 14;
  }
  //La reine
  if(rn == 0) piecesMortes[1][3]= 15;
  
  
  //***PIECES BLANCHES***
  for(int i = 0; i < 8-pb; i++)
  {
    piecesMortes[2][i] = 1;
  }
  
  //Les tours
  if(tb == 1)
  {
    piecesMortes[3][0] = 2;
  }
  else if(tb == 0)
  {
    piecesMortes[3][0] = 2;
    piecesMortes[3][7] = 2;
  }
  
  //Les cavaliers
  if(cb ==1)
  {
    piecesMortes[3][1] = 3;
  }
  else if(cb == 0)
  {
    piecesMortes[3][1] = 3;
    piecesMortes[3][6] = 3;
  }
  
  //Les fous
  if(fb == 1)
  {
    piecesMortes[3][2] = 4;
  }
  else if(fb==0)
  {
    piecesMortes[3][2] = 4;
    piecesMortes[3][5] = 4;
  }
  //La reine
  if(rb == 0) piecesMortes[3][3]= 5;
}

void defautPieces()
{
  
  //remettre toutes les cases à vide
  for(int l=0; l < 8; l++)
  {
    for(int c = 0; c< 8; c++)
    {
      tableau[l][c] = 0;
    }
  }
  
  //remettre les pièces dans l'ordre
  
  for(int i = 0; i < 8 ; i++)
  {
    //PIONS
    //BLANCS
    tableau [6][i] = 1;
    
    //PIONS
    //NOIRS
    tableau [1][i] = 11;
    
    
    //*******************************************AUTRES PIECES*******************************************
    
    
    //*********************TOURS*********************
    
    if (i == 0 || i == 7)
    {
      //BLANCS
      tableau[7][i] = 2;
      
      //NOIRS
      tableau[0][i] = 12;
    }
    
     //*********************CAVALIERS*********************
     
    if (i == 1 || i == 6)
    {
      //BLANCS
      tableau[7][i] = 3;
      
      //NOIRS
      tableau[0][i] = 13;
    }
    
    //*********************FOUS*********************
    
    if (i == 2 || i == 5)
    {
      //BLANCS
      tableau[7][i] = 4;
      
      //NOIRS
      tableau[0][i] = 14;
    }
    
    //*********************DAMES*********************
    
    if (i == 3)
    {
      //BLANC
      tableau[7][i] = 5;
      
      //NOIR
      tableau[0][i] = 15;
    }
    
    //*********************ROI*********************
    
    if (i == 4)
    {
      //BLANC
      tableau[7][i] = 6;
      
      //NOIR
      tableau[0][i] = 16;
    }
  }

  viderPiecesMortes(); //comme son nom l'indique, on enlève les pièces mortes
}

void viderPiecesMortes()
{
for(int l=0; l < 4; l++)
  {
    for(int c = 0; c< 8; c++)
    {
      piecesMortes[l][c] = 0;
    }
  }
}