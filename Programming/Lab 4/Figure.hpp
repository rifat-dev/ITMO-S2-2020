//
//  Figure.hpp
//  Lab 4
//
//  Created by Rifat on 06.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Figure_hpp
#define Figure_hpp

#include <stdio.h>

class Figure : public IBaseObject, public IPhysObject, public IGeoFig, public IPrintable, public IDialogInitiable {
    friend class Rectangle;
    friend class Ellipse;
};

#endif /* Figure_hpp */
