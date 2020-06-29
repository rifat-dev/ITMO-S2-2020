//
//  main.cpp
//  Lab of physics 3.01V
//
//  Created by Rifat on 27.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>
std::vector<std::string> namesfile = {"T1", "T2", "T3", "T4", "T5", "T6",
                                      "TT1", "TT2", "TT3", "TT4", "TT5", "TT6",
                                      "TTT1", "TTT2", "TTT3", "TTT4", "TTT5", "TTT6"};
const double xs = -8.0, ys = -5.0, xe = 8.0, ye = 5.0;
const double step = 0.1;
struct Point{
    double x, y, V, E;
    Point()
        { x = 0; y = 0; V = 0; E = 0; }
    friend std::ostream &operator<<(std::ostream &fout, const Point &point)
    { fout << point.x << " " << point.y << " " << point.E; return fout; }
    friend std::istream &operator>>(std::istream &fin, Point &point)
        { fin >> point.x >> point.y >> point.V; return fin; }
};
struct header_of_file {
    std::string model, version, date, description, lengthUnit;
    int dimension, expressions, nodes;
    void read(std::istream &fin) {
        std::string tag, axis;
        char percent;
        std::getline(fin, model);
        fin >> percent >> tag >> std::ws;
        std::getline(fin, version);
        fin >> percent >> tag >> std::ws;
        std::getline(fin, date);fin >> percent >> tag >> dimension;
        fin >> percent >> tag >> nodes;
        fin >> percent >> tag >> expressions;
        fin >> percent >> tag >> std::ws;
        std::getline(fin, description);
        fin >> percent >> tag >> tag >> lengthUnit;
        fin >> percent;
        getline(fin, axis);
    }
};
double distance(double a_x, double a_y, double b_x, double b_y)
                { return sqrt(pow(a_x - b_x, 2) + pow(a_y - b_y, 2)); }
std::pair<int, int> getNearestX(const std::vector<Point> &points, double x, double y) {
    int l = 0, u = 0;
    double lb = 1000, ub = 1000;
    for (int i = 0; i < points.size(); i++) {
        double d = distance(points[i].x, points[i].y, x, y);
        if ((d < lb) && (points[i].x < x))
            { lb = d; l = i; }
        else if ((d < ub) && (points[i].x > x))
            { ub = d; u = i; }
    }
    return {l, u};
}
std::pair<int, int> getNearestY(const std::vector<Point> &points, double x, double y) {
    int l = 0, u = 0;
    double lb = 1000, ub = 1000;
    for (int i = 0; i < points.size(); i++) {
        double dist = distance(points[i].x, points[i].y, x, y);
        if ((dist < lb) && (points[i].y < y))
            { lb = dist; l = i; }
        else if ((dist < ub) && (points[i].y > y))
            { ub = dist; u = i; }
    }
    return {l, u};
}
void computeE(std::istream &fin, std::ostream &fout) {
    header_of_file header; header.read(fin);
    std::vector<Point> points; std::string imaginary;
    for (int i = 0; i < header.nodes; i++) {
        Point point;
        fin >> point;
        points.push_back(point);
        if (fin.peek() == '+' || fin.peek() == '-')
            { std::getline(fin, imaginary); }
    }
    for (double y = ys; y <= ye; y += step) {
        for (double x = xs; x <= xe; x += step) {
            std::pair<int, int> xPair = getNearestX(points, x, y);
            std::pair<int, int> yPair = getNearestY(points, x, y);
            double Ex = (points[xPair.second].V - points[xPair.first].V) /
                        (points[xPair.second].x - points[xPair.first].x);
            double Ey = (points[yPair.second].V - points[yPair.first].V) /
                        (points[yPair.second].y - points[yPair.first].y);
            Point point;
                  point.x = x; point.y = y; point.E = sqrt(Ex * Ex + Ey * Ey);
            fout << point << "\n";
        }
    }
}
int main(int argc, const char * argv[]) {
    
    for (int i = 0; i < 18; i++) {
        std::string fileIn = namesfile[i];
        std::string fileOut = "result-";
        fileIn += ".txt";
        fileOut += fileIn;
        std::ifstream fin(fileIn);
        std::ofstream fout(fileOut);
        computeE(fin, fout);
    }
    
    return 0;
}
