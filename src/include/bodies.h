#pragma once
#include "globals.h"
#include "matrices.h"
#include "vector.h"

struct Body
{
    Vec2  position;
    float rotation; // in radians
    Vec2  velocity;
    float angularVelocity; // in radians per second
    float mass;
    Vec2  force;
    float torque;
    Vec2  acceleration;
    Vec2 angularAcceleration;
    void  translate_to_screen()
    {
        position.x = position.x + g_ScreenHeight / 2;
        position.y = g_ScreenWidth / 2 - position.y;
    }
    mat2  generate_rotation_matrix(float rotation)
    {
	    	return mat2{cos(rotation), -sin(rotation), sin(rotation), cos(rotation)};
    }
    void Update(float dt)
    {
        acceleration.x = force.x / mass;
        acceleration.y = force.y / mass;
        velocity.x += acceleration.x * dt;
        velocity.y += acceleration.y * dt;
        position.x += velocity.x * dt;
        position.y += velocity.y * dt;
    }
};
