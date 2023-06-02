#ifndef UTILS_H
#define UTILS_H

#include <vector>
#include <utility>
#include <fstream>
#include <cstdio>
#include <cmath>
#include <iostream>
#include <string>
#include <algorithm>

enum class Mode {
  Example,
  Real,
  ResA, 
  Anal, 
  DifAnal, 
  DifTurb,
  TurbSol
};

enum class Scheme {
  Exp,
  Imp,
  Eul, 
  Meu, 
  RK,
  Adams,
  No
};

std::string CreateName(size_t ind, size_t rschNum, std::string var);

bool OpenFile(std::string filename, std::ofstream& fout);

bool PrintVecFile(std::vector<double> u, std::string s);

#endif //UTILS_H
