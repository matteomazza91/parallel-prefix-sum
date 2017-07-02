# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) MIC Architecture, Version 15.0.0.090";
# mark_description " Build 20140723";
# mark_description "-S -lpthread -lm -mmic -o prefix_sum_mic.s";
	.file "prefixSum.c"
	.text
..TXTST0:
# -- Begin  main
	.text
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl main
main:
# parameter 1: %edi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0 Latency 25
..___tag_value_main.1:                                          #73.33
        pushq     %rbp                                          #73.33
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #73.33
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #73.33
        pushq     %r12                                          #73.33 c1
        pushq     %r13                                          #73.33 c5
        pushq     %r14                                          #73.33 c9
        pushq     %rbx                                          #73.33 c13
        subq      $96, %rsp                                     #73.33 c13
..___tag_value_main.6:                                          #
        movq      %rsi, %rbx                                    #73.33 c17
        movl      %edi, %r12d                                   #73.33 c17
        xorl      %esi, %esi                                    #73.33 c21
        movl      $3, %edi                                      #73.33 c21
        call      __intel_new_feature_proc_init                 #73.33 c25
                                # LOE rbx r15 r12d
..B1.97:                        # Preds ..B1.1 Latency 7
        stmxcsr   (%rsp)                                        #73.33 c1
        orl       $32832, (%rsp)                                #73.33 c2
        ldmxcsr   (%rsp)                                        #73.33 c6
        cmpl      $4, %r12d                                     #76.12 c7
        jl        ..B1.91       # Prob 9%                       #76.12 c7
                                # LOE rbx r15
..B1.2:                         # Preds ..B1.97 Latency 1
        jle       ..B1.7        # Prob 50%                      #83.12 c1
                                # LOE rbx r15
..B1.3:                         # Preds ..B1.2 Latency 5
        movq      32(%rbx), %rdi                                #84.6 c1
        call      atol                                          #84.6 c5
                                # LOE rax rbx r15
..B1.4:                         # Preds ..B1.3 Latency 1
        testl     %eax, %eax                                    #84.6 c1
        je        ..B1.7        # Prob 50%                      #84.6 c1
                                # LOE rbx r15
..B1.5:                         # Preds ..B1.4 Latency 5
        movq      32(%rbx), %rdi                                #85.11 c1
        call      atol                                          #85.11 c5
                                # LOE rax rbx r15
..B1.6:                         # Preds ..B1.5 Latency 1
        movl      %eax, test(%rip)                              #85.4 c1
                                # LOE rbx r15
..B1.7:                         # Preds ..B1.2 ..B1.4 ..B1.6 Latency 5
        movq      8(%rbx), %rdi                                 #87.8 c1
        call      atol                                          #87.8 c5
                                # LOE rax rbx r15
..B1.8:                         # Preds ..B1.7 Latency 9
        movslq    %eax, %rax                                    #87.8 c1
        movq      16(%rbx), %rdi                                #88.19 c1
        movq      %rax, dim(%rip)                               #87.2 c5
        call      atol                                          #88.19 c9
                                # LOE rax rbx r15
..B1.9:                         # Preds ..B1.8 Latency 9
        movl      %eax, num_of_threads(%rip)                    #88.2 c1
        incl      %eax                                          #89.37 c1
        movq      24(%rbx), %rdi                                #90.13 c5
        movl      %eax, num_of_partitions(%rip)                 #89.2 c5
        call      atol                                          #90.13 c9
                                # LOE rax r15
..B1.10:                        # Preds ..B1.9 Latency 9
        movq      dim(%rip), %rbx                               #94.18 c1
        movl      %eax, typeFunc(%rip)                          #90.2 c1
        lea       (,%rbx,4), %rdi                               #94.11 c5
        call      malloc                                        #94.11 c9
                                # LOE rax rbx r15
..B1.103:                       # Preds ..B1.10 Latency 1
        movq      %rax, %rdi                                    #94.11 c1
                                # LOE rbx rdi r15
..B1.11:                        # Preds ..B1.103 Latency 5
        movq      %rdi, Vector(%rip)                            #94.2 c1
        testq     %rbx, %rbx                                    #95.15 c1
        jbe       ..B1.28       # Prob 50%                      #95.15 c5
                                # LOE rbx rdi r15
..B1.12:                        # Preds ..B1.11 Latency 5
        movq      %rdi, %rcx                                    #95.2 c1
        andq      $63, %rcx                                     #95.2 c5
        je        ..B1.14       # Prob 50%                      #95.2 c5
                                # LOE rcx rbx rdi r15
..B1.13:                        # Preds ..B1.12 Latency 17
        negq      %rcx                                          #95.2 c1
        addq      $64, %rcx                                     #95.2 c5
        shrq      $2, %rcx                                      #95.2 c9
        cmpq      %rcx, %rbx                                    #95.2 c13
        jae       ..L10         # Prob 50%                      #95.2 c17
        movq      %rbx, %rcx                                    #95.2
..L10:                                                          #
                                # LOE rcx rbx rdi r15
..B1.14:                        # Preds ..B1.13 ..B1.12 Latency 21
        movq      %rbx, %r8                                     #95.2 c1
        subq      %rcx, %r8                                     #95.2 c5
        andq      $31, %r8                                      #95.2 c9
        negq      %r8                                           #95.2 c13
        addq      %rbx, %r8                                     #95.2 c17
        cmpq      $1, %rcx                                      #95.2 c21
        jb        ..B1.18       # Prob 50%                      #95.2 c21
                                # LOE rcx rbx rdi r8 r15
..B1.15:                        # Preds ..B1.14 Latency 45
        movl      $1285, %esi                                   # c1
        movq      %rcx, (%rsp)                                  #95.2 c1
        kmov      %esi, %k3                                     # c5
        movl      $20560, %esi                                  # c5
        kmov      %esi, %k2                                     # c9
        movl      $2570, %esi                                   # c9
        kmov      %esi, %k4                                     # c13
        movl      $41120, %esi                                  # c13
        vmovaps   .L_2il0floatpacket.4(%rip), %zmm8             #95.2 c17
        vmovdqa32 .L_2il0floatpacket.12(%rip), %zmm7            #95.2 c21
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4          #96.15 c25
        vmovapd   .L_2il0floatpacket.6(%rip), %zmm3             #95.2 c29
        vmovapd   .L_2il0floatpacket.7(%rip), %zmm2             #95.2 c33
        vpbroadcastq (%rsp), %zmm1                              #95.2 c37
        xorl      %edx, %edx                                    #95.2 c37
        vpxord    %zmm0, %zmm0, %zmm0                           # c41
        xorl      %eax, %eax                                    # c41
        kmov      %esi, %k1                                     # c45
                                # LOE rax rcx rbx rdi r8 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.16:                        # Preds ..B1.16 ..B1.15 Latency 185
        vpshufd   $216, %zmm7, %zmm10                           #95.2 c1
        addl      $16, %edx                                     #95.2 c1
        vpshufd   $114, %zmm7, %zmm9                            #95.2 c5
        vpermf32x4 $80, %zmm10, %zmm5{%k3}                      #95.2 c9
        vpermf32x4 $80, %zmm9, %zmm5{%k2}                       #95.2 c13
        vpermf32x4 $78, %zmm7, %zmm15                           #95.2 c17
        vpermf32x4 $80, %zmm9, %zmm5{%k4}                       #95.2 c21
        vmovaps   %zmm5, %zmm11                                 #95.2 c25
        vpermf32x4 $80, %zmm10, %zmm11{%k1}                     #95.2 c29
        vpshufd   $216, %zmm15, %zmm17                          #95.2 c33
        vpshufd   $114, %zmm15, %zmm16                          #95.2 c37
        vpsrad    $31, %zmm11, %zmm12                           #95.2 c41
        vpermf32x4 $80, %zmm17, %zmm6{%k3}                      #95.2 c45
        vpermf32x4 $80, %zmm16, %zmm6{%k2}                      #95.2 c49
        vpandq    %zmm3, %zmm11, %zmm14                         #95.2 c53
        vpandq    %zmm2, %zmm12, %zmm13                         #95.2 c57
        vpermf32x4 $80, %zmm16, %zmm6{%k4}                      #95.2 c61
        vporq     %zmm14, %zmm13, %zmm22                        #95.2 c65
        vmovaps   %zmm6, %zmm18                                 #95.2 c69
        vpermf32x4 $80, %zmm17, %zmm18{%k1}                     #95.2 c73
        vpcmpud   $2, %zmm1, %zmm22, %k6                        #95.2 c77
        vpcmpud   $0, %zmm1, %zmm22, %k5                        #95.2 c81
        vpsrad    $31, %zmm18, %zmm19                           #95.2 c85
        kmov      %k6, %r11d                                    #95.2 c85
        vpcmpud   $1, %zmm1, %zmm22, %k0                        #95.2 c89
        kmov      %k5, %r9d                                     #95.2 c89
        vpandq    %zmm3, %zmm18, %zmm21                         #95.2 c93
        addl      %r11d, %r11d                                  #95.2 c93
        vpandq    %zmm2, %zmm19, %zmm20                         #95.2 c97
        kmov      %k0, %r10d                                    #95.2 c97
        vporq     %zmm21, %zmm20, %zmm24                        #95.2 c101
        andl      %r9d, %r11d                                   #95.2 c101
        vmovaps   %zmm0, %zmm23                                 #95.2 c105
        orl       %r10d, %r11d                                  #95.2 c105
        vpcmpud   $0, %zmm1, %zmm24, %k6                        #95.2 c109
        andl      $-21846, %r11d                                #95.2 c109
        vpcmpud   $1, %zmm1, %zmm24, %k5                        #95.2 c113
        kmov      %r11d, %k7                                    #95.2 c113
        vbroadcastss .L_2il0floatpacket.13(%rip), %zmm23{%k7}   #95.2 c117
        vpcmpud   $2, %zmm1, %zmm24, %k7                        #95.2 c121
        kmov      %k6, %r12d                                    #95.2 c121
        vcmpneqpd %zmm23, %zmm0, %k0                            #95.2 c125
        kmov      %k5, %r13d                                    #95.2 c125
        vmovaps   %zmm0, %zmm25                                 #95.2 c129
        kmov      %k7, %r14d                                    #95.2 c129
        addl      %r14d, %r14d                                  #95.2 c133
        kmov      %k0, %r9d                                     #95.2 c133
        andl      %r12d, %r14d                                  #95.2 c137
        movzbl    %r9b, %r9d                                    #96.3 c137
        orl       %r13d, %r14d                                  #95.2 c141
        andl      $-21846, %r14d                                #95.2 c145
        kmov      %r14d, %k5                                    #95.2 c149
        vbroadcastss .L_2il0floatpacket.13(%rip), %zmm25{%k5}   #95.2 c153
        vcmpneqpd %zmm25, %zmm0, %k0                            #95.2 c157
        vpaddd    %zmm8, %zmm7, %zmm7                           #95.2 c161
        movb      %al, %al                                      #95.2 c161
        kmov      %k0, %r10d                                    #95.2 c165
        shll      $8, %r10d                                     #96.3 c169
        orl       %r10d, %r9d                                   #96.3 c173
        kmov      %r9d, %k6                                     #96.3 c177
        vpackstorelps %zmm4, (%rax,%rdi){%k6}                   #96.3 c181
        addq      $64, %rax                                     #95.2 c181
        cmpq      %rcx, %rdx                                    #95.2 c185
        jb        ..B1.16       # Prob 82%                      #95.2 c185
                                # LOE rax rcx rbx rdi r8 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.17:                        # Preds ..B1.16 Latency 1
        cmpq      %rcx, %rbx                                    #95.2 c1
        je        ..B1.28       # Prob 10%                      #95.2 c1
                                # LOE rcx rbx rdi r8 r15
..B1.18:                        # Preds ..B1.14 ..B1.17 Latency 5
        lea       32(%rcx), %rax                                #95.2 c1
        cmpq      %rax, %r8                                     #95.2 c5
        jb        ..B1.22       # Prob 50%                      #95.2 c5
                                # LOE rcx rbx rdi r8 r15
..B1.19:                        # Preds ..B1.18 Latency 29
        movl      %ecx, %edx                                    #95.2 c1
        vmovaps   .L_2il0floatpacket.8(%rip), %zmm0             #96.15 c5
        movslq    %ecx, %rax                                    # c9
        vprefetche0 (%rdi)                                      #96.3 c9
        vprefetche0 128(%rdi)                                   #96.3 c13
        movb      %al, %al                                      #96.3 c13
        vprefetche0 256(%rdi)                                   #96.3 c17
        movb      %al, %al                                      #96.3 c17
        vprefetche0 384(%rdi)                                   #96.3 c21
        movb      %al, %al                                      #96.3 c21
        vprefetche0 64(%rdi)                                    #96.3 c25
        movb      %al, %al                                      #96.3 c25
        vprefetche0 192(%rdi)                                   #96.3 c29
                                # LOE rax rbx rdi r8 r15 edx zmm0
..B1.20:                        # Preds ..B1.20 ..B1.19 Latency 17
        addl      $32, %edx                                     #95.2 c1
        vprefetche1 1024(%rdi,%rax,4)                           #96.3 c1
        movl      %edx, %edx                                    #95.2 c5
        vmovaps   %zmm0, (%rdi,%rax,4)                          #96.3 c5
        vprefetche0 512(%rdi,%rax,4)                            #96.3 c5
        vmovaps   %zmm0, 64(%rdi,%rax,4)                        #96.3 c9
        vprefetche1 1088(%rdi,%rax,4)                           #96.3 c9
        vprefetche0 576(%rdi,%rax,4)                            #96.3 c13
        addq      $32, %rax                                     #95.2 c13
        cmpq      %r8, %rdx                                     #95.2 c17
        jb        ..B1.20       # Prob 82%                      #95.2 c17
                                # LOE rax rbx rdi r8 r15 edx zmm0
..B1.22:                        # Preds ..B1.20 ..B1.18 Latency 5
        lea       1(%r8), %rax                                  #95.2 c1
        cmpq      %rax, %rbx                                    #95.2 c5
        jb        ..B1.28       # Prob 50%                      #95.2 c5
                                # LOE rbx rdi r8 r15
