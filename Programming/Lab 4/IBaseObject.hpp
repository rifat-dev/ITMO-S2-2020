//
//  IBaseObject.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef IBaseObject_hpp
#define IBaseObject_hpp

#include <stdio.h>

//interface class
class IBaseObject {
public:
    friend class Figure;
    //the name of the class (data type)
    virtual const char* classname() = 0;
    //amount of memory used
    virtual unsigned int size() = 0;
};

#endif /* IBaseObject_hpp */
