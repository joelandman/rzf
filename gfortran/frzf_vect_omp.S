   1              		.file	"frzf_vect_omp.f"
   2              		.text
   3              		.section	.rodata.str1.1,"aMS",@progbits,1
   4              	.LC2:
   5 0000 66727A66 		.string	"frzf_vect_omp.f"
   5      5F766563 
   5      745F6F6D 
   5      702E6600 
   6              	.LC3:
   7 0010 20202020 		.string	"    zeta(2) = "
   7      7A657461 
   7      28322920 
   7      3D2000
   8              	.LC4:
   9 001f 70695E32 		.string	"pi^2 / 6.0  = "
   9      202F2036 
   9      2E302020 
   9      3D2000
  10              	.LC5:
  11 002e 20202020 		.string	"      error = "
  11      20206572 
  11      726F7220 
  11      3D2000
  12              		.text
  13              		.p2align 4
  15              	MAIN__:
  16              	.LFB1:
  17              		.cfi_startproc
  18 0000 4155     		pushq	%r13
  19              		.cfi_def_cfa_offset 16
  20              		.cfi_offset 13, -16
  21 0002 31C9     		xorl	%ecx, %ecx
  22 0004 31D2     		xorl	%edx, %edx
  23 0006 4154     		pushq	%r12
  24              		.cfi_def_cfa_offset 24
  25              		.cfi_offset 12, -24
  26 0008 488D3D81 		leaq	MAIN__._omp_fn.0(%rip), %rdi
  26      060000
  27 000f 4C8D2500 		leaq	.LC2(%rip), %r12
  27      000000
  28 0016 55       		pushq	%rbp
  29              		.cfi_def_cfa_offset 32
  30              		.cfi_offset 6, -32
  31 0017 53       		pushq	%rbx
  32              		.cfi_def_cfa_offset 40
  33              		.cfi_offset 3, -40
  34 0018 48BB8000 		movabsq	$25769803904, %rbx
  34      00000600 
  34      0000
  35 0022 4881EC38 		subq	$568, %rsp
  35      020000
  36              		.cfi_def_cfa_offset 608
  37 0029 488B0500 		movq	.LC0(%rip), %rax
  37      000000
  38 0030 488D6C24 		leaq	32(%rsp), %rbp
  38      20
  39 0035 4C8D6C24 		leaq	16(%rsp), %r13
  39      10
  40 003a 4889EE   		movq	%rbp, %rsi
  41 003d 48894424 		movq	%rax, 8(%rsp)
  41      08
  42 0042 48B800A0 		movabsq	$16000000000, %rax
  42      ACB90300 
  42      0000
  43 004c 48894424 		movq	%rax, 40(%rsp)
  43      28
  44 0051 4C896C24 		movq	%r13, 32(%rsp)
  44      20
  45 0056 48C74424 		movq	$0x000000000, 16(%rsp)
  45      10000000 
  45      00
  46 005f E8000000 		call	GOMP_parallel@PLT
  46      00
  47 0064 4889EF   		movq	%rbp, %rdi
  48 0067 4C896424 		movq	%r12, 40(%rsp)
  48      28
  49 006c 48895C24 		movq	%rbx, 32(%rsp)
  49      20
  50 0071 C7442430 		movl	$30, 48(%rsp)
  50      1E000000 
  51 0079 E8000000 		call	_gfortran_st_write@PLT
  51      00
  52 007e 4889EF   		movq	%rbp, %rdi
  53 0081 BA0E0000 		movl	$14, %edx
  53      00
  54 0086 488D3500 		leaq	.LC3(%rip), %rsi
  54      000000
  55 008d E8000000 		call	_gfortran_transfer_character_write@PLT
  55      00
  56 0092 4C89EE   		movq	%r13, %rsi
  57 0095 BA080000 		movl	$8, %edx
  57      00
  58 009a 4889EF   		movq	%rbp, %rdi
  59 009d E8000000 		call	_gfortran_transfer_real_write@PLT
  59      00
  60 00a2 4889EF   		movq	%rbp, %rdi
  61 00a5 E8000000 		call	_gfortran_st_write_done@PLT
  61      00
  62 00aa 4889EF   		movq	%rbp, %rdi
  63 00ad 4C896424 		movq	%r12, 40(%rsp)
  63      28
  64 00b2 48895C24 		movq	%rbx, 32(%rsp)
  64      20
  65 00b7 C7442430 		movl	$31, 48(%rsp)
  65      1F000000 
  66 00bf E8000000 		call	_gfortran_st_write@PLT
  66      00
  67 00c4 4889EF   		movq	%rbp, %rdi
  68 00c7 BA0E0000 		movl	$14, %edx
  68      00
  69 00cc 488D3500 		leaq	.LC4(%rip), %rsi
  69      000000
  70 00d3 E8000000 		call	_gfortran_transfer_character_write@PLT
  70      00
  71 00d8 488D7424 		leaq	8(%rsp), %rsi
  71      08
  72 00dd BA080000 		movl	$8, %edx
  72      00
  73 00e2 4889EF   		movq	%rbp, %rdi
  74 00e5 E8000000 		call	_gfortran_transfer_real_write@PLT
  74      00
  75 00ea 4889EF   		movq	%rbp, %rdi
  76 00ed E8000000 		call	_gfortran_st_write_done@PLT
  76      00
  77 00f2 4889EF   		movq	%rbp, %rdi
  78 00f5 4C896424 		movq	%r12, 40(%rsp)
  78      28
  79 00fa 48895C24 		movq	%rbx, 32(%rsp)
  79      20
  80 00ff C7442430 		movl	$32, 48(%rsp)
  80      20000000 
  81 0107 E8000000 		call	_gfortran_st_write@PLT
  81      00
  82 010c 4889EF   		movq	%rbp, %rdi
  83 010f BA0E0000 		movl	$14, %edx
  83      00
  84 0114 488D3500 		leaq	.LC5(%rip), %rsi
  84      000000
  85 011b E8000000 		call	_gfortran_transfer_character_write@PLT
  85      00
  86 0120 C5FB100D 		vmovsd	.LC0(%rip), %xmm1
  86      00000000 
  87 0128 488D7424 		leaq	24(%rsp), %rsi
  87      18
  88 012d C5F35C44 		vsubsd	16(%rsp), %xmm1, %xmm0
  88      2410
  89 0133 4889EF   		movq	%rbp, %rdi
  90 0136 BA080000 		movl	$8, %edx
  90      00
  91 013b C5FB1144 		vmovsd	%xmm0, 24(%rsp)
  91      2418
  92 0141 E8000000 		call	_gfortran_transfer_real_write@PLT
  92      00
  93 0146 4889EF   		movq	%rbp, %rdi
  94 0149 E8000000 		call	_gfortran_st_write_done@PLT
  94      00
  95 014e 4881C438 		addq	$568, %rsp
  95      020000
  96              		.cfi_def_cfa_offset 40
  97 0155 5B       		popq	%rbx
  98              		.cfi_def_cfa_offset 32
  99 0156 5D       		popq	%rbp
 100              		.cfi_def_cfa_offset 24
 101 0157 415C     		popq	%r12
 102              		.cfi_def_cfa_offset 16
 103 0159 415D     		popq	%r13
 104              		.cfi_def_cfa_offset 8
 105 015b C3       		ret
 106              		.cfi_endproc
 107              	.LFE1:
 109 015c 0F1F4000 		.p2align 4
 110              		.globl	zeta_fixed2_
 112              	zeta_fixed2_:
 113              	.LFB0:
 114              		.cfi_startproc
 115 0160 55       		pushq	%rbp
 116              		.cfi_def_cfa_offset 16
 117              		.cfi_offset 6, -16
 118 0161 4989F0   		movq	%rsi, %r8
 119 0164 C5C857F6 		vxorps	%xmm6, %xmm6, %xmm6
 120 0168 4889E5   		movq	%rsp, %rbp
 121              		.cfi_def_cfa_register 6
 122 016b 4155     		pushq	%r13
 123 016d 4154     		pushq	%r12
 124 016f 53       		pushq	%rbx
 125 0170 4883E4E0 		andq	$-32, %rsp
 126              		.cfi_offset 13, -24
 127              		.cfi_offset 12, -32
 128              		.cfi_offset 3, -40
 129 0174 488B37   		movq	(%rdi), %rsi
 130 0177 4D8B20   		movq	(%r8), %r12
 131 017a C4E1CB2A 		vcvtsi2sdq	%rsi, %xmm6, %xmm0
 131      C6
 132 017f 488D46FF 		leaq	-1(%rsi), %rax
 133 0183 4889F3   		movq	%rsi, %rbx
 134 0186 488D7EFD 		leaq	-3(%rsi), %rdi
 135 018a C4E1F97E 		vmovq	%xmm0, %rcx
 135      C1
 136 018f C4E1CB2A 		vcvtsi2sdq	%rax, %xmm6, %xmm0
 136      C0
 137 0194 488D46FE 		leaq	-2(%rsi), %rax
 138 0198 4C29E3   		subq	%r12, %rbx
 139 019b 4C8B0500 		movq	qsum.3(%rip), %r8
 139      000000
 140 01a2 C4E1F97E 		vmovq	%xmm0, %rdx
 140      C2
 141 01a7 C4E1CB2A 		vcvtsi2sdq	%rax, %xmm6, %xmm0
 141      C0
 142 01ac 4C8B0D00 		movq	8+qsum.3(%rip), %r9
 142      000000
 143 01b3 4C8B1500 		movq	24+qsum.3(%rip), %r10
 143      000000
 144 01ba 48C1EB02 		shrq	$2, %rbx
 145 01be C4E1F97E 		vmovq	%xmm0, %rax
 145      C0
 146 01c3 C4E1CB2A 		vcvtsi2sdq	%rdi, %xmm6, %xmm0
 146      C7
 147 01c8 488B3D00 		movq	16+qsum.3(%rip), %rdi
 147      000000
 148 01cf 4C39E6   		cmpq	%r12, %rsi
 149 01d2 0F8C5304 		jl	.L5
 149      0000
 150 01d8 C57B10D0 		vmovsd	%xmm0, %xmm0, %xmm10
 151 01dc 4C8D6301 		leaq	1(%rbx), %r12
 152 01e0 4883FB02 		cmpq	$2, %rbx
 153 01e4 0F868A04 		jbe	.L13
 153      0000
 154 01ea C5FB102D 		vmovsd	.LC6(%rip), %xmm5
 154      00000000 
 155 01f2 C5FB1005 		vmovsd	.LC7(%rip), %xmm0
 155      00000000 
 156 01fa C5FB100D 		vmovsd	.LC8(%rip), %xmm1
 156      00000000 
 157 0202 C4E1F96E 		vmovq	%rcx, %xmm3
 157      D9
 158 0207 C5635CDD 		vsubsd	%xmm5, %xmm3, %xmm11
 159 020b C5E35CD0 		vsubsd	%xmm0, %xmm3, %xmm2
 160 020f C5E35CD9 		vsubsd	%xmm1, %xmm3, %xmm3
 161 0213 C4E1F96E 		vmovq	%rcx, %xmm4
 161      E1
 162 0218 C4415914 		vunpcklpd	%xmm11, %xmm4, %xmm11
 162      DB
 163 021d C5E914D3 		vunpcklpd	%xmm3, %xmm2, %xmm2
 164 0221 C4E1F96E 		vmovq	%rdx, %xmm4
 164      E2
 165 0226 C4E1F96E 		vmovq	%rax, %xmm7
 165      F8
 166 022b C5DB5CD9 		vsubsd	%xmm1, %xmm4, %xmm3
 167 022f C55B5CCD 		vsubsd	%xmm5, %xmm4, %xmm9
 168 0233 C4632518 		vinsertf128	$0x1, %xmm2, %ymm11, %ymm11
 168      DA01
 169 0239 C5DB5CD0 		vsubsd	%xmm0, %xmm4, %xmm2
 170 023d C5435CC5 		vsubsd	%xmm5, %xmm7, %xmm8
 171 0241 C4415914 		vunpcklpd	%xmm9, %xmm4, %xmm9
 171      C9
 172 0246 C5E914D3 		vunpcklpd	%xmm3, %xmm2, %xmm2
 173 024a C4414114 		vunpcklpd	%xmm8, %xmm7, %xmm8
 173      C0
 174 024f C5C35CD8 		vsubsd	%xmm0, %xmm7, %xmm3
 175 0253 C4633518 		vinsertf128	$0x1, %xmm2, %ymm9, %ymm9
 175      CA01
 176 0259 C5AB5CC0 		vsubsd	%xmm0, %xmm10, %xmm0
 177 025d C5C35CD1 		vsubsd	%xmm1, %xmm7, %xmm2
 178 0261 C5AB5CFD 		vsubsd	%xmm5, %xmm10, %xmm7
 179 0265 C5AB5CC9 		vsubsd	%xmm1, %xmm10, %xmm1
 180 0269 C4410157 		vxorpd	%xmm15, %xmm15, %xmm15
 180      FF
 181 026e 4D89E5   		movq	%r12, %r13
 182 0271 C5FB116C 		vmovsd	%xmm5, -8(%rsp)
 182      24F8
 183 0277 C5E114D2 		vunpcklpd	%xmm2, %xmm3, %xmm2
 184 027b C5F914C1 		vunpcklpd	%xmm1, %xmm0, %xmm0
 185 027f C5A914FF 		vunpcklpd	%xmm7, %xmm10, %xmm7
 186 0283 C5FD282D 		vmovapd	.LC9(%rip), %ymm5
 186      00000000 
 187 028b C5FD2825 		vmovapd	.LC10(%rip), %ymm4
 187      00000000 
 188 0293 49C1ED02 		shrq	$2, %r13
 189 0297 C4633D18 		vinsertf128	$0x1, %xmm2, %ymm8, %ymm8
 189      C201
 190 029d C4E34518 		vinsertf128	$0x1, %xmm0, %ymm7, %ymm7
 190      F801
 191 02a3 31F6     		xorl	%esi, %esi
 192 02a5 C4417D28 		vmovapd	%ymm15, %ymm14
 192      F7
 193 02aa C4417D28 		vmovapd	%ymm15, %ymm13
 193      EF
 194 02af C4417D28 		vmovapd	%ymm15, %ymm12
 194      E7
 195              		.p2align 4,,10
 196 02b4 0F1F4000 		.p2align 3
 197              	.L7:
 198 02b8 C5FD28C7 		vmovapd	%ymm7, %ymm0
 199 02bc C57D29C1 		vmovapd	%ymm8, %ymm1
 200 02c0 C57D29CA 		vmovapd	%ymm9, %ymm2
 201 02c4 C57D29DB 		vmovapd	%ymm11, %ymm3
 202 02c8 C5DD5EDB 		vdivpd	%ymm3, %ymm4, %ymm3
 203 02cc 48FFC6   		incq	%rsi
 204 02cf C5C558FD 		vaddpd	%ymm5, %ymm7, %ymm7
 205 02d3 C53D58C5 		vaddpd	%ymm5, %ymm8, %ymm8
 206 02d7 C53558CD 		vaddpd	%ymm5, %ymm9, %ymm9
 207 02db C52558DD 		vaddpd	%ymm5, %ymm11, %ymm11
 208 02df C5DD5ED2 		vdivpd	%ymm2, %ymm4, %ymm2
 209 02e3 C5E559DB 		vmulpd	%ymm3, %ymm3, %ymm3
 210 02e7 C51D58E3 		vaddpd	%ymm3, %ymm12, %ymm12
 211 02eb C5DD5EC9 		vdivpd	%ymm1, %ymm4, %ymm1
 212 02ef C5ED59D2 		vmulpd	%ymm2, %ymm2, %ymm2
 213 02f3 C51558EA 		vaddpd	%ymm2, %ymm13, %ymm13
 214 02f7 C5DD5EC0 		vdivpd	%ymm0, %ymm4, %ymm0
 215 02fb C5F559C9 		vmulpd	%ymm1, %ymm1, %ymm1
 216 02ff C50D58F1 		vaddpd	%ymm1, %ymm14, %ymm14
 217 0303 C5FD59C0 		vmulpd	%ymm0, %ymm0, %ymm0
 218 0307 C50558F8 		vaddpd	%ymm0, %ymm15, %ymm15
 219 030b 4939F5   		cmpq	%rsi, %r13
 220 030e 75A8     		jne	.L7
 221 0310 C4637D19 		vextractf128	$0x1, %ymm15, %xmm0
 221      F801
 222 0316 C4C17958 		vaddpd	%xmm15, %xmm0, %xmm0
 222      C7
 223 031b C4C1F96E 		vmovq	%r10, %xmm5
 223      EA
 224 0320 4D89E5   		movq	%r12, %r13
 225 0323 C57915F8 		vunpckhpd	%xmm0, %xmm0, %xmm15
 226 0327 C50158F8 		vaddpd	%xmm0, %xmm15, %xmm15
 227 032b C4637D19 		vextractf128	$0x1, %ymm14, %xmm0
 227      F001
 228 0331 C4C17958 		vaddpd	%xmm14, %xmm0, %xmm0
 228      C6
 229 0336 C4C15358 		vaddsd	%xmm15, %xmm5, %xmm5
 229      EF
 230 033b 4983E5FC 		andq	$-4, %r13
 231 033f C57915F0 		vunpckhpd	%xmm0, %xmm0, %xmm14
 232 0343 C50958F0 		vaddpd	%xmm0, %xmm14, %xmm14
 233 0347 C4637D19 		vextractf128	$0x1, %ymm13, %xmm0
 233      E801
 234 034d C4C17958 		vaddpd	%xmm13, %xmm0, %xmm0
 234      C5
 235 0352 C4C1F97E 		vmovq	%xmm5, %r10
 235      EA
 236 0357 C4E1F96E 		vmovq	%rdi, %xmm5
 236      EF
 237 035c C57915E8 		vunpckhpd	%xmm0, %xmm0, %xmm13
 238 0360 C51158E8 		vaddpd	%xmm0, %xmm13, %xmm13
 239 0364 C4637D19 		vextractf128	$0x1, %ymm12, %xmm0
 239      E001
 240 036a C4C17958 		vaddpd	%xmm12, %xmm0, %xmm0
 240      C4
 241 036f C4C15358 		vaddsd	%xmm14, %xmm5, %xmm5
 241      EE
 242 0374 C4C1F96E 		vmovq	%r9, %xmm2
 242      D1
 243 0379 C57915E0 		vunpckhpd	%xmm0, %xmm0, %xmm12
 244 037d C51958E0 		vaddpd	%xmm0, %xmm12, %xmm12
 245 0381 C4C1CB2A 		vcvtsi2sdq	%r13, %xmm6, %xmm0
 245      C5
 246 0386 C4C1F96E 		vmovq	%r8, %xmm3
 246      D8
 247 038b C4C16B58 		vaddsd	%xmm13, %xmm2, %xmm1
 247      CD
 248 0390 C4E1F97E 		vmovq	%xmm5, %rdi
 248      EF
 249 0395 C5FB5905 		vmulsd	.LC11(%rip), %xmm0, %xmm0
 249      00000000 
 250 039d C4C16358 		vaddsd	%xmm12, %xmm3, %xmm5
 250      EC
 251 03a2 C4E1F96E 		vmovq	%rcx, %xmm4
 251      E1
 252 03a7 C4E1F96E 		vmovq	%rdx, %xmm7
 252      FA
 253 03ac C4E1F96E 		vmovq	%rax, %xmm3
 253      D8
 254 03b1 C5C358D0 		vaddsd	%xmm0, %xmm7, %xmm2
 255 03b5 C4C1F97E 		vmovq	%xmm1, %r9
 255      C9
 256 03ba C4C1F97E 		vmovq	%xmm5, %r8
 256      E8
 257 03bf C5DB58C8 		vaddsd	%xmm0, %xmm4, %xmm1
 258 03c3 C5E358E8 		vaddsd	%xmm0, %xmm3, %xmm5
 259 03c7 4889DE   		movq	%rbx, %rsi
 260 03ca C52B58D0 		vaddsd	%xmm0, %xmm10, %xmm10
 261 03ce 4C29EE   		subq	%r13, %rsi
 262 03d1 C4E1F97E 		vmovq	%xmm1, %rcx
 262      C9
 263 03d6 C4E1F97E 		vmovq	%xmm2, %rdx
 263      D2
 264 03db C4E1F97E 		vmovq	%xmm5, %rax
 264      E8
 265 03e0 4D39E5   		cmpq	%r12, %r13
 266 03e3 0F841502 		je	.L8
 266      0000
 267              	.L6:
 268 03e9 4C29EB   		subq	%r13, %rbx
 269 03ec 4D29EC   		subq	%r13, %r12
 270 03ef 4883FB01 		cmpq	$1, %rbx
 271 03f3 0F860C01 		jbe	.L9
 271      0000
 272 03f9 C5FB107C 		vmovsd	-8(%rsp), %xmm7
 272      24F8
 273 03ff C4E1F96E 		vmovq	%rcx, %xmm4
 273      E1
 274 0404 C5DB5CDF 		vsubsd	%xmm7, %xmm4, %xmm3
 275 0408 C4E1F96E 		vmovq	%rdx, %xmm5
 275      EA
 276 040d C5D35CC7 		vsubsd	%xmm7, %xmm5, %xmm0
 277 0411 C5AB5CD7 		vsubsd	%xmm7, %xmm10, %xmm2
 278 0415 C5D914DB 		vunpcklpd	%xmm3, %xmm4, %xmm3
 279 0419 C5F92825 		vmovapd	.LC12(%rip), %xmm4
 279      00000000 
 280 0421 C5D114C0 		vunpcklpd	%xmm0, %xmm5, %xmm0
 281 0425 C5A914D2 		vunpcklpd	%xmm2, %xmm10, %xmm2
 282 0429 C4E1F96E 		vmovq	%rax, %xmm5
 282      E8
 283 042e C5D95ED2 		vdivpd	%xmm2, %xmm4, %xmm2
 284 0432 C5D35CCF 		vsubsd	%xmm7, %xmm5, %xmm1
 285 0436 C4C1F96E 		vmovq	%r10, %xmm7
 285      FA
 286 043b 4C89E3   		movq	%r12, %rbx
 287 043e C5D114C9 		vunpcklpd	%xmm1, %xmm5, %xmm1
 288 0442 4883E3FE 		andq	$-2, %rbx
 289 0446 4829DE   		subq	%rbx, %rsi
 290 0449 C5D95EC9 		vdivpd	%xmm1, %xmm4, %xmm1
 291 044d C5E959D2 		vmulpd	%xmm2, %xmm2, %xmm2
 292 0451 C5D95EC0 		vdivpd	%xmm0, %xmm4, %xmm0
 293 0455 C5F159C9 		vmulpd	%xmm1, %xmm1, %xmm1
 294 0459 C5D95EDB 		vdivpd	%xmm3, %xmm4, %xmm3
 295 045d C5E915E2 		vunpckhpd	%xmm2, %xmm2, %xmm4
 296 0461 C5D958D2 		vaddpd	%xmm2, %xmm4, %xmm2
 297 0465 C5C358E2 		vaddsd	%xmm2, %xmm7, %xmm4
 298 0469 C5F115D1 		vunpckhpd	%xmm1, %xmm1, %xmm2
 299 046d C5E958C9 		vaddpd	%xmm1, %xmm2, %xmm1
 300 0471 C5F959C0 		vmulpd	%xmm0, %xmm0, %xmm0
 301 0475 C4E1F96E 		vmovq	%rdi, %xmm7
 301      FF
 302 047a C4C1F97E 		vmovq	%xmm4, %r10
 302      E2
 303 047f C5C358E1 		vaddsd	%xmm1, %xmm7, %xmm4
 304 0483 C4C1F96E 		vmovq	%r9, %xmm7
 304      F9
 305 0488 C5F915C8 		vunpckhpd	%xmm0, %xmm0, %xmm1
 306 048c C5F158C0 		vaddpd	%xmm0, %xmm1, %xmm0
 307 0490 C4E1F97E 		vmovq	%xmm4, %rdi
 307      E7
 308 0495 C5C358E0 		vaddsd	%xmm0, %xmm7, %xmm4
 309 0499 C4C1F96E 		vmovq	%r8, %xmm7
 309      F8
 310 049e C4C1F97E 		vmovq	%xmm4, %r9
 310      E1
 311 04a3 C5E159DB 		vmulpd	%xmm3, %xmm3, %xmm3
 312 04a7 C5E115C3 		vunpckhpd	%xmm3, %xmm3, %xmm0
 313 04ab C5F958DB 		vaddpd	%xmm3, %xmm0, %xmm3
 314 04af C5C358E3 		vaddsd	%xmm3, %xmm7, %xmm4
 315 04b3 C4C1F97E 		vmovq	%xmm4, %r8
 315      E0
 316 04b8 4885DB   		testq	%rbx, %rbx
 317 04bb 0F889F01 		js	.L10
 317      0000
 318 04c1 C4E1CB2A 		vcvtsi2sdq	%rbx, %xmm6, %xmm6
 318      F3
 319              	.L11:
 320 04c6 C5CB5935 		vmulsd	.LC11(%rip), %xmm6, %xmm6
 320      00000000 
 321 04ce C4E1F96E 		vmovq	%rcx, %xmm7
 321      F9
 322 04d3 C5C358E6 		vaddsd	%xmm6, %xmm7, %xmm4
 323 04d7 C4E1F96E 		vmovq	%rdx, %xmm7
 323      FA
 324 04dc C52B58D6 		vaddsd	%xmm6, %xmm10, %xmm10
 325 04e0 C4E1F97E 		vmovq	%xmm4, %rcx
 325      E1
 326 04e5 C5C358E6 		vaddsd	%xmm6, %xmm7, %xmm4
 327 04e9 C4E1F97E 		vmovq	%xmm4, %rdx
 327      E2
 328 04ee C4E1F96E 		vmovq	%rax, %xmm4
 328      E0
 329 04f3 C5DB58EE 		vaddsd	%xmm6, %xmm4, %xmm5
 330 04f7 C4E1F97E 		vmovq	%xmm5, %rax
 330      E8
 331 04fc 4939DC   		cmpq	%rbx, %r12
 332 04ff 0F84F900 		je	.L8
 332      0000
 333              	.L9:
 334 0505 C5FB101D 		vmovsd	.LC13(%rip), %xmm3
 334      00000000 
 335 050d C4E1F96E 		vmovq	%rcx, %xmm6
 335      F1
 336 0512 C5E35EFE 		vdivsd	%xmm6, %xmm3, %xmm7
 337 0516 C4E1F96E 		vmovq	%rdx, %xmm6
 337      F2
 338 051b C4E1F96E 		vmovq	%rax, %xmm1
 338      C8
 339 0520 C441F96E 		vmovq	%r8, %xmm14
 339      F0
 340 0525 C57B1064 		vmovsd	-8(%rsp), %xmm12
 340      24F8
 341 052b C4E1F96E 		vmovq	%rcx, %xmm2
 341      D1
 342 0530 C461F96E 		vmovq	%rax, %xmm13
 342      E8
 343 0535 C4C16B5C 		vsubsd	%xmm12, %xmm2, %xmm2
 343      D4
 344 053a C4C1135C 		vsubsd	%xmm12, %xmm13, %xmm0
 344      C4
 345 053f C5E35EF6 		vdivsd	%xmm6, %xmm3, %xmm6
 346 0543 C5C359FF 		vmulsd	%xmm7, %xmm7, %xmm7
 347 0547 C58B58FF 		vaddsd	%xmm7, %xmm14, %xmm7
 348 054b C4C1F97E 		vmovq	%xmm7, %r8
 348      F8
 349 0550 C4C1F96E 		vmovq	%r9, %xmm7
 349      F9
 350 0555 C5E35EE9 		vdivsd	%xmm1, %xmm3, %xmm5
 351 0559 C4E1F96E 		vmovq	%rdx, %xmm1
 351      CA
 352 055e C4C1735C 		vsubsd	%xmm12, %xmm1, %xmm1
 352      CC
 353 0563 C5CB59F6 		vmulsd	%xmm6, %xmm6, %xmm6
 354 0567 C5C358F6 		vaddsd	%xmm6, %xmm7, %xmm6
 355 056b C4C1F97E 		vmovq	%xmm6, %r9
 355      F1
 356 0570 C4E1F96E 		vmovq	%rdi, %xmm6
 356      F7
 357 0575 C4C1635E 		vdivsd	%xmm10, %xmm3, %xmm4
 357      E2
 358 057a C4412B5C 		vsubsd	%xmm12, %xmm10, %xmm10
 358      D4
 359 057f C5D359ED 		vmulsd	%xmm5, %xmm5, %xmm5
 360 0583 C5CB58F5 		vaddsd	%xmm5, %xmm6, %xmm6
 361 0587 C4E1F97E 		vmovq	%xmm6, %rdi
 361      F7
 362 058c C4C1F96E 		vmovq	%r10, %xmm6
 362      F2
 363 0591 C5DB59E4 		vmulsd	%xmm4, %xmm4, %xmm4
 364 0595 C5CB58F4 		vaddsd	%xmm4, %xmm6, %xmm6
 365 0599 C4C1F97E 		vmovq	%xmm6, %r10
 365      F2
 366 059e 4885F6   		testq	%rsi, %rsi
 367 05a1 745B     		je	.L8
 368 05a3 C5E35ED2 		vdivsd	%xmm2, %xmm3, %xmm2
 369 05a7 C4C1F96E 		vmovq	%r8, %xmm6
 369      F0
 370 05ac C5E35EC9 		vdivsd	%xmm1, %xmm3, %xmm1
 371 05b0 C5EB59D2 		vmulsd	%xmm2, %xmm2, %xmm2
 372 05b4 C5CB58F2 		vaddsd	%xmm2, %xmm6, %xmm6
 373 05b8 C4C1F97E 		vmovq	%xmm6, %r8
 373      F0
 374 05bd C4C1F96E 		vmovq	%r9, %xmm6
 374      F1
 375 05c2 C5E35EC0 		vdivsd	%xmm0, %xmm3, %xmm0
 376 05c6 C5F359C9 		vmulsd	%xmm1, %xmm1, %xmm1
 377 05ca C5CB58F1 		vaddsd	%xmm1, %xmm6, %xmm6
 378 05ce C4C1F97E 		vmovq	%xmm6, %r9
 378      F1
 379 05d3 C4E1F96E 		vmovq	%rdi, %xmm6
 379      F7
 380 05d8 C441635E 		vdivsd	%xmm10, %xmm3, %xmm10
 380      D2
 381 05dd C5FB59C0 		vmulsd	%xmm0, %xmm0, %xmm0
 382 05e1 C5CB58F0 		vaddsd	%xmm0, %xmm6, %xmm6
 383 05e5 C4E1F97E 		vmovq	%xmm6, %rdi
 383      F7
 384 05ea C4C1F96E 		vmovq	%r10, %xmm6
 384      F2
 385 05ef C4412B59 		vmulsd	%xmm10, %xmm10, %xmm10
 385      D2
 386 05f4 C4C14B58 		vaddsd	%xmm10, %xmm6, %xmm6
 386      F2
 387 05f9 C4C1F97E 		vmovq	%xmm6, %r10
 387      F2
 388              	.L8:
 389 05fe C4E1F96E 		vmovq	%rdi, %xmm6
 389      F7
 390 0603 C4C1F96E 		vmovq	%r10, %xmm7
 390      FA
 391 0608 C5C914C7 		vunpcklpd	%xmm7, %xmm6, %xmm0
 392 060c C4C1F96E 		vmovq	%r9, %xmm5
 392      E9
 393 0611 C4C1F96E 		vmovq	%r8, %xmm6
 393      F0
 394 0616 C5C914CD 		vunpcklpd	%xmm5, %xmm6, %xmm1
 395 061a C4E37518 		vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
 395      C001
 396 0620 C5FD2905 		vmovapd	%ymm0, qsum.3(%rip)
 396      00000000 
 397 0628 C5F877   		vzeroupper
 398              	.L5:
 399 062b C4E1F96E 		vmovq	%rdi, %xmm6
 399      F7
 400 0630 C4C1F96E 		vmovq	%r10, %xmm4
 400      E2
 401 0635 488D65E8 		leaq	-24(%rbp), %rsp
 402 0639 C5CB58C4 		vaddsd	%xmm4, %xmm6, %xmm0
 403 063d C4C1F96E 		vmovq	%r9, %xmm7
 403      F9
 404 0642 C4C1F96E 		vmovq	%r8, %xmm6
 404      F0
 405 0647 5B       		popq	%rbx
 406 0648 C5CB58CF 		vaddsd	%xmm7, %xmm6, %xmm1
 407 064c 415C     		popq	%r12
 408 064e 415D     		popq	%r13
 409 0650 C5FB58C1 		vaddsd	%xmm1, %xmm0, %xmm0
 410 0654 5D       		popq	%rbp
 411              		.cfi_remember_state
 412              		.cfi_def_cfa 7, 8
 413 0655 C3       		ret
 414 0656 662E0F1F 		.p2align 4,,10
 414      84000000 
 414      0000
 415              		.p2align 3
 416              	.L10:
 417              		.cfi_restore_state
 418 0660 4989DD   		movq	%rbx, %r13
 419 0663 49D1ED   		shrq	%r13
 420 0666 C4C1CB2A 		vcvtsi2sdq	%r13, %xmm6, %xmm6
 420      F5
 421 066b C5CB58F6 		vaddsd	%xmm6, %xmm6, %xmm6
 422 066f E952FEFF 		jmp	.L11
 422      FF
 423              	.L13:
 424 0674 C5FB1025 		vmovsd	.LC6(%rip), %xmm4
 424      00000000 
 425 067c 4889DE   		movq	%rbx, %rsi
 426 067f 4531ED   		xorl	%r13d, %r13d
 427 0682 C5FB1164 		vmovsd	%xmm4, -8(%rsp)
 427      24F8
 428 0688 E95CFDFF 		jmp	.L6
 428      FF
 429              		.cfi_endproc
 430              	.LFE0:
 432 068d 0F1F00   		.p2align 4
 434              	MAIN__._omp_fn.0:
 435              	.LFB4:
 436              		.cfi_startproc
 437 0690 4154     		pushq	%r12
 438              		.cfi_def_cfa_offset 16
 439              		.cfi_offset 12, -16
 440 0692 4989FC   		movq	%rdi, %r12
 441 0695 55       		pushq	%rbp
 442              		.cfi_def_cfa_offset 24
 443              		.cfi_offset 6, -24
 444 0696 53       		pushq	%rbx
 445              		.cfi_def_cfa_offset 32
 446              		.cfi_offset 3, -32
 447 0697 4883EC10 		subq	$16, %rsp
 448              		.cfi_def_cfa_offset 48
 449 069b 488B6F08 		movq	8(%rdi), %rbp
 450 069f E8000000 		call	omp_get_thread_num_@PLT
 450      00
 451 06a4 89C3     		movl	%eax, %ebx
 452 06a6 E8000000 		call	omp_get_num_threads_@PLT
 452      00
 453 06ab 4863C8   		movslq	%eax, %rcx
 454 06ae 4889E8   		movq	%rbp, %rax
 455 06b1 4899     		cqto
 456 06b3 48F7F9   		idivq	%rcx
 457 06b6 4863D3   		movslq	%ebx, %rdx
 458 06b9 48FFC2   		incq	%rdx
 459 06bc 488D7424 		leaq	8(%rsp), %rsi
 459      08
 460 06c1 4889E7   		movq	%rsp, %rdi
 461 06c4 480FAFD0 		imulq	%rax, %rdx
 462 06c8 48891424 		movq	%rdx, (%rsp)
 463 06cc 4829C2   		subq	%rax, %rdx
 464 06cf 48FFC2   		incq	%rdx
 465 06d2 48895424 		movq	%rdx, 8(%rsp)
 465      08
 466 06d7 E8000000 		call	zeta_fixed2_
 466      00
 467 06dc 498B0C24 		movq	(%r12), %rcx
 468 06e0 488B11   		movq	(%rcx), %rdx
 469              	.L20:
 470 06e3 C4E1F96E 		vmovq	%rdx, %xmm2
 470      D2
 471 06e8 C5FB58CA 		vaddsd	%xmm2, %xmm0, %xmm1
 472 06ec 4889D0   		movq	%rdx, %rax
 473 06ef C4E1F97E 		vmovq	%xmm1, %rsi
 473      CE
 474 06f4 F0480FB1 		lock cmpxchgq	%rsi, (%rcx)
 474      31
 475 06f9 4839C2   		cmpq	%rax, %rdx
 476 06fc 7509     		jne	.L21
 477 06fe 4883C410 		addq	$16, %rsp
 478              		.cfi_remember_state
 479              		.cfi_def_cfa_offset 32
 480 0702 5B       		popq	%rbx
 481              		.cfi_def_cfa_offset 24
 482 0703 5D       		popq	%rbp
 483              		.cfi_def_cfa_offset 16
 484 0704 415C     		popq	%r12
 485              		.cfi_def_cfa_offset 8
 486 0706 C3       		ret
 487              	.L21:
 488              		.cfi_restore_state
 489 0707 4889C2   		movq	%rax, %rdx
 490 070a EBD7     		jmp	.L20
 491              		.cfi_endproc
 492              	.LFE4:
 494              		.section	.text.startup,"ax",@progbits
 495              		.p2align 4
 496              		.globl	main
 498              	main:
 499              	.LFB2:
 500              		.cfi_startproc
 501 0000 4883EC08 		subq	$8, %rsp
 502              		.cfi_def_cfa_offset 16
 503 0004 E8000000 		call	_gfortran_set_args@PLT
 503      00
 504 0009 488D3500 		leaq	options.10.2(%rip), %rsi
 504      000000
 505 0010 BF070000 		movl	$7, %edi
 505      00
 506 0015 E8000000 		call	_gfortran_set_options@PLT
 506      00
 507 001a E8000000 		call	MAIN__
 507      00
 508 001f 31C0     		xorl	%eax, %eax
 509 0021 4883C408 		addq	$8, %rsp
 510              		.cfi_def_cfa_offset 8
 511 0025 C3       		ret
 512              		.cfi_endproc
 513              	.LFE2:
 515              		.text
 516 070c 0F1F4000 		.p2align 4
 517              		.globl	zeta_
 519              	zeta_:
 520              	.LFB3:
 521              		.cfi_startproc
 522 0710 4C8D5424 		leaq	8(%rsp), %r10
 522      08
 523              		.cfi_def_cfa 10, 0
 524 0715 4883E4E0 		andq	$-32, %rsp
 525 0719 41FF72F8 		pushq	-8(%r10)
 526 071d C5E057DB 		vxorps	%xmm3, %xmm3, %xmm3
 527 0721 55       		pushq	%rbp
 528              		.cfi_escape 0x10,0x6,0x2,0x76,0
 529 0722 4889E5   		movq	%rsp, %rbp
 530 0725 4157     		pushq	%r15
 531 0727 4156     		pushq	%r14
 532 0729 4155     		pushq	%r13
 533 072b 4154     		pushq	%r12
 534 072d 4152     		pushq	%r10
 535              		.cfi_escape 0xf,0x3,0x76,0x58,0x6
 536              		.cfi_escape 0x10,0xf,0x2,0x76,0x78
 537              		.cfi_escape 0x10,0xe,0x2,0x76,0x70
 538              		.cfi_escape 0x10,0xd,0x2,0x76,0x68
 539              		.cfi_escape 0x10,0xc,0x2,0x76,0x60
 540 072f 53       		pushq	%rbx
 541 0730 4883EC40 		subq	$64, %rsp
 542              		.cfi_escape 0x10,0x3,0x2,0x76,0x50
 543 0734 488B07   		movq	(%rdi), %rax
 544 0737 4C8B2500 		movq	qsum.0(%rip), %r12
 544      000000
 545 073e 488D48FF 		leaq	-1(%rax), %rcx
 546 0742 C4E1E32A 		vcvtsi2sdq	%rcx, %xmm3, %xmm4
 546      E1
 547 0747 488D48FE 		leaq	-2(%rax), %rcx
 548 074b C4E1E32A 		vcvtsi2sdq	%rcx, %xmm3, %xmm5
 548      E9
 549 0750 488D48FD 		leaq	-3(%rax), %rcx
 550 0754 C4E1E32A 		vcvtsi2sdq	%rax, %xmm3, %xmm6
 550      F0
 551 0759 C4E1E32A 		vcvtsi2sdq	%rcx, %xmm3, %xmm3
 551      D9
 552 075e 488B0E   		movq	(%rsi), %rcx
 553 0761 4989C7   		movq	%rax, %r15
 554 0764 4929CF   		subq	%rcx, %r15
 555 0767 4C8B3500 		movq	8+qsum.0(%rip), %r14
 555      000000
 556 076e 4C8B2D00 		movq	16+qsum.0(%rip), %r13
 556      000000
 557 0775 C5FB103D 		vmovsd	24+qsum.0(%rip), %xmm7
 557      00000000 
 558 077d 49C1EF02 		shrq	$2, %r15
 559 0781 4839C8   		cmpq	%rcx, %rax
 560 0784 0F8C2D01 		jl	.L26
 560      0000
 561 078a 488B1A   		movq	(%rdx), %rbx
 562 078d C5FB1015 		vmovsd	.LC13(%rip), %xmm2
 562      00000000 
 563 0795 C5FB100D 		vmovsd	.LC6(%rip), %xmm1
 563      00000000 
 564 079d 0F1F00   		.p2align 4,,10
 565              		.p2align 3
 566              	.L27:
 567 07a0 C56B5ED4 		vdivsd	%xmm4, %xmm2, %xmm10
 568 07a4 C5DB5CE1 		vsubsd	%xmm1, %xmm4, %xmm4
 569 07a8 4889DF   		movq	%rbx, %rdi
 570 07ab C5FB117D 		vmovsd	%xmm7, -112(%rbp)
 570      90
 571 07b0 C5FB1165 		vmovsd	%xmm4, -72(%rbp)
 571      B8
 572 07b5 49FFCF   		decq	%r15
 573 07b8 C56B5ECD 		vdivsd	%xmm5, %xmm2, %xmm9
 574 07bc C5D35CE9 		vsubsd	%xmm1, %xmm5, %xmm5
 575 07c0 C5FB116D 		vmovsd	%xmm5, -64(%rbp)
 575      C0
 576 07c5 C57B1155 		vmovsd	%xmm10, -104(%rbp)
 576      98
 577 07ca C56B5EC3 		vdivsd	%xmm3, %xmm2, %xmm8
 578 07ce C5E35CD9 		vsubsd	%xmm1, %xmm3, %xmm3
 579 07d2 C5FB115D 		vmovsd	%xmm3, -56(%rbp)
 579      C8
 580 07d7 C57B114D 		vmovsd	%xmm9, -96(%rbp)
 580      A0
 581 07dc C5EB5EC6 		vdivsd	%xmm6, %xmm2, %xmm0
 582 07e0 C5CB5CF1 		vsubsd	%xmm1, %xmm6, %xmm6
 583 07e4 C5FB1175 		vmovsd	%xmm6, -80(%rbp)
 583      B0
 584 07e9 C57B1145 		vmovsd	%xmm8, -88(%rbp)
 584      A8
 585 07ee E8000000 		call	_gfortran_pow_r8_i8@PLT
 585      00
 586 07f3 C4C1F96E 		vmovq	%r12, %xmm4
 586      E4
 587 07f8 C5DB58F8 		vaddsd	%xmm0, %xmm4, %xmm7
 588 07fc C57B1055 		vmovsd	-104(%rbp), %xmm10
 588      98
 589 0801 4889DF   		movq	%rbx, %rdi
 590 0804 C52B11D0 		vmovsd	%xmm10, %xmm10, %xmm0
 591 0808 C4C1F97E 		vmovq	%xmm7, %r12
 591      FC
 592 080d E8000000 		call	_gfortran_pow_r8_i8@PLT
 592      00
 593 0812 C4C1F96E 		vmovq	%r14, %xmm6
 593      F6
 594 0817 C5CB58E8 		vaddsd	%xmm0, %xmm6, %xmm5
 595 081b C57B104D 		vmovsd	-96(%rbp), %xmm9
 595      A0
 596 0820 4889DF   		movq	%rbx, %rdi
 597 0823 C53311C8 		vmovsd	%xmm9, %xmm9, %xmm0
 598 0827 C4C1F97E 		vmovq	%xmm5, %r14
 598      EE
 599 082c E8000000 		call	_gfortran_pow_r8_i8@PLT
 599      00
 600 0831 C4C1F96E 		vmovq	%r13, %xmm3
 600      DD
 601 0836 C5E358F8 		vaddsd	%xmm0, %xmm3, %xmm7
 602 083a C57B1045 		vmovsd	-88(%rbp), %xmm8
 602      A8
 603 083f 4889DF   		movq	%rbx, %rdi
 604 0842 C53B11C0 		vmovsd	%xmm8, %xmm8, %xmm0
 605 0846 C4C1F97E 		vmovq	%xmm7, %r13
 605      FD
 606 084b E8000000 		call	_gfortran_pow_r8_i8@PLT
 606      00
 607 0850 488B0500 		movq	.LC6(%rip), %rax
 607      000000
 608 0857 C5FB107D 		vmovsd	-112(%rbp), %xmm7
 608      90
 609 085c C4E1F96E 		vmovq	%rax, %xmm1
 609      C8
 610 0861 488B0500 		movq	.LC13(%rip), %rax
 610      000000
 611 0868 4983FFFF 		cmpq	$-1, %r15
 612 086c C5C358F8 		vaddsd	%xmm0, %xmm7, %xmm7
 613 0870 C5FB105D 		vmovsd	-56(%rbp), %xmm3
 613      C8
 614 0875 C5FB106D 		vmovsd	-64(%rbp), %xmm5
 614      C0
 615 087a C5FB1065 		vmovsd	-72(%rbp), %xmm4
 615      B8
 616 087f C5FB1075 		vmovsd	-80(%rbp), %xmm6
 616      B0
 617 0884 C4E1F96E 		vmovq	%rax, %xmm2
 617      D0
 618 0889 0F8511FF 		jne	.L27
 618      FFFF
 619 088f C4C1F96E 		vmovq	%r13, %xmm2
 619      D5
 620 0894 C5E914C7 		vunpcklpd	%xmm7, %xmm2, %xmm0
 621 0898 C4C1F96E 		vmovq	%r12, %xmm1
 621      CC
 622 089d C4C1F96E 		vmovq	%r14, %xmm2
 622      D6
 623 08a2 C5F114CA 		vunpcklpd	%xmm2, %xmm1, %xmm1
 624 08a6 C4E37518 		vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
 624      C001
 625 08ac C5FD2905 		vmovapd	%ymm0, qsum.0(%rip)
 625      00000000 
 626 08b4 C5F877   		vzeroupper
 627              	.L26:
 628 08b7 4883C440 		addq	$64, %rsp
 629 08bb 5B       		popq	%rbx
 630 08bc 415A     		popq	%r10
 631              		.cfi_def_cfa 10, 0
 632 08be C4C1F96E 		vmovq	%r12, %xmm1
 632      CC
 633 08c3 C4C1F96E 		vmovq	%r14, %xmm2
 633      D6
 634 08c8 415C     		popq	%r12
 635 08ca C5F358C2 		vaddsd	%xmm2, %xmm1, %xmm0
 636 08ce C4C1F96E 		vmovq	%r13, %xmm1
 636      CD
 637 08d3 C5F358FF 		vaddsd	%xmm7, %xmm1, %xmm7
 638 08d7 415D     		popq	%r13
 639 08d9 415E     		popq	%r14
 640 08db 415F     		popq	%r15
 641 08dd C5FB58C7 		vaddsd	%xmm7, %xmm0, %xmm0
 642 08e1 5D       		popq	%rbp
 643 08e2 498D62F8 		leaq	-8(%r10), %rsp
 644              		.cfi_def_cfa 7, 8
 645 08e6 C3       		ret
 646              		.cfi_endproc
 647              	.LFE3:
 649              		.local	qsum.0
 650              		.comm	qsum.0,32,32
 651              		.section	.rodata
 652              		.align 16
 655              	options.10.2:
 656 0000 44080000 		.long	2116
 657 0004 FF0F0000 		.long	4095
 658 0008 00000000 		.long	0
 659 000c 01000000 		.long	1
 660 0010 01000000 		.long	1
 661 0014 00000000 		.long	0
 662 0018 1F000000 		.long	31
 663              		.local	qsum.3
 664              		.comm	qsum.3,32,32
 665              		.section	.rodata.cst8,"aM",@progbits,8
 666              		.align 8
 667              	.LC0:
 668 0000 D2075362 		.long	1649608658
 669 0004 A651FA3F 		.long	1073369510
 670              		.align 8
 671              	.LC6:
 672 0008 00000000 		.long	0
 673 000c 00001040 		.long	1074790400
 674              		.align 8
 675              	.LC7:
 676 0010 00000000 		.long	0
 677 0014 00002040 		.long	1075838976
 678              		.align 8
 679              	.LC8:
 680 0018 00000000 		.long	0
 681 001c 00002840 		.long	1076363264
 682              		.section	.rodata.cst32,"aM",@progbits,32
 683              		.align 32
 684              	.LC9:
 685 0000 00000000 		.long	0
 686 0004 000030C0 		.long	-1070596096
 687 0008 00000000 		.long	0
 688 000c 000030C0 		.long	-1070596096
 689 0010 00000000 		.long	0
 690 0014 000030C0 		.long	-1070596096
 691 0018 00000000 		.long	0
 692 001c 000030C0 		.long	-1070596096
 693              		.align 32
 694              	.LC10:
 695 0020 00000000 		.long	0
 696 0024 0000F03F 		.long	1072693248
 697 0028 00000000 		.long	0
 698 002c 0000F03F 		.long	1072693248
 699 0030 00000000 		.long	0
 700 0034 0000F03F 		.long	1072693248
 701 0038 00000000 		.long	0
 702 003c 0000F03F 		.long	1072693248
 703              		.section	.rodata.cst8
 704              		.align 8
 705              	.LC11:
 706 0020 00000000 		.long	0
 707 0024 000010C0 		.long	-1072693248
 708              		.section	.rodata.cst16,"aM",@progbits,16
 709              		.align 16
 710              	.LC12:
 711 0000 00000000 		.long	0
 712 0004 0000F03F 		.long	1072693248
 713 0008 00000000 		.long	0
 714 000c 0000F03F 		.long	1072693248
 715              		.section	.rodata.cst8
 716              		.align 8
 717              	.LC13:
 718 0028 00000000 		.long	0
 719 002c 0000F03F 		.long	1072693248
 720              		.ident	"GCC: (Ubuntu 10.2.0-5ubuntu1~20.04) 10.2.0"
 721              		.section	.note.GNU-stack,"",@progbits