..B1.23:                        # Preds ..B1.22 Latency 49
        movl      $1285, %esi                                   #96.3 c1
        movq      %rbx, %rdx                                    #95.2 c1
        kmov      %esi, %k3                                     #96.3 c5
        movl      $20560, %esi                                  #96.3 c5
        movslq    %r8d, %rax                                    #96.3 c9
        subq      %r8, %rdx                                     #95.2 c9
        kmov      %esi, %k2                                     #96.3 c13
        movl      $2570, %esi                                   #96.3 c13
        movq      %rdx, (%rsp)                                  #95.2 c17
        kmov      %esi, %k4                                     #96.3 c17
        movl      $41120, %esi                                  #96.3 c21
        xorl      %ecx, %ecx                                    #95.2 c21
        vmovaps   .L_2il0floatpacket.4(%rip), %zmm8             #95.2 c25
        vmovdqa32 .L_2il0floatpacket.12(%rip), %zmm7            #95.2 c29
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4          #96.15 c33
        vmovapd   .L_2il0floatpacket.6(%rip), %zmm3             #95.2 c37
        vmovapd   .L_2il0floatpacket.7(%rip), %zmm2             #95.2 c41
        vpbroadcastq (%rsp), %zmm1                              #95.2 c45
        lea       (%rdi,%rax,4), %rax                           #96.3 c45
        vpxord    %zmm0, %zmm0, %zmm0                           #96.3 c49
        kmov      %esi, %k1                                     #96.3 c49
                                # LOE rax rdx rbx r15 ecx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.24:                        # Preds ..B1.26 ..B1.23 Latency 177
        vpshufd   $216, %zmm7, %zmm10                           #95.2 c1
        vpshufd   $114, %zmm7, %zmm9                            #95.2 c5
        vpermf32x4 $80, %zmm10, %zmm5{%k3}                      #95.2 c9
        vpermf32x4 $80, %zmm9, %zmm5{%k2}                       #95.2 c13
        vpermf32x4 $78, %zmm7, %zmm15                           #95.2 c17
        vpermf32x4 $80, %zmm9, %zmm5{%k4}                       #95.2 c21
        vmovaps   %zmm5, %zmm11                                 #95.2 c25
        vpermf32x4 $80, %zmm10, %zmm11{%k1}                     #95.2 c29
        vpshufd   $216, %zmm15, %zmm17                          #95.2 c33
        vpshufd   $114, %zmm15, %zmm16                          #95.2 c37
        vpsrad    $31, %zmm11, %zmm12                           #95.2 c41
        vpermf32x4 $80, %zmm17, %zmm6{%k3}                      #95.2 c45
        vpermf32x4 $80, %zmm16, %zmm6{%k2}                      #95.2 c49
        vpandq    %zmm3, %zmm11, %zmm14                         #95.2 c53
        vpandq    %zmm2, %zmm12, %zmm13                         #95.2 c57
        vpermf32x4 $80, %zmm16, %zmm6{%k4}                      #95.2 c61
        vporq     %zmm14, %zmm13, %zmm22                        #95.2 c65
        vmovaps   %zmm6, %zmm18                                 #95.2 c69
        vpermf32x4 $80, %zmm17, %zmm18{%k1}                     #95.2 c73
        vpcmpud   $2, %zmm1, %zmm22, %k6                        #95.2 c77
        vpcmpud   $0, %zmm1, %zmm22, %k5                        #95.2 c81
        vpsrad    $31, %zmm18, %zmm19                           #95.2 c85
        kmov      %k6, %r9d                                     #95.2 c85
        vpcmpud   $1, %zmm1, %zmm22, %k0                        #95.2 c89
        kmov      %k5, %edi                                     #95.2 c89
        vpandq    %zmm3, %zmm18, %zmm21                         #95.2 c93
        addl      %r9d, %r9d                                    #95.2 c93
        vpandq    %zmm2, %zmm19, %zmm20                         #95.2 c97
        kmov      %k0, %r8d                                     #95.2 c97
        vporq     %zmm21, %zmm20, %zmm24                        #95.2 c101
        andl      %edi, %r9d                                    #95.2 c101
        vmovaps   %zmm0, %zmm23                                 #95.2 c105
        orl       %r8d, %r9d                                    #95.2 c105
        vpcmpud   $0, %zmm1, %zmm24, %k6                        #95.2 c109
        andl      $-21846, %r9d                                 #95.2 c109
        vpcmpud   $1, %zmm1, %zmm24, %k5                        #95.2 c113
        kmov      %r9d, %k7                                     #95.2 c113
        vbroadcastss .L_2il0floatpacket.13(%rip), %zmm23{%k7}   #95.2 c117
        vpcmpud   $2, %zmm1, %zmm24, %k7                        #95.2 c121
        kmov      %k6, %r10d                                    #95.2 c121
        vcmpneqpd %zmm23, %zmm0, %k0                            #95.2 c125
        kmov      %k5, %r11d                                    #95.2 c125
        vmovaps   %zmm0, %zmm25                                 #95.2 c129
        kmov      %k7, %r12d                                    #95.2 c129
        addl      %r12d, %r12d                                  #95.2 c133
        kmov      %k0, %edi                                     #95.2 c133
        andl      %r10d, %r12d                                  #95.2 c137
        movl      %edi, %r13d                                   #95.2 c137
        orl       %r11d, %r12d                                  #95.2 c141
        andl      $-21846, %r12d                                #95.2 c145
        kmov      %r12d, %k5                                    #95.2 c149
        vbroadcastss .L_2il0floatpacket.13(%rip), %zmm25{%k5}   #95.2 c153
        vcmpneqpd %zmm25, %zmm0, %k0                            #95.2 c157
        nop                                                     #95.2 c161
        kmov      %k0, %r8d                                     #95.2 c165
        andl      %r8d, %r13d                                   #95.2 c169
        xorl      $-1, %r13d                                    #95.2 c173
        testb     %r13b, %r13b                                  #95.2 c177
        jne       ..B1.90       # Prob 9%                       #95.2 c177
                                # LOE rax rdx rbx r15 ecx edi r8d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.25:                        # Preds ..B1.24 Latency 1
        vmovaps   %zmm4, (%rax)                                 #96.3 c1
                                # LOE rax rdx rbx r15 ecx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.26:                        # Preds ..B1.90 ..B1.25 Latency 9
        addl      $16, %ecx                                     #95.2 c1
        addq      $64, %rax                                     #95.2 c1
        vpaddd    %zmm8, %zmm7, %zmm7                           #95.2 c5
        cmpq      %rdx, %rcx                                    #95.2 c5
        jb        ..B1.24       # Prob 82%                      #95.2 c9
                                # LOE rax rdx rbx r15 ecx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.28:                        # Preds ..B1.11 ..B1.26 ..B1.22 ..B1.17 Latency 5
        cmpl      $2, test(%rip)                                #100.11 c1
        je        ..B1.89       # Prob 5%                       #100.11 c5
                                # LOE rbx r15
..B1.29:                        # Preds ..B1.28 ..B1.89 Latency 5
        movl      $tm1, %edi                                    #103.2 c1
        xorl      %esi, %esi                                    #103.2 c1
        call      gettimeofday                                  #103.2 c5
                                # LOE r15
..B1.30:                        # Preds ..B1.29 Latency 17
        movl      num_of_threads(%rip), %r14d                   #104.2 c1
        movslq    %r14d, %rbx                                   #104.2 c5
        lea       (,%rbx,8), %rdx                               #104.2 c9
        lea       (%rdx,%rbx,4), %rdi                           #104.2 c13
        call      malloc                                        #104.2 c17
                                # LOE rax rbx r15 r14d
..B1.104:                       # Preds ..B1.30 Latency 1
        movq      %rax, %r13                                    #104.2 c1
                                # LOE rbx r13 r15 r14d
..B1.31:                        # Preds ..B1.104 Latency 9
        shlq      $3, %rbx                                      #104.2 c1
        movq      %rbx, %rdi                                    #104.2 c5
        call      malloc                                        #104.2 c9
                                # LOE rax r13 r15 r14d
..B1.105:                       # Preds ..B1.31 Latency 1
        movq      %rax, %r12                                    #104.2 c1
                                # LOE r12 r13 r15 r14d
..B1.32:                        # Preds ..B1.105 Latency 9
        movq      %r13, %rcx                                    # c1
        xorl      %edx, %edx                                    #104.2 c1
        xorl      %eax, %eax                                    # c5
        movq      %rcx, %rbx                                    # c5
        testl     %r14d, %r14d                                  #104.2 c9
        jle       ..B1.37       # Prob 15%                      #104.2 c9
                                # LOE rax rcx rbx r12 r13 r15 edx r14d
..B1.33:                        # Preds ..B1.32 Latency 9
        movq      %r13, (%rsp)                                  # c1
        movq      %rax, %r14                                    # c1
        movq      %r15, 8(%rsp)                                 # c5
..___tag_value_main.11:                                         #
        movl      %edx, %r13d                                   # c5
        movq      %rcx, %r15                                    # c9
                                # LOE rbx r12 r14 r15 r13d
..B1.34:                        # Preds ..B1.35 ..B1.33 Latency 17
        lea       (%r12,%r14), %rdi                             #104.2 c1
        xorl      %esi, %esi                                    #104.2 c1
        movl      $worker, %edx                                 #104.2 c5
        movq      %r15, %rcx                                    #104.2 c5
        movl      %r13d, (%r15)                                 #104.2 c9
        movl      $0, 4(%r15)                                   #104.2 c13
        call      pthread_create                                #104.2 c17
                                # LOE rbx r12 r14 r15 r13d
..B1.35:                        # Preds ..B1.34 Latency 13
        incl      %r13d                                         #104.2 c1
        addq      $8, %r14                                      #104.2 c1
        addq      $12, %r15                                     #104.2 c5
        movl      num_of_threads(%rip), %eax                    #104.2 c5
        cmpl      num_of_threads(%rip), %r13d                   #104.2 c9
        jl        ..B1.34       # Prob 82%                      #104.2 c13
                                # LOE rbx r12 r14 r15 eax r13d
..B1.36:                        # Preds ..B1.35 Latency 5
        movl      %eax, %r14d                                   # c1
        movq      (%rsp), %r13                                  # c1
        movq      8(%rsp), %r15                                 # c5
..___tag_value_main.12:                                         #
                                # LOE rbx r12 r13 r15 r14d
..B1.37:                        # Preds ..B1.36 ..B1.32 Latency 5
        xorl      %esi, %esi                                    #104.2 c1
        xorl      %ecx, %ecx                                    # c1
        testl     %r14d, %r14d                                  #104.2 c5
        jle       ..B1.45       # Prob 10%                      #104.2 c5
                                # LOE rcx rbx rsi r12 r13 r15 r14d
..B1.38:                        # Preds ..B1.37 Latency 1
        movslq    %r14d, %rdx                                   #104.2 c1
                                # LOE rdx rcx rbx rsi r12 r13 r15 r14d
..B1.39:                        # Preds ..B1.39 ..B1.43 ..B1.38 Latency 5
        movl      4(%rcx,%r13), %r8d                            #104.2 c1
        testl     %r8d, %r8d                                    #104.2 c5
        je        ..B1.39       # Prob 90%                      #104.2 c5
                                # LOE rdx rcx rbx rsi r12 r13 r15 r14d
..B1.43:                        # Preds ..B1.39 Latency 5
        incq      %rsi                                          #104.2 c1
        addq      $12, %rcx                                     #104.2 c1
        cmpq      %rdx, %rsi                                    #104.2 c5
        jl        ..B1.39       # Prob 82%                      #104.2 c5
                                # LOE rdx rcx rbx rsi r12 r13 r15 r14d
..B1.45:                        # Preds ..B1.43 ..B1.37 Latency 5
        xorl      %r8d, %r8d                                    #104.2 c1
        xorl      %esi, %esi                                    # c1
        cmpl      $1, %r14d                                     #104.2 c5
        jle       ..B1.108      # Prob 10%                      #104.2 c5
                                # LOE rbx rsi r8 r12 r13 r15 r14d
..B1.46:                        # Preds ..B1.45 Latency 29
        movl      $1, %eax                                      #104.2 c1
        vprefetch0 8(%r13)                                      #104.2 c1
        movslq    %r14d, %rdx                                   #104.2 c5
        kmov      %eax, %k1                                     #104.2 c5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4{%k1}     #104.2 c9
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm3          #104.2 c13
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm2             #104.2 c17
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm1{%k1}    #104.2 c21
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0         #104.2 c25
        movl      typeFunc(%rip), %ecx                          #104.2 c29
        decq      %rdx                                          #104.2 c29
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.47:                        # Preds ..B1.55 ..B1.46 Latency 1
        testl     %ecx, %ecx                                    #104.2 c1
        je        ..B1.54       # Prob 25%                      #104.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.48:                        # Preds ..B1.47 Latency 1
        cmpl      $1, %ecx                                      #104.2 c1
        jne       ..B1.50       # Prob 66%                      #104.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.49:                        # Preds ..B1.48 Latency 66
        vmovaps   %zmm3, %zmm6                                  #104.2 c1
        movl      $1023, %eax                                   #104.2 c1
        vbroadcastss 20(%rsi,%r13), %zmm12{%k1}                 #104.2 c5
        kmov      %eax, %k2                                     #104.2 c5
        vmulps    %zmm0, %zmm3, %zmm6{%k2}                      #104.2 c9
        nop                                                     #104.2 c13
        vpermf32x4 $238, %zmm6, %zmm5                           #104.2 c17
        vmulps    %zmm6, %zmm5, %zmm8                           #104.2 c21
        nop                                                     #104.2 c25
        vpermf32x4 $85, %zmm8, %zmm7                            #104.2 c29
        vmulps    %zmm8, %zmm7, %zmm9                           #104.2 c33
        nop                                                     #104.2 c37
        vmulps    %zmm9{badc}, %zmm9, %zmm10                    #104.2 c41
        nop                                                     #104.2 c45
        vmulps    %zmm10{cdab}, %zmm10, %zmm11                  #104.2 c49
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm1, %zmm11{%k1} #104.2 c53
        vfmadd213ps 8(%rsi,%r13){1to16}, %zmm12, %zmm11{%k1}    #104.2 c57
        nop                                                     #104.2 c61
        vpackstorelps %zmm11, 20(%rsi,%r13){%k1}                #104.2 c65
        jmp       ..B1.55       # Prob 100%                     #104.2 c65
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.50:                        # Preds ..B1.48 Latency 1
        cmpl      $2, %ecx                                      #104.2 c1
        jne       ..B1.55       # Prob 50%                      #104.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.51:                        # Preds ..B1.50 Latency 13
        vpshufd   $0, %zmm4, %zmm5                              #104.2 c1
        xorb      %r9b, %r9b                                    #104.2 c1
        vbroadcastss 20(%rsi,%r13), %zmm7{%k1}                  #104.2 c5
        vbroadcastss 8(%rsi,%r13), %zmm6{%k1}                   #104.2 c9
        vpermf32x4 $0, %zmm5, %zmm5                             #104.2 c13
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d r9b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B1.52:                        # Preds ..B1.52 ..B1.51 Latency 9
        vmulps    %zmm2, %zmm5, %zmm5                           #104.2 c1
        addb      $32, %r9b                                     #104.2 c1
        vmulps    %zmm5, %zmm2, %zmm5                           #104.2 c5
        cmpb      $96, %r9b                                     #104.2 c5
        jb        ..B1.52       # Prob 82%                      #104.2 c9
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d r9b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B1.53:                        # Preds ..B1.52 Latency 58
        vpermf32x4 $238, %zmm5, %zmm8                           #104.2 c1
        vmulps    %zmm5, %zmm8, %zmm9                           #104.2 c5
        vmulps    %zmm1, %zmm1, %zmm14{%k1}                     #104.2 c9
        vpermf32x4 $85, %zmm9, %zmm5                            #104.2 c13
        vmulps    %zmm9, %zmm5, %zmm10                          #104.2 c17
        nop                                                     #104.2 c21
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #104.2 c25
        nop                                                     #104.2 c29
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #104.2 c33
        vmulps    %zmm12, %zmm1, %zmm13{%k1}                    #104.2 c37
        vmulps    %zmm13, %zmm14, %zmm15{%k1}                   #104.2 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm14, %zmm15{%k1} #104.2 c45
        vfmadd213ps %zmm6, %zmm7, %zmm15{%k1}                   #104.2 c49
        nop                                                     #104.2 c53
        vpackstorelps %zmm15, 20(%rsi,%r13){%k1}                #104.2 c57
        jmp       ..B1.55       # Prob 100%                     #104.2 c57
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.54:                        # Preds ..B1.47 Latency 13
        vbroadcastss 20(%rsi,%r13), %zmm5{%k1}                  #104.2 c1
        vaddps    8(%rsi,%r13){1to16}, %zmm5, %zmm6{%k1}        #104.2 c5
        nop                                                     #104.2 c9
        vpackstorelps %zmm6, 20(%rsi,%r13){%k1}                 #104.2 c13
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.55:                        # Preds ..B1.50 ..B1.54 ..B1.49 ..B1.53 Latency 9
        incq      %r8                                           #104.2 c1
        vprefetche1 68(%rsi,%r13)                               #104.2 c1
        vprefetch0 32(%rsi,%r13)                                #104.2 c5
        addq      $12, %rsi                                     #104.2 c5
        cmpq      %rdx, %r8                                     #104.2 c9
        jb        ..B1.47       # Prob 82%                      #104.2 c9
                                # LOE rdx rbx rsi r8 r12 r13 r15 ecx r14d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.57:                        # Preds ..B1.55 ..B1.108 Latency 5
        cmpl      $2, test(%rip)                                #104.2 c1
        je        ..B1.82       # Prob 5%                       #104.2 c5
                                # LOE rbx r12 r13 r15 r14d k1
..B1.58:                        # Preds ..B1.57 ..B1.109 Latency 5
        xorl      %ecx, %ecx                                    #104.2 c1
        xorl      %edx, %edx                                    # c1
        testl     %r14d, %r14d                                  #104.2 c5
        jle       ..B1.66       # Prob 15%                      #104.2 c5
                                # LOE rdx rcx r12 r13 r15 k1
..B1.60:                        # Preds ..B1.58 ..B1.60 Latency 17
        movl      $2, 4(%rdx,%r13)                              #104.2 c1
        incq      %rcx                                          #104.2 c5
        addq      $12, %rdx                                     #104.2 c5
        movl      num_of_threads(%rip), %eax                    #104.2 c9
        movslq    %eax, %rax                                    #104.2 c13
        cmpq      %rax, %rcx                                    #104.2 c17
        jl        ..B1.60       # Prob 82%                      #104.2 c17
                                # LOE rdx rcx r12 r13 r15 eax k1
..B1.61:                        # Preds ..B1.60 Latency 1
        testl     %eax, %eax                                    #104.2 c1
        jle       ..B1.66       # Prob 10%                      #104.2 c1
                                # LOE r12 r13 r15 k1
..B1.62:                        # Preds ..B1.61 Latency 1
        xorl      %ebx, %ebx                                    #104.2 c1
        vprefetch0 (%r12)                                       #104.2 c1
                                # LOE rbx r12 r13 r15
..B1.63:                        # Preds ..B1.64 ..B1.62 Latency 37
        incq      %rbx                                          #104.2 c1
        xorl      %esi, %esi                                    #104.2 c1
        vprefetch1 248(%r12,%rbx,8)                             #104.2 c5
        vprefetch0 8(%r12,%rbx,8)                               #104.2 c9
        movq      -8(%r12,%rbx,8), %rdi                         #104.2 c19
..___tag_value_main.13:                                         #104.2
        call      pthread_join                                  #104.2
..___tag_value_main.14:                                         #
                                # LOE rbx r12 r13 r15
..B1.64:                        # Preds ..B1.63 Latency 9
        movl      num_of_threads(%rip), %eax                    #104.2 c1
        movslq    %eax, %rax                                    #104.2 c5
        cmpq      %rax, %rbx                                    #104.2 c9
        jl        ..B1.63       # Prob 82%                      #104.2 c9
                                # LOE rbx r12 r13 r15
..B1.65:                        # Preds ..B1.64 Latency 5
        movl      $1, %eax                                      # c1
        kmov      %eax, %k1                                     # c5
                                # LOE r12 r13 r15 k1
