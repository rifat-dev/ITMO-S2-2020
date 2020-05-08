//
//  Rectangle.hpp
//  Lab 4
//
//  Created by Rifat on 06.04.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Rectangle_hpp
#define Rectangle_hpp

#include <stdio.h>

class Rectangle : public Figure {
    private:
        CVector2D _a;
        CVector2D _b;
        double mass_ = 0;
        double _position_x, _position_y;
    public:
        Rectangle() {
            this->_a = CVector2D(0, 0);
            this->_b = CVector2D(0, 0);
            this->mass_ = 0;
            this->_position_x = 0;
            this->_position_y = 0;
        }
        Rectangle(double mass, double position_x, double position_y, CVector2D a, CVector2D b) {
            this->mass_ = mass;
            this->_position_x = position_x;
            this->_position_y = position_y;
            this->_a = a;
            this->_b = b;
        }
        void enter_value() {
            std::cout << "Set your parameters for " << this->classname() << ":\n";
            std::cout << "Weight in kg: ";
            std::cin >> this-> mass_;
            std::cout << "\nCenter of mass for the\nx: ";
            std::cin >> this->_position_x;
            std::cout << "\ny: ";
            std::cin >> this->_position_y;
            std::cout << "\nThe coordinates of the first vector\nx: ";
            std::cin >> this->_a.x;
            std::cout << "\ny: ";
            std::cin >> this->_a.y;
            std::cout << "\nThe coordinates of the second vector\nx: ";
            std::cin >> this->_b.x;
            std::cout << "\ny: ";
            std::cin >> this->_b.y;
        }
        double S() {
            double lena = this->_a.length();
            double lenb = this->_b.length();
            return lena * lenb;
        }
        double P() {
            return (this->_a.length() + this->_b.length()) * 2;
        }
        virtual const char* classname() {
            return "rectangle";
        }
        unsigned int size() {
            return (sizeof(this->mass_) + sizeof(this->_position_x) + sizeof(this->_position_y) + sizeof(this->_a) + sizeof(this->_b));
        }
        double mass() const {
            return this->mass_;
        }
        double position_x() const {
            return this->_position_x;
        }
        double position_y() const {
            return this->_position_y;
        }
        void draw() {
            std::cout << "Weight in kg = " << mass() << "\n";
            std::cout << "Center = (" << _position_x << ", " << _position_y << ")\n";
            std::cout << "Vectors = (" << _a.x << ", " << _a.y << "),(" << _b.x << ", " << _b.y << ")";
            std::cout << "\nS = " << S();
            std::cout << "\nP = " << P();
            std::cout << "\nSize in bytes = " << size() << "\n";
        }
};

#endif /* Rectangle_hpp */
