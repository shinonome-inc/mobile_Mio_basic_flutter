void judgeLeapYear(int year) {
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    print('$year年→閏年だあ');
  } else {
    print('$year年→平年だあ');
  }
}

void main() {
  judgeLeapYear(2000);
  judgeLeapYear(2024);
  judgeLeapYear(2300);
  judgeLeapYear(2023);
}
