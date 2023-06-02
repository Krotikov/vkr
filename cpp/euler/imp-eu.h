#ifndef IMP_EU_H
#define IMP_EU_H

#include <vector>
#include "ra.h"
#include "utils.h"

std::vector<std::vector<double>> CauchySolveImpS2DAE(double a, double b, size_t gridSize,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0);

std::vector<std::vector<double>> ImpEuler(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double, double), double (*g)(double, double, double), std::vector<double> y0);

#endif //IMP_EU_H
