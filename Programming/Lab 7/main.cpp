//
//  main.cpp
//  Ring buffer
//
//  Created by Rifat on 29.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include "Circular_buffer.hpp"

int main(int argc, const char * argv[]) {
    int size = 5;
    Circular_buffer<int> buf(size);
    buf.insert_end(10);
    buf.insert_end(20);
    buf.insert_end(30);
    buf.insert_end(40);
    buf.insert_end(50);
    buf.delete_end();
    buf.delete_start();
    for (int i = 0; i < buf.size_buf(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\n";
    buf.insert_start(5);
    for (int i = 0; i < buf.size_buf(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\n";
    
    return 0;
}
