#include "adams.h"

std::vector<double> GetNU(double h, double (*f)(double, double), double (*g)(double, double),
  std::vector<double> y0, size_t* M) {

  double y1hTil = 0, y2hTil = 0, y1h = 1, y2h = 0,
    y1hR = 0, y2hR = 0;

  (*M) += 3;;

  double k1 = f(y0[0], y0[1]);
  y1hTil = y0[0] + h * k1 / 2.0;
  y2hTil = SolveTurb(y1hTil, g, M);

  double k2 = f(y1hTil, y2hTil);
  y1hR = y0[0] - h * k1 + 2 * h * k2;
  y2hR = SolveTurb(y1hR, g, M);

  double k3 = f(y1hR, y2hR);
  y1h = y0[0] + h * (k1 + 4 * k2 + k3) / 6.0;
  y2h = SolveTurb(y1h, g, M);

  std::vector<double> res = { y1h, y2h };

  return res;
}

std::vector<std::vector<double>> Adams(double a, double b, size_t gridSize, size_t* M,
  double (*f)(double, double), double (*g)(double, double), std::vector<double> y0) {

  double h = (b - a) / (gridSize - 1);
  double tmp = a + 3 * h;

  std::vector<double> y1 = GetNU(h, f, g, y0, M);
  std::vector<double> y2 = GetNU(h, f, g, y1, M);

  std::vector<double> grid = { a, a + h, a + 2 * h };
  std::vector<double> resY1 = { y0[0], y1[0], y2[0] };
  std::vector<double> resY2 = { y0[1], y1[1], y2[1] };

  
  double y1hTil = 0, y2hTil = 0, y1h = 1, y2h = 0;

  (*M) += 3;
  double k1 = h * f(resY1[2], resY2[2]); 
  double k2 = h * f(resY1[1], resY2[1]);
  double k3 = h * f(resY1[0], resY2[0]);

  for (size_t i = 2; i < gridSize - 1; ++i, tmp += h) {
    double dy = (23.0 * k1 - 16.0 * k2 + 5.0 * k3) / 12.0;

    y1h = resY1[i] + dy;
    y2h = SolveTurb(y1h, g, M);

    grid.push_back(tmp);
    resY1.push_back(y1h);
    resY2.push_back(y2h);

    double tmp = k1;
    k1 = h * f(resY1[i + 1], resY2[i + 1]);
    k3 = k2;
    k2 = tmp;
  }

  (*M) += gridSize - 3;

  std::vector<std::vector<double>> res = { grid, resY1, resY2 };

  return res;
}