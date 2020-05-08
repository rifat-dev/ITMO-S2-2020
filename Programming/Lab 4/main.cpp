//
//  main.cpp
//  Lab 4
//
//  Created by Rifat on 23/03/2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <cmath>
#include <vector>
#include <algorithm>

#include "CVector2D.hpp"
#include "IGeoFig.hpp"
#include "IPhysObject.hpp"
#include "IPrintable.hpp"
#include "IDialogInitiable.hpp"
#include "IBaseObject.hpp"
#include "Figure.hpp"
#include "Rectangle.hpp"
#include "Ellipse.hpp"

int main(int argc, const char * argv[]) {
//  default initialization
    std::vector <Figure*> default_figure;
    default_figure.push_back(new Rectangle(10, 0, 0, CVector2D(10, 1), CVector2D(1, 10)));
    default_figure.push_back(new Ellipse(5, 1, 2, CVector2D(2, 1), CVector2D(1, 2)));
    default_figure.push_back(new Rectangle(5, 1, 2, CVector2D(2, 1), CVector2D(1, 2)));
//  custom initialization
    int n = 0;
    int figure = 0;
    std::vector <Figure*> custom_figures;
    std::cout << "Enter the number of shapes:\n";
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        std::cout << "Enter the number of figure type:\n";
        std::cout << "Rectangle is 1\n";
        std::cout << "Ellipse is 2\n";
        std::cin >> figure;

        if (figure == 1) {
            Figure *figure = new Rectangle();
            figure->enter_value();
            custom_figures.push_back(figure);
        }
        else if (figure == 2) {
            Figure *figure = new Ellipse();
            figure->enter_value();
            custom_figures.push_back(figure);
        }
    }
//  Sorting shapes by mass default figures
    sort(default_figure.begin(), default_figure.end(), [](const Figure* a, const Figure* b) { return *a < *b; });
//  Sorting shapes by mass custom figures
    sort(custom_figures.begin(), custom_figures.end(), [](const Figure* a, const Figure* b) { return *a < *b; });
//  Interpretation default figures
    double dmass = 0;
    double dp = 0;
    double ds = 0;
    double dMx = 0;
    double dMy = 0;
    double dsize = 0;
    std::cout << "Interpretation default figures\n";
    for (auto i :  default_figure) {
        std::cout << "Figure: " << i->classname() << "\n";
        i->draw();
        dmass += i->mass();
        dp += i->P();
        ds += i->S();
        dMx += i->mass() * i->position_x();
        dMy += i->mass() * i->position_y();
        dsize += i->size();
    }
    dMx /= dmass;
    dMy /= dmass;
//  Interpretation custom figures
    double cmass = 0;
    double cp = 0;
    double cs = 0;
    double cMx = 0;
    double cMy = 0;
    double csize = 0;
    std::cout << "Interpretation custom figures\n";
    for (auto i :  custom_figures) {
        std::cout << "Figure: " << i->classname() << "\n";
        i->draw();
        cmass += i->mass();
        cp += i->P();
        cs += i->S();
        cMx += i->mass() * i->position_x();
        cMy += i->mass() * i->position_y();
        csize += i->size();
    }
    cMx /= dmass;
    cMy /= dmass;
//  Total mass
    std::cout << "Total mass is " << cmass + dmass << "\n";
//  Total P
    std::cout << "Total perimeter is " << cp + dp << "\n";
//  Total S
    std::cout << "Total square is " << cs + ds << "\n";
//  Total center of mass default figures
    std::cout << "Total center of mass default figures is (" << dMx << ", " << dMy << ")\n";
//  Total center of mass custom figures
    std::cout << "Total center of mass custom figures is (" << cMx << ", " << cMy << ")\n";
//  Total size
    std::cout << "Total size is " << csize + dsize << "\n";
}
