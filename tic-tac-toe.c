#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

#define game_over (1)

int Game();
int Draw(int input);
int switchplayer();
int GetInput();
int Check(char arr[]);

int main() {
	int status = 0;

	while (!status) {

		status = Game();

	}

	return EXIT_SUCCESS;
}

int Game() {
	int input = 0;
	int status = 0;

	//something that switches player from 1 to 2;
	//player 1 is X, player 2 is O;
	//input : 1-9 
	//check for invalid input (check if number 1-9)
	//send that to draw
	//draw check if over, win or draw

	
	while (1) {

		system("cls");
		status = Draw(input);

		if (status)
			break;
			
		input = 0;
		while (!input) {
			input = GetInput();
		}

	}

	if (status == 1)
		printf("\nX won!\n");
	else if (status == 2)
		printf("\nO won!\n");
	else
		printf("\nDraw!\n");
	
	return game_over;
}

int Draw(int input) {
	static char arr[9] = { ' ',' ',' ',' ',' ',' ',' ',' ',' ' };
	int player = switchplayer();
	int status = 0;


	if (input != 0) { //first time
		if (arr[input - 1] != ' ') {
			switchplayer();
		}
		else if (player == 1) {
			arr[input - 1] = 'X';
		}
		else {
			arr[input - 1] = 'O';
		}
	}

	printf("     |     |     \n"
		"  %c  |  %c  |  %c  \n"
		"_____|_____|_____\n"
		"     |     |     \n"
		"  %c  |  %c  |  %c  \n"
		"_____|_____|_____\n"
		"     |     |     \n"
		"  %c  |  %c  |  %c  \n"
		"     |     |     \n", arr[6], arr[7], arr[8], arr[3], arr[4], arr[5], arr[0], arr[1], arr[2]);

	if (status = Check(arr))
		return status;


	return EXIT_SUCCESS;
}

int switchplayer() {
	static int player = 1;

	if (player == 1)
		player = 2;
	else
		player = 1;

	return player;
}

int GetInput() {
	int input = 0;
	char c = "";

	printf("\n-> ");

	while (scanf(" %d", &input) != 1 || input < 1 || input > 9) {

		printf("\nInvalid input. Try again!\n-> ");

		while (c != '\n') {
			c = getchar();
		}
		c = "";
	}

	return input;
}

int Check(char arr[]) {
	int i = 0, player1 = 0, player2 = 0, draw = 0;
	
	if (arr[0] == 'X' && arr[1] == 'X' && arr[2] == 'X')
		return 1;
	if (arr[0] == 'O' && arr[1] == 'O' && arr[2] == 'O')
		return 2;
	if (arr[3] == 'X' && arr[4] == 'X' && arr[5] == 'X')
		return 1;
	if (arr[3] == 'O' && arr[4] == 'O' && arr[5] == 'O')
		return 2;
	if (arr[6] == 'X' && arr[7] == 'X' && arr[8] == 'X')
		return 1;
	if (arr[6] == 'O' && arr[7] == 'O' && arr[8] == 'O')
		return 2;
	if (arr[0] == 'X' && arr[3] == 'X' && arr[6] == 'X')
		return 1;
	if (arr[0] == 'O' && arr[3] == 'O' && arr[6] == 'O')
		return 2;
	if (arr[1] == 'X' && arr[4] == 'X' && arr[7] == 'X')
		return 1;
	if (arr[1] == 'O' && arr[4] == 'O' && arr[7] == 'O')
		return 2;
	if (arr[2] == 'X' && arr[5] == 'X' && arr[8] == 'X')
		return 1;
	if (arr[2] == 'O' && arr[5] == 'O' && arr[8] == 'O')
		return 2;
	if (arr[0] == 'X' && arr[4] == 'X' && arr[8] == 'X')
		return 1;
	if (arr[0] == 'O' && arr[4] == 'O' && arr[8] == 'O')
		return 2;
	if (arr[2] == 'X' && arr[4] == 'X' && arr[6] == 'X')
		return 1;
	if (arr[2] == 'O' && arr[4] == 'O' && arr[6] == 'O')
		return 2;

	for (i = 0; i < 9; i++) {
		if (arr[i] != ' ')
			draw++;
	}
	if (draw == 9)
		return 3;
	
	return EXIT_SUCCESS;
}