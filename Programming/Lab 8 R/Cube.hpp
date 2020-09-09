//
//  Cube.hpp
//  Rubik's Cube
//
//  Created by Rifat on 12.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Cube_hpp
#define Cube_hpp

#include <stdio.h>
#include <iostream>
#include <map>
#include <vector>
#include <string>
#include <fstream>

class Cube {
public:

    explicit Cube(const char* path);
    Cube();
    void setting_state(const char* path);
    void setting_state(std::vector <std::string> rotates);
    bool checking_state();
    void rotation(std::string type);
    void rotation(int type, int dir);
    void print_margin(int x);
    std::vector <std::vector <int>> get_margin(int x);
    int get_neighboring_color(int margin, int type, int ind, int dir);
    int get_edge_color(int margin, int ind);
    void pif_paf(int margin, int corner_ind, int type);
    std::vector <std::string> get_all_rotations();
    
    friend std::ostream& operator<< (std::ostream& out, const Cube& obj);
    friend class Solution;

private:
    std::vector <std::vector <std::vector <int>>> _state;
    std::vector <std::vector <int>> _connected;
    std::map <char, int> _margin;
    std::vector <std::vector <std::vector <std::vector <int>>>> _neighbour;
    std::vector <std::vector <std::vector <int>>> _two_con;
    std::vector <std::vector <std::vector <int>>> _three_con;
    std::vector <std::vector <int>> _edges;
    std::vector <std::vector <int>> _corners;
    std::vector <std::string> _rotates;
    bool parse_rotate_arg(std::string& s);
    void _rotate(std::string type);
};

#endif /* Cube_hpp */
