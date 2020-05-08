//
//  main.h
//  Lab work 5
//
//  Created by Rifat on 17.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef main_h
#define main_h

#include "Queue.hpp"
#include "Queue.cpp"

template <typename T1, typename T2>
T1 degree_num(const T1 number, T2 degree){
    if (degree == 0)return 1;
    else return number * degree_num(number, degree - 1);
}

#endif /* main_h */
