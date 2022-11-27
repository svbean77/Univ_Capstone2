String? RANKING_INFO(int total) {
  String result;
  if (total < 150)
    result = "아이언";
  else if (total < 200)
    result = "브론즈";
  else if (total < 250)
    result = "실버";
  else if (total < 300)
    result = "골드";
  else if (total < 350)
    result = "플래티넘";
  else if (total < 400)
    result = "다이아몬드";
  else if (total < 450)
    result = "마스터";
  else if (total < 500)
    result = "그랜드마스터";
  else
    result = "챌린저";

  return result;
}
