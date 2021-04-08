   1              		.file	"frzf.f"
   2              		.text
   3              		.p2align 4
   4              		.globl	zeta_
   6              	zeta_:
   7              	.LFB0:
   8              		.cfi_startproc
   9 0000 4154     		pushq	%r12
  10              		.cfi_def_cfa_offset 16
  11              		.cfi_offset 12, -16
  12 0002 55       		pushq	%rbp
  13              		.cfi_def_cfa_offset 24
  14              		.cfi_offset 6, -24
  15 0003 53       		pushq	%rbx
  16              		.cfi_def_cfa_offset 32
  17              		.cfi_offset 3, -32
  18 0004 488B1F   		movq	(%rdi), %rbx
  19 0007 48FFCB   		decq	%rbx
  20 000a 4885DB   		testq	%rbx, %rbx
  21 000d 7E51     		jle	.L4
  22 000f 4C8B26   		movq	(%rsi), %r12
  23 0012 488B2D00 		movq	.LC0(%rip), %rbp
  23      000000
  24 0019 0F1F8000 		.p2align 4,,10
  24      000000
  25              		.p2align 3
  26              	.L3:
  27 0020 C5F157C9 		vxorpd	%xmm1, %xmm1, %xmm1
  28 0024 C4E1F32A 		vcvtsi2sdq	%rbx, %xmm1, %xmm0
  28      C3
  29 0029 4C89E7   		movq	%r12, %rdi
  30 002c E8000000 		call	_gfortran_pow_r8_i8@PLT
  30      00
  31 0031 C5FB1015 		vmovsd	.LC1(%rip), %xmm2
  31      00000000 
  32 0039 C4E1F96E 		vmovq	%rbp, %xmm4
  32      E5
  33 003e C5EB5EC0 		vdivsd	%xmm0, %xmm2, %xmm0
  34 0042 C5DB58D8 		vaddsd	%xmm0, %xmm4, %xmm3
  35 0046 C4E1F97E 		vmovq	%xmm3, %rbp
  35      DD
  36 004b 48FFCB   		decq	%rbx
  37 004e 75D0     		jne	.L3
  38 0050 5B       		popq	%rbx
  39              		.cfi_remember_state
  40              		.cfi_def_cfa_offset 24
  41 0051 C4E1F96E 		vmovq	%rbp, %xmm0
  41      C5
  42 0056 5D       		popq	%rbp
  43              		.cfi_def_cfa_offset 16
  44 0057 415C     		popq	%r12
  45              		.cfi_def_cfa_offset 8
  46 0059 C3       		ret
  47 005a 660F1F44 		.p2align 4,,10
  47      0000
  48              		.p2align 3
  49              	.L4:
  50              		.cfi_restore_state
  51 0060 488B2D00 		movq	.LC0(%rip), %rbp
  51      000000
  52 0067 5B       		popq	%rbx
  53              		.cfi_def_cfa_offset 24
  54 0068 C4E1F96E 		vmovq	%rbp, %xmm0
  54      C5
  55 006d 5D       		popq	%rbp
  56              		.cfi_def_cfa_offset 16
  57 006e 415C     		popq	%r12
  58              		.cfi_def_cfa_offset 8
  59 0070 C3       		ret
  60              		.cfi_endproc
  61              	.LFE0:
  63              		.section	.rodata
  64              		.align 8
  65              	.LC3:
  66 0000 02000000 		.quad	2
  66      00000000 
  67              		.section	.rodata.str1.1,"aMS",@progbits,1
  68              	.LC4:
  69 0000 66727A66 		.string	"frzf.f"
  69      2E6600
  70              	.LC5:
  71 0007 20202020 		.string	"    zeta(2) = "
  71      7A657461 
  71      28322920 
  71      3D2000
  72              	.LC6:
  73 0016 70695E32 		.string	"pi^2 / 6.0  = "
  73      202F2036 
  73      2E302020 
  73      3D2000
  74              	.LC7:
  75 0025 20202020 		.string	"      error = "
  75      20206572 
  75      726F7220 
  75      3D2000
  76              		.text
  77 0071 66662E0F 		.p2align 4
  77      1F840000 
  77      0000000F 
  77      1F4000
  79              	MAIN__:
  80              	.LFB1:
  81              		.cfi_startproc
  82 0080 4154     		pushq	%r12
  83              		.cfi_def_cfa_offset 16
  84              		.cfi_offset 12, -16
  85 0082 488D3500 		leaq	.LC3(%rip), %rsi
  85      000000
  86 0089 4C8D2500 		leaq	.LC4(%rip), %r12
  86      000000
  87 0090 55       		pushq	%rbp
  88              		.cfi_def_cfa_offset 24
  89              		.cfi_offset 6, -24
  90 0091 53       		pushq	%rbx
  91              		.cfi_def_cfa_offset 32
  92              		.cfi_offset 3, -32
  93 0092 48BB8000 		movabsq	$25769803904, %rbx
  93      00000600 
  93      0000
  94 009c 4881EC40 		subq	$576, %rsp
  94      020000
  95              		.cfi_def_cfa_offset 608
  96 00a3 488B0500 		movq	.LC2(%rip), %rax
  96      000000
  97 00aa 488D6C24 		leaq	48(%rsp), %rbp
  97      30
  98 00af 48894424 		movq	%rax, 24(%rsp)
  98      18
  99 00b4 488D7C24 		leaq	16(%rsp), %rdi
  99      10
 100 00b9 48B800A0 		movabsq	$16000000000, %rax
 100      ACB90300 
 100      0000
 101 00c3 48894424 		movq	%rax, 16(%rsp)
 101      10
 102 00c8 E8000000 		call	zeta_
 102      00
 103 00cd 4889EF   		movq	%rbp, %rdi
 104 00d0 C5FB1144 		vmovsd	%xmm0, 32(%rsp)
 104      2420
 105 00d6 C5FB1144 		vmovsd	%xmm0, 8(%rsp)
 105      2408
 106 00dc 4C896424 		movq	%r12, 56(%rsp)
 106      38
 107 00e1 48895C24 		movq	%rbx, 48(%rsp)
 107      30
 108 00e6 C7442440 		movl	$10, 64(%rsp)
 108      0A000000 
 109 00ee E8000000 		call	_gfortran_st_write@PLT
 109      00
 110 00f3 4889EF   		movq	%rbp, %rdi
 111 00f6 BA0E0000 		movl	$14, %edx
 111      00
 112 00fb 488D3500 		leaq	.LC5(%rip), %rsi
 112      000000
 113 0102 E8000000 		call	_gfortran_transfer_character_write@PLT
 113      00
 114 0107 488D7424 		leaq	32(%rsp), %rsi
 114      20
 115 010c BA080000 		movl	$8, %edx
 115      00
 116 0111 4889EF   		movq	%rbp, %rdi
 117 0114 E8000000 		call	_gfortran_transfer_real_write@PLT
 117      00
 118 0119 4889EF   		movq	%rbp, %rdi
 119 011c E8000000 		call	_gfortran_st_write_done@PLT
 119      00
 120 0121 4889EF   		movq	%rbp, %rdi
 121 0124 4C896424 		movq	%r12, 56(%rsp)
 121      38
 122 0129 48895C24 		movq	%rbx, 48(%rsp)
 122      30
 123 012e C7442440 		movl	$11, 64(%rsp)
 123      0B000000 
 124 0136 E8000000 		call	_gfortran_st_write@PLT
 124      00
 125 013b 4889EF   		movq	%rbp, %rdi
 126 013e BA0E0000 		movl	$14, %edx
 126      00
 127 0143 488D3500 		leaq	.LC6(%rip), %rsi
 127      000000
 128 014a E8000000 		call	_gfortran_transfer_character_write@PLT
 128      00
 129 014f 488D7424 		leaq	24(%rsp), %rsi
 129      18
 130 0154 BA080000 		movl	$8, %edx
 130      00
 131 0159 4889EF   		movq	%rbp, %rdi
 132 015c E8000000 		call	_gfortran_transfer_real_write@PLT
 132      00
 133 0161 4889EF   		movq	%rbp, %rdi
 134 0164 E8000000 		call	_gfortran_st_write_done@PLT
 134      00
 135 0169 4889EF   		movq	%rbp, %rdi
 136 016c 4C896424 		movq	%r12, 56(%rsp)
 136      38
 137 0171 48895C24 		movq	%rbx, 48(%rsp)
 137      30
 138 0176 C7442440 		movl	$12, 64(%rsp)
 138      0C000000 
 139 017e E8000000 		call	_gfortran_st_write@PLT
 139      00
 140 0183 4889EF   		movq	%rbp, %rdi
 141 0186 BA0E0000 		movl	$14, %edx
 141      00
 142 018b 488D3500 		leaq	.LC7(%rip), %rsi
 142      000000
 143 0192 E8000000 		call	_gfortran_transfer_character_write@PLT
 143      00
 144 0197 C5FB100D 		vmovsd	.LC2(%rip), %xmm1
 144      00000000 
 145 019f C5FB1044 		vmovsd	8(%rsp), %xmm0
 145      2408
 146 01a5 488D7424 		leaq	40(%rsp), %rsi
 146      28
 147 01aa C5F35CC0 		vsubsd	%xmm0, %xmm1, %xmm0
 148 01ae 4889EF   		movq	%rbp, %rdi
 149 01b1 BA080000 		movl	$8, %edx
 149      00
 150 01b6 C5FB1144 		vmovsd	%xmm0, 40(%rsp)
 150      2428
 151 01bc E8000000 		call	_gfortran_transfer_real_write@PLT
 151      00
 152 01c1 4889EF   		movq	%rbp, %rdi
 153 01c4 E8000000 		call	_gfortran_st_write_done@PLT
 153      00
 154 01c9 4881C440 		addq	$576, %rsp
 154      020000
 155              		.cfi_def_cfa_offset 32
 156 01d0 5B       		popq	%rbx
 157              		.cfi_def_cfa_offset 24
 158 01d1 5D       		popq	%rbp
 159              		.cfi_def_cfa_offset 16
 160 01d2 415C     		popq	%r12
 161              		.cfi_def_cfa_offset 8
 162 01d4 C3       		ret
 163              		.cfi_endproc
 164              	.LFE1:
 166              		.section	.text.startup,"ax",@progbits
 167              		.p2align 4
 168              		.globl	main
 170              	main:
 171              	.LFB2:
 172              		.cfi_startproc
 173 0000 4883EC08 		subq	$8, %rsp
 174              		.cfi_def_cfa_offset 16
 175 0004 E8000000 		call	_gfortran_set_args@PLT
 175      00
 176 0009 488D3500 		leaq	options.3.0(%rip), %rsi
 176      000000
 177 0010 BF070000 		movl	$7, %edi
 177      00
 178 0015 E8000000 		call	_gfortran_set_options@PLT
 178      00
 179 001a E8000000 		call	MAIN__
 179      00
 180 001f 31C0     		xorl	%eax, %eax
 181 0021 4883C408 		addq	$8, %rsp
 182              		.cfi_def_cfa_offset 8
 183 0025 C3       		ret
 184              		.cfi_endproc
 185              	.LFE2:
 187              		.section	.rodata
 188 0008 00000000 		.align 16
 188      00000000 
 191              	options.3.0:
 192 0010 44080000 		.long	2116
 193 0014 FF0F0000 		.long	4095
 194 0018 00000000 		.long	0
 195 001c 01000000 		.long	1
 196 0020 01000000 		.long	1
 197 0024 00000000 		.long	0
 198 0028 1F000000 		.long	31
 199              		.section	.rodata.cst8,"aM",@progbits,8
 200              		.align 8
 201              	.LC0:
 202 0000 00000000 		.long	0
 203 0004 00000000 		.long	0
 204              		.align 8
 205              	.LC1:
 206 0008 00000000 		.long	0
 207 000c 0000F03F 		.long	1072693248
 208              		.align 8
 209              	.LC2:
 210 0010 8039E67A 		.long	2061908352
 211 0014 A651FA3F 		.long	1073369510
 212              		.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
 213              		.section	.note.GNU-stack,"",@progbits
