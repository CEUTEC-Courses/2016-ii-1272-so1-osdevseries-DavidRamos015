; Listing generated by Microsoft (R) Optimizing Compiler Version 15.00.30729.01 

	TITLE	c:\Users\so1\Desktop\OS Development series 14 - 19\Tutorial 17\SysCore\Kernel\main.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	??_C@_0BA@BJOBDCJI@ACPI?5NVS?5Memory?$AA@	; `string'
PUBLIC	??_C@_0N@EHGNOCNM@ACPI?5Reclaim?$AA@		; `string'
PUBLIC	??_C@_08NKCLJDKG@Reserved?$AA@			; `string'
PUBLIC	??_C@_09PPNHOLKJ@Available?$AA@			; `string'
PUBLIC	?strMemoryTypes@@3PAPADA			; strMemoryTypes
_DATA	SEGMENT
?strMemoryTypes@@3PAPADA DD FLAT:??_C@_09PPNHOLKJ@Available?$AA@ ; strMemoryTypes
	DD	FLAT:??_C@_08NKCLJDKG@Reserved?$AA@
	DD	FLAT:??_C@_0N@EHGNOCNM@ACPI?5Reclaim?$AA@
	DD	FLAT:??_C@_0BA@BJOBDCJI@ACPI?5NVS?5Memory?$AA@
