; Listing generated by Microsoft (R) Optimizing Compiler Version 15.00.30729.01 

	TITLE	c:\Users\so1\Desktop\OS Development series 14 - 19\Tutorial 17\SysCore\Kernel\mmngr_phys.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_BSS	SEGMENT
__mmngr_memory_size DD 01H DUP (?)
__mmngr_used_blocks DD 01H DUP (?)
__mmngr_max_blocks DD 01H DUP (?)
__mmngr_memory_map DD 01H DUP (?)
_BSS	ENDS
PUBLIC	?mmap_set@@YAXH@Z				; mmap_set
; Function compile flags: /Ogspy
; File c:\users\so1\desktop\os development series 14 - 19\tutorial 17\syscore\kernel\mmngr_phys.cpp
;	COMDAT ?mmap_set@@YAXH@Z
_TEXT	SEGMENT
_bit$ = 8						; size = 4
?mmap_set@@YAXH@Z PROC					; mmap_set, COMDAT

; 81   : 
; 82   :   _mmngr_memory_map[bit / 32] |= (1 << (bit % 32));

	mov	ecx, DWORD PTR _bit$[esp-4]
	mov	eax, ecx
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	mov	edx, DWORD PTR __mmngr_memory_map
	sar	eax, 5
	and	ecx, -2147483617			; 8000001fH
	lea	eax, DWORD PTR [edx+eax*4]
	jns	SHORT $LN3@mmap_set
	dec	ecx
	or	ecx, -32				; ffffffe0H
	inc	ecx
$LN3@mmap_set:
	xor	edx, edx
	inc	edx
	shl	edx, cl
	or	DWORD PTR [eax], edx

; 83   : }

	ret	0
?mmap_set@@YAXH@Z ENDP					; mmap_set
_TEXT	ENDS
PUBLIC	?mmap_unset@@YAXH@Z				; mmap_unset
; Function compile flags: /Ogspy
;	COMDAT ?mmap_unset@@YAXH@Z
_TEXT	SEGMENT
_bit$ = 8						; size = 4
?mmap_unset@@YAXH@Z PROC				; mmap_unset, COMDAT

; 87   : 
; 88   :   _mmngr_memory_map[bit / 32] &= ~ (1 << (bit % 32));

	mov	ecx, DWORD PTR _bit$[esp-4]
	mov	eax, ecx
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	mov	edx, DWORD PTR __mmngr_memory_map
	sar	eax, 5
	and	ecx, -2147483617			; 8000001fH
	lea	eax, DWORD PTR [edx+eax*4]
	jns	SHORT $LN3@mmap_unset
	dec	ecx
	or	ecx, -32				; ffffffe0H
	inc	ecx
$LN3@mmap_unset:
	xor	edx, edx
	inc	edx
	shl	edx, cl
	not	edx
	and	DWORD PTR [eax], edx

; 89   : }

	ret	0
?mmap_unset@@YAXH@Z ENDP				; mmap_unset
_TEXT	ENDS
PUBLIC	?mmap_test@@YA_NH@Z				; mmap_test
; Function compile flags: /Ogspy
;	COMDAT ?mmap_test@@YA_NH@Z
_TEXT	SEGMENT
_bit$ = 8						; size = 4
?mmap_test@@YA_NH@Z PROC				; mmap_test, COMDAT

; 93   : 
; 94   : 	return _mmngr_memory_map[bit / 32] &  (1 << (bit % 32));

	mov	eax, DWORD PTR _bit$[esp-4]
	mov	ecx, eax
	and	ecx, -2147483617			; 8000001fH
	push	esi
	jns	SHORT $LN3@mmap_test
	dec	ecx
	or	ecx, -32				; ffffffe0H
	inc	ecx
$LN3@mmap_test:
	xor	esi, esi
	cdq
	inc	esi
	shl	esi, cl
	mov	ecx, DWORD PTR __mmngr_memory_map
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	test	esi, DWORD PTR [ecx+eax*4]
	pop	esi
	setne	al

; 95   : }

	ret	0
