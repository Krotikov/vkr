#ifndef RA_H
#define RA_H

#include "exp-eu.h"
#include "imp-eu.h"
#include "utils.h"
#include "runge.h"
#include "adams.h"
#include "funcs.h"

#define GRID 0
#define Y1 1
#define Y2 2
#define NUM 3

bool PrintRes(std::vector<std::vector<double>> res, size_t N, Scheme s, Mode m);

std::vector<std::vector<double>> Example(double a, double b, std::vector<double> y0, 
                                         Scheme s, Mode m, size_t N);

std::vector<std::vector<double>> Real(double a, double b, std::vector<double> y0,
  Scheme s, Mode m, size_t N);

std::vector<std::vector<double>> Real(double a, double b, std::vector<double> y0, Scheme s, Mode m,
  size_t N, size_t* M);

#endif //RA_H