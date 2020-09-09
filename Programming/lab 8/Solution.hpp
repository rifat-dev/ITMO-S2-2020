//
//  Solution.hpp
//  Rubik's Cube
//
//  Created by Rifat on 12.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef Solution_hpp
#define Solution_hpp

#include <stdio.h>
#include <iostream>
#include <map>
#include <vector>
#include <string>
#include <fstream>
#include "Cube.hpp"

class Solution {
public:

    Solution(Cube cube);
    std::vector <std::string> generate_random_state();
    void synch(Cube& cube);
    void r_synch(Cube& cube);
    size_t make_white_cross();
    size_t correct_white_cross();
    size_t first_layer();
    size_t second_layer();
    size_t make_yellow_cross();
    size_t correct_yellow_cross();
    size_t set_yellow_corners();
    size_t correct_yellow_corners();
    void final_corrections();
    void solve(Cube& obj, int debug);
    std::vector <std::string> get_solution(bool are_quotes_needed);
    bool white_cross_is_ready(int debug);
    bool white_cross_is_correct(int debug);
    bool white_corners_is_correct(int debug);
    bool second_layer_is_correct(int debug);
    bool yellow_cross_is_ready(int debug);
    bool yellow_cross_is_correct(int debug);
    std::vector <int> yellow_corners_is_ready(int debug);
    std::vector <int> yellow_corners_is_correct(int debug);
    bool gotcha();

private:
    Cube _cube;
    std::vector <int> _stage_length;
    bool check_white_cross();
    void free_the_place(int margin, int ind);
    void fill_the_place(int margin, int ind);
    std::vector <int> check_edge(int margin, int ind);
    void check_mar_edge(std::pair<int, int> mep, std::vector<std::pair<int, int>> fo, std::vector<std::pair<int, int>> so, std::vector<std::pair<int, int>> to);
    std::vector <int> check_cross_state(int type);
    std::vector <int> find_white_corner();
    void set_corner(int margin, int ind);
    void get_corner_up(int margin, int ind, int type);
    void reverse_edge(int margin, int edge_ind);
    std::vector <int> find_edge();
};

template<class T>
T sum(const std::vector<T> &v) {
    T s = 0;
    for (auto i : v)
        s = s + i;
    return s;
}

#endif /* Solution_hpp */
