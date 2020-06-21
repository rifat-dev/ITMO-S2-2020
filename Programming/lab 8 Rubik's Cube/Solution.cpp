//
//  Solution.cpp
//  Rubik's Cube
//
//  Created by Rifat on 12.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include "Solution.hpp"

Solution::Solution(Cube cube) {
    std::srand(unsigned(std::time(0)));
    _cube = cube;
    _stage_length.resize(9);
}

size_t Solution::make_white_cross() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> margins = {0, 1, 3, 4, 5};
    const std::vector<std::pair<int, int>> first_option = {{1, 1}, {1, 3}, {0, 0}, {0, 2}, {3, 1}, {3, 3}, {5, 0}, {5, 2}};
    const std::vector<std::pair<int, int>> second_option = {{1, 0}, {0, 1}, {3, 2}, {5, 3}};
    const std::vector<std::pair<int, int>> third_option = {{1, 2}, {0, 3}, {3, 0}, {5, 1}};
    while (!check_white_cross()) {
        for (auto mar_ind : margins) {
            auto m = _cube.get_margin(mar_ind);
            for (int edge_ind = 0; edge_ind < 4; edge_ind++) {
                std::vector<int> edge = _cube._edges[edge_ind];
                if (m[edge[0]][edge[1]] == 2) {
                    if (mar_ind == 4) {
                        if (edge_ind % 2 == 0)
                            edge_ind = (edge_ind + 2) % 4;
                        free_the_place(2, edge_ind);
                        const int target = _cube._connected[2][edge_ind];
                        _cube.rotation(target, 0);
                        _cube.rotation(target, 0);
                    } else {
                        const std::pair<int, int> mar_and_edge = {mar_ind, edge_ind};
                        check_mar_edge(mar_and_edge, first_option, second_option, third_option);
                    }
                    break;
                }
            }
        }
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::correct_white_cross() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> incorrect_edges = check_cross_state(0);
    while (incorrect_edges.size() > 2) {
        _cube.rotation(2, 0);
        incorrect_edges = check_cross_state(0);
    }
    if (incorrect_edges.size() == 2) {
        int m0 = _cube._connected[2][incorrect_edges[0]];
        int m1 = _cube._connected[2][incorrect_edges[1]];
        if (m0 == 1 && m1 == 5) {
            const int buffer = m0;
            m0 = m1;
            m1 = buffer;
        }
        if ((incorrect_edges[1] - incorrect_edges[0]) % 2 == 1) {
            _cube.rotation(m0, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(4, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(4, 0);
            _cube.rotation(4, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(m1, 0);
        } else {
            _cube.rotation(m0, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(4, 0);
            _cube.rotation(4, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(m0, 0);
            _cube.rotation(m1, 0);
            _cube.rotation(m1, 0);
        }
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::first_layer() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> corner_state = find_white_corner();
    int m = corner_state[0];
    int ind = corner_state[1];
    while (m != -1 && !white_corners_is_correct(1)) {
        std::vector<int> conn = _cube._connected[m];
        if (m == 4) {
            set_corner(m, ind);
        } else if (m == 2) {
            _cube.rotation(conn[ind], 1);
            _cube.rotation(4, 1);
            _cube.rotation(conn[ind], 0);
            _cube.rotation(4, 0);
        } else {
            std::vector<std::vector<int>> down_corners = { {3, 2}, {2, 1}, {0, 3}, {1, 0}};
            std::vector<std::vector<int>> up_corners = {{0, 1}, {3, 0}, {1, 2}, {2, 3}};
            int type;
            if (ind == down_corners[m / 2 + m % 2][0]){
                type = 0;
            } else if (ind == down_corners[m / 2 + m % 2][1]){
                type = 1;
            } else if (ind == up_corners[m / 2 + m % 2][0]){
                type = 2;
            } else {
                type = 3;
            }
            get_corner_up(m, ind, type);
        }
        corner_state = find_white_corner();
        m = corner_state[0];
        ind = corner_state[1];
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::second_layer() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> not_setted_corner = find_edge();
    int m = not_setted_corner[0];
    int ind = not_setted_corner[1];
    int color_here = not_setted_corner[2];
    int color_neigh = not_setted_corner[3];
    while (m != -1 || !second_layer_is_correct(1)) {
        if (m == 4) {
            int under_m = _cube._connected[4][ind];
            while (color_neigh != under_m) {
                _cube.rotation(4, 0);
                ind = (ind + 1) % 4;
                under_m = _cube._connected[4][ind];
            }
            if (color_here == _cube._connected[4][(ind + 1) % 4]) {
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][(ind + 1) % 4], 1);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][(ind + 1) % 4], 0);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][ind], 0);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][ind], 1);
            } else {
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][(ind - 1 + 4) % 4], 0);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][(ind - 1 + 4) % 4], 1);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][ind], 1);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][ind], 0);
            }
        } else {
            std::map<int, int> left = {{0, 0}, {3, 1}, {5, 2}, {1, 3}};
            std::map<int, int> right = {{0, 2}, {3, 3}, {5, 0}, {1, 1}};
            int target_ind = -1;
            for (int i = 0; i < 4; i++) {
                if (_cube._connected[m][i] == 4) {
                    target_ind = i;
                    if (i % 2 == 0) {
                        target_ind = (target_ind + 2) % 4;
                    }
                    break;
                }
            }
            if (ind == left[m]) {
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][(target_ind + 1) % 4], 1);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][(target_ind + 1) % 4], 0);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][target_ind], 0);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][target_ind], 1);
            } else {
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][(target_ind - 1 + 4) % 4], 0);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][(target_ind - 1 + 4) % 4], 1);
                _cube.rotation(4, 1);
                _cube.rotation(_cube._connected[4][target_ind], 1);
                _cube.rotation(4, 0);
                _cube.rotation(_cube._connected[4][target_ind], 0);
            }
        }
        not_setted_corner = find_edge();
        m = not_setted_corner[0];
        ind = not_setted_corner[1];
        color_here = not_setted_corner[2];
        color_neigh = not_setted_corner[3];
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::make_yellow_cross() {
    size_t start = _cube.get_all_rotations().size();

    while (!yellow_cross_is_ready(1)) {
        int F = 5;
        int R = 1;
        int U = 4;
        for (int i = 0; i < 4; i++) {
            int e0 = _cube.get_edge_color(4, 0);
            int e1 = _cube.get_edge_color(4, 1);
            int e2 = _cube.get_edge_color(4, 2);
            if (e0 == 4 && e1 == 4) {
                _cube.rotation(F, 0);
                _cube.rotation(R, 0);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 1);
                _cube.rotation(R, 0);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 1);
                _cube.rotation(F, 1);
                size_t end = _cube.get_all_rotations().size();
                return end - start;
            } else if (e0 == 4 && e2 == 4) {
                _cube.rotation(F, 0);
                _cube.rotation(R, 0);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 1);
                _cube.rotation(F, 1);
                size_t end = _cube.get_all_rotations().size();
                return end - start;
            }
            _cube.rotation(4, 0);
        }

        _cube.rotation(F, 0);
        _cube.rotation(R, 0);
        _cube.rotation(U, 0);
        _cube.rotation(R, 1);
        _cube.rotation(U, 1);
        _cube.rotation(F, 1);
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::correct_yellow_cross() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> incorrect_edges = check_cross_state(1);
    while (incorrect_edges.size() > 2) {
        _cube.rotation(4, 0);
        incorrect_edges = check_cross_state(1);
    }
    if (incorrect_edges.size() == 2) {
        if (incorrect_edges[0] == 0 && incorrect_edges[1] == 3) {
            std::swap(incorrect_edges[0], incorrect_edges[1]);
        }
        if ((incorrect_edges[1] - incorrect_edges[0]) % 2 == 1) {
            int R = _cube._connected[4][(incorrect_edges[0] + 4 - 1) % 4];
            int U = 4;
            _cube.rotation(R, 0);
            _cube.rotation(U, 0);
            _cube.rotation(R, 1);
            _cube.rotation(U, 0);
            _cube.rotation(R, 0);
            _cube.rotation(U, 0);
            _cube.rotation(U, 0);
            _cube.rotation(R, 1);
            _cube.rotation(U, 0);
        } else {
            int R = _cube._connected[4][(incorrect_edges[0] + 4 - 1) % 4];
            int U = 4;
            _cube.rotation(R, 0);
            _cube.rotation(U, 0);
            _cube.rotation(R, 1);
            _cube.rotation(U, 0);
            _cube.rotation(R, 0);
            _cube.rotation(U, 0);
            _cube.rotation(U, 0);
            _cube.rotation(R, 1);
            incorrect_edges = check_cross_state(1);
            while (incorrect_edges.size() > 2) {
                _cube.rotation(4, 0);
                incorrect_edges = check_cross_state(1);
            }
            if (incorrect_edges.size() == 2) {
                if (incorrect_edges[0] == 0 && incorrect_edges[1] == 3) {
                    std::swap(incorrect_edges[0], incorrect_edges[1]);
                }
                R = _cube._connected[4][(incorrect_edges[0] + 4 - 1) % 4];
                U = 4;
                _cube.rotation(R, 0);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 0);
                _cube.rotation(R, 0);
                _cube.rotation(U, 0);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 0);
            }
        }
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::set_yellow_corners() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> correct_corner = yellow_corners_is_ready(1);
    int ind = correct_corner[0];
    int correct_count = correct_corner[1];
    while (correct_count < 4) {
        if (correct_count == 0) {
            int U = 4;
            int R = 3;
            int L = 1;
            _cube.rotation(U, 0);
            _cube.rotation(R, 0);
            _cube.rotation(U, 1);
            _cube.rotation(L, 1);
            _cube.rotation(U, 0);
            _cube.rotation(R, 1);
            _cube.rotation(U, 1);
            _cube.rotation(L, 0);
        } else {
            int R = _cube._connected[4][ind];
            int L = _cube._connected[4][(ind + 2) % 4];
            int U = 4;
            while (yellow_corners_is_ready(1)[1] < 4) {
                _cube.rotation(U, 0);
                _cube.rotation(R, 0);
                _cube.rotation(U, 1);
                _cube.rotation(L, 1);
                _cube.rotation(U, 0);
                _cube.rotation(R, 1);
                _cube.rotation(U, 1);
                _cube.rotation(L, 0);
            }
        }
        correct_corner = yellow_corners_is_ready(1);
        ind = correct_corner[0];
        correct_count = correct_corner[1];
    }
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

