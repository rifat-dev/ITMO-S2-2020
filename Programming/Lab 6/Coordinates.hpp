//
//  Coordinates.hpp
//  Lab 6
//
//  Created by Rifat on 07.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Coordinates_hpp
#define Coordinates_hpp

#include <iostream>
#include <cmath>

class Coordinates{
private:
    double x, y, z;
public:
    Coordinates(double x_, double y_, double z_);
    double get_x() const;
    double get_y() const;
    double get_z() const;
    bool operator==(const Coordinates & xyz) const;
    bool operator>(const Coordinates & xyz) const;
    bool operator<(const Coordinates & xyz) const;
    friend std::ostream& operator<<(std::ostream& os, const Coordinates& coord);
};

#endif /* Coordinates_hpp */
