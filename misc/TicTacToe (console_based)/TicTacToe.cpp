/*
	Evan Mozumder
	Role: Hunter
*/

#include<bits/stdc++.h>
#include<conio.h>
using namespace std;

const int row=33,col=69;
int columnOneThird = col/3;
int columnTwoThird = (col*2)/3;
int rowOneThird = row/3;
int rowTwoThird = (row*2)/3;
char mat[row][col];
char key_press;
int btn=0;
int print = 0;
int cursor[2];
int cpX=0,cpY=0;
bool firstPlayer=true,secondPlayer=false;
int firstPlayerChoice[3][3]={0};
int secondPlayerChoice[3][3]={0};
bool play=true;
bool fw=false,sw=false;
int fieldValue=0;

tuple<int,int> cursorPosition(int x, int y){
  int posX,posY;
  posX = (rowOneThird/2)+(rowOneThird*x);
  posY = (columnOneThird/2)+(columnOneThird*y);

  return make_tuple(posX,posY);
}

void winner(string person){
  cout<<"\n\n\t\t\t\t\t\t\t"<<person<<" player is the winner\n\n";
  play=false;
}

bool win(int ar[3][3]){
  if(((ar[0][0]+ar[0][1]+ar[0][2])==3)
  || (ar[0][0]+ar[1][0]+ar[2][0] == 3)
  || (ar[0][0]+ar[1][1]+ar[2][2] == 3)
  || (ar[1][0]+ar[1][1]+ar[1][2] == 3)
  || (ar[2][0]+ar[2][1]+ar[2][2] == 3)
  || (ar[0][2]+ar[1][2]+ar[2][2] == 3)
  || (ar[0][2]+ar[1][1]+ar[2][0] == 3)
  || (ar[0][1]+ar[1][1]+ar[2][1] == 3)
  ){
    return true;
  }else return false;
}

void logic(){
    // first player
  if(win(firstPlayerChoice)){
    fw=true;
    winner("First");
  }
    // secondplayer
  if(win(secondPlayerChoice)){
    sw=true;
    winner("Second");
  }
  // draw
  if(!fw && !sw && fieldValue==9){
    cout<<"\n\n\t\t\t\t\t\t\tGame Draw\n";
    play=false;
  }
}


void input() {
  key_press = getch();
  btn = key_press;
  int iVal,jVal;
	switch (btn){
		case 97:
			if(cpY!=0)cpY--;
			break;
		case 100:
			if(cpY!=2)cpY++;  
			break;
		case 115:
			if(cpX!=2)cpX++;
			break;
		case 119:
			if(cpX!=0)cpX--;
		default:
			break;
	}
	tie(iVal,jVal)=cursorPosition(cpX,cpY);
	if(mat[iVal][jVal]!='0' && mat[iVal][jVal]!='X')mat[iVal][jVal]='_';
	if(btn==102){
		if(firstPlayer && firstPlayerChoice[cpX][cpY]==0 && secondPlayerChoice[cpX][cpY]==0){
			firstPlayerChoice[cpX][cpY]=1;
			mat[iVal][jVal]='0';
			firstPlayer=false;
			secondPlayer=true;
			fieldValue++;
		}else if(secondPlayer && secondPlayerChoice[cpX][cpY]==0 && firstPlayerChoice[cpX][cpY]==0) {
			secondPlayerChoice[cpX][cpY]=1;
			mat[iVal][jVal]='X';
			firstPlayer=true;
			secondPlayer=false;
			fieldValue++;
		}
	}
}

void drawField(){
  while(btn!=27 && play){
		#ifdef _WIN32
			system("cls");
		#else	
			system("clear");
		#endif
		cout << "\t\t Press 'a' to LEFT\n\t\t Press 'd' to RIGHT\n\t\t Press 'w' to UP\n\t\t Press 's' to DOWN\n\t\t Press 'f' to Choice"; 
		if(firstPlayer){
			cout<<"\t\t"<<"First Player Turn\n\n";
		}else {
			cout<<"\t\t"<<"Second Player Turn\n\n";
		}
    cout << "\n\n\n";
    for(int i=0;i<row;i++){
      cout << "\t\t\t\t";
      for(int j=0;j<col;j++){
        cout<<mat[i][j];
        if(mat[i][j]=='_')mat[i][j]=' ';
      }
      cout<<endl;
    }
    input();
    logic();
  }
}



int main() {
	
  for(int i=0;i<row;i++){
    for(int j=0;j<col;j++){
      if(j==(columnOneThird-1) || j==(columnTwoThird-1)) {
        mat[i][j] = '|';
      }
      else if(i==(rowOneThird-1) || i==(rowTwoThird-1)) {
        mat[i][j] = '-';
      }
      else {
        mat[i][j] = ' ';
      }
    }
  }
  drawField();

  return 0;
}
