#pragma once
#ifndef RUNGE_H
#define RUNGE_H

#include "utils.h"
#include "exp-eu.h"


std::vector<std::vector<double>> ModEuler(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0);

std::vector<std::vector<double>> RK3(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0);


#endif // RUNGE_H
