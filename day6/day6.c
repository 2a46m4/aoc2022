#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>

int pt1() {
  int fd = open("input2.txt", O_RDONLY);
  int len = lseek(fd, 0, SEEK_END);
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
  for (int i = 0; i < len; i++) {
    int bitset = 0;
    bitset = 1 << (data[i + 3] - 'a') | bitset;
    if (bitset >> (data[i + 2] - 'a') & 1)
      continue;
    bitset = 1 << (data[i + 2] - 'a') | bitset;
    if (bitset >> (data[i + 1] - 'a') & 1)
      continue;
    bitset = 1 << (data[i + 1] - 'a') | bitset;
    if (bitset >> (data[i] - 'a') & 1)
      continue;
    return i + 4;
  }
  return -1;
}

int pt2() {
  int fd = open("input2.txt", O_RDONLY);
  int len = lseek(fd, 0, SEEK_END);
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
  for (int i = 0; i < len; i++) {
    int bitset = 0;
    int got = 1;
    for (int j = 0; j < 13; j++) {
      if (bitset >> (data[i + j] - 'a') & 1) {
        got = 0;
        break;
      }
      bitset = 1 << (data[i + j] - 'a') | bitset;
    }
	if(got){
		return i + 14;		
	}
  }
  return -1;
}

int main() {
  float startTime = (float)clock() / CLOCKS_PER_SEC;
  printf("%i\n", pt1());
  printf("%i\n", pt2());
  float endTime = (float)clock() / CLOCKS_PER_SEC;

  printf("%f seconds\n", (endTime - startTime));
}
