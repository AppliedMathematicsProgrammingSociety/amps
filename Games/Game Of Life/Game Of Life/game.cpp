// By Wasiful Haque (17th December 2023)

#include "game.h"

int black[] = { 0, 0, 0 };
int white[] = { 255, 255, 255 };
int green[] = { 0, 255, 0 };
int gray[] = { 192, 192, 192 };

const int dx = 20, dy = 20;

int cells[40][34] = { 0 };

std::vector<std::pair<int, int>> dir = { {-1, -1}, {-1, 1}, {-1, 0}, {0, -1}, {0, 1}, {1, 0}, {1, -1}, {1, 1} };

SDL_Window* Game::window = nullptr;
SDL_Renderer* Game::renderer = nullptr;
SDL_Texture* Game :: background_texture;
SDL_Texture* Game :: cell_background_texture;
SDL_Rect Game::srcRec;
SDL_Rect Game::destRec;
bool Game::isRunning = true;
bool Game::keyPressed = false;

SDL_Surface *background = IMG_Load("assets/background.png");
SDL_Surface *cell_background = IMG_Load("assets/cell_background.png");


void Game::init() {
	SDL_Init(SDL_INIT_EVERYTHING);

	window = SDL_CreateWindow("Game Of Life", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800 + dx, 680 + dy, 0);
	renderer = SDL_CreateRenderer(window, -1, 0);

	background_texture = SDL_CreateTextureFromSurface(renderer, background);
	cell_background_texture = SDL_CreateTextureFromSurface(renderer, cell_background);

}

void Game::handleEvents() {
	SDL_Event event;
	SDL_PollEvent(&event);
	

	if (event.type == SDL_QUIT) {
		std::cout << "Finished!" << std::endl;
		isRunning = false;
	}
	else if (event.type == SDL_MOUSEBUTTONDOWN) {
		int x = (event.button.x / dx) * dx;
		int y = (event.button.y / dy) * dy;

		std::cout << x / dx << " " << y / dy << std::endl;

		cell_alive_or_dead(x, y);
	}
	if (event.type == SDL_KEYDOWN) {
		keyPressed = !keyPressed;
	}
	if (keyPressed) cellOperation();
}

void Game::update() {
	cellOperation();
}

void Game::render() {
	SDL_RenderClear(renderer);

	SDL_RenderCopy(renderer, background_texture, NULL, NULL);

	SDL_RenderPresent(renderer);

	drawGrid();
	
}

void Game::draw(bool flag, int x, int y) {
	destRec.x = x+1, destRec.y = y+1;
	destRec.h = dx-1, destRec.w = dy-1;

	if (flag) {
		SDL_RenderCopy(renderer, cell_background_texture, NULL, &destRec);
	}
	else {
		SDL_RenderCopy(renderer, background_texture, NULL, &destRec);
	}
	SDL_RenderPresent(renderer);
	
	
}

void Game :: drawGrid() {
	// Set the color for the grid lines
	SDL_SetRenderDrawColor(renderer, gray[0], gray[1], gray[2], 255);

	// Draw horizontal grid lines
	for (int y = 0; y <= 680 + dy; y += dy) {
		SDL_RenderDrawLine(renderer, 0, y, 800 + dy, y);
	}

	// Draw vertical grid lines
	for (int x = 0; x <= 800 + dx; x += dx) {
		SDL_RenderDrawLine(renderer, x, 0, x, 680 + dx);
	}

	SDL_RenderPresent(renderer);
}

void Game :: cell_alive_or_dead(int x, int y) {
	// Select cell and draws a particular color over the cell
	if (cells[x / dx][y / dy] == 0) {
		draw(true, x, y);
		cells[x / dx][y / dy] = 1;
	}
	else {
		draw(false, x, y);
		cells[x / dx][y / dy] = 0;
	}

}

void Game :: checkCells(int cells_init[40][34]) {
	// cells_init is used to check the status of a cell
	// And update is done according to the conditions to a cell of the cells
	for (int i = 0; i < 40; i++) {
		for (int j = 0; j < 34; j++) {
			int alive = 0;

			for (auto d : dir) {
				if (i + d.first < 0 || j + d.second < 0) continue;
				if (cells_init[i + d.first][j + d.second] == 1) {
					alive++;
				}
			}

			if ((alive <= 1 || alive >= 4) && cells_init[i][j]) {
				cells[i][j] = 0;
			}
			else if (alive == 3 && !cells_init[i][j]) {
				cells[i][j] = 1;
			}
		}
	}
}

void Game :: cellDraw(int cells_init[40][34]) {
	// Draw over a cell according to the updated cells
	for (int i = 0; i < 40; i++) {
		for (int j = 0; j < 34; j++) {
			if (cells[i][j] == 1) {
				draw(true, i * dx, j * dy);
			}
			else if (cells_init[i][j] == 1) {
				draw(false, i * dx, j * dy);
			}
		}
	}
	SDL_Delay(200);
}

void Game :: cellOperation() {
	// cells_init is required so that every cell can be updated according to the initial conditions
	int cells_init[40][34];
	memcpy(cells_init, cells, sizeof(cells));

	checkCells(cells_init);
	cellDraw(cells_init);
}

void Game :: clean() {
	SDL_DestroyWindow(window);
	SDL_DestroyRenderer(renderer);
	SDL_DestroyTexture(background_texture);
	SDL_DestroyTexture(cell_background_texture);
}