..B1.66:                        # Preds ..B1.61 ..B1.65 ..B1.58 Latency 5
        movq      %r13, %rdi                                    #104.2 c1
        call      free                                          #104.2 c5
                                # LOE r12 r15
..B1.67:                        # Preds ..B1.66 Latency 9
        movl      $1, %eax                                      # c1
        movq      %r12, %rdi                                    #104.2 c1
        kmov      %eax, %k1                                     # c5
        call      free                                          #104.2 c9
                                # LOE r15
..B1.68:                        # Preds ..B1.67 Latency 9
        movl      $1, %eax                                      # c1
        movl      $tm2, %edi                                    #105.2 c1
        xorl      %esi, %esi                                    #105.2 c5
        kmov      %eax, %k1                                     # c5
        call      gettimeofday                                  #105.2 c9
                                # LOE r15
..B1.69:                        # Preds ..B1.68 Latency 13
        movl      $1, %eax                                      # c1
        movl      test(%rip), %r12d                             #109.5 c1
        kmov      %eax, %k1                                     # c5
        movl      %r12d, %eax                                   #109.11 c5
        andl      $-2, %eax                                     #109.11 c9
        movq      Vector(%rip), %rbx                            #111.19 c9
        cmpl      $2, %eax                                      #109.11 c13
        je        ..B1.76       # Prob 16%                      #109.11 c13
                                # LOE rbx r15 r12d k1
..B1.70:                        # Preds ..B1.69 ..B1.110 Latency 333
        vbroadcastsd .L_2il0floatpacket.11(%rip), %zmm8{%k1}    #118.29 c1
        vgetmantpd $0, %zmm8, %zmm17{%k1}                       #118.29 c5
        cmpl      $3, %r12d                                     #120.12 c5
        vpbroadcastd .L_2il0floatpacket.18(%rip), %zmm9         #118.29 c9
        vcvtpd2ps {rz-sae}, %zmm17, %zmm15{%k1}                 #118.29 c13
        vpxorq    %zmm6, %zmm6, %zmm6                           #118.29 c17
        vbroadcasti64x4 .L_2il0floatpacket.15(%rip), %zmm5      #118.29 c21
        vrcp23ps  %zmm15, %zmm16{%k1}                           #118.29 c25
        vcvtudq2pd 8+tm2(%rip){1to8}, %zmm12{%k1}               #118.17 c29
        vcvtdq2pd 12+tm2(%rip){1to8}, %zmm13{%k1}               #118.17 c33
        vfixupnanpd %zmm9, %zmm8, %zmm6{%k1}                    #118.29 c37
        vfmadd132pd .L_2il0floatpacket.14(%rip){1to8}, %zmm12, %zmm13{%k1} #118.17 c41
        vmovaps   %zmm6, %zmm14                                 #118.29 c45
        vcvtps2pd %zmm16, %zmm26{%k1}                           #118.29 c49
        vmovapd   %zmm5{bbbb}, %zmm4                            #118.29 c53
        vfixupnanpd %zmm9, %zmm13, %zmm14{%k1}                  #118.29 c57
        vfnmadd213pd {rn-sae}, %zmm4, %zmm26, %zmm17{%k1}       #118.29 c61
        vcmpeqpd  %zmm14, %zmm14, %k3{%k1}                      #118.29 c65
        vfmadd231pd {rn-sae}, %zmm17, %zmm17, %zmm17{%k1}       #118.29 c69
        vpbroadcastd .L_2il0floatpacket.19(%rip), %zmm27        #118.29 c73
        vmovaps   %zmm8, %zmm2                                  #118.29 c77
        kmov      %k3, %k2                                      #118.29 c77
        vfmadd231pd {rn-sae}, %zmm26, %zmm17, %zmm26{%k1}       #118.29 c81
        kandn     %k1, %k2                                      #118.29 c81
        vgetmantpd $0, %zmm13, %zmm25{%k1}                      #118.29 c85
        vfixupnanpd %zmm27, %zmm8, %zmm2{%k1}                   #118.29 c89
        vmulpd    {rn-sae}, %zmm26, %zmm25, %zmm31{%k3}         #118.29 c93
        vgetexppd %zmm13, %zmm18{%k1}                           #118.29 c97
        vmulpd    {rn-sae}, %zmm2, %zmm13, %zmm31{%k2}          #118.29 c101
        vcvtudq2pd 8+tm1(%rip){1to8}, %zmm12{%k1}               #119.17 c105
        vcvtdq2pd 12+tm1(%rip){1to8}, %zmm13{%k1}               #119.17 c109
        vfmadd132pd .L_2il0floatpacket.14(%rip){1to8}, %zmm12, %zmm13{%k1} #119.17 c113
        vfixupnanpd %zmm9, %zmm13, %zmm6{%k1}                   #119.29 c117
        vgetmantpd $0, %zmm8, %zmm14{%k1}                       #119.29 c121
        vcmpeqpd  %zmm6, %zmm6, %k5{%k1}                        #119.29 c125
        vcvtpd2ps {rz-sae}, %zmm14, %zmm6{%k1}                  #119.29 c129
        vrcp23ps  %zmm6, %zmm9{%k1}                             #119.29 c133
        kmov      %k5, %k4                                      #119.29 c133
        vgetexppd %zmm8, %zmm19{%k1}                            #118.29 c137
        kandn     %k1, %k4                                      #119.29 c137
        vsubpd    %zmm19, %zmm18, %zmm20{%k1}                   #118.29 c141
        vcvtps2pd %zmm9, %zmm18{%k1}                            #119.29 c145
        vfnmadd213pd {rn-sae}, %zmm4, %zmm18, %zmm14{%k1}       #119.29 c149
        vgetexppd %zmm8, %zmm4{%k1}                             #119.29 c153
        vgetexppd %zmm13, %zmm8{%k1}                            #119.29 c157
        vbroadcasti32x4 .L_2il0floatpacket.17(%rip), %zmm10     #118.29 c161
        vsubpd    %zmm4, %zmm8, %zmm15{%k1}                     #119.29 c165
        vpminsd   %zmm10{aaaa}, %zmm20, %zmm21                  #118.29 c169
        vpminsd   %zmm10{aaaa}, %zmm15, %zmm16                  #119.29 c173
        vpminud   %zmm10{bbbb}, %zmm21, %zmm22                  #118.29 c177
        vpminud   %zmm10{bbbb}, %zmm16, %zmm10                  #119.29 c181
        vaddpd    %zmm5{cccc}, %zmm22, %zmm22{%k1}              #118.29 c185
        vaddpd    %zmm5{cccc}, %zmm10, %zmm10{%k1}              #119.29 c189
        vpslld    $20, %zmm22, %zmm23                           #118.29 c193
        vpslld    $20, %zmm10, %zmm17                           #119.29 c197
        vbroadcasti64x4 .L_2il0floatpacket.16(%rip), %zmm7      #118.29 c201
        vpsrad    $1, %zmm23, %zmm28                            #118.29 c205
        vpsrad    $1, %zmm17, %zmm19                            #119.29 c209
        vpandq    %zmm7{aaaa}, %zmm28, %zmm28{%k1}              #118.29 c213
        vpandq    %zmm7{aaaa}, %zmm19, %zmm19{%k1}              #119.29 c217
        vpsubd    %zmm28, %zmm23, %zmm24                        #118.29 c221
        vmovdqa64 %zmm5{bbbb}, %zmm3                            #118.29 c225
        vpsubd    %zmm19, %zmm17, %zmm7                         #119.29 c229
        vpaddd    %zmm3, %zmm24, %zmm30                         #118.29 c233
        vfmadd231pd {rn-sae}, %zmm14, %zmm14, %zmm14{%k1}       #119.29 c237
        vpaddd    %zmm3, %zmm7, %zmm3                           #119.29 c241
        vpandq    %zmm5{aaaa}, %zmm30, %zmm30{%k1}              #118.29 c245
        vfmadd231pd {rn-sae}, %zmm18, %zmm14, %zmm18{%k1}       #119.29 c249
        vpandq    %zmm5{aaaa}, %zmm3, %zmm3{%k1}                #119.29 c253
        vgetmantpd $0, %zmm13, %zmm5{%k1}                       #119.29 c257
        vpaddd    %zmm28, %zmm31, %zmm29                        #118.29 c261
        vmulpd    {rn-sae}, %zmm18, %zmm5, %zmm20{%k5}          #119.29 c265
        vcvtudq2pd tm2(%rip){1to8}, %zmm11{%k1}                 #118.5 c269
        vcvtdq2pd 4+tm2(%rip){1to8}, %zmm1{%k1}                 #118.5 c273
        vmulpd    {rn}, %zmm30, %zmm29, %zmm31{%k3}             #118.29 c277
        vmulpd    {rn-sae}, %zmm2, %zmm13, %zmm20{%k4}          #119.29 c281
        vfmadd132pd .L_2il0floatpacket.14(%rip){1to8}, %zmm11, %zmm1{%k1} #118.5 c285
        vmovapd   %zmm31, %zmm0{%k1}                            #118.29 c289
        vpaddd    %zmm19, %zmm20, %zmm2                         #119.29 c293
        vaddpd    %zmm0, %zmm1, %zmm1{%k1}                      #118.29 c297
        vcvtudq2pd tm1(%rip){1to8}, %zmm11{%k1}                 #119.5 c301
        vcvtdq2pd 4+tm1(%rip){1to8}, %zmm0{%k1}                 #119.5 c305
        vmulpd    {rn}, %zmm3, %zmm2, %zmm20{%k5}               #119.29 c309
        vfmadd132pd .L_2il0floatpacket.14(%rip){1to8}, %zmm11, %zmm0{%k1} #119.5 c313
        vmovapd   %zmm20, %zmm21{%k1}                           #119.29 c317
        vaddpd    %zmm21, %zmm0, %zmm0{%k1}                     #119.29 c321
        vpackstorelpd %zmm1, t2(%rip){%k1}                      #118.2 c325
        vpackstorelpd %zmm0, t1(%rip){%k1}                      #119.2 c329
        je        ..B1.74       # Prob 16%                      #120.12 c333
                                # LOE rbx r15 r12d zmm0 zmm1 k1
..B1.71:                        # Preds ..B1.70 Latency 1
        testl     %r12d, %r12d                                  #121.6 c1
        je        ..B1.73       # Prob 50%                      #121.6 c1
                                # LOE rbx r15 zmm0 zmm1 k1
..B1.72:                        # Preds ..B1.71 Latency 10
        vsubpd    %zmm0, %zmm1, %zmm0{%k1}                      #122.4 c1
        movl      num_of_threads(%rip), %esi                    #122.4 c1
        movl      $.L_2__STRING.6, %edi                         #122.4 c5
        movl      $1, %eax                                      #122.4 c5
..___tag_value_main.15:                                         #122.4
        call      printf                                        #122.4
..___tag_value_main.16:                                         #
        jmp       ..B1.74       # Prob 100%                     #122.4 c9
                                # LOE rbx r15
..B1.73:                        # Preds ..B1.71 Latency 9
        vsubpd    %zmm0, %zmm1, %zmm0{%k1}                      #125.4 c1
        movl      $.L_2__STRING.7, %edi                         #125.4 c1
        movl      $1, %eax                                      #125.4 c5
..___tag_value_main.17:                                         #125.4
        call      printf                                        #125.4
..___tag_value_main.18:                                         #
                                # LOE rbx r15
..B1.74:                        # Preds ..B1.70 ..B1.73 ..B1.72 Latency 5
        movq      %rbx, %rdi                                    #130.2 c1
        call      free                                          #130.2 c5
                                # LOE r15
..B1.75:                        # Preds ..B1.74 Latency 21
        xorl      %eax, %eax                                    #131.9 c1
        addq      $96, %rsp                                     #131.9 c1
..___tag_value_main.19:                                         #131.9
        popq      %rbx                                          #131.9
..___tag_value_main.20:                                         #131.9
        popq      %r14                                          #131.9
..___tag_value_main.21:                                         #131.9
        popq      %r13                                          #131.9
..___tag_value_main.22:                                         #131.9
        popq      %r12                                          #131.9
        movq      %rbp, %rsp                                    #131.9 c21
        popq      %rbp                                          #131.9
..___tag_value_main.23:                                         #
        ret                                                     #131.9
..___tag_value_main.25:                                         #
                                # LOE
..B1.76:                        # Preds ..B1.69                 # Infreq Latency 5
        movq      dim(%rip), %rax                               #110.16 c1
        testq     %rax, %rax                                    #110.16 c5
        jbe       ..B1.81       # Prob 10%                      #110.16 c5
                                # LOE rax rbx r15 r12d k1
..B1.77:                        # Preds ..B1.76                 # Infreq Latency 9
        xorl      %r14d, %r14d                                  #110.3 c1
        vprefetch0 (%rbx)                                       #111.19 c1
        movq      %rbx, %r13                                    # c5
        movq      %r15, 8(%rsp)                                 # c5
..___tag_value_main.31:                                         #
        movq      %rax, %r15                                    # c9
                                # LOE rbx r13 r15 r12d r14d k1
..B1.78:                        # Preds ..B1.79 ..B1.77         # Infreq Latency 9
        vcvtps2pd (%r13){1to8}, %zmm0{%k1}                      #111.4 c1
        movl      $.L_2__STRING.4, %edi                         #111.4 c1
        movl      $1, %eax                                      #111.4 c5
..___tag_value_main.32:                                         #111.4
        call      printf                                        #111.4
..___tag_value_main.33:                                         #
                                # LOE rbx r13 r15 r12d r14d
..B1.79:                        # Preds ..B1.78                 # Infreq Latency 13
        movl      $1, %eax                                      # c1
        vprefetch1 116(%r13)                                    #111.19 c1
        incl      %r14d                                         #110.3 c5
        vprefetch0 8(%r13)                                      #111.19 c5
        movl      %r14d, %r14d                                  #110.3 c9
        addq      $4, %r13                                      #110.3 c9
        kmov      %eax, %k1                                     # c9
        cmpq      %r15, %r14                                    #110.3 c13
        jb        ..B1.78       # Prob 82%                      #110.3 c13
                                # LOE rbx r13 r15 r12d r14d k1
..B1.80:                        # Preds ..B1.79                 # Infreq Latency 1
        movq      8(%rsp), %r15                                 # c1
..___tag_value_main.34:                                         #
                                # LOE rbx r15 r12d k1
..B1.81:                        # Preds ..B1.76 ..B1.80         # Infreq Latency 5
        movl      $10, %edi                                     #113.3 c1
        call      putchar                                       #113.3 c5
                                # LOE rbx r15 r12d
..B1.110:                       # Preds ..B1.81                 # Infreq Latency 6
        movl      $1, %eax                                      # c1
        kmov      %eax, %k1                                     # c5
        jmp       ..B1.70       # Prob 100%                     # c5
                                # LOE rbx r15 r12d k1
..B1.82:                        # Preds ..B1.57                 # Infreq Latency 5
        movl      $il0_peep_printf_format_0, %edi               #104.2 c1
        call      puts                                          #104.2 c5
                                # LOE rbx r12 r13 r15 r14d
..B1.83:                        # Preds ..B1.82                 # Infreq Latency 9
        movl      $1, %eax                                      # c1
        xorl      %edx, %edx                                    #104.2 c1
        kmov      %eax, %k1                                     # c5
        testl     %r14d, %r14d                                  #104.2 c5
        jle       ..B1.88       # Prob 10%                      #104.2 c9
                                # LOE rdx rbx r12 r13 r15 r14d k1
..B1.84:                        # Preds ..B1.83                 # Infreq Latency 13
        movslq    %r14d, %rax                                   #104.2 c1
        vprefetch0 8(%r13)                                      #104.2 c1
        movl      %r14d, (%rsp)                                 #104.2 c5
        movq      %rbx, %r14                                    #104.2 c5
        movq      %r15, 8(%rsp)                                 #104.2 c9
..___tag_value_main.35:                                         #
        movq      %rax, %rbx                                    #104.2 c9
        movq      %rdx, %r15                                    #104.2 c13
                                # LOE rbx r12 r13 r14 r15 k1
..B1.85:                        # Preds ..B1.86 ..B1.84         # Infreq Latency 9
        vcvtps2pd 8(%r14){1to8}, %zmm0{%k1}                     #104.2 c1
        movl      $.L_2__STRING.9, %edi                         #104.2 c1
        movl      $1, %eax                                      #104.2 c5
..___tag_value_main.36:                                         #104.2
        call      printf                                        #104.2
..___tag_value_main.37:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.86:                        # Preds ..B1.85                 # Infreq Latency 17
        incq      %r15                                          #104.2 c1
        vprefetch0 32(%r14)                                     #104.2 c1
        movl      $1, %eax                                      # c5
        vprefetch1 356(%r14)                                    #104.2 c9
        addq      $12, %r14                                     #104.2 c13
        kmov      %eax, %k1                                     # c13
        cmpq      %rbx, %r15                                    #104.2 c17
        jb        ..B1.85       # Prob 82%                      #104.2 c17
                                # LOE rbx r12 r13 r14 r15 k1
..B1.87:                        # Preds ..B1.86                 # Infreq Latency 1
        movl      (%rsp), %r14d                                 # c1
        movq      8(%rsp), %r15                                 # c1
