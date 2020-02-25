int Defil = 1;
Boolean Deplace = false;
void Regles ()
{
 if(pause == 0)
  {
  if(Regles==true)                                                           // Affiche une main sur les icone de navigations
  {
    if (mouseX > 20 && mouseX < 170 && mouseY >= 645 && mouseY <= 685) 
   {
    cursor(HAND);
   }
   else cursor(ARROW);
   if (Defil < 9)
   {
    if (mouseX > 840 && mouseX < 1000 && mouseY >= 645 && mouseY <= 685) 
    {
     cursor(HAND);
    }
   }
   if (mouseX > 20 && mouseX < 170 && mouseY >= 605 && mouseY <= 640) 
   {
    cursor(HAND);
  } 
  if (Defil >=2) Deplace = true;
  if (Defil ==0)
 { 
   Menu= true;
   Regles= false;
 }  
 if (Defil ==1) presentationInterface();
 if (Defil ==2) RegleBase();
 if (Defil ==3) Roi();
 if (Defil ==4) Reine ();
 if (Defil ==5) Fou ();
 if (Defil ==6) Cavalier ();
 if (Defil ==7) Tour ();
 if (Defil ==8) Pion ();
 if (Defil ==9) roquePriseEnPassant();

 }
 }
 
if (pause == 1)
 {
  if(Regles==true)
  {
    if (mouseX > 20 && mouseX < 170 && mouseY >= 645 && mouseY <= 685) 
   {
    cursor(HAND);
   }
   else cursor(ARROW);
   if (Defil < 9)
   {
    if (mouseX > 840 && mouseX < 1000 && mouseY >= 645 && mouseY <= 685) 
    {
     cursor(HAND);
    }
   }
   if (mouseX > 20 && mouseX < 170 && mouseY >= 605 && mouseY <= 640) 
   {
    cursor(HAND);
  } 
  if (Defil >=2) Deplace = true;
  if (Defil ==0)
 { 
   Regles= false;
 }  
 if (Defil ==1) presentationInterface();
 if (Defil ==2) RegleBase();
 if (Defil ==3) Roi();
 if (Defil ==4) Reine ();
 if (Defil ==5) Fou ();
 if (Defil ==6) Cavalier ();
 if (Defil ==7) Tour ();
 if (Defil ==8) Pion ();
 if (Defil ==9) roquePriseEnPassant();
 }
 
 }
}
void presentationInterface()
{
  background(160,101,61);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(70);
  text("Présentation de l'interface", width/2,50);
  fill(240, 221, 206);
  text("Présentation de l'interface", 496,46);
  image(Interface, 17, 125,500, 340);
  textSize(30);
  image (FlecheG,20, 620, 150,90);
  fill(97,54,33);
  textSize(20);
  if (pause ==0)
  {
  text("Menu",90,660);
  }
  if (pause == 1)
  {
  text("Retour",90,660);
  }
  image (FlecheD,840, 620,150,90);
  text("Suiv.",910,660);
  textSize(17);
  fill(240, 221, 206);
  textAlign(0,0);
  text("L'interface de jeu se découpe en deux :\nA droite, nous avons une interface où le joueur trouve\ntoutes les informations concernant la partie, comme\nle temps restant pour le joueur qui doit jouer,\nle chronomètre qui affiche la durée actuelle de la partie,\nl'affichage d'un message selon le déroulement de la\npartie (exemple : \"Le roi noir est en échec !\"), et enfin\nune interface qui présente les pièces prises\nau cours de la partie.\n\nA gauche, le plateau de jeu. Pour intéragir avec ce\ndernier il faut utiliser le clic gauche de sa souris, cliquer\nsur la pièce qu'on veut déplacer puis cliquer sur la case\noù on veut se déplacer (même déroulement pour\nprendre une pièce adverse).\n\nSi vous débutez aux échecs, nous vous recommandons\nd'activer le mode débutant dans les options." ,530, 140);
  text("Lorsque vous êtes en jeu, vous avez la possibilité d'appuyer\nsur la touche\"Retour Arrière\" de votre clavier pour pouvoir\nquitter la partie.\nEn mode débutant, vous pouvez faire pause en appuyant sur\nla touche \"P\" de votre clavier.",17,490);
}

