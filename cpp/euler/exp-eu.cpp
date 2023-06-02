#include "exp-eu.h"

std::vector<std::vector<double>> CauchySolve2(double a, double b, size_t gridSize, 
  double (*func)(double, double, double),
  double inCondFunc, double inCondDer) {

  double tmp = a;
  double h = (b - a) / (gridSize - 1);

  double k1, k2, q1, q2;

  std::vector<double> grid;
  grid.push_back(a);

  std::vector<double> resY;
  resY.push_back(inCondFunc);

  double zi = inCondDer;

  double yh = 0;

  for (size_t i = 0; i < gridSize; ++i) {
    k1 = zi;
    q1 = func(grid[i], resY[i], k1);
    k2 = zi + q1 * h / 2.0;
    q2 = func((grid[i] + h / 2.0), (resY[i] + h / 2.0 * k1), k2);

    yh = resY[i] + h * k2;

    tmp += h;
    grid.push_back(tmp);
    resY.push_back(yh);
    zi += h * q2;
  }

  std::vector<std::vector<double>> res = { grid, resY };

  return res;
}

double CauchySolveLast(double a, double b, size_t gridSize, double (*func)(double, double, double),
  double inCondFunc, double inCondDer) {

  double tmp = a;
  double h = (b - a) / (gridSize - 1);

  double k1, k2, q1, q2;
  double grid = a;
  double resY = inCondFunc;
  double zi = inCondDer;

  double yh = 0;

  for (size_t i = 0; i < gridSize; ++i) {
    k1 = zi;
    q1 = func(grid, resY, k1);
    k2 = zi + q1 * h / 2.0;
    q2 = func((grid + h / 2.0), (resY + h / 2.0 * k1), k2);

    yh = resY + h * k2;

    tmp += h;
    zi += h * q2;

    grid = tmp;
    resY = yh;
  }

  return resY;
}

double SolveExp(double y1) {
  return y1 / 2;
}

template <typename T> int sgn(T val) {
  return (T(0) < val) - (val < T(0));
}

double SolveTurb(double y1, double (*g)(double, double), size_t* M) {
  double eps = 1e-13;
  double epsN = 1e-13;
  double a = 0, b = 80;

  int s1 = sgn(g(y1, a));
  int s2 = sgn(g(y1, b));

  if (s1 == s2) {
    std::cout << "error signs? aaa" << std::endl;
    return 0;
  }

  while (b - a > eps) {
    double r = g(y1, (a + b) / 2);
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

double SolveTurb(double y1, double (*g)(double, double)) {
  double eps = 1e-12;
  double epsN = 1e-13;
  double a = 0, b = 80;

  int s1 = sgn(g(y1, a));
  int s2 = sgn(g(y1, b));

  if (s1 == s2) {
    std::cout << "error signs" << std::endl;
    return 0;
  }

  while (b - a > eps) {
    double r = g(y1, (a + b) / 2);
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

std::vector<std::vector<double>> CauchySolveExpS2DAE(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0, Mode m) {

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
    y1h = resY1[i] + h * f(resY1[i], resY2[i]);

    if (m == Mode::Example)
      y2h = SolveExp(y1h);
    else {
      y2h = SolveTurb(y1h, g, M);
      if (y2h == 0)
        break;
    }
      

    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}

std::vector<std::vector<double>> CauchySolveExpS2DAE(double a, double b, size_t gridSize,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0, Mode m) {

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

  for (size_t i = 0; i < gridSize - 1; ++i, tmp += h) {
    y1h = resY1[i] + h * f(resY1[i], resY2[i]);

    if (m == Mode::Example)
      y2h = SolveExp(resY1[i]);
    //y2h = SolveExp(y1h);

    if (m == Mode::Real || m == Mode::ResA)
      y2h = SolveTurb(resY1[i], g);


    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}