..___tag_value_main.38:                                         #
                                # LOE r12 r13 r15 r14d k1
..B1.88:                        # Preds ..B1.83 ..B1.87         # Infreq Latency 5
        movl      $10, %edi                                     #104.2 c1
        call      putchar                                       #104.2 c5
                                # LOE r12 r13 r15 r14d
..B1.109:                       # Preds ..B1.88                 # Infreq Latency 6
        movl      $1, %eax                                      # c1
        kmov      %eax, %k1                                     # c5
        jmp       ..B1.58       # Prob 100%                     # c5
                                # LOE r12 r13 r15 r14d k1
..B1.89:                        # Preds ..B1.28                 # Infreq Latency 10
        movl      $.L_2__STRING.3, %edi                         #101.3 c1
        movq      %rbx, %rsi                                    #101.3 c1
        xorl      %eax, %eax                                    #101.3 c5
..___tag_value_main.39:                                         #101.3
        call      printf                                        #101.3
..___tag_value_main.40:                                         #
        jmp       ..B1.29       # Prob 100%                     #101.3 c9
                                # LOE r15
..B1.90:                        # Preds ..B1.24                 # Infreq Latency 14
        shll      $8, %r8d                                      #96.3 c1
        movzbl    %dil, %edi                                    #96.3 c1
        orl       %r8d, %edi                                    #96.3 c5
        kmov      %edi, %k5                                     #96.3 c9
        vmovaps   %zmm4, (%rax){%k5}                            #96.3 c13
        jmp       ..B1.26       # Prob 100%                     #96.3 c13
                                # LOE rax rdx rbx r15 ecx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8 k1 k2 k3 k4
..B1.91:                        # Preds ..B1.97                 # Infreq Latency 9
        movq      (%rbx), %rsi                                  #77.3 c1
        movl      $.L_2__STRING.0, %edi                         #77.3 c1
        xorl      %eax, %eax                                    #77.3 c5
..___tag_value_main.41:                                         #77.3
        call      printf                                        #77.3
..___tag_value_main.42:                                         #
                                # LOE r15
..B1.92:                        # Preds ..B1.91                 # Infreq Latency 5
        movl      $il0_peep_printf_format_1, %edi               #78.3 c1
        call      puts                                          #78.3 c5
                                # LOE r15
..B1.93:                        # Preds ..B1.92                 # Infreq Latency 5
        movl      $il0_peep_printf_format_2, %edi               #79.3 c1
        call      puts                                          #79.3 c5
                                # LOE r15
..B1.94:                        # Preds ..B1.93                 # Infreq Latency 21
        xorl      %eax, %eax                                    #80.10 c1
        addq      $96, %rsp                                     #80.10 c1
..___tag_value_main.43:                                         #80.10
        popq      %rbx                                          #80.10
..___tag_value_main.44:                                         #80.10
        popq      %r14                                          #80.10
..___tag_value_main.45:                                         #80.10
        popq      %r13                                          #80.10
..___tag_value_main.46:                                         #80.10
        popq      %r12                                          #80.10
        movq      %rbp, %rsp                                    #80.10 c21
        popq      %rbp                                          #80.10
..___tag_value_main.47:                                         #
        ret                                                     #80.10
..___tag_value_main.49:                                         #
                                # LOE
..B1.108:                       # Preds ..B1.45                 # Infreq Latency 6
        movl      $1, %eax                                      #104.2 c1
        kmov      %eax, %k1                                     #104.2 c5
        jmp       ..B1.57       # Prob 100%                     #104.2 c5
        .align    16,0x90
..___tag_value_main.55:                                         #
                                # LOE rbx r12 r13 r15 r14d k1
# mark_end;
	.type	main,@function
	.size	main,.-main
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	1701734764
	.long	1867739745
	.long	1769239916
	.word	28271
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
il0_peep_printf_format_2:
	.long	1853187594
	.long	540876899
	.long	1044193328
	.long	824725280
	.long	1969621545
	.long	1025532782
	.long	1025519904
	.long	676274238
	.long	170471473
	.long	1668183398
	.long	840973600
	.long	540949792
	.long	808527951
	.word	10544
	.byte	0
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
il0_peep_printf_format_1:
	.long	1953719668
	.long	807419168
	.long	540949792
	.long	1634563432
	.long	1701978222
	.long	1650549857
	.long	1946838380
	.long	544502629
	.long	540090429
	.long	1713389117
	.long	1881174639
	.long	1953787756
	.long	543649385
	.long	1769104243
	.long	1946842224
	.long	544502629
	.long	540155965
	.long	1981824573
	.long	1718186597
	.long	1868767353
	.long	1667592818
	.long	1936027252
	.long	1702103667
	.long	1025537139
	.long	1025520416
	.long	1852776510
	.long	1864399212
	.long	1970304117
	.word	116
	.data
# -- End  main
	.text
# -- Begin  f
	.text
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl f
f:
# parameter 1: %zmm0
# parameter 2: %zmm1
# parameter 3: %edi
..B2.1:                         # Preds ..B2.0 Latency 21
..___tag_value_f.56:                                            #48.33
        movl      $1, %eax                                      #51.14 c1
        vmovaps   %zmm0, %zmm4                                  #48.33 c5
        kmov      %eax, %k1                                     #51.14 c5
        vmovaps   %zmm1, %zmm5                                  #48.33 c9
        testl     %edi, %edi                                    #52.12 c9
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm3         #50.13 c13
        vmulps    .L_2il0floatpacket.10(%rip){1to16}, %zmm4, %zmm2{%k1} #51.14 c17
        jle       ..B2.11       # Prob 50%                      #52.12 c21
                                # LOE rbx rbp r12 r13 r14 r15 edi zmm2 zmm3 zmm4 zmm5 k1
..B2.2:                         # Preds ..B2.1 Latency 5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm1          #51.10 c1
        cmpl      $32, %edi                                     #52.2 c5
        jl        ..B2.12       # Prob 10%                      #52.2 c5
                                # LOE rbx rbp r12 r13 r14 r15 edi zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B2.3:                         # Preds ..B2.2 Latency 9
        movl      %edi, %edx                                    #52.2 c1
        xorl      %ecx, %ecx                                    #52.2 c1
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm0             #50.13 c5
        andl      $-32, %edx                                    #52.2 c9
        xorl      %eax, %eax                                    #52.2 c9
                                # LOE rbx rbp r12 r13 r14 r15 eax edx ecx edi zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B2.4:                         # Preds ..B2.4 ..B2.3 Latency 9
        vmulps    %zmm0, %zmm1, %zmm1                           #53.3 c1
        addl      $32, %ecx                                     #52.2 c1
        vmulps    %zmm1, %zmm0, %zmm1                           #53.3 c5
        cmpl      %edx, %ecx                                    #52.2 c5
        jb        ..B2.4        # Prob 82%                      #52.2 c9
                                # LOE rbx rbp r12 r13 r14 r15 eax edx ecx edi zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B2.6:                         # Preds ..B2.4 ..B2.12 Latency 5
        lea       1(%rdx), %ecx                                 #52.2 c1
        cmpl      %ecx, %edi                                    #52.2 c5
        jb        ..B2.10       # Prob 50%                      #52.2 c5
                                # LOE rbx rbp r12 r13 r14 r15 eax edx edi zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B2.7:                         # Preds ..B2.6 Latency 17
        subl      %edx, %edi                                    #52.2 c1
        movl      %edi, -8(%rsp)                                #52.2 c5
        vmovaps   .L_2il0floatpacket.4(%rip), %zmm7             #52.2 c9
        vmovdqa32 .L_2il0floatpacket.12(%rip), %zmm6            #52.2 c13
        vpbroadcastd -8(%rsp), %zmm0                            #52.2 c17
                                # LOE rbx rbp r12 r13 r14 r15 eax edi zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B2.8:                         # Preds ..B2.8 ..B2.7 Latency 9
        vpcmpd    $2, %zmm0, %zmm6, %k2                         #52.2 c1
        addl      $16, %eax                                     #52.2 c1
        vmulps    %zmm3, %zmm1, %zmm1{%k2}                      #53.3 c5
        cmpl      %edi, %eax                                    #52.2 c5
        vpaddd    %zmm7, %zmm6, %zmm6                           #52.2 c9
        jb        ..B2.8        # Prob 82%                      #52.2 c9
                                # LOE rbx rbp r12 r13 r14 r15 eax edi zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B2.10:                        # Preds ..B2.8 ..B2.6 Latency 37
        vpermf32x4 $238, %zmm1, %zmm0                           #51.10 c1
        vmulps    %zmm1, %zmm0, %zmm3                           #51.10 c5
        nop                                                     #51.10 c9
        vpermf32x4 $85, %zmm3, %zmm1                            #51.10 c13
        vmulps    %zmm3, %zmm1, %zmm6                           #51.10 c17
        nop                                                     #51.10 c21
        vmulps    %zmm6{badc}, %zmm6, %zmm7                     #51.10 c25
        nop                                                     #51.10 c29
        vmulps    %zmm7{cdab}, %zmm7, %zmm8                     #51.10 c33
        vmulps    %zmm2, %zmm8, %zmm2{%k1}                      #51.10 c37
                                # LOE rbx rbp r12 r13 r14 r15 zmm2 zmm4 zmm5 k1
..B2.11:                        # Preds ..B2.10 ..B2.1 Latency 9
        vaddps    %zmm5, %zmm4, %zmm0{%k1}                      #65.11 c1
        vaddps    %zmm2, %zmm0, %zmm0{%k1}                      #65.13 c5
        ret                                                     #65.13 c9
                                # LOE
..B2.12:                        # Preds ..B2.2                  # Infreq Latency 2
        xorl      %edx, %edx                                    #52.2 c1
        xorl      %eax, %eax                                    #52.2 c1
        jmp       ..B2.6        # Prob 100%                     #52.2 c1
        .align    16,0x90
..___tag_value_f.58:                                            #
                                # LOE rbx rbp r12 r13 r14 r15 eax edx edi zmm1 zmm2 zmm3 zmm4 zmm5 k1
# mark_end;
	.type	f,@function
	.size	f,.-f
	.data
# -- End  f
	.text
# -- Begin  linearSolution
	.text
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl linearSolution
linearSolution:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0 Latency 21
..___tag_value_linearSolution.59:                               #143.36
        pushq     %rbp                                          #143.36
..___tag_value_linearSolution.61:                               #
        movq      %rsp, %rbp                                    #143.36
..___tag_value_linearSolution.62:                               #
        andq      $-64, %rsp                                    #143.36
        pushq     %r14                                          #143.36 c1
        pushq     %r15                                          #143.36 c5
        subq      $48, %rsp                                     #143.36 c5
..___tag_value_linearSolution.64:                               #
        movl      num_of_threads(%rip), %r14d                   #145.13 c9
        movq      %rdi, %r15                                    #143.36 c9
        movslq    %r14d, %r14                                   #145.2 c13
        xorl      %esi, %esi                                    #145.2 c13
        xorl      %ecx, %ecx                                    # c17
        cmpq      $1, %r14                                      #145.13 c17
        jle       ..B3.13       # Prob 9%                       #145.13 c21
                                # LOE rcx rbx rsi r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1 Latency 29
        movl      $1, %eax                                      #149.15 c1
        vprefetch0 8(%r15)                                      #147.26 c1
        kmov      %eax, %k1                                     #149.15 c5
        movl      typeFunc(%rip), %edx                          #146.6 c5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4{%k1}     #149.15 c9
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm3          #149.15 c13
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm2             #151.15 c17
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm1{%k1}    #149.15 c21
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0         #149.15 c25
        lea       -1(%r14), %rax                                #145.13 c29
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.3:                         # Preds ..B3.11 ..B3.2 Latency 1
        testl     %edx, %edx                                    #146.6 c1
        je        ..B3.10       # Prob 25%                      #146.6 c1
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.4:                         # Preds ..B3.3 Latency 1
        cmpl      $1, %edx                                      #146.6 c1
        jne       ..B3.6        # Prob 66%                      #146.6 c1
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.5:                         # Preds ..B3.4 Latency 66
        vmovaps   %zmm3, %zmm6                                  #149.15 c1
        movl      $1023, %edi                                   #149.15 c1
        vbroadcastss 20(%rcx,%r15), %zmm12{%k1}                 #149.17 c5
        kmov      %edi, %k2                                     #149.15 c5
        vmulps    %zmm0, %zmm3, %zmm6{%k2}                      #149.15 c9
        nop                                                     #149.15 c13
        vpermf32x4 $238, %zmm6, %zmm5                           #149.15 c17
        vmulps    %zmm6, %zmm5, %zmm8                           #149.15 c21
        nop                                                     #149.15 c25
        vpermf32x4 $85, %zmm8, %zmm7                            #149.15 c29
        vmulps    %zmm8, %zmm7, %zmm9                           #149.15 c33
        nop                                                     #149.15 c37
        vmulps    %zmm9{badc}, %zmm9, %zmm10                    #149.15 c41
        nop                                                     #149.15 c45
        vmulps    %zmm10{cdab}, %zmm10, %zmm11                  #149.15 c49
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm1, %zmm11{%k1} #149.4 c53
        vfmadd213ps 8(%rcx,%r15){1to16}, %zmm12, %zmm11{%k1}    #149.4 c57
        nop                                                     #149.4 c61
        vpackstorelps %zmm11, 20(%rcx,%r15){%k1}                #149.4 c65
        jmp       ..B3.11       # Prob 100%                     #149.4 c65
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.6:                         # Preds ..B3.4 Latency 1
        cmpl      $2, %edx                                      #146.6 c1
        jne       ..B3.11       # Prob 50%                      #146.6 c1
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.7:                         # Preds ..B3.6 Latency 13
        vpshufd   $0, %zmm4, %zmm5                              #151.15 c1
        xorb      %dil, %dil                                    #151.15 c1
        vbroadcastss 20(%rcx,%r15), %zmm7{%k1}                  #151.17 c5
        vbroadcastss 8(%rcx,%r15), %zmm6{%k1}                   #151.26 c9
        vpermf32x4 $0, %zmm5, %zmm5                             #151.15 c13
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx dil zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B3.8:                         # Preds ..B3.8 ..B3.7 Latency 9
        vmulps    %zmm2, %zmm5, %zmm5                           #151.15 c1
        addb      $32, %dil                                     #151.15 c1
        vmulps    %zmm5, %zmm2, %zmm5                           #151.15 c5
        cmpb      $96, %dil                                     #151.15 c5
        jb        ..B3.8        # Prob 82%                      #151.15 c9
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx dil zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B3.9:                         # Preds ..B3.8 Latency 58
        vpermf32x4 $238, %zmm5, %zmm8                           #151.15 c1
        vmulps    %zmm5, %zmm8, %zmm9                           #151.15 c5
        vmulps    %zmm1, %zmm1, %zmm14{%k1}                     #151.4 c9
        vpermf32x4 $85, %zmm9, %zmm5                            #151.15 c13
        vmulps    %zmm9, %zmm5, %zmm10                          #151.15 c17
        nop                                                     #151.15 c21
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #151.15 c25
        nop                                                     #151.15 c29
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #151.15 c33
        vmulps    %zmm12, %zmm1, %zmm13{%k1}                    #151.4 c37
        vmulps    %zmm13, %zmm14, %zmm15{%k1}                   #151.4 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm14, %zmm15{%k1} #151.4 c45
        vfmadd213ps %zmm6, %zmm7, %zmm15{%k1}                   #151.4 c49
        nop                                                     #151.4 c53
        vpackstorelps %zmm15, 20(%rcx,%r15){%k1}                #151.4 c57
        jmp       ..B3.11       # Prob 100%                     #151.4 c57
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.10:                        # Preds ..B3.3 Latency 13
        vbroadcastss 20(%rcx,%r15), %zmm5{%k1}                  #147.15 c1
        vaddps    8(%rcx,%r15){1to16}, %zmm5, %zmm6{%k1}        #147.26 c5
        nop                                                     #147.4 c9
        vpackstorelps %zmm6, 20(%rcx,%r15){%k1}                 #147.4 c13
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.11:                        # Preds ..B3.6 ..B3.10 ..B3.5 ..B3.9 Latency 13
        incq      %rsi                                          #145.2 c1
        vprefetche1 68(%rcx,%r15)                               #147.26 c1
        vprefetch0 32(%rcx,%r15)                                #147.26 c5
        addq      $12, %rcx                                     #145.2 c9
        cmpq      %rax, %rsi                                    #145.2 c13
        jb        ..B3.3        # Prob 82%                      #145.2 c13
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 edx zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B3.13:                        # Preds ..B3.11 ..B3.1 Latency 5
        cmpl      $2, test(%rip)                                #153.11 c1
        je        ..B3.15       # Prob 5%                       #153.11 c5
                                # LOE rbx r12 r13 r14 r15
..B3.14:                        # Preds ..B3.13 Latency 13
        addq      $48, %rsp                                     #160.2 c1
..___tag_value_linearSolution.66:                               #160.2
        popq      %r15                                          #160.2
..___tag_value_linearSolution.67:                               #160.2
        popq      %r14                                          #160.2
        movq      %rbp, %rsp                                    #160.2 c13
        popq      %rbp                                          #160.2