?mmap_test@@YA_NH@Z ENDP				; mmap_test
_TEXT	ENDS
PUBLIC	?pmmngr_init_region@@YAXII@Z			; pmmngr_init_region
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_init_region@@YAXII@Z
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
?pmmngr_init_region@@YAXII@Z PROC			; pmmngr_init_region, COMDAT

; 162  : void	pmmngr_init_region (physical_addr base, size_t size) {

	push	esi

; 163  : 
; 164  : 	int align = base / PMMNGR_BLOCK_SIZE;

	mov	esi, DWORD PTR _base$[esp]
	push	edi

; 165  : 	int blocks = size / PMMNGR_BLOCK_SIZE;

	mov	edi, DWORD PTR _size$[esp+4]
	shr	edi, 12					; 0000000cH
	shr	esi, 12					; 0000000cH

; 166  : 
; 167  : 	for (; blocks>=0; blocks--) {

	test	edi, edi
	jl	SHORT $LN1@pmmngr_ini
$LL3@pmmngr_ini:

; 168  : 		mmap_unset (align++);

	push	esi
	call	?mmap_unset@@YAXH@Z			; mmap_unset
	inc	esi

; 169  : 		_mmngr_used_blocks--;

	dec	DWORD PTR __mmngr_used_blocks
	dec	edi
	pop	ecx
	jns	SHORT $LL3@pmmngr_ini
$LN1@pmmngr_ini:

; 170  : 
; 171  : 
; 172  : 	}
; 173  : 
; 174  : 	mmap_set (0);	//first block is always set. This insures allocs cant be 0

	push	0
	call	?mmap_set@@YAXH@Z			; mmap_set
	pop	ecx
	pop	edi
	pop	esi

; 175  : }

	ret	0
?pmmngr_init_region@@YAXII@Z ENDP			; pmmngr_init_region
_TEXT	ENDS
PUBLIC	?pmmngr_deinit_region@@YAXII@Z			; pmmngr_deinit_region
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_deinit_region@@YAXII@Z
_TEXT	SEGMENT
_base$ = 8						; size = 4
_size$ = 12						; size = 4
?pmmngr_deinit_region@@YAXII@Z PROC			; pmmngr_deinit_region, COMDAT

; 177  : void	pmmngr_deinit_region (physical_addr base, size_t size) {

	push	esi

; 178  : 
; 179  : 	int align = base / PMMNGR_BLOCK_SIZE;
; 180  : 	int blocks = size / PMMNGR_BLOCK_SIZE;

	mov	esi, DWORD PTR _size$[esp]
	push	edi
	mov	edi, DWORD PTR _base$[esp+4]
	shr	esi, 12					; 0000000cH
	shr	edi, 12					; 0000000cH

; 181  : 
; 182  : 	for (; blocks>=0; blocks--) {

	test	esi, esi
	jl	SHORT $LN1@pmmngr_dei
	mov	eax, DWORD PTR __mmngr_used_blocks
	lea	eax, DWORD PTR [eax+esi+1]
	mov	DWORD PTR __mmngr_used_blocks, eax
$LL3@pmmngr_dei:

; 183  : 		mmap_set (align++);

	push	edi
	call	?mmap_set@@YAXH@Z			; mmap_set
	inc	edi
	dec	esi
	pop	ecx
	jns	SHORT $LL3@pmmngr_dei
$LN1@pmmngr_dei:
	pop	edi
	pop	esi

; 184  : 		_mmngr_used_blocks++;
; 185  : 	}
; 186  : 
; 187  : }

	ret	0
?pmmngr_deinit_region@@YAXII@Z ENDP			; pmmngr_deinit_region
_TEXT	ENDS
PUBLIC	?pmmngr_free_block@@YAXPAX@Z			; pmmngr_free_block
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_free_block@@YAXPAX@Z
_TEXT	SEGMENT
_p$ = 8							; size = 4
?pmmngr_free_block@@YAXPAX@Z PROC			; pmmngr_free_block, COMDAT

