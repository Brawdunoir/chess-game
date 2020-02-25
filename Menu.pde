boolean Jouer = false;
boolean Regles = false ;
boolean Option = false ;
boolean Menu = true;
boolean lancerChrono = false;
boolean lancerRebours = false;
boolean test = false;


void menu ()
{ 
  background(160,101,61);
  image (Fond, 0,0,1000,700);
  fill(240, 221, 206);
  textSize(15);
  text("Réalisé par BATIN Cassandra & LACROIX Yann",815,685);
  fill(97,54,33);
  textAlign(CENTER,CENTER);
  textSize(100);
  text("Echec & Mat", width/2,75);
  textSize(35);
  text("Jouer", 802,302);
  text("Règles", 802,402);
  text("Options",802,502);
  textSize(100);
  fill(240, 221, 206);
  text("Echec & Mat", 495,70);
  textSize(35);
  text("Jouer", 800,300);
  text("Règles", 800,400);
  text("Options",800,500);
  if ((pause==0) && (retour==0) && (fin == false) &&(promotionPionBlanc == false) && (promotionPionNoir == false))
  {
  if (Menu == true)
  {
   if (mouseX > 745 && mouseX < 860 && mouseY >= 280 && mouseY <= 350) 
    {
     cursor(HAND);                                                    //Affiche une main quand on positione la souris sur "Jouer"
    }
   else cursor(ARROW);
   if (mouseX > 745 && mouseX < 860 && mouseY >= 380 && mouseY <= 450)
   {
    cursor(HAND);                                                    //Affiche une main quand on positione la souris sur "Règles"
   }
   if (mouseX > 745 && mouseX < 860 && mouseY >= 480 && mouseY <= 550)
   {
    cursor(HAND);                                                    //Affiche une main quand on positione la souris sur "Options"
   }
  }
  else cursor(ARROW);
  }
  if (Jouer == true)                                                 //Lance le jeu
  {
   background(160,101,61);
   dessinerPlateau();
   balayerTableau();
   afficherMessage();
   if(lancerChrono == false)
   {   tempsDepart();
   lancerChrono = true;
   }
   if(lancerRebours == false)
   {   ReboursDepart();
   lancerRebours = true;
   }
   chrono();
   compteRebours();
   compteRebours2();
    if ((pause ==1) && (retour ==0))       //Affiche la pause
   { 
     pause();
   }
   if ((retour ==1) && (pause==0))        //Affiche la confirmation de quitter
   {
     Retour();
   }
   if ((pause ==1) && (retour ==1))      //Affiche la confirmation de quitter lancée depuis la pause
   {
     Retour();
   }
    if(promotionPionBlanc == true || promotionPionNoir == true)
   {
     interfacePromotion();
   }
  }
  if(fin == true)
  {
    if(test == false)
    {
      tempsFin();
      test = true;
    }
    menuFin();
  }
  if(Regles == true)                             // Affiche les règles
  {
    Regles();
  }
  if(Option == true)                            // Affiches les options
  {
    Option ();
  }
}