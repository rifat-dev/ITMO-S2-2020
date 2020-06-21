//
//  Cube.cpp
//  Rubik's Cube
//
//  Created by Rifat on 12.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include "Cube.hpp"

Cube::Cube(const char *input_file_path) {
    _state.assign(6, std::vector<std::vector<int>>(3, std::vector<int>(3, -1)));
    std::ifstream input(input_file_path);
    for (size_t i = 0; i < 6; i++)
        for (size_t j = 0; j < 3; j++) {
            input >> _state[i][j][0];
            input >> _state[i][j][1];
            input >> _state[i][j][2];
        }
    input.close();
    _connected = {{1, 4, 3, 2}, {4, 0, 2, 5}, {1, 0, 3, 5}, {2, 0, 4, 5}, {3, 0, 1, 5}, {1, 2, 3, 4}};
    _margin = {{'U', 0}, {'L', 1}, {'F', 2}, {'R', 3}, {'B', 4}, {'D', 5}};
    _neighbour = {{{{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 0}, {1, 0}, {2, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 2}, {0, 1}, {0, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{2, 2}, {1, 2}, {0, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{2, 2}, {1, 2}, {0, 2}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 0}, {1, 0}, {2, 0}}, {{2, 0}, {2, 1}, {2, 2}}}, {{{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}}};
    _two_con = {{{0, 1}, {0, 1}, {0, 1}, {0, 1}}, {{1, 2}, {1, 0}, {1, 0}, {1, 0}}, {{1, 2}, {2, 1}, {1, 0}, {0, 1}}, {{1, 2}, {1, 2}, {1, 0}, {1, 2}}, {{1, 2}, {0, 1}, {1, 0}, {2, 1}}, {{2, 1}, {2, 1}, {2, 1}, {2, 1}}};
    _three_con = {{{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}}, {{0, 2, 0, 0}, {2, 0, 0, 0}, {2, 0, 0, 0}, {2, 0, 2, 2}}, {{0, 2, 2, 0}, {2, 2, 0, 0}, {2, 0, 0, 2}, {0, 0, 2, 2}}, {{0, 2, 2, 2}, {0, 2, 0, 0}, {2, 0, 2, 2}, {0, 2, 2, 2}}, {{0, 2, 0, 2}, {0, 0, 0, 0}, {2, 0, 2, 0}, {2, 2, 2, 2}}, {{2, 2, 2, 0}, {2, 2, 2, 0}, {2, 2, 2, 0}, {2, 2, 2, 0}},};
    _edges = {{1, 0}, {0, 1}, {1, 2}, {2, 1}};
    _corners = {{0, 0}, {0, 2}, {2, 2}, {2, 0}};
}

Cube::Cube() {
    _state.assign(6, std::vector<std::vector<int>>(3, std::vector<int>(3, -1)));
    for (int i = 0; i < 6; i++)
        for (int j = 0; j < 3; j++)
            for (int k = 0; k < 3; k++)
                _state[i][j][k] = i;
    _connected = {{1, 4, 3, 2}, {4, 0, 2, 5}, {1, 0, 3, 5}, {2, 0, 4, 5}, {3, 0, 1, 5}, {1, 2, 3, 4}};
    _margin = {{'U', 0}, {'L', 1}, {'F', 2}, {'R', 3}, {'B', 4}, {'D', 5}};
    _neighbour = {{{{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 2}, {0, 1}, {0, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 0}, {1, 0}, {2, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{0, 2}, {0, 1}, {0, 0}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{2, 2}, {1, 2}, {0, 2}}, {{0, 0}, {1, 0}, {2, 0}}, {{2, 2}, {1, 2}, {0, 2}}}, {{{2, 2}, {1, 2}, {0, 2}}, {{0, 2}, {0, 1}, {0, 0}}, {{0, 0}, {1, 0}, {2, 0}}, {{2, 0}, {2, 1}, {2, 2}}}, {{{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}, {{2, 0}, {2, 1}, {2, 2}}}};
    _two_con = {{{0, 1}, {0, 1}, {0, 1}, {0, 1}}, {{1, 2}, {1, 0}, {1, 0}, {1, 0}}, {{1, 2}, {2, 1}, {1, 0}, {0, 1}}, {{1, 2}, {1, 2}, {1, 0}, {1, 2}}, {{1, 2}, {0, 1}, {1, 0}, {2, 1}}, {{2, 1}, {2, 1}, {2, 1}, {2, 1}}};
    _three_con = {{{0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}, {0, 0, 0, 2}}, {{0, 2, 0, 0}, {2, 0, 0, 0}, {2, 0, 0, 0}, {2, 0, 2, 2}}, {{0, 2, 2, 0}, {2, 2, 0, 0}, {2, 0, 0, 2}, {0, 0, 2, 2}}, {{0, 2, 2, 2}, {0, 2, 0, 0}, {2, 0, 2, 2}, {0, 2, 2, 2}}, {{0, 2, 0, 2}, {0, 0, 0, 0}, {2, 0, 2, 0}, {2, 2, 2, 2}}, {{2, 2, 2, 0}, {2, 2, 2, 0}, {2, 2, 2, 0}, {2, 2, 2, 0}},};
    _edges = {{1, 0}, {0, 1}, {1, 2}, {2, 1}};
    _corners = {{0, 0}, {0, 2}, {2, 2}, {2, 0}};
}

void Cube::setting_state(std::vector<std::string> rotates) {
    for (auto r: rotates){ rotation(r); }
}

void Cube::setting_state(const char *path) {
    std::ifstream input(path);
    input.close();
}

bool Cube::checking_state() {
    std::vector<int> counters(6, 0);
    for (const auto &margin: _state)
        for (const auto &line: margin)
            for (const auto &color: line)
                counters[color % 6]++;
    for (const auto &c: counters) {
        if (c != 9)
            return false;
    }
    return true;
}

void Cube::rotation(std::string type) {
    const bool is_correct = parse_rotate_arg(type);
    if (!is_correct) {
        std::cout << "  *************************\n";
        std::cout << "  I can't find this command\n";
        std::cout << "  *************************\n";
        return;
    }
    _rotate(type);
}

void Cube::rotation(int type, int dir) {
    std::vector<std::string> options = {"U", "L", "F", "R", "B", "D", "U\'", "L\'", "F\'", "R\'", "B\'", "D\'"};
    _rotate(options[(type % 6) + 6 * (dir % 2)]);
}


void Cube::_rotate(std::string type) {
    _rotates.push_back(type);

    const bool reversed = type.length() > 1;
    int start = reversed ? 3 : 0;
    int step = reversed ? -1 : 1;
    int last = reversed ? 0 : 3;
    const int margin = _margin[type[0]];
    std::vector<int> buff(3);
    std::vector<std::vector<std::vector<int>>> cur_neigh = _neighbour[_margin[type[0]]];
    buff = {_state[_connected[margin][(last + 1) % 4]][cur_neigh[(last + 1) % 4][0][0]][cur_neigh[(last + 1) %4][0][1]],
            _state[_connected[margin][(last + 1) % 4]][cur_neigh[(last + 1) % 4][1][0]][cur_neigh[(last + 1) % 4][1][1]],
            _state[_connected[margin][(last + 1) % 4]][cur_neigh[(last + 1) % 4][2][0]][cur_neigh[(last + 1) % 4][2][1]]};
    for (size_t i = start; i != last + step; i += step)
        for (size_t j = 0; j < 3; j++)
            std::swap(buff[j], _state[_connected[margin][(i + 1) % 4]][cur_neigh[(i + 1) % 4][j][0]][cur_neigh[(i + 1) % 4][j][1]]);
    start = reversed ? 8 : 0;
    step = reversed ? -1 : 1;
    last = reversed ? 0 : 8;
    std::vector<std::vector<int>> cells = {{0, 0}, {0, 1}, {0, 2}, {1, 2}, {2, 2}, {2, 1}, {2, 0}, {1, 0}};
    int color_buffer = _state[margin][cells[7][0]][cells[7][1]];
    for (size_t j = 0; j < 2; j++)
        for (size_t i = start; i != last + step; i += step)
            std::swap(color_buffer, _state[margin][cells[i % 8][0]][cells[i % 8][1]]);
}

void Cube::print_margin(int x) {
    std::cout << "******* "<< x + 1 <<" *******\n";
    std::cout << "*****************\n";
    for (const auto &i: _state[x]) {
        for (auto j : i)
            std::cout << "\t" << j;
        std::cout << "\n";
    }
    std::cout << "*****************\n";
}

std::vector<std::vector<int>> Cube::get_margin(int x) {
    return _state[x % 6];
}

int
Cube::get_neighboring_color(int margin, int type, int ind, int dir) {
    const int neigh = (type == 2) ? _connected[margin][ind % 4] : _connected[margin][(ind + (dir % 2)) % 4];
    const int x = (type == 2) ? _two_con[margin % 6][ind][0] : _three_con[margin % 6][ind % 4][0 + 2 * (dir % 2)];
    const int y = (type == 2) ? _two_con[margin % 6][ind][1] : _three_con[margin % 6][ind % 4][1 + 2 * (dir % 2)];
    return _state[neigh][x][y];
}

int Cube::get_edge_color(int margin, int ind) {
    return _state[margin % 6][_edges[ind][0]][_edges[ind][1]];
}

void Cube::pif_paf(int margin, int corner_ind, int type) {
    std::vector<int> conn = _connected[margin];
    if (type == 1) {
        this->rotation(conn[corner_ind], 1);
        this->rotation(conn[(corner_ind + 1) % 4], 0);
        this->rotation(conn[corner_ind], 0);
        this->rotation(conn[(corner_ind + 1) % 4], 1);
    } else {
        this->rotation(conn[(corner_ind + 1) % 4], 0);
        this->rotation(conn[corner_ind], 1);
        this->rotation(conn[(corner_ind + 1) % 4], 1);
        this->rotation(conn[corner_ind], 0);
    }
}

std::vector<std::string> Cube::get_all_rotations() {
    return _rotates;
}

std::ostream &operator<<(std::ostream &output, const Cube &obj) {
    std::cout << "************************\n";
    for (size_t j = 0; j < 3; j++)
        output << "       " << obj._state[0][j][0] << ' ' << obj._state[0][j][1] << ' ' << obj._state[0][j][2] << "\n";
    for (size_t j = 0; j < 3; j++) {
        for (size_t i = 1; i < 5; i++)
            output << ' ' << obj._state[i][j][0] << ' ' << obj._state[i][j][1] << ' ' << obj._state[i][j][2];
        output << "\n";
    }
    for (size_t j = 0; j < 3; j++) // outputs 6th face
        output << "       " << obj._state[5][j][0] << ' ' << obj._state[5][j][1] << ' ' << obj._state[5][j][2] << "\n";
    std::cout << "************************\n";
    return output;
}

bool Cube::parse_rotate_arg(std::string &s) {
    std::map<char, char> directions = {{'r', 'R'}, {'R', 'R'}, {'l', 'L'}, {'L', 'L'}, {'u', 'U'}, {'U', 'U'}, {'d', 'D'}, {'D', 'D'}, {'f', 'F'}, {'F', 'F'}, {'b', 'B'}, {'B', 'B'}};
    const auto is_exist = directions.find(s[0]);
    if (is_exist == directions.end()) {
        return false;
    }
    std::string new_s;
    new_s += is_exist->second;
    if (s.length() > 1)
        new_s += "\'";
    s = new_s;
    return true;
}