size_t Solution::correct_yellow_corners() {
    size_t start = _cube.get_all_rotations().size();
    std::vector<int> incorrect_corner = yellow_corners_is_correct(1);
    int ind = incorrect_corner[0];
    int incorrect_counter = incorrect_corner[1];
    auto cor = _cube._corners;
    if (incorrect_counter > 0) {
        int rotate_counter = 0;
        int R = _cube._connected[4][ind];
        int D = 2;
        while (true) {
            while (_cube._state[4][cor[ind][0]][cor[ind][1]] == 4 && rotate_counter < 4) {
                _cube.rotation(4, 0);
                rotate_counter++;
            }
            if (rotate_counter >= 4) {
                break;
            }
            while (_cube._state[4][cor[ind][0]][cor[ind][1]] != 4) {
                rotate_counter = 0;
                _cube.rotation(R, 1);
                _cube.rotation(D, 1);
                _cube.rotation(R, 0);
                _cube.rotation(D, 0);
            }
        }
        final_corrections();
    }
    final_corrections();
    size_t end = _cube.get_all_rotations().size();
    return end - start;
}

void Solution::final_corrections() {
    while (!gotcha()) {
        _cube.rotation(4, 0);
    }
}

bool Solution::white_cross_is_ready(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_white_cross();
}

