//
//  Queue.hpp
//  Lab work 5
//
//  Created by Rifat on 17.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Queue_hpp
#define Queue_hpp

#include <stdio.h>

class Exception{
protected:
    const char* full(){
        return "The queue is full";
    }
    const char* empty(){
        return "Removing an empty queue";
    }
};

template <int n, typename T>
class Queue: protected Exception{
private:
    int size;
    T* buffer;
    int front_index = 0;
    int latest_index = 0;
public:
    Queue(void);
    ~Queue(void);
    void push(T vallue);
    T getfront(void);
};

#endif /* Queue_hpp */