void Deplacement()
{ background(160,101,61);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(70);
  text("Déplacements", width/2,50);
  fill(240, 221, 206);
  text("Déplacements", 496,46);
  image (FlecheG,20, 620, 150,90);
  fill(97,54,33);
  textSize(20);
  text("Préc.",90,660);
  image (FlecheG,20, 580, 150,90);
  if(pause ==0)
  {
  text("Menu",90,620);
  }
  if (pause ==1)
  {
  text("Retour",90,620);
  }
  if (Defil <9)
   {
    image (FlecheD,840, 620,150,90);
    text("Suiv.",910,660);
   } 
}


void RegleBase ()
{
  background(160,101,61);
  image (Reglesdebases, 17,245,395,395);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(70);
  text("Règles", width/2,50);
  fill(240, 221, 206);
  text("Règles", 496,46);
  textSize(30);
  fill(97,54,33);
  text("de bases", width/2,107);
  fill(240, 221, 206);
  text("de bases", 498,104);
  image (FlecheG,20, 620, 150,90);
  fill(97,54,33);
  textSize(20);
  text("Préc.",90,660);
  image (FlecheG,20, 580, 150,90);
  if(pause ==0)
  {
  text("Menu",90,620);
  }
  if (pause ==1)
  {
  text("Retour",90,620);
  }
  if (Defil <9)
   {
    image (FlecheD,840, 620,150,90);
    text("Suiv.",910,660);
   } 
  textSize(17);
  fill(240, 221, 206);
  textAlign(0,0);
  text("Les Échecs se jouent à 2 joueurs. L'un des joueurs joue avec les pièces blanches, et l'autre joueur avec les pièces noires.", 5, 150); 
  text("Chaque joueur a seize pièces au début du jeu: un Roi, une Dame, deux Tours, deux Fous, deux Cavaliers, et huit Pions.", 5, 170);
  text("Pour aider à noter les mouvements des pièces, chaque carré a reçu un nom. Vu du côté du joueur blanc, les lignes sont ", 5, 210);
  text("numérotées 1, 2, 3, 4, 5, 6, 7, 8; la ligne la plus proche du joueur blanc est numéroté de 1, et la plus éloignée porte le", 5, 230);
  text("numéro 8. Les colonnes sont designées, de gauche à droite, A, B, C, D,", 420, 250);
  text("E, F, G, H. Chaque carré est repéré par la combinaison de la lettre de", 420, 270);
  text("sa colonne et du numéro de sa ligne.", 420, 290);
  text("Les joueurs jouent à tour de rôle, en commençant par les Blancs. Pour ", 420, 330);
  text("jouer, un joueur doit déplacer une pièce vers une nouvelle case, en ", 420, 350);
  text("respectant les règles de déplacement de chacune des pièces, il y a", 420, 370);
  text("toutefois une exeption, appelée le roque, au cours de laquelle le ", 420, 390);
  text("joueur qui roque déplace deux pièces simultanément. ", 420, 410);
  text("Au début du jeu, la position des pièces est la suivante:", 420, 450); 
  text("Sur la première ligne on trouve, de gauche à droite huit pièces", 420, 470);
  text("blanches: une Tour, un Cavalier, un Fou, la Dame Blanche, le Roi ", 420, 490);
  text("blanc, un Fou, un Cavalier, une Tour. Sur la ligne 2, les huit Pions", 420, 510);
  text("blancs. Sur la ligne 7, les huit Pions noirs, Sur la ligne 8, les huit", 420, 530);
  text("pièces noires, de gauche à droite: une Tour, un Cavalier, un Fou, la ", 420, 550);
  text("Dame noire, le Roi noir, un Fou, un Cavalier, une Tour.", 420,570);
  text("La Dame blanche est placée sur une case blanche, alors que la Dame", 420,610);
  text("noire est placée sur une case noire", 420,630);
}