bool Solution::white_cross_is_correct(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_cross_state(0).empty();
}

bool Solution::white_corners_is_correct(int debug) {
    if (!debug) {
        std::cout << _cube;
        std::cout << "\n";
    }
    for (int i = 0; i < 4; i++) {
        if (_cube.get_neighboring_color(2, 3, i, 0) != _cube._connected[2][i] ||
            _cube.get_neighboring_color(2, 3, i, 1) != _cube._connected[2][(i + 1) % 4]) {
            return false;
        }
    }
    return true;
}

bool Solution::second_layer_is_correct(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    std::vector<int> margins = {0, 3, 5, 1};
    for (int i = 0; i < 4; i++) {
        auto m = _cube.get_margin(margins[i]);
        if (i % 2 == 0) {
            for (int j = 0; j < 3; j++)
                if (m[1][j] != margins[i])
                    return false;
        } else {
            for (int j = 0; j < 3; j++)
                if (m[j][1] != margins[i])
                    return false;
        }
    }
    return true;
}

bool Solution::yellow_cross_is_ready(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    auto m = _cube.get_margin(4);
    for (int i = 0; i < 4; i++) {
        auto e = _cube._edges[i];
        if (m[e[0]][e[1]] != 4) {
            return false;
        }
    }
    return true;
}

