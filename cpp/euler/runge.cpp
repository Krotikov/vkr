#include "runge.h"

std::vector<std::vector<double>> ModEuler(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0) {

  double h = (b - a) / (gridSize - 1);
  double tmp = a + h;

  std::vector<double> grid;
  grid.push_back(a);

  std::vector<double> resY1;
  resY1.push_back(y0[0]);

  std::vector<double> resY2;
  resY2.push_back(y0[1]);

  (*M) += 2 * gridSize;
  double y1hTil = 0, y2hTil = 0, y1h = 1, y2h = 0;

  for (size_t i = 0; i < gridSize - 1; ++i, tmp += h) {
    y1hTil = resY1[i] + h * f(resY1[i], resY2[i]) / 2.0;
    y2hTil = SolveTurb(y1hTil, g, M);

    y1h = resY1[i] + h * f(y1hTil, y2hTil);
    y2h = SolveTurb(y1h, g, M);

    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}

std::vector<std::vector<double>> RK3(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0) {

  double h = (b - a) / (gridSize - 1);
  double tmp = a + h;

  std::vector<double> grid;
  grid.push_back(a);

  std::vector<double> resY1;
  resY1.push_back(y0[0]);

  std::vector<double> resY2;
  resY2.push_back(y0[1]);

  (*M) += 3 * gridSize;
  double y1hTil = 0, y2hTil = 0, y1hR = 0, y2hR = 0, 
          y1h = 1, y2h = 0;

  for (size_t i = 0; i < gridSize - 1; ++i, tmp += h) {
    double k1 = f(resY1[i], resY2[i]);
    y1hTil = resY1[i] + h * k1 / 2.0;
    y2hTil = SolveTurb(y1hTil, g, M);

    double k2 = f(y1hTil, y2hTil);
    y1hR = resY1[i] - h * k1 + 2 * h * k2;
    y2hR = SolveTurb(y1hR, g, M);

    double k3 = f(y1hR, y2hR);
    y1h = resY1[i] + h * (k1 + 4 * k2 + k3) / 6.0;
    y2h = SolveTurb(y1h, g, M);

    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);
  }

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}