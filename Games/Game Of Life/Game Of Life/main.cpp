#include "game.h"

int main(int args, char* argv[]) {
	Game::init();
	
	Game::render();

	while (Game::running()) {
		Game::handleEvents();
	}
	
	Game::clean();

	return 0;

}