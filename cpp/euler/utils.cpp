#include "utils.h"

std::string CreateName(size_t ind, size_t rschNum, std::string var) {
  std::string beg = "results/p-";
  std::string res;
  res = beg + std::to_string(rschNum) + "/" + var + std::to_string(ind) + ".txt";

  return res;
}

bool OpenFile(std::string filename, std::ofstream& fout) { 
  if (filename == "cout") {
    std::ostream& hout = std::cout;
  }
  else {
    fout.open(filename);
    if (!fout.is_open()) {
      return false;
    }
  }
  return true;
}

bool PrintVecFile(std::vector<double> u, std::string s) {
  std::ofstream fout;
  std::string fname = s + ".txt";

  if (!OpenFile(fname, fout))
    return false;

  size_t M = u.size();

  for (size_t i = 0; i < M; ++i)
    fout << u[i] << " ";

  return true;
}