_DATA	ENDS
;	COMDAT ??_C@_0BA@BJOBDCJI@ACPI?5NVS?5Memory?$AA@
CONST	SEGMENT
??_C@_0BA@BJOBDCJI@ACPI?5NVS?5Memory?$AA@ DB 'ACPI NVS Memory', 00H ; `string'
CONST	ENDS
;	COMDAT ??_C@_0N@EHGNOCNM@ACPI?5Reclaim?$AA@
CONST	SEGMENT
??_C@_0N@EHGNOCNM@ACPI?5Reclaim?$AA@ DB 'ACPI Reclaim', 00H ; `string'
CONST	ENDS
;	COMDAT ??_C@_08NKCLJDKG@Reserved?$AA@
CONST	SEGMENT
??_C@_08NKCLJDKG@Reserved?$AA@ DB 'Reserved', 00H	; `string'
CONST	ENDS
;	COMDAT ??_C@_09PPNHOLKJ@Available?$AA@
CONST	SEGMENT
??_C@_09PPNHOLKJ@Available?$AA@ DB 'Available', 00H	; `string'
CONST	ENDS
PUBLIC	??_C@_0DJ@DCCLNALJ@?6Unallocated?5p?5to?5free?5block?51?4?5@ ; `string'
PUBLIC	??_C@_0CD@IDLDPPCG@?6allocated?52?5blocks?5for?5p2?5at?50x@ ; `string'
PUBLIC	??_C@_0BF@FKNBJPNG@?6p?5allocated?5at?50x?$CFx?$AA@ ; `string'
PUBLIC	??_C@_0FN@PGMCIDPB@?6pmm?5regions?5initialized?3?5?$CFi?5all@ ; `string'
PUBLIC	??_C@_0DP@JJEEKKOB@region?5?$CFi?3?5start?3?50x?$CFx?$CFx?5length?5@ ; `string'
PUBLIC	??_C@_0BG@NANKAP@Physical?5Memory?5Map?3?6?$AA@	; `string'
PUBLIC	??_C@_0EC@GJFLJNIH@pmm?5initialized?5with?5?$CFi?5KB?5physi@ ; `string'
PUBLIC	??_C@_0FB@JMGOJCNI@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@ ; `string'
PUBLIC	??_C@_0FB@PNABOIGG@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?$HO?$FL?5Physical?5@ ; `string'
PUBLIC	?kmain@@YAHPAUmultiboot_info@@@Z		; kmain
EXTRN	?pmmngr_free_blocks@@YAXPAXI@Z:PROC		; pmmngr_free_blocks
EXTRN	?pmmngr_free_block@@YAXPAX@Z:PROC		; pmmngr_free_block
EXTRN	?pmmngr_alloc_blocks@@YAPAXI@Z:PROC		; pmmngr_alloc_blocks
EXTRN	?pmmngr_alloc_block@@YAPAXXZ:PROC		; pmmngr_alloc_block
EXTRN	?pmmngr_get_block_count@@YAIXZ:PROC		; pmmngr_get_block_count
EXTRN	?pmmngr_get_use_block_count@@YAIXZ:PROC		; pmmngr_get_use_block_count
EXTRN	?pmmngr_get_free_block_count@@YAIXZ:PROC	; pmmngr_get_free_block_count
EXTRN	?pmmngr_deinit_region@@YAXII@Z:PROC		; pmmngr_deinit_region
EXTRN	?pmmngr_init_region@@YAXII@Z:PROC		; pmmngr_init_region
EXTRN	?pmmngr_init@@YAXII@Z:PROC			; pmmngr_init
EXTRN	?simd_fpu_fault@@YAXIII@Z:PROC			; simd_fpu_fault
EXTRN	?machine_check_abort@@YAXIII@Z:PROC		; machine_check_abort
EXTRN	?alignment_check_fault@@YAXIIII@Z:PROC		; alignment_check_fault
EXTRN	?fpu_fault@@YAXIII@Z:PROC			; fpu_fault
EXTRN	?page_fault@@YAXIIII@Z:PROC			; page_fault
EXTRN	?general_protection_fault@@YAXIIII@Z:PROC	; general_protection_fault
EXTRN	?stack_fault@@YAXIIII@Z:PROC			; stack_fault
EXTRN	?no_segment_fault@@YAXIIII@Z:PROC		; no_segment_fault
EXTRN	?invalid_tss_fault@@YAXIIII@Z:PROC		; invalid_tss_fault
EXTRN	?double_fault_abort@@YAXIIII@Z:PROC		; double_fault_abort
EXTRN	?no_device_fault@@YAXIII@Z:PROC			; no_device_fault
EXTRN	?invalid_opcode_fault@@YAXIII@Z:PROC		; invalid_opcode_fault
EXTRN	?bounds_check_fault@@YAXIII@Z:PROC		; bounds_check_fault
EXTRN	?overflow_trap@@YAXIII@Z:PROC			; overflow_trap
EXTRN	?breakpoint_trap@@YAXIII@Z:PROC			; breakpoint_trap
EXTRN	?nmi_trap@@YAXIII@Z:PROC			; nmi_trap
EXTRN	?single_step_trap@@YAXIII@Z:PROC		; single_step_trap
EXTRN	?setvect@@YAXHA6AXXZ@Z:PROC			; setvect
EXTRN	?divide_by_zero_fault@@YAXIII@Z:PROC		; divide_by_zero_fault
EXTRN	?enable@@YAXXZ:PROC				; enable
EXTRN	?hal_initialize@@YAHXZ:PROC			; hal_initialize
EXTRN	?DebugPrintf@@YAHPBDZZ:PROC			; DebugPrintf
EXTRN	?DebugSetColor@@YAII@Z:PROC			; DebugSetColor
EXTRN	?DebugGotoXY@@YAXII@Z:PROC			; DebugGotoXY
EXTRN	?DebugClrScr@@YAXE@Z:PROC			; DebugClrScr
;	COMDAT ??_C@_0DJ@DCCLNALJ@?6Unallocated?5p?5to?5free?5block?51?4?5@
; File c:\users\so1\desktop\os development series 14 - 19\tutorial 17\syscore\kernel\main.cpp
CONST	SEGMENT
??_C@_0DJ@DCCLNALJ@?6Unallocated?5p?5to?5free?5block?51?4?5@ DB 0aH, 'Una'
	DB	'llocated p to free block 1. p is reallocated to 0x%x', 00H ; `string'
CONST	ENDS
;	COMDAT ??_C@_0CD@IDLDPPCG@?6allocated?52?5blocks?5for?5p2?5at?50x@
CONST	SEGMENT
??_C@_0CD@IDLDPPCG@?6allocated?52?5blocks?5for?5p2?5at?50x@ DB 0aH, 'allo'
	DB	'cated 2 blocks for p2 at 0x%x', 00H		; `string'
CONST	ENDS
;	COMDAT ??_C@_0BF@FKNBJPNG@?6p?5allocated?5at?50x?$CFx?$AA@
CONST	SEGMENT
??_C@_0BF@FKNBJPNG@?6p?5allocated?5at?50x?$CFx?$AA@ DB 0aH, 'p allocated '
	DB	'at 0x%x', 00H				; `string'
