//
//  IDialogInitiable.hpp
//  Lab 4
//
//  Created by Rifat on 05.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef IDialogInitiable_hpp
#define IDialogInitiable_hpp

#include <stdio.h>

//interface for classes that can be set via the dialog
class IDialogInitiable {
public:
    virtual void enter_value() = 0;
    friend class Figure;
};

#endif /* IDialogInitiable_hpp */