..___tag_value_linearSolution.68:                               #
        ret                                                     #160.2
..___tag_value_linearSolution.70:                               #
                                # LOE
..B3.15:                        # Preds ..B3.13                 # Infreq Latency 5
        movl      $il0_peep_printf_format_3, %edi               #154.3 c1
        call      puts                                          #154.3 c5
                                # LOE rbx r12 r13 r14 r15
..B3.16:                        # Preds ..B3.15                 # Infreq Latency 5
        xorl      %eax, %eax                                    #155.3 c1
        testq     %r14, %r14                                    #155.14 c1
        jle       ..B3.21       # Prob 9%                       #155.14 c5
                                # LOE rax rbx r12 r13 r14 r15
..B3.17:                        # Preds ..B3.16                 # Infreq Latency 5
        vprefetch0 8(%r15)                                      #156.17 c1
        movl      $1, %edx                                      #156.17 c1
        movq      %r12, (%rsp)                                  #156.17 c5
..___tag_value_linearSolution.74:                               #
        movq      %rax, %r12                                    #156.17 c5
                                # LOE rbx r12 r13 r14 r15
..B3.18:                        # Preds ..B3.19 ..B3.17         # Infreq Latency 13
        movl      $1, %eax                                      #156.4 c1
        movl      $.L_2__STRING.9, %edi                         #156.4 c1
        kmov      %eax, %k1                                     #156.4 c5
        vcvtps2pd 8(%r15){1to8}, %zmm0{%k1}                     #156.4 c9
..___tag_value_linearSolution.75:                               #156.4
        call      printf                                        #156.4
..___tag_value_linearSolution.76:                               #
                                # LOE rbx r12 r13 r14 r15
..B3.19:                        # Preds ..B3.18                 # Infreq Latency 13
        incq      %r12                                          #155.3 c1
        vprefetch0 32(%r15)                                     #156.17 c1
        vprefetch1 356(%r15)                                    #156.17 c5
        addq      $12, %r15                                     #155.3 c9
        cmpq      %r14, %r12                                    #155.3 c13
        jb        ..B3.18       # Prob 82%                      #155.3 c13
                                # LOE rbx r12 r13 r14 r15
..B3.20:                        # Preds ..B3.19                 # Infreq Latency 1
        movq      (%rsp), %r12                                  # c1
..___tag_value_linearSolution.77:                               #
                                # LOE rbx r12 r13
..B3.21:                        # Preds ..B3.16 ..B3.20         # Infreq Latency 9
        movl      $10, %edi                                     #158.3 c1
        addq      $48, %rsp                                     #158.3 c1
..___tag_value_linearSolution.78:                               #158.3
        popq      %r15                                          #158.3
..___tag_value_linearSolution.79:                               #158.3
        popq      %r14                                          #158.3
        movq      %rbp, %rsp                                    #158.3 c9
        popq      %rbp                                          #158.3
..___tag_value_linearSolution.80:                               #
        jmp       putchar                                       #158.3
        .align    16,0x90
..___tag_value_linearSolution.82:                               #
                                # LOE
# mark_end;
	.type	linearSolution,@function
	.size	linearSolution,.-linearSolution
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 1, 0x00 	# pad
	.align 4
il0_peep_printf_format_3:
	.long	1701734764
	.long	1867739745
	.long	1769239916
	.word	28271
	.byte	0
	.data
# -- End  linearSolution
	.text
# -- Begin  prefix_sum
	.text
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl prefix_sum
prefix_sum:
..B4.1:                         # Preds ..B4.0 Latency 33
..___tag_value_prefix_sum.83:                                   #165.18
        pushq     %rbp                                          #165.18
..___tag_value_prefix_sum.85:                                   #
        movq      %rsp, %rbp                                    #165.18
..___tag_value_prefix_sum.86:                                   #
        andq      $-64, %rsp                                    #165.18
        pushq     %r12                                          #165.18 c1
        pushq     %r13                                          #165.18 c5
        pushq     %r15                                          #165.18 c9
        pushq     %rbx                                          #165.18 c13
        subq      $32, %rsp                                     #165.18 c13
..___tag_value_prefix_sum.88:                                   #
        movl      num_of_threads(%rip), %r15d                   #170.22 c17
        movslq    %r15d, %rbx                                   #170.22 c21
        lea       (,%rbx,8), %rdx                               #170.15 c25
        lea       (%rdx,%rbx,4), %rdi                           #170.15 c29
        call      malloc                                        #170.15 c33
                                # LOE rax rbx r14 r15d
..B4.49:                        # Preds ..B4.1 Latency 1
        movq      %rax, %r13                                    #170.15 c1
                                # LOE rbx r13 r14 r15d
..B4.2:                         # Preds ..B4.49 Latency 9
        shlq      $3, %rbx                                      #171.12 c1
        movq      %rbx, %rdi                                    #171.12 c5
        call      malloc                                        #171.12 c9
                                # LOE rax r13 r14 r15d
..B4.50:                        # Preds ..B4.2 Latency 1
        movq      %rax, %r12                                    #171.12 c1
                                # LOE r12 r13 r14 r15d
..B4.3:                         # Preds ..B4.50 Latency 9
        movq      %r13, %rcx                                    # c1
        xorl      %edx, %edx                                    #173.6 c1
        xorl      %eax, %eax                                    # c5
        movq      %rcx, %rbx                                    # c5
        testl     %r15d, %r15d                                  #173.14 c9
        jle       ..B4.8        # Prob 15%                      #173.14 c9
                                # LOE rax rcx rbx r12 r13 r14 edx r15d
..B4.4:                         # Preds ..B4.3 Latency 9
        movq      %r13, (%rsp)                                  # c1
        movl      %edx, %r13d                                   # c1
        movq      %r14, 8(%rsp)                                 # c5
..___tag_value_prefix_sum.92:                                   #
        movq      %rax, %r14                                    # c5
        movq      %rcx, %r15                                    # c9
                                # LOE rbx r12 r14 r15 r13d
..B4.5:                         # Preds ..B4.6 ..B4.4 Latency 17
        lea       (%r12,%r14), %rdi                             #176.3 c1
        xorl      %esi, %esi                                    #176.3 c1
        movl      $worker, %edx                                 #176.3 c5
        movq      %r15, %rcx                                    #176.3 c5
        movl      %r13d, (%r15)                                 #174.3 c9
        movl      $0, 4(%r15)                                   #175.3 c13
        call      pthread_create                                #176.3 c17
                                # LOE rbx r12 r14 r15 r13d
..B4.6:                         # Preds ..B4.5 Latency 13
        incl      %r13d                                         #173.29 c1
        addq      $8, %r14                                      #173.29 c1
        addq      $12, %r15                                     #173.29 c5
        movl      num_of_threads(%rip), %eax                    #173.14 c5
        cmpl      num_of_threads(%rip), %r13d                   #173.14 c9
        jl        ..B4.5        # Prob 82%                      #173.14 c13
                                # LOE rbx r12 r14 r15 eax r13d
..B4.7:                         # Preds ..B4.6 Latency 5
        movl      %eax, %r15d                                   # c1
        movq      (%rsp), %r13                                  # c1
        movq      8(%rsp), %r14                                 # c5
..___tag_value_prefix_sum.93:                                   #
                                # LOE rbx r12 r13 r14 r15d
..B4.8:                         # Preds ..B4.7 ..B4.3 Latency 5
        xorl      %esi, %esi                                    #180.6 c1
        xorl      %ecx, %ecx                                    # c1
        testl     %r15d, %r15d                                  #180.14 c5
        jle       ..B4.16       # Prob 10%                      #180.14 c5
                                # LOE rcx rbx rsi r12 r13 r14 r15d
..B4.9:                         # Preds ..B4.8 Latency 1
        movslq    %r15d, %rdx                                   #180.2 c1
                                # LOE rdx rcx rbx rsi r12 r13 r14 r15d
..B4.10:                        # Preds ..B4.10 ..B4.14 ..B4.9 Latency 5
        movl      4(%rcx,%r13), %r8d                            #181.9 c1
        testl     %r8d, %r8d                                    #181.32 c5
        je        ..B4.10       # Prob 90%                      #181.32 c5
                                # LOE rdx rcx rbx rsi r12 r13 r14 r15d
..B4.14:                        # Preds ..B4.10 Latency 5
        incq      %rsi                                          #180.29 c1
        addq      $12, %rcx                                     #180.29 c1
        cmpq      %rdx, %rsi                                    #180.14 c5
        jl        ..B4.10       # Prob 82%                      #180.14 c5
                                # LOE rdx rcx rbx rsi r12 r13 r14 r15d
..B4.16:                        # Preds ..B4.14 ..B4.8 Latency 5
        xorl      %r8d, %r8d                                    #184.2 c1
        xorl      %esi, %esi                                    # c1
        cmpl      $1, %r15d                                     #184.2 c5
        jle       ..B4.28       # Prob 9%                       #184.2 c5
                                # LOE rbx rsi r8 r12 r13 r14 r15d
..B4.17:                        # Preds ..B4.16 Latency 29
        movl      $1, %eax                                      #184.2 c1
        vprefetch0 8(%r13)                                      #184.2 c1
        movslq    %r15d, %rdx                                   #184.2 c5
        kmov      %eax, %k1                                     #184.2 c5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4{%k1}     #184.2 c9
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm3          #184.2 c13
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm2             #184.2 c17
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm1{%k1}    #184.2 c21
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0         #184.2 c25
        movl      typeFunc(%rip), %ecx                          #184.2 c29
        decq      %rdx                                          #180.14 c29
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.18:                        # Preds ..B4.26 ..B4.17 Latency 1
        testl     %ecx, %ecx                                    #184.2 c1
        je        ..B4.25       # Prob 25%                      #184.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.19:                        # Preds ..B4.18 Latency 1
        cmpl      $1, %ecx                                      #184.2 c1
        jne       ..B4.21       # Prob 66%                      #184.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.20:                        # Preds ..B4.19 Latency 66
        vmovaps   %zmm3, %zmm6                                  #184.2 c1
        movl      $1023, %eax                                   #184.2 c1
        vbroadcastss 20(%rsi,%r13), %zmm12{%k1}                 #184.2 c5
        kmov      %eax, %k2                                     #184.2 c5
        vmulps    %zmm0, %zmm3, %zmm6{%k2}                      #184.2 c9
        nop                                                     #184.2 c13
        vpermf32x4 $238, %zmm6, %zmm5                           #184.2 c17
        vmulps    %zmm6, %zmm5, %zmm8                           #184.2 c21
        nop                                                     #184.2 c25
        vpermf32x4 $85, %zmm8, %zmm7                            #184.2 c29
        vmulps    %zmm8, %zmm7, %zmm9                           #184.2 c33
        nop                                                     #184.2 c37
        vmulps    %zmm9{badc}, %zmm9, %zmm10                    #184.2 c41
        nop                                                     #184.2 c45
        vmulps    %zmm10{cdab}, %zmm10, %zmm11                  #184.2 c49
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm1, %zmm11{%k1} #184.2 c53
        vfmadd213ps 8(%rsi,%r13){1to16}, %zmm12, %zmm11{%k1}    #184.2 c57
        nop                                                     #184.2 c61
        vpackstorelps %zmm11, 20(%rsi,%r13){%k1}                #184.2 c65
        jmp       ..B4.26       # Prob 100%                     #184.2 c65
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.21:                        # Preds ..B4.19 Latency 1
        cmpl      $2, %ecx                                      #184.2 c1
        jne       ..B4.26       # Prob 50%                      #184.2 c1
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.22:                        # Preds ..B4.21 Latency 13
        vpshufd   $0, %zmm4, %zmm5                              #184.2 c1
        xorb      %r9b, %r9b                                    #184.2 c1
        vbroadcastss 20(%rsi,%r13), %zmm7{%k1}                  #184.2 c5
        vbroadcastss 8(%rsi,%r13), %zmm6{%k1}                   #184.2 c9
        vpermf32x4 $0, %zmm5, %zmm5                             #184.2 c13
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d r9b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B4.23:                        # Preds ..B4.23 ..B4.22 Latency 9
        vmulps    %zmm2, %zmm5, %zmm5                           #184.2 c1
        addb      $32, %r9b                                     #184.2 c1
        vmulps    %zmm5, %zmm2, %zmm5                           #184.2 c5
        cmpb      $96, %r9b                                     #184.2 c5
        jb        ..B4.23       # Prob 82%                      #184.2 c9
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d r9b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B4.24:                        # Preds ..B4.23 Latency 58
        vpermf32x4 $238, %zmm5, %zmm8                           #184.2 c1
        vmulps    %zmm5, %zmm8, %zmm9                           #184.2 c5
        vmulps    %zmm1, %zmm1, %zmm14{%k1}                     #184.2 c9
        vpermf32x4 $85, %zmm9, %zmm5                            #184.2 c13
        vmulps    %zmm9, %zmm5, %zmm10                          #184.2 c17
        nop                                                     #184.2 c21
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #184.2 c25
        nop                                                     #184.2 c29
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #184.2 c33
        vmulps    %zmm12, %zmm1, %zmm13{%k1}                    #184.2 c37
        vmulps    %zmm13, %zmm14, %zmm15{%k1}                   #184.2 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm14, %zmm15{%k1} #184.2 c45
        vfmadd213ps %zmm6, %zmm7, %zmm15{%k1}                   #184.2 c49
        nop                                                     #184.2 c53
        vpackstorelps %zmm15, 20(%rsi,%r13){%k1}                #184.2 c57
        jmp       ..B4.26       # Prob 100%                     #184.2 c57
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.25:                        # Preds ..B4.18 Latency 13
        vbroadcastss 20(%rsi,%r13), %zmm5{%k1}                  #184.2 c1
        vaddps    8(%rsi,%r13){1to16}, %zmm5, %zmm6{%k1}        #184.2 c5
        nop                                                     #184.2 c9
        vpackstorelps %zmm6, 20(%rsi,%r13){%k1}                 #184.2 c13
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.26:                        # Preds ..B4.21 ..B4.25 ..B4.20 ..B4.24 Latency 9
        incq      %r8                                           #184.2 c1
        vprefetche1 68(%rsi,%r13)                               #184.2 c1
        vprefetch0 32(%rsi,%r13)                                #184.2 c5
        addq      $12, %rsi                                     #184.2 c5
        cmpq      %rdx, %r8                                     #184.2 c9
        jb        ..B4.18       # Prob 82%                      #184.2 c9
                                # LOE rdx rbx rsi r8 r12 r13 r14 ecx r15d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B4.28:                        # Preds ..B4.26 ..B4.16 Latency 5
        cmpl      $2, test(%rip)                                #184.2 c1
        je        ..B4.40       # Prob 5%                       #184.2 c5
                                # LOE rbx r12 r13 r14 r15d
..B4.29:                        # Preds ..B4.46 ..B4.28 Latency 5
        xorl      %ecx, %ecx                                    #186.6 c1
        xorl      %edx, %edx                                    # c1
        testl     %r15d, %r15d                                  #186.14 c5
        jle       ..B4.37       # Prob 15%                      #186.14 c5
                                # LOE rdx rcx r12 r13 r14
..B4.31:                        # Preds ..B4.29 ..B4.31 Latency 17
        movl      $2, 4(%rdx,%r13)                              #187.3 c1
        incq      %rcx                                          #186.29 c5
        addq      $12, %rdx                                     #186.29 c5
        movl      num_of_threads(%rip), %eax                    #186.14 c9
        movslq    %eax, %rax                                    #186.2 c13
        cmpq      %rax, %rcx                                    #186.14 c17
        jl        ..B4.31       # Prob 82%                      #186.14 c17
                                # LOE rdx rcx r12 r13 r14 eax
..B4.32:                        # Preds ..B4.31 Latency 1
        testl     %eax, %eax                                    #190.15 c1
        jle       ..B4.37       # Prob 10%                      #190.15 c1
                                # LOE r12 r13 r14
..B4.33:                        # Preds ..B4.32 Latency 1
        xorl      %ebx, %ebx                                    #190.2 c1
        vprefetch0 (%r12)                                       #192.16 c1
                                # LOE rbx r12 r13 r14
..B4.34:                        # Preds ..B4.35 ..B4.33 Latency 37
        incq      %rbx                                          #190.2 c1
        xorl      %esi, %esi                                    #192.3 c1
        vprefetch1 248(%r12,%rbx,8)                             #192.16 c5
        vprefetch0 8(%r12,%rbx,8)                               #192.16 c9
        movq      -8(%r12,%rbx,8), %rdi                         #192.3 c19
..___tag_value_prefix_sum.94:                                   #192.3
        call      pthread_join                                  #192.3
..___tag_value_prefix_sum.95:                                   #
                                # LOE rbx r12 r13 r14
..B4.35:                        # Preds ..B4.34 Latency 9
        movl      num_of_threads(%rip), %eax                    #190.15 c1
        movslq    %eax, %rax                                    #190.2 c5
        cmpq      %rax, %rbx                                    #190.15 c9
        jl        ..B4.34       # Prob 82%                      #190.15 c9
                                # LOE rbx r12 r13 r14
