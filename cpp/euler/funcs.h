#ifndef FUNCS_H
#define FUNCS_H

#include "utils.h"

double f(double y1, double y2);
double g(double y1, double y2);

double f1(double y1, double y2);
double g1(double y1, double y2);

double fAnal(double y1, double y2);
double gAnal(double y1, double y2);

double fSolveAnal(double t);
double gSolveAnal(double t);

double gSolve(double q);
double gImp1(double yn, double yi, double h);
double fImp1(double y1n, double y1i, double h);

double gAnalImp(double yn, double yi, double h);


#endif //FUNCS_H
