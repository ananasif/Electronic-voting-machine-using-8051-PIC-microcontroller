
_main:

;EVM_IC_.c,19 :: 		void main()
;EVM_IC_.c,22 :: 		int a=0,b=0;
	CLRF       main_a_L0+0
	CLRF       main_a_L0+1
	CLRF       main_b_L0+0
	CLRF       main_b_L0+1
	CLRF       main_c_L0+0
	CLRF       main_c_L0+1
	CLRF       main_d_L0+0
	CLRF       main_d_L0+1
	CLRF       main_e_L0+0
	CLRF       main_e_L0+1
;EVM_IC_.c,24 :: 		trisd=1;
	MOVLW      1
	MOVWF      TRISD+0
;EVM_IC_.c,25 :: 		portd=0;
	CLRF       PORTD+0
;EVM_IC_.c,26 :: 		trisc=0;
	CLRF       TRISC+0
;EVM_IC_.c,27 :: 		portc=0;
	CLRF       PORTC+0
;EVM_IC_.c,29 :: 		while(1)
L_main0:
;EVM_IC_.c,32 :: 		Lcd_Init(); // Initialize Lcd
	CALL       _Lcd_Init+0
;EVM_IC_.c,33 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EVM_IC_.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EVM_IC_.c,35 :: 		Lcd_Out(1,1,"press button "); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,36 :: 		Lcd_Out(2,1,"cast your vote"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,38 :: 		while(portd==0)
L_main2:
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;EVM_IC_.c,40 :: 		}
	GOTO       L_main2
L_main3:
;EVM_IC_.c,41 :: 		if (portd==0b00100000)
	MOVF       PORTD+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;EVM_IC_.c,43 :: 		e=1;
	MOVLW      1
	MOVWF      main_e_L0+0
	MOVLW      0
	MOVWF      main_e_L0+1
;EVM_IC_.c,44 :: 		}
L_main4:
;EVM_IC_.c,45 :: 		while (e==1)
L_main5:
	MOVLW      0
	XORWF      main_e_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      1
	XORWF      main_e_L0+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;EVM_IC_.c,47 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EVM_IC_.c,48 :: 		Lcd_Out(1,1,"1:Asif 2:Zakaria"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,49 :: 		Lcd_Out(2,1,"3:Aiaj 4:Tanbin"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,50 :: 		while(portd==0)
L_main7:
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;EVM_IC_.c,52 :: 		}
	GOTO       L_main7
L_main8:
;EVM_IC_.c,55 :: 		if (portd==0b00000001)
	MOVF       PORTD+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;EVM_IC_.c,57 :: 		a=a+1;
	INCF       main_a_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_a_L0+1, 1
;EVM_IC_.c,58 :: 		e=0;
	CLRF       main_e_L0+0
	CLRF       main_e_L0+1
;EVM_IC_.c,59 :: 		}
L_main9:
;EVM_IC_.c,60 :: 		if (portd==0b00000010)
	MOVF       PORTD+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;EVM_IC_.c,62 :: 		b=b+1;
	INCF       main_b_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_b_L0+1, 1
;EVM_IC_.c,63 :: 		e=0;
	CLRF       main_e_L0+0
	CLRF       main_e_L0+1
;EVM_IC_.c,64 :: 		}
L_main10:
;EVM_IC_.c,65 :: 		if (portd==0b00000100)
	MOVF       PORTD+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;EVM_IC_.c,67 :: 		c=c+1;
	INCF       main_c_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_c_L0+1, 1
;EVM_IC_.c,68 :: 		e=0;
	CLRF       main_e_L0+0
	CLRF       main_e_L0+1
;EVM_IC_.c,69 :: 		}
L_main11:
;EVM_IC_.c,70 :: 		if (portd==0b00001000)
	MOVF       PORTD+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;EVM_IC_.c,72 :: 		d=d+1;
	INCF       main_d_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_d_L0+1, 1
;EVM_IC_.c,73 :: 		e=0;
	CLRF       main_e_L0+0
	CLRF       main_e_L0+1
;EVM_IC_.c,74 :: 		}
L_main12:
;EVM_IC_.c,75 :: 		if (portd==0b00010000)
	MOVF       PORTD+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;EVM_IC_.c,78 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EVM_IC_.c,79 :: 		inttostr(a, txt);
	MOVF       main_a_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_a_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EVM_IC_.c,80 :: 		inttostr(b, txt1);
	MOVF       main_b_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_b_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EVM_IC_.c,81 :: 		inttostr(c, txt2);
	MOVF       main_c_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_c_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EVM_IC_.c,82 :: 		inttostr(d, txt3);
	MOVF       main_d_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_d_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt3+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EVM_IC_.c,83 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
;EVM_IC_.c,85 :: 		Lcd_out(1,1,"1:"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,86 :: 		Lcd_out(1,4,txt); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,87 :: 		Lcd_out(2,1,"3:"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,88 :: 		Lcd_out(2,4,txt2); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,89 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;EVM_IC_.c,90 :: 		Lcd_out(1,1,"2:"); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,91 :: 		Lcd_out(1,4,txt1); // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,92 :: 		Lcd_out(2,1,"4:"); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_EVM_IC_+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,93 :: 		Lcd_out(2,4,txt3); // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EVM_IC_.c,94 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;EVM_IC_.c,95 :: 		}
L_main13:
;EVM_IC_.c,97 :: 		}
	GOTO       L_main5
L_main6:
;EVM_IC_.c,98 :: 		}
	GOTO       L_main0
;EVM_IC_.c,99 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
