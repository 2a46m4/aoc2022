
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 c1 2f 00 00 	mov    0x2fc1(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <clock@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <clock@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <clock@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <mmap@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <mmap@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <printf@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <printf@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <lseek@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4018 <lseek@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <open@plt>:
    1070:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 4020 <open@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .text:

0000000000001080 <main>:
    }
  }
  return ans;
}

int main() {
    1080:	41 57                	push   %r15
    1082:	41 56                	push   %r14
    1084:	41 55                	push   %r13
    1086:	41 54                	push   %r12
    1088:	55                   	push   %rbp
    1089:	53                   	push   %rbx
    108a:	48 8d 2d 73 0f 00 00 	lea    0xf73(%rip),%rbp        # 2004 <_IO_stdin_used+0x4>
    1091:	48 83 ec 18          	sub    $0x18,%rsp
	float startTime = (float)clock()/CLOCKS_PER_SEC;
    1095:	bb 40 42 0f 00       	mov    $0xf4240,%ebx
    109a:	e8 91 ff ff ff       	call   1030 <clock@plt>
    109f:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
    10a3:	c4 e1 f2 2a c0       	vcvtsi2ss %rax,%xmm1,%xmm0
    10a8:	c4 c1 79 7e c7       	vmovd  %xmm0,%r15d
	for(int i = 0; i < 1000000; i++){
    10ad:	0f 1f 00             	nopl   (%rax)
  int fd = open("input.txt", O_RDONLY);
    10b0:	31 f6                	xor    %esi,%esi
    10b2:	48 89 ef             	mov    %rbp,%rdi
    10b5:	31 c0                	xor    %eax,%eax
    10b7:	e8 b4 ff ff ff       	call   1070 <open@plt>
  int len = lseek(fd, 0, SEEK_END);
    10bc:	ba 02 00 00 00       	mov    $0x2,%edx
    10c1:	31 f6                	xor    %esi,%esi
    10c3:	89 c7                	mov    %eax,%edi
  int fd = open("input.txt", O_RDONLY);
    10c5:	41 89 c6             	mov    %eax,%r14d
  int len = lseek(fd, 0, SEEK_END);
    10c8:	e8 93 ff ff ff       	call   1060 <lseek@plt>
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
    10cd:	45 31 c9             	xor    %r9d,%r9d
    10d0:	b9 02 00 00 00       	mov    $0x2,%ecx
    10d5:	45 89 f0             	mov    %r14d,%r8d
    10d8:	48 63 f0             	movslq %eax,%rsi
    10db:	ba 01 00 00 00       	mov    $0x1,%edx
    10e0:	31 ff                	xor    %edi,%edi
  int len = lseek(fd, 0, SEEK_END);
    10e2:	49 89 c5             	mov    %rax,%r13
    10e5:	41 89 c4             	mov    %eax,%r12d
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
    10e8:	e8 53 ff ff ff       	call   1040 <mmap@plt>
  for (int i = 0; i < len; i++) {
    10ed:	45 31 c9             	xor    %r9d,%r9d
  char *data = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
    10f0:	48 89 c1             	mov    %rax,%rcx
  int ans = 0;
    10f3:	31 f6                	xor    %esi,%esi
  for (int i = 0; i < len; i++) {
    10f5:	45 85 ed             	test   %r13d,%r13d
    10f8:	0f 8e 18 01 00 00    	jle    1216 <main+0x196>
    10fe:	66 90                	xchg   %ax,%ax
    while (data[i] != '-') {
    1100:	49 63 c1             	movslq %r9d,%rax
    1103:	41 8d 51 01          	lea    0x1(%r9),%edx
	a = b = c = d = 0;
    1107:	31 ff                	xor    %edi,%edi
    while (data[i] != '-') {
    1109:	44 0f be 04 01       	movsbl (%rcx,%rax,1),%r8d
    110e:	4c 63 d2             	movslq %edx,%r10
    1111:	41 80 f8 2d          	cmp    $0x2d,%r8b
    1115:	74 24                	je     113b <main+0xbb>
    1117:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    111e:	00 00 
      a *= 10;
    1120:	44 8d 0c bf          	lea    (%rdi,%rdi,4),%r9d
      a += data[i] - '0';
    1124:	43 8d 7c 48 d0       	lea    -0x30(%r8,%r9,2),%edi
    while (data[i] != '-') {
    1129:	4d 89 d1             	mov    %r10,%r9
    112c:	49 ff c2             	inc    %r10
    112f:	46 0f be 44 11 ff    	movsbl -0x1(%rcx,%r10,1),%r8d
    1135:	41 80 f8 2d          	cmp    $0x2d,%r8b
    1139:	75 e5                	jne    1120 <main+0xa0>
    i++;
    113b:	41 8d 41 01          	lea    0x1(%r9),%eax
    while (data[i] != ',') {
    113f:	4c 63 d8             	movslq %eax,%r11
    1142:	42 0f be 14 19       	movsbl (%rcx,%r11,1),%edx
    1147:	80 fa 2c             	cmp    $0x2c,%dl
    114a:	0f 84 30 01 00 00    	je     1280 <main+0x200>
    1150:	41 83 c1 02          	add    $0x2,%r9d
	a = b = c = d = 0;
    1154:	45 31 f6             	xor    %r14d,%r14d
    1157:	4d 63 e9             	movslq %r9d,%r13
    115a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
      b *= 10;
    1160:	47 8d 04 b6          	lea    (%r14,%r14,4),%r8d
      b += data[i] - '0';
    1164:	4c 89 e8             	mov    %r13,%rax
    while (data[i] != ',') {
    1167:	49 ff c5             	inc    %r13
      b += data[i] - '0';
    116a:	46 8d 74 42 d0       	lea    -0x30(%rdx,%r8,2),%r14d
    while (data[i] != ',') {
    116f:	42 0f be 54 29 ff    	movsbl -0x1(%rcx,%r13,1),%edx
    1175:	80 fa 2c             	cmp    $0x2c,%dl
    1178:	75 e6                	jne    1160 <main+0xe0>
    i++;
    117a:	44 8d 68 01          	lea    0x1(%rax),%r13d
    while (data[i] != '-') {
    117e:	4d 63 d5             	movslq %r13d,%r10
    1181:	42 0f be 14 11       	movsbl (%rcx,%r10,1),%edx
    1186:	80 fa 2d             	cmp    $0x2d,%dl
    1189:	0f 84 11 01 00 00    	je     12a0 <main+0x220>
    118f:	83 c0 02             	add    $0x2,%eax
	a = b = c = d = 0;
    1192:	45 31 c0             	xor    %r8d,%r8d
    1195:	48 98                	cltq
    1197:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    119e:	00 00 
      c *= 10;
    11a0:	47 8d 0c 80          	lea    (%r8,%r8,4),%r9d
      c += data[i] - '0';
    11a4:	49 89 c3             	mov    %rax,%r11
    while (data[i] != '-') {
    11a7:	48 ff c0             	inc    %rax
      c += data[i] - '0';
    11aa:	46 8d 44 4a d0       	lea    -0x30(%rdx,%r9,2),%r8d
    while (data[i] != '-') {
    11af:	0f be 54 01 ff       	movsbl -0x1(%rcx,%rax,1),%edx
    11b4:	80 fa 2d             	cmp    $0x2d,%dl
    11b7:	75 e7                	jne    11a0 <main+0x120>
      i++;
    11b9:	45 89 dd             	mov    %r11d,%r13d
    i++;
    11bc:	45 8d 4d 01          	lea    0x1(%r13),%r9d
    while (data[i] != '\n') {
    11c0:	49 63 c1             	movslq %r9d,%rax
    11c3:	0f b6 14 01          	movzbl (%rcx,%rax,1),%edx
    11c7:	80 fa 0a             	cmp    $0xa,%dl
    11ca:	0f 84 c0 00 00 00    	je     1290 <main+0x210>
    11d0:	41 8d 45 02          	lea    0x2(%r13),%eax
	a = b = c = d = 0;
    11d4:	45 31 ed             	xor    %r13d,%r13d
    11d7:	48 98                	cltq
    11d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
      d *= 10;
    11e0:	49 89 c1             	mov    %rax,%r9
    while (data[i] != '\n') {
    11e3:	48 ff c0             	inc    %rax
      d += data[i] - '0';
    11e6:	44 0f be da          	movsbl %dl,%r11d
      d *= 10;
    11ea:	47 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%r10d
    while (data[i] != '\n') {
    11ef:	0f b6 54 01 ff       	movzbl -0x1(%rcx,%rax,1),%edx
      d += data[i] - '0';
    11f4:	47 8d 6c 53 d0       	lea    -0x30(%r11,%r10,2),%r13d
    while (data[i] != '\n') {
    11f9:	80 fa 0a             	cmp    $0xa,%dl
    11fc:	75 e2                	jne    11e0 <main+0x160>
    if ((a <= c && b >= d) || (a >= c && b <= d)) {
    11fe:	44 39 c7             	cmp    %r8d,%edi
    1201:	7f 72                	jg     1275 <main+0x1f5>
    1203:	45 39 ee             	cmp    %r13d,%r14d
    1206:	7c 68                	jl     1270 <main+0x1f0>
      ans++;
    1208:	ff c6                	inc    %esi
  for (int i = 0; i < len; i++) {
    120a:	41 ff c1             	inc    %r9d
    120d:	45 39 cc             	cmp    %r9d,%r12d
    1210:	0f 8f ea fe ff ff    	jg     1100 <main+0x80>
	for(int i = 0; i < 1000000; i++){
    1216:	ff cb                	dec    %ebx
			volatile int a = pt1();
    1218:	89 74 24 0c          	mov    %esi,0xc(%rsp)
	for(int i = 0; i < 1000000; i++){
    121c:	0f 85 8e fe ff ff    	jne    10b0 <main+0x30>
	}
	float endTime = (float)clock()/CLOCKS_PER_SEC;
    1222:	e8 09 fe ff ff       	call   1030 <clock@plt>

	printf("%f", (endTime - startTime));
    1227:	c4 c1 79 6e df       	vmovd  %r15d,%xmm3
	float endTime = (float)clock()/CLOCKS_PER_SEC;
    122c:	c5 e8 57 d2          	vxorps %xmm2,%xmm2,%xmm2
	printf("%f", (endTime - startTime));
    1230:	48 8d 3d d7 0d 00 00 	lea    0xdd7(%rip),%rdi        # 200e <_IO_stdin_used+0xe>
	float endTime = (float)clock()/CLOCKS_PER_SEC;
    1237:	c4 e1 ea 2a e0       	vcvtsi2ss %rax,%xmm2,%xmm4
	printf("%f", (endTime - startTime));
    123c:	c5 da 5c eb          	vsubss %xmm3,%xmm4,%xmm5
    1240:	c5 d2 59 35 cc 0d 00 	vmulss 0xdcc(%rip),%xmm5,%xmm6        # 2014 <_IO_stdin_used+0x14>
    1247:	00 
    1248:	b8 01 00 00 00       	mov    $0x1,%eax
    124d:	c5 ca 5a c6          	vcvtss2sd %xmm6,%xmm6,%xmm0
    1251:	e8 fa fd ff ff       	call   1050 <printf@plt>
}
    1256:	48 83 c4 18          	add    $0x18,%rsp
    125a:	31 c0                	xor    %eax,%eax
    125c:	5b                   	pop    %rbx
    125d:	5d                   	pop    %rbp
    125e:	41 5c                	pop    %r12
    1260:	41 5d                	pop    %r13
    1262:	41 5e                	pop    %r14
    1264:	41 5f                	pop    %r15
    1266:	c3                   	ret
    1267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    126e:	00 00 
    if ((a <= c && b >= d) || (a >= c && b <= d)) {
    1270:	44 39 c7             	cmp    %r8d,%edi
    1273:	7c 95                	jl     120a <main+0x18a>
    1275:	45 39 ee             	cmp    %r13d,%r14d
    1278:	7e 8e                	jle    1208 <main+0x188>
    127a:	eb 8e                	jmp    120a <main+0x18a>
    127c:	0f 1f 40 00          	nopl   0x0(%rax)
	a = b = c = d = 0;
    1280:	45 31 f6             	xor    %r14d,%r14d
    1283:	e9 f2 fe ff ff       	jmp    117a <main+0xfa>
    1288:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    128f:	00 
    1290:	45 31 ed             	xor    %r13d,%r13d
    1293:	e9 66 ff ff ff       	jmp    11fe <main+0x17e>
    1298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    129f:	00 
    12a0:	45 31 c0             	xor    %r8d,%r8d
    12a3:	e9 14 ff ff ff       	jmp    11bc <main+0x13c>
    12a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    12af:	00 

00000000000012b0 <set_fast_math>:
    12b0:	f3 0f 1e fa          	endbr64
    12b4:	0f ae 5c 24 fc       	stmxcsr -0x4(%rsp)
    12b9:	81 4c 24 fc 40 80 00 	orl    $0x8040,-0x4(%rsp)
    12c0:	00 
    12c1:	0f ae 54 24 fc       	ldmxcsr -0x4(%rsp)
    12c6:	c3                   	ret
    12c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    12ce:	00 00 

00000000000012d0 <_start>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	31 ed                	xor    %ebp,%ebp
    12d6:	49 89 d1             	mov    %rdx,%r9
    12d9:	5e                   	pop    %rsi
    12da:	48 89 e2             	mov    %rsp,%rdx
    12dd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    12e1:	50                   	push   %rax
    12e2:	54                   	push   %rsp
    12e3:	45 31 c0             	xor    %r8d,%r8d
    12e6:	31 c9                	xor    %ecx,%ecx
    12e8:	48 8d 3d 91 fd ff ff 	lea    -0x26f(%rip),%rdi        # 1080 <main>
    12ef:	ff 15 cb 2c 00 00    	call   *0x2ccb(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    12f5:	f4                   	hlt
    12f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    12fd:	00 00 00 

0000000000001300 <deregister_tm_clones>:
    1300:	48 8d 3d 31 2d 00 00 	lea    0x2d31(%rip),%rdi        # 4038 <__TMC_END__>
    1307:	48 8d 05 2a 2d 00 00 	lea    0x2d2a(%rip),%rax        # 4038 <__TMC_END__>
    130e:	48 39 f8             	cmp    %rdi,%rax
    1311:	74 15                	je     1328 <deregister_tm_clones+0x28>
    1313:	48 8b 05 ae 2c 00 00 	mov    0x2cae(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    131a:	48 85 c0             	test   %rax,%rax
    131d:	74 09                	je     1328 <deregister_tm_clones+0x28>
    131f:	ff e0                	jmp    *%rax
    1321:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1328:	c3                   	ret
    1329:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001330 <register_tm_clones>:
    1330:	48 8d 3d 01 2d 00 00 	lea    0x2d01(%rip),%rdi        # 4038 <__TMC_END__>
    1337:	48 8d 35 fa 2c 00 00 	lea    0x2cfa(%rip),%rsi        # 4038 <__TMC_END__>
    133e:	48 29 fe             	sub    %rdi,%rsi
    1341:	48 89 f0             	mov    %rsi,%rax
    1344:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1348:	48 c1 f8 03          	sar    $0x3,%rax
    134c:	48 01 c6             	add    %rax,%rsi
    134f:	48 d1 fe             	sar    %rsi
    1352:	74 14                	je     1368 <register_tm_clones+0x38>
    1354:	48 8b 05 7d 2c 00 00 	mov    0x2c7d(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    135b:	48 85 c0             	test   %rax,%rax
    135e:	74 08                	je     1368 <register_tm_clones+0x38>
    1360:	ff e0                	jmp    *%rax
    1362:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1368:	c3                   	ret
    1369:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001370 <__do_global_dtors_aux>:
    1370:	f3 0f 1e fa          	endbr64
    1374:	80 3d bd 2c 00 00 00 	cmpb   $0x0,0x2cbd(%rip)        # 4038 <__TMC_END__>
    137b:	75 33                	jne    13b0 <__do_global_dtors_aux+0x40>
    137d:	55                   	push   %rbp
    137e:	48 83 3d 5a 2c 00 00 	cmpq   $0x0,0x2c5a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1385:	00 
    1386:	48 89 e5             	mov    %rsp,%rbp
    1389:	74 0d                	je     1398 <__do_global_dtors_aux+0x28>
    138b:	48 8b 3d 9e 2c 00 00 	mov    0x2c9e(%rip),%rdi        # 4030 <__dso_handle>
    1392:	ff 15 48 2c 00 00    	call   *0x2c48(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1398:	e8 63 ff ff ff       	call   1300 <deregister_tm_clones>
    139d:	c6 05 94 2c 00 00 01 	movb   $0x1,0x2c94(%rip)        # 4038 <__TMC_END__>
    13a4:	5d                   	pop    %rbp
    13a5:	c3                   	ret
    13a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    13ad:	00 00 00 
    13b0:	c3                   	ret
    13b1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    13b8:	00 00 00 00 
    13bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000013c0 <frame_dummy>:
    13c0:	f3 0f 1e fa          	endbr64
    13c4:	e9 67 ff ff ff       	jmp    1330 <register_tm_clones>

Disassembly of section .fini:

00000000000013cc <_fini>:
    13cc:	f3 0f 1e fa          	endbr64
    13d0:	48 83 ec 08          	sub    $0x8,%rsp
    13d4:	48 83 c4 08          	add    $0x8,%rsp
    13d8:	c3                   	ret
