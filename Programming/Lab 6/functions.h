//
//  functions.h
//  Lab 6
//
//  Created by Rifat on 07.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef functions_h
#define functions_h

std::ostream& operator<<(std::ostream& os, const Coordinates& coord)
{
    os << coord.x << ',' << coord.y << ',' << coord.z;
    return os;
}

namespace my{
template <class InputIterator, class Predicate>
bool any_of(InputIterator first, InputIterator last, Predicate pred){
    for (; first != last; first++){
        if (pred(*first))
            return true;
    }
    return false;
}
}

template <class InputIterator, class Predicate>
bool one_of(InputIterator first, InputIterator last, Predicate pred){
    int unsigned count = 0;
    for(; first != last; first++){
        if (pred(*first)){
            count++;
            if (count > 1)return false;
        }
    }
    return count == 1 ? true : false;
}

template <class InputIterator, class Predicate>
InputIterator find_not(InputIterator first, InputIterator last, Predicate pred){
    for (; first != last; first++){
        if (!pred(*first)){
            break;
        }
    }
    return first;
}


#endif /* functions_h */
