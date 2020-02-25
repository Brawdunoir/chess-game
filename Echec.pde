int plateau[][] = new int[8][8];
int tableau[][] = new int[8][8];
int sauvegarde[][] = new int[8][8];
boolean fin = false;
String gagnant = "";

//N = +10 ou B = +0
//P = 1; T = 2; C = 3; F = 4; D = 5; R = 6;

void setup ()
{
  size(1000, 700);
  background (255, 255, 255);
  defautCases();
  defautPieces();
  chargerImage();
}

void draw()
{ 
  menu(); 
}