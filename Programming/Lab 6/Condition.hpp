//
//  Condition.hpp
//  Lab 6
//
//  Created by Rifat on 07.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Condition_hpp
#define Condition_hpp

class Condition{
public:
    template <class t1>
    bool operator ()(t1 number){
        return (number > 3 && number < 5);
    }
};

#endif /* Condition_hpp */
