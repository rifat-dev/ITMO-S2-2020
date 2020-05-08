//
//  IGeoFig.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef IGeoFig_hpp
#define IGeoFig_hpp

#include <stdio.h>

//geometric shape interface
class IGeoFig {
public:
    virtual double S() = 0;
    virtual double P() = 0;
    friend class Figure;
};

#endif /* IGeoFig_hpp */
