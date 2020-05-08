//
//  CVector2D.cpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <cmath>

#include "CVector2D.hpp"

CVector2D::CVector2D(){};
CVector2D::CVector2D(double x, double y) {
    this->x = x;
    this->y = y;
}
double CVector2D::length() {
    return sqrt(this->x * this->x + this->y * this->y);
}