; 208  : 
; 209  : 	physical_addr addr = (physical_addr)p;
; 210  : 	int frame = addr / PMMNGR_BLOCK_SIZE;

	mov	eax, DWORD PTR _p$[esp-4]
	shr	eax, 12					; 0000000cH

; 211  : 
; 212  : 	mmap_unset (frame);

	push	eax
	call	?mmap_unset@@YAXH@Z			; mmap_unset

; 213  : 
; 214  : 	_mmngr_used_blocks--;

	dec	DWORD PTR __mmngr_used_blocks
	pop	ecx

; 215  : }

	ret	0
?pmmngr_free_block@@YAXPAX@Z ENDP			; pmmngr_free_block
_TEXT	ENDS
PUBLIC	?pmmngr_free_blocks@@YAXPAXI@Z			; pmmngr_free_blocks
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_free_blocks@@YAXPAXI@Z
_TEXT	SEGMENT
_p$ = 8							; size = 4
_size$ = 12						; size = 4
?pmmngr_free_blocks@@YAXPAXI@Z PROC			; pmmngr_free_blocks, COMDAT

; 236  : void	pmmngr_free_blocks (void* p, size_t size) {

	push	ebx

; 237  : 
; 238  : 	physical_addr addr = (physical_addr)p;
; 239  : 	int frame = addr / PMMNGR_BLOCK_SIZE;
; 240  : 
; 241  : 	for (uint32_t i=0; i<size; i++)

	mov	ebx, DWORD PTR _size$[esp]
	push	esi
	mov	esi, DWORD PTR _p$[esp+4]
	push	edi
	shr	esi, 12					; 0000000cH
	xor	edi, edi
	test	ebx, ebx
	jbe	SHORT $LN1@pmmngr_fre
$LL3@pmmngr_fre:

; 242  : 		mmap_unset (frame+i);

	lea	eax, DWORD PTR [edi+esi]
	push	eax
	call	?mmap_unset@@YAXH@Z			; mmap_unset
	inc	edi
	pop	ecx
	cmp	edi, ebx
	jb	SHORT $LL3@pmmngr_fre
$LN1@pmmngr_fre:

; 243  : 
; 244  : 	_mmngr_used_blocks-=size;

	sub	DWORD PTR __mmngr_used_blocks, ebx
	pop	edi
	pop	esi
	pop	ebx

; 245  : }

	ret	0
?pmmngr_free_blocks@@YAXPAXI@Z ENDP			; pmmngr_free_blocks
_TEXT	ENDS
PUBLIC	?pmmngr_get_memory_size@@YAIXZ			; pmmngr_get_memory_size
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_memory_size@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_memory_size@@YAIXZ PROC			; pmmngr_get_memory_size, COMDAT

; 248  : 
; 249  : 	return _mmngr_memory_size;

	mov	eax, DWORD PTR __mmngr_memory_size

; 250  : }

	ret	0
?pmmngr_get_memory_size@@YAIXZ ENDP			; pmmngr_get_memory_size
_TEXT	ENDS
PUBLIC	?pmmngr_get_block_count@@YAIXZ			; pmmngr_get_block_count
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_block_count@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_block_count@@YAIXZ PROC			; pmmngr_get_block_count, COMDAT

; 253  : 
; 254  : 	return _mmngr_max_blocks;

	mov	eax, DWORD PTR __mmngr_max_blocks

; 255  : }

	ret	0
?pmmngr_get_block_count@@YAIXZ ENDP			; pmmngr_get_block_count
_TEXT	ENDS
PUBLIC	?pmmngr_get_use_block_count@@YAIXZ		; pmmngr_get_use_block_count
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_use_block_count@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_use_block_count@@YAIXZ PROC			; pmmngr_get_use_block_count, COMDAT

; 258  : 
; 259  : 	return _mmngr_used_blocks;

	mov	eax, DWORD PTR __mmngr_used_blocks

; 260  : }

	ret	0
