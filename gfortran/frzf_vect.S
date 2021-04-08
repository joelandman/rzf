   1              		.file	"frzf_vect.f"
   2              		.text
   3              		.p2align 4
   4              		.globl	zeta_
   6              	zeta_:
   7              	.LFB0:
   8              		.cfi_startproc
   9 0000 4C8D5424 		leaq	8(%rsp), %r10
   9      08
  10              		.cfi_def_cfa 10, 0
  11 0005 4883E4E0 		andq	$-32, %rsp
  12 0009 41FF72F8 		pushq	-8(%r10)
  13 000d C5C157FF 		vxorpd	%xmm7, %xmm7, %xmm7
  14 0011 55       		pushq	%rbp
  15              		.cfi_escape 0x10,0x6,0x2,0x76,0
  16 0012 4889E5   		movq	%rsp, %rbp
  17 0015 4157     		pushq	%r15
  18 0017 4156     		pushq	%r14
  19 0019 4155     		pushq	%r13
  20 001b 4154     		pushq	%r12
  21 001d 4152     		pushq	%r10
  22              		.cfi_escape 0xf,0x3,0x76,0x58,0x6
  23              		.cfi_escape 0x10,0xf,0x2,0x76,0x78
  24              		.cfi_escape 0x10,0xe,0x2,0x76,0x70
  25              		.cfi_escape 0x10,0xd,0x2,0x76,0x68
  26              		.cfi_escape 0x10,0xc,0x2,0x76,0x60
  27 001f 53       		pushq	%rbx
  28 0020 4883EC60 		subq	$96, %rsp
  29              		.cfi_escape 0x10,0x3,0x2,0x76,0x50
  30 0024 488B1F   		movq	(%rdi), %rbx
  31 0027 4C8B26   		movq	(%rsi), %r12
  32 002a 4989DF   		movq	%rbx, %r15
  33 002d 4983E7FC 		andq	$-4, %r15
  34 0031 48FFCB   		decq	%rbx
  35 0034 C5FB100D 		vmovsd	.LC1(%rip), %xmm1
  35      00000000 
  36 003c C5FB117D 		vmovsd	%xmm7, -64(%rbp)
  36      C0
  37 0041 4939DF   		cmpq	%rbx, %r15
  38 0044 7D3D     		jge	.L5
  39 0046 662E0F1F 		.p2align 4,,10
  39      84000000 
  39      0000
  40              		.p2align 3
  41              	.L2:
  42 0050 C5E157DB 		vxorpd	%xmm3, %xmm3, %xmm3
  43 0054 C4E1E32A 		vcvtsi2sdq	%rbx, %xmm3, %xmm0
  43      C3
  44 0059 4C89E7   		movq	%r12, %rdi
  45 005c 48FFCB   		decq	%rbx
  46 005f C5F35EC0 		vdivsd	%xmm0, %xmm1, %xmm0
  47 0063 E8000000 		call	_gfortran_pow_r8_i8@PLT
  47      00
  48 0068 C5FB5865 		vaddsd	-64(%rbp), %xmm0, %xmm4
  48      C0
  49 006d 488B0500 		movq	.LC1(%rip), %rax
  49      000000
  50 0074 4939DF   		cmpq	%rbx, %r15
  51 0077 C5FB1165 		vmovsd	%xmm4, -64(%rbp)
  51      C0
  52 007c C4E1F96E 		vmovq	%rax, %xmm1
  52      C8
  53 0081 75CD     		jne	.L2
  54              	.L5:
  55 0083 C5C957F6 		vxorpd	%xmm6, %xmm6, %xmm6
  56 0087 498D47FF 		leaq	-1(%r15), %rax
  57 008b C4E1CB2A 		vcvtsi2sdq	%rax, %xmm6, %xmm4
  57      E0
  58 0090 498D47FE 		leaq	-2(%r15), %rax
  59 0094 C4E1CB2A 		vcvtsi2sdq	%rax, %xmm6, %xmm3
  59      D8
  60 0099 498D47FD 		leaq	-3(%r15), %rax
  61 009d C5FB103D 		vmovsd	8+qsum.1(%rip), %xmm7
  61      00000000 
  62 00a5 C4C1CB2A 		vcvtsi2sdq	%r15, %xmm6, %xmm5
  62      EF
  63 00aa C4E1CB2A 		vcvtsi2sdq	%rax, %xmm6, %xmm6
  63      F0
  64 00af 498D47F8 		leaq	-8(%r15), %rax
  65 00b3 48C1E802 		shrq	$2, %rax
  66 00b7 C5FB117D 		vmovsd	%xmm7, -56(%rbp)
  66      C8
  67 00bc 4C8B3500 		movq	qsum.1(%rip), %r14
  67      000000
  68 00c3 4C8B2D00 		movq	16+qsum.1(%rip), %r13
  68      000000
  69 00ca C5FB103D 		vmovsd	24+qsum.1(%rip), %xmm7
  69      00000000 
  70 00d2 4889C3   		movq	%rax, %rbx
  71 00d5 4983FF07 		cmpq	$7, %r15
  72 00d9 0F8E2001 		jle	.L3
  72      0000
  73 00df C5FB1015 		vmovsd	.LC2(%rip), %xmm2
  73      00000000 
  74 00e7 C4C1F97E 		vmovq	%xmm7, %r15
  74      FF
  75 00ec 0F1F4000 		.p2align 4,,10
  76              		.p2align 3
  77              	.L4:
  78 00f0 C5735ED4 		vdivsd	%xmm4, %xmm1, %xmm10
  79 00f4 C5DB5CE2 		vsubsd	%xmm2, %xmm4, %xmm4
  80 00f8 4C89E7   		movq	%r12, %rdi
  81 00fb 48FFCB   		decq	%rbx
  82 00fe C5FB1165 		vmovsd	%xmm4, -88(%rbp)
  82      A8
  83 0103 C5735ECB 		vdivsd	%xmm3, %xmm1, %xmm9
  84 0107 C5E35CDA 		vsubsd	%xmm2, %xmm3, %xmm3
  85 010b C5FB115D 		vmovsd	%xmm3, -80(%rbp)
  85      B0
  86 0110 C57B1155 		vmovsd	%xmm10, -120(%rbp)
  86      88
  87 0115 C5735EC6 		vdivsd	%xmm6, %xmm1, %xmm8
  88 0119 C5CB5CF2 		vsubsd	%xmm2, %xmm6, %xmm6
  89 011d C5FB1175 		vmovsd	%xmm6, -72(%rbp)
  89      B8
  90 0122 C57B114D 		vmovsd	%xmm9, -112(%rbp)
  90      90
  91 0127 C5F35EC5 		vdivsd	%xmm5, %xmm1, %xmm0
  92 012b C5D35CEA 		vsubsd	%xmm2, %xmm5, %xmm5
  93 012f C5FB116D 		vmovsd	%xmm5, -96(%rbp)
  93      A0
  94 0134 C57B1145 		vmovsd	%xmm8, -104(%rbp)
  94      98
  95 0139 E8000000 		call	_gfortran_pow_r8_i8@PLT
  95      00
  96 013e C4C1F96E 		vmovq	%r14, %xmm7
  96      FE
  97 0143 C5C358F8 		vaddsd	%xmm0, %xmm7, %xmm7
  98 0147 C57B1055 		vmovsd	-120(%rbp), %xmm10
  98      88
  99 014c 4C89E7   		movq	%r12, %rdi
 100 014f C52B11D0 		vmovsd	%xmm10, %xmm10, %xmm0
 101 0153 C4C1F97E 		vmovq	%xmm7, %r14
 101      FE
 102 0158 E8000000 		call	_gfortran_pow_r8_i8@PLT
 102      00
 103 015d C5FB585D 		vaddsd	-56(%rbp), %xmm0, %xmm3
 103      C8
 104 0162 C57B104D 		vmovsd	-112(%rbp), %xmm9
 104      90
 105 0167 4C89E7   		movq	%r12, %rdi
 106 016a C53311C8 		vmovsd	%xmm9, %xmm9, %xmm0
 107 016e C5FB115D 		vmovsd	%xmm3, -56(%rbp)
 107      C8
 108 0173 E8000000 		call	_gfortran_pow_r8_i8@PLT
 108      00
 109 0178 C4C1F96E 		vmovq	%r13, %xmm6
 109      F5
 110 017d C5CB58E8 		vaddsd	%xmm0, %xmm6, %xmm5
 111 0181 C57B1045 		vmovsd	-104(%rbp), %xmm8
 111      98
 112 0186 4C89E7   		movq	%r12, %rdi
 113 0189 C53B11C0 		vmovsd	%xmm8, %xmm8, %xmm0
 114 018d C4C1F97E 		vmovq	%xmm5, %r13
 114      ED
 115 0192 E8000000 		call	_gfortran_pow_r8_i8@PLT
 115      00
 116 0197 C4C1F96E 		vmovq	%r15, %xmm2
 116      D7
 117 019c 488B0500 		movq	.LC2(%rip), %rax
 117      000000
 118 01a3 C5FB58FA 		vaddsd	%xmm2, %xmm0, %xmm7
 119 01a7 C4E1F96E 		vmovq	%rax, %xmm2
 119      D0
 120 01ac 488B0500 		movq	.LC1(%rip), %rax
 120      000000
 121 01b3 4883FBFF 		cmpq	$-1, %rbx
 122 01b7 C5FB1075 		vmovsd	-72(%rbp), %xmm6
 122      B8
 123 01bc C5FB105D 		vmovsd	-80(%rbp), %xmm3
 123      B0
 124 01c1 C5FB1065 		vmovsd	-88(%rbp), %xmm4
 124      A8
 125 01c6 C5FB106D 		vmovsd	-96(%rbp), %xmm5
 125      A0
 126 01cb C4C1F97E 		vmovq	%xmm7, %r15
 126      FF
 127 01d0 C4E1F96E 		vmovq	%rax, %xmm1
 127      C8
 128 01d5 0F8515FF 		jne	.L4
 128      FFFF
 129 01db C4C1F96E 		vmovq	%r13, %xmm2
 129      D5
 130 01e0 C4C1F96E 		vmovq	%r14, %xmm3
 130      DE
 131 01e5 C5E914C7 		vunpcklpd	%xmm7, %xmm2, %xmm0
 132 01e9 C5E11655 		vmovhpd	-56(%rbp), %xmm3, %xmm2
 132      C8
 133 01ee C4E36D18 		vinsertf128	$0x1, %xmm0, %ymm2, %ymm0
 133      C001
 134 01f4 C5FD2905 		vmovapd	%ymm0, qsum.1(%rip)
 134      00000000 
 135 01fc C5F877   		vzeroupper
 136              	.L3:
 137 01ff C4C1F96E 		vmovq	%r14, %xmm4
 137      E6
 138 0204 C4C1F96E 		vmovq	%r13, %xmm5
 138      ED
 139 0209 C5D35845 		vaddsd	-56(%rbp), %xmm5, %xmm0
 139      C8
 140 020e C5C358FC 		vaddsd	%xmm4, %xmm7, %xmm7
 141 0212 4C89E7   		movq	%r12, %rdi
 142 0215 C5C358F8 		vaddsd	%xmm0, %xmm7, %xmm7
 143 0219 C5FB1005 		vmovsd	.LC3(%rip), %xmm0
 143      00000000 
 144 0221 C4E1F97E 		vmovq	%xmm7, %rbx
 144      FB
 145 0226 E8000000 		call	_gfortran_pow_r8_i8@PLT
 145      00
 146 022b C4C1F97E 		vmovq	%xmm0, %r13
 146      C5
 147 0230 C5FB1005 		vmovsd	.LC4(%rip), %xmm0
 147      00000000 
 148 0238 4C89E7   		movq	%r12, %rdi
 149 023b E8000000 		call	_gfortran_pow_r8_i8@PLT
 149      00
 150 0240 C4C1F96E 		vmovq	%r13, %xmm7
 150      FD
 151 0245 C5FB58C7 		vaddsd	%xmm7, %xmm0, %xmm0
 152 0249 C4E1F96E 		vmovq	%rbx, %xmm7
 152      FB
 153 024e 4C89E7   		movq	%r12, %rdi
 154 0251 C5FB5845 		vaddsd	-64(%rbp), %xmm0, %xmm0
 154      C0
 155 0256 C5FB58FF 		vaddsd	%xmm7, %xmm0, %xmm7
 156 025a C5FB1005 		vmovsd	.LC5(%rip), %xmm0
 156      00000000 
 157 0262 C4E1F97E 		vmovq	%xmm7, %rbx
 157      FB
 158 0267 E8000000 		call	_gfortran_pow_r8_i8@PLT
 158      00
 159 026c 488B0500 		movq	.LC1(%rip), %rax
 159      000000
 160 0273 C4C1F97E 		vmovq	%xmm0, %r13
 160      C5
 161 0278 4C89E7   		movq	%r12, %rdi
 162 027b C4E1F96E 		vmovq	%rax, %xmm0
 162      C0
 163 0280 E8000000 		call	_gfortran_pow_r8_i8@PLT
 163      00
 164 0285 4883C460 		addq	$96, %rsp
 165 0289 C4C1F96E 		vmovq	%r13, %xmm7
 165      FD
 166 028e C5FB58C7 		vaddsd	%xmm7, %xmm0, %xmm0
 167 0292 C4E1F96E 		vmovq	%rbx, %xmm7
 167      FB
 168 0297 5B       		popq	%rbx
 169 0298 415A     		popq	%r10
 170              		.cfi_def_cfa 10, 0
 171 029a 415C     		popq	%r12
 172 029c 415D     		popq	%r13
 173 029e 415E     		popq	%r14
 174 02a0 415F     		popq	%r15
 175 02a2 C5FB58C7 		vaddsd	%xmm7, %xmm0, %xmm0
 176 02a6 5D       		popq	%rbp
 177 02a7 498D62F8 		leaq	-8(%r10), %rsp
 178              		.cfi_def_cfa 7, 8
 179 02ab C3       		ret
 180              		.cfi_endproc
 181              	.LFE0:
 183              		.section	.rodata
 184              		.align 8
 185              	.LC7:
 186 0000 02000000 		.quad	2
 186      00000000 
 187              		.section	.rodata.str1.1,"aMS",@progbits,1
 188              	.LC8:
 189 0000 66727A66 		.string	"frzf_vect.f"
 189      5F766563 
 189      742E6600 
 190              	.LC9:
 191 000c 20202020 		.string	"    zeta(2) = "
 191      7A657461 
 191      28322920 
 191      3D2000
 192              	.LC10:
 193 001b 70695E32 		.string	"pi^2 / 6.0  = "
 193      202F2036 
 193      2E302020 
 193      3D2000
 194              	.LC11:
 195 002a 20202020 		.string	"      error = "
 195      20206572 
 195      726F7220 
 195      3D2000
 196              		.text
 197 02ac 0F1F4000 		.p2align 4
 199              	MAIN__:
 200              	.LFB1:
 201              		.cfi_startproc
 202 02b0 4154     		pushq	%r12
 203              		.cfi_def_cfa_offset 16
 204              		.cfi_offset 12, -16
 205 02b2 488D3500 		leaq	.LC7(%rip), %rsi
 205      000000
 206 02b9 4C8D2500 		leaq	.LC8(%rip), %r12
 206      000000
 207 02c0 55       		pushq	%rbp
 208              		.cfi_def_cfa_offset 24
 209              		.cfi_offset 6, -24
 210 02c1 53       		pushq	%rbx
 211              		.cfi_def_cfa_offset 32
 212              		.cfi_offset 3, -32
 213 02c2 48BB8000 		movabsq	$25769803904, %rbx
 213      00000600 
 213      0000
 214 02cc 4881EC40 		subq	$576, %rsp
 214      020000
 215              		.cfi_def_cfa_offset 608
 216 02d3 488B0500 		movq	.LC6(%rip), %rax
 216      000000
 217 02da 488D6C24 		leaq	48(%rsp), %rbp
 217      30
 218 02df 48894424 		movq	%rax, 24(%rsp)
 218      18
 219 02e4 488D7C24 		leaq	16(%rsp), %rdi
 219      10
 220 02e9 48B800A0 		movabsq	$16000000000, %rax
 220      ACB90300 
 220      0000
 221 02f3 48894424 		movq	%rax, 16(%rsp)
 221      10
 222 02f8 E8000000 		call	zeta_
 222      00
 223 02fd 4889EF   		movq	%rbp, %rdi
 224 0300 C5FB1144 		vmovsd	%xmm0, 32(%rsp)
 224      2420
 225 0306 C5FB1144 		vmovsd	%xmm0, 8(%rsp)
 225      2408
 226 030c 4C896424 		movq	%r12, 56(%rsp)
 226      38
 227 0311 48895C24 		movq	%rbx, 48(%rsp)
 227      30
 228 0316 C7442440 		movl	$10, 64(%rsp)
 228      0A000000 
 229 031e E8000000 		call	_gfortran_st_write@PLT
 229      00
 230 0323 4889EF   		movq	%rbp, %rdi
 231 0326 BA0E0000 		movl	$14, %edx
 231      00
 232 032b 488D3500 		leaq	.LC9(%rip), %rsi
 232      000000
 233 0332 E8000000 		call	_gfortran_transfer_character_write@PLT
 233      00
 234 0337 488D7424 		leaq	32(%rsp), %rsi
 234      20
 235 033c BA080000 		movl	$8, %edx
 235      00
 236 0341 4889EF   		movq	%rbp, %rdi
 237 0344 E8000000 		call	_gfortran_transfer_real_write@PLT
 237      00
 238 0349 4889EF   		movq	%rbp, %rdi
 239 034c E8000000 		call	_gfortran_st_write_done@PLT
 239      00
 240 0351 4889EF   		movq	%rbp, %rdi
 241 0354 4C896424 		movq	%r12, 56(%rsp)
 241      38
 242 0359 48895C24 		movq	%rbx, 48(%rsp)
 242      30
 243 035e C7442440 		movl	$11, 64(%rsp)
 243      0B000000 
 244 0366 E8000000 		call	_gfortran_st_write@PLT
 244      00
 245 036b 4889EF   		movq	%rbp, %rdi
 246 036e BA0E0000 		movl	$14, %edx
 246      00
 247 0373 488D3500 		leaq	.LC10(%rip), %rsi
 247      000000
 248 037a E8000000 		call	_gfortran_transfer_character_write@PLT
 248      00
 249 037f 488D7424 		leaq	24(%rsp), %rsi
 249      18
 250 0384 BA080000 		movl	$8, %edx
 250      00
 251 0389 4889EF   		movq	%rbp, %rdi
 252 038c E8000000 		call	_gfortran_transfer_real_write@PLT
 252      00
 253 0391 4889EF   		movq	%rbp, %rdi
 254 0394 E8000000 		call	_gfortran_st_write_done@PLT
 254      00
 255 0399 4889EF   		movq	%rbp, %rdi
 256 039c 4C896424 		movq	%r12, 56(%rsp)
 256      38
 257 03a1 48895C24 		movq	%rbx, 48(%rsp)
 257      30
 258 03a6 C7442440 		movl	$12, 64(%rsp)
 258      0C000000 
 259 03ae E8000000 		call	_gfortran_st_write@PLT
 259      00
 260 03b3 4889EF   		movq	%rbp, %rdi
 261 03b6 BA0E0000 		movl	$14, %edx
 261      00
 262 03bb 488D3500 		leaq	.LC11(%rip), %rsi
 262      000000
 263 03c2 E8000000 		call	_gfortran_transfer_character_write@PLT
 263      00
 264 03c7 C5FB100D 		vmovsd	.LC6(%rip), %xmm1
 264      00000000 
 265 03cf C5FB1044 		vmovsd	8(%rsp), %xmm0
 265      2408
 266 03d5 488D7424 		leaq	40(%rsp), %rsi
 266      28
 267 03da C5F35CC0 		vsubsd	%xmm0, %xmm1, %xmm0
 268 03de 4889EF   		movq	%rbp, %rdi
 269 03e1 BA080000 		movl	$8, %edx
 269      00
 270 03e6 C5FB1144 		vmovsd	%xmm0, 40(%rsp)
 270      2428
 271 03ec E8000000 		call	_gfortran_transfer_real_write@PLT
 271      00
 272 03f1 4889EF   		movq	%rbp, %rdi
 273 03f4 E8000000 		call	_gfortran_st_write_done@PLT
 273      00
 274 03f9 4881C440 		addq	$576, %rsp
 274      020000
 275              		.cfi_def_cfa_offset 32
 276 0400 5B       		popq	%rbx
 277              		.cfi_def_cfa_offset 24
 278 0401 5D       		popq	%rbp
 279              		.cfi_def_cfa_offset 16
 280 0402 415C     		popq	%r12
 281              		.cfi_def_cfa_offset 8
 282 0404 C3       		ret
 283              		.cfi_endproc
 284              	.LFE1:
 286              		.section	.text.startup,"ax",@progbits
 287              		.p2align 4
 288              		.globl	main
 290              	main:
 291              	.LFB2:
 292              		.cfi_startproc
 293 0000 4883EC08 		subq	$8, %rsp
 294              		.cfi_def_cfa_offset 16
 295 0004 E8000000 		call	_gfortran_set_args@PLT
 295      00
 296 0009 488D3500 		leaq	options.10.0(%rip), %rsi
 296      000000
 297 0010 BF070000 		movl	$7, %edi
 297      00
 298 0015 E8000000 		call	_gfortran_set_options@PLT
 298      00
 299 001a E8000000 		call	MAIN__
 299      00
 300 001f 31C0     		xorl	%eax, %eax
 301 0021 4883C408 		addq	$8, %rsp
 302              		.cfi_def_cfa_offset 8
 303 0025 C3       		ret
 304              		.cfi_endproc
 305              	.LFE2:
 307              		.section	.rodata
 308 0008 00000000 		.align 16
 308      00000000 
 311              	options.10.0:
 312 0010 44080000 		.long	2116
 313 0014 FF0F0000 		.long	4095
 314 0018 00000000 		.long	0
 315 001c 01000000 		.long	1
 316 0020 01000000 		.long	1
 317 0024 00000000 		.long	0
 318 0028 1F000000 		.long	31
 319              		.local	qsum.1
 320              		.comm	qsum.1,32,32
 321              		.section	.rodata.cst8,"aM",@progbits,8
 322              		.align 8
 323              	.LC1:
 324 0000 00000000 		.long	0
 325 0004 0000F03F 		.long	1072693248
 326              		.align 8
 327              	.LC2:
 328 0008 00000000 		.long	0
 329 000c 00001040 		.long	1074790400
 330              		.align 8
 331              	.LC3:
 332 0010 00000000 		.long	0
 333 0014 0000D03F 		.long	1070596096
 334              		.align 8
 335              	.LC4:
 336 0018 55555555 		.long	1431655765
 337 001c 5555D53F 		.long	1070945621
 338              		.align 8
 339              	.LC5:
 340 0020 00000000 		.long	0
 341 0024 0000E03F 		.long	1071644672
 342              		.align 8
 343              	.LC6:
 344 0028 8039E67A 		.long	2061908352
 345 002c A651FA3F 		.long	1073369510
 346              		.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
 347              		.section	.note.GNU-stack,"",@progbits
