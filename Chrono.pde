int time_start=0;
int time_current=0;
int time_end=0;
int time;
int time_fin;

void tempsDepart()
{
  time_start= hour()*3600 + minute() * 60 + second();//prend l'heure de l'ordinatateur quand le chrono se lance
}
void tempsFin()
{
  time_fin= hour()*3600 + minute() * 60 + second();
}
void chrono()
{
  int seconde_chrono, minute_chrono, heure_chrono;

  if (Jouer == true) 
  {
    if (fin== false)
    {
    time_current= hour()*3600 + minute()* 60 + second();//prend l'heure actuelle de l'ordinateur
    time =(time_current)-(time_start);//calcule le temps écoulé
    }
    else
    {
    time =(time_fin)-(time_start);
    }
    
    heure_chrono=time/3600;
    minute_chrono=(time-heure_chrono*3600)/60;
    seconde_chrono=time%60;
    
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(240, 221, 206);
    if ((heure_chrono<10) && (heure_chrono>=0)) //affiche un 0 pour les dizaine d'heures tant que le temps est inférieur 10 heures
    { 
      text("0", 790, 150);
      text(heure_chrono, 810, 150);
    } else 
    {
      text(heure_chrono, 800, 150);
    }

    text(":", 825, 150);
    
    if ((minute_chrono<10) && (minute_chrono>=0)) //affiche un 0 pour les dizaine de minutes tant que le temps est inférieur 10 min
    { 
      text("0", 840, 150);
      text(minute_chrono, 860, 150);
    } else 
    {
      text(minute_chrono, 850, 150);
    }

    text(":", 875, 150);

    if ((seconde_chrono<10) && (seconde_chrono>=0))//affiche un 0 pour les dizaine de secondes tant que les secondes sont inférieures à 10 sec
    {
      text("0", 890, 150);
      text(seconde_chrono, 910, 150);
    } else
    {
      text(seconde_chrono, 900, 150);
    }
  }
}