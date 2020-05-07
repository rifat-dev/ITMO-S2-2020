//
//  Condition_xyz.hpp
//  Lab 6
//
//  Created by Rifat on 07.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Condition_xyz_hpp
#define Condition_xyz_hpp

class Condition_xyz{
public:
    template <class t>
    bool operator ()(t vector){
        t vector_con(2, 2, 1);
        return (vector > vector_con);
    }
};

#endif /* Condition_xyz_hpp */
