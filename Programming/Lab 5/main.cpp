//
//  main.cpp
//  Lab work 5
//
//  Created by Rifat on 17.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include "main.h"

int main(int argc, const char * argv[]) {
    
    std::cout << "The number 10^3 = " << degree_num(10, 3) << "\n";
    std::cout << "The number 15.5^2 = " << degree_num(15.5, 2) << "\n";
    std::cout << "The number 9.22337e+18^20 = " << degree_num(9.22337e+18, 20) << "\n";
    
    try{
        Queue<4, double> queue;
        queue.push(10.1);
        queue.push(5.2);
        queue.push(3.1);
        queue.push(1.56);
        std::cout << queue.getfront() << "\n";
        std::cout << queue.getfront() << "\n";
        std::cout << queue.getfront() << "\n";
        std::cout << queue.getfront() << "\n";
        std::cout << queue.getfront() << "\n";
    }
    catch (const char *ex){
        std::cout << "Error: " << ex << "\n";
    }
    return 0;
}
