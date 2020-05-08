//
//  Queue.cpp
//  Lab work 5
//
//  Created by Rifat on 17.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include "Queue.hpp"

template <int n, class T>
Queue<n, T>::Queue(void){
    size = n;
    buffer = new T[size];
}

template <int n, class T>
Queue<n, T>::~Queue(void){
    delete[] buffer;
}

template <int n, class T>
void Queue<n, T>::push(T vallue){
    if (latest_index < size) buffer[latest_index++] = vallue;
    else throw full();
}

template <int n, class T>
T Queue<n, T>::getfront(void) {
    if (front_index < latest_index) return buffer[front_index++];
    else throw empty();
}