CONST	ENDS
;	COMDAT ??_C@_0FN@PGMCIDPB@?6pmm?5regions?5initialized?3?5?$CFi?5all@
CONST	SEGMENT
??_C@_0FN@PGMCIDPB@?6pmm?5regions?5initialized?3?5?$CFi?5all@ DB 0aH, 'pm'
	DB	'm regions initialized: %i allocation blocks; used or reserved'
	DB	' blocks: %i', 0aH, 'free blocks: %i', 0aH, 00H ; `string'
CONST	ENDS
;	COMDAT ??_C@_0DP@JJEEKKOB@region?5?$CFi?3?5start?3?50x?$CFx?$CFx?5length?5@
CONST	SEGMENT
??_C@_0DP@JJEEKKOB@region?5?$CFi?3?5start?3?50x?$CFx?$CFx?5length?5@ DB 'r'
	DB	'egion %i: start: 0x%x%x length (bytes): 0x%x%x type: %i (%s)', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0BG@NANKAP@Physical?5Memory?5Map?3?6?$AA@
CONST	SEGMENT
??_C@_0BG@NANKAP@Physical?5Memory?5Map?3?6?$AA@ DB 'Physical Memory Map:', 0aH
	DB	00H						; `string'
CONST	ENDS
;	COMDAT ??_C@_0EC@GJFLJNIH@pmm?5initialized?5with?5?$CFi?5KB?5physi@
CONST	SEGMENT
??_C@_0EC@GJFLJNIH@pmm?5initialized?5with?5?$CFi?5KB?5physi@ DB 'pmm init'
	DB	'ialized with %i KB physical memory; memLo: %i memHi: %i', 0aH
	DB	0aH, 00H					; `string'
CONST	ENDS
;	COMDAT ??_C@_0FB@JMGOJCNI@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@
CONST	SEGMENT
??_C@_0FB@JMGOJCNI@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@ DB ' '
	DB	'                                                             '
	DB	'                  ', 00H			; `string'
