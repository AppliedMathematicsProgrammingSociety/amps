#pragma once
#include<iostream>
#include "SDL.h"
#include "SDL_image.h"
#include <vector>

class Game {
	public:
		static void init();
		static void handleEvents();
		static void update();
		static void render();

		static void draw(bool flag, int x, int y);
		static void drawGrid();
		static void cell_alive_or_dead(int x, int y);
		static void checkCells(int cells_init[40][34]);
		static void cellDraw(int cells_init[40][34]);
		static void cellOperation();
		
		static bool running() { return isRunning; }
		static void clean();
	private:
		static SDL_Window *window;
		static SDL_Renderer *renderer;
		static SDL_Texture* background_texture;
		static SDL_Texture* cell_background_texture;
		static SDL_Rect srcRec, destRec;
		static bool isRunning;
		static bool keyPressed;
};