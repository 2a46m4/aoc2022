#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <time.h>

int pt1() {
  int fd = open("input.txt", O_RDONLY);
  int len = lseek(fd, 0, SEEK_END);
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
  int ans = 0;
  for (int i = 0; i < len; i++) {
    int a, b, c, d;
	a = b = c = d = 0;
    while (data[i] != '-') {
      a *= 10;
      a += data[i] - '0';
      i++;
    }
    i++;
    while (data[i] != ',') {
      b *= 10;
      b += data[i] - '0';
      i++;
    }
    i++;
    while (data[i] != '-') {
      c *= 10;
      c += data[i] - '0';
      i++;
    }
    i++;
    while (data[i] != '\n') {
      d *= 10;
      d += data[i] - '0';
      i++;
    }
    if ((a <= c && b >= d) || (a >= c && b <= d)) {
      ans++;
    }
  }
  return ans;
}

int main() {
	float startTime = (float)clock()/CLOCKS_PER_SEC;
	for(int i = 0; i < 1000000; i++){
			volatile int a = pt1();
	}
	float endTime = (float)clock()/CLOCKS_PER_SEC;

	printf("%f", (endTime - startTime));
}
