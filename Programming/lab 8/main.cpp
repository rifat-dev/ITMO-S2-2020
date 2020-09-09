//
//  main.cpp
//  Rubik's Cube
//
//  Created by Rifat on 10.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <map>
#include <vector>
#include <string>
#include <fstream>
#include "Cube.hpp"
#include "Solution.hpp"

int main(int argc, const char * argv[]) {
    
    Cube cube("rubik.txt");
    
    std::cout<< "Cube from file\n";
    std::cout<< "Faces of the cube\n";
    cube.print_margin(0);
    cube.print_margin(1);
    cube.print_margin(2);
    cube.print_margin(3);
    cube.print_margin(4);
    cube.print_margin(5);
    std::cout << "*****************\n";
    if (cube.checking_state())std::cout << "He's correct\n";
    std::cout << cube;
    std::cout << "*****************\n";
    Solution solution(cube);
    solution.solve(cube, 1);
    std::cout << "\n";
    return 0;
}