?pmmngr_get_use_block_count@@YAIXZ ENDP			; pmmngr_get_use_block_count
_TEXT	ENDS
PUBLIC	?pmmngr_get_free_block_count@@YAIXZ		; pmmngr_get_free_block_count
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_free_block_count@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_free_block_count@@YAIXZ PROC		; pmmngr_get_free_block_count, COMDAT

; 263  : 
; 264  : 	return _mmngr_max_blocks - _mmngr_used_blocks;

	mov	eax, DWORD PTR __mmngr_max_blocks
	sub	eax, DWORD PTR __mmngr_used_blocks

; 265  : }

	ret	0
?pmmngr_get_free_block_count@@YAIXZ ENDP		; pmmngr_get_free_block_count
_TEXT	ENDS
PUBLIC	?pmmngr_get_block_size@@YAIXZ			; pmmngr_get_block_size
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_block_size@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_block_size@@YAIXZ PROC			; pmmngr_get_block_size, COMDAT

; 268  : 
; 269  : 	return PMMNGR_BLOCK_SIZE;

	mov	eax, 4096				; 00001000H

; 270  : }

	ret	0
?pmmngr_get_block_size@@YAIXZ ENDP			; pmmngr_get_block_size
_TEXT	ENDS
PUBLIC	?pmmngr_paging_enable@@YAX_N@Z			; pmmngr_paging_enable
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_paging_enable@@YAX_N@Z
_TEXT	SEGMENT
_b$ = 8							; size = 1
?pmmngr_paging_enable@@YAX_N@Z PROC			; pmmngr_paging_enable, COMDAT

; 272  : void	pmmngr_paging_enable (bool b) {

	push	ebp
	mov	ebp, esp

; 273  : 
; 274  : #ifdef _MSC_VER
; 275  : 	_asm {
; 276  : 		mov	eax, cr0

	mov	eax, cr0

; 277  : 		cmp [b], 1

	cmp	BYTE PTR _b$[ebp], 1

; 278  : 		je	enable

	je	SHORT $enable$2762

; 279  : 		jmp disable

	jmp	SHORT $disable$2763
$enable$2762:

; 280  : enable:
; 281  : 		or eax, 0x80000000		//set bit 31

	or	eax, -2147483648			; 80000000H

; 282  : 		mov	cr0, eax

	mov	cr0, eax

; 283  : 		jmp done

	jmp	SHORT $done$2764
$disable$2763:

; 284  : disable:
; 285  : 		and eax, 0x7FFFFFFF		//clear bit 31

	and	eax, 2147483647				; 7fffffffH

; 286  : 		mov	cr0, eax

	mov	cr0, eax
$done$2764:

; 287  : done:
; 288  : 	}
; 289  : #endif
; 290  : }

	pop	ebp
	ret	0
?pmmngr_paging_enable@@YAX_N@Z ENDP			; pmmngr_paging_enable
_TEXT	ENDS
PUBLIC	?pmmngr_is_paging@@YA_NXZ			; pmmngr_is_paging
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_is_paging@@YA_NXZ
_TEXT	SEGMENT
_res$ = -4						; size = 4
?pmmngr_is_paging@@YA_NXZ PROC				; pmmngr_is_paging, COMDAT

; 292  : bool pmmngr_is_paging () {

	push	ebp
	mov	ebp, esp
	push	ecx

; 293  : 
; 294  : 	uint32_t res=0;

	and	DWORD PTR _res$[ebp], 0

; 295  : 
; 296  : #ifdef _MSC_VER
; 297  : 	_asm {
; 298  : 		mov	eax, cr0

	mov	eax, cr0

; 299  : 		mov	[res], eax

	mov	DWORD PTR _res$[ebp], eax

; 300  : 	}
; 301  : #endif
; 302  : 
; 303  : 	return (res & 0x80000000) ? false : true;

	mov	eax, DWORD PTR _res$[ebp]
	shr	eax, 31					; 0000001fH
	not	al
	and	al, 1

; 304  : }

	leave
	ret	0