bool Solution::yellow_cross_is_correct(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_cross_state(1).empty();
}

std::vector<int> Solution::yellow_corners_is_ready(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    auto cor = _cube._corners;
    auto m = _cube.get_margin(4);
    auto conn = _cube._connected[4];
    int correct = -1;
    int counter = 0;
    for (int i = 0; i < 4; i++) {
        std::vector<int> current = {m[cor[i][0]][cor[i][1]], _cube.get_neighboring_color(4, 3, i, 0),
                               _cube.get_neighboring_color(4, 3, i, 1)};
        std::vector<int> target = {4, conn[i], conn[(i + 1) % 4]};
        std::sort(current.begin(), current.end());
        std::sort(target.begin(), target.end());
        if (current == target) {
            correct = i;
            counter++;
        }
    }
    return {correct, counter};
}

std::vector<int> Solution::yellow_corners_is_correct(int debug) {
    if (debug == 0) {
        std::cout << _cube;
        std::cout << "\n";
    }
    auto cor = _cube._corners;
    auto m = _cube.get_margin(4);
    auto conn = _cube._connected[4];
    for (int i = 0; i < 4; i++) {
        if (m[cor[i][0]][cor[i][1]] != 4) {
            return {i, 1000};
        }
    }
    return {-1, 0};
}

bool Solution::gotcha() {
    for (int i = 0; i < 4; i++) {
        if (_cube.get_neighboring_color(4, 2, i, 0) != _cube._connected[4][i]) {
            return false;
        }
    }
    return true;
}

std::vector<std::string> Solution::generate_random_state() {
    const int count = rand() % 11 + 10;
    std::vector<std::string> answer;
    std::vector<std::string> margins = {"U", "L", "F", "R", "B", "D", "U\'", "L\'", "F\'", "R\'", "B\'", "D\'"};

    for (int i = 0; i < count; i++) {
        std::string r = margins[rand() % 12];
        _cube.rotation(r);
        answer.push_back(r);
    }
    return answer;
}

void Solution::synch(Cube &cube) {
    cube = _cube;
}

void Solution::r_synch(Cube &cube) {
    _cube = cube;
}

void Solution::reverse_edge(int margin, int edge_ind) {
    const int target_ind = (edge_ind + 2) % 4;
    const int not_connected = 15 - sum(_cube._connected[margin]) - margin;
    const int target1 = _cube._connected[margin][target_ind];
    const int target2 = _cube._connected[margin][(target_ind + 1) % 4];
    _cube.rotation(target1, 1);
    _cube.rotation(target2, 0);
    _cube.rotation(not_connected, 0);
    _cube.rotation(target2, 1);
    _cube.rotation(target1, 0);
    _cube.rotation(target1, 0);
}

std::vector<int> Solution::find_edge() {
    std::vector<int> margins = {4, 0, 3, 5, 1};
    for (auto m : margins)
        for (int i = 0; i < 4; i++) {
            auto e = _cube._edges[i];
            int color_here = _cube._state[m][e[0]][e[1]];
            int color_neigh = _cube.get_neighboring_color(m, 2, i, 0);
            if (color_here != 2 && color_here != 4 && color_neigh != 2 && color_neigh != 4) {
                if (m == 4 || (m != color_here || _cube._connected[m][i] != color_neigh)) {
                    return {m, i, color_here, color_neigh};
                }
            }
        }
    return {-1, -1, -1, -1};
}

