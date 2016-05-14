; Listing generated by Microsoft (R) Optimizing Compiler Version 15.00.30729.01 

	TITLE	c:\Users\so1\Desktop\OS Development series 14 - 19\Tutorial 17\SysCore\Kernel\panic.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	??_C@_0FM@GCJJFBAK@An?5internal?5error?5was?5detected?4?5@ ; `string'
PUBLIC	??_C@_0BJE@DIIIEOKN@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@ ; `string'
;	COMDAT ??_C@_0FM@GCJJFBAK@An?5internal?5error?5was?5detected?4?5@
CONST	SEGMENT
??_C@_0FM@GCJJFBAK@An?5internal?5error?5was?5detected?4?5@ DB 'An interna'
	DB	'l error was detected. The system has been halted.', 0aH, 'Ple'
	DB	'ase restart your computer.', 0aH, 0aH, 00H	; `string'
CONST	ENDS
_DATA	SEGMENT
_sickpc	DD	FLAT:??_C@_0BJE@DIIIEOKN@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@
_disc	DD	FLAT:??_C@_0FM@GCJJFBAK@An?5internal?5error?5was?5detected?4?5@
_DATA	ENDS
;	COMDAT ??_C@_0BJE@DIIIEOKN@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@
CONST	SEGMENT
??_C@_0BJE@DIIIEOKN@?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5?5@ DB ' '
	DB	'                               _______      ', 0aH, '        '
	DB	'                       |.-----.|    ', 0aH, '                '
	DB	'               ||x . x||    ', 0aH, '                        '
	DB	'       ||_.-._||    ', 0aH, '                               `'
	DB	'--)-(--`    ', 0aH, '                              __[=== o]_'
	DB	'__  ', 0aH, '                             |:::::::::::|\ ', 0aH
	DB	'                             `-=========-`()', 0aH, '        '
	DB	'                        M. O. S.', 0aH, 0aH, 00H ; `string'
CONST	ENDS
PUBLIC	??_C@_0BA@EIKHFOBF@?$CK?$CK?$CK?5STOP?3?5?$CFs?5?6?6?$AA@ ; `string'
PUBLIC	?kernel_panic@@YAXPBDZZ				; kernel_panic
EXTRN	?DebugPrintf@@YAHPBDZZ:PROC			; DebugPrintf
EXTRN	?vsprintf@@YAHPADPBDPAE@Z:PROC			; vsprintf
EXTRN	?DebugPuts@@YAXPAD@Z:PROC			; DebugPuts
EXTRN	?DebugSetColor@@YAII@Z:PROC			; DebugSetColor
EXTRN	?DebugGotoXY@@YAXII@Z:PROC			; DebugGotoXY
EXTRN	?DebugClrScr@@YAXE@Z:PROC			; DebugClrScr
EXTRN	?disable@@YAXXZ:PROC				; disable
;	COMDAT ??_C@_0BA@EIKHFOBF@?$CK?$CK?$CK?5STOP?3?5?$CFs?5?6?6?$AA@
; File c:\users\so1\desktop\os development series 14 - 19\tutorial 17\syscore\kernel\panic.cpp
CONST	SEGMENT
??_C@_0BA@EIKHFOBF@?$CK?$CK?$CK?5STOP?3?5?$CFs?5?6?6?$AA@ DB '*** STOP: %'
	DB	's ', 0aH, 0aH, 00H				; `string'
; Function compile flags: /Ogspy
CONST	ENDS
;	COMDAT ?kernel_panic@@YAXPBDZZ
_TEXT	SEGMENT
_buf$ = -1024						; size = 1024
_fmt$ = 8						; size = 4
?kernel_panic@@YAXPBDZZ PROC				; kernel_panic, COMDAT

; 27   : void _cdecl kernel_panic (const char* fmt, ...) {

	push	ebp
	mov	ebp, esp
	sub	esp, 1024				; 00000400H

; 28   : 
; 29   : 	disable ();

	call	?disable@@YAXXZ				; disable

; 30   : 
; 31   : 	DebugClrScr (0x13);

	push	19					; 00000013H
	call	?DebugClrScr@@YAXE@Z			; DebugClrScr

; 32   : 	DebugGotoXY (0,0);

	push	0
	push	0
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 33   : 	DebugSetColor (0x17);

	push	23					; 00000017H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 34   : 
; 35   : 	DebugPuts (sickpc);

	push	DWORD PTR _sickpc
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 36   : 	DebugPuts (disc);

	push	DWORD PTR _disc
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 37   : 
; 38   : 	va_list		args;
; 39   : 
; 40   : 	char buf[1024];
; 41   : 
; 42   : 	va_start (args, fmt);
; 43   : 	vsprintf (buf, fmt, args);

	lea	eax, DWORD PTR _fmt$[ebp+4]
	push	eax
	push	DWORD PTR _fmt$[ebp]
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	?vsprintf@@YAHPADPBDPAE@Z		; vsprintf

; 44   : 	va_end (args);
; 45   : 
; 46   : 	DebugPrintf ("*** STOP: %s \n\n", buf);

	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET ??_C@_0BA@EIKHFOBF@?$CK?$CK?$CK?5STOP?3?5?$CFs?5?6?6?$AA@
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 44					; 0000002cH
$LL2@kernel_pan:

; 47   : 
; 48   : 	for (;;);

	jmp	SHORT $LL2@kernel_pan
?kernel_panic@@YAXPBDZZ ENDP				; kernel_panic
_TEXT	ENDS
END