?pmmngr_is_paging@@YA_NXZ ENDP				; pmmngr_is_paging
_TEXT	ENDS
PUBLIC	?pmmngr_load_PDBR@@YAXI@Z			; pmmngr_load_PDBR
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_load_PDBR@@YAXI@Z
_TEXT	SEGMENT
_addr$ = 8						; size = 4
?pmmngr_load_PDBR@@YAXI@Z PROC				; pmmngr_load_PDBR, COMDAT

; 307  : 
; 308  : #ifdef _MSC_VER
; 309  : 	_asm {
; 310  : 		mov	eax, [addr]

	mov	eax, DWORD PTR _addr$[esp-4]

; 311  : 		mov	cr3, eax		// PDBR is cr3 register in i86

	mov	cr3, eax

; 312  : 	}
; 313  : #endif
; 314  : }

	ret	0
?pmmngr_load_PDBR@@YAXI@Z ENDP				; pmmngr_load_PDBR
_TEXT	ENDS
PUBLIC	?pmmngr_get_PDBR@@YAIXZ				; pmmngr_get_PDBR
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_get_PDBR@@YAIXZ
_TEXT	SEGMENT
?pmmngr_get_PDBR@@YAIXZ PROC				; pmmngr_get_PDBR, COMDAT

; 317  : 
; 318  : #ifdef _MSC_VER
; 319  : 	_asm {
; 320  : 		mov	eax, cr3

	mov	eax, cr3

; 321  : 		ret

	ret	0

; 322  : 	}
; 323  : #endif
; 324  : }

	ret	0
?pmmngr_get_PDBR@@YAIXZ ENDP				; pmmngr_get_PDBR
_TEXT	ENDS
PUBLIC	?mmap_first_free@@YAHXZ				; mmap_first_free
; Function compile flags: /Ogspy
;	COMDAT ?mmap_first_free@@YAHXZ
_TEXT	SEGMENT
?mmap_first_free@@YAHXZ PROC				; mmap_first_free, COMDAT

; 98   : int mmap_first_free () {

	push	esi

; 99   : 
; 100  : 	//! find the first free bit
; 101  : 	for (uint32_t i=0; i< pmmngr_get_block_count() /32; i++)

	mov	esi, DWORD PTR __mmngr_max_blocks
	shr	esi, 5
	xor	eax, eax
	push	edi
	test	esi, esi
	jbe	SHORT $LN6@mmap_first
$LL8@mmap_first:

; 102  : 		if (_mmngr_memory_map[i] != 0xffffffff)

	mov	ecx, DWORD PTR __mmngr_memory_map
	mov	edx, DWORD PTR [ecx+eax*4]
	cmp	edx, -1
	je	SHORT $LN7@mmap_first

; 103  : 			for (int j=0; j<32; j++) {				//! test each bit in the dword

	xor	ecx, ecx
$LL4@mmap_first:

; 104  : 
; 105  : 				int bit = 1 << j;

	xor	edi, edi
	inc	edi
	shl	edi, cl

; 106  : 				if (! (_mmngr_memory_map[i] & bit) )

	test	edi, edx
	je	SHORT $LN15@mmap_first
	inc	ecx
	cmp	ecx, 32					; 00000020H
	jl	SHORT $LL4@mmap_first
$LN7@mmap_first:

; 99   : 
; 100  : 	//! find the first free bit
; 101  : 	for (uint32_t i=0; i< pmmngr_get_block_count() /32; i++)

	inc	eax
	cmp	eax, esi
	jb	SHORT $LL8@mmap_first
$LN6@mmap_first:

; 107  : 					return i*4*8+j;
; 108  : 			}
; 109  : 
; 110  : 	return -1;

	or	eax, -1
$LN9@mmap_first:
	pop	edi
	pop	esi

; 111  : }

	ret	0
$LN15@mmap_first:
	shl	eax, 5
	add	eax, ecx
	jmp	SHORT $LN9@mmap_first
