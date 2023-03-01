#include <iostream>
#include <limits>
using namespace std;

class TicTacToe {

private:
	char board[9];
	char player;

public:
	TicTacToe();
	~TicTacToe();
	int GetValue();
	void SetValue(int value);
	void ChangePlayer();
	void Draw();
	int CheckGame(); //ovo iskopiraj vise manje
};

TicTacToe::TicTacToe() {
	for (int i = 0; i < 9; i++)
			board[i] = ' ';

	player = 'X';
}

TicTacToe::~TicTacToe() {
	if (CheckGame() == 1)
		cout << "X won!" << endl;
	else if (CheckGame() == 2)
		cout << "O won!" << endl;
	else
		cout << "Draw!" << endl;
}

void TicTacToe::Draw() {
	system("cls");
	cout << endl;
	cout << "\t     |     |     " << endl;
	cout << "\t  " << board[6] << "  |  " << board[7] << "  |  " << board[8] << "  \n";
	cout << "\t-----+-----+-----" << endl;
	cout << "\t     |     |     " << endl;
	cout << "\t  " << board[3] << "  |  " << board[4] << "  |  " << board[5] << "  \n";
	cout << "\t-----+-----+-----" << endl;
	cout << "\t     |     |     " << endl;
	cout << "\t  " << board[0] << "  |  " << board[1] << "  |  " << board[2] << "  \n";
}

int TicTacToe::GetValue() {
	int value = 0;
	bool finding = true;

	while (finding) {
		cout << "\n-> ";
		cin >> value;
		while (!cin.good()) {
			cin.clear();
			cin.ignore(numeric_limits<streamsize>::max(), '\n'); //efektivno obrisi do \n ili eof
			cout << "Invalid input! Try again.\n-> ";
			cin >> value;
		}
		if (value > 0 && value < 10)
			if (board[value - 1] != ' ')
				cout << "Already taken! Try again.";
			else
				finding = false;
		else
			cout << "Use numbers 0-9!";
	}

	return value;
}

void TicTacToe::ChangePlayer() {
	if (player == 'X')
		player = 'O';
	else
		player = 'X';
}

void TicTacToe::SetValue(int value) {
	board[value - 1] = player;
	ChangePlayer();
}

int TicTacToe::CheckGame() { //ima li jednostavniji nacin
	int draw = 0;

	if (board[0] == 'X' && board[1] == 'X' && board[2] == 'X')
		return 1;
	if (board[0] == 'O' && board[1] == 'O' && board[2] == 'O')
		return 2;
	if (board[3] == 'X' && board[4] == 'X' && board[5] == 'X')
		return 1;
	if (board[3] == 'O' && board[4] == 'O' && board[5] == 'O')
		return 2;
	if (board[6] == 'X' && board[7] == 'X' && board[8] == 'X')
		return 1;
	if (board[6] == 'O' && board[7] == 'O' && board[8] == 'O')
		return 2;
	if (board[0] == 'X' && board[3] == 'X' && board[6] == 'X')
		return 1;
	if (board[0] == 'O' && board[3] == 'O' && board[6] == 'O')
		return 2;
	if (board[1] == 'X' && board[4] == 'X' && board[7] == 'X')
		return 1;
	if (board[1] == 'O' && board[4] == 'O' && board[7] == 'O')
		return 2;
	if (board[2] == 'X' && board[5] == 'X' && board[8] == 'X')
		return 1;
	if (board[2] == 'O' && board[5] == 'O' && board[8] == 'O')
		return 2;
	if (board[0] == 'X' && board[4] == 'X' && board[8] == 'X')
		return 1;
	if (board[0] == 'O' && board[4] == 'O' && board[8] == 'O')
		return 2;
	if (board[2] == 'X' && board[4] == 'X' && board[6] == 'X')
		return 1;
	if (board[2] == 'O' && board[4] == 'O' && board[6] == 'O')
		return 2;

	for (int i = 0; i < 9; i++)
		if (board[i] != ' ')
			draw++;
	
	if (draw == 9)
		return 3;
	else
		return false;
}

int main() {
	TicTacToe Game;

	Game.Draw();
	do {
		Game.SetValue(Game.GetValue());
		Game.Draw();
	} while (!Game.CheckGame());

	return EXIT_SUCCESS;
}