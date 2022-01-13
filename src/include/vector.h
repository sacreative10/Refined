#pragma once
#include <math.h>

struct Vec2
{
    float x, y;

    float length() { return sqrt(x * x + y * y); }
    float lengthSquared() { return x * x + y * y; }
    void  normalize()
    {
        float inv_length = 1.0f / length();
        x *= inv_length;
        y *= inv_length;
    }
    float dot(const Vec2 a, const Vec2 b) { return a.x * b.x + a.y * b.y; }
    float cross(const Vec2 a, const Vec2 b) { return a.x * b.y - a.y * b.x; }
};