?mmap_first_free@@YAHXZ ENDP				; mmap_first_free
_TEXT	ENDS
PUBLIC	?mmap_first_free_s@@YAHI@Z			; mmap_first_free_s
; Function compile flags: /Ogspy
;	COMDAT ?mmap_first_free_s@@YAHI@Z
_TEXT	SEGMENT
tv163 = -20						; size = 4
tv168 = -16						; size = 4
_i$2671 = -12						; size = 4
tv220 = -8						; size = 4
_j$2676 = -4						; size = 4
_size$ = 8						; size = 4
?mmap_first_free_s@@YAHI@Z PROC				; mmap_first_free_s, COMDAT

; 114  : int mmap_first_free_s (size_t size) {

	push	ebp
	mov	ebp, esp

; 115  : 
; 116  : 	if (size==0)

	xor	eax, eax
	sub	esp, 20					; 00000014H
	cmp	DWORD PTR _size$[ebp], eax
	jne	SHORT $LN15@mmap_first@2

; 117  : 		return -1;

	or	eax, -1

; 145  : }

	leave
	ret	0
$LN15@mmap_first@2:

; 118  : 
; 119  : 	if (size==1)

	cmp	DWORD PTR _size$[ebp], 1
	jne	SHORT $LN14@mmap_first@2

; 120  : 		return mmap_first_free ();

	call	?mmap_first_free@@YAHXZ			; mmap_first_free

; 145  : }

	leave
	ret	0
$LN14@mmap_first@2:

; 121  : 
; 122  : 	for (uint32_t i=0; i<pmmngr_get_block_count() /32; i++)

	mov	ecx, DWORD PTR __mmngr_max_blocks
	push	ebx
	shr	ecx, 5
	push	esi
	push	edi
	mov	DWORD PTR _i$2671[ebp], eax
	mov	DWORD PTR tv163[ebp], ecx
	cmp	ecx, eax
	jbe	SHORT $LN27@mmap_first@2
	mov	DWORD PTR tv220[ebp], eax
$LL29@mmap_first@2:

; 123  : 		if (_mmngr_memory_map[i] != 0xffffffff)

	mov	ecx, DWORD PTR __mmngr_memory_map
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR tv168[ebp], eax
	cmp	eax, -1
	je	SHORT $LN12@mmap_first@2

; 124  : 			for (int j=0; j<32; j++) {	//! test each bit in the dword

	and	DWORD PTR _j$2676[ebp], 0
$LL28@mmap_first@2:

; 125  : 
; 126  : 				int bit = 1<<j;

	mov	ecx, DWORD PTR _j$2676[ebp]
	xor	eax, eax
	inc	eax
	shl	eax, cl

; 127  : 				if (! (_mmngr_memory_map[i] & bit) ) {

	test	DWORD PTR tv168[ebp], eax
	jne	SHORT $LN8@mmap_first@2
	mov	ecx, DWORD PTR tv220[ebp]

; 128  : 
; 129  : 					int startingBit = i*32;
; 130  : 					startingBit+=bit;		//get the free bit in the dword at index i
; 131  : 
; 132  : 					uint32_t free=0; //loop through each bit to see if its enough space

	xor	ebx, ebx
	lea	esi, DWORD PTR [ecx+eax]

; 133  : 					for (uint32_t count=0; count<=size;count++) {

	xor	edi, edi
$LL5@mmap_first@2:

; 134  : 
; 135  : 						if (! mmap_test (startingBit+count) )

	lea	eax, DWORD PTR [edi+esi]
	push	eax
	call	?mmap_test@@YA_NH@Z			; mmap_test
	pop	ecx
	test	al, al
	jne	SHORT $LN2@mmap_first@2

; 136  : 							free++;	// this bit is clear (free frame)

	inc	ebx
$LN2@mmap_first@2:

; 137  : 
; 138  : 						if (free==size)

	cmp	ebx, DWORD PTR _size$[ebp]
	je	SHORT $LN23@mmap_first@2
	inc	edi
	cmp	edi, DWORD PTR _size$[ebp]
	jbe	SHORT $LL5@mmap_first@2
$LN8@mmap_first@2:

; 124  : 			for (int j=0; j<32; j++) {	//! test each bit in the dword

	inc	DWORD PTR _j$2676[ebp]
	cmp	DWORD PTR _j$2676[ebp], 32		; 00000020H
	jl	SHORT $LL28@mmap_first@2
$LN12@mmap_first@2:

; 121  : 
; 122  : 	for (uint32_t i=0; i<pmmngr_get_block_count() /32; i++)

	mov	eax, DWORD PTR _i$2671[ebp]
	add	DWORD PTR tv220[ebp], 32		; 00000020H
	inc	eax
	mov	DWORD PTR _i$2671[ebp], eax
	cmp	eax, DWORD PTR tv163[ebp]
	jb	SHORT $LL29@mmap_first@2
$LN27@mmap_first@2:

; 140  : 					}
; 141  : 				}
; 142  : 			}
; 143  : 
; 144  : 	return -1;

	or	eax, -1
$LN30@mmap_first@2:
	pop	edi
	pop	esi
	pop	ebx

; 145  : }

	leave
	ret	0
