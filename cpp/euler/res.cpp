#include "res.h"

std::vector<double> NumToH(std::vector<double> N, double a, double b) {
  std::vector<double> h;
  double l = b - a;

  for (double it : N)
    h.push_back(l / it);

  return h;
}

std::vector<std::vector<double>> ResA(double a, double b, std::vector<double> y0, Scheme s, Mode m) {
  std::vector<double> N = { 51 };
  //50, 100, 200, 500, 1e3, 2e3, 5e3, 1e4, 2e4, 6e4
  std::vector<double> h = NumToH(N, a, b);

  double hReal = 0, qReal = 0;

  if (m == Mode::ResA) {
    hReal = 19.936861403864253; //y1  1e7
    qReal = 5.4956016317009926; //y2   
  }
  else {
    hReal = fSolveAnal(b);
    qReal = gSolveAnal(b);
  }
  std::vector<double> rh;
  std::vector<double> rq;
  std::vector<double> num;


  for (double it : N) {
    size_t M = 0;
    size_t sit = static_cast<size_t>(it);

    std::vector<std::vector<double>> sol = Real(a, b, y0, s, m, sit, &M);
    PrintRes(sol, sit, s, m);

    size_t last = sol.size() - 1;

    double tmp = fabs(sol[Y1][last] - hReal);
    if (tmp < 1e-18)
      rh.push_back(1e-18);
    else
      rh.push_back(tmp);

    tmp = fabs(sol[Y2][last] - qReal);
    if (tmp < 1e-18)
      rq.push_back(1e-18);
    else
      rq.push_back(tmp);

    num.push_back(static_cast<double>(M));
  }

  std::vector<std::vector<double>> res = { h, rh, rq, num };
  return res;
}

bool PrintResA(std::vector<std::vector<double>> res, Scheme s) {
  std::string xf, rhf, rqf, numf;

  if (s == Scheme::Imp) {
    xf = "results/p-3/imp/x";
    rhf = "results/p-3/imp/rh";
    rqf = "results/p-3/imp/rq";
    numf = "results/p-3/imp/num";
  }

  if (s == Scheme::Eul) {
    xf = "results/p-3/exp/eul/x";
    rhf = "results/p-3/exp/eul/rh";
    rqf = "results/p-3/exp/eul/rq";
    numf = "results/p-3/exp/eul/num";
  }

  if (s == Scheme::Meu) {
    xf = "results/p-3/exp/meu/x";
    rhf = "results/p-3/exp/meu/rh";
    rqf = "results/p-3/exp/meu/rq";
    numf = "results/p-3/exp/meu/num";
  }

  if (s == Scheme::RK) {
    xf = "results/p-3/exp/rk/x";
    rhf = "results/p-3/exp/rk/rh";
    rqf = "results/p-3/exp/rk/rq";
    numf = "results/p-3/exp/rk/num";
  }

  if (s == Scheme::Adams) {
    xf = "results/p-3/exp/ad/x";
    rhf = "results/p-3/exp/ad/rh";
    rqf = "results/p-3/exp/ad/rq";
    numf = "results/p-3/exp/ad/num";
  }

  if (PrintVecFile(res[GRID], xf)) 
    if (PrintVecFile(res[Y1], rhf))
      if (PrintVecFile(res[Y2], rqf))
        if (PrintVecFile(res[NUM], numf))
          return true;

  return false;
}

std::ostream& operator << (std::ostream& os, const Scheme& obj){
  os << static_cast<std::underlying_type<Scheme>::type>(obj);
  return os;
}

bool ResB(double a, double b, std::vector<double> y0, Scheme s, Mode m, 
          std::vector<std::vector<double>> &exact) {
  std::vector<double> N = { 51, 251 };
  //50, 100, 200, 500, 1e3, 2e3, 5e3, 1e4, 2e4, 6e4 || , 50, 100, 250
  std::vector<double> h = NumToH(N, a, b);

  std::vector<double> rh;
  std::vector<double> rq;
  std::vector<double> num;

  for (double it : N) {
    size_t M = 0;
    size_t sit = static_cast<size_t>(it);

    std::vector<std::vector<double>> sol = Real(a, b, y0, s, m, sit, &M);

    //std::cout << "Sol back: " << s << " " << sol[Y1].back() << std::endl;

    size_t z = exact[GRID].size() / (sit - 1);
    size_t s1 = sol[GRID].size();

    for (size_t j = 1; j < s1; ++j) {
      sol[Y1][j] = fabs(exact[Y1][z * j - 1] - sol[Y1][j]);
      sol[Y2][j] = fabs(exact[Y2][z * j - 1] - sol[Y2][j]);
    }

    //std::cout << "Dif back: " << s << " " << sol[Y1].back() << std::endl;


    if (!PrintRes(sol, sit, s, m))
      return false;
  }

  return true;
}