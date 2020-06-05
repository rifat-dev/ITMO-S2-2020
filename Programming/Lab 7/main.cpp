//
//  main.сpp
//  Ring buffer
//
//  Created by Rifat on 02.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//
#include <iostream>
#include <algorithm>
#include "circular_buffer.hpp"

int main(){
    circular_buffer<int> buf(5);
    buf.push_back(-1);
    buf.push_back(2);
    buf.push_back(4);
    buf.push_front(31);
    buf.push_back(-77);
    buf.push_back(-7);
    buf.push_front(30);
    buf.pop_back();
    buf.pop_front();
    buf.resize(6);
    buf.push_back(3105);
    buf.push_back(-1);
    buf.push_back(2);
    buf.push_back(4);
    buf.pop_back();
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    circular_buffer<int>::iterator ind = buf.index(3);
    std::cout << "\nIterating by iterator index\n";
    while (ind != buf.end()){
        std::cout << "  value " << *ind << "\n";
        ++ind;
    }
    std::cout << "Head " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    std::cout << "After sort method from stl algorithm\n";
    std::sort(buf.begin(), buf.end());
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    circular_buffer<int>::iterator i = buf.begin() + 1;
    buf.push_it(i, 2020);
    buf.push_it(i + 1, 2021);
    std::cout<<"\n";
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\nHead " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    buf.pop_it(i + 1);
    buf.pop_it(i);
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\nHead " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    return 0;
}
