//
//  main.cpp
//  Rubik's Cube
//
//  Created by Rifat on 10.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <map>
#include <vector>
#include <string>
#include <fstream>

class Cube {
public:

    explicit Cube(const char* path);
    Cube();
    void setting_state(std::vector <std::string> rotates);
    void setting_state(const char* path);
    bool checking_state();
    void rotation(std::string type);
    void rotation(int type, int dir);
    void print_margin(int x);
    std::vector <std::vector <int>> get_margin(int x);
    int get_neighboring_color(int margin, int type, int ind, int dir);
    int get_edge_color(int margin, int ind);
    void pif_paf(int margin, int corner_ind, int type);
    std::vector <std::string> get_all_rotations();
    friend class Solver;
    friend std::ostream& operator<< (std::ostream& out, const Cube& obj);

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
    // ITMO-S2-2020
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
    std::vector<std::string> options = {"U", "L", "F", "R", "B", "D",
                              "U\'", "L\'", "F\'", "R\'", "B\'", "D\'"};
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

class Solver {
public:

    Solver(Cube cube);
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

Solver::Solver(Cube cube) {
    std::srand(unsigned(std::time(0)));
    _cube = cube;
    _stage_length.resize(9);
}

size_t Solver::make_white_cross() {
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

size_t Solver::correct_white_cross() {
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

size_t Solver::first_layer() {
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
            std::vector<std::vector<int>> down_corners = {
                    {3, 2},
                    {2, 1},
                    {0, 3},
                    {1, 0}
            };
            std::vector<std::vector<int>> up_corners = {
                    {0, 1},
                    {3, 0},
                    {1, 2},
                    {2, 3}
            };
            int type;
            if (ind == down_corners[m / 2 + m % 2][0]) {
                type = 0;
            } else if (ind == down_corners[m / 2 + m % 2][1]) {
                type = 1;
            } else if (ind == up_corners[m / 2 + m % 2][0]) {
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

size_t Solver::second_layer() {
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

size_t Solver::make_yellow_cross() {
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

size_t Solver::correct_yellow_cross() {
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

size_t Solver::set_yellow_corners() {
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

size_t Solver::correct_yellow_corners() {
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

void Solver::final_corrections() {
    while (!gotcha()) {
        _cube.rotation(4, 0);
    }
}

bool Solver::white_cross_is_ready(int debug) {
    if (debug == 0) {
        std::cout << "white_cross_is_ready():\n";
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_white_cross();
}

bool Solver::white_cross_is_correct(int debug) {
    if (debug == 0) {
        std::cout << "white_cross_is_correct():\n";
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_cross_state(0).empty();
}

bool Solver::white_corners_is_correct(int debug) {
    if (!debug) {
        std::cout << "white_corners_is_correct():\n";
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

bool Solver::second_layer_is_correct(int debug) {
    if (debug == 0) {
        std::cout << "second_layer_is_correct():\n";
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

bool Solver::yellow_cross_is_ready(int debug) {
    if (debug == 0) {
        std::cout << "yellow_cross_is_ready():\n";
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

bool Solver::yellow_cross_is_correct(int debug) {
    if (debug == 0) {
        std::cout << "yellow_cross_is_correct():\n";
        std::cout << _cube;
        std::cout << "\n";
    }
    return check_cross_state(1).empty();
}

std::vector<int> Solver::yellow_corners_is_ready(int debug) {
    if (debug == 0) {
        std::cout << "yellow_corners_is_ready():\n";
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

std::vector<int> Solver::yellow_corners_is_correct(int debug) {
    if (debug == 0) {
        std::cout << "yellow_corners_is_correct():\n";
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

bool Solver::gotcha() {
    for (int i = 0; i < 4; i++) {
        if (_cube.get_neighboring_color(4, 2, i, 0) != _cube._connected[4][i]) {
            return false;
        }
    }
    return true;
}

std::vector<std::string> Solver::generate_random_state() {
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

void Solver::synch(Cube &cube) {
    cube = _cube;
}

void Solver::r_synch(Cube &cube) {
    _cube = cube;
}

void Solver::reverse_edge(int margin, int edge_ind) {
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

std::vector<int> Solver::find_edge() {
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

bool Solver::check_white_cross() {
    const int color = 2;
    auto white = _cube.get_margin(color);
    for (auto edge: _cube._edges)
        if (white[edge[0]][edge[1]] != color)
            return false;
    return true;
}

void Solver::free_the_place(int margin, int ind) {
    for (int j = 0; j < 4; j++) {
        std::vector<int> e = check_edge(margin, ind);
        if (e[0] != 2 && e[1] != 2)
            break;
        _cube.rotation(margin, 0);
    }
}

void Solver::fill_the_place(int margin, int ind) {
    const int target = _cube._connected[margin][ind];
    for (int j = 0; j < 3; j++) {
        _cube.rotation(target, 0);
        std::vector<int> e = check_edge(margin, ind);
        if (e[0] == margin || e[1] == margin)
            break;
    }
}

std::vector<int> Solver::check_edge(int margin, int ind) {
    std::vector<int> e(2);
    e[0] = _cube._state[margin][_cube._edges[ind][0]][_cube._edges[ind][1]];
    const int neigh_margin = _cube._connected[margin][ind];
    std::vector<int> neigh_ind = _cube._two_con[margin][ind];
    e[1] = _cube._state[neigh_margin][neigh_ind[0]][neigh_ind[1]];
    return e;
}

void Solver::check_mar_edge(std::pair<int, int> mep, std::vector<std::pair<int, int>> fo, std::vector<std::pair<int, int>> so,
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

std::vector<int> Solver::check_cross_state(int type) {
    std::vector<int> incorrect;
    for (int i = 0; i < 4; i++) {
        if (_cube.get_neighboring_color(2 + 2 * type, 2, i, 0) != _cube._connected[2 + 2 * type][i]) {
            incorrect.push_back(i);
        }
    }
    return incorrect;
}

std::vector<int> Solver::find_white_corner() {
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

void Solver::set_corner(int margin, int ind) {
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

void Solver::get_corner_up(int margin, int ind, int type) {
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

void Solver::solve(Cube &obj, int debug) {
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
        std::cout << "White cross is already ready!\n";
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
        std::cout << "White cross is already correct!\n";
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
        std::cout << "White corners is already correct!\n";
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
        std::cout << "Second layer is already correct!\n";
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
        std::cout << "Yellow cross is already setted!\n";
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
        std::cout << "Yellow cross is already correct!\n";
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
        std::cout << "Yellow corners is already setted!\n";
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
        std::cout << "Yellow corners is already correct!\n";
    }
    synch(obj);
}

std::vector<std::string> Solver::get_solution(bool are_quotes_needed) {
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


int main(int argc, const char * argv[]) {
    
    Cube cube("rubik.txt");
    
    std::cout<< "Cube from file\n";
    std::cout<< "Face of the cube\n";
    cube.print_margin(0);
    cube.print_margin(1);
    cube.print_margin(2);
    cube.print_margin(3);
    cube.print_margin(4);
    cube.print_margin(5);
    std::cout << "*****************\n";
    if (cube.checking_state())std::cout << "He's correct\n";
    std::cout << cube;
    std::cout << "*****************\n";

    Solver algo(cube);
    algo.solve(cube, 1);

    Cube cube1("rubik.txt");
    Solver algo1(cube1);
    const std::vector <std::string> start_state = algo1.generate_random_state();
    cube1.setting_state(start_state);
    std::cout << "Start state was:\n";
    for (auto r: start_state) {
        std::cout << r << ' ';
    }
    std::cout << "\n";
    
    std::cout << "\n";
    return 0;
}
