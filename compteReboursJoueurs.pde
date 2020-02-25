int reboursStart1=0,reboursStart2=0;

boolean chrono1 = true;
boolean chrono2 = false;

//********************* Compte à rebours du joueur 1 *********************
void ReboursDepart()
{
  reboursStart1= hour()*3600 + minute() * 60 + second();//prend l'heure de l'ordinatateur quand le chrono se lance
  reboursStart2= reboursStart1;
}

void compteRebours()
{
   if (chrono1==true)
  { textAlign(0,0);
    textSize(25);
    fill(240, 221, 206);
  int seconde_chrono, minute_chrono, heure_chrono, rebours, timeback;

  {
   if (fin== false)
    {
    if (pause==0) time_current= hour()*3600 + minute()* 60 + second();//prend l'heure actuelle de l'ordinateur
        else time_current= memo_temps_current;  //***********************************************************************************************************************************************************************
    
    rebours =(time_current)-(reboursStart1);//calcule le temps écoulé
    timeback = 120-(rebours);
    }
    else
    {
      rebours =(time_fin)-(reboursStart1);
      timeback = 120-(rebours);
    }
    
    heure_chrono=timeback/3600;
    minute_chrono=(timeback-heure_chrono*3600)/60;
    seconde_chrono=timeback%60;
    
   
    if (timeback >0)
    {
     if ((minute_chrono<10) && (minute_chrono>=0)) //affiche un 0 pour les dizaine de minutes tant que le temps est inférieur 10 min
    { 
      text("0", 758.5, 70);
      text(minute_chrono, 774.5, 70);
    } else 
    {
      text(minute_chrono, 763.5, 70);
    }

    text(":", 790.5, 70);

    if ((seconde_chrono<10) && (seconde_chrono>=0))//affiche un 0 pour les dizaine de secondes tant que les secondes sont inférieures à 10 sec
    {
      text("0", 798.5, 70);
      text(seconde_chrono, 814, 70);
    } else
    {
      text(seconde_chrono, 798.5, 70);
    }
    }
    else text ("00:00", 758.5, 70);
    if (timeback <= 0  && modeDebutant == true)                                 //Passe à l'autre joueur quand le chrono arrive à 00:00
    {
      tourBlanc = false;
      tourNoir = true;
      lancerRebours = false;
      chrono2 = true;
      chrono1 = false;
    }
    else if (modeDebutant == false && timeback <= 0)
    {
      gagnant = "noirs";
      fin = true;
    }
   }
   }
   
   else 
   {
     textAlign(0,0);
     textSize(25);
     text ("02:00", 758.5, 70);
   }
}

//*************************** Compte à rebours du joueur 2 *************************
void compteRebours2()
{
  if (chrono2==true)
   {
  int seconde_chrono, minute_chrono, heure_chrono, timeback, rebours;
  {
     if (fin== false)
    {
    if (pause==0) time_current= hour()*3600 + minute()* 60 + second();//prend l'heure actuelle de l'ordinateur
        else time_current= memo_temps_current;  //***********************************************************************************************************************************************************************
    
    rebours =(time_current)-(reboursStart2);//calcule le temps écoulé
    timeback = 120-(rebours);
    }
    else
    {
      rebours =(time_fin)-(reboursStart1);
      timeback = 120-(rebours);
    }
    
    heure_chrono=timeback/3600;
    minute_chrono=(timeback-heure_chrono*3600)/60;
    seconde_chrono=timeback%60;
    
    textAlign(0,0);
    textSize(25);
    fill(240, 221, 206);
   
    if (timeback >0)
    {
     if ((minute_chrono<10) && (minute_chrono>=0)) //affiche un 0 pour les dizaine de minutes tant que le temps est inférieur 10 min
    { 
      text("0", 877.5, 70);
      text(minute_chrono, 893.5, 70);
    } else 
    {
      text(minute_chrono, 882.5, 70);
    }

    text(":", 909.5, 70);

    if ((seconde_chrono<10) && (seconde_chrono>=0))//affiche un 0 pour les dizaine de secondes tant que les secondes sont inférieures à 10 sec
    {
      text("0", 917.5, 70);
      text(seconde_chrono, 933, 70);
    } else
    {
      text(seconde_chrono, 917.5, 70);
    }
    }
    else text ("00:00", 877.5, 70);
    
    if (timeback < 0 && modeDebutant == true)                               //Passe à l'autre joueur quand le chrono arrive à 00:00
    {
      tourNoir = false;
      tourBlanc = true;
      lancerRebours= false;
      chrono1 = true;
      chrono2 = false;
    }
    else if (modeDebutant == false & timeback < 0)
    {
      gagnant = "blancs";
      fin = true;
    }
   }
   }
  else text ("02:00", 877.5, 70);
}  