#include "ra.h"

bool PrintRes(std::vector<std::vector<double>> res, size_t N, Scheme s, Mode m) {

  std::string gridf;
  std::string y1f;
  std::string y2f;

  if (m == Mode::Example) {
    if (s == Scheme::Exp) {
      gridf = "results/p-1/exp/grid.txt";
      y1f = "results/p-1/exp/y1.txt";
      y2f = "results/p-1/exp/y2.txt";
    }
    else if (s == Scheme::Imp) {
      gridf = "results/p-1/imp/grid.txt";
      y1f = "results/p-1/imp/y1.txt";
      y2f = "results/p-1/imp/y2.txt";
    }
  }
  else if (m == Mode::Real) {
    if (s == Scheme::Exp) {
      gridf = "results/p-2/exp/grid.txt";
      y1f = "results/p-2/exp/y1.txt";
      y2f = "results/p-2/exp/y2.txt";
    }
    else if (s == Scheme::Imp) {
      gridf = "results/p-2/imp/grid.txt";
      y1f = "results/p-2/imp/y1.txt";
      y2f = "results/p-2/imp/y2.txt";
    }
  }
  else if (m == Mode::ResA || m == Mode::Anal || m == Mode::DifAnal || m == Mode::DifTurb) {
    if (s == Scheme::Eul) {
      gridf = "results/p-4/exp/eul/grid" + std::to_string(N) + ".txt";
      y1f = "results/p-4/exp/eul/y1_" + std::to_string(N) + ".txt";
      y2f = "results/p-4/exp/eul/y2_" + std::to_string(N) + ".txt";
    }
    else if (s == Scheme::Imp) {
      gridf = "results/p-4/imp/grid" + std::to_string(N) + ".txt";
      y1f = "results/p-4/imp/y1_" + std::to_string(N) + ".txt";
      y2f = "results/p-4/imp/y2_" + std::to_string(N) + ".txt";
    }
    else if (s == Scheme::Meu) {
      gridf = "results/p-4/exp/meu/grid" + std::to_string(N) + ".txt";
      y1f = "results/p-4/exp/meu/y1_" + std::to_string(N) + ".txt";
      y2f = "results/p-4/exp/meu/y2_" + std::to_string(N) + ".txt";
    }
    else if (s == Scheme::RK) {
      gridf = "results/p-4/exp/rk/grid" + std::to_string(N) + ".txt";
      y1f = "results/p-4/exp/rk/y1_" + std::to_string(N) + ".txt";
      y2f = "results/p-4/exp/rk/y2_" + std::to_string(N) + ".txt";
    }
    else if (s == Scheme::Adams) {
      gridf = "results/p-4/exp/ad/grid" + std::to_string(N) + ".txt";
      y1f = "results/p-4/exp/ad/y1_" + std::to_string(N) + ".txt";
      y2f = "results/p-4/exp/ad/y2_" + std::to_string(N) + ".txt";
    }
  }
  else
    return false;

  std::ofstream gridout, y1out, y2out;

  if (!OpenFile(gridf, gridout))
    return false;
  if (!OpenFile(y1f, y1out))
    return false;
  if (!OpenFile(y2f, y2out))
    return false;

  size_t size = res[GRID].size();
  size_t start = 0;

  if (m == Mode::DifAnal) {
    for (size_t j = 1; j < size; ++j) {
      double tmp = res[GRID][j];
      gridout << tmp << " ";
      y1out << fabs(res[Y1][j] - fSolveAnal(tmp)) << " ";
      y2out << fabs(res[Y2][j] - gSolveAnal(tmp)) << " ";
    }
  }
  else {
    if (m == Mode::DifTurb)
      start = 1;

    for (size_t j = start; j < size; ++j) {
      gridout << res[GRID][j] << " ";
      y1out << res[Y1][j] << " ";
      y2out << res[Y2][j] << " ";
    }
  }

  gridout.close();
  y1out.close();
  y2out.close();

  return true;
}

std::vector<std::vector<double>> Example(double a, double b, std::vector<double> y0, Scheme s, Mode m, size_t N) {
  std::vector<std::vector<double>> res;

  if (s == Scheme::Exp)
    res = CauchySolveExpS2DAE(a, b, N, &f, &g, y0, m);
  else if (s == Scheme::Imp)
    res = CauchySolveImpS2DAE(a, b, N, &f, &g, y0);

  return res;
}

std::vector<std::vector<double>> Real(double a, double b, std::vector<double> y0, Scheme s, Mode m, 
                                      size_t N, size_t* M) {
  std::vector<std::vector<double>> res;

  if (m == Mode::ResA || m == Mode::Real || m == Mode::DifTurb) {
    if (s == Scheme::Eul)
      res = CauchySolveExpS2DAE(a, b, N, M, &f1, &g1, y0, m);

    if (s == Scheme::Meu)
      res = ModEuler(a, b, N, M, &f1, &g1, y0);

    if (s == Scheme::RK)
      res = RK3(a, b, N, M, &f1, &g1, y0);

    if (s == Scheme::Adams)
      res = Adams(a, b, N, M, &f1, &g1, y0);

    if (s == Scheme::Imp)
      res = ImpEuler(a, b, N, M, &fImp1, &gImp1, y0);
  }

  else {
    if (s == Scheme::Eul)
      res = CauchySolveExpS2DAE(a, b, N, M, &fAnal, &gAnal, y0, m);

    if (s == Scheme::Meu)
      res = ModEuler(a, b, N, M, &fAnal, &gAnal, y0);

    if (s == Scheme::RK)
      res = RK3(a, b, N, M, &fAnal, &gAnal, y0);

    if (s == Scheme::Adams)
      res = Adams(a, b, N, M, &fAnal, &gAnal, y0);

    if (s == Scheme::Imp)
      res = ImpEuler(a, b, N, M, &fImp1, &gAnalImp, y0);
  }

  return res;
}

std::vector<std::vector<double>> Real(double a, double b, std::vector<double> y0, Scheme s, Mode m,
  size_t N) {
  std::vector<std::vector<double>> res;

  if (s == Scheme::Eul)
    res = CauchySolveExpS2DAE(a, b, N, &f1, &g1, y0, m);

  return res;
}