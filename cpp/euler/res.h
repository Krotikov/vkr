#ifndef RES_H
#define RES_H

#include "ra.h"

std::vector<std::vector<double>> ResA(double a, double b, std::vector<double> y0, Scheme s, Mode m);

bool ResB(double a, double b, std::vector<double> y0, Scheme s, Mode m, 
          std::vector<std::vector<double>> &exact);

bool PrintResA(std::vector<std::vector<double>> res, Scheme s);

#endif //RES_H
