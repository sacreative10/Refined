#include "vector.h"
#include <math.h>

struct mat2
{
    float xx, xy;
    float yx, yy;
    void  set(float radians)
    {
        float c = cos(radians);
        float s = sin(radians);
        xx      = c;
        xy      = -s;
        yx      = s;
        yy      = c;
    }
    mat2    Transform() { return mat2{xx, xy, yx, yy}; }
    Vec2 operator*(Vec2 rhs) { return Vec2{xx * rhs.x + yx * rhs.y, xy * rhs.x + yy * rhs.y}; }
    mat2    operator*(mat2 rhs)
    {
        return mat2{
            xx * rhs.xx + yx * rhs.yx, xy * rhs.xx + yy * rhs.yx, xx * rhs.xy + yx * rhs.yy, xy * rhs.xy + yy * rhs.yy};
    }
};
