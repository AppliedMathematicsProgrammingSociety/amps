#include "game.h"

int black[] = { 0, 0, 0 };
int white[] = { 255, 255, 255 };
int green[] = { 0, 255, 0 };

const int dx = 20, dy = 20;

int cells[40][34] = { 0 };

std::vector<std::pair<int, int>> dir = { {-1, -1}, {-1, 1}, {-1, 0}, {0, -1}, {0, 1}, {1, 0}, {1, -1}, {1, 1} };

SDL_Window* Game::window = nullptr;
SDL_Renderer* Game::renderer = nullptr;
SDL_Rect Game::srcRec;
SDL_Rect Game::destRec;
bool Game::isRunning = true;
bool Game::keyPressed = false;


void Game::init() {
	SDL_Init(SDL_INIT_EVERYTHING);

	window = SDL_CreateWindow("Game Of Life", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800 + dx, 680 + dy, 0);
	renderer = SDL_CreateRenderer(window, -1, 0);
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
	SDL_SetRenderDrawColor(renderer, black[0], black[1], black[2], 255);

	SDL_RenderClear(renderer);

	drawGrid();
	
}

void Game :: draw(int color[], int x, int y) {
	destRec.x = x, destRec.y = y;
	destRec.h = 18, destRec.w = 18;

	SDL_SetRenderDrawColor(renderer, color[0], color[1], color[2], 255);

	SDL_RenderFillRect(renderer, &destRec);
	
	SDL_RenderPresent(renderer);
}

void Game :: drawGrid() {
	// Set the color for the grid lines
	SDL_SetRenderDrawColor(renderer, white[0], white[1], white[2], 255);

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
	if (cells[x / dx][y / dy] == 1) {
		draw(black, x, y);
		cells[x / dx][y / dy] = 0;
	}
	else {
		draw(green, x, y);
		cells[x / dx][y / dy] = 1;
	}

	drawGrid();
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
				draw(green, i * dx, j * dy);
				drawGrid(); // Draw the grid after the cells
			}
			else if (cells_init[i][j] == 1) {
				draw(black, i * dx, j * dy);
				drawGrid(); // Draw the grid after the cells

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
}