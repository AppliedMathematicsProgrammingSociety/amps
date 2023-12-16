#pragma once
#include<iostream>
#include "SDL.h"
#include <vector>

class Game {
	public:
		static void init();
		static void handleEvents();
		static void update();
		static void render();

		static void draw(int color[], int x, int y);
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
		static SDL_Rect srcRec, destRec;
		static bool isRunning;
		static bool keyPressed;
};