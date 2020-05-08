//
//  CVector2D.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef CVector2D_hpp
#define CVector2D_hpp

#include <stdio.h>

//vector
class CVector2D {
public:
    double x = 0, y = 0;
    CVector2D();
    CVector2D(double x, double y);
    double length();
};

#endif /* CVector2D_hpp */
