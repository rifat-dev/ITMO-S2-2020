//
//  my_solution.cpp
//  Milestone testing
//
//  Created by Rifat on 12.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>

class number_two{
private:
    unsigned int value;
    int degree;
public:
    number_two(int degree_){
        value = 2;
        if (degree > 0){
            for (int i = 0; i < degree_; i++){
                value *= value;
            }
        }
        else if (degree == 0){
            value = 1;
        }
        else{
            for (int i = 0; i < degree_; i++){
                value /= value;
            }
        }
    }
    number_two(){
        value = 2;
    }
    unsigned int get_value () const{
        return this->value;
    }
    int get_degree () const{
        return this->degree;
    }
    int operator *(const number_two & two){
        return two.get_value() * value;
    }
    int operator /(const number_two & two){
        return two.get_value() / value;
    }
};

int main(int argc, const char * argv[]) {
    
    return 0;
}