..B4.37:                        # Preds ..B4.35 ..B4.32 ..B4.29 Latency 5
        movq      %r13, %rdi                                    #196.2 c1
        call      free                                          #196.2 c5
                                # LOE r12 r14
..B4.38:                        # Preds ..B4.37 Latency 17
        movq      %r12, %rdi                                    #197.2 c1
        addq      $32, %rsp                                     #197.2 c1
..___tag_value_prefix_sum.96:                                   #197.2
        popq      %rbx                                          #197.2
..___tag_value_prefix_sum.97:                                   #197.2
        popq      %r15                                          #197.2
..___tag_value_prefix_sum.98:                                   #197.2
        popq      %r13                                          #197.2
..___tag_value_prefix_sum.99:                                   #197.2
        popq      %r12                                          #197.2
        movq      %rbp, %rsp                                    #197.2 c17
        popq      %rbp                                          #197.2
..___tag_value_prefix_sum.100:                                  #
        jmp       free                                          #197.2
..___tag_value_prefix_sum.102:                                  #
                                # LOE
..B4.40:                        # Preds ..B4.28                 # Infreq Latency 5
        movl      $il0_peep_printf_format_4, %edi               #184.2 c1
        call      puts                                          #184.2 c5
                                # LOE rbx r12 r13 r14 r15d
..B4.41:                        # Preds ..B4.40                 # Infreq Latency 5
        xorl      %edx, %edx                                    #184.2 c1
        testl     %r15d, %r15d                                  #184.2 c1
        jle       ..B4.46       # Prob 10%                      #184.2 c5
                                # LOE rdx rbx r12 r13 r14 r15d
..B4.42:                        # Preds ..B4.41                 # Infreq Latency 13
        movslq    %r15d, %rax                                   #184.2 c1
        vprefetch0 8(%r13)                                      #184.2 c1
        movl      $1, %ecx                                      #184.2 c5
        movl      %r15d, (%rsp)                                 #184.2 c5
        movq      %r14, 8(%rsp)                                 #184.2 c9
..___tag_value_prefix_sum.108:                                  #
        movq      %rbx, %r14                                    #184.2 c9
        movq      %rax, %rbx                                    #184.2 c13
        movq      %rdx, %r15                                    #184.2 c13
                                # LOE rbx r12 r13 r14 r15
..B4.43:                        # Preds ..B4.44 ..B4.42         # Infreq Latency 13
        movl      $1, %eax                                      #184.2 c1
        movl      $.L_2__STRING.9, %edi                         #184.2 c1
        kmov      %eax, %k1                                     #184.2 c5
        vcvtps2pd 8(%r14){1to8}, %zmm0{%k1}                     #184.2 c9
..___tag_value_prefix_sum.109:                                  #184.2
        call      printf                                        #184.2
..___tag_value_prefix_sum.110:                                  #
                                # LOE rbx r12 r13 r14 r15
..B4.44:                        # Preds ..B4.43                 # Infreq Latency 13
        incq      %r15                                          #184.2 c1
        vprefetch0 32(%r14)                                     #184.2 c1
        vprefetch1 356(%r14)                                    #184.2 c5
        addq      $12, %r14                                     #184.2 c9
        cmpq      %rbx, %r15                                    #184.2 c13
        jb        ..B4.43       # Prob 82%                      #184.2 c13
                                # LOE rbx r12 r13 r14 r15
..B4.45:                        # Preds ..B4.44                 # Infreq Latency 1
        movl      (%rsp), %r15d                                 # c1
        movq      8(%rsp), %r14                                 # c1
..___tag_value_prefix_sum.111:                                  #
                                # LOE r12 r13 r14 r15d
..B4.46:                        # Preds ..B4.41 ..B4.45         # Infreq Latency 6
        movl      $10, %edi                                     #184.2 c1
        call      putchar                                       #184.2 c5
        jmp       ..B4.29       # Prob 100%                     #184.2 c5
        .align    16,0x90
..___tag_value_prefix_sum.112:                                  #
                                # LOE r12 r13 r14 r15d
# mark_end;
	.type	prefix_sum,@function
	.size	prefix_sum,.-prefix_sum
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 1, 0x00 	# pad
	.align 4
il0_peep_printf_format_4:
	.long	1701734764
	.long	1867739745
	.long	1769239916
	.word	28271
	.byte	0
	.data
# -- End  prefix_sum
	.text
# -- Begin  worker
	.text
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl worker
worker:
# parameter 1: %rdi
..B5.1:                         # Preds ..B5.0 Latency 91
..___tag_value_worker.113:                                      #204.24
        pushq     %rbp                                          #204.24
..___tag_value_worker.115:                                      #
        movq      %rsp, %rbp                                    #204.24
..___tag_value_worker.116:                                      #
        andq      $-64, %rsp                                    #204.24
        pushq     %r12                                          #204.24 c1
        pushq     %r13                                          #204.24 c5
        pushq     %r14                                          #204.24 c9
        pushq     %r15                                          #204.24 c13
        pushq     %rbx                                          #204.24 c17
        subq      $216, %rsp                                    #204.24 c17
        vpxord    %zmm0, %zmm0, %zmm0                           #220.2 c21
        movl      num_of_partitions(%rip), %ecx                 #212.38 c21
        movq      dim(%rip), %rax                               #211.24 c25
        movslq    %ecx, %rcx                                    #212.38 c25
        xorl      %edx, %edx                                    #213.39 c29
..___tag_value_worker.118:                                      #
        movq      %rdi, %r14                                    #204.24 c29
        divq      %rcx                                          #213.39 c33
        movl      (%r14), %r9d                                  #207.28 c79
        movq      %rax, %r12                                    #213.39 c79
        movl      typeFunc(%rip), %r13d                         #214.19 c83
        movslq    %r9d, %r15                                    #207.28 c83
        movq      Vector(%rip), %rbx                            #215.20 c87
        vmovaps   %zmm0, 64(%rsp)                               #220.2 c87
        vmovaps   %zmm0, 128(%rsp)                              #220.2 c91
                                # LOE rbx r12 r14 r15 r9d r13d
..B5.2:                         # Preds ..B5.1 Latency 13
        lea       (,%r9,4), %ecx                                #221.2 c1
        movslq    %ecx, %rcx                                    #221.2 c5
        incq      %rcx                                          #221.2 c9
        cmpq      $1024, %rcx                                   #221.2 c13
        jae       ..B5.4        # Prob 50%                      #221.2 c13
                                # LOE rcx rbx r12 r14 r15 r9d r13d
..B5.3:                         # Preds ..B5.2 Latency 17
        movq      %rcx, %rdi                                    #221.2 c1
        movl      $1, %eax                                      #221.2 c1
        shrq      $6, %rdi                                      #221.2 c5
        shlq      %cl, %rax                                     #221.2 c9
        movq      64(%rsp,%rdi,8), %rdx                         #221.2 c9
        orq       %rax, %rdx                                    #221.2 c13
        movq      %rdx, 64(%rsp,%rdi,8)                         #221.2 c17
                                # LOE rbx r12 r14 r15 r9d r13d
..B5.4:                         # Preds ..B5.2 ..B5.3 Latency 1
        cmpq      $60, %r15                                     #222.8 c1
        jl        ..B5.65       # Prob 5%                       #222.8 c1
                                # LOE rbx r12 r14 r15 r9d r13d
..B5.5:                         # Preds ..B5.4 ..B5.75 ..B5.66 Latency 35
        lea       1(%r15), %r10                                 #229.14 c1
        movq      %r12, %rdx                                    #228.13 c1
        imulq     %r12, %r10                                    #229.17 c5
        imulq     %r15, %rdx                                    #228.13 c16
        lea       -1(%r10), %r11                                #229.36 c27
        orq       $-1, %r8                                      #237.2 c27
        cmpl      $2, test(%rip)                                #238.13 c31
        je        ..B5.64       # Prob 5%                       #238.13 c35
                                # LOE rdx rbx r8 r10 r11 r12 r14 r15 r9d r13d
..B5.6:                         # Preds ..B5.74 ..B5.5 Latency 1
        cmpq      $-1, %r11                                     #241.13 c1
        je        ..B5.72       # Prob 50%                      #241.13 c1
                                # LOE rdx rbx r8 r10 r11 r12 r14 r15 r9d r13d
..B5.7:                         # Preds ..B5.6 Latency 9
        lea       1(%rdx), %r8                                  #242.17 c1
        lea       -1(%r10), %rax                                #229.2 c1
        xorl      %edi, %edi                                    #242.3 c5
        cmpq      %rax, %r8                                     #242.25 c5
        ja        ..B5.72       # Prob 9%                       #242.25 c9
                                # LOE rdx rbx rdi r8 r10 r11 r12 r14 r15 r9d r13d
..B5.8:                         # Preds ..B5.7 Latency 51
        lea       (,%r12,4), %rax                               #245.33 c1
        movq      %r15, %r8                                     #228.13 c1
        imulq     %rax, %r8                                     #228.13 c5
        imulq     %r15, %rax                                    #228.13 c16
        movq      %r10, %rcx                                    #229.2 c27
        vprefetch0 (%r8,%rbx)                                   #245.33 c27
        movl      $1, %esi                                      #249.19 c31
        subq      %rdx, %rcx                                    #229.2 c31
        kmov      %esi, %k1                                     #249.19 c35
        decq      %rcx                                          #229.2 c35
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm2{%k1}     #249.19 c39
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm1             #249.19 c43
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0{%k1}    #247.19 c47
        addq      %rbx, %rax                                    #245.33 c51
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.9:                         # Preds ..B5.17 ..B5.8 Latency 1
        testl     %r13d, %r13d                                  #244.7 c1
        je        ..B5.16       # Prob 25%                      #244.7 c1
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.10:                        # Preds ..B5.9 Latency 1
        cmpl      $1, %r13d                                     #244.7 c1
        jne       ..B5.12       # Prob 66%                      #244.7 c1
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.11:                        # Preds ..B5.10 Latency 58
        vmulps    4(%rax,%rdi,4){1to16}, %zmm0, %zmm3{%k1}      #247.19 c1
        vmulps    %zmm0, %zmm3, %zmm4{%k1}                      #247.19 c5
        vmulps    %zmm0, %zmm4, %zmm5{%k1}                      #247.19 c9
        vmulps    %zmm0, %zmm5, %zmm6{%k1}                      #247.19 c13
        vmulps    %zmm0, %zmm6, %zmm7{%k1}                      #247.19 c17
        vmulps    %zmm0, %zmm7, %zmm8{%k1}                      #247.19 c21
        vmulps    %zmm0, %zmm8, %zmm9{%k1}                      #247.19 c25
        vmulps    %zmm0, %zmm9, %zmm10{%k1}                     #247.19 c29
        vbroadcastss 4(%rax,%rdi,4), %zmm12{%k1}                #247.21 c33
        vmulps    %zmm0, %zmm10, %zmm11{%k1}                    #247.19 c37
        vmulps    %zmm0, %zmm11, %zmm14{%k1}                    #247.19 c41
        vaddps    (%rax,%rdi,4){1to16}, %zmm12, %zmm13{%k1}     #247.19 c45
        vfmadd213ps %zmm13, %zmm0, %zmm14{%k1}                  #247.5 c49
        nop                                                     #247.5 c53
        vpackstorelps %zmm14, 4(%rax,%rdi,4){%k1}               #247.5 c57
        jmp       ..B5.17       # Prob 100%                     #247.5 c57
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.12:                        # Preds ..B5.10 Latency 1
        cmpl      $2, %r13d                                     #244.7 c1
        jne       ..B5.17       # Prob 50%                      #244.7 c1
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.13:                        # Preds ..B5.12 Latency 13
        vpshufd   $0, %zmm2, %zmm3                              #249.19 c1
        xorb      %r8b, %r8b                                    #249.19 c1
        vbroadcastss 4(%rax,%rdi,4), %zmm5{%k1}                 #249.21 c5
        vbroadcastss (%rax,%rdi,4), %zmm4{%k1}                  #249.33 c9
        vpermf32x4 $0, %zmm3, %zmm3                             #249.19 c13
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d r8b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.14:                        # Preds ..B5.14 ..B5.13 Latency 9
        vmulps    %zmm1, %zmm3, %zmm3                           #249.19 c1
        addb      $32, %r8b                                     #249.19 c1
        vmulps    %zmm3, %zmm1, %zmm3                           #249.19 c5
        cmpb      $96, %r8b                                     #249.19 c5
        jb        ..B5.14       # Prob 82%                      #249.19 c9
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d r8b zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.15:                        # Preds ..B5.14 Latency 58
        vpermf32x4 $238, %zmm3, %zmm6                           #249.19 c1
        vmulps    %zmm3, %zmm6, %zmm7                           #249.19 c5
        vmulps    %zmm0, %zmm0, %zmm12{%k1}                     #249.5 c9
        vpermf32x4 $85, %zmm7, %zmm3                            #249.19 c13
        vmulps    %zmm7, %zmm3, %zmm8                           #249.19 c17
        nop                                                     #249.19 c21
        vmulps    %zmm8{badc}, %zmm8, %zmm9                     #249.19 c25
        nop                                                     #249.19 c29
        vmulps    %zmm9{cdab}, %zmm9, %zmm10                    #249.19 c33
        vmulps    %zmm10, %zmm0, %zmm11{%k1}                    #249.5 c37
        vmulps    %zmm11, %zmm12, %zmm13{%k1}                   #249.5 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm12, %zmm13{%k1} #249.5 c45
        vfmadd213ps %zmm4, %zmm5, %zmm13{%k1}                   #249.5 c49
        nop                                                     #249.5 c53
        vpackstorelps %zmm13, 4(%rax,%rdi,4){%k1}               #249.5 c57
        jmp       ..B5.17       # Prob 100%                     #249.5 c57
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.16:                        # Preds ..B5.9 Latency 13
        vbroadcastss 4(%rax,%rdi,4), %zmm3{%k1}                 #245.19 c1
        vaddps    (%rax,%rdi,4){1to16}, %zmm3, %zmm4{%k1}       #245.33 c5
        nop                                                     #245.5 c9
        vpackstorelps %zmm4, 4(%rax,%rdi,4){%k1}                #245.5 c13
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.17:                        # Preds ..B5.12 ..B5.16 ..B5.11 ..B5.15 Latency 9
        lea       2(%rdi,%rdx), %r8                             #242.31 c1
        vprefetche1 56(%rax,%rdi,4)                             #245.33 c1
        vprefetch0 8(%rax,%rdi,4)                               #245.33 c5
        incq      %rdi                                          #242.3 c5
        cmpq      %rcx, %rdi                                    #242.3 c9
        jb        ..B5.9        # Prob 82%                      #242.3 c9
        jmp       ..B5.19       # Prob 100%                     #242.3 c9
                                # LOE rax rdx rcx rbx rdi r8 r10 r11 r12 r14 r15 r9d r13d zmm0 zmm1 zmm2 k1
..B5.72:                        # Preds ..B5.7 ..B5.6 Latency 5
        movl      $1, %eax                                      #249.19 c1
        kmov      %eax, %k1                                     #249.19 c5
                                # LOE rbx r8 r10 r11 r12 r14 r15 r9d r13d k1
..B5.19:                        # Preds ..B5.17 ..B5.72 Latency 25
        movl      -4(%rbx,%r8,4), %eax                          #256.13 c1
        movl      %eax, 8(%r14)                                 #256.4 c5
        movl      $1, 4(%r14)                                   #257.3 c9
        movl      num_of_threads(%rip), %r8d                    #262.11 c13
        movslq    %r8d, %r8                                     #262.2 c17
        decq      %r8                                           #262.26 c21
        cmpq      %r8, %r15                                     #262.26 c25
        jne       ..B5.21       # Prob 50%                      #262.26 c25
                                # LOE rbx r8 r10 r11 r12 r14 r15 r9d r13d k1
..B5.20:                        # Preds ..B5.19 Latency 6
        movq      dim(%rip), %rcx                               #263.10 c1
        decq      %rcx                                          #263.14 c5
        jmp       ..B5.22       # Prob 100%                     #263.14 c5
                                # LOE rcx rbx r8 r10 r11 r12 r14 r15 r9d r13d k1
..B5.21:                        # Preds ..B5.19 Latency 1
        lea       -1(%r12,%r10), %rcx                           #261.16 c1
                                # LOE rcx rbx r8 r10 r11 r12 r14 r15 r9d r13d k1
..B5.22:                        # Preds ..B5.22 ..B5.20 ..B5.21 Latency 5
        movl      4(%r14), %eax                                 #266.9 c1
        cmpl      $2, %eax                                      #266.18 c5
        jne       ..B5.22       # Prob 97%                      #266.18 c5
                                # LOE rcx rbx r8 r10 r11 r12 r14 r15 r9d r13d k1
..B5.26:                        # Preds ..B5.22 Latency 9
        vbroadcastss 8(%r14), %zmm1{%k1}                        #269.18 c1
        cmpl      $2, test(%rip)                                #270.13 c5
        je        ..B5.63       # Prob 5%                       #270.13 c9
                                # LOE rcx rbx r8 r10 r11 r12 r15 r9d r13d zmm1 k1
..B5.27:                        # Preds ..B5.26 ..B5.73 Latency 1
        cmpq      %r8, %r15                                     #273.26 c1
        jne       ..B5.49       # Prob 50%                      #273.26 c1
                                # LOE rcx rbx r10 r11 r12 r15 r13d zmm1 k1
