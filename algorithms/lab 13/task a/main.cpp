//
//  main.cpp
//  Lab 13 A
//
//  Created by Rifat on 10.05.2020.
//  Copyright � 2020 Rifat. All rights reserved.
//
//  Rabin-Karp Algorithm for Pattern Searching
//  Polynomial Rolling Hash
//
#include <fstream>
#include <cmath>
#include <string>
#include <vector>
std::string pattern;
std::string text;
std::fstream fin;
std::fstream fout;
int x = 17;
int k = 3571;
int Hp = 0;
bool ok;
std::vector<int> ans;
int main(int argc, const char* argv[]) {
    fin.open("search1.in", std::fstream::in);
    fout.open("search1.out", std::fstream::out);
    fin >> pattern >> text;
    size_t m = pattern.length();
    size_t n = text.length();
    int H[n - m];
    for (int i = m - 1, j = 0; i >= 0 and j < m; i--, j++) {
        Hp += (int)((int)pattern[j] * pow((double)x, (double)i));
    }
    Hp = Hp % k;
    H[0] = 0;
    for (int i = m - 1, j = 0; i >= 0 and j < m; i--, j++) {
        H[0] += (int)(text[j] * pow((double)x, (double)i));
    }
    H[0] = H[0] % k;
    for (int i = 0; i < n - m; i++) {
        H[i + 1] = (int)(H[i] * x - text[i] * pow((double)x, (double)m) + text[i + m]) % k;
// We might get negative value of t, converting it
// to positive
        if (H[i + 1] < 0)
            H[i + 1] = H[i + 1] + k;
    }
 
    for (int i = 0; i <= n - m; i++) {
        if (H[i] != Hp) {
            continue;
        }
        ok = true;
        for (int j = 0; j < m - 1; j++) {
            if (text[i + j] != pattern[j]) {
                ok = false;
                break;
            }
        }
        if (ok) {
            ans.push_back(i);
        }
    }
    fout << ans.size() << "\n";
    for (auto i : ans) {
        fout << i + 1 << " ";
    }
    fin.close();
    fout.close();
    return 0;
}
