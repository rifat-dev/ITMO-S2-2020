//
//  Coordinates.cpp
//  Lab 6
//
//  Created by Rifat on 07.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include "Coordinates.hpp"

Coordinates::Coordinates(double x_, double y_, double z_){
    this->x = x_;
    this->y = y_;
    this->z = z_;
}
double Coordinates::get_x() const {
    return this->x;
}
double Coordinates::get_y() const {
    return this->y;
}
double Coordinates::get_z() const {
    return this->z;
}
bool Coordinates::operator==(const Coordinates & xyz) const {
    return (sqrt(pow(this->x, 2) + pow(this->y, 2) + pow(this->z, 2))) == (sqrt(pow(xyz.get_x(), 2) + pow(xyz.get_y(), 2) + pow(xyz.get_z(), 2)));
}
bool Coordinates::operator>(const Coordinates & xyz) const {
    return (sqrt(pow(this->x, 2) + pow(this->y, 2) + pow(this->z, 2))) > (sqrt(pow(xyz.get_x(), 2) + pow(xyz.get_y(), 2) + pow(xyz.get_z(), 2)));
}
bool Coordinates::operator<(const Coordinates & xyz) const {
    return (sqrt(pow(this->x, 2) + pow(this->y, 2) + pow(this->z, 2))) < (sqrt(pow(xyz.get_x(), 2) + pow(xyz.get_y(), 2) + pow(xyz.get_z(), 2)));
}
