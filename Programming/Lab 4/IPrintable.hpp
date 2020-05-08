//
//  IPrintable.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef IPrintable_hpp
#define IPrintable_hpp

#include <stdio.h>

//display interface
class IPrintable {
public:
    virtual void draw() = 0;
    friend class Figure;
};

#endif /* IPrintable_hpp */
