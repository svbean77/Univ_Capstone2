List<int> getLst(String type, int col) {
  List<int> muscleLst = List.filled(16, 0);
  switch (type) {
    case 'f':
      if (col == 1 || col == 9) {
        muscleLst[6] = 10;
      } else if (col == 2 || col == 8) {
        muscleLst[4] = 1;
        muscleLst[5] = 10;
        muscleLst[6] = 10;
      } else if (col == 3 || col == 7) {
        muscleLst[3] = 6;
        muscleLst[4] = 1;
        muscleLst[5] = 1;
        muscleLst[12] = 11;
        muscleLst[13] = 11;
      } else if (col == 4 || col == 6) {
        muscleLst[2] = 4;
        muscleLst[3] = 2;
        muscleLst[4] = 2;
        muscleLst[5] = 15;
        muscleLst[6] = 15;
        muscleLst[8] = 3;
        muscleLst[9] = 3;
        muscleLst[10] = 3;
        muscleLst[12] = 11;
        muscleLst[13] = 11;
      } else {
        muscleLst[3] = 2;
        muscleLst[4] = 2;
        muscleLst[5] = 12;
        muscleLst[6] = 12;
        muscleLst[7] = 12;
      }
      break;
    case 'b':
      if (col == 1 || col == 9) {
        muscleLst[6] = 10;
      } else if (col == 2 || col == 8) {
        muscleLst[4] = 5;
        muscleLst[5] = 10;
        muscleLst[6] = 10;
      } else if (col == 3 || col == 7) {
        muscleLst[3] = 6;
        muscleLst[4] = 5;
        muscleLst[5] = 5;
        muscleLst[12] = 11;
        muscleLst[13] = 11;
      } else if (col == 4 || col == 6) {
        muscleLst[2] = 4;
        muscleLst[3] = 6;
        muscleLst[4] = 7;
        muscleLst[5] = 7;
        muscleLst[6] = 7;
        muscleLst[7] = 9;
        muscleLst[8] = 9;
        muscleLst[9] = 8;
        muscleLst[10] = 8;
        muscleLst[12] = 11;
        muscleLst[13] = 11;
      } else {
        muscleLst[2] = 4;
        muscleLst[3] = 14;
        muscleLst[4] = 14;
        muscleLst[5] = 13;
        muscleLst[6] = 13;
        muscleLst[7] = 9;
        muscleLst[8] = 9;
        muscleLst[9] = 8;
      }
      break;
  }
  return muscleLst;
}
