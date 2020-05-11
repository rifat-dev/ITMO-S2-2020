//
//  main.cpp
//  Lab 13 A
//
//  Created by Rifat on 10.05.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <vector>
#include <cmath>

class polynomial_hash{
private:
    const unsigned int x = 3;
    const unsigned int k = 27644437;
    size_t m;
    size_t n;
    char* pattern;
    char* text;
    unsigned int* pol_hash;
    unsigned int hp;
    bool ok;
    unsigned int count = 0;
    std::vector<int> answer;
public:
    polynomial_hash(const char _pattern[], const char _text[]){
        size_t m = strlen(_pattern);
        size_t n = strlen(_text);
        pattern = new char[m];
        text = new char[n];
        pol_hash = new unsigned int[n - m - 1];
        strcpy(pattern, _pattern);
        strcpy(text, _text);
        rabin_karp(pattern, text);
    }
    unsigned int hash(char text[]){
        unsigned int value = (int)text[0] % k;
        for (int i = 1; i < strlen(text); i++){
            value = (value * x + (int)text[i]) % k;
        }
        return value;
    }
    void buildH(char pattern[], char text[]){
        pol_hash[0] = hash(text);
        for (int i = 0; i < n - m - 1; i++){
            pol_hash[i + 1] = (pol_hash[i] * x - text[i]*pow(x, m) + text[i + m]) % k;
        }
    }
    void rabin_karp(char pattern[],  char text[]){
        hp = hash(pattern);
        buildH(pattern, text);
        for (int i = 0; i < n - m; i++){
            if (pol_hash[i] != hp)
                continue;
            ok = true;
            for (int j = 0; j < m - 1; j++){
                if (text[i + j] != pattern[j]){
                    ok = false;
                    break;
                }
            }
            if (ok){
                answer.push_back(i);
                count++;
            }
        }
    }
    unsigned int get_count() const{
        return count;
    }
    int get_vector_indx(int i) const{
        return answer[i];
    }
    ~polynomial_hash(){
        delete [] pattern;
        delete [] text;
        delete [] pol_hash;
    }
};

int main(int argc, const char * argv[]){
    polynomial_hash solve("aba", "abacaba");
    std::cout << solve.get_count() << "\n";
    for (int i = 0; i < solve.get_count(); i++){
        std::cout << solve.get_vector_indx(i) << " ";
    }
    return 0;
}
