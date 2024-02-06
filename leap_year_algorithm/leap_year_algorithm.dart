void main() {
  int year = 2024;
  if (year % 100 == 0 && year % 400 != 0) {
    print('平年だあ');
  } else if (year % 4 == 0) {
    print('閏年だあ');
  } else {
    print('平年だあ');
  }
}