CONST	ENDS
;	COMDAT ??_C@_0FB@PNABOIGG@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?$HO?$FL?5Physical?5@
CONST	SEGMENT
??_C@_0FB@PNABOIGG@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?$HO?$FL?5Physical?5@ DB ' '
	DB	'                   ~[ Physical Memory Manager Demo ]~        '
	DB	'                  ', 00H			; `string'
; Function compile flags: /Ogspy
CONST	ENDS
;	COMDAT ?kmain@@YAHPAUmultiboot_info@@@Z
_TEXT	SEGMENT
_kernelSize$ = -4					; size = 4
_bootinfo$ = 8						; size = 4
?kmain@@YAHPAUmultiboot_info@@@Z PROC			; kmain, COMDAT

; 34   : int _cdecl kmain (multiboot_info* bootinfo) {

	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi

; 35   : 
; 36   : 	//! get kernel size passed from boot loader
; 37   : 	uint32_t kernelSize=0;

	xor	ebx, ebx
	push	edi
	mov	DWORD PTR _kernelSize$[ebp], ebx

; 38   : 	_asm mov	word ptr [kernelSize], dx

	mov	WORD PTR _kernelSize$[ebp], dx

; 39   : 
; 40   : 	//! make demo look nice :)
; 41   : 	DebugClrScr (0x13);

	push	19					; 00000013H
	call	?DebugClrScr@@YAXE@Z			; DebugClrScr

; 42   : 	DebugGotoXY (0,0);

	push	ebx
	push	ebx
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 43   : 
; 44   : 	DebugSetColor (0x3F);

	push	63					; 0000003fH
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 45   : 	DebugPrintf ("                    ~[ Physical Memory Manager Demo ]~                          ");

	push	OFFSET ??_C@_0FB@PNABOIGG@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?$HO?$FL?5Physical?5@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 46   : 
; 47   : 	DebugGotoXY (0,24);

	push	24					; 00000018H
	push	ebx
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 48   : 	DebugSetColor (0x3F);

	push	63					; 0000003fH
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 49   : 	DebugPrintf ("                                                                                ");

	push	OFFSET ??_C@_0FB@JMGOJCNI@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 50   : 
; 51   : 	DebugGotoXY (0,2);

	push	2
	push	ebx
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 52   : 	DebugSetColor (0x17);

	push	23					; 00000017H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 53   : 
; 54   : 	//! initialize hal
; 55   : 	hal_initialize ();

	call	?hal_initialize@@YAHXZ			; hal_initialize

; 56   : 
; 57   : 	//! enable interrupts and install exception handlers
; 58   : 	enable ();

	call	?enable@@YAXXZ				; enable

; 59   : 	setvect (0,(void (__cdecl &)(void))divide_by_zero_fault);

	push	OFFSET ?divide_by_zero_fault@@YAXIII@Z	; divide_by_zero_fault
	push	ebx
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 60   : 	setvect (1,(void (__cdecl &)(void))single_step_trap);

	push	OFFSET ?single_step_trap@@YAXIII@Z	; single_step_trap
	push	1
	call	?setvect@@YAXHA6AXXZ@Z			; setvect
	add	esp, 64					; 00000040H

; 61   : 	setvect (2,(void (__cdecl &)(void))nmi_trap);

	push	OFFSET ?nmi_trap@@YAXIII@Z		; nmi_trap
	push	2
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 62   : 	setvect (3,(void (__cdecl &)(void))breakpoint_trap);

	push	OFFSET ?breakpoint_trap@@YAXIII@Z	; breakpoint_trap
	push	3
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 63   : 	setvect (4,(void (__cdecl &)(void))overflow_trap);

	push	OFFSET ?overflow_trap@@YAXIII@Z		; overflow_trap
	push	4
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 64   : 	setvect (5,(void (__cdecl &)(void))bounds_check_fault);

	push	OFFSET ?bounds_check_fault@@YAXIII@Z	; bounds_check_fault
	push	5
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 65   : 	setvect (6,(void (__cdecl &)(void))invalid_opcode_fault);

	push	OFFSET ?invalid_opcode_fault@@YAXIII@Z	; invalid_opcode_fault
	push	6
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 66   : 	setvect (7,(void (__cdecl &)(void))no_device_fault);

	push	OFFSET ?no_device_fault@@YAXIII@Z	; no_device_fault
	push	7
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 67   : 	setvect (8,(void (__cdecl &)(void))double_fault_abort);

	push	OFFSET ?double_fault_abort@@YAXIIII@Z	; double_fault_abort
	push	8
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 68   : 	setvect (10,(void (__cdecl &)(void))invalid_tss_fault);

	push	OFFSET ?invalid_tss_fault@@YAXIIII@Z	; invalid_tss_fault
	push	10					; 0000000aH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect
	add	esp, 64					; 00000040H

; 69   : 	setvect (11,(void (__cdecl &)(void))no_segment_fault);

	push	OFFSET ?no_segment_fault@@YAXIIII@Z	; no_segment_fault
	push	11					; 0000000bH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 70   : 	setvect (12,(void (__cdecl &)(void))stack_fault);

	push	OFFSET ?stack_fault@@YAXIIII@Z		; stack_fault
	push	12					; 0000000cH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 71   : 	setvect (13,(void (__cdecl &)(void))general_protection_fault);

	push	OFFSET ?general_protection_fault@@YAXIIII@Z ; general_protection_fault
	push	13					; 0000000dH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 72   : 	setvect (14,(void (__cdecl &)(void))page_fault);

	push	OFFSET ?page_fault@@YAXIIII@Z		; page_fault
	push	14					; 0000000eH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 73   : 	setvect (16,(void (__cdecl &)(void))fpu_fault);

	push	OFFSET ?fpu_fault@@YAXIII@Z		; fpu_fault
	push	16					; 00000010H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 74   : 	setvect (17,(void (__cdecl &)(void))alignment_check_fault);

	push	OFFSET ?alignment_check_fault@@YAXIIII@Z ; alignment_check_fault
	push	17					; 00000011H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 75   : 	setvect (18,(void (__cdecl &)(void))machine_check_abort);

	push	OFFSET ?machine_check_abort@@YAXIII@Z	; machine_check_abort
	push	18					; 00000012H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 76   : 	setvect (19,(void (__cdecl &)(void))simd_fpu_fault);

	push	OFFSET ?simd_fpu_fault@@YAXIII@Z	; simd_fpu_fault
	push	19					; 00000013H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 77   : 
; 78   : 	//! get memory size in KB
; 79   : 	uint32_t memSize = 1024 + bootinfo->m_memoryLo + bootinfo->m_memoryHi*64;

	mov	edi, DWORD PTR _bootinfo$[ebp]
	mov	esi, DWORD PTR [edi+8]

; 80   : 
; 81   : 	//! initialize the physical memory manager
; 82   : 	//! we place the memory bit map used by the PMM at the end of the kernel in memory
; 83   : 	pmmngr_init (memSize, 0x100000 + kernelSize*512);

	mov	eax, DWORD PTR _kernelSize$[ebp]
	add	esi, 16					; 00000010H
	add	eax, 2048				; 00000800H
	add	esp, 64					; 00000040H
	shl	esi, 6
	add	esi, DWORD PTR [edi+4]
	shl	eax, 9
	push	eax
	push	esi
	call	?pmmngr_init@@YAXII@Z			; pmmngr_init

; 84   : 
; 85   : 	DebugPrintf("pmm initialized with %i KB physical memory; memLo: %i memHi: %i\n\n",
; 86   : 		memSize,bootinfo->m_memoryLo,bootinfo->m_memoryHi);

	push	DWORD PTR [edi+8]
	push	DWORD PTR [edi+4]
	push	esi
	push	OFFSET ??_C@_0EC@GJFLJNIH@pmm?5initialized?5with?5?$CFi?5KB?5physi@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 87   : 
; 88   : 	DebugSetColor (0x19);

	push	25					; 00000019H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 89   : 	DebugPrintf ("Physical Memory Map:\n");

	push	OFFSET ??_C@_0BG@NANKAP@Physical?5Memory?5Map?3?6?$AA@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 32					; 00000020H

; 90   : 
; 91   : 	memory_region*	region = (memory_region*)0x1000;
; 92   : 
; 93   : 	for (int i=0; i<15; ++i) {

	xor	edi, edi
	mov	esi, 4112				; 00001010H
$LL6@kmain:

; 94   : 
; 95   : 		//! sanity check; if type is > 4 mark it reserved
; 96   : 		if (region[i].type>4)

	cmp	DWORD PTR [esi], 4
	jbe	SHORT $LN12@kmain

; 97   : 			region[i].type=1;

	mov	DWORD PTR [esi], 1
$LN12@kmain:

; 98   : 
; 99   : 		//! if start address is 0, there is no more entries, break out
; 100  : 		if (i>0 && region[i].startLo==0)

	cmp	edi, ebx
	jle	SHORT $LN2@kmain
	cmp	DWORD PTR [esi-16], ebx
	je	SHORT $LN10@kmain
$LN2@kmain:

; 101  : 			break;
; 102  : 
; 103  : 		//! display entry
; 104  : 		DebugPrintf ("region %i: start: 0x%x%x length (bytes): 0x%x%x type: %i (%s)\n", i, 
; 105  : 			region[i].startHi, region[i].startLo,
; 106  : 			region[i].sizeHi,region[i].sizeLo,
; 107  : 			region[i].type, strMemoryTypes[region[i].type-1]);

	mov	eax, DWORD PTR [esi]
	push	DWORD PTR ?strMemoryTypes@@3PAPADA[eax*4-4]
	push	eax
	push	DWORD PTR [esi-8]
	push	DWORD PTR [esi-4]
	push	DWORD PTR [esi-16]
	push	DWORD PTR [esi-12]
	push	edi
	push	OFFSET ??_C@_0DP@JJEEKKOB@region?5?$CFi?3?5start?3?50x?$CFx?$CFx?5length?5@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 32					; 00000020H

; 108  : 
; 109  : 		//! if region is avilable memory, initialize the region for use
; 110  : 		if (region[i].type==1)

	cmp	DWORD PTR [esi], 1
	jne	SHORT $LN5@kmain

; 111  : 			pmmngr_init_region (region[i].startLo, region[i].sizeLo);

	push	DWORD PTR [esi-8]
	push	DWORD PTR [esi-16]
	call	?pmmngr_init_region@@YAXII@Z		; pmmngr_init_region
	pop	ecx
	pop	ecx
$LN5@kmain:
	add	esi, 24					; 00000018H
	inc	edi
	cmp	esi, 4472				; 00001178H
	jl	SHORT $LL6@kmain
$LN10@kmain:

; 112  : 	}
; 113  : 
; 114  : 	//! deinit the region the kernel is in as its in use
; 115  : 	pmmngr_deinit_region (0x100000, kernelSize*512);

	mov	eax, DWORD PTR _kernelSize$[ebp]
	shl	eax, 9
	push	eax
	push	1048576					; 00100000H
	call	?pmmngr_deinit_region@@YAXII@Z		; pmmngr_deinit_region

; 116  : 
; 117  : 	DebugSetColor (0x17);

	push	23					; 00000017H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor
	add	esp, 12					; 0000000cH

; 118  : 
; 119  : 	DebugPrintf ("\npmm regions initialized: %i allocation blocks; used or reserved blocks: %i\nfree blocks: %i\n",
; 120  : 		pmmngr_get_block_count (),  pmmngr_get_use_block_count (), pmmngr_get_free_block_count () );

	call	?pmmngr_get_free_block_count@@YAIXZ	; pmmngr_get_free_block_count
	push	eax
	call	?pmmngr_get_use_block_count@@YAIXZ	; pmmngr_get_use_block_count
	push	eax
	call	?pmmngr_get_block_count@@YAIXZ		; pmmngr_get_block_count
	push	eax
	push	OFFSET ??_C@_0FN@PGMCIDPB@?6pmm?5regions?5initialized?3?5?$CFi?5all@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 121  : 
; 122  : 	//! allocating and deallocating memory examples...
; 123  : 
; 124  : 	DebugSetColor (0x12);

	push	18					; 00000012H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 125  : 
; 126  : 	uint32_t* p = (uint32_t*)pmmngr_alloc_block ();

	call	?pmmngr_alloc_block@@YAPAXXZ		; pmmngr_alloc_block
	mov	esi, eax

; 127  : 	DebugPrintf ("\np allocated at 0x%x", p);

	push	esi
	push	OFFSET ??_C@_0BF@FKNBJPNG@?6p?5allocated?5at?50x?$CFx?$AA@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 128  : 
; 129  : 	uint32_t* p2 = (uint32_t*)pmmngr_alloc_blocks (2);

	push	2
	call	?pmmngr_alloc_blocks@@YAPAXI@Z		; pmmngr_alloc_blocks
	mov	edi, eax

; 130  : 	DebugPrintf ("\nallocated 2 blocks for p2 at 0x%x", p2);

	push	edi
	push	OFFSET ??_C@_0CD@IDLDPPCG@?6allocated?52?5blocks?5for?5p2?5at?50x@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 131  : 
; 132  : 	pmmngr_free_block (p);

	push	esi
	call	?pmmngr_free_block@@YAXPAX@Z		; pmmngr_free_block

; 133  : 	p = (uint32_t*)pmmngr_alloc_block ();

	call	?pmmngr_alloc_block@@YAPAXXZ		; pmmngr_alloc_block
	mov	esi, eax

; 134  : 	DebugPrintf ("\nUnallocated p to free block 1. p is reallocated to 0x%x", p);

	push	esi
	push	OFFSET ??_C@_0DJ@DCCLNALJ@?6Unallocated?5p?5to?5free?5block?51?4?5@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf

; 135  : 
; 136  : 	pmmngr_free_block (p);

	push	esi
	call	?pmmngr_free_block@@YAXPAX@Z		; pmmngr_free_block

; 137  : 	pmmngr_free_blocks (p2, 2);

	push	2
	push	edi
	call	?pmmngr_free_blocks@@YAXPAXI@Z		; pmmngr_free_blocks
	add	esp, 64					; 00000040H
	pop	edi
	pop	esi

; 138  : 	return 0;

	xor	eax, eax
	pop	ebx

; 139  : }

	leave
	ret	0
?kmain@@YAHPAUmultiboot_info@@@Z ENDP			; kmain
_TEXT	ENDS
END