..B5.28:                        # Preds ..B5.27 Latency 1
        testl     %r13d, %r13d                                  #274.6 c1
        je        ..B5.35       # Prob 25%                      #274.6 c1
                                # LOE rcx rbx r10 r11 r12 r15 r13d zmm1 k1
..B5.29:                        # Preds ..B5.28 Latency 1
        cmpl      $1, %r13d                                     #274.6 c1
        jne       ..B5.31       # Prob 66%                      #274.6 c1
                                # LOE rcx rbx r10 r11 r12 r15 r13d zmm1 k1
..B5.30:                        # Preds ..B5.29 Latency 74
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm0          #277.22 c1
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm8{%k1}    #277.22 c5
        movl      $1023, %eax                                   #277.22 c9
        kmov      %eax, %k2                                     #277.22 c13
        vmulps    .L_2il0floatpacket.10(%rip){1to16}, %zmm0, %zmm0{%k2} #277.22 c17
        nop                                                     #277.22 c21
        vpermf32x4 $238, %zmm0, %zmm2                           #277.22 c25
        vmulps    %zmm0, %zmm2, %zmm4                           #277.22 c29
        nop                                                     #277.22 c33
        vpermf32x4 $85, %zmm4, %zmm3                            #277.22 c37
        vmulps    %zmm4, %zmm3, %zmm5                           #277.22 c41
        nop                                                     #277.22 c45
        vmulps    %zmm5{badc}, %zmm5, %zmm6                     #277.22 c49
        nop                                                     #277.22 c53
        vmulps    %zmm6{cdab}, %zmm6, %zmm7                     #277.22 c57
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm7, %zmm8{%k1} #277.4 c61
        vfmadd132ps 4(%rbx,%r11,4){1to16}, %zmm1, %zmm8{%k1}    #277.4 c65
        nop                                                     #277.4 c69
        vpackstorelps %zmm8, 4(%rbx,%r11,4){%k1}                #277.4 c73
        jmp       ..B5.36       # Prob 100%                     #277.4 c73
                                # LOE rcx rbx r10 r12 r15 r13d k1
..B5.31:                        # Preds ..B5.29 Latency 1
        cmpl      $2, %r13d                                     #274.6 c1
        jne       ..B5.36       # Prob 50%                      #274.6 c1
                                # LOE rcx rbx r10 r11 r12 r15 r13d zmm1 k1
..B5.32:                        # Preds ..B5.31 Latency 9
        vbroadcastss 4(%rbx,%r11,4), %zmm3{%k1}                 #279.24 c1
        xorb      %al, %al                                      #279.22 c1
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm2          #279.22 c5
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm0             #279.22 c9
                                # LOE rcx rbx r10 r11 r12 r15 r13d al zmm0 zmm1 zmm2 zmm3 k1
..B5.33:                        # Preds ..B5.33 ..B5.32 Latency 9
        vmulps    %zmm0, %zmm2, %zmm2                           #279.22 c1
        addb      $32, %al                                      #279.22 c1
        vmulps    %zmm2, %zmm0, %zmm2                           #279.22 c5
        cmpb      $96, %al                                      #279.22 c5
        jb        ..B5.33       # Prob 82%                      #279.22 c9
                                # LOE rcx rbx r10 r11 r12 r15 r13d al zmm0 zmm1 zmm2 zmm3 k1
..B5.34:                        # Preds ..B5.33 Latency 58
        vpermf32x4 $238, %zmm2, %zmm0                           #279.22 c1
        vmulps    %zmm2, %zmm0, %zmm4                           #279.22 c5
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm8{%k1}    #279.22 c9
        vpermf32x4 $85, %zmm4, %zmm2                            #279.22 c13
        vmulps    %zmm4, %zmm2, %zmm5                           #279.22 c17
        vmulps    %zmm8, %zmm8, %zmm10{%k1}                     #279.4 c21
        vmulps    %zmm5{badc}, %zmm5, %zmm6                     #279.22 c25
        nop                                                     #279.22 c29
        vmulps    %zmm6{cdab}, %zmm6, %zmm7                     #279.22 c33
        vmulps    .L_2il0floatpacket.10(%rip){1to16}, %zmm7, %zmm9{%k1} #279.4 c37
        vmulps    %zmm9, %zmm10, %zmm11{%k1}                    #279.4 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm10, %zmm11{%k1} #279.4 c45
        vfmadd213ps %zmm1, %zmm3, %zmm11{%k1}                   #279.4 c49
        nop                                                     #279.4 c53
        vpackstorelps %zmm11, 4(%rbx,%r11,4){%k1}               #279.4 c57
        jmp       ..B5.36       # Prob 100%                     #279.4 c57
                                # LOE rcx rbx r10 r12 r15 r13d k1
..B5.35:                        # Preds ..B5.28 Latency 9
        vaddps    4(%rbx,%r11,4){1to16}, %zmm1, %zmm0{%k1}      #275.40 c1
        nop                                                     #275.4 c5
        vpackstorelps %zmm0, 4(%rbx,%r11,4){%k1}                #275.4 c9
                                # LOE rcx rbx r10 r12 r15 r13d k1
..B5.36:                        # Preds ..B5.31 ..B5.35 ..B5.30 ..B5.34 Latency 1
        cmpq      $-1, %rcx                                     #282.14 c1
        je        ..B5.62       # Prob 50%                      #282.14 c1
                                # LOE rcx rbx r10 r12 r15 r13d k1
..B5.37:                        # Preds ..B5.36 Latency 5
        lea       1(%r10), %rsi                                 #205.2 c1
        xorl      %eax, %eax                                    #283.4 c1
        cmpq      %rsi, %rcx                                    #283.26 c5
        jb        ..B5.62       # Prob 10%                      #283.26 c5
                                # LOE rax rcx rbx r10 r12 r15 r13d k1
..B5.38:                        # Preds ..B5.37 Latency 36
        lea       4(,%r15,4), %rsi                              #286.34 c1
        subq      %r10, %rcx                                    #266.9 c1
        imulq     %rsi, %r12                                    #229.17 c5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4{%k1}     #288.20 c16
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm3          #288.20 c20
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm2             #290.20 c24
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm1{%k1}    #288.20 c28
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0         #288.20 c32
        vprefetch0 (%r12,%rbx)                                  #286.34 c36
        addq      %r12, %rbx                                    #286.34 c36
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.39:                        # Preds ..B5.47 ..B5.38 Latency 1
        testl     %r13d, %r13d                                  #285.8 c1
        je        ..B5.46       # Prob 25%                      #285.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.40:                        # Preds ..B5.39 Latency 1
        cmpl      $1, %r13d                                     #285.8 c1
        jne       ..B5.42       # Prob 66%                      #285.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.41:                        # Preds ..B5.40 Latency 66
        vmovaps   %zmm3, %zmm6                                  #288.20 c1
        movl      $1023, %edx                                   #288.20 c1
        vbroadcastss 4(%rbx,%rax,4), %zmm12{%k1}                #288.22 c5
        kmov      %edx, %k2                                     #288.20 c5
        vmulps    %zmm0, %zmm3, %zmm6{%k2}                      #288.20 c9
        nop                                                     #288.20 c13
        vpermf32x4 $238, %zmm6, %zmm5                           #288.20 c17
        vmulps    %zmm6, %zmm5, %zmm8                           #288.20 c21
        nop                                                     #288.20 c25
        vpermf32x4 $85, %zmm8, %zmm7                            #288.20 c29
        vmulps    %zmm8, %zmm7, %zmm9                           #288.20 c33
        nop                                                     #288.20 c37
        vmulps    %zmm9{badc}, %zmm9, %zmm10                    #288.20 c41
        nop                                                     #288.20 c45
        vmulps    %zmm10{cdab}, %zmm10, %zmm11                  #288.20 c49
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm1, %zmm11{%k1} #288.6 c53
        vfmadd213ps (%rbx,%rax,4){1to16}, %zmm12, %zmm11{%k1}   #288.6 c57
        nop                                                     #288.6 c61
        vpackstorelps %zmm11, 4(%rbx,%rax,4){%k1}               #288.6 c65
        jmp       ..B5.47       # Prob 100%                     #288.6 c65
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.42:                        # Preds ..B5.40 Latency 1
        cmpl      $2, %r13d                                     #285.8 c1
        jne       ..B5.47       # Prob 50%                      #285.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.43:                        # Preds ..B5.42 Latency 13
        vpshufd   $0, %zmm4, %zmm5                              #290.20 c1
        xorb      %dl, %dl                                      #290.20 c1
        vbroadcastss 4(%rbx,%rax,4), %zmm7{%k1}                 #290.22 c5
        vbroadcastss (%rbx,%rax,4), %zmm6{%k1}                  #290.34 c9
        vpermf32x4 $0, %zmm5, %zmm5                             #290.20 c13
                                # LOE rax rcx rbx r13d dl zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B5.44:                        # Preds ..B5.44 ..B5.43 Latency 9
        vmulps    %zmm2, %zmm5, %zmm5                           #290.20 c1
        addb      $32, %dl                                      #290.20 c1
        vmulps    %zmm5, %zmm2, %zmm5                           #290.20 c5
        cmpb      $96, %dl                                      #290.20 c5
        jb        ..B5.44       # Prob 82%                      #290.20 c9
                                # LOE rax rcx rbx r13d dl zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B5.45:                        # Preds ..B5.44 Latency 58
        vpermf32x4 $238, %zmm5, %zmm8                           #290.20 c1
        vmulps    %zmm5, %zmm8, %zmm9                           #290.20 c5
        vmulps    %zmm1, %zmm1, %zmm14{%k1}                     #290.6 c9
        vpermf32x4 $85, %zmm9, %zmm5                            #290.20 c13
        vmulps    %zmm9, %zmm5, %zmm10                          #290.20 c17
        nop                                                     #290.20 c21
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #290.20 c25
        nop                                                     #290.20 c29
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #290.20 c33
        vmulps    %zmm12, %zmm1, %zmm13{%k1}                    #290.6 c37
        vmulps    %zmm13, %zmm14, %zmm15{%k1}                   #290.6 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm14, %zmm15{%k1} #290.6 c45
        vfmadd213ps %zmm6, %zmm7, %zmm15{%k1}                   #290.6 c49
        nop                                                     #290.6 c53
        vpackstorelps %zmm15, 4(%rbx,%rax,4){%k1}               #290.6 c57
        jmp       ..B5.47       # Prob 100%                     #290.6 c57
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.46:                        # Preds ..B5.39 Latency 13
        vbroadcastss 4(%rbx,%rax,4), %zmm5{%k1}                 #286.20 c1
        vaddps    (%rbx,%rax,4){1to16}, %zmm5, %zmm6{%k1}       #286.34 c5
        nop                                                     #286.6 c9
        vpackstorelps %zmm6, 4(%rbx,%rax,4){%k1}                #286.6 c13
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.47:                        # Preds ..B5.42 ..B5.46 ..B5.41 ..B5.45 Latency 9
        vprefetche1 20(%rbx,%rax,4)                             #286.34 c1
        movb      %dl, %dl                                      #286.34 c1
        vprefetch0 8(%rbx,%rax,4)                               #286.34 c5
        incq      %rax                                          #283.4 c5
        cmpq      %rcx, %rax                                    #283.4 c9
        jb        ..B5.39       # Prob 82%                      #283.4 c9
        jmp       ..B5.62       # Prob 100%                     #283.4 c9
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B5.49:                        # Preds ..B5.27 Latency 1
        cmpq      $-1, %rcx                                     #296.14 c1
        je        ..B5.62       # Prob 50%                      #296.14 c1
                                # LOE rcx rbx r10 r12 r15 r13d zmm1 k1
..B5.50:                        # Preds ..B5.49 Latency 5
        xorl      %eax, %eax                                    #297.4 c1
        cmpq      %r10, %rcx                                    #297.24 c1
        jb        ..B5.62       # Prob 10%                      #297.24 c5
                                # LOE rax rcx rbx r10 r12 r15 r13d zmm1 k1
..B5.51:                        # Preds ..B5.50 Latency 40
        lea       4(,%r15,4), %rsi                              #300.20 c1
        subq      %r10, %rcx                                    #266.9 c1
        imulq     %rsi, %r12                                    #229.17 c5
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm5{%k1}     #302.20 c16
        vbroadcastss .L_2il0floatpacket.5(%rip), %zmm4          #302.20 c20
        vmovaps   .L_2il0floatpacket.9(%rip), %zmm3             #304.20 c24
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm2{%k1}    #302.20 c28
        vbroadcastss .L_2il0floatpacket.10(%rip), %zmm0         #302.20 c32
        vprefetch0 (%r12,%rbx)                                  #300.20 c36
        addq      %r12, %rbx                                    #300.20 c36
        incq      %rcx                                          #266.9 c40
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.52:                        # Preds ..B5.60 ..B5.51 Latency 1
        testl     %r13d, %r13d                                  #299.8 c1
        je        ..B5.59       # Prob 25%                      #299.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.53:                        # Preds ..B5.52 Latency 1
        cmpl      $1, %r13d                                     #299.8 c1
        jne       ..B5.55       # Prob 66%                      #299.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.54:                        # Preds ..B5.53 Latency 66
        vmovaps   %zmm4, %zmm7                                  #302.20 c1
        movl      $1023, %edx                                   #302.20 c1
        kmov      %edx, %k2                                     #302.20 c5
        vmulps    %zmm0, %zmm4, %zmm7{%k2}                      #302.20 c9
        nop                                                     #302.20 c13
        vpermf32x4 $238, %zmm7, %zmm6                           #302.20 c17
        vmulps    %zmm7, %zmm6, %zmm9                           #302.20 c21
        nop                                                     #302.20 c25
        vpermf32x4 $85, %zmm9, %zmm8                            #302.20 c29
        vmulps    %zmm9, %zmm8, %zmm10                          #302.20 c33
        nop                                                     #302.20 c37
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #302.20 c41
        nop                                                     #302.20 c45
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #302.20 c49
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm2, %zmm12{%k1} #302.6 c53
        vfmadd132ps (%rbx,%rax,4){1to16}, %zmm1, %zmm12{%k1}    #302.6 c57
        nop                                                     #302.6 c61
        vpackstorelps %zmm12, (%rbx,%rax,4){%k1}                #302.6 c65
        jmp       ..B5.60       # Prob 100%                     #302.6 c65
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.55:                        # Preds ..B5.53 Latency 1
        cmpl      $2, %r13d                                     #299.8 c1
        jne       ..B5.60       # Prob 50%                      #299.8 c1
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.56:                        # Preds ..B5.55 Latency 9
        vpshufd   $0, %zmm5, %zmm6                              #304.20 c1
        xorb      %dl, %dl                                      #304.20 c1
        vbroadcastss (%rbx,%rax,4), %zmm7{%k1}                  #304.22 c5
        vpermf32x4 $0, %zmm6, %zmm6                             #304.20 c9
                                # LOE rax rcx rbx r13d dl zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B5.57:                        # Preds ..B5.57 ..B5.56 Latency 9
        vmulps    %zmm3, %zmm6, %zmm6                           #304.20 c1
        addb      $32, %dl                                      #304.20 c1
        vmulps    %zmm6, %zmm3, %zmm6                           #304.20 c5
        cmpb      $96, %dl                                      #304.20 c5
        jb        ..B5.57       # Prob 82%                      #304.20 c9
                                # LOE rax rcx rbx r13d dl zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 k1
..B5.58:                        # Preds ..B5.57 Latency 58
        vpermf32x4 $238, %zmm6, %zmm8                           #304.20 c1
        vmulps    %zmm6, %zmm8, %zmm9                           #304.20 c5
        vmulps    %zmm2, %zmm2, %zmm14{%k1}                     #304.6 c9
        vpermf32x4 $85, %zmm9, %zmm6                            #304.20 c13
        vmulps    %zmm9, %zmm6, %zmm10                          #304.20 c17
        nop                                                     #304.20 c21
        vmulps    %zmm10{badc}, %zmm10, %zmm11                  #304.20 c25
        nop                                                     #304.20 c29
        vmulps    %zmm11{cdab}, %zmm11, %zmm12                  #304.20 c33
        vmulps    %zmm12, %zmm2, %zmm13{%k1}                    #304.6 c37
        vmulps    %zmm13, %zmm14, %zmm15{%k1}                   #304.6 c41
        vfmadd213ps .L_2il0floatpacket.5(%rip){1to16}, %zmm14, %zmm15{%k1} #304.6 c45
        vfmadd213ps %zmm1, %zmm7, %zmm15{%k1}                   #304.6 c49
        nop                                                     #304.6 c53
        vpackstorelps %zmm15, (%rbx,%rax,4){%k1}                #304.6 c57
        jmp       ..B5.60       # Prob 100%                     #304.6 c57
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.59:                        # Preds ..B5.52 Latency 9
        vaddps    (%rbx,%rax,4){1to16}, %zmm1, %zmm6{%k1}       #300.34 c1
        nop                                                     #300.6 c5
        vpackstorelps %zmm6, (%rbx,%rax,4){%k1}                 #300.6 c9
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.60:                        # Preds ..B5.55 ..B5.59 ..B5.54 ..B5.58 Latency 9
        vprefetche1 20(%rbx,%rax,4)                             #300.20 c1
        movb      %dl, %dl                                      #300.20 c1
        vprefetch0 8(%rbx,%rax,4)                               #300.20 c5
        incq      %rax                                          #297.4 c5
        cmpq      %rcx, %rax                                    #297.4 c9
        jb        ..B5.52       # Prob 82%                      #297.4 c9
                                # LOE rax rcx rbx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1