bool Solution::check_white_cross() {
    const int color = 2;
    auto white = _cube.get_margin(color);
    for (auto edge: _cube._edges)
        if (white[edge[0]][edge[1]] != color)
            return false;
    return true;
}

void Solution::free_the_place(int margin, int ind) {
    for (int j = 0; j < 4; j++) {
        std::vector<int> e = check_edge(margin, ind);
        if (e[0] != 2 && e[1] != 2)
            break;
        _cube.rotation(margin, 0);
    }
}

void Solution::fill_the_place(int margin, int ind) {
    const int target = _cube._connected[margin][ind];
    for (int j = 0; j < 3; j++) {
        _cube.rotation(target, 0);
        std::vector<int> e = check_edge(margin, ind);
        if (e[0] == margin || e[1] == margin)
            break;
    }
}

std::vector<int> Solution::check_edge(int margin, int ind) {
    std::vector<int> e(2);
    e[0] = _cube._state[margin][_cube._edges[ind][0]][_cube._edges[ind][1]];
    const int neigh_margin = _cube._connected[margin][ind];
    std::vector<int> neigh_ind = _cube._two_con[margin][ind];
    e[1] = _cube._state[neigh_margin][neigh_ind[0]][neigh_ind[1]];
    return e;
}

void Solution::check_mar_edge(std::pair<int, int> mep, std::vector<std::pair<int, int>> fo, std::vector<std::pair<int, int>> so,
                            std::vector<std::pair<int, int>> to) {
    for (auto p : fo) {
        if (p == mep) {
            free_the_place(2, mep.second);
            fill_the_place(2, mep.second);
            return;
        }
    }
    for (auto p : so) {
        if (p == mep) {
            free_the_place(2, mep.second);
            _cube.rotation(mep.first, 0);
            _cube.rotation(mep.first, 0);
            return;
        }
    }
    for (auto p : to) {
        if (p == mep) {
            reverse_edge(2, mep.second);
            return;
        }
    }
}

std::vector<int> Solution::check_cross_state(int type) {
    std::vector<int> incorrect;
    for (int i = 0; i < 4; i++) {
        if (_cube.get_neighboring_color(2 + 2 * type, 2, i, 0) != _cube._connected[2 + 2 * type][i]) {
            incorrect.push_back(i);
        }
    }
    return incorrect;
}

std::vector<int> Solution::find_white_corner() {
    std::vector<int> margins = {4, 0, 1, 3, 5, 2};
    for (auto m : margins)
        for (int i = 0; i < 4; i++) {
            auto e = _cube._corners[i];
            if (_cube._state[m][e[0]][e[1]] == 2) {
                if (m != 2) {
                    return {m, i};
                } else {
                    int neigh_1 = _cube._connected[2][i];
                    int neigh_2 = _cube._connected[2][(i + 1) % 4];
                    int color_1 = _cube.get_neighboring_color(2, 3, i, 0);
                    int color_2 = _cube.get_neighboring_color(2, 3, i, 1);
                    if (neigh_1 != color_1 || neigh_2 != color_2) {
                        return {m, i};
                    }
                }
            }
        }
    return {-1, -1};
}

void Solution::set_corner(int margin, int ind) {
    while (_cube._connected[margin][ind] != _cube.get_neighboring_color(margin, 3, ind, 1) &&
           _cube._connected[margin][(ind + 1) % 4] != _cube.get_neighboring_color(margin, 3, ind, 0)) {
        _cube.rotation(4, 0);
        ind = (ind + 1) % 4;
    }
    _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 1);
    _cube.rotation(margin, 0);
    _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 0);
    _cube.rotation(margin, 0);
    _cube.rotation(margin, 0);

    if (_cube.get_neighboring_color(margin, 3, ind, 0) == 2) {
        _cube.pif_paf(margin, ind, 0);
    } else {
        _cube.pif_paf(margin, ind, 1);
    }
}

