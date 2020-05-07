//
//  main.cpp
//  Lab 6
//
//  Created by Rifat on 05.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <vector>
#include "Coordinates.hpp"
#include "Condition.hpp"
#include "Condition_xyz.hpp"
#include "functions.h"

int main(int argc, const char * argv[]){
    // my_any_of::any_of
    std::vector<int> vec = {-1, 0, 1, 2, 3, 4, 5, 6, 7};
    std::vector<Coordinates> object = {Coordinates(2, 2, 0), Coordinates(0, 2, 0), Coordinates(2, 2, 2)};
    std::cout << "vector has -1, 0, 1, 2, 3, 4, 5, 6, 7 and predicate 3 < number < 5, any_of return " << my::any_of(vec.begin(), vec.end(), Condition()) << "\n";
    std::cout << "vector vas vectors with coordinates of object (2, 2, 0), (0, 2, 0), (2, 2, 2)" << my::any_of(object.begin(), object.end(), Condition_xyz())<< "\n";
    // my_one_of::one_of
    std::cout<< "vector has -1, 0, 1, 2, 3, 4, 5, 6, 7 and predicate 3 < number < 5, any_of return " << one_of(vec.begin(), vec.end(), Condition()) << "\n";
    std::cout << "vector vas vectors with coordinates of object (2, 2, 0), (0, 2, 0), (2, 2, 2) " << one_of(object.begin(), object.end(), Condition_xyz())<< "\n";
    // find_not
    std::vector<double> evec = {-2, -1, 0, 1, 2, 3, 4, 5, 6};
    std::cout << "find_not result " << *find_not(evec.begin(), evec.end(), Condition()) << "\n";
    std::cout << "find_not result " << *find_not(object.begin(), object.end(), Condition_xyz()) << "\n";
    return 0;
}
