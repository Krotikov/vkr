#ifndef EXP_EU_H
#define EXP_EU_H

#include "utils.h"

std::vector<std::vector<double>> CauchySolve2(double a, double b, size_t gridSize, double (*func)(double, double, double),
  double inCondFunc, double inCondDer);

double CauchySolveLast(double a, double b, size_t gridSize, double (*func)(double, double, double),
  double inCondFunc, double inCondDer);

std::vector<std::vector<double>> CauchySolveExpS2DAE(double a, double b, size_t gridSize,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0, Mode m);

std::vector<std::vector<double>> CauchySolveExpS2DAE(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0, Mode m);

double SolveTurb(double y1, double (*g)(double, double), size_t* M);
double SolveTurb(double y1, double (*g)(double, double));

double SolveExp(double y1);


#endif //EXP_EU_H