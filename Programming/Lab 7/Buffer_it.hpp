//
//  Buffer_it.hpp
//  Ring buffer
//
//  Created by Rifat on 30.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Buffer_it_hpp
#define Buffer_it_hpp

#include <stdio.h>
#include <iterator>
template <typename T>
class CircIter : public std::iterator<std::random_access_iterator_tag, T>{
private:
    int position;
    int capacity;
    int start;
    int end;
    T* data;
public:
    using didifference_typefty = typename std::iterator<std::random_access_iterator_tag, T>::didifference_typefty;
    typename CircIter::reference operator*() const{
        return data[position % capacity];
    }
    CircIter() {}
    CircIter(T* buf, size_t& N, int& start, int& end, int position) :
    data(buf), capacity(N), start(start), end(end), position(position) {}
    CircIter operator+(const int& _pos) const{
        CircIter iter = *this;
        iter.pos = (position + _pos) % capacity;
        return iter;
    }
    CircIter operator-(const int& _pos) const{
        CircIter iter = *this;
        iter.pos = (position + capacity - _pos) % capacity;
        return iter;
    }
    bool operator!=(CircIter const& additer) const{
        return this->pos % capacity != additer.pos % capacity;
    }
    CircIter operator++(int){
        CircIter t(*this);
        this->pos++;
        return t;
    }
};

#endif /* Buffer_it_hpp */
