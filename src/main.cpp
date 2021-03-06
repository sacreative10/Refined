#include "../include/raylib.h"
#include "../include/rlgl.h"
#include "include/bodies.h"
#include "include/globals.h"
#include <iostream>

int main()
{
    InitWindow(g_ScreenWidth, g_ScreenHeight, "Physics Engine");
    SetTargetFPS(60);

    struct Body object;
    object.mass    = 2;
    object.force.x = 3;
    object.translate_to_screen();
    while (!WindowShouldClose())
    {

        object.Update(GetFrameTime());
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawRectangle(object.position.x, object.position.y, 50, 25, BLACK);
        std::cout << object.position.x << " " << object.position.y << std::endl;
        EndDrawing();
    }
}