void Roi()
{
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("du Roi", width/2,100);
  fill(240, 221, 206);
  text("du Roi", 498,97);
  image(Roi,483,127, 500,500);
  textAlign(0,0);
  textSize(17);
  fill(240, 221, 206);
  text("Le Roi se déplace d'une case dans n'importe quelle", 12, 150);
  text("direction, horizontalement, verticalement, ou en", 12, 170);
  text("diagonale.", 12, 190);
  text("Le Roi est la pièce la plus importante du jeu, et ses", 12, 230);
  text("déplacements doivent être effetués de sorte à ce qu'il ne", 12, 250);
  text("soit jamais en échec.",12,270);
  text("Lorsque le Roi d'un joueur peut être pris par une pièce",12, 310);
  text("adverse, on dit qu'il est en échec. Par exemple, le joueur",12,330);
  text("blanc déplace sa tour de façon à ce qu'elle puisse",12,350);
  text("prendre le Roi noir, c'est à dire que si le Roi noir ne fait",12,370);
  text("rien, la Tour blanche peut le prendre au tour suivant: on",12,390);
  text("dit que la Tour blanche met en échec le Roi noir.",12,410);
  text("Si un joueur est en échec et qu'il ne puisse effectuer de",12,450);
  text("déplacement permettant de libérer son Roi, alors il est",12,470);
  text("dit échec et mat. Le joueur qui est échec et mat perd la",12,490);
  text("partie, et son adversaire est déclaré vainqueur.",12,510);
}
void Reine()
{ 
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("de la Dame", width/2,100);
  fill(240, 221, 206);
  text("de la Dame", 498,97);
  image(Dame,483,127, 500,500);
  textAlign(0,0);
  textSize(25);
  fill(240, 221, 206);
  text("La Dame est stratégiquement parlant,", 12, 300);
  text("la pièce maîtresse du jeu. Elle peut",12, 330);
  text("aussi bien se déplacer comme une",12, 360);
  text("Tour, horizontalement ou", 12, 390);
  text("verticalement comme un Fou, en",12,420);
  text("diagonale.",12,450);
}  
void Fou()
{ 
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("du Fou", width/2,100);
  fill(240, 221, 206);
  text("du Fou", 498,97);
  image(Fou,12,127, 475,475);
  textAlign(0,0);
  textSize(23);
  fill(240, 221, 206);
  text("Le Fou se déplace en diagonale d'autant de ", 495, 250);
  text("cases qu'il le souhaite. Toutefois, le Fou",495, 280);
  text(" ne peut sauter par dessus d'autres pièces.",495, 310);
  text("Notez que chaque joueur dispose d'un Fou ", 495, 340);
  text("se déplaçant sur les diagonales blanches ",495,370);
  text("(composées de cases blanches), et d'un Fou ",495,400);
  text("se déplaçant sur les diagonales noires",495,430);
  text("(composées de cases noires).",495,460);
}  
void Cavalier()
{ 
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("du Cavalier", width/2,100);
  fill(240, 221, 206);
  text("du Cavalier", 498,97);
  image(Cavalier,12,127, 475,475);
  textAlign(0,0);
  textSize(23);
  fill(240, 221, 206);
  text("Le Fou se déplace en diagonale d'autant de ", 495, 250);
  text("cases qu'il le souhaite. Toutefois, le Fou",495, 280);
  text(" ne peut sauter par dessus d'autres pièces.",495, 310);
  text("Notez que chaque joueur dispose d'un Fou ", 495, 340);
  text("se déplaçant sur les diagonales blanches ",495,370);
  text("(composées de cases blanches), et d'un Fou ",495,400);
  text("se déplaçant sur les diagonales noires",495,430);
  text("(composées de cases noires).",495,460);
}  
void Tour()
{ 
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("de la Tour", width/2,100);
  fill(240, 221, 206);
  text("de la Tour", 498,97);
  image(Tour,12,127, 475,475);
  textAlign(0,0);
  textSize(23);
  fill(240, 221, 206);
  text("La Tour se déplace en ligne droite, ", 495, 250);
  text("horizontalement ou verticalement d'autant ",495, 280);
  text("de cases qu'elle le souhaite. La Tour ne ",495, 310);
  text("peut sauter par dessus d'autres pièces: ", 495, 340);
  text("toutes les cases entre la position de ",495,370);
  text("départ de la Tour et sa position d'arrivée ",495,400);
  text("doivent être libres.",495,430);
}  
void Pion()
{ 
  Deplacement();
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(30);
  text("du Pion", width/2,100);
  fill(240, 221, 206);
  text("du Pion", 498,97);
  textSize(17);
  fill(240, 221, 206);
  image (Pion, 17,210,395,395);
  textAlign(0,0);
  text("Les Pions se déplacent différemment selon qu'ils vont sur une case libre ou qu'ils se déplacent pour prendre une pièce", 5, 150); 
  text("adverse. Quand un Pion ne prend pas de pièce adverse, il avance d'une case verticalement (il ne peut reculer).", 5, 170);
  text("Toutefois, si un Pion n'a pas encore bougé depuis le début de la partie (autrement dit, s'il est toujours sur sa ligne ", 5, 190);
  text("de départ), le Pion est autorisé à avancer verticalement de deux cases d'un coup. Par exemple, un Pion blanc en d2 peut", 5, 210);
  text("au choix aller en d3 ou en d4. Quand il prend une pièce adverse, le ",  420,230);
  text("Pion se déplace en avançant en diagonale d'une case (il ne peut ", 420, 250);
  text("prendre en reculant). Par exemple un Pion blanc en d2 peut prendre ", 420, 270);
  text("un Cavalier noir se trouvant en e3.", 420, 290);
  text("Un Pion qui atteint la huitième ligne de l'échiquier (ligne 8 pour ", 420, 330);
  text("les blancs, ligne 1 pour les noirs) va à dame. Le joueur qui amene ", 420, 350);
  text("l'un de ses Pions jusqu'à la huitième ligne remplace ce Pion par une", 420, 370);
  text(" Dame, une Tour, un Cavalier ou un Fou (de meme couleur bien entendu).", 420, 390);
  text(" Habituellement, les joueurs changent leur Pion en Dame, mais ce ", 420, 410);
  text("n'est pas une obligation. Tous les autres types de pièces sont ",420,430);
  text("autorisés. (Il n'est pas obligatoire de remplacer un Pion dans ", 420, 450); 
  text("cette situation par une pièce ayant ete prise auparavant. Ainsi, ", 420, 470);
  text("il est par exemple possible qu'un joueur, à un moment de la ", 420, 490);
  text("partie, possède deux Dames...) ", 420, 510);
} 
void roquePriseEnPassant()
{ background(160,101,61);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(70);
  text("Roque et prise en passant", width/2,50);
  fill(240, 221, 206);
  text("Roque et prise en passant", 496,46);
  image (roque, 17,110,220,220);
  image (PriseEnPassant, 750,370,240,240);
  image (FlecheG,20, 620, 150,90);
  fill(97,54,33);
  textSize(20);
  text("Préc.",90,660);
  image (FlecheG,20, 580, 150,90);
  if(pause ==0)
  {
  text("Menu",90,620);
  }
  if (pause ==1)
  {
  text("Retour",90,620);
  }
  if (Defil <9)
   {
    image (FlecheD,840, 620,150,90);
    text("Suiv.",910,660);
   }
  textSize(17);
  fill(240, 221, 206);
  textAlign(0,0);
  text("Le roque est un mouvement particulier, déplaçant 2 pièces d'un coup. C'est le seul\ncoup de ce type. Il a pour but de protéger le roi et de développer une des tours.\nIl faut cliquer sur le roi puis cliquer sur la tour pour effectuer ce déplacement. Le roi se\ndéplace de 2 cases vers la tour visée, et la tour lui saute par dessus. Il n'est possible\nde le faire qu'à certaines conditions :\n      - Les cases entre la tour et le roi doivent être inoccupées, et aucune pièce ennemie\nne doit pouvoir se déplacer dessus.\n      - Le roi ne doit pas être dans une situation d'échec et la tour ne doit pas pouvoir\nêtre prise.",265,115);
  text("La prise en passant se fait uniquement entre pions. Elle permet à un pion de prendre\nun pion ennemi comme s'il venait d'avancer d'une seule case au lieu de deux. Cela ne\npeut se faire que si le pion pris vient de se déplacer de deux cases, qu'il ait ou non\nprovoqué un échec. La prise en passant se fait comme indiquée ci-contre :\nPour prendre le pion noir, il faut simplement cliquer sur son pion puis sur la case que\nle pion averse a sauté.",17,400);
}