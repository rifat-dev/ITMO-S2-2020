//
//  IPhysObject.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef IPhysObject_hpp
#define IPhysObject_hpp

#include <stdio.h>

//the interface is a physical object
class IPhysObject {
public:
    virtual double mass() const = 0;
    virtual double position_x() const = 0;
    virtual double position_y() const = 0;
    bool operator==(const IPhysObject& obj) const;
    bool operator<(const IPhysObject& obj) const;
    friend class Figure;
};

#endif /* IPhysObject_hpp */