void Solution::get_corner_up(int margin, int ind, int type) {
    if (type == 0) {
        _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 1);
        _cube.rotation(4, 1);
        _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 0);
    } else if (type == 1) {
        _cube.rotation(_cube._connected[margin][ind], 0);
        _cube.rotation(4, 0);
        _cube.rotation(_cube._connected[margin][ind], 1);
    } else if (type == 2) {
        std::vector<int> circle_margins = {0, 1, 5, 3};
        std::vector<int> circle_inds = {0, 3, 2, 1};
        int m_ind = 0;
        for (int i = 0; i < circle_margins.size(); i++) {
            if (circle_margins[i] == margin) {
                m_ind = i;
                break;
            }
        }
        int i_ind = 0;
        for (int i = 0; i < circle_inds.size(); i++) {
            if (circle_inds[i] == ind) {
                i_ind = i;
                break;
            }
        }
        while (_cube.get_neighboring_color(margin, 3, ind, 0) != _cube._connected[margin][ind]) {
            _cube.rotation(4, 0);
            m_ind = (m_ind + 1) % 4;
            i_ind = (i_ind + 1) % 4;
            margin = circle_margins[m_ind];
            ind = circle_inds[i_ind];
        }
        _cube.rotation(_cube._connected[margin][ind], 1);
        _cube.rotation(4, 0);
        _cube.rotation(_cube._connected[margin][ind], 0);
    } else if (type == 3) {
        std::vector<int> circle_margins = {0, 1, 5, 3};
        std::vector<int> circle_inds = {1, 0, 3, 2};
        int m_ind = 0;
        for (int i = 0; i < circle_margins.size(); i++) {
            if (circle_margins[i] == margin) {
                m_ind = i;
                break;
            }
        }
        int i_ind = 0;
        for (int i = 0; i < circle_inds.size(); i++) {
            if (circle_inds[i] == ind) {
                i_ind = i;
                break;
            }
        }
        while (_cube.get_neighboring_color(margin, 3, ind, 1) != _cube._connected[margin][(ind + 1) % 4]) {
            _cube.rotation(4, 0);
            m_ind = (m_ind + 1) % 4;
            i_ind = (i_ind + 1) % 4;
            margin = circle_margins[m_ind];
            ind = circle_inds[i_ind];
        }
        _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 0);
        _cube.rotation(4, 1);
        _cube.rotation(_cube._connected[margin][(ind + 1) % 4], 1);
    }
}

void Solution::solve(Cube &obj, int debug) {
    _cube = obj;
    debug = 1 - debug;
    int counter = 0;
    size_t step = 0;
    size_t last = 0;
    std::vector<std::string> rotations;
    if (!white_cross_is_ready(1)) {
        step = make_white_cross();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        white_cross_is_ready(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (!white_cross_is_correct(1)) {
        step = correct_white_cross();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        white_cross_is_correct(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (!white_corners_is_correct(1)) {
        step = first_layer();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        white_corners_is_correct(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (!second_layer_is_correct(1)) {
        step = second_layer();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        second_layer_is_correct(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (!yellow_cross_is_ready(1)) {
        step = make_yellow_cross();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        yellow_cross_is_ready(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (!yellow_cross_is_correct(1)) {
        step = correct_yellow_cross();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        yellow_cross_is_correct(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (yellow_corners_is_ready(1)[1] != 4) {
        step = set_yellow_corners();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        yellow_corners_is_ready(debug);
    } else {
        std::cout << "step is ok\n";
    }
    if (yellow_corners_is_correct(1)[1] != 0) {
        step = correct_yellow_corners();
        last = counter + step;
        rotations = _cube.get_all_rotations();
        for (; counter < last; counter++) {
            std::cout << rotations[counter] << ' ';
        }
        std::cout << "\n";
        yellow_corners_is_correct(debug);
    } else {
        std::cout << "step is ok\n";
    }
    synch(obj);
}

std::vector<std::string> Solution::get_solution(bool are_quotes_needed) {
    auto solution = _cube.get_all_rotations();
    if (solution.empty()) {
        return {"This cube is already solved!"};
    }
    if (are_quotes_needed) {
        for (auto &r: solution) {
            const std::string new_r = "\"" + r + "\",";
            r = new_r;
        }
    }
    return solution;
}