$LN23@mmap_first@2:

; 139  : 							return i*4*8+j; //free count==size needed; return index

	mov	eax, DWORD PTR _i$2671[ebp]
	shl	eax, 5
	add	eax, DWORD PTR _j$2676[ebp]
	jmp	SHORT $LN30@mmap_first@2
?mmap_first_free_s@@YAHI@Z ENDP				; mmap_first_free_s
_TEXT	ENDS
PUBLIC	?pmmngr_init@@YAXII@Z				; pmmngr_init
EXTRN	?memset@@YAPAXPAXDI@Z:PROC			; memset
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_init@@YAXII@Z
_TEXT	SEGMENT
_memSize$ = 8						; size = 4
_bitmap$ = 12						; size = 4
?pmmngr_init@@YAXII@Z PROC				; pmmngr_init, COMDAT

; 152  : 
; 153  : 	_mmngr_memory_size	=	memSize;

	mov	eax, DWORD PTR _memSize$[esp-4]

; 154  : 	_mmngr_memory_map	=	(uint32_t*) bitmap;

	mov	ecx, DWORD PTR _bitmap$[esp-4]
	mov	DWORD PTR __mmngr_memory_size, eax

; 155  : 	_mmngr_max_blocks	=	(pmmngr_get_memory_size()*1024) / PMMNGR_BLOCK_SIZE;

	shl	eax, 10					; 0000000aH
	shr	eax, 12					; 0000000cH
	mov	DWORD PTR __mmngr_max_blocks, eax

; 156  : 	_mmngr_used_blocks	=	_mmngr_max_blocks;

	mov	DWORD PTR __mmngr_used_blocks, eax

; 157  : 
; 158  : 	//! By default, all of memory is in use
; 159  : 	memset (_mmngr_memory_map, 0xf, pmmngr_get_block_count() / PMMNGR_BLOCKS_PER_BYTE );

	shr	eax, 3
	push	eax
	push	15					; 0000000fH
	push	ecx
	mov	DWORD PTR __mmngr_memory_map, ecx
	call	?memset@@YAPAXPAXDI@Z			; memset
	add	esp, 12					; 0000000cH

; 160  : }

	ret	0
?pmmngr_init@@YAXII@Z ENDP				; pmmngr_init
_TEXT	ENDS
PUBLIC	?pmmngr_alloc_block@@YAPAXXZ			; pmmngr_alloc_block
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_alloc_block@@YAPAXXZ
_TEXT	SEGMENT
?pmmngr_alloc_block@@YAPAXXZ PROC			; pmmngr_alloc_block, COMDAT

; 190  : 
; 191  : 	if (pmmngr_get_free_block_count() <= 0)

	mov	eax, DWORD PTR __mmngr_max_blocks
	sub	eax, DWORD PTR __mmngr_used_blocks
	jne	SHORT $LN2@pmmngr_all

; 203  : 
; 204  : 	return (void*)addr;
; 205  : }

	ret	0
$LN2@pmmngr_all:
	push	esi