..B5.62:                        # Preds ..B5.60 ..B5.47 ..B5.49 ..B5.50 ..B5.36
                                #       ..B5.37 Latency 25
        xorl      %eax, %eax                                    #312.9 c1
        addq      $216, %rsp                                    #312.9 c1
..___tag_value_worker.123:                                      #312.9
        popq      %rbx                                          #312.9
..___tag_value_worker.124:                                      #312.9
        popq      %r15                                          #312.9
..___tag_value_worker.125:                                      #312.9
        popq      %r14                                          #312.9
..___tag_value_worker.126:                                      #312.9
        popq      %r13                                          #312.9
..___tag_value_worker.127:                                      #312.9
        popq      %r12                                          #312.9
        movq      %rbp, %rsp                                    #312.9 c25
        popq      %rbp                                          #312.9
..___tag_value_worker.128:                                      #
        ret                                                     #312.9
..___tag_value_worker.130:                                      #
                                # LOE
..B5.63:                        # Preds ..B5.26                 # Infreq Latency 25
        movl      $1, %eax                                      #271.3 c1
        movl      $.L_2__STRING.12, %edi                        #271.3 c1
        vcvtps2pd %zmm1, %zmm0{%k1}                             #271.3 c5
        movl      %r9d, %esi                                    #271.3 c5
        movq      %r10, %rdx                                    #271.3 c9
        kmov      %eax, %k2                                     #271.3 c9
        vpackstorelps %zmm1, (%rsp){%k2}                        #271.3 c13
        movb      %al, %al                                      #271.3 c13
        movq      %rcx, 8(%rsp)                                 #271.3 c17
        movq      %r8, 16(%rsp)                                 #271.3 c17
        movq      %r11, 24(%rsp)                                #271.3 c21
        movq      %r10, 32(%rsp)                                #271.3 c21
..___tag_value_worker.137:                                      #271.3
        call      printf                                        #271.3
..___tag_value_worker.138:                                      #
                                # LOE rbx r12 r15 r13d
..B5.73:                        # Preds ..B5.63                 # Infreq Latency 14
        movl      $1, %eax                                      # c1
        movq      32(%rsp), %r10                                # c1
        vbroadcastss (%rsp), %zmm1                              # c5
        kmov      %eax, %k1                                     # c5
        movq      24(%rsp), %r11                                # c9
        movq      16(%rsp), %r8                                 # c9
        movq      8(%rsp), %rcx                                 # c13
        jmp       ..B5.27       # Prob 100%                     # c13
                                # LOE rcx rbx r8 r10 r11 r12 r15 r13d zmm1 k1
..B5.64:                        # Preds ..B5.5                  # Infreq Latency 21
        movl      $.L_2__STRING.11, %edi                        #239.3 c1
        movl      %r9d, %esi                                    #239.3 c1
        movq      %r11, %rcx                                    #239.3 c5
        xorl      %eax, %eax                                    #239.3 c5
        movq      %rdx, (%rsp)                                  #239.3 c9
        movq      %r8, 8(%rsp)                                  #239.3 c9
        movq      %r11, 24(%rsp)                                #239.3 c13
        movq      %r10, 32(%rsp)                                #239.3 c13
        movl      %r9d, 16(%rsp)                                #239.3 c17
..___tag_value_worker.139:                                      #239.3
        call      printf                                        #239.3
..___tag_value_worker.140:                                      #
                                # LOE rbx r12 r14 r15 r13d
..B5.74:                        # Preds ..B5.64                 # Infreq Latency 10
        movl      16(%rsp), %r9d                                # c1
        movq      32(%rsp), %r10                                # c1
        movq      24(%rsp), %r11                                # c5
        movq      8(%rsp), %r8                                  # c5
        movq      (%rsp), %rdx                                  # c9
        jmp       ..B5.6        # Prob 100%                     # c9
                                # LOE rdx rbx r8 r10 r11 r12 r14 r15 r9d r13d
..B5.65:                        # Preds ..B5.4                  # Infreq Latency 9
        xorl      %edi, %edi                                    #223.6 c1
        movl      $128, %esi                                    #223.6 c1
        lea       64(%rsp), %rdx                                #223.6 c5
        movl      %r9d, -48(%rdx)                               #223.6 c5
..___tag_value_worker.141:                                      #223.6
        call      sched_setaffinity                             #223.6
..___tag_value_worker.142:                                      #
                                # LOE rbx r12 r14 r15 eax r13d
..B5.70:                        # Preds ..B5.65                 # Infreq Latency 1
        movl      16(%rsp), %r9d                                # c1
                                # LOE rbx r9 r12 r14 r15 eax r9d r13d r9b
..B5.66:                        # Preds ..B5.70                 # Infreq Latency 1
        testl     %eax, %eax                                    #223.6 c1
        je        ..B5.5        # Prob 95%                      #223.6 c1
                                # LOE rbx r9 r12 r14 r15 r9d r13d r9b
..B5.67:                        # Preds ..B5.66                 # Infreq Latency 5
        movl      $.L_2__STRING.10, %edi                        #224.4 c1
        movl      %r9d, 16(%rsp)                                #224.4 c1
        call      perror                                        #224.4 c5
                                # LOE rbx r12 r14 r15 r13d
..B5.75:                        # Preds ..B5.67                 # Infreq Latency 2
        movl      16(%rsp), %r9d                                # c1
        jmp       ..B5.5        # Prob 100%                     # c1
        .align    16,0x90
..___tag_value_worker.143:                                      #
                                # LOE rbx r12 r14 r15 r9d r13d
# mark_end;
	.type	worker,@function
	.size	worker,.-worker
	.data
# -- End  worker
	.bss
	.align 4
	.align 4
	.globl test
test:
	.type	test,@object
	.size	test,4
	.space 4	# pad
	.align 4
	.globl typeFunc
typeFunc:
	.type	typeFunc,@object
	.size	typeFunc,4
	.space 4	# pad
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.4:
	.long	0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010,0x00000010
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,64
	.align 64
.L_2il0floatpacket.6:
	.long	0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,64
	.align 64
.L_2il0floatpacket.7:
	.long	0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff,0x00000000,0xffffffff
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,64
	.align 64
.L_2il0floatpacket.8:
	.long	0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,64
	.align 64
.L_2il0floatpacket.9:
	.long	0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f,0x3a83126f
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,64
	.align 64
.L_2il0floatpacket.12:
	.long	0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007,0x00000008,0x00000009,0x0000000a,0x0000000b,0x0000000c,0x0000000d,0x0000000e,0x0000000f,0x00000010
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,64
	.align 32
.L_2il0floatpacket.15:
	.long	0x00000000,0x7ff00000,0x00000000,0x3ff00000,0x00000000,0x41380000,0x00000000,0x4137fc02
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,32
	.align 32
.L_2il0floatpacket.16:
	.long	0x00000000,0xfff00000,0x00000001,0x00000000,0x0000043e,0x00000000,0x00000000,0x80000000
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,32
	.align 16
.L_2il0floatpacket.17:
	.long	0x40900800,0xc090d400,0x7fe00000,0x03500000
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,16
	.align 8
.L_2il0floatpacket.11:
	.long	0x00000000,0x412e8480
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,8
	.align 8
.L_2il0floatpacket.14:
	.long	0x00000000,0x41f00000
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,8
	.align 4
.L_2il0floatpacket.5:
	.long	0x3f800000
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,4
	.align 4
.L_2il0floatpacket.10:
	.long	0x3a83126f
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,4
	.align 4
.L_2il0floatpacket.13:
	.long	0x40000000
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,4
	.align 4
.L_2il0floatpacket.18:
	.long	0x00028b45
	.type	.L_2il0floatpacket.18,@object
	.size	.L_2il0floatpacket.18,4
	.align 4
.L_2il0floatpacket.19:
	.long	0x00018842
	.type	.L_2il0floatpacket.19,@object
	.size	.L_2il0floatpacket.19,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.6:
	.long	745088266
	.long	1714826789
	.word	10
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.7:
	.long	1714826789
	.long	1667592992
	.long	1935961711
	.word	10
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	1714433573
	.word	32
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,6
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.9:
	.long	2123301
	.type	.L_2__STRING.9,@object
	.size	.L_2__STRING.9,4
	.align 4
.L_2__STRING.3:
	.long	544041316
	.long	1814372413
	.long	663657
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,12
	.align 4
.L_2__STRING.0:
	.long	1195463509
	.long	622869061
	.long	544088179
	.long	1701996660
	.long	544433249
	.long	1668183398
	.long	1702124320
	.long	173896819
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,33
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.12:
	.long	1701996660
	.long	622879841
	.long	1713384553
	.long	1953722985
	.long	1768695101
	.long	1634476076
	.long	1025537139
	.long	1768695072
	.long	1970479148
	.long	1852403053
	.long	1818318439
	.long	174466365
	.byte	0
	.type	.L_2__STRING.12,@object
	.size	.L_2__STRING.12,49
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.11:
	.long	1701996660
	.long	622879841
	.long	1713384553
	.long	1953722985
	.long	1768695101
	.long	1634476076
	.long	1025537139
	.long	1768695072
	.word	10
	.type	.L_2__STRING.11,@object
	.size	.L_2__STRING.11,34
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.10:
	.long	1330795077
	.long	1931494738
	.long	1717662821
	.long	1768843622
	.word	31092
	.byte	0
	.type	.L_2__STRING.10,@object
	.size	.L_2__STRING.10,19
	.data
	.comm tm1,16,8
	.comm tm2,16,8
	.comm t1,8,8
	.comm t2,8,8
	.comm dim,8,8
	.comm num_of_threads,4,4
	.comm num_of_partitions,4,4
	.comm Vector,8,8
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x000001a4
	.4byte 0x0000001c
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.55-..___tag_value_main.1
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.8byte 0xff800d1c380e0310
	.8byte 0xffffffe00d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xfffff80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xfff00d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0xe80d1affffff800d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_main.11-..___tag_value_main.6
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff880d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.12-..___tag_value_main.11
	.2byte 0x04cf
	.4byte ..___tag_value_main.19-..___tag_value_main.12
	.2byte 0x04c3
	.4byte ..___tag_value_main.20-..___tag_value_main.19
	.2byte 0x04ce
	.4byte ..___tag_value_main.21-..___tag_value_main.20
	.2byte 0x04cd
	.4byte ..___tag_value_main.22-..___tag_value_main.21
	.2byte 0x04cc
	.4byte ..___tag_value_main.23-..___tag_value_main.22
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.25-..___tag_value_main.23
	.8byte 0x1c380e031010060c
	.8byte 0xe00d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.31-..___tag_value_main.25
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff880d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.34-..___tag_value_main.31
	.2byte 0x04cf
	.4byte ..___tag_value_main.35-..___tag_value_main.34
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffff880d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.38-..___tag_value_main.35
	.2byte 0x04cf
	.4byte ..___tag_value_main.43-..___tag_value_main.38
	.2byte 0x04c3
	.4byte ..___tag_value_main.44-..___tag_value_main.43
	.2byte 0x04ce
	.4byte ..___tag_value_main.45-..___tag_value_main.44
	.2byte 0x04cd
	.4byte ..___tag_value_main.46-..___tag_value_main.45
	.2byte 0x04cc
	.4byte ..___tag_value_main.47-..___tag_value_main.46
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.49-..___tag_value_main.47
	.8byte 0x1c380e031010060c
	.8byte 0xe00d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffffe80d1affff
	.4byte 0x00000022
	.byte 0x00
	.4byte 0x00000014
	.4byte 0x000001c4
	.8byte ..___tag_value_f.56
	.8byte ..___tag_value_f.58-..___tag_value_f.56
	.4byte 0x000000c4
	.4byte 0x000001dc
	.8byte ..___tag_value_linearSolution.59
	.8byte ..___tag_value_linearSolution.82-..___tag_value_linearSolution.59
	.byte 0x04
	.4byte ..___tag_value_linearSolution.61-..___tag_value_linearSolution.59
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_linearSolution.62-..___tag_value_linearSolution.61
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_linearSolution.64-..___tag_value_linearSolution.62
	.8byte 0xffc00d1c380e0e10
	.8byte 0xfffffff80d1affff
	.8byte 0xc00d1c380e0f1022
	.8byte 0xfffff00d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value_linearSolution.66-..___tag_value_linearSolution.64
	.2byte 0x04cf
	.4byte ..___tag_value_linearSolution.67-..___tag_value_linearSolution.66
	.2byte 0x04ce
	.4byte ..___tag_value_linearSolution.68-..___tag_value_linearSolution.67
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_linearSolution.70-..___tag_value_linearSolution.68
	.8byte 0x0e0e10028610060c
	.8byte 0x1affffffc00d1c38
	.8byte 0x0f1022fffffff80d
	.8byte 0xffffffc00d1c380e
	.8byte 0x0422fffffff00d1a
	.4byte ..___tag_value_linearSolution.74-..___tag_value_linearSolution.70
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffc00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_linearSolution.77-..___tag_value_linearSolution.74
	.2byte 0x04cc
	.4byte ..___tag_value_linearSolution.78-..___tag_value_linearSolution.77
	.2byte 0x04cf
	.4byte ..___tag_value_linearSolution.79-..___tag_value_linearSolution.78
	.2byte 0x04ce
	.4byte ..___tag_value_linearSolution.80-..___tag_value_linearSolution.79
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.4byte 0x0000011c
	.4byte 0x000002a4
	.8byte ..___tag_value_prefix_sum.83
	.8byte ..___tag_value_prefix_sum.112-..___tag_value_prefix_sum.83
	.byte 0x04
	.4byte ..___tag_value_prefix_sum.85-..___tag_value_prefix_sum.83
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_prefix_sum.86-..___tag_value_prefix_sum.85
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_prefix_sum.88-..___tag_value_prefix_sum.86
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffe00d1affff
	.8byte 0xc00d1c380e0c1022
	.8byte 0xfffff80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xfff00d1affffffc0
	.8byte 0x1c380e0f1022ffff
	.8byte 0xe80d1affffffc00d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_prefix_sum.92-..___tag_value_prefix_sum.88
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffc80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_prefix_sum.93-..___tag_value_prefix_sum.92
	.2byte 0x04ce
	.4byte ..___tag_value_prefix_sum.96-..___tag_value_prefix_sum.93
	.2byte 0x04c3
	.4byte ..___tag_value_prefix_sum.97-..___tag_value_prefix_sum.96
	.2byte 0x04cf
	.4byte ..___tag_value_prefix_sum.98-..___tag_value_prefix_sum.97
	.2byte 0x04cd
	.4byte ..___tag_value_prefix_sum.99-..___tag_value_prefix_sum.98
	.2byte 0x04cc
	.4byte ..___tag_value_prefix_sum.100-..___tag_value_prefix_sum.99
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_prefix_sum.102-..___tag_value_prefix_sum.100
	.8byte 0x1c380e031010060c
	.8byte 0xe00d1affffffc00d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffffc00d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffffc00d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_prefix_sum.108-..___tag_value_prefix_sum.102
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffc80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_prefix_sum.111-..___tag_value_prefix_sum.108
	.8byte 0x00000000000000ce
	.4byte 0x0000010c
	.4byte 0x000003c4
	.8byte ..___tag_value_worker.113
	.8byte ..___tag_value_worker.143-..___tag_value_worker.113
	.byte 0x04
	.4byte ..___tag_value_worker.115-..___tag_value_worker.113
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_worker.116-..___tag_value_worker.115
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_worker.118-..___tag_value_worker.116
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffd80d1affff
	.8byte 0xc00d1c380e0c1022
	.8byte 0xfffff80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xfff00d1affffffc0
	.8byte 0x1c380e0e1022ffff
	.8byte 0xe80d1affffffc00d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffffc00d1c
	.4byte 0xffffffe0
	.2byte 0x0422
	.4byte ..___tag_value_worker.123-..___tag_value_worker.118
	.2byte 0x04c3
	.4byte ..___tag_value_worker.124-..___tag_value_worker.123
	.2byte 0x04cf
	.4byte ..___tag_value_worker.125-..___tag_value_worker.124
	.2byte 0x04ce
	.4byte ..___tag_value_worker.126-..___tag_value_worker.125
	.2byte 0x04cd
	.4byte ..___tag_value_worker.127-..___tag_value_worker.126
	.2byte 0x04cc
	.4byte ..___tag_value_worker.128-..___tag_value_worker.127
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_worker.130-..___tag_value_worker.128
	.8byte 0x1c380e031010060c
	.8byte 0xd80d1affffffc00d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffffc00d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffffc00d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffe80d1affff
	.8byte 0xc00d1c380e0f1022
	.8byte 0xffffe00d1affffff
	.8byte 0x00000000000022ff
	.byte 0x00
# End
