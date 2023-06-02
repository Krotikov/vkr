#ifndef ADAMS_H
#define ADAMS_H

#include "utils.h"
#include "exp-eu.h"

std::vector<std::vector<double>> Adams(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0);


#endif //ADAMS_H