; 192  : 		return 0;	//out of memory
; 193  : 
; 194  : 	int frame = mmap_first_free ();

	call	?mmap_first_free@@YAHXZ			; mmap_first_free
	mov	esi, eax

; 195  : 
; 196  : 	if (frame == -1)

	cmp	esi, -1
	jne	SHORT $LN1@pmmngr_all

; 197  : 		return 0;	//out of memory

	xor	eax, eax
	pop	esi

; 203  : 
; 204  : 	return (void*)addr;
; 205  : }

	ret	0
$LN1@pmmngr_all:

; 198  : 
; 199  : 	mmap_set (frame);

	push	esi
	call	?mmap_set@@YAXH@Z			; mmap_set

; 200  : 
; 201  : 	physical_addr addr = frame * PMMNGR_BLOCK_SIZE;
; 202  : 	_mmngr_used_blocks++;

	inc	DWORD PTR __mmngr_used_blocks
	mov	eax, esi
	pop	ecx
	shl	eax, 12					; 0000000cH
	pop	esi

; 203  : 
; 204  : 	return (void*)addr;
; 205  : }

	ret	0
?pmmngr_alloc_block@@YAPAXXZ ENDP			; pmmngr_alloc_block
_TEXT	ENDS
PUBLIC	?pmmngr_alloc_blocks@@YAPAXI@Z			; pmmngr_alloc_blocks
; Function compile flags: /Ogspy
;	COMDAT ?pmmngr_alloc_blocks@@YAPAXI@Z
_TEXT	SEGMENT
_size$ = 8						; size = 4
?pmmngr_alloc_blocks@@YAPAXI@Z PROC			; pmmngr_alloc_blocks, COMDAT

; 218  : 
; 219  : 	if (pmmngr_get_free_block_count() <= size)

	mov	eax, DWORD PTR __mmngr_max_blocks
	sub	eax, DWORD PTR __mmngr_used_blocks
	push	edi
	mov	edi, DWORD PTR _size$[esp]
	cmp	eax, edi
	ja	SHORT $LN5@pmmngr_all@2

; 220  : 		return 0;	//not enough space

	xor	eax, eax
	pop	edi

; 232  : 
; 233  : 	return (void*)addr;
; 234  : }

	ret	0
$LN5@pmmngr_all@2:
	push	ebx

; 221  : 
; 222  : 	int frame = mmap_first_free_s (size);

	push	edi
	call	?mmap_first_free_s@@YAHI@Z		; mmap_first_free_s
	mov	ebx, eax
	pop	ecx

; 223  : 
; 224  : 	if (frame == -1)

	cmp	ebx, -1
	jne	SHORT $LN4@pmmngr_all@2

; 225  : 		return 0;	//not enough space

	xor	eax, eax
	jmp	SHORT $LN12@pmmngr_all@2
$LN4@pmmngr_all@2:
	push	esi

; 226  : 
; 227  : 	for (uint32_t i=0; i<size; i++)

	xor	esi, esi
	test	edi, edi
	jbe	SHORT $LN1@pmmngr_all@2
$LL3@pmmngr_all@2:

; 228  : 		mmap_set (frame+i);

	lea	eax, DWORD PTR [esi+ebx]
	push	eax
	call	?mmap_set@@YAXH@Z			; mmap_set
	inc	esi
	pop	ecx
	cmp	esi, edi
	jb	SHORT $LL3@pmmngr_all@2
$LN1@pmmngr_all@2:

; 229  : 
; 230  : 	physical_addr addr = frame * PMMNGR_BLOCK_SIZE;
; 231  : 	_mmngr_used_blocks+=size;

	add	DWORD PTR __mmngr_used_blocks, edi
	mov	eax, ebx
	shl	eax, 12					; 0000000cH
	pop	esi
$LN12@pmmngr_all@2:
	pop	ebx
	pop	edi

; 232  : 
; 233  : 	return (void*)addr;
; 234  : }

	ret	0
?pmmngr_alloc_blocks@@YAPAXI@Z ENDP			; pmmngr_alloc_blocks
_TEXT	ENDS
END
