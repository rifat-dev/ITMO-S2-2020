//
//  Circular_buffer.hpp
//  Ring buffer
//
//  Created by Rifat on 29.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Circular_buffer_hpp
#define Circular_buffer_hpp

#include <stdio.h>
#include "Buffer_it.hpp"

template <typename T>
class Circular_buffer{
private:
    int count;
    int capacity;
    int start;
    int end;
    T* array;
public:
    Circular_buffer(int size){
        array = new T[size + 1];
        count = 0;
        capacity = size + 1;
        start = 0;
        end = 0;
    }
    void insert_end(const T& value){
        if (start % capacity - end % capacity == 1)
            start = (start + 1) % capacity;
        else count++;
        array[end % capacity] = value;
        end = (end + 1) % capacity;
    }
    void delete_end(){
        if (start % capacity != end % capacity)
            end = (end + capacity - 1) % capacity, count--;
    }
    void insert_start(const T& value){
        if (end % capacity - start % capacity == 1 || (end == capacity - 1 && start == 0)){
            end = (end + capacity - 1) % capacity;
        }
        else count++;
        start = (start + capacity - 1) % capacity;
        array[start % capacity] = value;
    }
    void delete_start(){
        if (start % capacity != end % capacity)
            start = (start + 1) % capacity, count--;
    }
    T& operator[](const int& i) const{
        return array[(start + i) % capacity];
    }
    int size_buf() const{
        return count;
    }
    CircIter<T> get_begin(){
        CircIter<T> iter(array, capacity, start, end, start);
        return iter;
    }
    CircIter<T> get_end(){
        CircIter<T> iter(array, capacity, start, end, start);
        return iter;
    }
    void resize(const size_t& N){
        T* buf = new T[capacity];
        int Nmax = 0;
        for (int i = 0; i < N; i++){
            if (i == count) break;
            buf[i] = operator[](i);
            Nmax++;
        }
        delete[] array;
        array = new T[N + 1];
        for (int i = 0; i < Nmax; i++)
            array[i] = buf[i];
        count = Nmax;
        capacity = N + 1;
        start = 0;
        end = count;
        delete[] buf;
    }
    ~Circular_buffer(){
        delete [] array;
    }
};
#endif /* Circular_buffer_hpp */
