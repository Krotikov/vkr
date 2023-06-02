#include "funcs.h"


double f(double y1, double y2) {
  double res = 2 * y1 + y2;
  return res;
}

double g(double y1, double y2) {
  double res = -y1 + 2 * y2;
  return res;
}

double f1(double y1, double y2) {
  double S = 800;
  double res = y2 / S;
  return res;
}

double g1(double y1, double y2) {
  double C1 = 1.090352562281410e+07;
  double C2 = 0.268629019563335;
  double h_l = 20;
  double res = h_l - pow(1.8 * log10(C1 / y2), -2) * C2 * y2 * y2 - y1;

  //h_l - ((1.8 * log10(C1/ y2))^(-2) * C2 * y2^2 - y1;

  return res;
}

double fAnal(double y1, double y2) {
  double S = 800;
  double res = y2 / S;
  return res;
}

double gAnal(double y1, double y2) {
  double g = 9.80665;
  double pi = 3.14159265359;
  double d = 2.4;
  double Sh = pi * (d / 2.0) * (d / 2.0);
  double hl = 20;

  double res = y2 - sqrt(2.0 * g * (hl - y1)) * Sh;
  return res;
}

double fSolveAnal(double t) {
  double hl = 20;
  double hr = 5;
  double C = 0.025043655062303;

  double res = hl - pow((-C * t + 2.0 * sqrt(hl - hr)), 2) / 4;
  return res;
}

double gSolveAnal(double t) {
  double hl = 20;
  double hr = 5;
  double C = 0.025043655062303;
  double g = 9.80665;
  double pi = 3.14159265359;
  double d = 2.4;
  double Sh = pi * (d / 2.0) * (d / 2.0);

  double res = sqrt(g / 2.0) * Sh * (-C * t + 2.0 * sqrt(hl - hr));
  return res;
}

double gSolve(double q) {
  double C1 = 1.090352562281410e+07;
  double C2 = 0.268629019563335;
  double h_l = 20;
  double h_r = 5;
  double res = h_l - pow(1.8 * log10(C1 / q), -2) * C2 * q * q - h_r;

  return res;
}

double gImp1(double yn, double yi, double h) {
  double C1 = 1.090352562281410e+07;
  double C2 = 0.268629019563335;
  double S = 800;
  double h_l = 20;

  double res = (h_l - (yi + h * yn / S)) - pow(1.8 * log10(C1 / yn), -2) * C2 * yn * yn;
  return res;
}

double fImp1(double y2n, double y1i, double h) {
  double S = 800;
  double y1n = y1i + h * y2n / S;

  return y1n;
}

double gAnalImp(double yn, double yi, double h) {
  double g = 9.80665;
  double S = 800;
  double pi = 3.14159265359;
  double d = 2.4;
  double Sh = pi * (d / 2.0) * (d / 2.0);
  double h_l = 20;

  double res = yn - sqrt(2 * g * (h_l - (yi + h * yn / S))) * Sh;
  return res;
}