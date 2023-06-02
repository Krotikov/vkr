#include "imp-eu.h"

std::vector<double> SolveImp(double yi, double h) {
  double a1 = 2, a2 = 1, b1 = -1, b2 = 2;

  double det = (1 - h * a1) * b2 + h * a2 * b1;
  double d1 = yi * b2;
  double d2 = -yi * b1;

  return { d1 / det, d2 / det };
}


std::vector<std::vector<double>> CauchySolveImpS2DAE(double a, double b, size_t gridSize,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0) {

  double tmp = a;
  double h = (b - a) / (gridSize - 1);

  std::vector<double> grid;
  grid.push_back(a);

  std::vector<double> resY1;
  resY1.push_back(y0[0]);

  std::vector<double> resY2;
  resY2.push_back(y0[1]);


  std::vector<double> yh = { 0, 0 };

  for (size_t i = 0; i < gridSize; ++i, tmp += h) {
    yh = SolveImp(resY1[i], h);


    grid.push_back(tmp);
    resY1.push_back(yh[0]);
    resY2.push_back(yh[1]);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}

template <typename T> int sgn(T val) {
  return (T(0) < val) - (val < T(0));
}

double SolveImpTurb(double yi, double h, double (*g)(double, double, double), size_t* M) {
  double eps = 1e-4;
  double epsN = 1e-5;
  double a = 0, b = 100;

  int s1 = sgn(g(a, yi, h));
  int s2 = sgn(g(b, yi, h));

  if (s1 == s2) {
    std::cout << "error signs" << std::endl;
    return 0;
  }

  while (b - a > eps) {
    double r = g((a + b) / 2, yi, h);
    ++(*M);
    if (fabs(r) < epsN)
      return (a + b) / 2;

    int s3 = sgn(r);
    if (s3 == s1)
      a = (a + b) / 2;
    else
      b = (a + b) / 2;
  }

  return (a + b) / 2;
}

std::vector<std::vector<double>> ImpEuler(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double, double), double (*g)(double, double, double), std::vector<double> y0) {

  double h = (b - a) / (gridSize - 1);
  double tmp = a + h;

  std::vector<double> grid;
  grid.push_back(a);

  std::vector<double> resY1;
  resY1.push_back(y0[0]);

  std::vector<double> resY2;
  resY2.push_back(y0[1]);


  double y1h = 0;
  double y2h = 0;
  (*M) += gridSize;

  for (size_t i = 0; i < gridSize - 1; ++i, tmp += h) {
    y2h = SolveImpTurb(resY1[i], h, g, M);

    y1h = f(y2h, resY1[i], h);

    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}