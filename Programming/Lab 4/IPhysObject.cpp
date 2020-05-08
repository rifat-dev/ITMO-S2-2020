//
//  IPhysObject.cpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include "IPhysObject.hpp"

bool IPhysObject::operator==(const IPhysObject& obj) const {
    return mass() == obj.mass();
}
bool IPhysObject::operator<(const IPhysObject& obj) const {
    return mass() < obj.mass();
}
