#include "ra.h"
#include "res.h"

int main() {

  bool printFlag = false;
  Mode m = Mode::DifTurb;

  double a, b;
  std::vector<double> y0;
  std::vector<std::vector<double>> res;

  if (m == Mode::DifTurb) {
    y0 = { 5, 69.854019322 };
    a = 0;
    b = 303;

    size_t M = 0;
    size_t N = static_cast<size_t>(1e7); //1e6
    Scheme s = Scheme::RK;
    res = Real(a, b, y0, s, m, N, &M);
    
    //std::cout << "Turb etalon: " <<  res[Y1].back() << std::endl;
  }

  std::vector<Scheme> v = { Scheme::Eul, Scheme::Meu, Scheme::RK, Scheme::Adams, Scheme::Imp };
  //Scheme s = Scheme::RK;  Scheme::Eul, Scheme::Meu, Scheme::RK, Scheme::Adams, Scheme::Imp

  for (auto s : v) {
    if (m == Mode::Example) {
      y0 = { 1, 0.5 };
      a = 0;
      b = 2;

      size_t N = static_cast<size_t>(1e3); //1e6
      res = Example(a, b, y0, s, m, N);
    }
    else if (m == Mode::Real) {
      y0 = { 5, 69.854019322 };
      a = 0;
      b = 303;

      size_t M = 0;
      size_t N = static_cast<size_t>(1e6); //1e6
      s = Scheme::RK;
      res = Real(a, b, y0, s, m, N, &M);

      std::string xf, rhf, rqf;
      xf = "results/p-5/x";
      rhf = "results/p-5/rh";
      rqf = "results/p-5/rq";

      if (PrintVecFile(res[GRID], xf))
        if (PrintVecFile(res[Y1], rhf))
          if (PrintVecFile(res[Y2], rqf))
            return 0;

      return -2;
      
    }
    else if (m == Mode::ResA || m == Mode::Anal || m == Mode::DifAnal) {
      if (m == Mode::Anal || m == Mode::DifAnal) {
        y0 = { 5, 77.594927187571050 };
        a = 0;
        b = 303;
      }
      else {
        y0 = { 5, 69.854019322 };
        a = 0;
        b = 303;
      }
      res = ResA(a, b, y0, s, m);
      if (!PrintResA(res, s))
        return -2;
    }
    else if (m == Mode::DifTurb) {

      if (!ResB(a, b, y0, s, m, res))
        return -3;
    }
  }

  return 0;
}