org $0F8000

.init_GOAL
    LDY #$05            ; $0F8000   |
    STY $18,x           ; $0F8002   |
    LDX #$1C            ; $0F8004   |

CODE_0F8006:
    LDA $5FCC10,x       ; $0F8006   |
    STA $702ECE,x       ; $0F800A   |
    STA $702162,x       ; $0F800E   |
    DEX                 ; $0F8012   |
    DEX                 ; $0F8013   |
    BPL CODE_0F8006     ; $0F8014   |
    LDX $12             ; $0F8016   |
    RTL                 ; $0F8018   |

.main_GOAL
    LDY $74A2,x         ; $0F8019   |
    BMI CODE_0F805B     ; $0F801C   |
    LDA #$00E0          ; $0F801E   |
    STA $7680,x         ; $0F8021   |
    CLC                 ; $0F8024   |
    ADC $0039           ; $0F8025   |
    STA $70E2,x         ; $0F8028   |
    LDA #$0020          ; $0F802B   |
    STA $7682,x         ; $0F802E   |
    CLC                 ; $0F8031   |
    ADC $003B           ; $0F8032   |
    STA $7182,x         ; $0F8035   |
    LDY $18,x           ; $0F8038   |
    TYA                 ; $0F803A   |
    STA $300A           ; $0F803B   |
    LDY $19,x           ; $0F803E   |
    TYA                 ; $0F8040   |
    STA $300C           ; $0F8041   |
    LDY $76,x           ; $0F8044   |
    TYA                 ; $0F8046   |
    STA $3012           ; $0F8047   |
    LDY $77,x           ; $0F804A   |
    TYA                 ; $0F804C   |
    STA $3014           ; $0F804D   |
    LDX #$09            ; $0F8050   |
    LDA #$ACDA          ; $0F8052   |
    JSL $7EDE44         ; $0F8055   | GSU init
    LDX $12             ; $0F8059   |

CODE_0F805B:
    LDY $16,x           ; $0F805B   |
    TYX                 ; $0F805D   |
    JMP ($8061,x)       ; $0F805E   | GOAL_ptr

.GOAL_ptr
DATA_0F8061:         dw $8069, $8082, $80A0, $80CD

; GOAL_ptr sub
    LDX $12             ; $0F8069   |
    SEP #$20            ; $0F806B   |
    LDA $19,x           ; $0F806D   |
    CLC                 ; $0F806F   |
    ADC #$08            ; $0F8070   |
    STA $19,x           ; $0F8072   |
    TAY                 ; $0F8074   |
    REP #$20            ; $0F8075   |
    CPY #$A0            ; $0F8077   |
    BCC CODE_0F8081     ; $0F8079   |

CODE_0F807B:
    LDY $16,x           ; $0F807B   |
    INY                 ; $0F807D   |
    INY                 ; $0F807E   |
    STY $16,x           ; $0F807F   |

CODE_0F8081:
    RTL                 ; $0F8081   |

; GOAL_ptr sub
    LDX $12             ; $0F8082   |
    SEP #$20            ; $0F8084   |
    LDA $19,x           ; $0F8086   |
    SEC                 ; $0F8088   |
    SBC #$04            ; $0F8089   |
    STA $19,x           ; $0F808B   |
    TAY                 ; $0F808D   |
    REP #$20            ; $0F808E   |
    CPY #$80            ; $0F8090   |
    BCS CODE_0F8081     ; $0F8092   |
    LDY #$80            ; $0F8094   |
    STY $19,x           ; $0F8096   |
    LDA #$0040          ; $0F8098   |
    STA $7A96,x         ; $0F809B   |
    BRA CODE_0F807B     ; $0F809E   |

; GOAL_ptr sub
    LDX $12             ; $0F80A0   |
    LDA $0385           ; $0F80A2   |
    BNE CODE_0F807B     ; $0F80A5   |
    LDA $7A96,x         ; $0F80A7   |
    BNE CODE_0F80C2     ; $0F80AA   |
    LDY $77,x           ; $0F80AC   |
    INY                 ; $0F80AE   |
    CPY #$40            ; $0F80AF   |
    BCC CODE_0F80B5     ; $0F80B1   |
    LDY #$40            ; $0F80B3   |

CODE_0F80B5:
    STY $77,x           ; $0F80B5   |
    SEP #$20            ; $0F80B7   |
    LDA $76,x           ; $0F80B9   |
    CLC                 ; $0F80BB   |
    ADC #$04            ; $0F80BC   |
    STA $76,x           ; $0F80BE   |
    REP #$20            ; $0F80C0   |

CODE_0F80C2:
    RTL                 ; $0F80C2   |

DATA_0F80C3:         dw $0008, $0014, $0014, $0014, $0014

; GOAL_ptr sub
    LDX $12             ; $0F80CD   |
    LDA $7A96,x         ; $0F80CF   |
    BNE CODE_0F8134     ; $0F80D2   |
    LDY $18,x           ; $0F80D4   |
    DEY                 ; $0F80D6   |
    BPL CODE_0F80DD     ; $0F80D7   |
    JMP CODE_0F03A3     ; $0F80D9   |

CODE_0F80DD:
    STY $18,x           ; $0F80DD   |
    TYX                 ; $0F80DF   |
    SEP #$20            ; $0F80E0   |
    LDA #$00            ; $0F80E2   |
    XBA                 ; $0F80E4   |
    LDA $09AD61,x       ; $0F80E5   |
    PHA                 ; $0F80E9   |
    TXA                 ; $0F80EA   |
    ASL A               ; $0F80EB   |
    TAX                 ; $0F80EC   |
    PLA                 ; $0F80ED   |
    REP #$20            ; $0F80EE   |
    SEC                 ; $0F80F0   |
    SBC $80C3,x         ; $0F80F1   |
    STA $00             ; $0F80F4   |
    LDX $12             ; $0F80F6   |
    LDA $0385           ; $0F80F8   |
    BMI CODE_0F8104     ; $0F80FB   |
    LDA #$0036          ; $0F80FD   |\ play sound #$0036
    JSL $0085D2         ; $0F8100   |/

CODE_0F8104:
    LDA #$01CD          ; $0F8104   |
    JSL $008B21         ; $0F8107   |
    LDA $70E2,x         ; $0F810B   |
    SEC                 ; $0F810E   |
    SBC $00             ; $0F810F   |
    SEC                 ; $0F8111   |
    SBC #$0008          ; $0F8112   |
    STA $70A2,y         ; $0F8115   |
    LDA $7182,x         ; $0F8118   |
    CLC                 ; $0F811B   |
    ADC #$0010          ; $0F811C   |
    STA $7142,y         ; $0F811F   |
    LDA #$000B          ; $0F8122   |
    STA $7E4C,y         ; $0F8125   |
    LDA #$0004          ; $0F8128   |
    STA $7782,y         ; $0F812B   |
    LDA #$0008          ; $0F812E   |
    STA $7A96,x         ; $0F8131   |

CODE_0F8134:
    RTL                 ; $0F8134   |

.init_BONUS
    LDA $0039           ; $0F8135   |
    STA $78,x           ; $0F8138   |
    CLC                 ; $0F813A   |
    ADC #$0080          ; $0F813B   |
    STA $70E2,x         ; $0F813E   |
    STA $7A36,x         ; $0F8141   |
    LDA $003B           ; $0F8144   |
    SEC                 ; $0F8147   |
    SBC #$0040          ; $0F8148   |
    STA $7182,x         ; $0F814B   |
    LDY #$02            ; $0F814E   |
    STY $18,x           ; $0F8150   |
    LDX #$1C            ; $0F8152   |

CODE_0F8154:
    LDA $5FCBF2,x       ; $0F8154   |
    STA $702F2E,x       ; $0F8158   |
    STA $7021C2,x       ; $0F815C   |
    DEX                 ; $0F8160   |
    DEX                 ; $0F8161   |
    BPL CODE_0F8154     ; $0F8162   |
    LDX $12             ; $0F8164   |
    LDA #$0095          ; $0F8166   |\ play sound #$0095
    JSL $0085D2         ; $0F8169   |/
    RTL                 ; $0F816D   |

DATA_0F816E:         dw $0000, $FE00, $FC00

.main_BONUS
    LDY $74A2,x         ; $0F8174   |
    BMI CODE_0F8196     ; $0F8177   |
    LDA #$000F          ; $0F8179   |
    STA $3000           ; $0F817C   |
    LDA #$8276          ; $0F817F   |
    STA $300A           ; $0F8182   |
    LDA #$002E          ; $0F8185   |
    STA $3018           ; $0F8188   |
    LDX #$09            ; $0F818B   |
    LDA #$AE83          ; $0F818D   |
    JSL $7EDE44         ; $0F8190   | GSU init
    LDX $12             ; $0F8194   |

CODE_0F8196:
    JSR CODE_0F822B     ; $0F8196   |
    LDY $16,x           ; $0F8199   |
    TYX                 ; $0F819B   |
    JMP ($819F,x)       ; $0F819C   |

.BONUS_ptr
DATA_0F819F:         dw $81AF, $81AF, $81CA, $81E4

DATA_0F81A8:         dw $0021, $0022
DATA_0F81AC:         dw $D000, $D400

; BONUS_ptr sub
    REP #$10            ; $0F81AF   |
    LDA $81AB,x         ; $0F81B1   |
    STA $0CF9           ; $0F81B4   |
    LDA $81A7,x         ; $0F81B7   |
    JSL $00B753         ; $0F81BA   |
    SEP #$10            ; $0F81BE   |
    LDX $12             ; $0F81C0   |
    LDA #$0020          ; $0F81C2   |
    STA $7A96,x         ; $0F81C5   |
    BRA CODE_0F81DD     ; $0F81C8   |

; BONUS_ptr sub
    LDX $12             ; $0F81CA   |
    LDA $7A96,x         ; $0F81CC   |
    BNE CODE_0F81E3     ; $0F81CF   |
    LDA #$0040          ; $0F81D1   |
    STA $7542,x         ; $0F81D4   |
    LDA #$0800          ; $0F81D7   |
    STA $75E2,x         ; $0F81DA   |

CODE_0F81DD:
    LDY $16,x           ; $0F81DD   |
    INY                 ; $0F81DF   |
    INY                 ; $0F81E0   |
    STY $16,x           ; $0F81E1   |

CODE_0F81E3:
    RTL                 ; $0F81E3   |

; BONUS_ptr sub
    LDX $12             ; $0F81E4   |
    LDA $78,x           ; $0F81E6   |
    SEC                 ; $0F81E8   |
    SBC $0039           ; $0F81E9   |
    CLC                 ; $0F81EC   |
    ADC $7A36,x         ; $0F81ED   |
    STA $70E2,x         ; $0F81F0   |
    LDA $003B           ; $0F81F3   |
    CLC                 ; $0F81F6   |
    ADC #$0050          ; $0F81F7   |
    CMP $7182,x         ; $0F81FA   |
    BPL CODE_0F8210     ; $0F81FD   |
    STA $7182,x         ; $0F81FF   |
    LDY $18,x           ; $0F8202   |
    LDA $816E,y         ; $0F8204   |
    STA $7222,x         ; $0F8207   |
    DEY                 ; $0F820A   |
    DEY                 ; $0F820B   |
    BMI CODE_0F8210     ; $0F820C   |
    STY $18,x           ; $0F820E   |

CODE_0F8210:
    RTL                 ; $0F8210   |

DATA_0F8211:         dw $44A6, $48C7, $4CE8, $5109

DATA_0F8219:         dw $001F, $023F, $037F, $03F3
DATA_0F8221:         dw $0327, $7F20, $7E66, $7D77
DATA_0F8229:         dw $7C1F

; BONUS sub

CODE_0F822B:
    LDA $14             ; $0F822B   |
    AND #$0007          ; $0F822D   |
    BNE CODE_0F8273     ; $0F8230   |
    LDY $76,x           ; $0F8232   |
    INY                 ; $0F8234   |
    INY                 ; $0F8235   |
    CPY #$12            ; $0F8236   |
    BNE CODE_0F823C     ; $0F8238   |
    LDY #$00            ; $0F823A   |

CODE_0F823C:
    STY $76,x           ; $0F823C   |
    LDX #$10            ; $0F823E   |

CODE_0F8240:
    LDA $8219,y         ; $0F8240   |
    STA $7021C6,x       ; $0F8243   |
    INY                 ; $0F8247   |
    INY                 ; $0F8248   |
    CPY #$12            ; $0F8249   |
    BNE CODE_0F824F     ; $0F824B   |
    LDY #$00            ; $0F824D   |

CODE_0F824F:
    DEX                 ; $0F824F   |
    DEX                 ; $0F8250   |
    BPL CODE_0F8240     ; $0F8251   |
    LDX $12             ; $0F8253   |
    LDY $77,x           ; $0F8255   |
    INY                 ; $0F8257   |
    INY                 ; $0F8258   |
    STY $77,x           ; $0F8259   |
    TYA                 ; $0F825B   |
    AND #$0006          ; $0F825C   |
    TAY                 ; $0F825F   |
    LDX #$06            ; $0F8260   |

CODE_0F8262:
    LDA $8211,y         ; $0F8262   |
    STA $7021D8,x       ; $0F8265   |
    DEY                 ; $0F8269   |
    DEY                 ; $0F826A   |
    BPL CODE_0F826F     ; $0F826B   |
    LDY #$06            ; $0F826D   |

CODE_0F826F:
    DEX                 ; $0F826F   |
    DEX                 ; $0F8270   |
    BPL CODE_0F8262     ; $0F8271   |

CODE_0F8273:
    LDX $12             ; $0F8273   |
    RTS                 ; $0F8275   |

; gsu table
DATA_0F8276:         dw $24E8, $3D0A, $2000, $0B14
DATA_0F827E:         dw $003D, $1428, $3D0C, $3000
DATA_0F8286:         dw $600C, $027D, $1C18, $3D50
DATA_0F828E:         dw $0800, $0D14, $003D, $1418
DATA_0F8296:         dw $3D0F, $1000, $0E14, $003D
DATA_0F829E:         dw $DCF8, $3D4E, $0800, $4EDC
DATA_0F82A6:         dw $007D, $D400, $3D10, $0000
DATA_0F82AE:         dw $4FDC, $003D, $E410, $7D05
DATA_0F82B6:         dw $2800, $1CEC, $023D, $E428
DATA_0F82BE:         dw $7D01, $1802, $1AEC, $023D
DATA_0F82C6:         dw $E418, $7D03, $1002, $19EC
DATA_0F82CE:         dw $003D, $E400, $3D07, $0802
DATA_0F82D6:         dw $28F4, $023D, $0430, $3D4D
DATA_0F82DE:         dw $B800, $5EF4, $003D, $F4C0
DATA_0F82E6:         dw $3D5F, $0000, $6714, $003D
DATA_0F82EE:         dw $04C8, $3D40, $3800, $1EEC
DATA_0F82F6:         dw $023D, $14F0, $3D65, $2002
DATA_0F82FE:         dw $4B04, $023D, $0410, $3D49
DATA_0F8306:         dw $0002, $4704, $023D, $04F0
DATA_0F830E:         dw $3D45, $E002, $4304, $023D
DATA_0F8316:         dw $04D0, $3D41, $F002, $05E4
DATA_0F831E:         dw $023D, $E4E0, $3D03, $D002
DATA_0F8326:         dw $01E4, $023D, $14E8, $3D64
DATA_0F832E:         dw $D802, $6214, $023D, $14C8
DATA_0F8336:         dw $3D60, $3802, $2EF4, $023D
DATA_0F833E:         dw $F428, $3D2C, $1802, $2AF4
DATA_0F8346:         dw $023D, $F4F8, $3D26, $E802
DATA_0F834E:         dw $24F4, $023D, $F4D8, $3D22
DATA_0F8356:         dw $C802, $20F4, $023D

; Crazee Dayzee colors
; Yellow, White, Purple,
; Yellow, White, Purple,
; Yellow, White
DATA_0F835C:         dw $0200 				 ; Yellow
DATA_0F835E:         dw $0400 				 ; White
DATA_0F8360:         dw $0800 				 ; Purple
DATA_0F8362:         dw $0200 				 ; Yellow
DATA_0F8364:         dw $0400 				 ; White
DATA_0F8366:         dw $0800 				 ; Purple
DATA_0F8368:         dw $0200 				 ; Yellow
DATA_0F836A:         dw $0400 				 ; White

DATA_0F836C:         dw $FFC0
DATA_0F836E:         dw $0040

.init_crazee_dayzee
    LDA $7900,x         ; $0F8370   |
    BNE CODE_0F839B     ; $0F8373   |
    LDA $70E2,x         ; $0F8375   |
    AND #$0010          ; $0F8378   |
    LSR A               ; $0F837B   |
    LSR A               ; $0F837C   |
    LSR A               ; $0F837D   |
    LSR A               ; $0F837E   |
    INC A               ; $0F837F   |
    STA $7900,x         ; $0F8380   |
    DEC A               ; $0F8383   |
    BNE CODE_0F8395     ; $0F8384   |
    LDA $10             ; $0F8386   |
    AND #$0001          ; $0F8388   |
    ASL A               ; $0F838B   |
    TAY                 ; $0F838C   |
    LDA $835C,y         ; $0F838D   |
    STA $7902,x         ; $0F8390   |
    BRA CODE_0F839B     ; $0F8393   |

CODE_0F8395:
    LDA #$0800          ; $0F8395   |
    STA $7902,x         ; $0F8398   |

CODE_0F839B:
    JMP CODE_0F84AE     ; $0F839B   |

.main_crazee_dayzee
    JSR CODE_0F858F     ; $0F839E   |
    LDA $6FA0,x         ; $0F83A1   |
    LDY $7D38,x         ; $0F83A4   |
    BNE CODE_0F83AE     ; $0F83A7   |
    AND #$FDFF          ; $0F83A9   |
    BRA CODE_0F83B1     ; $0F83AC   |

CODE_0F83AE:
    ORA #$0200          ; $0F83AE   |

CODE_0F83B1:
    STA $6FA0,x         ; $0F83B1   |
    JSL $03AF23         ; $0F83B4   |
    JSL $03A5B7         ; $0F83B8   |
    JSR CODE_0F85CB     ; $0F83BC   |
    LDA $16,x           ; $0F83BF   |
    TAX                 ; $0F83C1   |
    JMP ($83C5,x)       ; $0F83C2   |

DATA_0F83C5:         dw $83E3, $8487, $84DB

DATA_0F83CB:         dw $0201, $0403, $0605
DATA_0F83D1:         dw $0405, $0203, $0001

DATA_0F83D7:         dw $0404, $0404, $0804
DATA_0F83DD:         dw $0404, $0404, $0804

    LDX $12             ; $0F83E3   |
    LDA $7A98,x         ; $0F83E5   |
    BNE CODE_0F83F3     ; $0F83E8   |
    LDA #$0020          ; $0F83EA   |
    STA $7A98,x         ; $0F83ED   |
    JSR CODE_0F85FC     ; $0F83F0   |

CODE_0F83F3:
    LDA $7860,x         ; $0F83F3   |
    BIT #$000C          ; $0F83F6   |
    BNE CODE_0F8432     ; $0F83F9   |
    BIT #$0001          ; $0F83FB   |
    BEQ CODE_0F8432     ; $0F83FE   |
    LDA $7900,x         ; $0F8400   |
    DEC A               ; $0F8403   |
    BEQ CODE_0F8412     ; $0F8404   |
    LDA $7AF6,x         ; $0F8406   |
    BNE CODE_0F8412     ; $0F8409   |
    LDA $10             ; $0F840B   |
    AND #$003F          ; $0F840D   |
    BEQ CODE_0F8450     ; $0F8410   |

CODE_0F8412:
    LDA $7A96,x         ; $0F8412   |
    BNE CODE_0F8431     ; $0F8415   |
    SEP #$20            ; $0F8417   |
    DEC $18,x           ; $0F8419   |
    BPL CODE_0F8421     ; $0F841B   |
    LDA #$0B            ; $0F841D   |
    STA $18,x           ; $0F841F   |

CODE_0F8421:
    LDY $18,x           ; $0F8421   |
    LDA $83CB,y         ; $0F8423   |
    STA $7402,x         ; $0F8426   |
    LDA $83D7,y         ; $0F8429   |
    STA $7A96,x         ; $0F842C   |
    REP #$20            ; $0F842F   |

CODE_0F8431:
    RTL                 ; $0F8431   |

CODE_0F8432:
    LDA #$0007          ; $0F8432   |
    STA $18,x           ; $0F8435   |
    SEP #$20            ; $0F8437   |
    TAY                 ; $0F8439   |
    LDA $846F,y         ; $0F843A   |
    STA $7402,x         ; $0F843D   |
    LDA $8477,y         ; $0F8440   |
    STA $7A96,x         ; $0F8443   |
    REP #$20            ; $0F8446   |
    STZ $7220,x         ; $0F8448   |
    INC $16,x           ; $0F844B   |
    INC $16,x           ; $0F844D   |
    RTL                 ; $0F844F   |

CODE_0F8450:
    STZ $7220,x         ; $0F8450   |
    STZ $7A98,x         ; $0F8453   |
    SEP #$20            ; $0F8456   |
    LDY #$02            ; $0F8458   |
    STY $18,x           ; $0F845A   |
    LDA $84D2,y         ; $0F845C   |
    STA $7402,x         ; $0F845F   |
    LDA $84D5,y         ; $0F8462   |
    STA $7A96,x         ; $0F8465   |
    LDA #$04            ; $0F8468   |
    STA $16,x           ; $0F846A   |
    REP #$20            ; $0F846C   |
    RTL                 ; $0F846E   |

DATA_0F846F:         dw $0707, $0707, $0708, $0708

DATA_0F8477:         dw $1010, $1010, $0404, $0404

DATA_0F847F:         dw $0202, $0002, $0000, $0000

    LDX $12             ; $0F8487   |
    LDA $7A96,x         ; $0F8489   |
    BNE CODE_0F84AD     ; $0F848C   |
    DEC $18,x           ; $0F848E   |
    BMI CODE_0F84AE     ; $0F8490   |
    SEP #$20            ; $0F8492   |
    LDY $18,x           ; $0F8494   |
    LDA $846F,y         ; $0F8496   |
    STA $7402,x         ; $0F8499   |
    LDA $8477,y         ; $0F849C   |
    STA $7A96,x         ; $0F849F   |
    LDA $7400,x         ; $0F84A2   |
    EOR $847F,y         ; $0F84A5   |
    STA $7400,x         ; $0F84A8   |
    REP #$20            ; $0F84AB   |

CODE_0F84AD:
    RTL                 ; $0F84AD   |

CODE_0F84AE:
    LDY $7400,x         ; $0F84AE   |
    LDA $836C,y         ; $0F84B1   |
    STA $7220,x         ; $0F84B4   |
    STZ $7A98,x         ; $0F84B7   |
    SEP #$20            ; $0F84BA   |
    LDA #$0B            ; $0F84BC   |
    STA $18,x           ; $0F84BE   |
    TAY                 ; $0F84C0   |
    LDA $83CB,y         ; $0F84C1   |
    STA $7402,x         ; $0F84C4   |
    LDA $83D7,y         ; $0F84C7   |
    STA $7A96,x         ; $0F84CA   |
    REP #$20            ; $0F84CD   |
    STZ $16,x           ; $0F84CF   |
    RTL                 ; $0F84D1   |

DATA_0F84D2:         db $09, $08, $07

DATA_0F84D5:         db $20, $20, $08

DATA_0F84D8:         db $00, $01, $00

    LDX $12             ; $0F84DB   |
    LDA $7A96,x         ; $0F84DD   |
    BNE CODE_0F8504     ; $0F84E0   |
    LDY $18,x           ; $0F84E2   |
    DEY                 ; $0F84E4   |
    BMI CODE_0F8511     ; $0F84E5   |
    STY $18,x           ; $0F84E7   |
    SEP #$20            ; $0F84E9   |
    LDA $84D2,y         ; $0F84EB   |
    STA $7402,x         ; $0F84EE   |
    LDA $84D5,y         ; $0F84F1   |
    STA $7A96,x         ; $0F84F4   |
    LDA $84D8,y         ; $0F84F7   |
    BEQ CODE_0F8502     ; $0F84FA   |
    LDA $77C2,x         ; $0F84FC   |
    STA $7400,x         ; $0F84FF   |

CODE_0F8502:
    REP #$20            ; $0F8502   |

CODE_0F8504:
    LDY $18,x           ; $0F8504   |
    BNE CODE_0F8510     ; $0F8506   |
    LDA $7A98,x         ; $0F8508   |
    BNE CODE_0F8510     ; $0F850B   |
    JSR CODE_0F8521     ; $0F850D   |

CODE_0F8510:
    RTL                 ; $0F8510   |

CODE_0F8511:
    LDA #$0020          ; $0F8511   |
    STA $7AF6,x         ; $0F8514   |
    BRA CODE_0F84AE     ; $0F8517   |

DATA_0F8519:         dw $FD00, $0300

DATA_0F851D:         dw $FFE8, $0008

CODE_0F8521:
    LDY $7400,x         ; $0F8521   |
    LDA $8519,y         ; $0F8524   |
    STA $00             ; $0F8527   |
    LDA $851D,y         ; $0F8529   |
    STA $02             ; $0F852C   |
    LDA #$0019          ; $0F852E   |
    JSL $03A34C         ; $0F8531   |
    BCC CODE_0F8566     ; $0F8535   |
    LDA $7CD6,x         ; $0F8537   |
    CLC                 ; $0F853A   |
    ADC $02             ; $0F853B   |
    STA $70E2,y         ; $0F853D   |
    LDA $7182,x         ; $0F8540   |
    STA $7182,y         ; $0F8543   |
    LDA $00             ; $0F8546   |
    STA $7220,y         ; $0F8548   |
    LDA #$000A          ; $0F854B   |
    STA $7A98,y         ; $0F854E   |
    LDA #$0004          ; $0F8551   |
    STA $7402,y         ; $0F8554   |
    LDA #$0004          ; $0F8557   |
    STA $7A98,x         ; $0F855A   |
    LDA $6FA0,y         ; $0F855D   |
    AND #$F9FF          ; $0F8560   |
    STA $6FA0,y         ; $0F8563   |

CODE_0F8566:
    RTS                 ; $0F8566   |

DATA_0F8567:         dw $0010, $0018, $0010, $0018
DATA_0F856F:         dw $0010, $0018, $0010, $0018
DATA_0F8577:         dw $0010, $0018, $0018, $0020
DATA_0F857F:         dw $0018, $0020, $0008, $0010
DATA_0F8587:         dw $0000, $0010, $0000, $0010

CODE_0F858F:
    LDA $7402,x         ; $0F858F   |
    ASL A               ; $0F8592   |
    ASL A               ; $0F8593   |
    TAY                 ; $0F8594   |
    LDA $8567,y         ; $0F8595   |
    STA $00             ; $0F8598   |
    LDA $8569,y         ; $0F859A   |
    STA $02             ; $0F859D   |
    LDY $74A2,x         ; $0F859F   |
    BMI CODE_0F85CA     ; $0F85A2   |
    REP #$10            ; $0F85A4   |
    LDA $7362,x         ; $0F85A6   |
    BMI CODE_0F85C8     ; $0F85A9   |
    CLC                 ; $0F85AB   |
    ADC $00             ; $0F85AC   |
    TAY                 ; $0F85AE   |
    LDA $6004,y         ; $0F85AF   |
    ORA $7902,x         ; $0F85B2   |
    STA $6004,y         ; $0F85B5   |
    LDA $7362,x         ; $0F85B8   |
    CLC                 ; $0F85BB   |
    ADC $02             ; $0F85BC   |
    TAY                 ; $0F85BE   |
    LDA $6004,y         ; $0F85BF   |
    ORA $7902,x         ; $0F85C2   |
    STA $6004,y         ; $0F85C5   |

CODE_0F85C8:
    SEP #$10            ; $0F85C8   |

CODE_0F85CA:
    RTS                 ; $0F85CA   |

CODE_0F85CB:
    LDY $7D36,x         ; $0F85CB   |
    DEY                 ; $0F85CE   |
    BMI CODE_0F85F7     ; $0F85CF   |
    BEQ CODE_0F85F7     ; $0F85D1   |
    LDA $6F00,y         ; $0F85D3   |
    CMP #$0010          ; $0F85D6   |
    BNE CODE_0F85F7     ; $0F85D9   |
    LDA $7D38,y         ; $0F85DB   |
    BEQ CODE_0F85F7     ; $0F85DE   |
    LDA $7542,y         ; $0F85E0   |
    CMP #$0040          ; $0F85E3   |
    BCC CODE_0F85EF     ; $0F85E6   |
    TYX                 ; $0F85E8   |
    JSL $03B24B         ; $0F85E9   |
    LDX $12             ; $0F85ED   |

CODE_0F85EF:
    LDA #$000E          ; $0F85EF   |
    STA $6F00,x         ; $0F85F2   |
    PLA                 ; $0F85F5   |
    RTL                 ; $0F85F6   |

CODE_0F85F7:
    RTS                 ; $0F85F7   |

DATA_0F85F8:         dw $0060, $FFA0

CODE_0F85FC:
    LDY $7400,x         ; $0F85FC   |
    LDA $85F8,y         ; $0F85FF   |
    STA $00             ; $0F8602   |
    LDA #$0212          ; $0F8604   |
    JSL $008B21         ; $0F8607   |
    LDA $70E2,x         ; $0F860B   |
    STA $70A2,y         ; $0F860E   |
    LDA $7182,x         ; $0F8611   |
    SEC                 ; $0F8614   |
    SBC #$0010          ; $0F8615   |
    STA $7142,y         ; $0F8618   |
    STA $7E4C,y         ; $0F861B   |
    LDA $00             ; $0F861E   |
    STA $71E0,y         ; $0F8620   |
    LDA #$FF80          ; $0F8623   |
    STA $71E2,y         ; $0F8626   |
    LDA #$0008          ; $0F8629   |
    STA $7502,y         ; $0F862C   |
    LDA #$0040          ; $0F862F   |
    STA $7782,y         ; $0F8632   |
    RTS                 ; $0F8635   |

    LDA #$0039          ; $0F8636   |\ play sound #$0039
    JSL $0085D2         ; $0F8639   |/
    LDA $7902,x         ; $0F863D   |
    XBA                 ; $0F8640   |
    STA $00             ; $0F8641   |
    JSL $07FD68         ; $0F8643   |
    JMP CODE_0F03A3     ; $0F8647   |

.init_stork
    STZ $7400,x         ; $0F864B   |
    RTL                 ; $0F864E   |

DATA_0F864F:         db $02, $00, $02, $00, $02, $00

DATA_0F8655:         db $20, $04, $04, $08, $10, $30

DATA_0F865B:         db $02, $03, $02, $01

    JSL $03AF23         ; $0F865F   |
    LDY $16,x           ; $0F8663   |
    TYX                 ; $0F8665   |
    JMP ($8669,x)       ; $0F8666   |

DATA_0F8669:         dw $866F, $869A, $86C1

    LDX $12             ; $0F866F   |
    LDA $70E2,x         ; $0F8671   |
    SEC                 ; $0F8674   |
    SBC $608C           ; $0F8675   |
    CLC                 ; $0F8678   |
    ADC #$0080          ; $0F8679   |
    CMP #$0100          ; $0F867C   |
    BCS CODE_0F8699     ; $0F867F   |
    SEP #$20            ; $0F8681   |
    LDY #$05            ; $0F8683   |
    STY $18,x           ; $0F8685   |
    LDA $864F,y         ; $0F8687   |
    STA $7402,x         ; $0F868A   |
    LDA $8655,y         ; $0F868D   |
    STA $7A96,x         ; $0F8690   |
    INC $16,x           ; $0F8693   |
    INC $16,x           ; $0F8695   |
    REP #$20            ; $0F8697   |

CODE_0F8699:
    RTL                 ; $0F8699   |

    LDX $12             ; $0F869A   |
    LDA $7A96,x         ; $0F869C   |
    BNE CODE_0F86B8     ; $0F869F   |
    LDY $18,x           ; $0F86A1   |
    DEY                 ; $0F86A3   |
    BMI CODE_0F86B9     ; $0F86A4   |
    STY $18,x           ; $0F86A6   |
    SEP #$20            ; $0F86A8   |
    LDA $864F,y         ; $0F86AA   |
    STA $7402,x         ; $0F86AD   |
    LDA $8655,y         ; $0F86B0   |
    STA $7A96,x         ; $0F86B3   |
    REP #$20            ; $0F86B6   |

CODE_0F86B8:
    RTL                 ; $0F86B8   |

CODE_0F86B9:
    LDY $16,x           ; $0F86B9   |
    INY                 ; $0F86BB   |
    INY                 ; $0F86BC   |
    STY $16,x           ; $0F86BD   |
    BRA CODE_0F86CD     ; $0F86BF   |

    LDX $12             ; $0F86C1   |
    LDA $7A96,x         ; $0F86C3   |
    BNE CODE_0F86E0     ; $0F86C6   |
    LDY $18,x           ; $0F86C8   |
    DEY                 ; $0F86CA   |
    BPL CODE_0F86CF     ; $0F86CB   |

CODE_0F86CD:
    LDY #$03            ; $0F86CD   |

CODE_0F86CF:
    STY $18,x           ; $0F86CF   |
    SEP #$20            ; $0F86D1   |
    LDA $865B,y         ; $0F86D3   |
    STA $7402,x         ; $0F86D6   |
    LDA #$04            ; $0F86D9   |
    STA $7A96,x         ; $0F86DB   |
    REP #$20            ; $0F86DE   |

CODE_0F86E0:
    RTL                 ; $0F86E0   |

DATA_0F86E1:         db $00, $00, $40, $80, $C0
DATA_0F86E6:         db $00, $00, $01, $02, $03

.init_rotating_doors
    CPX #$04            ; $0F86EB   |
    BEQ CODE_0F8710     ; $0F86ED   |
    LDA #$001F          ; $0F86EF   |
    LDY #$04            ; $0F86F2   |
    JSL $03A366         ; $0F86F4   |
    BCC CODE_0F870C     ; $0F86F8   |
    LDA $70E2,x         ; $0F86FA   |
    STA $70E2,y         ; $0F86FD   |
    LDA $7182,x         ; $0F8700   |
    STA $7182,y         ; $0F8703   |
    LDA #$0002          ; $0F8706   |
    STA $6F00,y         ; $0F8709   |

CODE_0F870C:
    JMP CODE_0F03A3     ; $0F870C   |

CODE_0F8710:
    JSL $03AE60         ; $0F8710   |
    STZ $7400,x         ; $0F8714   |
    LDA #$0000          ; $0F8717   |
    STA $76,x           ; $0F871A   |
    JSR CODE_0F8788     ; $0F871C   |
    SEP #$20            ; $0F871F   |
    LDA #$FF            ; $0F8721   |
    STA $74A2,x         ; $0F8723   |
    REP #$20            ; $0F8726   |
    STZ $105C           ; $0F8728   |
    STZ $105E           ; $0F872B   |
    STZ $1060           ; $0F872E   |
    STZ $1062           ; $0F8731   |
    STZ $1064           ; $0F8734   |
    LDA #$0008          ; $0F8737   |
    STA $00             ; $0F873A   |

CODE_0F873C:
    LDA #$001F          ; $0F873C   |
    JSL $03A364         ; $0F873F   |
    BCC CODE_0F877D     ; $0F8743   |
    LDA $7722,x         ; $0F8745   |
    STA $7722,y         ; $0F8748   |
    LDA $70E2,x         ; $0F874B   |
    STA $7A36,y         ; $0F874E   |
    LDA $7182,x         ; $0F8751   |
    STA $7A38,y         ; $0F8754   |
    SEP #$20            ; $0F8757   |
    LDA $00             ; $0F8759   |
    STA $7900,y         ; $0F875B   |
    LSR A               ; $0F875E   |
    PHX                 ; $0F875F   |
    TAX                 ; $0F8760   |
    LDA $86E1,x         ; $0F8761   |
    STA $79D8,y         ; $0F8764   |
    LDA $86E6,x         ; $0F8767   |
    STA $7402,y         ; $0F876A   |
    PLX                 ; $0F876D   |
    REP #$20            ; $0F876E   |
    PHX                 ; $0F8770   |
    TYX                 ; $0F8771   |
    JSR CODE_0F88A4     ; $0F8772   |
    PLX                 ; $0F8775   |
    DEC $00             ; $0F8776   |
    DEC $00             ; $0F8778   |
    BNE CODE_0F873C     ; $0F877A   |

CODE_0F877C:
    RTL                 ; $0F877C   |

CODE_0F877D:
    LDA $00             ; $0F877D   |
    CMP #$0008          ; $0F877F   |
    BNE CODE_0F877C     ; $0F8782   |
    JSL $03A31E         ; $0F8784   |

CODE_0F8788:
    LDA $0D0F           ; $0F8788   |
    BNE CODE_0F8796     ; $0F878B   |
    LDA $7722,x         ; $0F878D   |
    BMI CODE_0F8796     ; $0F8790   |
    JSL $02A185         ; $0F8792   |

CODE_0F8796:
    RTS                 ; $0F8796   |

.main_rotating_doors
    LDY $7900,x         ; $0F8797   |
    TYX                 ; $0F879A   |
    JMP ($879E,x)       ; $0F879B   |

DATA_0F879E:         dw $87A8, $87D7, $87D7, $87D7
DATA_0F87A6:         dw $87D7

    LDX $12             ; $0F87A8   |
    JSR CODE_0F8788     ; $0F87AA   |
    LDY $79,x           ; $0F87AD   |
    TYX                 ; $0F87AF   |
    JMP ($87B3,x)       ; $0F87B0   |

DATA_0F87B3:         dw $87B7, $87D4

    LDX $12             ; $0F87B7   |
    LDA $105C           ; $0F87B9   |
    BEQ CODE_0F87D3     ; $0F87BC   |
    LDA #$0018          ; $0F87BE   |
    LDY #$08            ; $0F87C1   |

CODE_0F87C3:
    CPY $105C           ; $0F87C3   |
    BEQ CODE_0F87CF     ; $0F87C6   |
    STA $105C,y         ; $0F87C8   |
    SEC                 ; $0F87CB   |
    SBC #$0008          ; $0F87CC   |

CODE_0F87CF:
    DEY                 ; $0F87CF   |
    DEY                 ; $0F87D0   |
    BNE CODE_0F87C3     ; $0F87D1   |

CODE_0F87D3:
    RTL                 ; $0F87D3   |

    LDX $12             ; $0F87D4   |
    RTL                 ; $0F87D6   |

    LDX $12             ; $0F87D7   |
    LDY $74A2,x         ; $0F87D9   |
    CMP #$00FF          ; $0F87DC   |
    BEQ CODE_0F87EF     ; $0F87DF   |
    REP #$10            ; $0F87E1   |
    LDA $7362,x         ; $0F87E3   |
    CLC                 ; $0F87E6   |
    ADC #$0008          ; $0F87E7   |
    TAY                 ; $0F87EA   |
    JSL $02A20A         ; $0F87EB   |

CODE_0F87EF:
    LDY $79,x           ; $0F87EF   |
    TYX                 ; $0F87F1   |
    JMP ($87F5,x)       ; $0F87F2   |

rotating_door_state_ptr:
DATA_0F87F5:         dw $87FD                ; state $00: spinning
DATA_0F87F7:         dw $8825                ; state $02: falling
DATA_0F87F9:         dw $8856                ; state $04: ready to enter
DATA_0F87FB:         dw $8870                ; state $06: disappearing (not selected)

; rotating door state $00: spinning
    LDX $12             ; $0F87FD   |
    JSL $03AF23         ; $0F87FF   |
    LDY $7900,x         ; $0F8803   |
    LDA $105C,y         ; $0F8806   |
    BEQ CODE_0F8813     ; $0F8809   |
    STA $7A96,x         ; $0F880B   |
    LDY #$06            ; $0F880E   |
    STY $79,x           ; $0F8810   |
    RTL                 ; $0F8812   |

CODE_0F8813:
    JSR CODE_0F88DE     ; $0F8813   |
    JSR CODE_0F88A4     ; $0F8816   |
    SEP #$20            ; $0F8819   |
    LDA $78,x           ; $0F881B   |
    CLC                 ; $0F881D   |
    ADC #$08            ; $0F881E   |
    STA $78,x           ; $0F8820   |
    REP #$20            ; $0F8822   |
    RTL                 ; $0F8824   |

; rotating door state $02: falling
    LDX $12             ; $0F8825   |
    JSL $03AF23         ; $0F8827   |
    LDA $7860,x         ; $0F882B   |
    AND #$0001          ; $0F882E   |
    BEQ CODE_0F8855     ; $0F8831   |
    LDA #$0093          ; $0F8833   |
    JSL $03A34C         ; $0F8836   | spawn door once finished falling
    BCC CODE_0F8855     ; $0F883A   |
    LDA $70E2,x         ; $0F883C   |
    STA $70E2,y         ; $0F883F   |
    LDA $7182,x         ; $0F8842   |
    STA $7182,y         ; $0F8845   |
    LDA $7040,y         ; $0F8848   |
    AND #$FFF3          ; $0F884B   |
    STA $7040,y         ; $0F884E   |
    LDY #$04            ; $0F8851   |
    STY $79,x           ; $0F8853   |

CODE_0F8855:
    RTL                 ; $0F8855   |

; rotating door state $04: ready to enter
    LDX $12             ; $0F8856   |
    LDY $7D36,x         ; $0F8858   |
    BPL CODE_0F886F     ; $0F885B   |
    LDA $0036           ; $0F885D   |
    AND #$0008          ; $0F8860   |
    BEQ CODE_0F886F     ; $0F8863   |

CODE_0F8865:
    LDA #$FFFF          ; $0F8865   | \
    STA $7722,x         ; $0F8868   |  | entering door: despawn
    JSL $03A31E         ; $0F886B   | /

CODE_0F886F:
    RTL                 ; $0F886F   |

; rotating door state $06: disappearing (not selected)
    LDX $12             ; $0F8870   |
    LDA $7A96,x         ; $0F8872   |
    BNE CODE_0F88A3     ; $0F8875   |
    LDA #$0036          ; $0F8877   |\ play sound #$0036
    JSL $0085D2         ; $0F887A   |/
    LDA #$01CD          ; $0F887E   |
    JSL $008B21         ; $0F8881   |
    LDA $70E2,x         ; $0F8885   |
    SEC                 ; $0F8888   |
    SBC #$0008          ; $0F8889   |
    STA $70A2,y         ; $0F888C   |
    LDA $7182,x         ; $0F888F   |
    STA $7142,y         ; $0F8892   |
    LDA #$000B          ; $0F8895   |
    STA $7E4C,y         ; $0F8898   |
    LDA #$0004          ; $0F889B   |
    STA $7782,y         ; $0F889E   |
    BRA CODE_0F8865     ; $0F88A1   |

CODE_0F88A3:
    RTL                 ; $0F88A3   |

CODE_0F88A4:
    LDY $78,x           ; $0F88A4   |
    TYA                 ; $0F88A6   |
    ASL A               ; $0F88A7   |
    TXY                 ; $0F88A8   |
    REP #$10            ; $0F88A9   |
    TAX                 ; $0F88AB   |
    LDA $00E954,x       ; $0F88AC   |
    CMP #$8000          ; $0F88B0   |
    ROR A               ; $0F88B3   |
    CMP #$8000          ; $0F88B4   |
    ROR A               ; $0F88B7   |
    CMP #$8000          ; $0F88B8   |
    ROR A               ; $0F88BB   |
    CLC                 ; $0F88BC   |
    ADC $7A36,y         ; $0F88BD   |
    STA $70E2,y         ; $0F88C0   |
    LDA $00E9D4,x       ; $0F88C3   |
    CMP #$8000          ; $0F88C7   |
    ROR A               ; $0F88CA   |
    CMP #$8000          ; $0F88CB   |
    ROR A               ; $0F88CE   |
    CMP #$8000          ; $0F88CF   |
    ROR A               ; $0F88D2   |
    CLC                 ; $0F88D3   |
    ADC $7A38,y         ; $0F88D4   |
    STA $7182,y         ; $0F88D7   |
    SEP #$10            ; $0F88DA   |
    TYX                 ; $0F88DC   |

CODE_0F88DD:
    RTS                 ; $0F88DD   |

CODE_0F88DE:
    LDY $7D36,x         ; $0F88DE   |
    DEY                 ; $0F88E1   |
    BMI CODE_0F88DD     ; $0F88E2   |
    BEQ CODE_0F88DD     ; $0F88E4   |
    LDA $6F00,y         ; $0F88E6   |
    CMP #$0010          ; $0F88E9   |
    BNE CODE_0F88DD     ; $0F88EC   |
    LDA $7D38,y         ; $0F88EE   |
    BEQ CODE_0F88DD     ; $0F88F1   |
    TYX                 ; $0F88F3   |
    JSL $03B24B         ; $0F88F4   |
    LDX $12             ; $0F88F8   |
    LDY $7900,x         ; $0F88FA   |
    TYA                 ; $0F88FD   |
    STA $105C           ; $0F88FE   |
    JSR CODE_0F892F     ; $0F8901   |
    LDA #$FC00          ; $0F8904   |
    STA $7222,x         ; $0F8907   |
    LDA #$0040          ; $0F890A   |
    STA $7542,x         ; $0F890D   |
    LDA $6FA2,x         ; $0F8910   |
    ORA #$0001          ; $0F8913   |
    STA $6FA2,x         ; $0F8916   |
    LDY #$02            ; $0F8919   |
    STY $79,x           ; $0F891B   |
    PLA                 ; $0F891D   |
    RTL                 ; $0F891E   |

DATA_0F891F:         db $B8, $05, $77, $00   ; door 1
DATA_0F8923:         db $C6, $07, $7A, $00   ; door 2
DATA_0F8927:         db $CD, $05, $5B, $00   ; door 3
DATA_0F892B:         db $D3, $00, $77, $06   ; door 4

CODE_0F892F:
    DEC A               ; $0F892F   |
    DEC A               ; $0F8930   |
    ASL A               ; $0F8931   |
    CLC                 ; $0F8932   |
    ADC #$891F          ; $0F8933   |
    STA $00             ; $0F8936   |
    LDY $7A37,x         ; $0F8938   |
    TYA                 ; $0F893B   |
    ASL A               ; $0F893C   |
    ASL A               ; $0F893D   |
    STA $02             ; $0F893E   |
    LDA $7A38,x         ; $0F8940   |
    AND #$0700          ; $0F8943   |
    LSR A               ; $0F8946   |
    LSR A               ; $0F8947   |
    ORA $02             ; $0F8948   |
    PHX                 ; $0F894A   |
    REP #$10            ; $0F894B   |
    TAX                 ; $0F894D   |
    LDA ($00)           ; $0F894E   |
    STA $7F7E00,x       ; $0F8950   | set screen exit
    INC $00             ; $0F8954   |
    INC $00             ; $0F8956   |
    LDA ($00)           ; $0F8958   |
    STA $7F7E02,x       ; $0F895A   |
    SEP #$10            ; $0F895E   |
    PLX                 ; $0F8960   |
    RTS                 ; $0F8961   |

DATA_0F8962:         db $00, $01, $01, $00, $00, $40, $00, $C0
DATA_0F896A:         db $02, $02, $02, $02

DATA_0F896E:         db $00, $40, $80, $C0

.init_diagonal_arrow_sign 					 ; up left, up right, down left, down right
    SEP #$20            ; $0F8972   |
    LDA $70E2,x         ; $0F8974   |
    AND #$10            ; $0F8977   |
    LSR A               ; $0F8979   |
    LSR A               ; $0F897A   |
    LSR A               ; $0F897B   |
    LSR A               ; $0F897C   |
    STA $00             ; $0F897D   |
    LDA $7182,x         ; $0F897F   |
    AND #$10            ; $0F8982   |
    LSR A               ; $0F8984   |
    LSR A               ; $0F8985   |
    LSR A               ; $0F8986   |
    ORA $00             ; $0F8987   |
    TAY                 ; $0F8989   |
    LDA $896A,y         ; $0F898A   |
    STA $7402,x         ; $0F898D   |
    LDA $7042,x         ; $0F8990   |
    ORA $896E,y         ; $0F8993   |
    STA $7042,x         ; $0F8996   |
    REP #$20            ; $0F8999   |
    BRA CODE_0F89C6     ; $0F899B   |

.init_arrow_sign                             ; up, left, down, right
    SEP #$20            ; $0F899D   |
    LDA $70E2,x         ; $0F899F   |
    AND #$10            ; $0F89A2   |
    LSR A               ; $0F89A4   |
    LSR A               ; $0F89A5   |
    LSR A               ; $0F89A6   |
    LSR A               ; $0F89A7   |
    STA $00             ; $0F89A8   |
    LDA $7182,x         ; $0F89AA   |
    AND #$10            ; $0F89AD   |
    LSR A               ; $0F89AF   |
    LSR A               ; $0F89B0   |
    LSR A               ; $0F89B1   |
    ORA $00             ; $0F89B2   |
    TAY                 ; $0F89B4   |
    LDA $8962,y         ; $0F89B5   |
    STA $7402,x         ; $0F89B8   |
    LDA $7042,x         ; $0F89BB   |
    EOR $896E,y         ; $0F89BE   |
    STA $7042,x         ; $0F89C1   |
    REP #$20            ; $0F89C4   |

CODE_0F89C6:
    LDA $70E2,x         ; $0F89C6   |
    AND #$FFE0          ; $0F89C9   |
    CLC                 ; $0F89CC   |
    ADC #$0008          ; $0F89CD   |
    STA $70E2,x         ; $0F89D0   |
    LDA $7182,x         ; $0F89D3   |
    AND #$FFE0          ; $0F89D6   |
    CLC                 ; $0F89D9   |
    ADC #$0008          ; $0F89DA   |
    STA $7182,x         ; $0F89DD   |
    STZ $7400,x         ; $0F89E0   |
    RTL                 ; $0F89E3   |

.main_arrow_sign                             ; both regular and diagonal signs
    RTL                 ; $0F89E4   |

DATA_0F89E5:         dw $FFF0, $FFE0, $FFF0, $0000
DATA_0F89ED:         dw $0010, $0020, $0010, $0000

DATA_0F89F5:         dw $0000, $0008

.init_dragonfly
    LDA #$0002          ; $0F89F9   |
    STA $7A96,x         ; $0F89FC   |
    LDA $70E2,x         ; $0F89FF   |
    STA $18,x           ; $0F8A02   |
    AND #$0010          ; $0F8A04   |
    LSR A               ; $0F8A07   |
    LSR A               ; $0F8A08   |
    LSR A               ; $0F8A09   |
    EOR #$0002          ; $0F8A0A   |
    STA $7400,x         ; $0F8A0D   |
    TAY                 ; $0F8A10   |
    LDA $89F5,y         ; $0F8A11   |
    STA $16,x           ; $0F8A14   |
    RTL                 ; $0F8A16   |

.main_dragonfly
    JSL $03AF23         ; $0F8A17   |
    JSR CODE_0F8A33     ; $0F8A1B   |
    LDA $7A96,x         ; $0F8A1E   |
    BNE CODE_0F8A32     ; $0F8A21   |
    LDA #$0002          ; $0F8A23   |
    STA $7A96,x         ; $0F8A26   |
    LDA $7402,x         ; $0F8A29   |
    EOR #$0001          ; $0F8A2C   |
    STA $7402,x         ; $0F8A2F   |

CODE_0F8A32:
    RTL                 ; $0F8A32   |

CODE_0F8A33:
    LDY $16,x           ; $0F8A33   |
    LDA $18,x           ; $0F8A35   |
    CLC                 ; $0F8A37   |
    ADC $89E5,y         ; $0F8A38   |
    SEC                 ; $0F8A3B   |
    SBC $70E2,x         ; $0F8A3C   |
    ASL A               ; $0F8A3F   |
    ASL A               ; $0F8A40   |
    ASL A               ; $0F8A41   |
    ASL A               ; $0F8A42   |
    ASL A               ; $0F8A43   |
    STA $7220,x         ; $0F8A44   |
    BNE CODE_0F8A7A     ; $0F8A47   |
    LDA $7A98,x         ; $0F8A49   |
    BNE CODE_0F8A7A     ; $0F8A4C   |
    LDA $76,x           ; $0F8A4E   |
    BNE CODE_0F8A5C     ; $0F8A50   |
    LDA #$0020          ; $0F8A52   |
    STA $7A98,x         ; $0F8A55   |
    INC $76,x           ; $0F8A58   |
    BRA CODE_0F8A7A     ; $0F8A5A   |

CODE_0F8A5C:
    STZ $76,x           ; $0F8A5C   |
    LDA $16,x           ; $0F8A5E   |
    INC A               ; $0F8A60   |
    INC A               ; $0F8A61   |
    AND #$000E          ; $0F8A62   |
    STA $16,x           ; $0F8A65   |
    CMP #$0004          ; $0F8A67   |
    BEQ CODE_0F8A71     ; $0F8A6A   |
    CMP #$000C          ; $0F8A6C   |
    BNE CODE_0F8A7A     ; $0F8A6F   |

CODE_0F8A71:
    LDA $7400,x         ; $0F8A71   |
    EOR #$0002          ; $0F8A74   |
    STA $7400,x         ; $0F8A77   |

CODE_0F8A7A:
    RTS                 ; $0F8A7A   |

DATA_0F8A7B:         dw $0000, $0002, $0004, $0008

DATA_0F8A83:         dw $0020, $FFE0

DATA_0F8A87:         dw $0008, $FFF8

DATA_0F8A8B:         dw $FFC0, $0040

DATA_0F8A8F:         dw $F800, $0800

.init_butterfly
    LDA $10             ; $0F8A93   |
    AND #$0003          ; $0F8A95   |
    ASL A               ; $0F8A98   |
    TAY                 ; $0F8A99   |
    LDA $7042,x         ; $0F8A9A   |
    ORA $8A7B,y         ; $0F8A9D   |
    STA $7042,x         ; $0F8AA0   |
    LDA #$0004          ; $0F8AA3   |
    STA $7A96,x         ; $0F8AA6   |
    LDA $70E2,x         ; $0F8AA9   |
    PHA                 ; $0F8AAC   |
    STA $18,x           ; $0F8AAD   |
    AND #$0010          ; $0F8AAF   |
    LSR A               ; $0F8AB2   |
    LSR A               ; $0F8AB3   |
    LSR A               ; $0F8AB4   |
    EOR #$0002          ; $0F8AB5   |
    STA $7400,x         ; $0F8AB8   |
    TAY                 ; $0F8ABB   |
    PLA                 ; $0F8ABC   |
    CLC                 ; $0F8ABD   |
    ADC $8A83,y         ; $0F8ABE   |
    STA $70E2,x         ; $0F8AC1   |
    LDA $7182,x         ; $0F8AC4   |
    STA $76,x           ; $0F8AC7   |
    CLC                 ; $0F8AC9   |
    ADC $8A87,y         ; $0F8ACA   |
    STA $7182,x         ; $0F8ACD   |
    LDA $8A8B,y         ; $0F8AD0   |
    STA $7220,x         ; $0F8AD3   |
    LDA #$0100          ; $0F8AD6   |
    STA $7A98,x         ; $0F8AD9   |
    LDA $8A8F,y         ; $0F8ADC   |
    STA $75E2,x         ; $0F8ADF   |
    LDA #$0008          ; $0F8AE2   |
    STA $7542,x         ; $0F8AE5   |
    RTL                 ; $0F8AE8   |

.main_butterfly
    JSL $03AF23         ; $0F8AE9   |
    LDA $7A96,x         ; $0F8AED   |
    BNE CODE_0F8B01     ; $0F8AF0   |
    LDA #$0004          ; $0F8AF2   |
    STA $7A96,x         ; $0F8AF5   |
    LDA $7402,x         ; $0F8AF8   |
    EOR #$0001          ; $0F8AFB   |
    STA $7402,x         ; $0F8AFE   |

CODE_0F8B01:
    LDA $7A98,x         ; $0F8B01   |
    BNE CODE_0F8B1C     ; $0F8B04   |
    LDA $7400,x         ; $0F8B06   |
    EOR #$0002          ; $0F8B09   |
    STA $7400,x         ; $0F8B0C   |
    TAY                 ; $0F8B0F   |
    LDA $8A8B,y         ; $0F8B10   |
    STA $7220,x         ; $0F8B13   |
    LDA #$0100          ; $0F8B16   |
    STA $7A98,x         ; $0F8B19   |

CODE_0F8B1C:
    LDY #$00            ; $0F8B1C   |
    LDA $7182,x         ; $0F8B1E   |
    CMP $76,x           ; $0F8B21   |
    BPL CODE_0F8B27     ; $0F8B23   |
    INY                 ; $0F8B25   |
    INY                 ; $0F8B26   |

CODE_0F8B27:
    LDA $8A8F,y         ; $0F8B27   |
    STA $75E2,x         ; $0F8B2A   |
    RTL                 ; $0F8B2D   |

DATA_0F8B2E:         dw $FFF8, $0008

DATA_0F8B32:         dw $0800, $F800

.init_nipper_spore
    STZ $7400,x         ; $0F8B36   |
    LDA $70E2,x         ; $0F8B39   |
    STA $78,x           ; $0F8B3C   |
    PHA                 ; $0F8B3E   |
    AND #$0010          ; $0F8B3F   |
    LSR A               ; $0F8B42   |
    LSR A               ; $0F8B43   |
    LSR A               ; $0F8B44   |
    TAY                 ; $0F8B45   |
    LDA $8B32,y         ; $0F8B46   |
    STA $75E0,x         ; $0F8B49   |
    PLA                 ; $0F8B4C   |
    CLC                 ; $0F8B4D   |
    ADC $8B2E,y         ; $0F8B4E   |
    STA $70E2,x         ; $0F8B51   |
    LDA #$0004          ; $0F8B54   |
    STA $7540,x         ; $0F8B57   |
    RTL                 ; $0F8B5A   |

.init_nipper_plant
    LDA #$0002          ; $0F8B5B   |
    STA $16,x           ; $0F8B5E   |
    LDA $7040,x         ; $0F8B60   |
    ORA #$0120          ; $0F8B63   |
    STA $7040,x         ; $0F8B66   |
    STZ $7540,x         ; $0F8B69   |
    STZ $7220,x         ; $0F8B6C   |
    LDA #$0040          ; $0F8B6F   |
    STA $7542,x         ; $0F8B72   |
    LDA #$0400          ; $0F8B75   |
    STA $75E2,x         ; $0F8B78   |
    LDA #$0006          ; $0F8B7B   |
    STA $7402,x         ; $0F8B7E   |
    LDA #$0020          ; $0F8B81   |
    STA $7A96,x         ; $0F8B84   |
    LDA #$0001          ; $0F8B87   |
    STA $18,x           ; $0F8B8A   |
    RTL                 ; $0F8B8C   |

.main_nipper_spore
    LDA $6F00,x         ; $0F8B8D   |
    CMP #$0008          ; $0F8B90   |
    BNE CODE_0F8BA9     ; $0F8B93   |
    LDA $6FA2,x         ; $0F8B95   |
    AND #$8000          ; $0F8B98   |
    BNE CODE_0F8BA9     ; $0F8B9B   |
    LDA #$0164          ; $0F8B9D   |
    TXY                 ; $0F8BA0   |
    JSL $03A377         ; $0F8BA1   |
    JSL $0F8B5B         ; $0F8BA5   |

.main_nipper_plant

CODE_0F8BA9:
    JSL $03AF23         ; $0F8BA9   |
    LDA $16,x           ; $0F8BAD   |
    TAX                 ; $0F8BAF   |
    JSR ($8BB8,x)       ; $0F8BB0   |

    JSL $03A5B7         ; $0F8BB3   |
    RTL                 ; $0F8BB7   |

DATA_0F8BB8:         dw $8BD0
DATA_0F8BBA:         dw $8CC1
DATA_0F8BBC:         dw $8C6D
DATA_0F8BBE:         dw $8CA3

DATA_0F8BC0:         db $01, $02, $03, $04, $03, $02, $01, $00
DATA_0F8BC8:         db $08, $04, $08, $0C, $08, $04, $08, $0C

    LDX $12             ; $0F8BD0   |
    LDA $7860,x         ; $0F8BD2   |
    AND #$0001          ; $0F8BD5   |
    BNE CODE_0F8C1B     ; $0F8BD8   |
    LDY #$00            ; $0F8BDA   |
    LDA $70E2,x         ; $0F8BDC   |
    CMP $78,x           ; $0F8BDF   |
    BMI CODE_0F8BE5     ; $0F8BE1   |
    INY                 ; $0F8BE3   |
    INY                 ; $0F8BE4   |

CODE_0F8BE5:
    LDA $8B32,y         ; $0F8BE5   |
    STA $75E0,x         ; $0F8BE8   |

CODE_0F8BEB:
    LDY #$02            ; $0F8BEB   |
    LDA $7220,x         ; $0F8BED   |
    CLC                 ; $0F8BF0   |
    ADC #$0010          ; $0F8BF1   |
    CMP #$0020          ; $0F8BF4   |
    BCC CODE_0F8C16     ; $0F8BF7   |
    CLC                 ; $0F8BF9   |
    ADC #$0010          ; $0F8BFA   |
    CMP #$0040          ; $0F8BFD   |
    BCS CODE_0F8C0D     ; $0F8C00   |
    LDY #$01            ; $0F8C02   |
    LDA $7220,x         ; $0F8C04   |
    BPL CODE_0F8C16     ; $0F8C07   |
    LDY #$03            ; $0F8C09   |
    BRA CODE_0F8C16     ; $0F8C0B   |

CODE_0F8C0D:
    LDY #$00            ; $0F8C0D   |
    LDA $7220,x         ; $0F8C0F   |
    BPL CODE_0F8C16     ; $0F8C12   |
    LDY #$04            ; $0F8C14   |

CODE_0F8C16:
    TYA                 ; $0F8C16   |
    STA $7402,x         ; $0F8C17   |
    RTS                 ; $0F8C1A   |

CODE_0F8C1B:
    LDA #$0077          ; $0F8C1B   |\ play sound #$0077
    JSL $0085D2         ; $0F8C1E   |/
    JSL $039F2B         ; $0F8C22   |
    LDA $6FA0,x         ; $0F8C26   |
    AND #$E7FF          ; $0F8C29   |
    STA $6FA0,x         ; $0F8C2C   |
    LDA $6FA2,x         ; $0F8C2F   |
    AND #$7FFF          ; $0F8C32   |
    ORA #$0040          ; $0F8C35   |
    STA $6FA2,x         ; $0F8C38   |
    LDA $7040,x         ; $0F8C3B   |
    ORA #$0120          ; $0F8C3E   |
    STA $7040,x         ; $0F8C41   |
    STZ $7540,x         ; $0F8C44   |
    STZ $7220,x         ; $0F8C47   |
    LDA #$0040          ; $0F8C4A   |
    STA $7542,x         ; $0F8C4D   |
    LDA #$0400          ; $0F8C50   |
    STA $75E2,x         ; $0F8C53   |
    LDA #$0006          ; $0F8C56   |
    STA $7402,x         ; $0F8C59   |
    LDA #$0040          ; $0F8C5C   |
    STA $7A96,x         ; $0F8C5F   |
    LDA #$0001          ; $0F8C62   |
    STA $18,x           ; $0F8C65   |
    LDA #$0006          ; $0F8C67   |
    STA $16,x           ; $0F8C6A   |
    RTS                 ; $0F8C6C   |

    LDX $12             ; $0F8C6D   |
    LDY $7223,x         ; $0F8C6F   |
    BMI CODE_0F8CA0     ; $0F8C72   |
    LDA $70E2,x         ; $0F8C74   |
    SEC                 ; $0F8C77   |
    SBC #$0008          ; $0F8C78   |
    STA $78,x           ; $0F8C7B   |
    LDA #$F800          ; $0F8C7D   |
    STA $75E0,x         ; $0F8C80   |
    LDA $7040,x         ; $0F8C83   |
    ORA #$0004          ; $0F8C86   |
    STA $7040,x         ; $0F8C89   |
    LDA $7682,x         ; $0F8C8C   |
    CMP #$FFF0          ; $0F8C8F   |
    BPL CODE_0F8C9E     ; $0F8C92   |
    LDA $609C           ; $0F8C94   |
    SEC                 ; $0F8C97   |
    SBC #$0010          ; $0F8C98   |
    STA $7182,x         ; $0F8C9B   |

CODE_0F8C9E:
    STZ $16,x           ; $0F8C9E   |

CODE_0F8CA0:
    JMP CODE_0F8BEB     ; $0F8CA0   |

    LDX $12             ; $0F8CA3   |
    LDA $7A96,x         ; $0F8CA5   |
    BNE CODE_0F8CB7     ; $0F8CA8   |
    LDA $77C2,x         ; $0F8CAA   |
    AND #$00FF          ; $0F8CAD   |
    STA $7400,x         ; $0F8CB0   |
    LDY #$02            ; $0F8CB3   |
    STY $16,x           ; $0F8CB5   |

CODE_0F8CB7:
    RTS                 ; $0F8CB7   |

DATA_0F8CB8:         db $05, $06, $07

DATA_0F8CBB:         db $07, $06

DATA_0F8CBD:         dw $FF80, $0080

    LDX $12             ; $0F8CC1   |
    LDA $7860,x         ; $0F8CC3   |
    BIT #$0001          ; $0F8CC6   |
    BNE CODE_0F8CF8     ; $0F8CC9   |
    LDA $6FA2,x         ; $0F8CCB   |
    AND #$F7FF          ; $0F8CCE   |
    LDA $6FA2,x         ; $0F8CD1   |
    LDA #$0004          ; $0F8CD4   |
    STA $7A96,x         ; $0F8CD7   |
    LDA #$0000          ; $0F8CDA   |
    STA $18,x           ; $0F8CDD   |
    LDY #$00            ; $0F8CDF   |
    LDA $7222,x         ; $0F8CE1   |
    BPL CODE_0F8CED     ; $0F8CE4   |
    INY                 ; $0F8CE6   |
    CMP #$FF00          ; $0F8CE7   |
    BCC CODE_0F8CED     ; $0F8CEA   |
    INY                 ; $0F8CEC   |

CODE_0F8CED:
    SEP #$20            ; $0F8CED   |
    LDA $8CB8,y         ; $0F8CEF   |
    STA $7402,x         ; $0F8CF2   |
    REP #$20            ; $0F8CF5   |
    RTS                 ; $0F8CF7   |

CODE_0F8CF8:
    LDA $6FA2,x         ; $0F8CF8   |
    ORA #$0800          ; $0F8CFB   |
    LDA $6FA2,x         ; $0F8CFE   |
    STZ $7220,x         ; $0F8D01   |
    LDA $7A96,x         ; $0F8D04   |
    BNE CODE_0F8D1E     ; $0F8D07   |
    DEC $18,x           ; $0F8D09   |
    BMI CODE_0F8D1F     ; $0F8D0B   |
    SEP #$20            ; $0F8D0D   |
    LDY $18,x           ; $0F8D0F   |
    LDA $8CBB,y         ; $0F8D11   |
    STA $7402,x         ; $0F8D14   |
    LDA #$08            ; $0F8D17   |
    STA $7A96,x         ; $0F8D19   |
    REP #$20            ; $0F8D1C   |

CODE_0F8D1E:
    RTS                 ; $0F8D1E   |

CODE_0F8D1F:
    LDY $7400,x         ; $0F8D1F   |
    LDA $8CBD,y         ; $0F8D22   |
    STA $7220,x         ; $0F8D25   |
    LDA #$FE00          ; $0F8D28   |
    STA $7222,x         ; $0F8D2B   |
    RTS                 ; $0F8D2E   |

.init_baby_luigi
    JSL $03AE60         ; $0F8D2F   |
    JSR CODE_0F8D44     ; $0F8D33   |
    STZ $7400,x         ; $0F8D36   |
    RTL                 ; $0F8D39   |

DATA_0F8D3A:         db $20, $28, $28, $28, $28, $28, $28, $28
DATA_0F8D42:         db $28, $28

CODE_0F8D44:
    SEP #$20            ; $0F8D44   |
    LDY $7402,x         ; $0F8D46   |
    LDA $7041,x         ; $0F8D49   |
    AND #$07            ; $0F8D4C   |
    ORA $8D3A,y         ; $0F8D4E   |
    STA $7041,x         ; $0F8D51   |
    REP #$20            ; $0F8D54   |
    RTS                 ; $0F8D56   |

DATA_0F8D57:         db $20, $02, $02, $02, $20, $02, $20, $10
DATA_0F8D5F:         db $02, $02, $02, $02, $02, $02, $10, $04
DATA_0F8D67:         db $04, $04, $04, $04, $04, $04, $04, $04
DATA_0F8D6F:         db $04, $04, $04, $04, $04, $20

DATA_0F8D75:         db $09, $08, $04, $06, $07, $06, $04, $05
DATA_0F8D7D:         db $04, $03, $02, $01, $00, $00, $00, $00
DATA_0F8D85:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0F8D8D:         db $00, $00, $00, $00, $00, $00

DATA_0F8D93:         db $00, $00, $00, $00, $00, $00, $00, $04
DATA_0F8D9B:         db $00, $02, $06, $06, $02, $00, $04, $00
DATA_0F8DA3:         db $02, $00, $04, $00, $02, $00, $04, $00
DATA_0F8DAB:         db $02, $00, $04, $00, $02, $00

    JSR CODE_0F8E20     ; $0F8DB1   |
    JSR CODE_0F8E49     ; $0F8DB4   |
    JSL $03AF23         ; $0F8DB7   |
    LDY $18,x           ; $0F8DBB   |
    TYX                 ; $0F8DBD   |
    JMP ($8DC1,x)       ; $0F8DBE   |

DATA_0F8DC1:         dw $8DC5, $8DF8

    LDX $12             ; $0F8DC5   |
    LDA $70E2,x         ; $0F8DC7   |
    SEC                 ; $0F8DCA   |
    SBC $608C           ; $0F8DCB   |
    CLC                 ; $0F8DCE   |
    ADC #$0030          ; $0F8DCF   |
    CMP #$0060          ; $0F8DD2   |
    BCS CODE_0F8DF7     ; $0F8DD5   |
    SEP #$20            ; $0F8DD7   |
    LDY #$1D            ; $0F8DD9   |
    STY $19,x           ; $0F8DDB   |
    LDA $8D57,y         ; $0F8DDD   |
    STA $7A96,x         ; $0F8DE0   |
    LDA $8D75,y         ; $0F8DE3   |
    STA $7402,x         ; $0F8DE6   |
    LDA $8D93,y         ; $0F8DE9   |
    STA $16,x           ; $0F8DEC   |
    INC $18,x           ; $0F8DEE   |
    INC $18,x           ; $0F8DF0   |
    REP #$20            ; $0F8DF2   |
    JSR CODE_0F8D44     ; $0F8DF4   |

CODE_0F8DF7:
    RTL                 ; $0F8DF7   |

    LDX $12             ; $0F8DF8   |
    LDA $7A96,x         ; $0F8DFA   |
    BNE CODE_0F8E1E     ; $0F8DFD   |
    LDY $19,x           ; $0F8DFF   |
    DEY                 ; $0F8E01   |
    BMI CODE_0F8E1F     ; $0F8E02   |
    STY $19,x           ; $0F8E04   |
    SEP #$20            ; $0F8E06   |
    LDA $8D57,y         ; $0F8E08   |
    STA $7A96,x         ; $0F8E0B   |
    LDA $8D75,y         ; $0F8E0E   |
    STA $7402,x         ; $0F8E11   |
    LDA $8D93,y         ; $0F8E14   |
    STA $16,x           ; $0F8E17   |
    REP #$20            ; $0F8E19   |
    JSR CODE_0F8D44     ; $0F8E1B   |

CODE_0F8E1E:
    RTL                 ; $0F8E1E   |

CODE_0F8E1F:
    RTL                 ; $0F8E1F   |

CODE_0F8E20:
    LDA $7402,x         ; $0F8E20   |
    BNE CODE_0F8E2A     ; $0F8E23   |
    JSL $03AA52         ; $0F8E25   |
    RTS                 ; $0F8E29   |

CODE_0F8E2A:
    REP #$10            ; $0F8E2A   |
    LDA $7362,x         ; $0F8E2C   |
    CLC                 ; $0F8E2F   |
    ADC #$0008          ; $0F8E30   |
    TAY                 ; $0F8E33   |
    JSL $03AA60         ; $0F8E34   |
    RTS                 ; $0F8E38   |

DATA_0F8E39:         dw $0100, $00E8, $0120, $00D0
DATA_0F8E41:         dw $0100, $0120, $00E8, $0150

CODE_0F8E49:
    LDY $74A2,x         ; $0F8E49   |
    CMP #$00FF          ; $0F8E4C   |
    BEQ CODE_0F8EA5     ; $0F8E4F   |
    LDA $0D0F           ; $0F8E51   |
    BNE CODE_0F8EA5     ; $0F8E54   |
    LDA $7722,x         ; $0F8E56   |
    BMI CODE_0F8EA5     ; $0F8E59   |
    LDY $16,x           ; $0F8E5B   |
    LDA $8E39,y         ; $0F8E5D   |
    STA $300C           ; $0F8E60   |
    LDA $8E41,y         ; $0F8E63   |
    STA $3016           ; $0F8E66   |
    LDA #$0010          ; $0F8E69   |
    STA $3010           ; $0F8E6C   |
    LDA #$0019          ; $0F8E6F   |
    STA $3012           ; $0F8E72   |
    REP #$10            ; $0F8E75   |
    LDY $7722,x         ; $0F8E77   |
    TYX                 ; $0F8E7A   |
    LDA $03A9CE,x       ; $0F8E7B   |
    STA $3006           ; $0F8E7F   |
    LDA $03A9EE,x       ; $0F8E82   |
    STA $3004           ; $0F8E86   |
    LDA #$A0A0          ; $0F8E89   |
    STA $3018           ; $0F8E8C   |
    LDA #$0054          ; $0F8E8F   |
    STA $301A           ; $0F8E92   |
    SEP #$10            ; $0F8E95   |
    LDX #$08            ; $0F8E97   |
    LDA #$8295          ; $0F8E99   |
    JSL $7EDE44         ; $0F8E9C   | GSU init
    LDX $12             ; $0F8EA0   |
    INC $0CF9           ; $0F8EA2   |

CODE_0F8EA5:
    RTS                 ; $0F8EA5   |

DATA_0F8EA6:         dw $00C1, $00C8, $00B8, $00B7

.init_hidden_winged_cloud
    LDY $7900,x         ; $0F8EAE   |
    BNE CODE_0F8ECF     ; $0F8EB1   |
    SEP #$20            ; $0F8EB3   |
    LDA $70E2,x         ; $0F8EB5   |
    AND #$10            ; $0F8EB8   |
    LSR A               ; $0F8EBA   |
    LSR A               ; $0F8EBB   |
    LSR A               ; $0F8EBC   |
    STA $00             ; $0F8EBD   |
    LDA $7182,x         ; $0F8EBF   |
    AND #$10            ; $0F8EC2   |
    LSR A               ; $0F8EC4   |
    LSR A               ; $0F8EC5   |
    ORA $00             ; $0F8EC6   |
    INC A               ; $0F8EC8   |
    STA $7900,x         ; $0F8EC9   |
    TAY                 ; $0F8ECC   |
    REP #$20            ; $0F8ECD   |

CODE_0F8ECF:
    DEY                 ; $0F8ECF   |
    TYX                 ; $0F8ED0   |
    JMP ($8ED4,x)       ; $0F8ED1   |

DATA_0F8ED4:         dw $8EDC, $8EE8, $8EDC, $8EDC

    LDX $12             ; $0F8EDC   |
    JSL $03D3F8         ; $0F8EDE   |
    BEQ CODE_0F8EEA     ; $0F8EE2   |
    JMP CODE_0F03A3     ; $0F8EE4   |

    LDX $12             ; $0F8EE8   |

CODE_0F8EEA:
    RTL                 ; $0F8EEA   |

.main_hidden_winged_cloud
    JSL $03AF23         ; $0F8EEB   |
    TXA                 ; $0F8EEF   |
    STA $3002           ; $0F8EF0   |
    LDX #$09            ; $0F8EF3   |
    LDA #$9011          ; $0F8EF5   |
    JSL $7EDE44         ; $0F8EF8   | GSU init

CODE_0F8EFC:
    LDX $12             ; $0F8EFC   |
    LDY $301C           ; $0F8EFE   |
    BMI CODE_0F8F4A     ; $0F8F01   |
    LDA $7360,y         ; $0F8F03   |
    CMP #$009E          ; $0F8F06   |
    BEQ CODE_0F8F1B     ; $0F8F09   |
    CMP #$00DC          ; $0F8F0B   |
    BEQ CODE_0F8F1B     ; $0F8F0E   |
    LDX #$09            ; $0F8F10   |
    LDA $301E           ; $0F8F12   |
    JSL $7EDE44         ; $0F8F15   | GSU init
    BRA CODE_0F8EFC     ; $0F8F19   |

CODE_0F8F1B:
    LDA #$0027          ; $0F8F1B   |\ play sound #$0027
    JSL $0085D2         ; $0F8F1E   |/
    JSL $039F2B         ; $0F8F22   |
    LDY $7900,x         ; $0F8F26   |
    DEY                 ; $0F8F29   |
    LDA $8EA6,y         ; $0F8F2A   |
    TXY                 ; $0F8F2D   |
    JSL $03A377         ; $0F8F2E   |
    LDA #$0000          ; $0F8F32   |
    STA $7900,y         ; $0F8F35   |
    STA $7902,y         ; $0F8F38   |
    LDA #$0002          ; $0F8F3B   |
    STA $6F00,y         ; $0F8F3E   |
    SEP #$20            ; $0F8F41   |
    LDA #$01            ; $0F8F43   |
    STA $77C0,y         ; $0F8F45   |
    REP #$20            ; $0F8F48   |

CODE_0F8F4A:
    RTL                 ; $0F8F4A   |

DATA_0F8F4B:         dw $0000, $0002, $0004, $0008

.init_sparrow
    LDA $10             ; $0F8F53   |
    AND #$0003          ; $0F8F55   |
    ASL A               ; $0F8F58   |
    TAY                 ; $0F8F59   |
    LDA $7042,x         ; $0F8F5A   |
    ORA $8F4B,y         ; $0F8F5D   |
    STA $7042,x         ; $0F8F60   |
    RTL                 ; $0F8F63   |

.main_sparrow
    JSL $03AF23         ; $0F8F64   |
    LDA $16,x           ; $0F8F68   |
    TAX                 ; $0F8F6A   |
    JMP ($8F6E,x)       ; $0F8F6B   |

DATA_0F8F6E:         dw $8F92
DATA_0F8F70:         dw $90A8

DATA_0F8F72:         dw $FF80, $0080

DATA_0F8F76:         dw $FD00, $FE00, $FF00, $FFC0
DATA_0F8F7E:         dw $0040, $0100, $0200, $0300

DATA_0F8F86:         db $01, $02, $03, $02, $01, $00

DATA_0F8F8C:         db $01, $02, $03, $02, $01, $03

    LDX $12             ; $0F8F92   |
    TXA                 ; $0F8F94   |
    STA $3002           ; $0F8F95   |
    LDX #$09            ; $0F8F98   |
    LDA #$8F33          ; $0F8F9A   |
    JSL $7EDE44         ; $0F8F9D   | GSU init
    LDX $12             ; $0F8FA1   |
    LDY $3002           ; $0F8FA3   |
    BMI CODE_0F8FC8     ; $0F8FA6   |
    LDA $7CD6,x         ; $0F8FA8   |
    SEC                 ; $0F8FAB   |
    SBC $7CD6,y         ; $0F8FAC   |
    CLC                 ; $0F8FAF   |
    ADC #$0020          ; $0F8FB0   |
    CMP #$0040          ; $0F8FB3   |
    BCS CODE_0F8FC8     ; $0F8FB6   |
    LDA $7CD8,x         ; $0F8FB8   |
    SEC                 ; $0F8FBB   |
    SBC $7CD8,y         ; $0F8FBC   |
    CLC                 ; $0F8FBF   |
    ADC #$0020          ; $0F8FC0   |
    CMP #$0040          ; $0F8FC3   |
    BCC CODE_0F8FE8     ; $0F8FC6   |

CODE_0F8FC8:
    LDA $7CD6,x         ; $0F8FC8   |
    SEC                 ; $0F8FCB   |
    SBC $611C           ; $0F8FCC   |
    CLC                 ; $0F8FCF   |
    ADC #$0020          ; $0F8FD0   |
    CMP #$0040          ; $0F8FD3   |
    BCS CODE_0F9034     ; $0F8FD6   |
    LDA $7CD8,x         ; $0F8FD8   |
    SEC                 ; $0F8FDB   |
    SBC $611E           ; $0F8FDC   |
    CLC                 ; $0F8FDF   |
    ADC #$0020          ; $0F8FE0   |
    CMP #$0040          ; $0F8FE3   |
    BCS CODE_0F9034     ; $0F8FE6   |

CODE_0F8FE8:
    LDA $10             ; $0F8FE8   |
    AND #$0007          ; $0F8FEA   |
    ASL A               ; $0F8FED   |
    TAY                 ; $0F8FEE   |
    LDA $8F76,y         ; $0F8FEF   |
    STA $7220,x         ; $0F8FF2   |
    TYA                 ; $0F8FF5   |
    AND #$0008          ; $0F8FF6   |
    LSR A               ; $0F8FF9   |
    LSR A               ; $0F8FFA   |
    STA $7400,x         ; $0F8FFB   |
    LDA #$FE00          ; $0F8FFE   |
    STA $75E2,x         ; $0F9001   |
    LDA #$0010          ; $0F9004   |
    STA $7542,x         ; $0F9007   |
    STZ $7222,x         ; $0F900A   |
    LDA $6FA2,x         ; $0F900D   |
    AND #$FFE0          ; $0F9010   |
    STA $6FA2,x         ; $0F9013   |
    LDA $7040,x         ; $0F9016   |
    AND #$FFFC          ; $0F9019   |
    STA $7040,x         ; $0F901C   |
    LDA #$0002          ; $0F901F   |
    STA $7A96,x         ; $0F9022   |
    STZ $7402,x         ; $0F9025   |
    INC $16,x           ; $0F9028   |
    INC $16,x           ; $0F902A   |
    LDA #$0075          ; $0F902C   |\ play sound #$0075
    JSL $0085D2         ; $0F902F   |/
    RTL                 ; $0F9033   |

CODE_0F9034:
    LDA $18,x           ; $0F9034   |
    BNE CODE_0F9070     ; $0F9036   |
    LDA $7A98,x         ; $0F9038   |
    BNE CODE_0F905D     ; $0F903B   |
    DEC $76,x           ; $0F903D   |
    BPL CODE_0F904B     ; $0F903F   |
    LDA $7A96,x         ; $0F9041   |
    BEQ CODE_0F905E     ; $0F9044   |
    LDA #$0005          ; $0F9046   |
    STA $76,x           ; $0F9049   |

CODE_0F904B:
    SEP #$20            ; $0F904B   |
    LDY $76,x           ; $0F904D   |
    LDA $8F86,y         ; $0F904F   |
    STA $7402,x         ; $0F9052   |
    LDA $8F8C,y         ; $0F9055   |
    STA $7A98,x         ; $0F9058   |
    REP #$20            ; $0F905B   |

CODE_0F905D:
    RTL                 ; $0F905D   |

CODE_0F905E:
    LDA $10             ; $0F905E   |
    AND #$001F          ; $0F9060   |
    CLC                 ; $0F9063   |
    ADC #$0020          ; $0F9064   |
    STA $7A96,x         ; $0F9067   |
    STZ $7220,x         ; $0F906A   |
    INC $18,x           ; $0F906D   |
    RTL                 ; $0F906F   |

CODE_0F9070:
    LDA $7A96,x         ; $0F9070   |
    BEQ CODE_0F9090     ; $0F9073   |
    LDA $7AF6,x         ; $0F9075   |
    BNE CODE_0F908F     ; $0F9078   |
    LDA $7400,x         ; $0F907A   |
    EOR #$0002          ; $0F907D   |
    STA $7400,x         ; $0F9080   |
    LDA $10             ; $0F9083   |
    AND #$0007          ; $0F9085   |
    CLC                 ; $0F9088   |
    ADC #$0008          ; $0F9089   |
    STA $7AF6,x         ; $0F908C   |

CODE_0F908F:
    RTL                 ; $0F908F   |

CODE_0F9090:
    LDA $10             ; $0F9090   |
    AND #$003F          ; $0F9092   |
    CLC                 ; $0F9095   |
    ADC #$0040          ; $0F9096   |
    STA $7A96,x         ; $0F9099   |
    LDY $7400,x         ; $0F909C   |
    LDA $8F72,y         ; $0F909F   |
    STA $7220,x         ; $0F90A2   |
    STZ $18,x           ; $0F90A5   |
    RTL                 ; $0F90A7   |

    LDX $12             ; $0F90A8   |
    LDA $7A96,x         ; $0F90AA   |
    BNE CODE_0F90BE     ; $0F90AD   |
    LDA $7402,x         ; $0F90AF   |
    EOR #$0001          ; $0F90B2   |
    STA $7402,x         ; $0F90B5   |
    LDA #$0002          ; $0F90B8   |
    STA $7A96,x         ; $0F90BB   |

CODE_0F90BE:
    RTL                 ; $0F90BE   |

.init_red_1up_egg
    RTL                 ; $0F90BF   |

.main_red_1up_egg
    JSL $03AF23         ; $0F90C0   |
    LDY $16,x           ; $0F90C4   |
    TYX                 ; $0F90C6   |
    JMP ($90CA,x)       ; $0F90C7   |

DATA_0F90CA:         dw $90CE, $90E6

    LDX $12             ; $0F90CE   |
    LDA $7860,x         ; $0F90D0   |
    AND #$0001          ; $0F90D3   |
    BEQ CODE_0F90E5     ; $0F90D6   |
    STZ $7220,x         ; $0F90D8   |
    LDA #$0010          ; $0F90DB   |
    STA $7A96,x         ; $0F90DE   |
    LDY #$02            ; $0F90E1   |
    STY $16,x           ; $0F90E3   |

CODE_0F90E5:
    RTL                 ; $0F90E5   |

    LDX $12             ; $0F90E6   |
    LDA $7A96,x         ; $0F90E8   |
    BNE CODE_0F9110     ; $0F90EB   |
    LDA $70E2,x         ; $0F90ED   |
    STA $0000           ; $0F90F0   |
    LDA $7182,x         ; $0F90F3   |
    STA $0002           ; $0F90F6   |
    LDA $7042,x         ; $0F90F9   |
    AND #$003E          ; $0F90FC   |
    STA $0004           ; $0F90FF   |
    JSL $04F88E         ; $0F9102   |
    LDX $12             ; $0F9106   |
    JSL $03A496         ; $0F9108   |
    JSL $03A32E         ; $0F910C   |

CODE_0F9110:
    RTL                 ; $0F9110   |

.init_bouncing_green_needlenose
    RTL                 ; $0F9111   |

DATA_0F9112:         dw $FC00, $FE00

.main_bouncing_green_needlenose
    LDA $7D38,x         ; $0F9116   |
    BEQ CODE_0F912D     ; $0F9119   |
    LDA $6FA0,x         ; $0F911B   |
    ORA #$0600          ; $0F911E   |
    STA $6FA0,x         ; $0F9121   |
    LDA $6FA2,x         ; $0F9124   |
    AND #$FFE0          ; $0F9127   |
    STA $6FA2,x         ; $0F912A   |

CODE_0F912D:
    JSL $03AF23         ; $0F912D   |
    LDA $6FA2,x         ; $0F9131   |
    BIT #$001F          ; $0F9134   |
    BEQ CODE_0F9173     ; $0F9137   |
    JSL $03A5B7         ; $0F9139   |
    LDA $7860,x         ; $0F913D   |
    AND #$0001          ; $0F9140   |
    BEQ CODE_0F9173     ; $0F9143   |
    LDA $18,x           ; $0F9145   |
    CMP #$0002          ; $0F9147   |
    BCS CODE_0F9173     ; $0F914A   |
    ASL A               ; $0F914C   |
    TAY                 ; $0F914D   |
    LDA $9112,y         ; $0F914E   |
    STA $7222,x         ; $0F9151   |
    LDA $18,x           ; $0F9154   |
    BEQ CODE_0F916A     ; $0F9156   |
    LDA $6FA0,x         ; $0F9158   |
    AND #$F99F          ; $0F915B   |
    STA $6FA0,x         ; $0F915E   |
    LDA $6FA2,x         ; $0F9161   |
    AND #$FFE0          ; $0F9164   |
    STA $6FA2,x         ; $0F9167   |

CODE_0F916A:
    LDA #$0013          ; $0F916A   |\ play sound #$0013
    JSL $0085D2         ; $0F916D   |/
    INC $18,x           ; $0F9171   |

CODE_0F9173:
    RTL                 ; $0F9173   |

DATA_0F9174:         dw $0000, $0002, $0004, $0008

.init_frog
    LDA $10             ; $0F917C   |
    AND #$0006          ; $0F917E   |
    TAY                 ; $0F9181   |
    LDA $7042,x         ; $0F9182   |
    ORA $9174,y         ; $0F9185   |
    STA $7042,x         ; $0F9188   |
    RTL                 ; $0F918B   |

.main_frog
    JSL $03AF23         ; $0F918C   |
    LDY $16,x           ; $0F9190   |
    TYX                 ; $0F9192   |
    JMP ($9197,x)       ; $0F9193   |

    RTL                 ; $0F9196   |

DATA_0F9197:         dw $919F
DATA_0F9199:         dw $91FB
DATA_0F919B:         dw $9229
DATA_0F919D:         dw $9252

    LDX $12             ; $0F919F   |
    LDA $7C16,x         ; $0F91A1   |
    BPL CODE_0F91AA     ; $0F91A4   |
    EOR #$FFFF          ; $0F91A6   |
    INC A               ; $0F91A9   |

CODE_0F91AA:
    CMP #$0030          ; $0F91AA   |
    BPL CODE_0F91D5     ; $0F91AD   |
    LDA $7C18,x         ; $0F91AF   |
    BPL CODE_0F91B8     ; $0F91B2   |
    EOR #$FFFF          ; $0F91B4   |
    INC A               ; $0F91B7   |

CODE_0F91B8:
    CMP #$0030          ; $0F91B8   |
    BPL CODE_0F91D5     ; $0F91BB   |
    LDA $6FA2,x         ; $0F91BD   |
    AND #$FF3F          ; $0F91C0   |
    ORA #$0480          ; $0F91C3   |
    STA $6FA2,x         ; $0F91C6   |
    STZ $7A96,x         ; $0F91C9   |
    LDA $16,x           ; $0F91CC   |
    CLC                 ; $0F91CE   |
    ADC #$0004          ; $0F91CF   |
    STA $16,x           ; $0F91D2   |
    RTL                 ; $0F91D4   |

CODE_0F91D5:
    LDA $7A96,x         ; $0F91D5   |
    BNE CODE_0F91FA     ; $0F91D8   |
    INC $16,x           ; $0F91DA   |
    INC $16,x           ; $0F91DC   |
    LDA $10             ; $0F91DE   |
    AND #$0002          ; $0F91E0   |
    EOR $7400,x         ; $0F91E3   |
    STA $7400,x         ; $0F91E6   |
    PHP                 ; $0F91E9   |
    LDA #$FF00          ; $0F91EA   |
    STA $7222,x         ; $0F91ED   |
    PLP                 ; $0F91F0   |
    BEQ CODE_0F91F7     ; $0F91F1   |
    EOR #$FFFF          ; $0F91F3   |
    INC A               ; $0F91F6   |

CODE_0F91F7:
    STA $7220,x         ; $0F91F7   |

CODE_0F91FA:
    RTL                 ; $0F91FA   |

    LDX $12             ; $0F91FB   |
    LDA $7860,x         ; $0F91FD   |
    BIT #$0001          ; $0F9200   |
    BEQ CODE_0F921A     ; $0F9203   |
    STZ $7220,x         ; $0F9205   |
    STZ $7402,x         ; $0F9208   |
    LDA $10             ; $0F920B   |
    AND #$001F          ; $0F920D   |
    CLC                 ; $0F9210   |
    ADC #$0020          ; $0F9211   |
    STA $7A96,x         ; $0F9214   |
    STZ $16,x           ; $0F9217   |
    RTL                 ; $0F9219   |

CODE_0F921A:
    LDA #$0001          ; $0F921A   |
    LDY $7223,x         ; $0F921D   |
    BMI CODE_0F9225     ; $0F9220   |
    LDA #$0002          ; $0F9222   |

CODE_0F9225:
    STA $7402,x         ; $0F9225   |
    RTL                 ; $0F9228   |

    LDX $12             ; $0F9229   |
    LDA $7A96,x         ; $0F922B   |
    BNE CODE_0F9251     ; $0F922E   |
    INC $16,x           ; $0F9230   |
    INC $16,x           ; $0F9232   |
    LDA $77C2,x         ; $0F9234   |
    AND #$00FF          ; $0F9237   |
    EOR #$0002          ; $0F923A   |
    STA $7400,x         ; $0F923D   |
    PHP                 ; $0F9240   |
    LDA #$FF00          ; $0F9241   |
    STA $7222,x         ; $0F9244   |
    PLP                 ; $0F9247   |
    BEQ CODE_0F924E     ; $0F9248   |
    EOR #$FFFF          ; $0F924A   |
    INC A               ; $0F924D   |

CODE_0F924E:
    STA $7220,x         ; $0F924E   |

CODE_0F9251:
    RTL                 ; $0F9251   |

    LDX $12             ; $0F9252   |
    LDA $7860,x         ; $0F9254   |
    BIT #$0001          ; $0F9257   |
    BEQ CODE_0F926D     ; $0F925A   |
    STZ $7220,x         ; $0F925C   |
    STZ $7402,x         ; $0F925F   |
    LDA #$0010          ; $0F9262   |
    STA $7A96,x         ; $0F9265   |
    DEC $16,x           ; $0F9268   |
    DEC $16,x           ; $0F926A   |
    RTL                 ; $0F926C   |

CODE_0F926D:
    LDA #$0001          ; $0F926D   |
    LDY $7223,x         ; $0F9270   |
    BMI CODE_0F9278     ; $0F9273   |
    LDA #$0002          ; $0F9275   |

CODE_0F9278:
    STA $7402,x         ; $0F9278   |
    RTL                 ; $0F927B   |

.init_bonus_sprite                           ; falls when all enemies on screen are dead (red coin, key, flower, door)
    JSL $03D3F8         ; $0F927C   |
    BEQ CODE_0F9286     ; $0F9280   |
    JMP CODE_0F03A3     ; $0F9282   |

CODE_0F9286:
    SEP #$20            ; $0F9286   |
    LDA $70E2,x         ; $0F9288   |
    AND #$10            ; $0F928B   |
    LSR A               ; $0F928D   |
    LSR A               ; $0F928E   |
    LSR A               ; $0F928F   |
    STA $00             ; $0F9290   |
    LDA $7182,x         ; $0F9292   |
    AND #$10            ; $0F9295   |
    LSR A               ; $0F9297   |
    LSR A               ; $0F9298   |
    ORA $00             ; $0F9299   |
    STA $7900,x         ; $0F929B   |
    REP #$20            ; $0F929E   |
    RTL                 ; $0F92A0   |

.main_bonus_sprite                           ; falls when all enemies on screen are dead (red coin, key, flower, door)
    JSL $03AF23         ; $0F92A1   |
    LDX #$09            ; $0F92A5   |
    LDA #$AF4A          ; $0F92A7   |
    JSL $7EDE44         ; $0F92AA   | GSU init
    LDX $12             ; $0F92AE   |
    LDA $3016           ; $0F92B0   |
    BMI CODE_0F92B6     ; $0F92B3   |
    RTL                 ; $0F92B5   |

CODE_0F92B6:
    LDA #$0095          ; $0F92B6   |\ play sound #$0095
    JSL $0085D2         ; $0F92B9   |/
    JSL $039F2B         ; $0F92BD   |
    LDY $7900,x         ; $0F92C1   |
    LDA $92D9,y         ; $0F92C4   |
    TXY                 ; $0F92C7   |
    JSL $03A377         ; $0F92C8   |
    LDA #$0002          ; $0F92CC   |
    STA $6F00,x         ; $0F92CF   |
    LDY $7900,x         ; $0F92D2   |
    TYX                 ; $0F92D5   |
    JMP ($92E1,x)       ; $0F92D6   |

DATA_0F92D9:         dw $0115, $0027, $00FA, $0093

DATA_0F92E1:         dw $92E9
DATA_0F92E3:         dw $931C
DATA_0F92E5:         dw $931C
DATA_0F92E7:         dw $931C

    LDX $12             ; $0F92E9   |
    LDA #$0000          ; $0F92EB   |
    STA $7900,x         ; $0F92EE   |
    LDA $7042,x         ; $0F92F1   |
    AND #$FFF1          ; $0F92F4   |
    ORA #$0002          ; $0F92F7   |
    STA $7042,x         ; $0F92FA   |
    LDA $7182,x         ; $0F92FD   |
    ASL A               ; $0F9300   |
    ASL A               ; $0F9301   |
    ASL A               ; $0F9302   |
    ASL A               ; $0F9303   |
    AND #$FF00          ; $0F9304   |
    ORA #$8000          ; $0F9307   |
    STA $00             ; $0F930A   |
    LDA $70E2,x         ; $0F930C   |
    LSR A               ; $0F930F   |
    LSR A               ; $0F9310   |
    LSR A               ; $0F9311   |
    LSR A               ; $0F9312   |
    AND #$00FF          ; $0F9313   |
    ORA $00             ; $0F9316   |
    STA $7902,x         ; $0F9318   |
    RTL                 ; $0F931B   |

    LDX $12             ; $0F931C   |
    LDA #$0000          ; $0F931E   |
    STA $7900,x         ; $0F9321   |
    STA $7902,x         ; $0F9324   |
    RTL                 ; $0F9327   |

.init_giant_milde
    JSL $03ADD0         ; $0F9328   |
    BCS CODE_0F9332     ; $0F932C   |
    JMP CODE_0F03A3     ; $0F932E   |

CODE_0F9332:
    JSR CODE_0F9838     ; $0F9332   |
    LDA #$0100          ; $0F9335   |
    STA $7900,x         ; $0F9338   |
    STA $7902,x         ; $0F933B   |
    RTL                 ; $0F933E   |

.main_giant_milde
    STZ $7D38,x         ; $0F933F   |
    REP #$10            ; $0F9342   |
    LDA $7362,x         ; $0F9344   |
    BMI CODE_0F935F     ; $0F9347   |
    CLC                 ; $0F9349   |
    ADC #$0030          ; $0F934A   |
    PHA                 ; $0F934D   |
    TAY                 ; $0F934E   |
    JSL $03AAAB         ; $0F934F   |
    REP #$10            ; $0F9353   |
    PLA                 ; $0F9355   |
    CLC                 ; $0F9356   |
    ADC #$0040          ; $0F9357   |
    TAY                 ; $0F935A   |
    JSL $03AAAB         ; $0F935B   |

CODE_0F935F:
    SEP #$10            ; $0F935F   |
    LDA $7AF6,x         ; $0F9361   |
    BNE CODE_0F9377     ; $0F9364   |
    LDA $76,x           ; $0F9366   |
    CMP #$0003          ; $0F9368   |
    BEQ CODE_0F9377     ; $0F936B   |
    JSR CODE_0F9797     ; $0F936D   |
    JSL $0F9388         ; $0F9370   |
    JSR CODE_0F97EE     ; $0F9374   |

CODE_0F9377:
    JSL $03AF23         ; $0F9377   |
    JSR CODE_0F94BF     ; $0F937B   |
    JSR CODE_0F93EA     ; $0F937E   |
    JSR CODE_0F9391     ; $0F9381   |
    JSR CODE_0F9838     ; $0F9384   |
    RTL                 ; $0F9387   |

    JSL $03A5B7         ; $0F9388   |
    RTL                 ; $0F938C   |

DATA_0F938D:         dw $FFFF, $0001

CODE_0F9391:
    SEP #$20            ; $0F9391   |
    LDA $7860,x         ; $0F9393   |
    AND #$0C            ; $0F9396   |
    REP #$20            ; $0F9398   |
    BEQ CODE_0F93E4     ; $0F939A   |
    LSR A               ; $0F939C   |
    LSR A               ; $0F939D   |
    AND #$0002          ; $0F939E   |
    TAY                 ; $0F93A1   |
    LDA $70E2,x         ; $0F93A2   |
    CLC                 ; $0F93A5   |
    ADC $938D,y         ; $0F93A6   |
    STA $70E2,x         ; $0F93A9   |
    LDA $76,x           ; $0F93AC   |
    CMP #$0002          ; $0F93AE   |
    BNE CODE_0F93C4     ; $0F93B1   |
    LDA $7A36,x         ; $0F93B3   |
    BEQ CODE_0F93C4     ; $0F93B6   |
    LDA $7220,x         ; $0F93B8   |
    EOR #$FFFF          ; $0F93BB   |
    INC A               ; $0F93BE   |
    STA $7220,x         ; $0F93BF   |
    BRA CODE_0F93E4     ; $0F93C2   |

CODE_0F93C4:
    LDA $76,x           ; $0F93C4   |
    CMP #$0002          ; $0F93C6   |
    BNE CODE_0F93D0     ; $0F93C9   |
    STZ $7220,x         ; $0F93CB   |
    BRA CODE_0F93E4     ; $0F93CE   |

CODE_0F93D0:
    LDA #$0001          ; $0F93D0   |
    STA $76,x           ; $0F93D3   |
    LDA #$0018          ; $0F93D5   |
    STA $7A96,x         ; $0F93D8   |
    LDY $7400,x         ; $0F93DB   |
    LDA $93E5,y         ; $0F93DE   |
    STA $7220,x         ; $0F93E1   |

CODE_0F93E4:
    RTS                 ; $0F93E4   |

DATA_0F93E5:         dw $0020, $FFE0

CODE_0F93E9:
    RTS                 ; $0F93E9   |

CODE_0F93EA:
    LDY $7D36,x         ; $0F93EA   |
    BEQ CODE_0F93E9     ; $0F93ED   |
    BMI CODE_0F93E9     ; $0F93EF   |
    DEY                 ; $0F93F1   |
    LDA $7360,y         ; $0F93F2   |
    CMP #$00D3          ; $0F93F5   |
    BEQ CODE_0F93FF     ; $0F93F8   |
    CMP #$00D4          ; $0F93FA   |
    BNE CODE_0F93E9     ; $0F93FD   |

CODE_0F93FF:
    STZ $00             ; $0F93FF   |
    LDA $70E2,x         ; $0F9401   |
    SEC                 ; $0F9404   |
    SBC $70E2,y         ; $0F9405   |
    BPL CODE_0F940E     ; $0F9408   |
    INC $00             ; $0F940A   |
    INC $00             ; $0F940C   |

CODE_0F940E:
    LDA $76,x           ; $0F940E   |
    CMP #$0000          ; $0F9410   |
    BEQ CODE_0F9442     ; $0F9413   |
    CMP #$0002          ; $0F9415   |
    BNE CODE_0F9477     ; $0F9418   |
    LDA $7A36,x         ; $0F941A   |
    BEQ CODE_0F9477     ; $0F941D   |
    STZ $7A36,x         ; $0F941F   |
    LDA $7220,x         ; $0F9422   |
    STZ $7220,x         ; $0F9425   |
    STA $7220,y         ; $0F9428   |
    JSR CODE_0F9812     ; $0F942B   |
    LDA #$0002          ; $0F942E   |
    STA $79D6,y         ; $0F9431   |
    LDA #$0001          ; $0F9434   |
    STA $7A36,y         ; $0F9437   |
    LDA #$00FF          ; $0F943A   |
    STA $7A96,y         ; $0F943D   |
    BRA CODE_0F9477     ; $0F9440   |

CODE_0F9442:
    LDA $7860,x         ; $0F9442   |
    AND #$0001          ; $0F9445   |
    BNE CODE_0F946B     ; $0F9448   |
    LDA #$FD00          ; $0F944A   |
    STA $7222,x         ; $0F944D   |
    LDA $7220,x         ; $0F9450   |
    EOR #$FFFF          ; $0F9453   |
    INC A               ; $0F9456   |
    STA $7220,x         ; $0F9457   |
    DEC $7182,x         ; $0F945A   |
    DEC $7182,x         ; $0F945D   |
    JSR CODE_0F9812     ; $0F9460   |
    PHX                 ; $0F9463   |
    TYX                 ; $0F9464   |
    JSR CODE_0F9812     ; $0F9465   |
    PLX                 ; $0F9468   |
    BRA CODE_0F94BE     ; $0F9469   |

CODE_0F946B:
    LDA $7400,x         ; $0F946B   |
    CMP $00             ; $0F946E   |
    BNE CODE_0F9477     ; $0F9470   |
    PHY                 ; $0F9472   |
    JSR CODE_0F93C4     ; $0F9473   |
    PLY                 ; $0F9476   |

CODE_0F9477:
    LDA $79D6,y         ; $0F9477   |
    CMP #$0000          ; $0F947A   |
    BEQ CODE_0F94B1     ; $0F947D   |
    CMP #$0002          ; $0F947F   |
    BNE CODE_0F94BE     ; $0F9482   |
    LDA $7A36,y         ; $0F9484   |
    BEQ CODE_0F94BE     ; $0F9487   |
    LDA $7220,y         ; $0F9489   |
    STA $7220,x         ; $0F948C   |
    LDA #$0001          ; $0F948F   |
    STA $7A36,x         ; $0F9492   |
    LDA #$0002          ; $0F9495   |
    STA $76,x           ; $0F9498   |
    LDA #$00FF          ; $0F949A   |
    STA $7A96,x         ; $0F949D   |
    LDA #$0000          ; $0F94A0   |
    STA $7A36,y         ; $0F94A3   |
    STA $7220,y         ; $0F94A6   |
    PHX                 ; $0F94A9   |
    TYX                 ; $0F94AA   |
    JSR CODE_0F9812     ; $0F94AB   |
    PLX                 ; $0F94AE   |
    BRA CODE_0F94BE     ; $0F94AF   |

CODE_0F94B1:
    LDA $7400,y         ; $0F94B1   |
    CMP $00             ; $0F94B4   |
    BEQ CODE_0F94BE     ; $0F94B6   |
    PHX                 ; $0F94B8   |
    TYX                 ; $0F94B9   |
    JSR CODE_0F93C4     ; $0F94BA   |
    PLX                 ; $0F94BD   |

CODE_0F94BE:
    RTS                 ; $0F94BE   |

CODE_0F94BF:
    LDA $76,x           ; $0F94BF   |
    ASL A               ; $0F94C1   |
    TXY                 ; $0F94C2   |
    TAX                 ; $0F94C3   |
    JMP ($94C7,x)       ; $0F94C4   |

DATA_0F94C7:         dw $94DD
DATA_0F94C9:         dw $9517
DATA_0F94CB:         dw $9571
DATA_0F94CD:         dw $9672

DATA_0F94CF:         dw $FF80, $0080

DATA_0F94D3:         db $00, $01, $02, $03, $04, $05, $04, $03
DATA_0F94DB:         db $02, $01

    TYX                 ; $0F9FDD   |
    LDA $7860,x         ; $0F94DE   |
    AND #$0001          ; $0F94E1   |
    BEQ CODE_0F94EF     ; $0F94E4   |
    LDY $7400,x         ; $0F94E6   |
    LDA $94CF,y         ; $0F94E9   |
    STA $7220,x         ; $0F94EC   |

CODE_0F94EF:
    SEP #$20            ; $0F94EF   |
    DEC $7A38,x         ; $0F94F1   |
    BPL CODE_0F9505     ; $0F94F4   |
    LDA #$07            ; $0F94F6   |
    STA $7A38,x         ; $0F94F8   |
    INC $16,x           ; $0F94FB   |
    LDA $16,x           ; $0F94FD   |
    CMP #$0A            ; $0F94FF   |
    BNE CODE_0F9505     ; $0F9501   |
    STZ $16,x           ; $0F9503   |

CODE_0F9505:
    LDY $16,x           ; $0F9505   |
    LDA $94D3,y         ; $0F9507   |
    STA $7402,x         ; $0F950A   |
    REP #$20            ; $0F950D   |
    RTS                 ; $0F950F   |

DATA_0F9510:         db $00, $06, $07, $07, $06, $00, $00

    TYX                 ; $0F9517   |
    LDA $7A96,x         ; $0F9518   |
    BNE CODE_0F9525     ; $0F951B   |

CODE_0F951D:
    LDA #$0000          ; $0F951D   |
    STA $76,x           ; $0F9520   |
    STZ $16,x           ; $0F9522   |
    RTS                 ; $0F9524   |

CODE_0F9525:
    SEP #$20            ; $0F9525   |
    CMP #$0B            ; $0F9527   |
    BNE CODE_0F9535     ; $0F9529   |
    PHA                 ; $0F952B   |
    LDA $7400,x         ; $0F952C   |
    EOR #$02            ; $0F952F   |
    STA $7400,x         ; $0F9531   |
    PLA                 ; $0F9534   |

CODE_0F9535:
    LSR A               ; $0F9535   |
    LSR A               ; $0F9536   |
    TAY                 ; $0F9537   |
    LDA $9510,y         ; $0F9538   |
    STA $7402,x         ; $0F953B   |
    REP #$20            ; $0F953E   |
    RTS                 ; $0F9540   |

DATA_0F9541:         db $00, $01, $08, $01, $10, $01, $18, $01
DATA_0F9549:         db $18, $01, $10, $01, $08, $01, $00, $01

DATA_0F9551:         db $00, $01, $F8, $00, $F0, $00, $E8, $00
DATA_0F9559:         db $E8, $00, $F0, $00, $E8, $00, $00, $01
DATA_0F9561:         db $00, $01, $08, $01, $10, $01, $18, $01
DATA_0F9569:         db $18, $01, $10, $01, $08, $01, $00, $01

    TYX                 ; $0F9571   |
    LDA $7860,x         ; $0F9572   |
    AND #$0001          ; $0F9575   |
    BEQ CODE_0F9586     ; $0F9578   |
    JSR CODE_0FA5E7     ; $0F957A   |
    JSR CODE_0FA5E7     ; $0F957D   |
    JSR CODE_0FA5E7     ; $0F9580   |
    JSR CODE_0FA5E7     ; $0F9583   |

CODE_0F9586:
    LDA $7A96,x         ; $0F9586   |
    BNE CODE_0F9597     ; $0F9589   |
    LDA #$0100          ; $0F958B   |
    STA $7900,x         ; $0F958E   |
    STA $7902,x         ; $0F9591   |
    JMP CODE_0F951D     ; $0F9594   |

CODE_0F9597:
    NOP                 ; $0F9597   |
    NOP                 ; $0F9598   |
    AND #$0007          ; $0F9599   |
    ASL A               ; $0F959C   |
    ASL A               ; $0F959D   |
    TAY                 ; $0F959E   |
    LDA $9541,y         ; $0F959F   |
    STA $7900,x         ; $0F95A2   |
    LDA $9551,y         ; $0F95A5   |
    STA $7902,x         ; $0F95A8   |
    REP #$10            ; $0F95AB   |
    LDA $7362,x         ; $0F95AD   |
    TXY                 ; $0F95B0   |
    CLC                 ; $0F95B1   |
    ADC #$0018          ; $0F95B2   |
    TAX                 ; $0F95B5   |
    LDA $7A96,y         ; $0F95B6   |
    BIT #$0002          ; $0F95B9   |
    BEQ CODE_0F95D7     ; $0F95BC   |
    AND #$0004          ; $0F95BE   |
    BEQ CODE_0F95CE     ; $0F95C1   |
    INC $6002,x         ; $0F95C3   |
    INC $600A,x         ; $0F95C6   |
    INC $6012,x         ; $0F95C9   |
    BRA CODE_0F95D7     ; $0F95CC   |

CODE_0F95CE:
    DEC $6002,x         ; $0F95CE   |
    DEC $600A,x         ; $0F95D1   |
    DEC $6012,x         ; $0F95D4   |

CODE_0F95D7:
    SEP #$10            ; $0F95D7   |
    LDX $12             ; $0F95D9   |
    RTS                 ; $0F95DB   |

DATA_0F95DC:         dw $0107, $010E, $0115, $011C
DATA_0F95E4:         dw $0123, $012A, $0131, $0138
DATA_0F95EC:         dw $0138, $0138, $0138, $0138
DATA_0F95F4:         dw $0138, $0138, $0138

DATA_0F95FA:         dw $00E9, $00D2, $00BB, $00A4
DATA_0F9602:         dw $008D, $0076, $005F, $0048
DATA_0F960A:         dw $0048, $0048, $0048, $0048
DATA_0F9612:         dw $0048, $0048, $0048

DATA_0F9618:         dw $0000, $0004, $0005, $0008
DATA_0F9620:         dw $000B, $000D, $0010, $0014
DATA_0F9628:         dw $0014, $0014, $0014, $0014
DATA_0F9630:         dw $0014, $0014, $0014

DATA_0F9636:         dw $0008, $0008, $0009, $000A
DATA_0F963E:         dw $000A, $000B, $000C, $000C
DATA_0F9646:         dw $000C, $000C, $000C, $000C
DATA_0F964E:         dw $000C, $000C, $000C

DATA_0F9654:         dw $FFD8, $FFDC, $FFE0, $FFE4
DATA_0F965C:         dw $FFE8, $FFEC, $FFF2, $FFF7
DATA_0F9664:         dw $FFF7, $FFF7, $FFF7, $FFF7
DATA_0F966C:         dw $FFF7, $FFF7, $FFF7

    TYX                 ; $0F9672   |
    STZ $7220,x         ; $0F9673   |
    LDY $16,x           ; $0F9676   |
    CPY #$1E            ; $0F9678   |
    BEQ CODE_0F96CC     ; $0F967A   |
    LDA $0030           ; $0F967C   |
    AND #$0001          ; $0F967F   |
    BNE CODE_0F9688     ; $0F9682   |
    INC $16,x           ; $0F9684   |
    INC $16,x           ; $0F9686   |

CODE_0F9688:
    LDA $95DC,y         ; $0F9688   |
    STA $7900,x         ; $0F968B   |
    LDA $95FA,y         ; $0F968E   |
    STA $7902,x         ; $0F9691   |
    LDA $9636,y         ; $0F9694   |
    STA $7402,x         ; $0F9697   |
    LDA $7182,x         ; $0F969A   |
    CLC                 ; $0F969D   |
    ADC $9654,y         ; $0F969E   |
    STA $6090           ; $0F96A1   |
    STZ $60AA           ; $0F96A4   |
    LDA $9618,y         ; $0F96A7   |
    STA $00             ; $0F96AA   |
    REP #$10            ; $0F96AC   |
    LDA #$000F          ; $0F96AE   |
    STA $02             ; $0F96B1   |
    LDY $7362,x         ; $0F96B3   |

CODE_0F96B6:
    LDA $6032,y         ; $0F96B6   |
    CLC                 ; $0F96B9   |
    ADC $00             ; $0F96BA   |
    STA $6032,y         ; $0F96BC   |
    TYA                 ; $0F96BF   |
    CLC                 ; $0F96C0   |
    ADC #$0008          ; $0F96C1   |
    TAY                 ; $0F96C4   |
    DEC $02             ; $0F96C5   |
    BPL CODE_0F96B6     ; $0F96C7   |
    SEP #$10            ; $0F96C9   |
    RTS                 ; $0F96CB   |

CODE_0F96CC:
    STZ $60D4           ; $0F96CC   |
    LDA #$0086          ; $0F96CF   |\ play sound #$0086
    JSL $0085D2         ; $0F96D2   |/
    JSR CODE_0F96EA     ; $0F96D6   |
    JSL $03A32E         ; $0F96D9   |
    RTS                 ; $0F96DD   |

DATA_0F96DE:         dw $0100, $FF00

DATA_0F96E2:         dw $0010, $FFF0

DATA_0F96E6:         dw $0002, $0000

CODE_0F96EA:
    LDA #$012E          ; $0F96EA   |
    JSL $03A364         ; $0F96ED   |
    BCC CODE_0F970B     ; $0F96F1   |
    LDA #$0002          ; $0F96F3   |
    STA $7976,y         ; $0F96F6   |
    LDA #$0001          ; $0F96F9   |
    STA $79D6,y         ; $0F96FC   |
    LDA $7CD6,x         ; $0F96FF   |
    STA $70E2,y         ; $0F9702   |
    LDA $7CD8,x         ; $0F9705   |
    STA $7182,y         ; $0F9708   |

CODE_0F970B:
    LDA $7CD6,x         ; $0F970B   |
    STA $3002           ; $0F970E   |
    LDA $7CD8,x         ; $0F9711   |
    STA $3004           ; $0F9714   |
    LDA #$0050          ; $0F9717   |
    STA $3014           ; $0F971A   |
    LDA #$0400          ; $0F971D   |
    STA $6000           ; $0F9720   |
    LDA #$FC00          ; $0F9723   |
    STA $6002           ; $0F9726   |
    LDX #$09            ; $0F9729   |
    LDA #$9253          ; $0F972B   |
    JSL $7EDE44         ; $0F972E   | GSU init
    LDX $12             ; $0F9732   |
    LDA #$003B          ; $0F9734   |\ play sound #$003B
    JSL $0085D2         ; $0F9737   |/
    LDA #$0002          ; $0F973B   |
    STA $08             ; $0F973E   |
    LDA $70E2,x         ; $0F9740   |
    STA $00             ; $0F9743   |
    LDA $7182,x         ; $0F9745   |
    STA $02             ; $0F9748   |

CODE_0F974A:
    LDA #$00D4          ; $0F974A   |
    JSL $03A364         ; $0F974D   |
    BCC CODE_0F9796     ; $0F9751   |
    LDX $08             ; $0F9753   |
    LDA $00             ; $0F9755   |
    CLC                 ; $0F9757   |
    ADC $96E2,x         ; $0F9758   |
    STA $70E2,y         ; $0F975B   |
    LDA $96DE,x         ; $0F975E   |
    STA $7220,y         ; $0F9761   |
    LDA $96E6,x         ; $0F9764   |
    STA $7400,y         ; $0F9767   |
    LDA #$FD00          ; $0F976A   |
    STA $7222,y         ; $0F976D   |
    LDA $02             ; $0F9770   |
    CLC                 ; $0F9772   |
    ADC #$0000          ; $0F9773   |
    STA $7182,y         ; $0F9776   |
    LDA #$0020          ; $0F9779   |
    STA $7AF6,y         ; $0F977C   |
    LDA #$0030          ; $0F977F   |
    STA $7A96,y         ; $0F9782   |
    LDA $7040,y         ; $0F9785   |
    AND #$FFF3          ; $0F9788   |
    STA $7040,y         ; $0F978B   |
    LDX $12             ; $0F978E   |
    DEC $08             ; $0F9790   |
    DEC $08             ; $0F9792   |
    BPL CODE_0F974A     ; $0F9794   |

CODE_0F9796:
    RTS                 ; $0F9796   |

CODE_0F9797:
    LDY $7D36,x         ; $0F9797   |
    DEY                 ; $0F979A   |
    BMI CODE_0F97ED     ; $0F979B   |
    LDA $6F00,y         ; $0F979D   |
    CMP #$0010          ; $0F97A0   |
    BNE CODE_0F97ED     ; $0F97A3   |
    LDA $7D38,y         ; $0F97A5   |
    BEQ CODE_0F97ED     ; $0F97A8   |
    LDA $76,x           ; $0F97AA   |
    CMP #$0002          ; $0F97AC   |
    BEQ CODE_0F97ED     ; $0F97AF   |
    LDA #$0002          ; $0F97B1   |
    STA $76,x           ; $0F97B4   |
    PHY                 ; $0F97B6   |
    LDA #$0034          ; $0F97B7   |\ play sound #$0034
    JSL $0085D2         ; $0F97BA   |/
    PLY                 ; $0F97BE   |
    LDA #$0020          ; $0F97BF   |
    STA $7A96,x         ; $0F97C2   |
    LDA $7360,x         ; $0F97C5   |
    CMP #$00D4          ; $0F97C8   |
    BNE CODE_0F97E2     ; $0F97CB   |
    LDA $7220,y         ; $0F97CD   |
    STA $7220,x         ; $0F97D0   |
    LDA $7222,y         ; $0F97D3   |
    STA $7222,x         ; $0F97D6   |
    LDA #$00FF          ; $0F97D9   |
    STA $7A96,x         ; $0F97DC   |
    INC $7A36,x         ; $0F97DF   |

CODE_0F97E2:
    LDY $7D36,x         ; $0F97E2   |
    DEY                 ; $0F97E5   |
    TYX                 ; $0F97E6   |
    JSL $03B24B         ; $0F97E7   |
    LDX $12             ; $0F97EB   |

CODE_0F97ED:
    RTS                 ; $0F97ED   |

CODE_0F97EE:
    LDA $6F00,x         ; $0F97EE   |
    CMP #$000E          ; $0F97F1   |
    BNE CODE_0F9826     ; $0F97F4   |
    LDA #$0010          ; $0F97F6   |
    STA $6F00,x         ; $0F97F9   |
    LDA $60D4           ; $0F97FC   |
    BNE CODE_0F9827     ; $0F97FF   |
    LDA #$0002          ; $0F9801   |
    STA $76,x           ; $0F9804   |
    LDA #$0020          ; $0F9806   |
    STA $7A96,x         ; $0F9809   |
    LDA #$FB00          ; $0F980C   |
    STA $60AA           ; $0F980F   |

CODE_0F9812:
    LDA #$0002          ; $0F9812   |
    STA $76,x           ; $0F9815   |
    LDA #$0020          ; $0F9817   |
    STA $7A96,x         ; $0F981A   |
    PHY                 ; $0F981D   |
    LDA #$0034          ; $0F981E   |\ play sound #$0034
    JSL $0085D2         ; $0F9821   |/
    PLY                 ; $0F9825   |

CODE_0F9826:
    RTS                 ; $0F9826   |

CODE_0F9827:
    STZ $16,x           ; $0F9827   |
    LDA #$0003          ; $0F9829   |
    STA $76,x           ; $0F982C   |
    LDA $6FA0,x         ; $0F982E   |
    AND #$F9FF          ; $0F9831   |
    STA $6FA0,x         ; $0F9834   |
    RTS                 ; $0F9837   |

CODE_0F9838:
    LDA $7900,x         ; $0F9838   |
    STA $300C           ; $0F983B   |
    LDA $7902,x         ; $0F983E   |
    STA $3016           ; $0F9841   |
    LDA #$001F          ; $0F9844   |
    STA $3010           ; $0F9847   |
    STA $3012           ; $0F984A   |
    LDA #$60A0          ; $0F984D   |
    STA $3018           ; $0F9850   |
    LDA #$0056          ; $0F9853   |
    STA $301A           ; $0F9856   |
    LDY $7722,x         ; $0F9859   |
    TYX                 ; $0F985C   |
    LDA $03A9EE,x       ; $0F985D   |
    STA $3004           ; $0F9861   |
    LDA $03A9CE,x       ; $0F9864   |
    STA $3006           ; $0F9868   |
    LDX #$08            ; $0F986B   |
    LDA #$8295          ; $0F986D   |
    JSL $7EDE44         ; $0F9870   | GSU init
    LDX $12             ; $0F9874   |
    LDA $7900,x         ; $0F9876   |
    STA $300C           ; $0F9879   |
    LDA $7902,x         ; $0F987C   |
    STA $3016           ; $0F987F   |
    LDA #$001F          ; $0F9882   |
    STA $3010           ; $0F9885   |
    STZ $3012           ; $0F9888   |
    LDA #$60C0          ; $0F988B   |
    STA $3018           ; $0F988E   |
    LDA #$0056          ; $0F9891   |
    STA $301A           ; $0F9894   |
    LDY $7722,x         ; $0F9897   |
    TYX                 ; $0F989A   |
    LDA $03A9EE,x       ; $0F989B   |
    STA $3004           ; $0F989F   |
    LDA $03A9CE,x       ; $0F98A2   |
    CLC                 ; $0F98A6   |
    ADC #$0020          ; $0F98A7   |
    STA $3006           ; $0F98AA   |
    LDX #$08            ; $0F98AD   |
    LDA #$8295          ; $0F98AF   |
    JSL $7EDE44         ; $0F98B2   | GSU init
    INC $0CF9           ; $0F98B6   |
    LDX $12             ; $0F98B9   |
    RTS                 ; $0F98BB   |

.init_large_milde
    RTL                 ; $0F98BC   |

.main_large_milde
    STZ $7D38,x         ; $0F98BD   |
    LDA $76,x           ; $0F98C0   |
    CMP #$0003          ; $0F98C2   |
    BNE CODE_0F98D5     ; $0F98C5   |
    JSR CODE_0F9BB6     ; $0F98C7   |
    JSL $03AF23         ; $0F98CA   |
    JSR CODE_0F993B     ; $0F98CE   |
    JSR CODE_0F9BC9     ; $0F98D1   |
    RTL                 ; $0F98D4   |

CODE_0F98D5:
    LDA $7AF6,x         ; $0F98D5   |
    BNE CODE_0F98E4     ; $0F98D8   |
    JSR CODE_0F9797     ; $0F98DA   |
    JSL $0F9388         ; $0F98DD   |
    JSR CODE_0F98F2     ; $0F98E1   |

CODE_0F98E4:
    JSL $03AF23         ; $0F98E4   |
    JSR CODE_0F993B     ; $0F98E8   |
    JSR CODE_0F93EA     ; $0F98EB   |
    JSR CODE_0F9391     ; $0F98EE   |
    RTL                 ; $0F98F1   |

CODE_0F98F2:
    LDA $6F00,x         ; $0F98F2   |
    CMP #$000E          ; $0F98F5   |
    BNE CODE_0F9919     ; $0F98F8   |
    LDA #$0010          ; $0F98FA   |
    STA $6F00,x         ; $0F98FD   |
    LDA $60D4           ; $0F9900   |
    BNE CODE_0F991A     ; $0F9903   |
    LDA #$0002          ; $0F9905   |
    STA $76,x           ; $0F9908   |
    LDA #$0020          ; $0F990A   |
    STA $7A96,x         ; $0F990D   |
    LDA #$FB00          ; $0F9910   |
    STA $60AA           ; $0F9913   |
    STZ $7A36,x         ; $0F9916   |

CODE_0F9919:
    RTS                 ; $0F9919   |

CODE_0F991A:
    STZ $16,x           ; $0F991A   |
    LDA #$0003          ; $0F991C   |
    STA $76,x           ; $0F991F   |
    LDA #$0002          ; $0F9921   |
    STA $7402,x         ; $0F9924   |
    LDA $7040,x         ; $0F9927   |
    AND #$01FF          ; $0F992A   |
    ORA #$4000          ; $0F992D   |
    STA $7040,x         ; $0F9930   |
    JSL $0F9BAB         ; $0F9933   |
    JSR CODE_0F9BB6     ; $0F9937   |
    RTS                 ; $0F993A   |

CODE_0F993B:
    LDA $76,x           ; $0F993B   |
    ASL A               ; $0F993D   |
    TXY                 ; $0F993E   |
    TAX                 ; $0F993F   |
    JMP ($9943,x)       ; $0F9940   |

DATA_0F9943:         dw $9957
DATA_0F9945:         dw $99A2
DATA_0F9947:         dw $99C7
DATA_0F9949:         dw $9A8F

DATA_0F994B:         dw $FF80, $0080

DATA_0F994F:         db $00, $01, $02, $03, $06, $03, $02, $01

    TYX                 ; $0F9957   |
    LDA $7040,x         ; $0F9958   |
    AND #$01FF          ; $0F995B   |
    ORA #$2000          ; $0F995E   |
    STA $7040,x         ; $0F9961   |
    LDA $7860,x         ; $0F9964   |
    AND #$0001          ; $0F9967   |
    BEQ CODE_0F9975     ; $0F996A   |
    LDY $7400,x         ; $0F996C   |
    LDA $994B,y         ; $0F996F   |
    STA $7220,x         ; $0F9972   |

CODE_0F9975:
    SEP #$20            ; $0F9975   |
    DEC $7A38,x         ; $0F9977   |
    BPL CODE_0F998B     ; $0F997A   |
    LDA #$07            ; $0F997C   |
    STA $7A38,x         ; $0F997E   |
    INC $16,x           ; $0F9981   |
    LDA $16,x           ; $0F9983   |
    CMP #$08            ; $0F9985   |
    BNE CODE_0F998B     ; $0F9987   |
    STZ $16,x           ; $0F9989   |

CODE_0F998B:
    LDY $16,x           ; $0F998B   |
    LDA $994F,y         ; $0F998D   |
    STA $7402,x         ; $0F9990   |
    REP #$20            ; $0F9993   |
    LDA $7A96,x         ; $0F9995   |
    BNE CODE_0F99F4     ; $0F9998   |
    RTS                 ; $0F999A   |

DATA_0F999B:         db $01, $02, $03, $06, $03, $02, $01

    TYX                 ; $0F99A2   |
    LDA $7A96,x         ; $0F99A3   |
    BNE CODE_0F99AB     ; $0F99A6   |
    JMP CODE_0F99EC     ; $0F99A8   |

CODE_0F99AB:
    SEP #$20            ; $0F99AB   |
    CMP #$0B            ; $0F99AD   |
    BNE CODE_0F99BB     ; $0F99AF   |
    PHA                 ; $0F99B1   |
    LDA $7400,x         ; $0F99B2   |
    EOR #$02            ; $0F99B5   |
    STA $7400,x         ; $0F99B7   |
    PLA                 ; $0F99BA   |

CODE_0F99BB:
    LSR A               ; $0F99BB   |
    LSR A               ; $0F99BC   |
    TAY                 ; $0F99BD   |
    LDA $999B,y         ; $0F99BE   |
    STA $7402,x         ; $0F99C1   |
    REP #$20            ; $0F99C4   |
    RTS                 ; $0F99C6   |

    TYX                 ; $0F99C7   |
    LDA $7860,x         ; $0F99C8   |
    AND #$0001          ; $0F99CB   |
    BEQ CODE_0F99E7     ; $0F99CE   |
    LDA $7A36,x         ; $0F99D0   |
    BEQ CODE_0F99E4     ; $0F99D3   |
    LDY #$1F            ; $0F99D5   |

CODE_0F99D7:
    JSR CODE_0FA5E7     ; $0F99D7   |
    DEY                 ; $0F99DA   |
    BPL CODE_0F99D7     ; $0F99DB   |
    LDA $7220,x         ; $0F99DD   |
    BEQ CODE_0F99EC     ; $0F99E0   |
    BNE CODE_0F99E7     ; $0F99E2   |

CODE_0F99E4:
    STZ $7220,x         ; $0F99E4   |

CODE_0F99E7:
    LDA $7A96,x         ; $0F99E7   |
    BNE CODE_0F99F4     ; $0F99EA   |

CODE_0F99EC:
    LDA #$0000          ; $0F99EC   |
    STA $76,x           ; $0F99EF   |
    STZ $16,x           ; $0F99F1   |
    RTS                 ; $0F99F3   |

CODE_0F99F4:
    REP #$10            ; $0F99F4   |
    LDA $7362,x         ; $0F99F6   |
    TXY                 ; $0F99F9   |
    TAX                 ; $0F99FA   |
    LDA $0030           ; $0F99FB   |
    AND #$0004          ; $0F99FE   |
    BNE CODE_0F9A24     ; $0F9A01   |
    LDA $7400,y         ; $0F9A03   |
    BEQ CODE_0F9A16     ; $0F9A06   |
    INC $6000,x         ; $0F9A08   |
    INC $6010,x         ; $0F9A0B   |
    DEC $6008,x         ; $0F9A0E   |
    DEC $6018,x         ; $0F9A11   |
    BRA CODE_0F9A30     ; $0F9A14   |

CODE_0F9A16:
    DEC $6000,x         ; $0F9A16   |
    DEC $6010,x         ; $0F9A19   |
    INC $6008,x         ; $0F9A1C   |
    INC $6018,x         ; $0F9A1F   |
    BRA CODE_0F9A30     ; $0F9A22   |

CODE_0F9A24:
    DEC $6002,x         ; $0F9A24   |
    DEC $600A,x         ; $0F9A27   |
    INC $6012,x         ; $0F9A2A   |
    INC $601A,x         ; $0F9A2D   |

CODE_0F9A30:
    SEP #$10            ; $0F9A30   |
    LDX $12             ; $0F9A32   |
    RTS                 ; $0F9A34   |

DATA_0F9A35:         dw $0107, $010E, $0115, $011C
DATA_0F9A3D:         dw $0123, $012A, $0131, $0138
DATA_0F9A45:         dw $0138, $0138, $0138, $0138
DATA_0F9A4D:         dw $0138, $0138, $0138

DATA_0F9A53:         dw $00E9, $00D2, $00BB, $00A4
DATA_0F9A5B:         dw $0088, $0088, $0088, $0088
DATA_0F9A63:         dw $0088, $0088, $0088, $0088
DATA_0F9A6B:         dw $0088, $0088, $0088

DATA_0F9A71:         dw $FFE0, $FFE4, $FFE6, $FFE4
DATA_0F9A79:         dw $FFE6, $FFEA, $FFEA, $FFEA
DATA_0F9A81:         dw $FFEA, $FFEA, $FFEA, $FFEA
DATA_0F9A89:         dw $FFEA, $FFEA, $FFEA

    TYX                 ; $0F9A8F   |
    STZ $7220,x         ; $0F9A90   |
    LDY $16,x           ; $0F9A93   |
    CPY #$1E            ; $0F9A95   |
    BEQ CODE_0F9AC5     ; $0F9A97   |
    LDA $0030           ; $0F9A99   |
    AND #$0000          ; $0F9A9C   |
    BNE CODE_0F9AA5     ; $0F9A9F   |
    INC $16,x           ; $0F9AA1   |
    INC $16,x           ; $0F9AA3   |

CODE_0F9AA5:
    LDA $9A35,y         ; $0F9AA5   |
    STA $7900,x         ; $0F9AA8   |
    LDA $9A53,y         ; $0F9AAB   |
    STA $7902,x         ; $0F9AAE   |
    LDA #$0002          ; $0F9AB1   |
    STA $7402,x         ; $0F9AB4   |
    LDA $7182,x         ; $0F9AB7   |
    CLC                 ; $0F9ABA   |
    ADC $9A71,y         ; $0F9ABB   |
    STA $6090           ; $0F9ABE   |
    STZ $60AA           ; $0F9AC1   |
    RTS                 ; $0F9AC4   |

CODE_0F9AC5:
    STZ $60D4           ; $0F9AC5   |
    LDA #$0086          ; $0F9AC8   |\ play sound #$0086
    JSL $0085D2         ; $0F9ACB   |/
    JSR CODE_0F9AF7     ; $0F9ACF   |
    JSL $03A32E         ; $0F9AD2   |
    RTS                 ; $0F9AD6   |

DATA_0F9AD7:         dw $FD00, $FD00, $FC00, $FC00

DATA_0F9ADF:         dw $01C0, $FE40, $0100, $FF00

DATA_0F9AE7:         dw $0010, $FFF0, $0008, $FFF8

DATA_0F9AEF:         dw $0002, $0000, $0002, $0000

CODE_0F9AF7:
    LDA #$01EE          ; $0F9AF7   |
    JSL $008B21         ; $0F9AFA   |
    LDA $7CD6,x         ; $0F9AFE   |
    STA $70A2,y         ; $0F9B01   |
    LDA $7CD8,x         ; $0F9B04   |
    STA $7142,y         ; $0F9B07   |
    LDA #$0002          ; $0F9B0A   |
    STA $7782,y         ; $0F9B0D   |
    LDA #$0008          ; $0F9B10   |
    STA $73C2,y         ; $0F9B13   |
    LDA $7CD6,x         ; $0F9B16   |
    STA $3002           ; $0F9B19   |
    LDA $7CD8,x         ; $0F9B1C   |
    STA $3004           ; $0F9B1F   |
    LDA #$0040          ; $0F9B22   |
    STA $3014           ; $0F9B25   |
    LDA #$0300          ; $0F9B28   |
    STA $6000           ; $0F9B2B   |
    LDA #$FD00          ; $0F9B2E   |
    STA $6002           ; $0F9B31   |
    LDX #$09            ; $0F9B34   |
    LDA #$9253          ; $0F9B36   |
    JSL $7EDE44         ; $0F9B39   | GSU init
    LDX $12             ; $0F9B3D   |
    LDA #$003B          ; $0F9B3F   |\ play sound #$003B
    JSL $0085D2         ; $0F9B42   |/
    LDA #$0006          ; $0F9B46   |
    STA $08             ; $0F9B49   |
    LDA #$0020          ; $0F9B4B   |
    STA $61D6           ; $0F9B4E   |
    LDA $70E2,x         ; $0F9B51   |
    STA $00             ; $0F9B54   |
    LDA $7182,x         ; $0F9B56   |
    STA $02             ; $0F9B59   |

CODE_0F9B5B:
    LDA #$0108          ; $0F9B5B   |
    JSL $03A364         ; $0F9B5E   |
    BCC CODE_0F9B9E     ; $0F9B62   |
    LDX $08             ; $0F9B64   |
    LDA $00             ; $0F9B66   |
    CLC                 ; $0F9B68   |
    ADC $9AE7,x         ; $0F9B69   |
    STA $70E2,y         ; $0F9B6C   |
    LDA $9ADF,x         ; $0F9B6F   |
    STA $7220,y         ; $0F9B72   |
    LDA $9AEF,x         ; $0F9B75   |
    STA $7400,y         ; $0F9B78   |
    LDA $9AD7,x         ; $0F9B7B   |
    STA $7222,y         ; $0F9B7E   |
    LDA $02             ; $0F9B81   |
    CLC                 ; $0F9B83   |
    ADC #$0000          ; $0F9B84   |
    STA $7182,y         ; $0F9B87   |
    LDA #$0001          ; $0F9B8A   |
    STA $7976,y         ; $0F9B8D   |
    LDA $7040,y         ; $0F9B90   |
    AND #$FFF3          ; $0F9B93   |
    STA $7040,y         ; $0F9B96   |
    STA $7900,y         ; $0F9B99   |
    BRA CODE_0F9BA2     ; $0F9B9C   |

CODE_0F9B9E:
    JSL $04D1A2         ; $0F9B9E   |

CODE_0F9BA2:
    LDX $12             ; $0F9BA2   |
    DEC $08             ; $0F9BA4   |
    DEC $08             ; $0F9BA6   |
    BPL CODE_0F9B5B     ; $0F9BA8   |
    RTS                 ; $0F9BAA   |

    JSL $03AD74         ; $0F9BAB   |
    BCS CODE_0F9BB5     ; $0F9BAF   |
    JMP CODE_0F03A3     ; $0F9BB1   |

CODE_0F9BB5:
    RTL                 ; $0F9BB5   |

CODE_0F9BB6:
    JSL $03AA52         ; $0F9BB6   |
    REP #$10            ; $0F9BBA   |
    LDA $7362,x         ; $0F9BBC   |
    CLC                 ; $0F9BBF   |
    ADC #$0020          ; $0F9BC0   |
    TAY                 ; $0F9BC3   |
    JSL $03AA60         ; $0F9BC4   |
    RTS                 ; $0F9BC8   |

CODE_0F9BC9:
    LDA $7900,x         ; $0F9BC9   |
    STA $300C           ; $0F9BCC   |
    LDA $7902,x         ; $0F9BCF   |
    STA $3016           ; $0F9BD2   |
    LDA #$001F          ; $0F9BD5   |
    STA $3010           ; $0F9BD8   |
    STA $3012           ; $0F9BDB   |
    LDA #$60E0          ; $0F9BDE   |
    STA $3018           ; $0F9BE1   |
    LDA #$0056          ; $0F9BE4   |
    STA $301A           ; $0F9BE7   |
    LDY $7722,x         ; $0F9BEA   |
    TYX                 ; $0F9BED   |
    LDA $03A9EE,x       ; $0F9BEE   |
    STA $3004           ; $0F9BF2   |
    LDA $03A9CE,x       ; $0F9BF5   |
    STA $3006           ; $0F9BF9   |
    LDX #$A908          ; $0F9BFC   |
    STA $82,x           ; $0F9BFF   |
    JSL $7EDE44         ; $0F9C01   | GSU init
    INC $0CF9           ; $0F9C05   |
    LDX $12             ; $0F9C08   |
    RTS                 ; $0F9C0A   |

.init_tap_tap_the_red_nose
    JSL $03ADFE         ; $0F9C0B   |
    LDA #$0000          ; $0F9C0F   |
    STA $7542,x         ; $0F9C12   |
    LDA #$0018          ; $0F9C15   |
    STA $7720,x         ; $0F9C18   |
    LDA #$2280          ; $0F9C1B   |
    STA $6FA2,x         ; $0F9C1E   |
    STZ $106C           ; $0F9C21   |
    STZ $1072           ; $0F9C24   |
    STZ $1073           ; $0F9C27   |
    LDA $7182,x         ; $0F9C2A   |
    CLC                 ; $0F9C2D   |
    ADC #$0010          ; $0F9C2E   |
    STA $7182,x         ; $0F9C31   |
    LDA #$0058          ; $0F9C34   |
    STA $1064           ; $0F9C37   |
    LDA #$0040          ; $0F9C3A   |
    STA $7A96,x         ; $0F9C3D   |
    LDA #$0015          ; $0F9C40   |
    STA $7402,x         ; $0F9C43   |
    LDA $021A           ; $0F9C46   |
    AND #$00FF          ; $0F9C49   |
    CMP #$003F          ; $0F9C4C   |
    BNE CODE_0F9C57     ; $0F9C4F   |
    LDY #$42            ; $0F9C51   |
    JSL $0CE5D6         ; $0F9C53   |

CODE_0F9C57:
    RTL                 ; $0F9C57   |

.main_tap_tap_the_red_nose
    SEP #$20            ; $0F9C58   |
    JSR CODE_0FA8E9     ; $0F9C5A   |
    REP #$20            ; $0F9C5D   |
    JSL $03AF23         ; $0F9C5F   |
    JSR CODE_0FA6DB     ; $0F9C63   |
    SEP #$20            ; $0F9C66   |
    JSR CODE_0F9CA2     ; $0F9C68   |
    LDA $7862,x         ; $0F9C6B   |
    CMP #$18            ; $0F9C6E   |
    BNE CODE_0F9C9F     ; $0F9C70   |
    LDA #$7A            ; $0F9C72   |\ play sound #$007A
    JSL $0085D2         ; $0F9C74   |/
    LDA #$F0            ; $0F9C78   |
    STA $004D           ; $0F9C7A   |
    STZ $7862,x         ; $0F9C7D   |
    JSR CODE_0FA4CA     ; $0F9C80   |
    LDA #$0E            ; $0F9C83   |
    STA $105F           ; $0F9C85   |
    REP #$20            ; $0F9C88   |
    LDA $6FA0,x         ; $0F9C8A   |
    AND #$F9DF          ; $0F9C8D   |
    STA $6FA0,x         ; $0F9C90   |
    LDA $6FA2,x         ; $0F9C93   |
    AND #$FFE0          ; $0F9C96   |
    STA $6FA2,x         ; $0F9C99   |
    STZ $7542,x         ; $0F9C9C   |

CODE_0F9C9F:
    REP #$20            ; $0F9C9F   |
    RTL                 ; $0F9CA1   |

CODE_0F9CA2:
    JSR CODE_0FA624     ; $0F9CA2   |
    LDA $1060           ; $0F9CA5   |
    BEQ CODE_0F9CAD     ; $0F9CA8   |
    DEC $1060           ; $0F9CAA   |

CODE_0F9CAD:
    LDA $1061           ; $0F9CAD   |
    BEQ CODE_0F9CB5     ; $0F9CB0   |
    DEC $1061           ; $0F9CB2   |

CODE_0F9CB5:
    LDA $1069           ; $0F9CB5   |
    BEQ CODE_0F9CBD     ; $0F9CB8   |
    DEC $1069           ; $0F9CBA   |

CODE_0F9CBD:
    JSR CODE_0F9D70     ; $0F9CBD   |
    JSR CODE_0F9D9F     ; $0F9CC0   |
    LDA $7860,x         ; $0F9CC3   |
    AND #$01            ; $0F9CC6   |
    STA $1074           ; $0F9CC8   |
    LDA $021A           ; $0F9CCB   |
    CMP #$3F            ; $0F9CCE   |
    BEQ CODE_0F9CF6     ; $0F9CD0   |
    REP #$20            ; $0F9CD2   |
    LDA $7182,x         ; $0F9CD4   |
    SEC                 ; $0F9CD7   |
    SBC $003B           ; $0F9CD8   |
    CMP #$0120          ; $0F9CDB   |
    BCC CODE_0F9CF6     ; $0F9CDE   |
    BMI CODE_0F9CF6     ; $0F9CE0   |
    LDA $003B           ; $0F9CE2   |
    SEC                 ; $0F9CE5   |
    SBC #$0040          ; $0F9CE6   |
    STA $7182,x         ; $0F9CE9   |
    LDA $0039           ; $0F9CEC   |
    CLC                 ; $0F9CEF   |
    ADC #$0180          ; $0F9CF0   |
    STA $70E2,x         ; $0F9CF3   |

CODE_0F9CF6:
    SEP #$20            ; $0F9CF6   |
    RTS                 ; $0F9CF8   |

DATA_0F9CF9:         db $00, $10, $20, $30, $40, $50, $60, $70
DATA_0F9D01:         db $70, $70, $70, $70, $70, $70, $70, $70
DATA_0F9D09:         db $70, $70, $70, $70, $70, $70, $70, $70
DATA_0F9D11:         db $70, $70, $70, $70, $70, $70, $70, $70
DATA_0F9D19:         db $AD, $71, $10, $10, $03, $49, $FF, $1A

    TAY                 ; $0F9D21   |
    LDA $9CF9,y         ; $0F9D22   |
    STA $4202           ; $0F9D25   |
    LDA $1066           ; $0F9D28   |
    ASL A               ; $0F9D2B   |
    ASL A               ; $0F9D2C   |
    BPL CODE_0F9D32     ; $0F9D2D   |
    EOR #$FF            ; $0F9D2F   |
    INC A               ; $0F9D31   |

CODE_0F9D32:
    STA $4203           ; $0F9D32   |
    NOP                 ; $0F9D35   |
    NOP                 ; $0F9D36   |
    NOP                 ; $0F9D37   |
    NOP                 ; $0F9D38   |
    LDA $4217           ; $0F9D39   |
    ASL $4216           ; $0F9D3C   |
    ADC #$00            ; $0F9D3F   |
    STA $4212           ; $0F9D41   |
    LDA $70E2,x         ; $0F9D44   |
    SEC                 ; $0F9D47   |
    SBC #$78            ; $0F9D48   |
    BPL CODE_0F9D4F     ; $0F9D4A   |
    EOR #$FF            ; $0F9D4C   |
    INC A               ; $0F9D4E   |

CODE_0F9D4F:
    ASL A               ; $0F9D4F   |
    NOP                 ; $0F9D50   |
    STA $4213           ; $0F9D51   |
    NOP                 ; $0F9D54   |
    NOP                 ; $0F9D55   |
    NOP                 ; $0F9D56   |
    NOP                 ; $0F9D57   |
    LDA $4217           ; $0F9D58   |
    ASL $4216           ; $0F9D5B   |
    ADC #$00            ; $0F9D5E   |
    STA $4212           ; $0F9D60   |
    LDY $1066           ; $0F9D63   |
    BMI CODE_0F9D6B     ; $0F9D66   |
    EOR #$FF            ; $0F9D68   |
    INC A               ; $0F9D6A   |

CODE_0F9D6B:
    NOP                 ; $0F9D6B   |
    NOP                 ; $0F9D6C   |
    STA $00             ; $0F9D6D   |
    RTS                 ; $0F9D6F   |

CODE_0F9D70:
    LDA $7860,x         ; $0F9D70   |
    AND #$01            ; $0F9D73   |
    BEQ CODE_0F9D9A     ; $0F9D75   |
    STZ $7222,x         ; $0F9D77   |
    STZ $7223,x         ; $0F9D7A   |
    LDA $6F02,x         ; $0F9D7D   |
    LDY $1074           ; $0F9D80   |
    BEQ CODE_0F9D9B     ; $0F9D83   |
    CMP $105D           ; $0F9D85   |
    BEQ CODE_0F9D9A     ; $0F9D88   |
    BMI CODE_0F9D94     ; $0F9D8A   |
    INC $105D           ; $0F9D8C   |
    INC $105D           ; $0F9D8F   |
    BRA CODE_0F9D9A     ; $0F9D92   |

CODE_0F9D94:
    DEC $105D           ; $0F9D94   |
    DEC $105D           ; $0F9D97   |

CODE_0F9D9A:
    RTS                 ; $0F9D9A   |

CODE_0F9D9B:
    STA $105D           ; $0F9D9B   |
    RTS                 ; $0F9D9E   |

CODE_0F9D9F:
    JSR CODE_0FB243     ; $0F9D9F   |
    TXY                 ; $0F9DA2   |
    REP #$20            ; $0F9DA3   |
    LDA $1015           ; $0F9DA5   |
    BMI CODE_0F9DAC     ; $0F9DA8   |
    BNE CODE_0F9DB6     ; $0F9DAA   |

CODE_0F9DAC:
    SEP #$20            ; $0F9DAC   |
    LDA $105F           ; $0F9DAE   |
    ASL A               ; $0F9DB1   |
    TAX                 ; $0F9DB2   |
    JMP ($9DC9,x)       ; $0F9DB3   |

CODE_0F9DB6:
    SEP #$20            ; $0F9DB6   |
    LDA #$40            ; $0F9DB8   |
    STA $7A96,x         ; $0F9DBA   |
    RTS                 ; $0F9DBD   |

CODE_0F9DBE:
    LDA $6FA3,x         ; $0F9DBE   |
    AND #$FC            ; $0F9DC1   |
    ORA #$02            ; $0F9DC3   |
    STA $6FA3,x         ; $0F9DC5   |
    RTS                 ; $0F9DC8   |

DATA_0F9DC9:         dw $9DED
DATA_0F9DCB:         dw $9E37
DATA_0F9DCD:         dw $9E60
DATA_0F9DCF:         dw $9EC6
DATA_0F9DD1:         dw $9EF4
DATA_0F9DD3:         dw $9F29
DATA_0F9DD5:         dw $9FD4
DATA_0F9DD7:         dw $A058
DATA_0F9DD9:         dw $A0C4
DATA_0F9DDB:         dw $A12A
DATA_0F9DDD:         dw $A14D
DATA_0F9DDF:         dw $A1B8
DATA_0F9DE1:         dw $A230
DATA_0F9DE3:         dw $A318
DATA_0F9DE5:         dw $A383
DATA_0F9DE7:         dw $A515
DATA_0F9DE9:         dw $A56A
DATA_0F9DEB:         dw $A5BF

    TYX                 ; $0F9DED   |
    LDA $021A           ; $0F9DEE   |
    CMP #$3F            ; $0F9DF1   |
    BEQ CODE_0F9E24     ; $0F9DF3   |
    LDA #$06            ; $0F9DF5   |
    STA $1063           ; $0F9DF7   |
    STA $106D           ; $0F9DFA   |
    STZ $7402,x         ; $0F9DFD   |
    LDA #$FF            ; $0F9E00   |
    STA $1064           ; $0F9E02   |
    LDA #$40            ; $0F9E05   |
    STA $7542,x         ; $0F9E07   |
    LDA #$40            ; $0F9E0A   |
    STA $7A96,x         ; $0F9E0C   |
    LDA #$04            ; $0F9E0F   |
    STA $105F           ; $0F9E11   |
    LDA #$40            ; $0F9E14   |
    STA $7A96,x         ; $0F9E16   |
    LDA #$81            ; $0F9E19   |
    STA $6FA2,x         ; $0F9E1B   |
    LDA #$E8            ; $0F9E1E   |
    STA $7041,x         ; $0F9E20   |
    RTS                 ; $0F9E23   |

CODE_0F9E24:
    LDA $7A96,x         ; $0F9E24   |
    BNE CODE_0F9E36     ; $0F9E27   |
    INC $105F           ; $0F9E29   |
    REP #$20            ; $0F9E2C   |
    LDA #$0001          ; $0F9E2E   |
    STA $1015           ; $0F9E31   |
    SEP #$20            ; $0F9E34   |

CODE_0F9E36:
    RTS                 ; $0F9E36   |

    TYX                 ; $0F9E37   |
    REP #$20            ; $0F9E38   |
    LDA $7A96,x         ; $0F9E3A   |
    BNE CODE_0F9E5D     ; $0F9E3D   |
    LDA #$FC00          ; $0F9E3F   |
    STA $7222,x         ; $0F9E42   |
    LDA #$0018          ; $0F9E45   |
    STA $7542,x         ; $0F9E48   |
    STZ $1015           ; $0F9E4B   |
    SEP #$20            ; $0F9E4E   |
    LDA #$16            ; $0F9E50   |
    STA $7402,x         ; $0F9E52   |
    LDA #$0C            ; $0F9E55   |
    STA $7A96,x         ; $0F9E57   |
    INC $105F           ; $0F9E5A   |

CODE_0F9E5D:
    SEP #$20            ; $0F9E5D   |
    RTS                 ; $0F9E5F   |

    TYX                 ; $0F9E60   |
    SEP #$20            ; $0F9E61   |
    LDA $7A96,x         ; $0F9E63   |
    BEQ CODE_0F9E87     ; $0F9E66   |
    CMP #$01            ; $0F9E68   |
    BNE CODE_0F9E85     ; $0F9E6A   |
    LDA $7182,x         ; $0F9E6C   |
    CLC                 ; $0F9E6F   |
    ADC #$00            ; $0F9E70   |
    STA $7182,x         ; $0F9E72   |
    STZ $7402,x         ; $0F9E75   |
    LDA #$E8            ; $0F9E78   |
    STA $7041,x         ; $0F9E7A   |
    LDA #$12            ; $0F9E7D   |
    STA $1063           ; $0F9E7F   |
    JSR CODE_0FA6DB     ; $0F9E82   |

CODE_0F9E85:
    BRA CODE_0F9EC5     ; $0F9E85   |

CODE_0F9E87:
    LDA $1064           ; $0F9E87   |
    CMP #$FF            ; $0F9E8A   |
    BEQ CODE_0F9E98     ; $0F9E8C   |
    CLC                 ; $0F9E8E   |
    ADC #$06            ; $0F9E8F   |
    STA $1064           ; $0F9E91   |
    BCS CODE_0F9E98     ; $0F9E94   |
    BRA CODE_0F9E9D     ; $0F9E96   |

CODE_0F9E98:
    LDA #$FF            ; $0F9E98   |
    STA $1064           ; $0F9E9A   |

CODE_0F9E9D:
    LDA $105D           ; $0F9E9D   |
    CLC                 ; $0F9EA0   |
    ADC #$08            ; $0F9EA1   |
    STA $105D           ; $0F9EA3   |
    BEQ CODE_0F9EA9     ; $0F9EA6   |
    RTS                 ; $0F9EA8   |

CODE_0F9EA9:
    LDA #$FF            ; $0F9EA9   |
    STA $7542,x         ; $0F9EAB   |
    LDA #$06            ; $0F9EAE   |
    STA $1063           ; $0F9EB0   |
    LDA #$00            ; $0F9EB3   |
    STA $7222,x         ; $0F9EB5   |
    LDA #$00            ; $0F9EB8   |
    STA $7223,x         ; $0F9EBA   |
    LDA #$81            ; $0F9EBD   |
    STA $6FA2,x         ; $0F9EBF   |
    INC $105F           ; $0F9EC2   |

CODE_0F9EC5:
    RTS                 ; $0F9EC5   |

    TYX                 ; $0F9EC6   |
    SEP #$20            ; $0F9EC7   |
    LDA $7860,x         ; $0F9EC9   |
    AND #$01            ; $0F9ECC   |
    BEQ CODE_0F9EF3     ; $0F9ECE   |
    LDA #$06            ; $0F9ED0   |
    STA $1063           ; $0F9ED2   |
    STA $106D           ; $0F9ED5   |
    LDA #$47            ; $0F9ED8   |\ play sound #$0047
    JSL $0085D2         ; $0F9EDA   |/
    LDA #$18            ; $0F9EDE   |
    STA $61C6           ; $0F9EE0   |
    LDA #$40            ; $0F9EE3   |
    STA $7542,x         ; $0F9EE5   |
    LDA #$A0            ; $0F9EE8   |
    STA $7A96,x         ; $0F9EEA   |
    STZ $60AC           ; $0F9EED   |
    INC $105F           ; $0F9EF0   |

CODE_0F9EF3:
    RTS                 ; $0F9EF3   |

    TYX                 ; $0F9EF4   |
    SEP #$20            ; $0F9EF5   |
    LDA $7A96,x         ; $0F9EF7   |
    BNE CODE_0F9EFF     ; $0F9EFA   |
    JSR CODE_0F9FFB     ; $0F9EFC   |

CODE_0F9EFF:
    RTS                 ; $0F9EFF   |

DATA_0F9F00:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_0F9F08:         db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F

DATA_0F9F10:         dw $FF00, $0100, $FE80, $0180

DATA_0F9F18:         db $1F, $1F, $1F, $1F, $20, $20, $20, $20
DATA_0F9F20:         db $20, $20, $20, $20, $1F, $1F, $1F, $1F
DATA_0F9F28:         db $1F

    TYX                 ; $0F9F29   |
    LDA #$40            ; $0F9F2A   |
    STA $7542,x         ; $0F9F2C   |
    JSR CODE_0F9DBE     ; $0F9F2F   |
    LDA $1061           ; $0F9F32   |
    BNE CODE_0F9F78     ; $0F9F35   |
    DEC $106C           ; $0F9F37   |
    BPL CODE_0F9F78     ; $0F9F3A   |
    LDA #$01            ; $0F9F3C   |
    STA $106C           ; $0F9F3E   |
    LDA $106D           ; $0F9F41   |
    INC A               ; $0F9F44   |
    AND #$0F            ; $0F9F45   |
    STA $106D           ; $0F9F47   |
    LDY $106D           ; $0F9F4A   |
    LDA $9F00,y         ; $0F9F4D   |
    STA $1063           ; $0F9F50   |
    DEC A               ; $0F9F53   |
    AND #$07            ; $0F9F54   |
    BNE CODE_0F9F5B     ; $0F9F56   |
    JSR CODE_0FA006     ; $0F9F58   |

CODE_0F9F5B:
    LDA $1063           ; $0F9F5B   |
    AND #$07            ; $0F9F5E   |
    BNE CODE_0F9F78     ; $0F9F60   |
    LDA #$0C            ; $0F9F62   |
    STA $61C6           ; $0F9F64   |
    LDA #$10            ; $0F9F67   |
    STA $1061           ; $0F9F69   |
    LDA #$84            ; $0F9F6C   |\ play sound #$0084
    JSL $0085D2         ; $0F9F6E   |/
    STZ $7220,x         ; $0F9F72   |
    STZ $7221,x         ; $0F9F75   |

CODE_0F9F78:
    LDA $7860,x         ; $0F9F78   |
    AND #$0C            ; $0F9F7B   |
    STA $106F           ; $0F9F7D   |
    BNE CODE_0F9F8E     ; $0F9F80   |
    LDA $7860,x         ; $0F9F82   |
    AND #$01            ; $0F9F85   |
    BNE CODE_0F9F91     ; $0F9F87   |
    LDA $1074           ; $0F9F89   |
    BEQ CODE_0F9F91     ; $0F9F8C   |

CODE_0F9F8E:
    JMP CODE_0F9FCC     ; $0F9F8E   |

CODE_0F9F91:
    LDA $1063           ; $0F9F91   |
    BEQ CODE_0F9FA2     ; $0F9F94   |
    CMP #$01            ; $0F9F96   |
    BEQ CODE_0F9FA2     ; $0F9F98   |
    CMP #$0E            ; $0F9F9A   |
    BEQ CODE_0F9FA2     ; $0F9F9C   |
    CMP #$0F            ; $0F9F9E   |
    BNE CODE_0F9FBC     ; $0F9FA0   |

CODE_0F9FA2:
    JSR CODE_0FA5FE     ; $0F9FA2   |
    TYA                 ; $0F9FA5   |
    CMP $7400,x         ; $0F9FA6   |
    BEQ CODE_0F9FBD     ; $0F9FA9   |
    LDA $0030           ; $0F9FAB   |
    AND #$00            ; $0F9FAE   |
    BNE CODE_0F9FBC     ; $0F9FB0   |
    LDA #$06            ; $0F9FB2   |
    STA $105F           ; $0F9FB4   |
    LDA #$10            ; $0F9FB7   |
    STA $1060           ; $0F9FB9   |

CODE_0F9FBC:
    RTS                 ; $0F9FBC   |

CODE_0F9FBD:
    REP #$20            ; $0F9FBD   |
    LDA $0E             ; $0F9FBF   |
    CLC                 ; $0F9FC1   |
    ADC #$0050          ; $0F9FC2   |
    CMP #$00A0          ; $0F9FC5   |
    SEP #$20            ; $0F9FC8   |
    BCS CODE_0F9FD3     ; $0F9FCA   |

CODE_0F9FCC:
    LDA #$07            ; $0F9FCC   |
    STA $105F           ; $0F9FCE   |
    STZ $16,x           ; $0F9FD1   |

CODE_0F9FD3:
    RTS                 ; $0F9FD3   |

    TYX                 ; $0F9FD4   |
    LDA #$40            ; $0F9FD5   |
    STA $7542,x         ; $0F9FD7   |
    JSR CODE_0F9DBE     ; $0F9FDA   |
    STZ $7220,x         ; $0F9FDD   |
    STZ $7221,x         ; $0F9FE0   |
    LDY $1060           ; $0F9FE3   |
    BEQ CODE_0F9FFB     ; $0F9FE6   |
    LDA $9F18,y         ; $0F9FE8   |
    STA $1063           ; $0F9FEB   |
    CPY #$08            ; $0F9FEE   |
    BNE CODE_0F9FFA     ; $0F9FF0   |
    LDA $7400,x         ; $0F9FF2   |
    EOR #$02            ; $0F9FF5   |
    STA $7400,x         ; $0F9FF7   |

CODE_0F9FFA:
    RTS                 ; $0F9FFA   |

CODE_0F9FFB:
    LDA #$05            ; $0F9FFB   |
    STA $105F           ; $0F9FFD   |
    STZ $106C           ; $0FA000   |
    STZ $106D           ; $0FA003   |

CODE_0FA006:
    LDY $7400,x         ; $0FA006   |
    LDA $021A           ; $0FA009   |
    CMP #$3F            ; $0FA00C   |
    BEQ CODE_0FA014     ; $0FA00E   |
    INY                 ; $0FA010   |
    INY                 ; $0FA011   |
    INY                 ; $0FA012   |
    INY                 ; $0FA013   |

CODE_0FA014:
    REP #$20            ; $0FA014   |
    LDA $9F10,y         ; $0FA016   |
    STA $7220,x         ; $0FA019   |
    SEP #$20            ; $0FA01C   |
    RTS                 ; $0FA01E   |

DATA_0FA01F:         dw $FE00, $0200, $FF00, $0100

DATA_0FA027:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA02F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA037:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA03F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA047:         db $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
DATA_0FA04F:         db $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
DATA_0FA057:         db $FF

    TYX                 ; $0FA058   |
    LDA #$40            ; $0FA059   |
    STA $7542,x         ; $0FA05B   |
    JSR CODE_0F9DBE     ; $0FA05E   |
    STZ $7220,x         ; $0FA061   |
    STZ $7221,x         ; $0FA064   |
    LDY $16,x           ; $0FA067   |
    INC $16,x           ; $0FA069   |
    LDA $A027,y         ; $0FA06B   |
    BMI CODE_0FA074     ; $0FA06E   |
    STA $1063           ; $0FA070   |
    RTS                 ; $0FA073   |

CODE_0FA074:
    LDA #$13            ; $0FA074   |\ play sound #$0013
    JSL $0085D2         ; $0FA076   |/
    LDA #$00            ; $0FA07A   |
    STA $7222,x         ; $0FA07C   |
    LDA #$F9            ; $0FA07F   |
    STA $7223,x         ; $0FA081   |
    LSR $7860,x         ; $0FA084   |
    ASL $7860,x         ; $0FA087   |
    INC $105F           ; $0FA08A   |
    STZ $16,x           ; $0FA08D   |

CODE_0FA08F:
    LDY $7400,x         ; $0FA08F   |
    LDA $106F           ; $0FA092   |
    BEQ CODE_0FA09B     ; $0FA095   |
    INY                 ; $0FA097   |
    INY                 ; $0FA098   |
    INY                 ; $0FA099   |
    INY                 ; $0FA09A   |

CODE_0FA09B:
    REP #$20            ; $0FA09B   |
    LDA $A01F,y         ; $0FA09D   |
    STA $7220,x         ; $0FA0A0   |
    SEP #$20            ; $0FA0A3   |
    RTS                 ; $0FA0A5   |

DATA_0FA0A6:         db $10, $10, $11, $11, $11, $11, $11, $11
DATA_0FA0AE:         db $11, $11, $11, $11, $11, $11, $11, $11
DATA_0FA0B6:         db $11, $11, $11, $11, $11, $11, $11, $11
DATA_0FA0BE:         db $11, $11, $10, $10, $10, $10

    TYX                 ; $0FA0C4   |
    LDA #$40            ; $0FA0C5   |
    STA $7542,x         ; $0FA0C7   |
    JSR CODE_0F9DBE     ; $0FA0CA   |
    LDA $7860,x         ; $0FA0CD   |
    AND #$0C            ; $0FA0D0   |
    BNE CODE_0FA0D7     ; $0FA0D2   |
    JSR CODE_0FA08F     ; $0FA0D4   |

CODE_0FA0D7:
    LDY $16,x           ; $0FA0D7   |
    CPY #$1C            ; $0FA0D9   |
    BCS CODE_0FA0DF     ; $0FA0DB   |
    INC $16,x           ; $0FA0DD   |

CODE_0FA0DF:
    LDA $A0A6,y         ; $0FA0DF   |
    STA $1063           ; $0FA0E2   |
    LDA $7860,x         ; $0FA0E5   |
    AND #$01            ; $0FA0E8   |
    BEQ CODE_0FA104     ; $0FA0EA   |
    LDA #$18            ; $0FA0EC   |
    STA $61C6           ; $0FA0EE   |
    LDA #$47            ; $0FA0F1   |\ play sound #$0047
    JSL $0085D2         ; $0FA0F3   |/
    STZ $7222,x         ; $0FA0F7   |
    STZ $7223,x         ; $0FA0FA   |
    LDA #$09            ; $0FA0FD   |
    STA $105F           ; $0FA0FF   |
    STZ $16,x           ; $0FA102   |

CODE_0FA104:
    RTS                 ; $0FA104   |

DATA_0FA105:         db $0F, $0F, $0F, $0F, $00, $00, $00, $00
DATA_0FA10D:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA115:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA11D:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA125:         db $00, $00, $00, $00, $FF

    TYX                 ; $0FA12A   |
    LDA #$40            ; $0FA12B   |
    STA $7542,x         ; $0FA12D   |
    JSR CODE_0F9DBE     ; $0FA130   |
    STZ $7220,x         ; $0FA133   |
    STZ $7221,x         ; $0FA136   |
    LDY $16,x           ; $0FA139   |
    INC $16,x           ; $0FA13B   |
    LDA $A105,y         ; $0FA13D   |
    BMI CODE_0FA146     ; $0FA140   |
    STA $1063           ; $0FA142   |
    RTS                 ; $0FA145   |

CODE_0FA146:
    JSR CODE_0F9FFB     ; $0FA146   |
    JSR CODE_0F9FA2     ; $0FA149   |
    RTS                 ; $0FA14C   |

    TYX                 ; $0FA14D   |
    LDA #$40            ; $0FA14E   |
    STA $7542,x         ; $0FA150   |
    LDA #$12            ; $0FA153   |
    STA $1063           ; $0FA155   |
    LDA $7860,x         ; $0FA158   |
    AND #$01            ; $0FA15B   |
    BNE CODE_0FA16E     ; $0FA15D   |
    LDA $7182,x         ; $0FA15F   |
    CMP #$A0            ; $0FA162   |
    BCS CODE_0FA16E     ; $0FA164   |
    LDA $1074           ; $0FA166   |
    BEQ CODE_0FA16E     ; $0FA169   |
    JMP CODE_0FA279     ; $0FA16B   |

CODE_0FA16E:
    LDA $1073           ; $0FA16E   |
    CLC                 ; $0FA171   |
    ADC $1072           ; $0FA172   |
    STA $1073           ; $0FA175   |
    LDY $1060           ; $0FA178   |
    BNE CODE_0FA18E     ; $0FA17B   |
    LDA $1073           ; $0FA17D   |
    CMP #$00            ; $0FA180   |
    BNE CODE_0FA18E     ; $0FA182   |

CODE_0FA184:
    STZ $1073           ; $0FA184   |
    STZ $16,x           ; $0FA187   |
    LDA #$0C            ; $0FA189   |
    STA $105F           ; $0FA18B   |

CODE_0FA18E:
    RTS                 ; $0FA18E   |

DATA_0FA18F:         db $16, $16, $16, $16, $15, $15, $15, $15
DATA_0FA197:         db $14, $14, $14, $14, $12, $12, $12, $12
DATA_0FA19F:         db $12, $12, $12, $12, $12, $12, $12, $12
DATA_0FA1A7:         db $12, $12, $12, $12, $12, $12, $12, $12
DATA_0FA1AF:         db $12, $12, $12, $12, $12, $12, $12, $12
DATA_0FA1B7:         db $FF

    TYX                 ; $0FA1B8   |
    LDA #$40            ; $0FA1B9   |
    STA $7542,x         ; $0FA1BB   |
    JSR CODE_0FA5CE     ; $0FA1BE   |
    NOP                 ; $0FA1C1   |
    NOP                 ; $0FA1C2   |
    NOP                 ; $0FA1C3   |
    NOP                 ; $0FA1C4   |
    NOP                 ; $0FA1C5   |
    NOP                 ; $0FA1C6   |
    LDY $16,x           ; $0FA1C7   |
    INC $16,x           ; $0FA1C9   |
    LDA $A18F,y         ; $0FA1CB   |
    BMI CODE_0FA1D4     ; $0FA1CE   |
    STA $1063           ; $0FA1D0   |
    RTS                 ; $0FA1D3   |

CODE_0FA1D4:
    JMP CODE_0FA184     ; $0FA1D4   |

DATA_0FA1D7:         db $12, $12, $12, $12, $12, $12, $12, $12
DATA_0FA1DF:         db $12, $12, $12, $12, $12, $12, $12, $12
DATA_0FA1E7:         db $12, $12, $12, $12, $13, $13, $13, $13
DATA_0FA1EF:         db $13, $13, $13, $13, $13, $13, $12, $12
DATA_0FA1F7:         db $12, $12, $13, $13, $13, $13, $13, $13
DATA_0FA1FF:         db $13, $13, $13, $13, $14, $14, $14, $14
DATA_0FA207:         db $15, $15, $15, $15, $16, $16, $16, $16
DATA_0FA20F:         db $00, $00, $00, $00, $0F, $0F, $0F, $0F
DATA_0FA217:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA21F:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA227:         db $00, $00, $00, $00, $FF, $00, $00, $00
DATA_0FA22F:         db $00

    TYX                 ; $0FA230   |
    LDA #$40            ; $0FA231   |
    STA $7542,x         ; $0FA233   |
    JSR CODE_0FA5CE     ; $0FA236   |
    NOP                 ; $0FA239   |
    NOP                 ; $0FA23A   |
    NOP                 ; $0FA23B   |
    NOP                 ; $0FA23C   |
    NOP                 ; $0FA23D   |
    NOP                 ; $0FA23E   |
    LDY $16,x           ; $0FA23F   |
    INC $16,x           ; $0FA241   |
    LDA $A1D7,y         ; $0FA243   |
    BMI CODE_0FA275     ; $0FA246   |
    STA $1063           ; $0FA248   |
    CPY #$30            ; $0FA24B   |
    BNE CODE_0FA25F     ; $0FA24D   |
    LDA #$80            ; $0FA24F   |
    STA $7222,x         ; $0FA251   |
    LDA #$FD            ; $0FA254   |
    STA $7223,x         ; $0FA256   |
    LSR $7860,x         ; $0FA259   |
    ASL $7860,x         ; $0FA25C   |

CODE_0FA25F:
    CPY #$2C            ; $0FA25F   |
    BCC CODE_0FA274     ; $0FA261   |
    CPY #$38            ; $0FA263   |
    BCS CODE_0FA274     ; $0FA265   |
    LDY $7400,x         ; $0FA267   |
    REP #$20            ; $0FA26A   |
    LDA $A22C,y         ; $0FA26C   |
    STA $7220,x         ; $0FA26F   |
    SEP #$20            ; $0FA272   |

CODE_0FA274:
    RTS                 ; $0FA274   |

CODE_0FA275:
    JSR CODE_0F9FFB     ; $0FA275   |
    RTS                 ; $0FA278   |

CODE_0FA279:
    LDA #$0D            ; $0FA279   |
    STA $105F           ; $0FA27B   |
    STZ $16,x           ; $0FA27E   |
    RTS                 ; $0FA280   |

DATA_0FA281:         db $17, $17, $18, $18, $19, $19, $19, $19
DATA_0FA289:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA291:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA299:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2A1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2A9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2B1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2B9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2C1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2C9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2D1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2D9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2E1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2E9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2F1:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA2F9:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA301:         db $1A, $1A, $1A, $1A, $19, $19, $19, $19
DATA_0FA309:         db $18, $18, $18, $18, $17, $17, $17, $17
DATA_0FA311:         db $FF

DATA_0FA312:         dw $0100, $FF00, $0100

    TYX                 ; $0FA318   |
    LDA $6FA3,x         ; $0FA319   |
    AND #$FC            ; $0FA31C   |
    STA $6FA3,x         ; $0FA31E   |
    LDA $1073           ; $0FA321   |
    BNE CODE_0FA36A     ; $0FA324   |
    LDA $16,x           ; $0FA326   |
    LSR A               ; $0FA328   |
    LSR A               ; $0FA329   |
    NOP                 ; $0FA32A   |
    NOP                 ; $0FA32B   |
    NOP                 ; $0FA32C   |
    NOP                 ; $0FA32D   |
    ASL A               ; $0FA32E   |
    AND #$02            ; $0FA32F   |
    CLC                 ; $0FA331   |
    ADC $7400,x         ; $0FA332   |
    TAY                 ; $0FA335   |
    REP #$20            ; $0FA336   |
    LDA $A312,y         ; $0FA338   |
    STA $7220,x         ; $0FA33B   |
    STZ $7222,x         ; $0FA33E   |
    STZ $7542,x         ; $0FA341   |
    SEP #$20            ; $0FA344   |
    LDY $16,x           ; $0FA346   |
    INC $16,x           ; $0FA348   |
    LDA $A281,y         ; $0FA34A   |
    BPL CODE_0FA352     ; $0FA34D   |
    JMP CODE_0F9FFB     ; $0FA34F   |

CODE_0FA352:
    PHA                 ; $0FA352   |
    LDA #$00            ; $0FA353   |
    LDY $1072           ; $0FA355   |
    BMI CODE_0FA35C     ; $0FA358   |
    LDA #$02            ; $0FA35A   |

CODE_0FA35C:
    PLY                 ; $0FA35C   |
    CMP $7400,x         ; $0FA35D   |
    BNE CODE_0FA366     ; $0FA360   |
    INY                 ; $0FA362   |
    INY                 ; $0FA363   |
    INY                 ; $0FA364   |
    INY                 ; $0FA365   |

CODE_0FA366:
    STY $1063           ; $0FA366   |
    RTS                 ; $0FA369   |

CODE_0FA36A:
    CLC                 ; $0FA36A   |
    ADC $1072           ; $0FA36B   |
    STA $1073           ; $0FA36E   |
    LDA #$12            ; $0FA371   |
    STA $1063           ; $0FA373   |
    RTS                 ; $0FA376   |

DATA_0FA377:         dw $0080, $FF80

DATA_0FA37B:         dw $FF60, $FF80, $FF70, $FF80

    TYX                 ; $0FA383   |
    LDA #$12            ; $0FA384   |
    STA $1063           ; $0FA386   |
    LDA $7182,x         ; $0FA389   |
    CMP #$D0            ; $0FA38C   |
    BCC CODE_0FA398     ; $0FA38E   |
    INC $105F           ; $0FA390   |
    LDA #$60            ; $0FA393   |
    STA $7A96,x         ; $0FA395   |

CODE_0FA398:
    LDA $1073           ; $0FA398   |
    BEQ CODE_0FA3A4     ; $0FA39B   |
    CLC                 ; $0FA39D   |
    ADC $1072           ; $0FA39E   |
    STA $1073           ; $0FA3A1   |

CODE_0FA3A4:
    LDY #$01            ; $0FA3A4   |
    LDA $0030           ; $0FA3A6   |
    BIT #$03            ; $0FA3A9   |
    BNE CODE_0FA3BB     ; $0FA3AB   |
    AND #$20            ; $0FA3AD   |
    BEQ CODE_0FA3B3     ; $0FA3AF   |
    LDY #$FF            ; $0FA3B1   |

CODE_0FA3B3:
    TYA                 ; $0FA3B3   |
    CLC                 ; $0FA3B4   |
    ADC $105D           ; $0FA3B5   |
    STA $105D           ; $0FA3B8   |

CODE_0FA3BB:
    REP #$20            ; $0FA3BB   |
    STZ $7220,x         ; $0FA3BD   |
    LDA $0030           ; $0FA3C0   |
    LSR A               ; $0FA3C3   |
    LSR A               ; $0FA3C4   |
    NOP                 ; $0FA3C5   |
    NOP                 ; $0FA3C6   |
    NOP                 ; $0FA3C7   |
    AND #$0002          ; $0FA3C8   |
    TAY                 ; $0FA3CB   |
    LDA $A377,y         ; $0FA3CC   |
    CLC                 ; $0FA3CF   |
    ADC #$0040          ; $0FA3D0   |
    STA $7222,x         ; $0FA3D3   |

CODE_0FA3D6:
    REP #$20            ; $0FA3D6   |
    LDA $0030           ; $0FA3D8   |
    AND #$0003          ; $0FA3DB   |
    BNE CODE_0FA444     ; $0FA3DE   |
    LDA $10             ; $0FA3E0   |
    AND #$003F          ; $0FA3E2   |
    CLC                 ; $0FA3E5   |
    ADC #$FFE0          ; $0FA3E6   |
    STA $00             ; $0FA3E9   |
    ASL A               ; $0FA3EB   |
    ASL A               ; $0FA3EC   |
    NOP                 ; $0FA3ED   |
    STA $02             ; $0FA3EE   |
    LDA $10             ; $0FA3F0   |
    AND #$0003          ; $0FA3F2   |
    ASL A               ; $0FA3F5   |
    TAY                 ; $0FA3F6   |
    LDA $A37B,y         ; $0FA3F7   |
    STA $04             ; $0FA3FA   |
    LDA #$01C7          ; $0FA3FC   |
    JSL $008B21         ; $0FA3FF   |
    LDA $70E2,x         ; $0FA403   |
    CLC                 ; $0FA406   |
    ADC $00             ; $0FA407   |
    STA $70A2,y         ; $0FA409   |
    LDA #$07C0          ; $0FA40C   |
    STA $7142,y         ; $0FA40F   |
    LDA $02             ; $0FA412   |
    STA $71E0,y         ; $0FA414   |
    LDA $04             ; $0FA417   |
    STA $71E2,y         ; $0FA419   |
    LDA #$0030          ; $0FA41C   |
    STA $7782,y         ; $0FA41F   |
    LDA #$01D9          ; $0FA422   |
    JSL $008B21         ; $0FA425   |
    LDA $70E2,x         ; $0FA429   |
    CLC                 ; $0FA42C   |
    ADC $00             ; $0FA42D   |
    STA $70A2,y         ; $0FA42F   |
    LDA #$07C0          ; $0FA432   |
    STA $7142,y         ; $0FA435   |
    LDA #$000C          ; $0FA438   |
    STA $7782,y         ; $0FA43B   |
    LDA #$0002          ; $0FA43E   |
    STA $7E4C,y         ; $0FA441   |

CODE_0FA444:
    SEP #$20            ; $0FA444   |
    JSR CODE_0FA558     ; $0FA446   |
    RTS                 ; $0FA449   |

DATA_0FA44A:         dw $FFF0, $FFF4, $FFF8, $FFFC
DATA_0FA452:         dw $0004, $0008, $000C, $0010
DATA_0FA45A:         dw $FFEE, $FFF2, $FFF6, $FFFA
DATA_0FA462:         dw $0006, $000A, $000E, $0012

DATA_0FA46A:         dw $FF00, $FF40, $FF80, $FFC0
DATA_0FA472:         dw $0040, $0080, $00C0, $0100
DATA_0FA47A:         dw $FF20, $FF60, $FFA0, $FFE0
DATA_0FA482:         dw $0020, $0060, $00A0, $00E0

DATA_0FA48A:         dw $FE20, $FE00, $FE40, $FE10
DATA_0FA492:         dw $FDF0, $FDF8, $FE30, $FE60
DATA_0FA49A:         dw $FE58, $FE28, $FDF0, $FDE8
DATA_0FA4A2:         dw $FE08, $FE38, $FDF8, $FE18

DATA_0FA4AA:         dw $0030, $0030, $0030, $0030
DATA_0FA4B2:         dw $0030, $0030, $0030, $0030
DATA_0FA4BA:         dw $0030, $0030, $0030, $0030
DATA_0FA4C2:         dw $0030, $0030, $0030, $0030

CODE_0FA4CA:
    REP #$20            ; $0FA4CA   |
    LDA $70E2,x         ; $0FA4CC   |
    STA $00             ; $0FA4CF   |
    LDA #$001E          ; $0FA4D1   |
    STA $08             ; $0FA4D4   |

CODE_0FA4D6:
    LDA #$01C7          ; $0FA4D6   |
    JSL $008B21         ; $0FA4D9   |
    LDX $08             ; $0FA4DD   |
    LDA $00             ; $0FA4DF   |
    CLC                 ; $0FA4E1   |
    ADC $A44A,x         ; $0FA4E2   |
    STA $70A2,y         ; $0FA4E5   |
    LDA #$07C0          ; $0FA4E8   |
    STA $7142,y         ; $0FA4EB   |
    LDA $A46A,x         ; $0FA4EE   |
    STA $71E0,y         ; $0FA4F1   |
    LDA $A48A,x         ; $0FA4F4   |
    STA $71E2,y         ; $0FA4F7   |
    LDA $A4AA,x         ; $0FA4FA   |
    STA $7782,y         ; $0FA4FD   |
    LDA #$0020          ; $0FA500   |
    STA $7502,y         ; $0FA503   |
    LDX $12             ; $0FA506   |
    DEC $08             ; $0FA508   |
    DEC $08             ; $0FA50A   |
    BPL CODE_0FA4D6     ; $0FA50C   |
    SEP #$20            ; $0FA50E   |
    RTS                 ; $0FA510   |

DATA_0FA511:         dw $0080, $FF00

    TYX                 ; $0FA515   |
    JSR CODE_0FA3D6     ; $0FA516   |
    LDA $7A96,x         ; $0FA519   |
    BNE CODE_0FA521     ; $0FA51C   |
    INC $105F           ; $0FA51E   |

CODE_0FA521:
    LDY #$12            ; $0FA521   |
    LDA $0030           ; $0FA523   |
    AND #$18            ; $0FA526   |
    BEQ CODE_0FA52B     ; $0FA528   |
    INY                 ; $0FA52A   |

CODE_0FA52B:
    STY $1063           ; $0FA52B   |
    LDY #$01            ; $0FA52E   |
    LDA $0030           ; $0FA530   |
    BIT #$00            ; $0FA533   |
    BNE CODE_0FA545     ; $0FA535   |
    AND #$08            ; $0FA537   |
    BEQ CODE_0FA53D     ; $0FA539   |
    LDY #$FF            ; $0FA53B   |

CODE_0FA53D:
    TYA                 ; $0FA53D   |
    CLC                 ; $0FA53E   |
    ADC $105D           ; $0FA53F   |
    STA $105D           ; $0FA542   |

CODE_0FA545:
    REP #$20            ; $0FA545   |
    LDA $0030           ; $0FA547   |
    LSR A               ; $0FA54A   |
    LSR A               ; $0FA54B   |
    NOP                 ; $0FA54C   |
    NOP                 ; $0FA54D   |
    AND #$0002          ; $0FA54E   |
    TAY                 ; $0FA551   |
    LDA $A511,y         ; $0FA552   |
    STA $7222,x         ; $0FA555   |

CODE_0FA558:
    SEP #$20            ; $0FA558   |
    LDA $0030           ; $0FA55A   |
    AND #$1F            ; $0FA55D   |
    BNE CODE_0FA567     ; $0FA55F   |
    LDA #$62            ; $0FA561   |\ play sound #$0062
    JSL $0085D2         ; $0FA563   |/

CODE_0FA567:
    RTS                 ; $0FA567   |

DATA_0FA568:         db $FF, $01

    TYX                 ; $0FA56A   |
    JSR CODE_0FA3D6     ; $0FA56B   |
    LDA #$40            ; $0FA56E   |
    STA $7222,x         ; $0FA570   |
    STZ $7223,x         ; $0FA573   |
    LDA $0030           ; $0FA576   |
    AND #$03            ; $0FA579   |
    BNE CODE_0FA58C     ; $0FA57B   |
    LDA $7400,x         ; $0FA57D   |
    LSR A               ; $0FA580   |
    TAY                 ; $0FA581   |
    LDA $A568,y         ; $0FA582   |
    CLC                 ; $0FA585   |
    ADC $1073           ; $0FA586   |
    STA $1073           ; $0FA589   |

CODE_0FA58C:
    LDA $7183,x         ; $0FA58C   |
    CMP #$08            ; $0FA58F   |
    BCC CODE_0FA5BB     ; $0FA591   |
    LDA #$11            ; $0FA593   |
    STA $105F           ; $0FA595   |
    LDA #$20            ; $0FA598   |
    STA $7A96,x         ; $0FA59A   |
    REP #$20            ; $0FA59D   |
    JSL $02A982         ; $0FA59F   |
    LDA $70E2,x         ; $0FA5A3   |
    CLC                 ; $0FA5A6   |
    ADC #$0000          ; $0FA5A7   |
    STA $00             ; $0FA5AA   |
    LDA $7182,x         ; $0FA5AC   |
    CLC                 ; $0FA5AF   |
    ADC #$0000          ; $0FA5B0   |
    STA $02             ; $0FA5B3   |
    JSL $02E19C         ; $0FA5B5   |
    SEP #$20            ; $0FA5B9   |

CODE_0FA5BB:
    JSR CODE_0FA558     ; $0FA5BB   |
    RTS                 ; $0FA5BE   |

    TYX                 ; $0FA5BF   |
    LDA $7A96,x         ; $0FA5C0   |
    BNE CODE_0FA5CD     ; $0FA5C3   |
    REP #$20            ; $0FA5C5   |
    JSL $03A32E         ; $0FA5C7   |
    SEP #$20            ; $0FA5CB   |

CODE_0FA5CD:
    RTS                 ; $0FA5CD   |

CODE_0FA5CE:
    REP #$20            ; $0FA5CE   |
    LDA $7220,x         ; $0FA5D0   |
    BEQ CODE_0FA5E1     ; $0FA5D3   |
    BPL CODE_0FA5DD     ; $0FA5D5   |
    CLC                 ; $0FA5D7   |
    ADC #$0010          ; $0FA5D8   |
    BRA CODE_0FA5E1     ; $0FA5DB   |

CODE_0FA5DD:
    SEC                 ; $0FA5DD   |
    SBC #$0010          ; $0FA5DE   |

CODE_0FA5E1:
    STA $7220,x         ; $0FA5E1   |
    SEP #$20            ; $0FA5E4   |
    RTS                 ; $0FA5E6   |

CODE_0FA5E7:
    REP #$20            ; $0FA5E7   |
    LDA $7220,x         ; $0FA5E9   |
    BEQ CODE_0FA5FA     ; $0FA5EC   |
    BPL CODE_0FA5F6     ; $0FA5EE   |
    CLC                 ; $0FA5F0   |
    ADC #$0002          ; $0FA5F1   |
    BRA CODE_0FA5FA     ; $0FA5F4   |

CODE_0FA5F6:
    SEC                 ; $0FA5F6   |
    SBC #$0002          ; $0FA5F7   |

CODE_0FA5FA:
    STA $7220,x         ; $0FA5FA   |
    RTS                 ; $0FA5FD   |

CODE_0FA5FE:
    REP #$20            ; $0FA5FE   |
    LDY #$BD00          ; $0FA600   |
    SEP #$70            ; $0FA603   |
    SEC                 ; $0FA605   |
    SBC $608C           ; $0FA606   |
    STA $0E             ; $0FA609   |
    BPL CODE_0FA60F     ; $0FA60B   |
    LDY #$02            ; $0FA60D   |

CODE_0FA60F:
    SEP #$20            ; $0FA60F   |
    RTS                 ; $0FA611   |

DATA_0FA612:         db $F8, $08, $00, $01, $00, $FF, $00, $02
DATA_0FA61A:         db $00, $FE, $00, $01, $00, $FF, $00, $02
DATA_0FA622:         db $00, $FE

CODE_0FA624:
    REP #$20            ; $0FA624   |
    LDY $7D36,x         ; $0FA626   |
    DEY                 ; $0FA629   |
    BPL CODE_0FA62F     ; $0FA62A   |

CODE_0FA62C:
    JMP CODE_0FA6D0     ; $0FA62C   |

CODE_0FA62F:
    LDA $1069           ; $0FA62F   |
    BNE CODE_0FA62C     ; $0FA632   |
    LDA $6F00,y         ; $0FA634   |
    CMP #$0010          ; $0FA637   |
    BNE CODE_0FA62C     ; $0FA63A   |
    LDA $7D38,y         ; $0FA63C   |
    BEQ CODE_0FA62C     ; $0FA63F   |
    LDA $7542,y         ; $0FA641   |
    STA $00             ; $0FA644   |
    LDA $7220,y         ; $0FA646   |
    ASL A               ; $0FA649   |
    SEP #$20            ; $0FA64A   |
    LDY #$00            ; $0FA64C   |
    BCC CODE_0FA651     ; $0FA64E   |
    INY                 ; $0FA650   |

CODE_0FA651:
    LDA #$0B            ; $0FA651   |
    STA $105F           ; $0FA653   |
    STZ $16,x           ; $0FA656   |
    LDA $A612,y         ; $0FA658   |
    STA $1072           ; $0FA65B   |
    ROR A               ; $0FA65E   |
    EOR $6F02,x         ; $0FA65F   |
    BPL CODE_0FA666     ; $0FA662   |
    INY                 ; $0FA664   |
    INY                 ; $0FA665   |

CODE_0FA666:
    LDA $00             ; $0FA666   |
    CMP #$00            ; $0FA668   |
    BNE CODE_0FA675     ; $0FA66A   |
    INY                 ; $0FA66C   |
    INY                 ; $0FA66D   |
    INY                 ; $0FA66E   |
    INY                 ; $0FA66F   |
    LDA #$0A            ; $0FA670   |
    STA $105F           ; $0FA672   |

CODE_0FA675:
    TYA                 ; $0FA675   |
    ASL A               ; $0FA676   |
    TAY                 ; $0FA677   |
    REP #$20            ; $0FA678   |
    LDA $A614,y         ; $0FA67A   |
    STA $7220,x         ; $0FA67D   |
    SEP #$20            ; $0FA680   |
    LDA $7860,x         ; $0FA682   |
    AND #$01            ; $0FA685   |
    BNE CODE_0FA6B5     ; $0FA687   |
    LDY $7D36,x         ; $0FA689   |
    DEY                 ; $0FA68C   |
    REP #$20            ; $0FA68D   |
    LDA $7220,y         ; $0FA68F   |
    STA $7220,x         ; $0FA692   |
    ASL A               ; $0FA695   |
    PHP                 ; $0FA696   |
    PHP                 ; $0FA697   |
    ROR $7220,x         ; $0FA698   |
    PLP                 ; $0FA69B   |
    ROR $7220,x         ; $0FA69C   |
    PLP                 ; $0FA69F   |
    ROR $7220,x         ; $0FA6A0   |
    SEP #$20            ; $0FA6A3   |
    LDA #$00            ; $0FA6A5   |
    STA $7222,x         ; $0FA6A7   |
    LDA #$FE            ; $0FA6AA   |
    STA $7223,x         ; $0FA6AC   |
    LSR $7860,x         ; $0FA6AF   |
    ASL $7860,x         ; $0FA6B2   |

CODE_0FA6B5:
    LDA #$2E            ; $0FA6B5   |\ play sound #$2E
    JSL $0085D2         ; $0FA6B7   |/
    LDA #$20            ; $0FA6BB   |
    STA $1069           ; $0FA6BD   |
    REP #$20            ; $0FA6C0   |
    LDY $7D36,x         ; $0FA6C2   |
    DEY                 ; $0FA6C5   |
    TYX                 ; $0FA6C6   |
    STZ $7D38,x         ; $0FA6C7   |
    JSL $03B24B         ; $0FA6CA   |
    LDX $12             ; $0FA6CE   |

CODE_0FA6D0:
    SEP #$20            ; $0FA6D0   |
    RTS                 ; $0FA6D2   |

DATA_0FA6D3:         dw $4081, $40A1, $6081, $60A1

CODE_0FA6DB:
    REP #$20            ; $0FA6DB   |
    LDA $7402,x         ; $0FA6DD   |
    BNE CODE_0FA71A     ; $0FA6E0   |
    LDA $0030           ; $0FA6E2   |
    AND #$0001          ; $0FA6E5   |
    BNE CODE_0FA703     ; $0FA6E8   |
    LDA $D9,x           ; $0FA6EA   |
    AND #$000F          ; $0FA6EC   |
    ASL A               ; $0FA6EF   |
    STA $02             ; $0FA6F0   |
    LDA #$0040          ; $0FA6F2   |
    STA $00             ; $0FA6F5   |
    LDA $105D           ; $0FA6F7   |
    CLC                 ; $0FA6FA   |
    ADC $1073           ; $0FA6FB   |
    JSR CODE_0FA71D     ; $0FA6FE   |
    BRA CODE_0FA71A     ; $0FA701   |

CODE_0FA703:
    LDA #$0006          ; $0FA703   |
    STA $02             ; $0FA706   |
    LDA #$0060          ; $0FA708   |
    STA $00             ; $0FA70B   |
    LDA $105E           ; $0FA70D   |
    CLC                 ; $0FA710   |
    ADC $1073           ; $0FA711   |
    JSR CODE_0FA71D     ; $0FA714   |
    JSR CODE_0FA75B     ; $0FA717   |

CODE_0FA71A:
    SEP #$20            ; $0FA71A   |
    RTS                 ; $0FA71C   |

CODE_0FA71D:
    LDY $7400,x         ; $0FA71D   |
    BEQ CODE_0FA726     ; $0FA720   |
    EOR #$00FF          ; $0FA722   |
    INC A               ; $0FA725   |

CODE_0FA726:
    AND #$00FF          ; $0FA726   |
    STA $300A           ; $0FA729   |
    LDA $1064           ; $0FA72C   |
    INC A               ; $0FA72F   |
    STA $300C           ; $0FA730   |
    LDY $02             ; $0FA733   |
    LDA $A6D3,y         ; $0FA735   |
    STA $3018           ; $0FA738   |
    LDA #$0055          ; $0FA73B   |
    STA $301A           ; $0FA73E   |
    LDA $00             ; $0FA741   |
    STA $3006           ; $0FA743   |
    LDA #$0000          ; $0FA746   |
    STA $3004           ; $0FA749   |
    LDX #$08            ; $0FA74C   |
    LDA #$8205          ; $0FA74E   |
    JSL $7EDE44         ; $0FA751   | GSU init
    INC $0CF9           ; $0FA755   |
    LDX $12             ; $0FA758   |
    RTS                 ; $0FA75A   |

CODE_0FA75B:
    LDY $1073           ; $0FA75B   |
    TYA                 ; $0FA75E   |
    CLC                 ; $0FA75F   |
    ADC $105D           ; $0FA760   |
    LDY $7400,x         ; $0FA763   |
    BEQ CODE_0FA76C     ; $0FA766   |
    EOR #$00FF          ; $0FA768   |
    INC A               ; $0FA76B   |

CODE_0FA76C:
    AND #$00FF          ; $0FA76C   |
    STA $300A           ; $0FA76F   |
    LDA $1064           ; $0FA772   |
    INC A               ; $0FA775   |
    STA $300C           ; $0FA776   |
    LDY $02             ; $0FA779   |
    LDA #$00C1          ; $0FA77B   |
    STA $3018           ; $0FA77E   |
    LDA #$0055          ; $0FA781   |
    STA $301A           ; $0FA784   |
    LDA #$0000          ; $0FA787   |
    STA $3006           ; $0FA78A   |
    STA $3004           ; $0FA78D   |
    LDX #$08            ; $0FA790   |
    LDA #$881C          ; $0FA792   |
    JSL $7EDE44         ; $0FA795   | GSU init
    INC $0CF9           ; $0FA799   |
    LDX $12             ; $0FA79C   |
    RTS                 ; $0FA79E   |

DATA_0FA79F:         db $B0, $98, $05, $F7, $B0, $98, $09, $F5
DATA_0FA7A7:         db $B0, $98, $0A, $F2, $B0, $98, $0D, $EF
DATA_0FA7AF:         db $B0, $98, $0F, $EC, $B0, $98, $11, $E9
DATA_0FA7B7:         db $B0, $98, $17, $E9, $B1, $98, $18, $E8
DATA_0FA7BF:         db $B0, $98, $17, $E9, $B0, $98, $17, $EE
DATA_0FA7C7:         db $B0, $98, $F0, $14, $B0, $98, $12, $F4
DATA_0FA7CF:         db $B0, $98, $10, $F7, $B0, $98, $0C, $F9
DATA_0FA7D7:         db $B0, $98, $05, $F8, $B0, $98, $06, $F6
DATA_0FA7DF:         db $B0, $98, $06, $F9, $B0, $98, $09, $FD
DATA_0FA7E7:         db $B0, $98, $DF, $D7, $B0, $98, $DF, $D7
DATA_0FA7EF:         db $B0, $98, $E6, $DB, $B0, $98, $F0, $E2
DATA_0FA7F7:         db $B0, $98, $FB, $EE, $B0, $98, $12, $FB
DATA_0FA7FF:         db $B0, $98, $1C, $FB, $B0, $98, $29, $03
DATA_0FA807:         db $B0, $98, $29, $02, $B0, $98, $06, $EC
DATA_0FA80F:         db $B0, $98, $03, $E0, $B0, $98, $02, $D9
DATA_0FA817:         db $B0, $98, $FD, $D6, $AC, $98, $10, $F0
DATA_0FA81F:         db $A0, $98, $17, $E9

DATA_0FA823:         db $17, $0A, $19, $1A, $17, $0A, $1D, $18
DATA_0FA82B:         db $17, $0A, $1F, $1A, $17, $0A, $20, $19
DATA_0FA833:         db $17, $0A, $22, $1B, $17, $0A, $20, $1C
DATA_0FA83B:         db $17, $0A, $1F, $1F, $17, $0A, $1E, $1E
DATA_0FA843:         db $17, $0A, $1E, $1E, $17, $0A, $1C, $20
DATA_0FA84B:         db $17, $0A, $21, $1B, $17, $0A, $19, $20
DATA_0FA853:         db $17, $0A, $19, $20, $17, $0A, $1A, $1E
DATA_0FA85B:         db $17, $0A, $19, $1A, $17, $0A, $17, $18
DATA_0FA863:         db $17, $0A, $20, $20, $17, $0A, $24, $25
DATA_0FA86B:         db $17, $0A, $13, $1A, $17, $0A, $13, $1A
DATA_0FA873:         db $17, $0A, $14, $1A, $17, $0A, $16, $1A
DATA_0FA87B:         db $17, $0A, $19, $1B, $17, $0A, $1D, $1E
DATA_0FA883:         db $17, $0A, $1C, $23, $17, $0A, $20, $26
DATA_0FA88B:         db $17, $0A, $1E, $25, $17, $0A, $1F, $1D
DATA_0FA893:         db $17, $0A, $23, $1E, $17, $0A, $25, $1B
DATA_0FA89B:         db $17, $0A, $26, $1F, $13, $0A, $1C, $1C
DATA_0FA8A3:         db $0C, $0A, $1E, $1E

DATA_0FA8A7:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA8AF:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA8B7:         db $03, $06, $1A, $1A, $1C, $1D, $1F, $02
DATA_0FA8BF:         db $05, $09, $08, $03, $06, $08, $07, $00
DATA_0FA8C7:         db $00

DATA_0FA8C8:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA8D0:         db $00, $00, $00, $00, $00, $00, $00, $00
DATA_0FA8D8:         db $00, $00, $01, $02, $02, $02, $02, $02
DATA_0FA8E0:         db $02, $02, $02, $02, $02, $02, $02, $00
DATA_0FA8E8:         db $00

CODE_0FA8E9:
    LDA $7402,x         ; $0FA8E9   |
    BEQ CODE_0FA8EF     ; $0FA8EC   |

CODE_0FA8EE:
    RTS                 ; $0FA8EE   |

CODE_0FA8EF:
    LDA $7363,x         ; $0FA8EF   |
    BMI CODE_0FA8EE     ; $0FA8F2   |
    LDY $1063           ; $0FA8F4   |
    LDA $A8C8,y         ; $0FA8F7   |
    STA $D9,x           ; $0FA8FA   |
    LDA $A8A7,y         ; $0FA8FC   |
    ASL A               ; $0FA8FF   |
    ASL A               ; $0FA900   |
    ASL A               ; $0FA901   |
    LDY $7400,x         ; $0FA902   |
    BEQ CODE_0FA90A     ; $0FA905   |
    EOR #$FF            ; $0FA907   |
    INC A               ; $0FA909   |

CODE_0FA90A:
    CLC                 ; $0FA90A   |
    ADC $105D           ; $0FA90B   |
    STA $105E           ; $0FA90E   |
    LDA #$03            ; $0FA911   |
    STA $0A             ; $0FA913   |

CODE_0FA915:
    LDA $1063           ; $0FA915   |
    ASL A               ; $0FA918   |
    ASL A               ; $0FA919   |
    CLC                 ; $0FA91A   |
    ADC $0A             ; $0FA91B   |
    TAY                 ; $0FA91D   |
    LDA $A823,y         ; $0FA91E   |
    STA $4202           ; $0FA921   |
    PHX                 ; $0FA924   |
    LDX $1064           ; $0FA925   |
    INX                 ; $0FA928   |
    STX $4203           ; $0FA929   |
    BEQ CODE_0FA938     ; $0FA92C   |
    NOP                 ; $0FA92E   |
    NOP                 ; $0FA92F   |
    LDA $4217           ; $0FA930   |
    ASL $4216           ; $0FA933   |
    ADC #$00            ; $0FA936   |

CODE_0FA938:
    STA $0E             ; $0FA938   |
    PLX                 ; $0FA93A   |
    LDA $A79F,y         ; $0FA93B   |
    LDY $7400,x         ; $0FA93E   |
    BEQ CODE_0FA946     ; $0FA941   |
    EOR #$FF            ; $0FA943   |
    INC A               ; $0FA945   |

CODE_0FA946:
    STA $00             ; $0FA946   |
    JSR CODE_0FA9BD     ; $0FA948   |
    DEC $0A             ; $0FA94B   |
    BPL CODE_0FA915     ; $0FA94D   |
    LDY $1063           ; $0FA94F   |
    LDA $A99C,y         ; $0FA952   |
    CLC                 ; $0FA955   |
    ADC #$00            ; $0FA956   |
    PHA                 ; $0FA958   |
    BPL CODE_0FA95E     ; $0FA959   |
    EOR #$FF            ; $0FA95B   |
    INC A               ; $0FA95D   |

CODE_0FA95E:
    STA $0E             ; $0FA95E   |
    LDA $105D           ; $0FA960   |
    CLC                 ; $0FA963   |
    ADC #$80            ; $0FA964   |
    STA $0C             ; $0FA966   |
    JSR CODE_0FB91A     ; $0FA968   |
    PLY                 ; $0FA96B   |
    REP #$20            ; $0FA96C   |
    LDA $02             ; $0FA96E   |
    CPY #$00            ; $0FA970   |
    BPL CODE_0FA978     ; $0FA972   |
    EOR #$FFFF          ; $0FA974   |
    INC A               ; $0FA977   |

CODE_0FA978:
    STA $3002           ; $0FA978   |
    LDA $00             ; $0FA97B   |
    CPY #$00            ; $0FA97D   |
    BPL CODE_0FA985     ; $0FA97F   |
    EOR #$FFFF          ; $0FA981   |
    INC A               ; $0FA984   |

CODE_0FA985:
    STA $3004           ; $0FA985   |
    LDA $7362,x         ; $0FA988   |
    STA $3006           ; $0FA98B   |
    LDX #$09            ; $0FA98E   |
    LDA #$A02A          ; $0FA990   |
    JSL $7EDE44         ; $0FA993   | GSU init
    SEP #$20            ; $0FA997   |
    LDX $12             ; $0FA999   |
    RTS                 ; $0FA99B   |

DATA_0FA99C:         db $00, $03, $05, $05, $07, $04, $01, $00
DATA_0FA9A4:         db $00, $04, $06, $06, $06, $05, $00, $FE
DATA_0FA9AC:         db $02, $04, $00, $00, $00, $00, $00, $06
DATA_0FA9B4:         db $0E, $0F, $0E, $06, $0E, $0F, $0E, $00
DATA_0FA9BC:         db $00

CODE_0FA9BD:
    LDA $105D           ; $0FA9BD   |
    CLC                 ; $0FA9C0   |
    ADC $1073           ; $0FA9C1   |
    CLC                 ; $0FA9C4   |
    ADC $00             ; $0FA9C5   |
    STA $0C             ; $0FA9C7   |
    LSR A               ; $0FA9C9   |
    LSR A               ; $0FA9CA   |
    LSR A               ; $0FA9CB   |
    LSR A               ; $0FA9CC   |
    LSR A               ; $0FA9CD   |
    AND #$06            ; $0FA9CE   |
    TAX                 ; $0FA9D0   |
    JMP ($A9D4,x)       ; $0FA9D1   |

DATA_0FA9D4:         dw $A9DC
DATA_0FA9D6:         dw $AA22
DATA_0FA9D8:         dw $AA6B
DATA_0FA9DA:         dw $AAB7

    LDA $0C             ; $0FA9DC   |
    AND #$3F            ; $0FA9DE   |
    TAY                 ; $0FA9E0   |
    LDA $BA89,y         ; $0FA9E1   |
    STA $4202           ; $0FA9E4   |
    LDA $0E             ; $0FA9E7   |
    STA $4203           ; $0FA9E9   |
    NOP                 ; $0FA9EC   |
    NOP                 ; $0FA9ED   |
    NOP                 ; $0FA9EE   |
    NOP                 ; $0FA9EF   |
    LDA $4217           ; $0FA9F0   |
    ASL $4216           ; $0FA9F3   |
    ADC #$00            ; $0FA9F6   |
    STA $00             ; $0FA9F8   |
    LDA $0C             ; $0FA9FA   |
    AND #$3F            ; $0FA9FC   |
    STA $0F             ; $0FA9FE   |
    LDA #$40            ; $0FAA00   |
    SEC                 ; $0FAA02   |
    SBC $0F             ; $0FAA03   |
    TAY                 ; $0FAA05   |
    LDA $BA89,y         ; $0FAA06   |
    STA $4202           ; $0FAA09   |
    LDA $0E             ; $0FAA0C   |
    STA $4203           ; $0FAA0E   |
    NOP                 ; $0FAA11   |
    NOP                 ; $0FAA12   |
    NOP                 ; $0FAA13   |
    NOP                 ; $0FAA14   |
    LDA $4217           ; $0FAA15   |
    ASL $4216           ; $0FAA18   |
    ADC #$00            ; $0FAA1B   |
    STA $02             ; $0FAA1D   |
    JMP CODE_0FAB04     ; $0FAA1F   |

    LDA $0C             ; $0FAA22   |
    AND #$3F            ; $0FAA24   |
    TAY                 ; $0FAA26   |
    LDA $BA89,y         ; $0FAA27   |
    STA $4202           ; $0FAA2A   |
    LDA $0E             ; $0FAA2D   |
    STA $4203           ; $0FAA2F   |
    NOP                 ; $0FAA32   |
    NOP                 ; $0FAA33   |
    NOP                 ; $0FAA34   |
    NOP                 ; $0FAA35   |
    LDA $4217           ; $0FAA36   |
    ASL $4216           ; $0FAA39   |
    ADC #$00            ; $0FAA3C   |
    STA $02             ; $0FAA3E   |
    LDA $0C             ; $0FAA40   |
    AND #$3F            ; $0FAA42   |
    STA $0F             ; $0FAA44   |
    LDA #$40            ; $0FAA46   |
    SEC                 ; $0FAA48   |
    SBC $0F             ; $0FAA49   |
    TAY                 ; $0FAA4B   |
    LDA $BA89,y         ; $0FAA4C   |
    STA $4202           ; $0FAA4F   |
    LDA $0E             ; $0FAA52   |
    STA $4203           ; $0FAA54   |
    NOP                 ; $0FAA57   |
    NOP                 ; $0FAA58   |
    NOP                 ; $0FAA59   |
    NOP                 ; $0FAA5A   |
    LDA $4217           ; $0FAA5B   |
    ASL $4216           ; $0FAA5E   |
    ADC #$00            ; $0FAA61   |
    EOR #$FF            ; $0FAA63   |
    INC A               ; $0FAA65   |
    STA $00             ; $0FAA66   |
    JMP CODE_0FAB04     ; $0FAA68   |

    LDA $0C             ; $0FAA6B   |
    AND #$3F            ; $0FAA6D   |
    TAY                 ; $0FAA6F   |
    LDA $BA89,y         ; $0FAA70   |
    STA $4202           ; $0FAA73   |
    LDA $0E             ; $0FAA76   |
    STA $4203           ; $0FAA78   |
    NOP                 ; $0FAA7B   |
    NOP                 ; $0FAA7C   |
    NOP                 ; $0FAA7D   |
    NOP                 ; $0FAA7E   |
    LDA $4217           ; $0FAA7F   |
    ASL $4216           ; $0FAA82   |
    ADC #$00            ; $0FAA85   |
    EOR #$FF            ; $0FAA87   |
    INC A               ; $0FAA89   |
    STA $00             ; $0FAA8A   |
    LDA $0C             ; $0FAA8C   |
    AND #$3F            ; $0FAA8E   |
    STA $0F             ; $0FAA90   |
    LDA #$40            ; $0FAA92   |
    SEC                 ; $0FAA94   |
    SBC $0F             ; $0FAA95   |
    TAY                 ; $0FAA97   |
    LDA $BA89,y         ; $0FAA98   |
    STA $4202           ; $0FAA9B   |
    LDA $0E             ; $0FAA9E   |
    STA $4203           ; $0FAAA0   |
    NOP                 ; $0FAAA3   |
    NOP                 ; $0FAAA4   |
    NOP                 ; $0FAAA5   |
    NOP                 ; $0FAAA6   |
    LDA $4217           ; $0FAAA7   |
    ASL $4216           ; $0FAAAA   |
    ADC #$00            ; $0FAAAD   |
    EOR #$FF            ; $0FAAAF   |
    INC A               ; $0FAAB1   |
    STA $02             ; $0FAAB2   |
    JMP CODE_0FAB04     ; $0FAAB4   |

    LDA $0C             ; $0FAAB7   |
    AND #$3F            ; $0FAAB9   |
    TAY                 ; $0FAABB   |
    LDA $BA89,y         ; $0FAABC   |
    STA $4202           ; $0FAABF   |
    LDA $0E             ; $0FAAC2   |
    STA $4203           ; $0FAAC4   |
    NOP                 ; $0FAAC7   |
    NOP                 ; $0FAAC8   |
    NOP                 ; $0FAAC9   |
    NOP                 ; $0FAACA   |
    LDA $4217           ; $0FAACB   |
    ASL $4216           ; $0FAACE   |
    ADC #$00            ; $0FAAD1   |
    EOR #$FF            ; $0FAAD3   |
    INC A               ; $0FAAD5   |
    STA $02             ; $0FAAD6   |
    LDA $0C             ; $0FAAD8   |
    AND #$3F            ; $0FAADA   |
    STA $0F             ; $0FAADC   |
    LDA #$40            ; $0FAADE   |
    SEC                 ; $0FAAE0   |
    SBC $0F             ; $0FAAE1   |
    TAY                 ; $0FAAE3   |
    LDA $BA89,y         ; $0FAAE4   |
    STA $4202           ; $0FAAE7   |
    LDA $0E             ; $0FAAEA   |
    STA $4203           ; $0FAAEC   |
    NOP                 ; $0FAAEF   |
    NOP                 ; $0FAAF0   |
    NOP                 ; $0FAAF1   |
    NOP                 ; $0FAAF2   |
    LDA $4217           ; $0FAAF3   |
    ASL $4216           ; $0FAAF6   |
    ADC #$00            ; $0FAAF9   |
    STA $00             ; $0FAAFB   |
    JMP CODE_0FAB04     ; $0FAAFD   |

DATA_0FAB00:         db $00, $48, $08, $28

CODE_0FAB04:
    LDX $12             ; $0FAB04   |
    STZ $01             ; $0FAB06   |
    LDA $00             ; $0FAB08   |
    BPL CODE_0FAB0E     ; $0FAB0A   |
    DEC $01             ; $0FAB0C   |

CODE_0FAB0E:
    STZ $03             ; $0FAB0E   |
    LDA $02             ; $0FAB10   |
    BPL CODE_0FAB16     ; $0FAB12   |
    DEC $03             ; $0FAB14   |

CODE_0FAB16:
    STZ $0B             ; $0FAB16   |
    LDA $0A             ; $0FAB18   |
    REP #$30            ; $0FAB1A   |
    AND #$000F          ; $0FAB1C   |
    TAY                 ; $0FAB1F   |
    CPY #$0001          ; $0FAB20   |
    BCC CODE_0FAB54     ; $0FAB23   |
    LDA $7400,x         ; $0FAB25   |
    AND #$00FF          ; $0FAB28   |
    BEQ CODE_0FAB54     ; $0FAB2B   |
    LDA $AB00,y         ; $0FAB2D   |
    AND #$00FF          ; $0FAB30   |
    CLC                 ; $0FAB33   |
    ADC $7362,x         ; $0FAB34   |
    TAY                 ; $0FAB37   |
    LDA $6000,y         ; $0FAB38   |
    CLC                 ; $0FAB3B   |
    ADC $02             ; $0FAB3C   |
    CLC                 ; $0FAB3E   |
    ADC #$0000          ; $0FAB3F   |
    STA $6000,y         ; $0FAB42   |
    STA $6010,y         ; $0FAB45   |
    CLC                 ; $0FAB48   |
    ADC #$FFF0          ; $0FAB49   |
    STA $6008,y         ; $0FAB4C   |
    STA $6018,y         ; $0FAB4F   |
    BRA CODE_0FAB79     ; $0FAB52   |

CODE_0FAB54:
    LDA $AB00,y         ; $0FAB54   |
    AND #$00FF          ; $0FAB57   |
    CLC                 ; $0FAB5A   |
    ADC $7362,x         ; $0FAB5B   |
    TAY                 ; $0FAB5E   |
    LDA $6000,y         ; $0FAB5F   |
    CLC                 ; $0FAB62   |
    ADC $02             ; $0FAB63   |
    STA $6000,y         ; $0FAB65   |
    LDX $0A             ; $0FAB68   |
    BEQ CODE_0FAB79     ; $0FAB6A   |
    STA $6010,y         ; $0FAB6C   |
    CLC                 ; $0FAB6F   |
    ADC #$0010          ; $0FAB70   |
    STA $6008,y         ; $0FAB73   |
    STA $6018,y         ; $0FAB76   |

CODE_0FAB79:
    LDA $6002,y         ; $0FAB79   |
    CLC                 ; $0FAB7C   |
    ADC $00             ; $0FAB7D   |
    STA $6002,y         ; $0FAB7F   |
    LDX $0A             ; $0FAB82   |
    BEQ CODE_0FAB93     ; $0FAB84   |
    STA $600A,y         ; $0FAB86   |
    CLC                 ; $0FAB89   |
    ADC #$0010          ; $0FAB8A   |
    STA $6012,y         ; $0FAB8D   |
    STA $601A,y         ; $0FAB90   |

CODE_0FAB93:
    LDA $12             ; $0FAB93   |
    AND #$00FF          ; $0FAB95   |
    TAX                 ; $0FAB98   |
    LDY $7362,x         ; $0FAB99   |
    LDA $1064           ; $0FAB9C   |
    AND #$00FF          ; $0FAB9F   |
    SEC                 ; $0FABA2   |
    SBC #$0050          ; $0FABA3   |
    LSR A               ; $0FABA6   |
    LSR A               ; $0FABA7   |
    LSR A               ; $0FABA8   |
    LSR A               ; $0FABA9   |
    ASL A               ; $0FABAA   |
    TAX                 ; $0FABAB   |
    LDA $6004,y         ; $0FABAC   |
    AND #$FF00          ; $0FABAF   |
    ORA $ABBD,x         ; $0FABB2   |
    STA $6004,y         ; $0FABB5   |
    SEP #$30            ; $0FABB8   |
    LDX $12             ; $0FABBA   |
    RTS                 ; $0FABBC   |

DATA_0FABBD:         dw $0008, $0008, $0008, $0008
DATA_0FABC5:         dw $000A, $000A, $000A, $000A
DATA_0FABCD:         dw $000C, $000C, $000E, $20C2
DATA_0FABD5:         dw $10E2

.init_raph_spark
    RTL                 ; $0FABD7   |

; table
DATA_0FABD8:         db $03, $00, $FD, $FF

; table
DATA_0FABDC:         db $00, $00, $00, $00
DATA_0FABE0:         db $04, $04, $04, $04
DATA_0FABE4:         db $FF

.main_raph_spark
    JSL $03AF23         ; $0FABE5   |
    SEP #$20            ; $0FABE9   |
    LDA #$47            ; $0FABEB   |
    STA $000051         ; $0FABED   |
    LDA $7A38,x         ; $0FABF1   |
    BEQ CODE_0FAC0F     ; $0FABF4   |
    LDY $7900,x         ; $0FABF6   |
    INC $7900,x         ; $0FABF9   |
    LDA $ABDC,y         ; $0FABFC   | \
    BMI CODE_0FAC52     ; $0FABFF   |  | animation frame table
    STA $7402,x         ; $0FAC01   | /  die when < $00 reached
    LDA $7040,x         ; $0FAC04   |
    AND #$FC            ; $0FAC07   |
    STA $7040,x         ; $0FAC09   |
    REP #$20            ; $0FAC0C   |
    RTL                 ; $0FAC0E   |

CODE_0FAC0F:
    LDY $7400,x         ; $0FAC0F   |
    LDA $79D6,x         ; $0FAC12   |
    CLC                 ; $0FAC15   |
    ADC $ABD8,y         ; $0FAC16   |
    STA $79D6,x         ; $0FAC19   |
    CLC                 ; $0FAC1C   |
    ADC $7978,x         ; $0FAC1D   |
    STA $00             ; $0FAC20   |
    LDA #$38            ; $0FAC22   |
    STA $0E             ; $0FAC24   |
    JSR CODE_0FB8F8     ; $0FAC26   |
    LDA $0030           ; $0FAC29   |
    AND #$03            ; $0FAC2C   |
    CLC                 ; $0FAC2E   |
    ADC $79D8,x         ; $0FAC2F   |
    STA $7402,x         ; $0FAC32   |
    LDA $0030           ; $0FAC35   |
    AND #$00            ; $0FAC38   |
    BNE CODE_0FAC4C     ; $0FAC3A   |
    LDA $7A36,x         ; $0FAC3C   |
    CLC                 ; $0FAC3F   |
    ADC #$01            ; $0FAC40   |
    STA $7A36,x         ; $0FAC42   |
    CMP #$80            ; $0FAC45   |
    BCC CODE_0FAC4C     ; $0FAC47   |
    INC $7A38,x         ; $0FAC49   |

CODE_0FAC4C:
    JSR CODE_0FB243     ; $0FAC4C   |
    REP #$20            ; $0FAC4F   |
    RTL                 ; $0FAC51   |

CODE_0FAC52:
    REP #$20            ; $0FAC52   |
    JSL $03A31E         ; $0FAC54   | kill
    RTL                 ; $0FAC58   |

; data table
DATA_0FAC59:         db $F8, $FF, $08, $00

; data table
DATA_0FAC5D:         db $F0, $FF, $10, $00

raphael_spawn_sparks:

CODE_0FAC61:
    SEP #$20            ; $0FAC61   |
    LDA $1062           ; $0FAC63   |
    PHA                 ; $0FAC66   |
    REP #$20            ; $0FAC67   |
    LDA #$0047          ; $0FAC69   |\ play sound #$0047
    JSL $0085D2         ; $0FAC6C   |/
    LDA #$0018          ; $0FAC70   |
    STA $61C6           ; $0FAC73   |
    SEP #$20            ; $0FAC76   |
    STZ $1062           ; $0FAC78   |
    JSR CODE_0FAC8B     ; $0FAC7B   |
    LDA #$02            ; $0FAC7E   |
    STA $1062           ; $0FAC80   |
    JSR CODE_0FAC8B     ; $0FAC83   |
    PLA                 ; $0FAC86   |
    STA $1062           ; $0FAC87   |
    RTS                 ; $0FAC8A   |

raphael_spawn_spark:

CODE_0FAC8B:
    REP #$20            ; $0FAC8B   |
    LDA #$005A          ; $0FAC8D   | sprite ID $5A: spark
    JSL $03A364         ; $0FAC90   | spawn
    SEP #$20            ; $0FAC94   |
    BCC CODE_0FACAE     ; $0FAC96   |
    LDA $105D           ; $0FAC98   |
    STA $7978,y         ; $0FAC9B   |
    LDA $1062           ; $0FAC9E   |
    STA $7400,y         ; $0FACA1   |
    LDA #$00            ; $0FACA4   |
    STA $79D8,y         ; $0FACA6   |
    LDA #$05            ; $0FACA9   |
    STA $74A2,y         ; $0FACAB   |

CODE_0FACAE:
    REP #$20            ; $0FACAE   |
    LDA #$005A          ; $0FACB0   | sprite ID $5A: spark
    JSL $03A364         ; $0FACB3   | spawn
    SEP #$20            ; $0FACB7   |
    BCC CODE_0FACE5     ; $0FACB9   |
    LDX $1062           ; $0FACBB   |
    TXA                 ; $0FACBE   |
    STA $7400,y         ; $0FACBF   |
    LDA $105D           ; $0FACC2   |
    CLC                 ; $0FACC5   |
    ADC $AC59,x         ; $0FACC6   | table
    STA $7978,y         ; $0FACC9   |
    LDA #$00            ; $0FACCC   |
    STA $79D8,y         ; $0FACCE   |
    LDA $7040,y         ; $0FACD1   |
    AND #$FC            ; $0FACD4   |
    STA $7040,y         ; $0FACD6   |
    LDA #$06            ; $0FACD9   |
    STA $74A2,y         ; $0FACDB   |
    LDA #$04            ; $0FACDE   |
    STA $7900,y         ; $0FACE0   |
    LDX $12             ; $0FACE3   |

CODE_0FACE5:
    REP #$20            ; $0FACE5   |
    LDA #$005A          ; $0FACE7   | sprite ID $5A: spark
    JSL $03A364         ; $0FACEA   | spawn
    SEP #$20            ; $0FACEE   |
    BCC CODE_0FAD1C     ; $0FACF0   |
    LDX $1062           ; $0FACF2   |
    TXA                 ; $0FACF5   |
    STA $7400,y         ; $0FACF6   |
    LDA $105D           ; $0FACF9   |
    CLC                 ; $0FACFC   |
    ADC $AC5D,x         ; $0FACFD   | table
    STA $7978,y         ; $0FAD00   |
    LDA #$04            ; $0FAD03   |
    STA $79D8,y         ; $0FAD05   |
    LDA $7040,y         ; $0FAD08   |
    AND #$FC            ; $0FAD0B   |
    STA $7040,y         ; $0FAD0D   |
    LDA #$07            ; $0FAD10   |
    STA $74A2,y         ; $0FAD12   |
    LDA #$06            ; $0FAD15   |
    STA $7900,y         ; $0FAD17   |
    LDX $12             ; $0FAD1A   |

CODE_0FAD1C:
    SEP #$20            ; $0FAD1C   |
    RTS                 ; $0FAD1E   |

.init_raphael:
    JSR CODE_0FB0B6     ; $0FAD1F   |
    RTL                 ; $0FAD22   |

DATA_0FAD23:         dw $0081, $00C1

.main_raphael:
    LDA $0146           ; $0FAD27   |
    CMP #$0009          ; $0FAD2A   |
    BNE CODE_0FAD33     ; $0FAD2D   |
    JSL $01B403         ; $0FAD2F   |

CODE_0FAD33:
    LDA $7402,x         ; $0FAD33   |
    BEQ CODE_0FAD4A     ; $0FAD36   |
    LDA $7040,x         ; $0FAD38   |
    AND #$07FF          ; $0FAD3B   |
    ORA #$2000          ; $0FAD3E   |
    STA $7040,x         ; $0FAD41   |
    JSL $03AA52         ; $0FAD44   |
    BRA CODE_0FAD4E     ; $0FAD48   |

CODE_0FAD4A:
    JSL $03AB1C         ; $0FAD4A   |

CODE_0FAD4E:
    LDA $7402,x         ; $0FAD4E   |
    BNE CODE_0FADA9     ; $0FAD51   |
    LDA $105E           ; $0FAD53   |
    LDY $7400,x         ; $0FAD56   |
    BEQ CODE_0FAD5F     ; $0FAD59   |
    EOR #$00FF          ; $0FAD5B   |
    INC A               ; $0FAD5E   |

CODE_0FAD5F:
    AND #$00FF          ; $0FAD5F   |
    STA $300A           ; $0FAD62   |
    LDA $1064           ; $0FAD65   |
    AND #$00FF          ; $0FAD68   |
    INC A               ; $0FAD6B   |
    STA $300C           ; $0FAD6C   |
    LDA $1065           ; $0FAD6F   |
    AND #$00FF          ; $0FAD72   |
    INC A               ; $0FAD75   |
    STA $3016           ; $0FAD76   |
    LDY #$00            ; $0FAD79   |
    LDA $AD23,y         ; $0FAD7B   | table
    STA $3018           ; $0FAD7E   |
    LDA #$0055          ; $0FAD81   |
    STA $301A           ; $0FAD84   |
    LDY $7722,x         ; $0FAD87   |
    TYX                 ; $0FAD8A   |
    LDA $03A9CE,x       ; $0FAD8B   |
    STA $3006           ; $0FAD8F   |
    LDA $03A9EE,x       ; $0FAD92   |
    STA $3004           ; $0FAD96   |
    LDX #$08            ; $0FAD99   |
    LDA #$8B49          ; $0FAD9B   |
    JSL $7EDE44         ; $0FAD9E   | GSU init
    INC $0CF9           ; $0FADA2   |
    LDX $12             ; $0FADA5   |
    BRA CODE_0FADAC     ; $0FADA7   |

CODE_0FADA9:
    JSR CODE_0FADC4     ; $0FADA9   |

CODE_0FADAC:
    JSL $03AF23         ; $0FADAC   |
    LDA $0146           ; $0FADB0   |
    CMP #$0009          ; $0FADB3   |
    BNE CODE_0FADBC     ; $0FADB6   |
    JSR CODE_0FB14B     ; $0FADB8   |
    RTL                 ; $0FADBB   |

CODE_0FADBC:
    JSR CODE_0FAE12     ; $0FADBC   |
    RTL                 ; $0FADBF   |

DATA_0FADC0:         dw $4080, $40A0

raphael sub

CODE_0FADC4:
    LDA $105E           ; $0FADC4   |
    AND #$00FF          ; $0FADC7   |
    STA $300A           ; $0FADCA   |
    LDA #$0100          ; $0FADCD   |
    STA $300C           ; $0FADD0   |
    LDA #$0000          ; $0FADD3   |
    STA $3010           ; $0FADD6   |
    STA $3012           ; $0FADD9   |
    LDA $106E           ; $0FADDC   |
    LSR A               ; $0FADDF   |
    LSR A               ; $0FADE0   |
    AND #$0002          ; $0FADE1   |
    TAY                 ; $0FADE4   |
    LDA $ADC0,y         ; $0FADE5   | table
    STA $3018           ; $0FADE8   |
    LDA #$0055          ; $0FADEB   |
    STA $301A           ; $0FADEE   |
    LDY $7722,x         ; $0FADF1   |
    TYX                 ; $0FADF4   |
    LDA $03A9EE,x       ; $0FADF5   |
    STA $3004           ; $0FADF9   |
    LDA $03A9CE,x       ; $0FADFC   |
    STA $3006           ; $0FAE00   |
    LDX #$08            ; $0FAE03   |
    LDA #$8205          ; $0FAE05   |
    JSL $7EDE44         ; $0FAE08   | GSU init
    INC $0CF9           ; $0FAE0C   |
    LDX $12             ; $0FAE0F   |
    RTS                 ; $0FAE11   |

; raphael sub

CODE_0FAE12:
    LDA $1015           ; $0FAE12   |
    BMI CODE_0FAE19     ; $0FAE15   |
    BNE CODE_0FAE21     ; $0FAE17   |

CODE_0FAE19:
    LDA $18,x           ; $0FAE19   |
    ASL A               ; $0FAE1B   |
    TXY                 ; $0FAE1C   |
    TAX                 ; $0FAE1D   |
    JMP ($AE54,x)       ; $0FAE1E   |-- init state table

CODE_0FAE21:
    LDA #$0040          ; $0FAE21   |
    STA $7A96,x         ; $0FAE24   |
    LDA $1070           ; $0FAE27   |
    BNE CODE_0FAE4C     ; $0FAE2A   |
    LDY #$5C            ; $0FAE2C   |

CODE_0FAE2E:
    LDA $7360,y         ; $0FAE2E   |
    CMP #$0048          ; $0FAE31   |
    BNE CODE_0FAE4D     ; $0FAE34   |
    LDA $6F00,y         ; $0FAE36   |
    BEQ CODE_0FAE4D     ; $0FAE39   |
    LDA $7A98,y         ; $0FAE3B   |
    CMP #$0030          ; $0FAE3E   |
    BCC CODE_0FAE4C     ; $0FAE41   |
    LDA #$0002          ; $0FAE43   |
    STA $7A98,y         ; $0FAE46   |
    STA $1070           ; $0FAE49   |

CODE_0FAE4C:
    RTS                 ; $0FAE4C   |

CODE_0FAE4D:
    DEY                 ; $0FAE4D   |
    DEY                 ; $0FAE4E   |
    DEY                 ; $0FAE4F   |
    DEY                 ; $0FAE50   |
    BPL CODE_0FAE2E     ; $0FAE51   |
    RTS                 ; $0FAE53   |

.raphael_init_ptr
DATA_0FAE54:         dw $AE68   ; 00: walking down the right wall
DATA_0FAE56:         dw $AE88   ; 01: rotating at the corner
DATA_0FAE58:         dw $AEA1   ; 02: walking left toward yoshi
DATA_0FAE5A:         dw $AECB   ; 03: pausing a bit
DATA_0FAE5C:         dw $AEF3   ; 04: waiting on kamek
DATA_0FAE5E:         dw $AF24   ; 05: trembling, about to grow
DATA_0FAE60:         dw $AF75   ; 06: growing and doing a flip
DATA_0FAE62:         dw $AFCF   ; 07: stomping on ground
DATA_0FAE64:         dw $B005   ; 08: lunging at yoshi
DATA_0FAE66:         dw $B0B4   ; 09: stop, waiting for yoshi to fly offscreen

; state 00
; raphael_init_walk_down:
    TYX                 ; $0FAE68   |
    INC $106E           ; $0FAE69   |
    INC $106E           ; $0FAE6C   |
    LDA $7A96,x         ; $0FAE6F   |
    BNE CODE_0FAE87     ; $0FAE72   |
    LDA #$0200          ; $0FAE74   |
    STA $7222,x         ; $0FAE77   |
    LDA $7182,x         ; $0FAE7A   |
    CMP #$048E          ; $0FAE7D   |
    BCC CODE_0FAE87     ; $0FAE80   |
    INC $18,x           ; $0FAE82   |
    STZ $7222,x         ; $0FAE84   |

CODE_0FAE87:
    RTS                 ; $0FAE87   |

; state 01
raphael_init_corner:
    TYX                 ; $0FAE88   |
    SEP #$20            ; $0FAE89   |
    INC $106E           ; $0FAE8B   |
    INC $106E           ; $0FAE8E   |
    LDA $105E           ; $0FAE91   |
    SEC                 ; $0FAE94   |
    SBC #$08            ; $0FAE95   |
    STA $105E           ; $0FAE97   |
    BNE CODE_0FAE9E     ; $0FAE9A   |
    INC $18,x           ; $0FAE9C   |

CODE_0FAE9E:
    REP #$20            ; $0FAE9E   |
    RTS                 ; $0FAEA0   |

; state 02
raphael_init_walk_left:
    TYX                 ; $0FAEA1   |
    INC $106E           ; $0FAEA2   |
    INC $106E           ; $0FAEA5   |
    LDA #$FE00          ; $0FAEA8   |
    STA $7220,x         ; $0FAEAB   |
    LDA $70E2,x         ; $0FAEAE   |
    AND #$00FF          ; $0FAEB1   |
    CMP #$00A0          ; $0FAEB4   |
    BCS CODE_0FAECA     ; $0FAEB7   |
    LDA #$00FF          ; $0FAEB9   |
    STA $106E           ; $0FAEBC   |
    INC $18,x           ; $0FAEBF   |
    STZ $7220,x         ; $0FAEC1   |
    LDA #$0040          ; $0FAEC4   |
    STA $7A96,x         ; $0FAEC7   |

CODE_0FAECA:
    RTS                 ; $0FAECA   |

; state 03
raphael_init_pause:
    TYX                 ; $0FAECB   |
    LDA $7A96,x         ; $0FAECC   |
    BNE CODE_0FAEDA     ; $0FAECF   |
    INC $18,x           ; $0FAED1   |
    LDA #$0001          ; $0FAED3   |
    STA $1015           ; $0FAED6   |
    RTS                 ; $0FAED9   |

CODE_0FAEDA:
    SEP #$20            ; $0FAEDA   |
    REP #$20            ; $0FAEDC   |
    LDA $7182,x         ; $0FAEDE   |
    CMP #$048E          ; $0FAEE1   |
    BCC CODE_0FAEF2     ; $0FAEE4   |
    LDA #$048E          ; $0FAEE6   |
    STA $7182,x         ; $0FAEE9   |
    STZ $7222,x         ; $0FAEEC   |
    STZ $7542,x         ; $0FAEEF   |

CODE_0FAEF2:
    RTS                 ; $0FAEF2   |

; state 04
raphael_init_kamek:
    TYX                 ; $0FAEF3   |
    LDA $7A96,x         ; $0FAEF4   |
    BNE CODE_0FAF23     ; $0FAEF7   |
    SEP #$20            ; $0FAEF9   |
    INC $18,x           ; $0FAEFB   |
    LDA $7182,x         ; $0FAEFD   |
    CLC                 ; $0FAF00   |
    ADC #$10            ; $0FAF01   |
    STA $7182,x         ; $0FAF03   |
    LDA #$40            ; $0FAF06   |
    STA $7A96,x         ; $0FAF08   |
    STZ $7402,x         ; $0FAF0B   |
    REP #$20            ; $0FAF0E   |
    LDA $7040,x         ; $0FAF10   |
    AND #$07FF          ; $0FAF13   |
    ORA #$8000          ; $0FAF16   |
    STA $7040,x         ; $0FAF19   |
    JSL $03AB1C         ; $0FAF1C   |
    STZ $1015           ; $0FAF20   |

CODE_0FAF23:
    RTS                 ; $0FAF23   |

; state 05
raphael_init_trembling:
    TYX                 ; $0FAF24   |
    SEP #$20            ; $0FAF25   |
    LDA $7A96,x         ; $0FAF27   |
    BNE CODE_0FAF43     ; $0FAF2A   |
    LDA #$13            ; $0FAF2C   |\ play sound #$13
    JSL $0085D2         ; $0FAF2E   |/
    INC $18,x           ; $0FAF32   |
    LDA #$C0            ; $0FAF34   |
    STA $7222,x         ; $0FAF36   |
    LDA #$FC            ; $0FAF39   |
    STA $7223,x         ; $0FAF3B   |
    LDA #$18            ; $0FAF3E   |
    STA $7542,x         ; $0FAF40   |

CODE_0FAF43:
    AND #$03            ; $0FAF43   |
    BNE CODE_0FAF52     ; $0FAF45   |
    LDA $1064           ; $0FAF47   |
    EOR #$08            ; $0FAF4A   |
    STA $1064           ; $0FAF4C   |
    STA $1065           ; $0FAF4F   |

CODE_0FAF52:
    REP #$20            ; $0FAF52   |
    RTS                 ; $0FAF54   |

; table
DATA_0FAF55:         db $80, $84, $88, $8C
DATA_0FAF59:         db $90, $94, $98, $9C
DATA_0FAF5D:         db $A0, $98, $94, $90
DATA_0FAF61:         db $8C, $88, $84, $84

; table
DATA_0FAF65:         db $A0, $98, $94, $90
DATA_0FAF69:         db $8C, $88, $84, $84
DATA_0FAF6D:         db $80, $84, $88, $8C
DATA_0FAF71:         db $90, $94, $98, $9C

; state 06
raphael_init_growing:
    TYX                 ; $0FAF75   |
    SEP #$20            ; $0FAF76   |
    LDA $105E           ; $0FAF78   |
    CLC                 ; $0FAF7B   |
    ADC #$08            ; $0FAF7C   |
    STA $105E           ; $0FAF7E   |
    LDA $D6,x           ; $0FAF81   |
    CMP #$80            ; $0FAF83   |
    BEQ CODE_0FAFB3     ; $0FAF85   |
    CLC                 ; $0FAF87   |
    ADC #$04            ; $0FAF88   |
    STA $D6,x           ; $0FAF8A   |
    LDA $0030           ; $0FAF8C   |
    NOP                 ; $0FAF8F   |
    NOP                 ; $0FAF90   |
    NOP                 ; $0FAF91   |
    NOP                 ; $0FAF92   |
    AND #$A80F          ; $0FAF93   |
    LDA $AF55,y         ; $0FAF96   | table
    CLC                 ; $0FAF99   |
    ADC $D6,x           ; $0FAF9A   |
    BCC CODE_0FAFA0     ; $0FAF9C   |
    LDA #$8DFF          ; $0FAF9E   |
    STZ $10             ; $0FAFA1   |
    LDA $AF65,y         ; $0FAFA3   | table
    CLC                 ; $0FAFA6   |
    ADC $D6,x           ; $0FAFA7   |
    BCC CODE_0FAFAD     ; $0FAFA9   |
    LDA #$8DFF          ; $0FAFAB   |
    ADC $10             ; $0FAFAE   |
    REP #$20            ; $0FAFB0   |
    RTS                 ; $0FAFB2   |

CODE_0FAFB3:
    LDA #$8DFF          ; $0FAFB3   |
    STZ $10             ; $0FAFB6   |
    STA $1065           ; $0FAFB8   |
    STZ $105E           ; $0FAFBB   |
    REP #$20            ; $0FAFBE   |
    STZ $7542,x         ; $0FAFC0   |
    STZ $7222,x         ; $0FAFC3   |
    INC $18,x           ; $0FAFC6   |
    LDA #$0020          ; $0FAFC8   |
    STA $7A96,x         ; $0FAFCB   |
    RTS                 ; $0FAFCE   |

; state 07
raphael_init_stomping:
    TYX                 ; $0FAFCF   |
    LDA $7A96,x         ; $0FAFD0   |
    BNE CODE_0FB004     ; $0FAFD3   |
    LDA #$0800          ; $0FAFD5   |
    STA $7222,x         ; $0FAFD8   |
    LDA $7182,x         ; $0FAFDB   |
    CMP #$0493          ; $0FAFDE   |
    BCC CODE_0FB004     ; $0FAFE1   |
    LDA #$0493          ; $0FAFE3   |
    STA $7182,x         ; $0FAFE6   |
    STZ $7222,x         ; $0FAFE9   |
    STZ $7542,x         ; $0FAFEC   |
    INC $18,x           ; $0FAFEF   |
    LDA #$0020          ; $0FAFF1   |
    STA $7A96,x         ; $0FAFF4   |
    LDA #$0047          ; $0FAFF7   |\ play sound #$0047
    JSL $0085D2         ; $0FAFFA   |/
    LDA #$0018          ; $0FAFFE   |
    STA $61C6           ; $0FB001   |

CODE_0FB004:
    RTS                 ; $0FB004   |

; state 08
raphael_init_lunging:
    TYX                 ; $0FB005   |
    SEP #$20            ; $0FB006   |
    LDA $0030           ; $0FB008   |
    NOP                 ; $0FB00B   |
    NOP                 ; $0FB00C   |
    NOP                 ; $0FB00D   |
    AND #$07            ; $0FB00E   |
    TAY                 ; $0FB010   |
    LDA $B48D,y         ; $0FB011   |
    STA $1064           ; $0FB014   |
    LDA $B495,y         ; $0FB017   |
    STA $1065           ; $0FB01A   |
    REP #$20            ; $0FB01D   |
    LDY $7A96,x         ; $0FB01F   |
    BNE CODE_0FB004     ; $0FB022   |
    LDA $0030           ; $0FB024   |
    AND #$0001          ; $0FB027   |
    BNE CODE_0FB05C     ; $0FB02A   |
    LDA #$01DF          ; $0FB02C   |
    JSL $008B21         ; $0FB02F   |
    LDA $70E2,x         ; $0FB033   |
    CLC                 ; $0FB036   |
    ADC #$0010          ; $0FB037   |
    STA $70A2,y         ; $0FB03A   |
    LDA $7182,x         ; $0FB03D   |
    CLC                 ; $0FB040   |
    ADC #$0012          ; $0FB041   |
    STA $7142,y         ; $0FB044   |
    LDA #$0005          ; $0FB047   |
    STA $7E4C,y         ; $0FB04A   |
    STA $73C2,y         ; $0FB04D   |
    LDA #$0004          ; $0FB050   |
    STA $7782,y         ; $0FB053   |
    LDA #$0000          ; $0FB056   |
    STA $7462,y         ; $0FB059   |

CODE_0FB05C:
    LDA #$FB80          ; $0FB05C   |
    STA $7220,x         ; $0FB05F   |
    LDY $7D36,x         ; $0FB062   |
    BPL CODE_0FB0B3     ; $0FB065   |
    STZ $7220,x         ; $0FB067   |
    LDA #$001E          ; $0FB06A   |
    STA $60AC           ; $0FB06D   |
    JSL $03BFF7         ; $0FB070   |
    LDA #$FC00          ; $0FB074   |
    STA $60A8           ; $0FB077   |
    LDA #$FE00          ; $0FB07A   |
    STA $60AA           ; $0FB07D   |
    INC $18,x           ; $0FB080   |
    LDA #$0013          ; $0FB082   |\ play sound #$0013
    JSL $0085D2         ; $0FB085   |/
    LDA #$01E6          ; $0FB089   |
    JSL $008B21         ; $0FB08C   |
    LDA $608C           ; $0FB090   |
    CLC                 ; $0FB093   |
    ADC #$0008          ; $0FB094   |
    STA $70A2,y         ; $0FB097   |
    LDA $6090           ; $0FB09A   |
    CLC                 ; $0FB09D   |
    ADC #$0008          ; $0FB09E   |
    STA $7142,y         ; $0FB0A1   |
    LDA #$0004          ; $0FB0A4   |
    STA $7782,y         ; $0FB0A7   |
    LDA #$0007          ; $0FB0AA   |
    STA $73C2,y         ; $0FB0AD   |
    STA $7E4C,y         ; $0FB0B0   |

CODE_0FB0B3:
    RTS                 ; $0FB0B3   |

; state 09
raphael_init_done:
    TYX                 ; $0FB0B4   |
    RTS                 ; $0FB0B5   |

raphael sub

CODE_0FB0B6:
    REP #$20            ; $0FB0B6   |
    JSL $03ADFE         ; $0FB0B8   |
    SEP #$20            ; $0FB0BC   |
    LDA $0146           ; $0FB0BE   |
    CMP #$09            ; $0FB0C1   |
    BEQ CODE_0FB0FD     ; $0FB0C3   |
    LDA #$40            ; $0FB0C5   |
    STA $105E           ; $0FB0C7   |
    LDA #$7F            ; $0FB0CA   |
    STA $1064           ; $0FB0CC   |
    STA $1065           ; $0FB0CF   |
    STZ $D6,x           ; $0FB0D2   |
    STZ $1070           ; $0FB0D4   |
    STZ $1071           ; $0FB0D7   |
    LDA #$04            ; $0FB0DA   |
    STA $7402,x         ; $0FB0DC   |
    LDA #$40            ; $0FB0DF   |
    STA $7A96,x         ; $0FB0E1   |
    REP #$20            ; $0FB0E4   |
    STZ $60C4           ; $0FB0E6   |
    LDA $7182,x         ; $0FB0E9   |
    SEC                 ; $0FB0EC   |
    SBC #$0008          ; $0FB0ED   |
    STA $7182,x         ; $0FB0F0   |
    STZ $7542,x         ; $0FB0F3   |
    STZ $7222,x         ; $0FB0F6   |
    JSR CODE_0FADC4     ; $0FB0F9   |
    RTS                 ; $0FB0FC   |


CODE_0FB0FD:
    SEP #$20            ; $0FB0FD   |
    LDA #$80            ; $0FB0FF   |
    STA $105D           ; $0FB101   |
    STA $105E           ; $0FB104   |
    LDA #$07            ; $0FB107   |
    STA $7900,x         ; $0FB109   |
    LDA #$60            ; $0FB10C   |
    STA $105C           ; $0FB10E   |
    LDA #$50            ; $0FB111   |
    STA $1064           ; $0FB113   |
    STA $1065           ; $0FB116   |
    LDA #$00            ; $0FB119   |
    STA $D9,x           ; $0FB11B   |
    DEC A               ; $0FB11D   |
    STA $76,x           ; $0FB11E   |
    STZ $77,x           ; $0FB120   |
    LDA #$80            ; $0FB122   |
    STA $1068           ; $0FB124   |
    REP #$20            ; $0FB127   |
    LDA #$0140          ; $0FB129   |
    STA $70E2,x         ; $0FB12C   |
    LDA $6FA0,x         ; $0FB12F   |
    AND #$C7FF          ; $0FB132   |
    STA $6FA0,x         ; $0FB135   |
    JSL $0CDB4D         ; $0FB138   |
    RTS                 ; $0FB13C   |

; raphael sub

CODE_0FB13D:
    LDA #$42            ; $0FB13D   |
    STA $105C           ; $0FB13F   |
    LDA #$FF            ; $0FB142   |
    STA $1064           ; $0FB144   |
    STA $1065           ; $0FB147   |
    RTS                 ; $0FB14A   |

; raphael sub

CODE_0FB14B:
    SEP #$20            ; $0FB14B   |
    LDA $1068           ; $0FB14D   |
    CMP #$80            ; $0FB150   |
    BEQ CODE_0FB15F     ; $0FB152   |
    BCS CODE_0FB15C     ; $0FB154   |
    INC $1068           ; $0FB156   |
    INC $1068           ; $0FB159   |

CODE_0FB15C:
    DEC $1068           ; $0FB15C   |

CODE_0FB15F:
    LDA $60A0           ; $0FB15F   |
    CMP $1068           ; $0FB162   |
    BEQ CODE_0FB16F     ; $0FB165   |
    BCS CODE_0FB16B     ; $0FB167   |
    INC A               ; $0FB169   |
    INC A               ; $0FB16A   |

CODE_0FB16B:
    DEC A               ; $0FB16B   |
    STA $60A0           ; $0FB16C   |

CODE_0FB16F:
    LDA $D6,x           ; $0FB16F   |
    BEQ CODE_0FB175     ; $0FB171   |
    DEC $D6,x           ; $0FB173   |

CODE_0FB175:
    AND #$02            ; $0FB175   |
    CLC                 ; $0FB177   |
    ADC $60A0           ; $0FB178   |
    STA $60A0           ; $0FB17B   |
    LDA $1062           ; $0FB17E   |
    STA $7400,x         ; $0FB181   |
    LDA $1060           ; $0FB184   |
    BEQ CODE_0FB18C     ; $0FB187   |
    DEC $1060           ; $0FB189   |

CODE_0FB18C:
    LDA $1061           ; $0FB18C   |
    BEQ CODE_0FB194     ; $0FB18F   |
    DEC $1061           ; $0FB191   |

CODE_0FB194:
    JSR CODE_0FB2AC     ; $0FB194   |
    LDA $105C           ; $0FB197   |
    CLC                 ; $0FB19A   |
    ADC $1074           ; $0FB19B   |
    STA $0E             ; $0FB19E   |
    STZ $1074           ; $0FB1A0   |
    JSR CODE_0FB905     ; $0FB1A3   |
    JSR CODE_0FB22F     ; $0FB1A6   |
    JSR CODE_0FB1E6     ; $0FB1A9   |
    REP #$20            ; $0FB1AC   |
    RTS                 ; $0FB1AE   |

; raphael sub

CODE_0FB1AF:
    LDA $76,x           ; $0FB1AF   |
    CMP #$FF            ; $0FB1B1   |
    BEQ CODE_0FB1BE     ; $0FB1B3   |
    TYA                 ; $0FB1B5   |
    CLC                 ; $0FB1B6   |
    ADC $76,x           ; $0FB1B7   |
    STA $76,x           ; $0FB1B9   |
    BCS CODE_0FB1BE     ; $0FB1BB   |
    RTS                 ; $0FB1BD   |--

CODE_0FB1BE:
    LDA #$FF            ; $0FB1BE   |
    STA $76,x           ; $0FB1C0   |
    LDA $16,x           ; $0FB1C2   |
    ASL A               ; $0FB1C4   |
    TAY                 ; $0FB1C5   |
    LDA $B21B,y         ; $0FB1C6   | address table
    STA $00             ; $0FB1C9   |
    LDA $B21C,y         ; $0FB1CB   | read both cause 8-bit
    STA $01             ; $0FB1CE   |
    LDA #$5F            ; $0FB1D0   |
    STA $02             ; $0FB1D2   |
    PHX                 ; $0FB1D4   |
    LDX #$00            ; $0FB1D5   |
    TXY                 ; $0FB1D7   |

CODE_0FB1D8:
    LDA [$00],y         ; $0FB1D8   | read from current palette table
    STA $702F2E,x       ; $0FB1DA   |
    INY                 ; $0FB1DE   |
    INX                 ; $0FB1DF   |
    CPX #$1E            ; $0FB1E0   |
    BNE CODE_0FB1D8     ; $0FB1E2   |
    PLX                 ; $0FB1E4   |
    RTS                 ; $0FB1E5   |

; raphael sub

CODE_0FB1E6:
    REP #$20            ; $0FB1E6   |
    LDA $16,x           ; $0FB1E8   |
    ASL A               ; $0FB1EA   |
    TAY                 ; $0FB1EB   |
    LDA $B21B,y         ; $0FB1EC   | table
    STA $301C           ; $0FB1EF   |
    LDA #$005F          ; $0FB1F2   |
    STA $3000           ; $0FB1F5   |
    LDA $76,x           ; $0FB1F8   |
    AND #$00FF          ; $0FB1FA   |
    INC A               ; $0FB1FD   |
    STA $300C           ; $0FB1FE   |
    LDA #$00E1          ; $0FB201   |
    STA $3010           ; $0FB204   |
    LDA #$000F          ; $0FB207   |
    STA $3018           ; $0FB20A   |
    LDX #$08            ; $0FB20D   |
    LDA #$E167          ; $0FB20F   |
    JSL $7EDE44         ; $0FB212   | GSU init
    SEP #$30            ; $0FB216   |
    LDX $12             ; $0FB218   |
    RTS                 ; $0FB21A   |

; palette address table: contains addresses where palettes begin
DATA_0FB21B:         dw $E58C
DATA_0FB21D:         dw $E5AA
DATA_0FB21F:         dw $E5C8
DATA_0FB221:         dw $E5E6
DATA_0FB223:         dw $E604
DATA_0FB225:         dw $E622
DATA_0FB227:         dw $E6DA
DATA_0FB229:         dw $E6F8
DATA_0FB22B:         dw $E716
DATA_0FB22D:         dw $E734

; raphael sub

CODE_0FB22F:
    LDA $093C           ; $0FB22F   |
    AND #$10            ; $0FB232   |
    BRA CODE_0FB242     ; $0FB234   |

    LDA #$00            ; $0FB236   |
    STA $16,x           ; $0FB238   |
    JSR CODE_0FB0B6     ; $0FB23A   |
    SEP #$20            ; $0FB23D   |
    STZ $105F           ; $0FB23F   |

CODE_0FB242:
    RTS                 ; $0FB242   |

; raph spark sub

CODE_0FB243:
    REP #$20            ; $0FB243   |
    LDY $7D36,x         ; $0FB245   |
    BPL CODE_0FB24E     ; $0FB248   |
    JSL $03A858         ; $0FB24A   |

CODE_0FB24E:
    SEP #$20            ; $0FB24E   |
    RTS                 ; $0FB250   |

raphael_check_headbop:

CODE_0FB251:
    REP #$20            ; $0FB251   |
    JSL $0F9388         ; $0FB253   |
    SEP #$20            ; $0FB257   |
    LDA $6F00,x         ; $0FB259   |
    CMP #$0E            ; $0FB25C   | headbop sprite state
    BNE CODE_0FB281     ; $0FB25E   |
    LDA #$10            ; $0FB260   |
    STA $6F00,x         ; $0FB262   |
    LDA #$0C            ; $0FB265   | headbop raph state
    STA $105F           ; $0FB267   |
    LDA #$34            ; $0FB26A   |\ play sound #$34
    JSL $0085D2         ; $0FB26C   |/
    LDA #$20            ; $0FB270   |
    STA $7A96,x         ; $0FB272   |
    LDA #$00            ; $0FB275   |
    STA $60AA           ; $0FB277   |
    LDA #$FC            ; $0FB27A   |
    STA $60AB           ; $0FB27C   |
    PLA                 ; $0FB27F   |
    PLA                 ; $0FB280   |

CODE_0FB281:
    RTS                 ; $0FB281   |

main raphael pointer table: AI states
.raphael_main_ptr

beginning cinematics
DATA_0FB282:         dw $B31A   ; 00: yoshi flying up to moon
DATA_0FB284:         dw $B337   ; 01: yoshi falling on initial platform
DATA_0FB286:         dw $B363   ; 02: camera panning down, raphael moving in bg
DATA_0FB288:         dw $B391   ; 03: flying up to moon
DATA_0FB28A:         dw $B425   ; 04: turning around

main sequence
DATA_0FB28C:         dw $B4A5   ; 05: moving forward
DATA_0FB28E:         dw $B523   ; 06: stomping down on moon
DATA_0FB290:         dw $B53C   ; 07: turning around a few times to choose a direction
DATA_0FB292:         dw $B581   ; 08: preparing to move

attack sequence
DATA_0FB294:         dw $B67A   ; 09: hopping up to initiate attack
DATA_0FB296:         dw $B694   ; 0A: pounding down and shooting flames

damaged states
DATA_0FB298:         dw $B5D4   ; 0B: damaged from yoshi ground pounding stake
DATA_0FB29A:         dw $B633   ; 0C: stunned because yoshi bopped head

death cinematics
DATA_0FB29C:         dw $B6C9   ; 0D: final stake pound, dying
DATA_0FB29E:         dw $B733   ; 0E: turning slightly from death spot
DATA_0FB2A0:         dw $B76E   ; 0F: rotating / scaling down all the way back to the sky
DATA_0FB2A2:         dw $B7BD   ; 10: rotating slightly and fading out into a twinkle
DATA_0FB2A4:         dw $B833   ; 11: twinkle fades out
DATA_0FB2A6:         dw $B84D   ; 12: star forms
DATA_0FB2A8:         dw $B866   ; 13: fade in raphael constellation
DATA_0FB2AA:         dw $B8DB   ; 14: done with fight, final state

; raphael sub

CODE_0FB2AC:
    LDA $0D07           ; $0FB2AC   |
    BEQ CODE_0FB311     ; $0FB2AF   |
    STZ $0D07           ; $0FB2B1   |
    LDA $105D           ; $0FB2B4   |
    CLC                 ; $0FB2B7   |
    ADC $0D05           ; $0FB2B8   |
    CLC                 ; $0FB2BB   |
    ADC #$80            ; $0FB2BC   |
    CLC                 ; $0FB2BE   |
    ADC #$0E            ; $0FB2BF   |
    CMP #$1C            ; $0FB2C1   |
    BCS CODE_0FB311     ; $0FB2C3   |
    LDA $105C           ; $0FB2C5   |
    CMP #$44            ; $0FB2C8   |
    BCS CODE_0FB311     ; $0FB2CA   |
    LDA #$78            ; $0FB2CC   |\ play sound #$78
    JSL $0085D2         ; $0FB2CE   |/
    LDA $7900,x         ; $0FB2D2   |
    CMP #$01            ; $0FB2D5   |
    BNE CODE_0FB2FA     ; $0FB2D7   |
    LDA #$0D            ; $0FB2D9   |
    STA $105F           ; $0FB2DB   |
    LDA #$A0            ; $0FB2DE   |
    STA $1060           ; $0FB2E0   |
    LDA #$A0            ; $0FB2E3   |
    STA $1061           ; $0FB2E5   |
    REP #$20            ; $0FB2E8   |
    LDA #$0002          ; $0FB2EA   |
    STA $60AC           ; $0FB2ED   |
    STZ $617A           ; $0FB2F0   |
    STZ $617C           ; $0FB2F3   |
    SEP #$20            ; $0FB2F6   |
    BRA CODE_0FB311     ; $0FB2F8   |

CODE_0FB2FA:
    LDA #$0B            ; $0FB2FA   | \  he has been damaged
    STA $105F           ; $0FB2FC   |  | enter 0B state
    LDA #$08            ; $0FB2FF   |  | give him 8 velocity upwards
    STA $106C           ; $0FB301   | /  
    LDA #$A0            ; $0FB304   |
    STA $1065           ; $0FB306   |
    STZ $1060           ; $0FB309   | 0 out timer
    LDA #$18            ; $0FB30C   |
    STA $1061           ; $0FB30E   |

CODE_0FB311:
    TXY                 ; $0FB311   |
    LDA $105F           ; $0FB312   |
    ASL A               ; $0FB315   |
    TAX                 ; $0FB316   |
    JMP ($B282,x)       ; $0FB317   | raphael state routine

; state 00
raphael_yoshi_to_moon:
    TYX                 ; $0FB31A   |
    LDA $0030           ; $0FB31B   |
    LSR A               ; $0FB31E   |
    LSR A               ; $0FB31F   |
    LSR A               ; $0FB320   |
    LSR A               ; $0FB321   |
    AND #$01            ; $0FB322   |
    STA $1063           ; $0FB324   |
    LDA $60AC           ; $0FB327   |
    CMP #$20            ; $0FB32A   |
    BEQ CODE_0FB336     ; $0FB32C   |
    INC $105F           ; $0FB32E   |
    LDA #$50            ; $0FB331   |
    STA $1060           ; $0FB333   |

CODE_0FB336:
    RTS                 ; $0FB336   |

; state 01
raphael_yoshi_on_platform:
    TYX                 ; $0FB337   |
    LDA $0030           ; $0FB338   |
    LSR A               ; $0FB33B   |
    LSR A               ; $0FB33C   |
    LSR A               ; $0FB33D   |
    LSR A               ; $0FB33E   |
    AND #$01            ; $0FB33F   |
    STA $1063           ; $0FB341   |
    LDA $1060           ; $0FB344   |
    BNE CODE_0FB362     ; $0FB347   |
    LDA #$01            ; $0FB349   |
    STA $61AE           ; $0FB34B   |
    STZ $60A8           ; $0FB34E   |
    STZ $60A9           ; $0FB351   |
    STZ $60B4           ; $0FB354   |
    STZ $60B5           ; $0FB357   |
    INC $105F           ; $0FB35A   |
    LDA #$A0            ; $0FB35D   |
    STA $1060           ; $0FB35F   |

CODE_0FB362:
    RTS                 ; $0FB362   |

; state 02
raphael_moving_in_bg:
    TYX                 ; $0FB363   |
    JSR CODE_0FB40E     ; $0FB364   |
    LDA $1060           ; $0FB367   |
    BEQ CODE_0FB37D     ; $0FB36A   |
    CMP #$30            ; $0FB36C   |
    BCC CODE_0FB37C     ; $0FB36E   |
    AND #$0F            ; $0FB370   |
    BNE CODE_0FB37C     ; $0FB372   |
    LDA $1062           ; $0FB374   |
    EOR #$02            ; $0FB377   |
    STA $1062           ; $0FB379   |

CODE_0FB37C:
    RTS                 ; $0FB37C   |

CODE_0FB37D:
    INC $105F           ; $0FB37D   |
    LDA #$00            ; $0FB380   |
    STA $1066           ; $0FB382   |
    LDA #$50            ; $0FB385   |
    STA $1060           ; $0FB387   |
    LDA #$89            ; $0FB38A   |\ play sound #$89
    JSL $0085D2         ; $0FB38C   |/
    RTS                 ; $0FB390   |

; state 03
raphael_to_moon:
    TYX                 ; $0FB391   |
    JSR CODE_0FB40E     ; $0FB392   |
    LDA $0030           ; $0FB395   |
    AND #$03            ; $0FB398   |
    BEQ CODE_0FB3A5     ; $0FB39A   |
    LDA $76,x           ; $0FB39C   |
    BEQ CODE_0FB3A5     ; $0FB39E   |
    SEC                 ; $0FB3A0   |
    SBC #$01            ; $0FB3A1   |
    STA $76,x           ; $0FB3A3   |

CODE_0FB3A5:
    LDA $0030           ; $0FB3A5   |
    LSR A               ; $0FB3A8   |
    LSR A               ; $0FB3A9   |
    LSR A               ; $0FB3AA   |
    AND #$01            ; $0FB3AB   |
    STA $1063           ; $0FB3AD   |
    LDA $0030           ; $0FB3B0   |
    AND #$07            ; $0FB3B3   |
    BNE CODE_0FB3BA     ; $0FB3B5   |
    INC $1066           ; $0FB3B7   |

CODE_0FB3BA:
    JSR CODE_0FB3EC     ; $0FB3BA   |
    LDA $1060           ; $0FB3BD   |
    AND #$01            ; $0FB3C0   |
    BNE CODE_0FB3D2     ; $0FB3C2   |
    LDA $1064           ; $0FB3C4   |
    CMP #$F8            ; $0FB3C7   |
    BEQ CODE_0FB3D2     ; $0FB3C9   |
    INC A               ; $0FB3CB   |
    STA $1064           ; $0FB3CC   |
    STA $1065           ; $0FB3CF   |

CODE_0FB3D2:
    LDA $105D           ; $0FB3D2   |
    AND #$FE            ; $0FB3D5   |
    CMP #$7E            ; $0FB3D7   |
    BNE CODE_0FB3EB     ; $0FB3D9   |
    LDA #$80            ; $0FB3DB   |
    STA $105D           ; $0FB3DD   |
    INC $105F           ; $0FB3E0   |
    LDA #$30            ; $0FB3E3   |
    STA $1060           ; $0FB3E5   |
    STZ $106C           ; $0FB3E8   |

CODE_0FB3EB:
    RTS                 ; $0FB3EB   |

CODE_0FB3EC:
    LDA $1066           ; $0FB3EC   |
    ASL A               ; $0FB3EF   |
    ASL A               ; $0FB3F0   |
    ASL A               ; $0FB3F1   |
    ASL A               ; $0FB3F2   |
    CLC                 ; $0FB3F3   |
    ADC $1067           ; $0FB3F4   |
    STA $1067           ; $0FB3F7   |
    LDA $1066           ; $0FB3FA   |
    PHP                 ; $0FB3FD   |
    LSR A               ; $0FB3FE   |
    LSR A               ; $0FB3FF   |
    LSR A               ; $0FB400   |
    LSR A               ; $0FB401   |
    PLP                 ; $0FB402   |
    BPL CODE_0FB407     ; $0FB403   |
    ORA #$F0            ; $0FB405   |

CODE_0FB407:
    ADC $105D           ; $0FB407   |
    STA $105D           ; $0FB40A   |
    RTS                 ; $0FB40D   |

; raphael sub

CODE_0FB40E:
    REP #$20            ; $0FB40E   |
    LDA $7182,x         ; $0FB410   |
    SEC                 ; $0FB413   |
    SBC #$00B8          ; $0FB414   |
    LSR A               ; $0FB417   |
    LSR A               ; $0FB418   |
    NOP                 ; $0FB419   |
    NOP                 ; $0FB41A   |
    CLC                 ; $0FB41B   |
    ADC #$0076          ; $0FB41C   |
    STA $1068           ; $0FB41F   |
    SEP #$20            ; $0FB422   |
    RTS                 ; $0FB424   |

; state 04
raphael_moon_flip:
    TYX                 ; $0FB425   |
    JSR CODE_0FB40E     ; $0FB426   |
    LDA $D9,x           ; $0FB429   |
    AND #$FE            ; $0FB42B   |
    CMP #$80            ; $0FB42D   |
    BEQ CODE_0FB437     ; $0FB42F   |
    CLC                 ; $0FB431   |
    ADC #$08            ; $0FB432   |
    STA $D9,x           ; $0FB434   |
    RTS                 ; $0FB436   |

CODE_0FB437:
    STA $D9,x           ; $0FB437   |
    LDA $1060           ; $0FB439   |
    BNE CODE_0FB455     ; $0FB43C   |
    LDA $105C           ; $0FB43E   |
    CLC                 ; $0FB441   |
    ADC $106C           ; $0FB442   |
    STA $105C           ; $0FB445   |
    DEC $106C           ; $0FB448   |
    DEC $106C           ; $0FB44B   |
    LDA $105C           ; $0FB44E   |
    CMP #$42            ; $0FB451   |
    BCC CODE_0FB456     ; $0FB453   |

CODE_0FB455:
    RTS                 ; $0FB455   |

CODE_0FB456:
    JSR CODE_0FB4E0     ; $0FB456   |
    LDA #$80            ; $0FB459   |
    STA $1060           ; $0FB45B   |
    LDA #$80            ; $0FB45E   |
    STA $D9,x           ; $0FB460   |
    LDA #$20            ; $0FB462   |
    STA $D6,x           ; $0FB464   |
    LDA #$47            ; $0FB466   |\ play sound #$47
    JSL $0085D2         ; $0FB468   |/
    PHX                 ; $0FB46C   |
    LDX #$00            ; $0FB46D   |

CODE_0FB46F:
    LDA $5FE6DA,x       ; $0FB46F   |
    STA $702F2E,x       ; $0FB473   |
    INX                 ; $0FB477   |
    CPX #$1E            ; $0FB478   |
    BNE CODE_0FB46F     ; $0FB47A   |
    PLX                 ; $0FB47C   |
    LDA #$FF            ; $0FB47D   |
    STA $76,x           ; $0FB47F   |
    LDA #$06            ; $0FB481   |
    STA $16,x           ; $0FB483   |
    JSR CODE_0FB13D     ; $0FB485   |
    RTS                 ; $0FB488   |

; table
DATA_0FB489:         db $01, $00, $FF, $00

; table
DATA_0FB48D:         db $FF, $F0, $E0, $D0
DATA_0FB491:         db $D0, $E0, $F0, $FF

; table
DATA_0FB495:         db $E8, $F0, $F8, $FF
DATA_0FB499:         db $FF, $F8, $F0, $E8

; table
DATA_0FB49D:         db $FD, $FE, $FF, $00
DATA_0FB4A1:         db $00, $FF, $FE, $FD

; state 05
raphael_move_forward:
    TYX                 ; $0FB4A5   |
    JSR CODE_0FB251     ; $0FB4A6   |
    LDY #$08            ; $0FB4A9   |
    JSR CODE_0FB1AF     ; $0FB4AB   |
    LDA $106C           ; $0FB4AE   | \
    BPL CODE_0FB4BA     ; $0FB4B1   |  | attempts to correct
    LDA $105C           ; $0FB4B3   |  | Y value if >= $43
    CMP #$43            ; $0FB4B6   |  |
    BCC CODE_0FB4CC     ; $0FB4B8   |  | applies a simple gravity

CODE_0FB4BA:
    LDA $105C           ; $0FB4BA   |  | decrementing Y velocity
    CLC                 ; $0FB4BD   |  | and this will keep
    ADC $106C           ; $0FB4BE   |  | in effect
    STA $105C           ; $0FB4C1   |  | until Y < $43
    CMP #$43            ; $0FB4C4   |  | 
    BCC CODE_0FB4CC     ; $0FB4C6   |  | 
    DEC $106C           ; $0FB4C8   | /
    RTS                 ; $0FB4CB   |

CODE_0FB4CC:
    LDA #$42            ; $0FB4CC   | \
    STA $105C           ; $0FB4CE   | / fixed Y value while he's moving
    LDA $1060           ; $0FB4D1   |
    BNE CODE_0FB4EB     ; $0FB4D4   |
    LDA $105D           ; $0FB4D6   | \  keeps going until
    CLC                 ; $0FB4D9   |  | last 5 bits of X are 00000
    ADC #$00            ; $0FB4DA   |  | this snaps him to one of:
    AND #$1F            ; $0FB4DC   |  | 00, 20, 40, 60, 80, A0, C0, E0
    BNE CODE_0FB4EB     ; $0FB4DE   | /  

CODE_0FB4E0:
    LDA #$14            ; $0FB4E0   | \  once the state is finished
    STA $1060           ; $0FB4E2   |  | load $14 frames of timer
    LDA #$06            ; $0FB4E5   |  | and change state to $06
    STA $105F           ; $0FB4E7   | /
    RTS                 ; $0FB4EA   |

CODE_0FB4EB:
    LDA $105D           ; $0FB4EB   |
    NOP                 ; $0FB4EE   |
    NOP                 ; $0FB4EF   |
    NOP                 ; $0FB4F0   |
    AND #$07            ; $0FB4F1   |
    TAY                 ; $0FB4F3   |
    LDA $B48D,y         ; $0FB4F4   |
    STA $1064           ; $0FB4F7   |
    LDA $B495,y         ; $0FB4FA   |
    STA $1065           ; $0FB4FD   |
    LDA $B49D,y         ; $0FB500   |
    STA $1074           ; $0FB503   |
    LDY $1062           ; $0FB506   |
    LDA $7900,x         ; $0FB509   | \
    CMP #$07            ; $0FB50C   |  | if table value is 7 
    BEQ CODE_0FB518     ; $0FB50E   |  | or val & gametimer == 0
    AND $0030           ; $0FB510   |  | move 2
    BNE CODE_0FB518     ; $0FB513   | /  else 1
    JSR CODE_0FB518     ; $0FB515   | jumps right here, which simply performs addition twice

CODE_0FB518:
    LDA $105D           ; $0FB518   |
    CLC                 ; $0FB51B   |
    ADC $B489,y         ; $0FB51C   | velocity table (index == direction)
    STA $105D           ; $0FB51F   |
    RTS                 ; $0FB522   |

; state 06
raphael_stomp_moon:
    TYX                 ; $0FB523   |
    JSR CODE_0FB251     ; $0FB524   |
    JSR CODE_0FB65A     ; $0FB527   |
    LDA $1060           ; $0FB52A   |
    BNE CODE_0FB53B     ; $0FB52D   |
    INC $105F           ; $0FB52F   |
    LDA $10             ; $0FB532   |
    AND #$30            ; $0FB534   |
    ADC #$40            ; $0FB536   |
    STA $1060           ; $0FB538   |

CODE_0FB53B:
    RTS                 ; $0FB53B   |

; state 07
raphael_choose_dir:
    TYX                 ; $0FB53C   |
    JSR CODE_0FB251     ; $0FB53D   |
    JSR CODE_0FB65A     ; $0FB540   |
    LDA $1060           ; $0FB543   | \ controls when to finally
    BEQ CODE_0FB578     ; $0FB546   | / stop turning around
    CMP #$28            ; $0FB548   |
    BNE CODE_0FB568     ; $0FB54A   |
    LDA $105E           ; $0FB54C   |
    CLC                 ; $0FB54F   |
    ADC #$40            ; $0FB550   |
    BMI CODE_0FB568     ; $0FB552   |
    LDA $105E           ; $0FB554   |
    ASL A               ; $0FB557   |
    ROL A               ; $0FB558   |
    ROL A               ; $0FB559   |
    AND #$02            ; $0FB55A   |
    EOR #$02            ; $0FB55C   |
    STA $1062           ; $0FB55E   |
    LDA #$08            ; $0FB561   |
    STA $106C           ; $0FB563   |
    BRA CODE_0FB578     ; $0FB566   |

CODE_0FB568:
    LDA $1060           ; $0FB568   | \  timer effect
    AND #$0F            ; $0FB56B   |  | causes up to 16-frame wait
    BNE CODE_0FB577     ; $0FB56D   |  | before swapping
    LDA $1062           ; $0FB56F   |  | face direction
    EOR #$02            ; $0FB572   |  |
    STA $1062           ; $0FB574   | /

CODE_0FB577:
    RTS                 ; $0FB577   |

CODE_0FB578:
    INC $105F           ; $0FB578   |
    LDA #$14            ; $0FB57B   |
    STA $1060           ; $0FB57D   |
    RTS                 ; $0FB580   |

; state 08
raphael_prepare_move:
    TYX                 ; $0FB581   |
    JSR CODE_0FB251     ; $0FB582   |
    JSR CODE_0FB65A     ; $0FB585   |
    LDY #$10            ; $0FB588   |
    JSR CODE_0FB1AF     ; $0FB58A   |
    LDA $1060           ; $0FB58D   | \ waiting for timer
    BNE CODE_0FB5C3     ; $0FB590   | /
    LDA $61AE           ; $0FB592   | \ never immediately attack
    BNE CODE_0FB5AF     ; $0FB595   | / at beginning cutscene
    LDA $7900,x         ; $0FB597   | \
    NOP                 ; $0FB59A   |  | rng
    NOP                 ; $0FB59B   |  | from 0 to 7
    STA $00             ; $0FB59C   |  | 
    LDA $10             ; $0FB59E   |  | 1/8 chance
    AND $00             ; $0FB5A0   |  | to
    BNE CODE_0FB5AF     ; $0FB5A2   |  | switch
    LDA #$09            ; $0FB5A4   |  | to attacking state
    STA $105F           ; $0FB5A6   |  |
    LDA #$08            ; $0FB5A9   |  |
    STA $106C           ; $0FB5AB   | /
    RTS                 ; $0FB5AE   |

CODE_0FB5AF:
    STZ $61AE           ; $0FB5AF   | \
    STZ $60AC           ; $0FB5B2   | / regain control of yoshi

CODE_0FB5B5:
    LDA #$05            ; $0FB5B5   | \
    STA $105F           ; $0FB5B7   | / switch to moving state
    LDA $10             ; $0FB5BA   | \
    AND #$7F            ; $0FB5BC   |  | rng timer value for
    ADC #$80            ; $0FB5BE   |  | how long to move
    STA $1060           ; $0FB5C0   | /

CODE_0FB5C3:
    RTS                 ; $0FB5C3   |

; table
DATA_0FB5C4:         db $D0, $D6, $DC, $E2
DATA_0FB5C8:         db $E8, $EE, $F4, $FF

; table
DATA_0FB5CC:         db $FF, $F4, $EE, $E8
DATA_0FB5D0:         db $E2, $DC, $D6, $D0

; state 0B
raphael_damaged:
    TYX                 ; $0FB5D4   |
    LDA $1061           ; $0FB5D5   |
    LSR A               ; $0FB5D8   |
    AND #$02            ; $0FB5D9   |
    ORA #$2C            ; $0FB5DB   |
    STA $7042,x         ; $0FB5DD   |
    LDA $1060           ; $0FB5E0   |
    BEQ CODE_0FB5FB     ; $0FB5E3   |
    CMP #$01            ; $0FB5E5   |
    BEQ CODE_0FB60F     ; $0FB5E7   |
    NOP                 ; $0FB5E9   |
    NOP                 ; $0FB5EA   |
    AND #$07            ; $0FB5EB   |
    TAY                 ; $0FB5ED   |
    LDA $B5C4,y         ; $0FB5EE   | table
    STA $1064           ; $0FB5F1   |
    LDA $B5CC,y         ; $0FB5F4   | table
    STA $1065           ; $0FB5F7   |
    RTS                 ; $0FB5FA   |

CODE_0FB5FB:
    JSR CODE_0FB65A     ; $0FB5FB   |
    LDA $105C           ; $0FB5FE   |
    CMP #$42            ; $0FB601   |
    BNE CODE_0FB60E     ; $0FB603   |
    LDA #$30            ; $0FB605   |
    STA $1060           ; $0FB607   |
    JSR CODE_0FB13D     ; $0FB60A   |
    RTS                 ; $0FB60D   |

CODE_0FB60E:
    RTS                 ; $0FB60E   |

CODE_0FB60F:
    LSR $7900,x         ; $0FB60F   |
    INC $77,x           ; $0FB612   |
    LDY $77,x           ; $0FB614   |
    LDA $B6A1,y         ; $0FB616   | table
    STA $16,x           ; $0FB619   |
    STZ $76,x           ; $0FB61B   |
    JSR CODE_0FB13D     ; $0FB61D   |
    JMP CODE_0FB4E0     ; $0FB620   |

; table
DATA_0FB623:         db $E4, $E8, $EC, $F0
DATA_0FB627:         db $F4, $F8, $FC, $FF

; table
DATA_0FB62B:         db $FF, $FC, $F8, $F4
DATA_0FB62F:         db $F0, $EC, $E8, $E4

; state 0C
raphael_stunned:
    TYX                 ; $0FB633   |
    JSR CODE_0FB251     ; $0FB634   |
    JSR CODE_0FB65A     ; $0FB637   |
    LDA $7A96,x         ; $0FB63A   |
    BNE CODE_0FB64A     ; $0FB63D   |
    LDA #$FF            ; $0FB63F   |
    STA $1064           ; $0FB641   |
    STA $1065           ; $0FB644   |
    JMP CODE_0FB4E0     ; $0FB647   |--

CODE_0FB64A:
    AND #$07            ; $0FB64A   |
    TAY                 ; $0FB64C   |
    LDA $B623,y         ; $0FB64D   | table
    STA $1064           ; $0FB650   |
    LDA $B62B,y         ; $0FB653   | table
    STA $1065           ; $0FB656   |
    RTS                 ; $0FB659   |

; raphael sub

CODE_0FB65A:
    LDA $105C           ; $0FB65A   | \
    CLC                 ; $0FB65D   |  | move him up at first
    ADC $106C           ; $0FB65E   |  | simulate gravity by decrementing
    STA $105C           ; $0FB661   |  | y velocity, so eventually back
    DEC $106C           ; $0FB664   |  | down to bottom (or $42)
    DEC $106C           ; $0FB667   | /
    LDA $105C           ; $0FB66A   |
    CMP #$42            ; $0FB66D   |
    BCS CODE_0FB679     ; $0FB66F   |
    LDA #$42            ; $0FB671   |
    STA $105C           ; $0FB673   |
    STZ $106C           ; $0FB676   |

CODE_0FB679:
    RTS                 ; $0FB679   |

; state 09
raphael_beginning_attack:
    TYX                 ; $0FB67A   |
    JSR CODE_0FB251     ; $0FB67B   |
    JSR CODE_0FB65A     ; $0FB67E   |
    LDA $105C           ; $0FB681   | \
    CMP #$42            ; $0FB684   |  | wait till back on ground
    BNE CODE_0FB693     ; $0FB686   | /
    JSR CODE_0FAC61     ; $0FB688   |
    INC $105F           ; $0FB68B   | next state: attacking
    LDA #$40            ; $0FB68E   | for $40 frames
    STA $1060           ; $0FB690   |

CODE_0FB693:
    RTS                 ; $0FB693   |

; state 0A
raphael_attacking:
    TYX                 ; $0FB694   |
    JSR CODE_0FB251     ; $0FB695   |
    LDA $1060           ; $0FB698   |
    BNE CODE_0FB6A0     ; $0FB69B   |
    JSR CODE_0FB5B5     ; $0FB69D   |

CODE_0FB6A0:
    RTS                 ; $0FB6A0   |

; table
DATA_0FB6A1:         db $06, $08, $09, $09
DATA_0FB6A5:         db $09, $09, $09, $09

; table
DATA_0FB6A9:         db $A0, $AC, $B8, $C4
DATA_0FB6AD:         db $D0, $DC, $E8, $FF
DATA_0FB6B1:         db $FF, $E8, $DC, $D0
DATA_0FB6B5:         db $C4, $B8, $AC, $A0

; table
DATA_0FB6B9:         db $FF, $E8, $DC, $D0
DATA_0FB6BD:         db $C4, $B8, $AC, $A0
DATA_0FB6C1:         db $A0, $AC, $B8, $C4
DATA_0FB6C5:         db $D0, $DC, $E8, $FF

; state 0D
raphael_dead:
    TYX                 ; $0FB6C9   |
    JSR CODE_0FB40E     ; $0FB6CA   |
    LDA $1060           ; $0FB6CD   |
    BNE CODE_0FB6E6     ; $0FB6D0   |
    INC $105F           ; $0FB6D2   |
    STZ $76,x           ; $0FB6D5   |
    LDA #$01            ; $0FB6D7   |
    STA $16,x           ; $0FB6D9   |
    LDA #$30            ; $0FB6DB   |
    STA $1066           ; $0FB6DD   |
    LDA #$82            ; $0FB6E0   |\ play sound #$0082
    JSL $0085D2         ; $0FB6E2   |/

CODE_0FB6E6:
    LDA $D9,x           ; $0FB6E6   |
    CLC                 ; $0FB6E8   |
    ADC #$00            ; $0FB6E9   |
    STA $D9,x           ; $0FB6EB   |
    LDA $1061           ; $0FB6ED   |
    LSR A               ; $0FB6F0   |
    AND #$02            ; $0FB6F1   |
    ORA #$2C            ; $0FB6F3   |
    STA $7042,x         ; $0FB6F5   |
    LDA $1060           ; $0FB6F8   |
    AND #$0F            ; $0FB6FB   |
    TAY                 ; $0FB6FD   |
    LDA $B6A9,y         ; $0FB6FE   | table
    STA $1064           ; $0FB701   |
    LDA $B6B9,y         ; $0FB704   | table
    STA $1065           ; $0FB707   |
    LDA $1060           ; $0FB70A   |
    CMP #$9C            ; $0FB70D   |
    BNE CODE_0FB732     ; $0FB70F   |
    REP #$20            ; $0FB711   |
    LDA $70E2,x         ; $0FB713   |
    CLC                 ; $0FB716   |
    ADC #$0000          ; $0FB717   |
    STA $00             ; $0FB71A   |
    LDA $7182,x         ; $0FB71C   |
    CLC                 ; $0FB71F   |
    ADC #$0000          ; $0FB720   |
    STA $02             ; $0FB723   |
    JSL $02A982         ; $0FB725   |
    LDA #$FFFF          ; $0FB729   |
    JSL $02E1A6         ; $0FB72C   |
    SEP #$20            ; $0FB730   |

CODE_0FB732:
    RTS                 ; $0FB732   |

; state 0E
raphael_death_turn:
    TYX                 ; $0FB733   |
    JSR CODE_0FB40E     ; $0FB734   |
    LDA $1064           ; $0FB737   |
    CMP #$FE            ; $0FB73A   |
    BCS CODE_0FB744     ; $0FB73C   |
    INC $1064           ; $0FB73E   |
    INC $1064           ; $0FB741   |

CODE_0FB744:
    JSR CODE_0FB3EC     ; $0FB744   |
    LDA $105D           ; $0FB747   |
    AND #$FC            ; $0FB74A   |
    CMP #$D8            ; $0FB74C   |
    BNE CODE_0FB758     ; $0FB74E   |
    INC $105F           ; $0FB750   |
    LDA #$30            ; $0FB753   |
    STA $1061           ; $0FB755   |

CODE_0FB758:
    INC $D9,x           ; $0FB758   |
    INC $D9,x           ; $0FB75A   |
    LDA $0030           ; $0FB75C   |
    AND #$01            ; $0FB75F   |
    BNE CODE_0FB76D     ; $0FB761   |
    LDA $105C           ; $0FB763   |
    CMP #$60            ; $0FB766   |
    BEQ CODE_0FB76D     ; $0FB768   |
    INC $105C           ; $0FB76A   |

CODE_0FB76D:
    RTS                 ; $0FB76D   |

; state 0F
raphael_death_to_sky:
    TYX                 ; $0FB76E   |
    JSR CODE_0FB40E     ; $0FB76F   |
    JSR CODE_0FB758     ; $0FB772   |
    LDA $1064           ; $0FB775   |
    CMP #$40            ; $0FB778   |
    BEQ CODE_0FB785     ; $0FB77A   |
    SEC                 ; $0FB77C   |
    SBC #$01            ; $0FB77D   |
    STA $1064           ; $0FB77F   |
    STA $1065           ; $0FB782   |

CODE_0FB785:
    LDA $0030           ; $0FB785   |
    AND #$01            ; $0FB788   |
    BNE CODE_0FB794     ; $0FB78A   |
    LDA $76,x           ; $0FB78C   |
    CMP #$A0            ; $0FB78E   |
    BEQ CODE_0FB794     ; $0FB790   |
    INC $76,x           ; $0FB792   |

CODE_0FB794:
    JSR CODE_0FB3EC     ; $0FB794   |
    LDA $0030           ; $0FB797   |
    AND #$03            ; $0FB79A   |
    BNE CODE_0FB7A8     ; $0FB79C   |
    LDA $1066           ; $0FB79E   |
    CMP #$04            ; $0FB7A1   |
    BCC CODE_0FB7A8     ; $0FB7A3   |
    DEC $1066           ; $0FB7A5   |

CODE_0FB7A8:
    LDA $105D           ; $0FB7A8   |
    LDY $1061           ; $0FB7AB   |
    BNE CODE_0FB7BC     ; $0FB7AE   |
    AND #$FE            ; $0FB7B0   |
    CMP #$04            ; $0FB7B2   |
    BNE CODE_0FB7BC     ; $0FB7B4   |
    INC $105F           ; $0FB7B6   |
    STZ $1060           ; $0FB7B9   |

CODE_0FB7BC:
    RTS                 ; $0FB7BC   |

; state 10
raphael_death_twinkle:
    TYX                 ; $0FB7BD   |
    JSR CODE_0FB40E     ; $0FB7BE   |
    LDY #$01            ; $0FB7C1   |
    JSR CODE_0FB1AF     ; $0FB7C3   |
    LDA $1060           ; $0FB7C6   |
    BEQ CODE_0FB7D4     ; $0FB7C9   |
    CMP #$01            ; $0FB7CB   |
    BEQ CODE_0FB81B     ; $0FB7CD   |
    CMP #$08            ; $0FB7CF   |
    BEQ CODE_0FB7E9     ; $0FB7D1   |
    RTS                 ; $0FB7D3   |

CODE_0FB7D4:
    LDA $76,x           ; $0FB7D4   |
    CMP #$FF            ; $0FB7D6   |
    BEQ CODE_0FB7DF     ; $0FB7D8   |
    INC $76,x           ; $0FB7DA   |
    INC $D9,x           ; $0FB7DC   |
    RTS                 ; $0FB7DE   |

CODE_0FB7DF:
    LDA #$30            ; $0FB7DF   |
    STA $1060           ; $0FB7E1   |
    LDA #$80            ; $0FB7E4   |
    STA $D9,x           ; $0FB7E6   |
    RTS                 ; $0FB7E8   |

CODE_0FB7E9:
    REP #$20            ; $0FB7E9   |
    LDA #$021F          ; $0FB7EB   |
    JSL $008B21         ; $0FB7EE   |
    LDA #$0005          ; $0FB7F2   |
    STA $73C2,y         ; $0FB7F5   |
    LDA #$0004          ; $0FB7F8   |
    STA $7782,y         ; $0FB7FB   |
    LDA $70E2,x         ; $0FB7FE   |
    SEC                 ; $0FB801   |
    SBC #$FFFE          ; $0FB802   |
    STA $70A2,y         ; $0FB805   |
    LDA $7182,x         ; $0FB808   |
    SEC                 ; $0FB80B   |
    SBC #$0004          ; $0FB80C   |
    STA $7142,y         ; $0FB80F   |
    SEP #$20            ; $0FB812   |
    LDA #$18            ; $0FB814   |\ play sound #$18
    JSL $0085D2         ; $0FB816   |/
    RTS                 ; $0FB81A   |

CODE_0FB81B:
    LDA #$02            ; $0FB81B   |
    STA $16,x           ; $0FB81D   |
    LDA #$A0            ; $0FB81F   |
    STA $1064           ; $0FB821   |
    STA $1065           ; $0FB824   |
    INC $105F           ; $0FB827   |
    LDA #$50            ; $0FB82A   |
    STA $1060           ; $0FB82C   |
    STZ $7042,x         ; $0FB82F   |
    RTS                 ; $0FB832   |

; state 11
raphael_death_twinkle_fade:
    TYX                 ; $0FB833   |
    JSR CODE_0FB40E     ; $0FB834   |
    LDY #$01            ; $0FB837   |
    JSR CODE_0FB1AF     ; $0FB839   |
    LDA $1060           ; $0FB83C   |
    BNE CODE_0FB84C     ; $0FB83F   |
    LDA #$05            ; $0FB841   |
    STA $16,x           ; $0FB843   |
    STZ $76,x           ; $0FB845   |
    STZ $77,x           ; $0FB847   |
    INC $105F           ; $0FB849   |

CODE_0FB84C:
    RTS                 ; $0FB84C   |

; state 12
raphael_death_star:
    TYX                 ; $0FB84D   |
    JSR CODE_0FB40E     ; $0FB84E   |
    JSR CODE_0FB881     ; $0FB851   |
    LDA $76,x           ; $0FB854   |
    CLC                 ; $0FB856   |
    ADC #$08            ; $0FB857   |
    STA $76,x           ; $0FB859   |
    BEQ CODE_0FB85E     ; $0FB85B   |
    RTS                 ; $0FB85D   |

CODE_0FB85E:
    INC $105F           ; $0FB85E   |
    STZ $76,x           ; $0FB861   |
    STZ $77,x           ; $0FB863   |
    RTS                 ; $0FB865   |

; state 13
raphael_constellation:
    TYX                 ; $0FB866   |
    JSR CODE_0FB40E     ; $0FB867   |
    JSR CODE_0FB8AE     ; $0FB86A   |
    LDA $76,x           ; $0FB86D   |
    CMP #$FE            ; $0FB86F   |
    BEQ CODE_0FB878     ; $0FB871   |
    INC $76,x           ; $0FB873   |
    INC $76,x           ; $0FB875   |
    RTS                 ; $0FB877   |

CODE_0FB878:
    INC $105F           ; $0FB878   |
    LDA #$02            ; $0FB87B   |
    STA $7A96,x         ; $0FB87D   |
    RTS                 ; $0FB880   |

; raphael sub

CODE_0FB881:
    REP #$20            ; $0FB881   |
    LDA #$24A0          ; $0FB883   |
    STA $3002           ; $0FB886   |
    LDA #$5FFF          ; $0FB889   |
    STA $3004           ; $0FB88C   |
    LDA $76,x           ; $0FB88F   |
    INC A               ; $0FB891   |
    STA $300C           ; $0FB892   |
    LDX #$08            ; $0FB895   |
    LDA #$E132          ; $0FB897   |
    JSL $7EDE44         ; $0FB89A   | GSU init
    LDX $12             ; $0FB89E   |
    LDA $3006           ; $0FB8A0   |
    STA $702DEA         ; $0FB8A3   |
    STA $70207E         ; $0FB8A7   |
    SEP #$20            ; $0FB8AB   |
    RTS                 ; $0FB8AD   |

; raphael sub

CODE_0FB8AE:
    REP #$20            ; $0FB8AE   |
    LDA #$24A0          ; $0FB8B0   |
    STA $3002           ; $0FB8B3   |
    LDA #$7E60          ; $0FB8B6   |
    STA $3004           ; $0FB8B9   |
    LDA $76,x           ; $0FB8BC   |
    INC A               ; $0FB8BE   |
    STA $300C           ; $0FB8BF   |
    LDX #$08            ; $0FB8C2   |
    LDA #$E132          ; $0FB8C4   |
    JSL $7EDE44         ; $0FB8C7   | GSU init
    LDX $12             ; $0FB8CB   |
    LDA $3006           ; $0FB8CD   |
    STA $702DE8         ; $0FB8D0   |
    STA $70207C         ; $0FB8D4   |
    SEP #$20            ; $0FB8D8   |
    RTS                 ; $0FB8DA   |

; state 14
raphael_final:
    TYX                 ; $0FB8DB   |
    LDA $7A96,x         ; $0FB8DC   |
    BNE CODE_0FB8EF     ; $0FB8DF   |
    REP #$20            ; $0FB8E1   |
    LDA #$0005          ; $0FB8E3   |
    STA $004D           ; $0FB8E6   |
    JSL $02E191         ; $0FB8E9   |
    SEP #$20            ; $0FB8ED   |

CODE_0FB8EF:
    RTS                 ; $0FB8EF   |

; l sub
    PHB                 ; $0FB8F0   |
    PHK                 ; $0FB8F1   |
    PLB                 ; $0FB8F2   |
    JSR CODE_0FB8F8     ; $0FB8F3   |
    PLB                 ; $0FB8F6   |
    RTL                 ; $0FB8F7   |

; sub

CODE_0FB8F8:
    LDA $00             ; $0FB8F8   |
    CLC                 ; $0FB8FA   |
    ADC $0D05           ; $0FB8FB   |
    CLC                 ; $0FB8FE   |
    ADC #$80            ; $0FB8FF   |
    STA $0C             ; $0FB901   |
    BRA CODE_0FB91A     ; $0FB903   |

; raphael sub

CODE_0FB905:
    LDA $105D           ; $0FB905   |
    CLC                 ; $0FB908   |
    ADC $0D05           ; $0FB909   |
    CLC                 ; $0FB90C   |
    ADC #$80            ; $0FB90D   |
    STA $0C             ; $0FB90F   |
    PHA                 ; $0FB911   |
    CLC                 ; $0FB912   |
    ADC $7A39,x         ; $0FB913   |
    STA $105E           ; $0FB916   |
    PLA                 ; $0FB919   |

CODE_0FB91A:
    LSR A               ; $0FB91A   |
    LSR A               ; $0FB91B   |
    LSR A               ; $0FB91C   |
    LSR A               ; $0FB91D   |
    LSR A               ; $0FB91E   |
    AND #$06            ; $0FB91F   |
    TAX                 ; $0FB921   |
    JMP ($B925,x)       ; $0FB922   | routine in address table

; routine address table
DATA_0FB925:         dw $B92D
DATA_0FB927:         dw $B973
DATA_0FB929:         dw $B9BC
DATA_0FB92B:         dw $BA08

; raphael table sub
    LDA $0C             ; $0FB92D   |
    AND #$3F            ; $0FB92F   |
    TAY                 ; $0FB931   |
    LDA $BA89,y         ; $0FB932   |
    STA $4202           ; $0FB935   |
    LDA $0E             ; $0FB938   |
    STA $4203           ; $0FB93A   |
    NOP                 ; $0FB93D   |
    NOP                 ; $0FB93E   |
    NOP                 ; $0FB93F   |
    NOP                 ; $0FB940   |
    LDA $4217           ; $0FB941   |
    ASL $4216           ; $0FB944   |
    ADC #$00            ; $0FB947   |
    STA $00             ; $0FB949   |
    LDA $0C             ; $0FB94B   |
    AND #$3F            ; $0FB94D   |
    STA $0F             ; $0FB94F   |
    LDA #$40            ; $0FB951   |
    SEC                 ; $0FB953   |
    SBC $0F             ; $0FB954   |
    TAY                 ; $0FB956   |
    LDA $BA89,y         ; $0FB957   |
    STA $4202           ; $0FB95A   |
    LDA $0E             ; $0FB95D   |
    STA $4203           ; $0FB95F   |
    NOP                 ; $0FB962   |
    NOP                 ; $0FB963   |
    NOP                 ; $0FB964   |
    NOP                 ; $0FB965   |
    LDA $4217           ; $0FB966   |
    ASL $4216           ; $0FB969   |
    ADC #$00            ; $0FB96C   |
    STA $02             ; $0FB96E   |
    JMP CODE_0FBA51     ; $0FB970   |

; raphael table sub
    LDA $0C             ; $0FB973   |
    AND #$3F            ; $0FB975   |
    TAY                 ; $0FB977   |
    LDA $BA89,y         ; $0FB978   |
    STA $4202           ; $0FB97B   |
    LDA $0E             ; $0FB97E   |
    STA $4203           ; $0FB980   |
    NOP                 ; $0FB983   |
    NOP                 ; $0FB984   |
    NOP                 ; $0FB985   |
    NOP                 ; $0FB986   |
    LDA $4217           ; $0FB987   |
    ASL $4216           ; $0FB98A   |
    ADC #$00            ; $0FB98D   |
    STA $02             ; $0FB98F   |
    LDA $0C             ; $0FB991   |
    AND #$3F            ; $0FB993   |
    STA $0F             ; $0FB995   |
    LDA #$40            ; $0FB997   |
    SEC                 ; $0FB999   |
    SBC $0F             ; $0FB99A   |
    TAY                 ; $0FB99C   |
    LDA $BA89,y         ; $0FB99D   |
    STA $4202           ; $0FB9A0   |
    LDA $0E             ; $0FB9A3   |
    STA $4203           ; $0FB9A5   |
    NOP                 ; $0FB9A8   |
    NOP                 ; $0FB9A9   |
    NOP                 ; $0FB9AA   |
    NOP                 ; $0FB9AB   |
    LDA $4217           ; $0FB9AC   |
    ASL $4216           ; $0FB9AF   |
    ADC #$00            ; $0FB9B2   |
    EOR #$FF            ; $0FB9B4   |
    INC A               ; $0FB9B6   |
    STA $00             ; $0FB9B7   |
    JMP CODE_0FBA51     ; $0FB9B9   |

; raphael table sub
    LDA $0C             ; $0FB9BC   |
    AND #$3F            ; $0FB9BE   |
    TAY                 ; $0FB9C0   |
    LDA $BA89,y         ; $0FB9C1   |
    STA $4202           ; $0FB9C4   |
    LDA $0E             ; $0FB9C7   |
    STA $4203           ; $0FB9C9   |
    NOP                 ; $0FB9CC   |
    NOP                 ; $0FB9CD   |
    NOP                 ; $0FB9CE   |
    NOP                 ; $0FB9CF   |
    LDA $4217           ; $0FB9D0   |
    ASL $4216           ; $0FB9D3   |
    ADC #$00            ; $0FB9D6   |
    EOR #$FF            ; $0FB9D8   |
    INC A               ; $0FB9DA   |
    STA $00             ; $0FB9DB   |
    LDA $0C             ; $0FB9DD   |
    AND #$3F            ; $0FB9DF   |
    STA $0F             ; $0FB9E1   |
    LDA #$40            ; $0FB9E3   |
    SEC                 ; $0FB9E5   |
    SBC $0F             ; $0FB9E6   |
    TAY                 ; $0FB9E8   |
    LDA $BA89,y         ; $0FB9E9   |
    STA $4202           ; $0FB9EC   |
    LDA $0E             ; $0FB9EF   |
    STA $4203           ; $0FB9F1   |
    NOP                 ; $0FB9F4   |
    NOP                 ; $0FB9F5   |
    NOP                 ; $0FB9F6   |
    NOP                 ; $0FB9F7   |
    LDA $4217           ; $0FB9F8   |
    ASL $4216           ; $0FB9FB   |
    ADC #$00            ; $0FB9FE   |
    EOR #$FF            ; $0FBA00   |
    INC A               ; $0FBA02   |
    STA $02             ; $0FBA03   |
    JMP CODE_0FBA51     ; $0FBA05   |

; raphael table sub
    LDA $0C             ; $0FBA08   |
    AND #$3F            ; $0FBA0A   |
    TAY                 ; $0FBA0C   |
    LDA $BA89,y         ; $0FBA0D   |
    STA $4202           ; $0FBA10   |
    LDA $0E             ; $0FBA13   |
    STA $4203           ; $0FBA15   |
    NOP                 ; $0FBA18   |
    NOP                 ; $0FBA19   |
    NOP                 ; $0FBA1A   |
    NOP                 ; $0FBA1B   |
    LDA $4217           ; $0FBA1C   |
    ASL $4216           ; $0FBA1F   |
    ADC #$00            ; $0FBA22   |
    EOR #$FF            ; $0FBA24   |
    INC A               ; $0FBA26   |
    STA $02             ; $0FBA27   |
    LDA $0C             ; $0FBA29   |
    AND #$3F            ; $0FBA2B   |
    STA $0F             ; $0FBA2D   |
    LDA #$40            ; $0FBA2F   |
    SEC                 ; $0FBA31   |
    SBC $0F             ; $0FBA32   |
    TAY                 ; $0FBA34   |
    LDA $BA89,y         ; $0FBA35   |
    STA $4202           ; $0FBA38   |
    LDA $0E             ; $0FBA3B   |
    STA $4203           ; $0FBA3D   |
    NOP                 ; $0FBA40   |
    NOP                 ; $0FBA41   |
    NOP                 ; $0FBA42   |
    NOP                 ; $0FBA43   |
    LDA $4217           ; $0FBA44   |
    ASL $4216           ; $0FBA47   |
    ADC #$00            ; $0FBA4A   |
    STA $00             ; $0FBA4C   |
    JMP CODE_0FBA51     ; $0FBA4E   |

; raphael: continuing $B905 sub after table jump

CODE_0FBA51:
    LDX $12             ; $0FBA51   |
    STZ $01             ; $0FBA53   |
    LDA $00             ; $0FBA55   |
    BPL CODE_0FBA5B     ; $0FBA57   |
    DEC $01             ; $0FBA59   |

CODE_0FBA5B:
    STZ $03             ; $0FBA5B   |
    LDA $02             ; $0FBA5D   |
    BPL CODE_0FBA63     ; $0FBA5F   |
    DEC $03             ; $0FBA61   |

CODE_0FBA63:
    LDA $7360,x         ; $0FBA63   | \
    CMP #$3C            ; $0FBA66   |  | if tap-tap, return
    BEQ CODE_0FBA88     ; $0FBA68   | /
    REP #$20            ; $0FBA6A   |
    LDA $00             ; $0FBA6C   |
    CLC                 ; $0FBA6E   |
    ADC #$0118          ; $0FBA6F   |
    STA $7182,x         ; $0FBA72   |
    LDA $60AC           ; $0FBA75   |
    CMP #$0020          ; $0FBA78   |
    BEQ CODE_0FBA86     ; $0FBA7B   |
    LDA $02             ; $0FBA7D   |
    CLC                 ; $0FBA7F   |
    ADC $608C           ; $0FBA80   |
    STA $70E2,x         ; $0FBA83   |

CODE_0FBA86:
    SEP #$20            ; $0FBA86   |

CODE_0FBA88:
    RTS                 ; $0FBA88   |

; boss multiplicand table
DATA_0FBA89:         db $FF, $FF, $FF, $FF, $FE
DATA_0FBA8E:         db $FE, $FD, $FC, $FB, $FA
DATA_0FBA93:         db $F8, $F7, $F5, $F3, $F1
DATA_0FBA98:         db $EF, $ED, $EA, $E7, $E5
DATA_0FBA9D:         db $E2, $DF, $DC, $D8, $D5
DATA_0FBAA2:         db $D1, $CE, $CA, $C6, $C2
DATA_0FBAA7:         db $BE, $B9, $B5, $B1, $AC
DATA_0FBAAC:         db $A7, $A2, $9D, $98, $93
DATA_0FBAB1:         db $8E, $89, $84, $7E, $79
DATA_0FBAB6:         db $73, $6D, $68, $62, $5C
DATA_0FBABB:         db $56, $50, $4A, $44, $3E
DATA_0FBAC0:         db $38, $32, $2C, $26, $1F
DATA_0FBAC5:         db $19, $13, $0D, $06, $00

DATA_0FBACA:         dw $C089
DATA_0FBACC:         dw $C089
DATA_0FBACE:         dw $C089
DATA_0FBAD0:         dw $C1C7
DATA_0FBAD2:         dw $C8EB
DATA_0FBAD4:         dw $C8E1
DATA_0FBAD6:         dw $C8E6
DATA_0FBAD8:         dw $C99E
DATA_0FBADA:         dw $CA26
DATA_0FBADC:         dw $CA9A
DATA_0FBADE:         dw $CAF3
DATA_0FBAE0:         dw $CA8A
DATA_0FBAE2:         dw $D56E
DATA_0FBAE4:         dw $D8D5
DATA_0FBAE6:         dw $D966
DATA_0FBAE8:         dw $DB30
DATA_0FBAEA:         dw $DBD5
DATA_0FBAEC:         dw $DBEE
DATA_0FBAEE:         dw $DD42
DATA_0FBAF0:         dw $DF52
DATA_0FBAF2:         dw $DF8E
DATA_0FBAF4:         dw $E01D
DATA_0FBAF6:         dw $C094
DATA_0FBAF8:         dw $C162
DATA_0FBAFA:         dw $C1AF
DATA_0FBAFC:         dw $C21A
DATA_0FBAFE:         dw $C8F4
DATA_0FBB00:         dw $C8F4
DATA_0FBB02:         dw $C8F4
DATA_0FBB04:         dw $C9A3
DATA_0FBB06:         dw $CA2C
DATA_0FBB08:         dw $CAB2
DATA_0FBB0A:         dw $CAF8
DATA_0FBB0C:         dw $CAD3
DATA_0FBB0E:         dw $D57D
DATA_0FBB10:         dw $D8F4
DATA_0FBB12:         dw $D973
DATA_0FBB14:         dw $DB43
DATA_0FBB16:         dw $DBD5
DATA_0FBB18:         dw $DC6A
DATA_0FBB1A:         dw $DD61
DATA_0FBB1C:         dw $DF65
DATA_0FBB1E:         dw $DFDF
DATA_0FBB20:         dw $E01E

DATA_0FBB22:         dw $5801, $5801, $4801, $6001
DATA_0FBB2A:         dw $3001, $1001, $0800, $8001
DATA_0FBB32:         dw $4001, $0804, $8001, $2005
DATA_0FBB3A:         dw $4001, $0800, $2001, $2001
DATA_0FBB42:         dw $2005, $5001, $2005, $2005
DATA_0FBB4A:         dw $6005, $2001, $2000, $2001
DATA_0FBB52:         dw $2001, $1005, $1004, $1006
DATA_0FBB5A:         dw $1007, $12FF, $1005, $1005
DATA_0FBB62:         dw $14FF, $1005, $2007, $2206
DATA_0FBB6A:         dw $2406, $2AFF, $2004, $1004
DATA_0FBB72:         dw $1E04, $1003, $1004, $1E04

.gamemode13
    JSL $008277         ; $0FBB7A   |
    JSL $00831C         ; $0FBB7E   |
    JSL $0394B8         ; $0FBB82   |
    REP #$10            ; $0FBB86   |
    LDY #$006E          ; $0FBB88   |
    JSL $00B3EE         ; $0FBB8B   |
    REP #$30            ; $0FBB8F   |
    LDA #$0000          ; $0FBB91   |
    STA $702000         ; $0FBB94   |
    LDX #$004A          ; $0FBB98   |
    JSL $00BB05         ; $0FBB9B   | load palettes
    LDX #$02            ; $0FBB9F   |
    JSL $00BDA2         ; $0FBBA1   |
    LDA #$10            ; $0FBBA5   |
    STA $0967           ; $0FBBA7   |
    STA $212C           ; $0FBBAA   |
    JSL $01B27B         ; $0FBBAD   |
    REP #$20            ; $0FBBB1   |
    LDA #$022F          ; $0FBBB3   |
    JSR CODE_0FBFD9     ; $0FBBB6   |
    LDA #$0070          ; $0FBBB9   |
    STA $70E2,y         ; $0FBBBC   |
    LDA #$0080          ; $0FBBBF   |
    STA $7182,y         ; $0FBBC2   |
    LDA #$0020          ; $0FBBC5   |
    STA $7A96,y         ; $0FBBC8   |
    LDA #$0008          ; $0FBBCB   |
    STA $7A98,y         ; $0FBBCE   |
    LDA #$0230          ; $0FBBD1   |
    JSR CODE_0FBFD9     ; $0FBBD4   |
    LDA #$001C          ; $0FBBD7   |
    STA $6F00,y         ; $0FBBDA   |
    LDA #$0062          ; $0FBBDD   |
    STA $70E2,y         ; $0FBBE0   |
    LDA #$0071          ; $0FBBE3   |
    STA $7182,y         ; $0FBBE6   |
    LDA #$0002          ; $0FBBE9   |
    STA $7A98,y         ; $0FBBEC   |
    LDA #$0230          ; $0FBBEF   |
    JSR CODE_0FBFD9     ; $0FBBF2   |
    LDA #$001C          ; $0FBBF5   |
    STA $6F00,y         ; $0FBBF8   |
    LDA #$0098          ; $0FBBFB   |
    STA $70E2,y         ; $0FBBFE   |
    LDA #$006F          ; $0FBC01   |
    STA $7182,y         ; $0FBC04   |
    LDA #$0002          ; $0FBC07   |
    STA $7400,y         ; $0FBC0A   |
    LDA #$0004          ; $0FBC0D   |
    STA $7A98,y         ; $0FBC10   |
    LDA #$0230          ; $0FBC13   |
    JSR CODE_0FBFD9     ; $0FBC16   |
    LDA #$001C          ; $0FBC19   |
    STA $6F00,y         ; $0FBC1C   |
    LDA #$008A          ; $0FBC1F   |
    STA $70E2,y         ; $0FBC22   |
    LDA #$007E          ; $0FBC25   |
    STA $7182,y         ; $0FBC28   |
    LDA #$0002          ; $0FBC2B   |
    STA $7400,y         ; $0FBC2E   |
    LDA #$0006          ; $0FBC31   |
    STA $7A98,y         ; $0FBC34   |
    LDA #$0231          ; $0FBC37   |
    JSR CODE_0FBFD9     ; $0FBC3A   |
    LDA #$001C          ; $0FBC3D   |
    STA $6F00,y         ; $0FBC40   |
    LDA #$0080          ; $0FBC43   |
    STA $70E2,y         ; $0FBC46   |
    LDA #$0060          ; $0FBC49   |
    STA $7182,y         ; $0FBC4C   |
    LDA #$0006          ; $0FBC4F   |
    STA $7A98,y         ; $0FBC52   |
    SEP #$20            ; $0FBC55   |
    JSL $0FBC63         ; $0FBC57   |
    LDA #$F0            ; $0FBC5B   |
    STA $4D             ; $0FBC5D   |
    JMP CODE_0F1083     ; $0FBC5F   |

    PHB                 ; $0FBC63   |
    PHK                 ; $0FBC64   |
    PLB                 ; $0FBC65   |

.gamemode15
    JSL $008259         ; $0FBC66   |
    JSL $0394CF         ; $0FBC6A   |
    JSL $0FBF39         ; $0FBC6E   |
    REP #$20            ; $0FBC72   |
    LDX #$08            ; $0FBC74   |
    LDA #$B1EF          ; $0FBC76   |
    JSL $7EDE44         ; $0FBC79   | GSU init
    LDA $0B4C           ; $0FBC7D   |
    BEQ CODE_0FBC9A     ; $0FBC80   |
    LDA $0379           ; $0FBC82   |
    BNE CODE_0FBC8E     ; $0FBC85   |
    STZ $0B4C           ; $0FBC87   |
    LDX #$3F            ; $0FBC8A   |
    BRA CODE_0FBC97     ; $0FBC8C   |

CODE_0FBC8E:
    LDX #$3A            ; $0FBC8E   |
    LDA $03AC           ; $0FBC90   |
    BEQ CODE_0FBC97     ; $0FBC93   |
    LDX #$32            ; $0FBC95   |

CODE_0FBC97:
    STX $0118           ; $0FBC97   |

CODE_0FBC9A:
    SEP #$20            ; $0FBC9A   |
    PLB                 ; $0FBC9C   |
    RTL                 ; $0FBC9D   |

DATA_0FBC9E:         dw $6400, $47FF, $03FF, $6C00
DATA_0FBCA6:         dw $47FF, $03FF, $7C00, $47FF
DATA_0FBCAE:         dw $0130, $3FF0, $401F, $0000
DATA_0FBCB6:         dw $FFFF

DATA_0FBCB8:         db $00, $05, $18, $5B, $7E

DATA_0FBCBD:         db $46, $09, $46, $09, $01, $00, $00, $00

DATA_0FBCC5:         db $01, $2C, $98, $5B, $7E

DATA_0FBCCA:         db $46, $15, $02, $46, $15, $02, $01, $08
DATA_0FBCD2:         db $00, $00

DATA_0FBCD4:         db $44, $26, $18, $5C, $7E

DATA_0FBCD9:         db $12, $E4, $51, $F0, $EC, $51, $10, $E4
DATA_0FBCE1:         db $51, $28, $E8, $51, $01, $E4, $51, $00

DATA_0FBCE9:         db $42, $0F, $98, $5C, $7E

DATA_0FBCEE:         db $24, $40, $50, $3D, $40, $50, $98, $42
DATA_0FBCF6:         db $50, $01, $40, $50, $00

DATA_0FBCFB:         db $42, $0F, $18, $5D, $7E

DATA_0FBD00:         db $29, $40, $50, $40, $42, $50, $01, $3D
DATA_0FBD08:         db $00, $00

DATA_0FBD0A:         dw $0232, $0088, $0058, $0000

DATA_0FBD12:         dw $0233, $0010, $0050, $0233
DATA_0FBD1A:         dw $00B0, $0078, $0233, $0050
DATA_0FBD22:         dw $0068, $0233, $00E0, $0080

DATA_0FBD2A:         dw $0234, $0010, $0058, $0234
DATA_0FBD32:         dw $0010, $00A8, $0234, $0050
DATA_0FBD3A:         dw $0078, $0234, $0060, $0048

DATA_0FBD42:         dw $0234, $0088, $0068, $0234
DATA_0FBD4A:         dw $00A8, $0050, $0234, $00D8
DATA_0FBD52:         dw $0030, $0234, $00E0, $006C

DATA_0FBD5A:         dw $0235, $0010, $0068, $0235
DATA_0FBD62:         dw $0018, $0040, $0235, $0040
DATA_0FBD6A:         dw $0068, $0235, $0050, $007C

DATA_0FBD72:         dw $0235, $0058, $0038, $0235
DATA_0FBD7A:         dw $0080, $0076, $0235, $00A8
DATA_0FBD82:         dw $0078, $0235, $00D0, $0070
DATA_0FBD8A:         dw $0000

DATA_0FBD8C:         dw $0236, $00B8, $0040, $0000

DATA_0FBD94:         dw $0237, $0600, $0038, $0000

DATA_0FBD9C:         dw $0239, $0078, $0050, $0000

DATA_0FBDA4:         dw $023B, $0140, $0070, $0000
DATA_0FBDAC:         dw $0000

DATA_0FBDAE:         dw $0240, $0050, $0082, $0000

DATA_0FBDB6:         dw $0243, $0080, $0070, $0000

.gamemod05
    JSL $0082D0         ; $0FBDBE   |
    JSL $008277         ; $0FBDC2   |
    JSL $00831C         ; $0FBDC6   |
    JSL $0394B8         ; $0FBDCA   |
    REP #$10            ; $0FBDCE   |
    LDY #$0079          ; $0FBDD0   |
    JSL $00B3EE         ; $0FBDD3   |
    LDA #$15            ; $0FBDD7   |
    STA $0127           ; $0FBDD9   |
    JSL $00E37B         ; $0FBDDC   |
    REP #$30            ; $0FBDE0   |
    LDX #$0050          ; $0FBDE2   |
    JSL $00BB05         ; $0FBDE5   |

    LDX #$24            ; $0FBDE9   |
    JSL $00BDA2         ; $0FBDEB   |
    LDA #$7C            ; $0FBDEF   |
    STA $210A           ; $0FBDF1   |
    LDA $012B           ; $0FBDF4   |
    BNE CODE_0FBDFE     ; $0FBDF7   |
    LDA #$02            ; $0FBDF9   |
    STA $004D           ; $0FBDFB   |

CODE_0FBDFE:
    LDX #$04            ; $0FBDFE   |

CODE_0FBE00:
    LDA $BCB8,x         ; $0FBE00   |
    STA $4370,x         ; $0FBE03   |
    LDA $BCC5,x         ; $0FBE06   |
    STA $4360,x         ; $0FBE09   |
    LDA $BCD4,x         ; $0FBE0C   |
    STA $4350,x         ; $0FBE0F   |
    LDA $BCE9,x         ; $0FBE12   |
    STA $4340,x         ; $0FBE15   |
    LDA $BCFB,x         ; $0FBE18   |
    STA $4330,x         ; $0FBE1B   |
    DEX                 ; $0FBE1E   |
    BPL CODE_0FBE00     ; $0FBE1F   |
    LDA #$7E            ; $0FBE21   |
    STA $4377           ; $0FBE23   |
    STA $4367           ; $0FBE26   |
    STA $4357           ; $0FBE29   |
    STA $4347           ; $0FBE2C   |
    STA $4337           ; $0FBE2F   |
    LDX #$14            ; $0FBE32   |

CODE_0FBE34:
    LDA $BCBD,x         ; $0FBE34   |
    STA $7E5B18,x       ; $0FBE37   |
    LDA $BCCA,x         ; $0FBE3B   |
    STA $7E5B98,x       ; $0FBE3E   |
    LDA $BCD9,x         ; $0FBE42   |
    STA $7E5C18,x       ; $0FBE45   |
    LDA $BCEE,x         ; $0FBE49   |
    STA $7E5C98,x       ; $0FBE4C   |
    LDA $BD00,x         ; $0FBE50   |
    STA $7E5D18,x       ; $0FBE53   |
    DEX                 ; $0FBE57   |
    BPL CODE_0FBE34     ; $0FBE58   |
    REP #$20            ; $0FBE5A   |
    LDA $7E5B99         ; $0FBE5C   |
    STA $1407           ; $0FBE60   |
    LDA #$00FF          ; $0FBE63   |
    STA $7E51E4         ; $0FBE66   |
    STA $7E51E6         ; $0FBE6A   |
    LDA #$FF00          ; $0FBE6E   |
    STA $7E51E8         ; $0FBE71   |
    STA $7E51EA         ; $0FBE75   |
    SEP #$20            ; $0FBE79   |
    LDA #$E0            ; $0FBE7B   |
    STA $094A           ; $0FBE7D   |
    JSL $00BE26         ; $0FBE80   | copy gsu 1/x table to $702200~$7025FF
    REP #$30            ; $0FBE84   |
    LDX #$BD0A          ; $0FBE86   |
    JSR CODE_0FBF14     ; $0FBE89   |
    JSL $0FBEB2         ; $0FBE8C   |
    LDA #$02            ; $0FBE90   |
    STA $0125           ; $0FBE92   |
    LDA #$50            ; $0FBE95   |
    STA $4207           ; $0FBE97   |
    LDA #$C6            ; $0FBE9A   |
    STA $4209           ; $0FBE9C   |
    LDA #$B1            ; $0FBE9F   |
    STA $4200           ; $0FBEA1   |
    REP #$20            ; $0FBEA4   |
    LDA #$3100          ; $0FBEA6   |
    STA $1405           ; $0FBEA9   |
    SEP #$20            ; $0FBEAC   |
    JMP CODE_0F1083     ; $0FBEAE   |

    PHB                 ; $0FBEB2   |
    PHK                 ; $0FBEB3   |
    PLB                 ; $0FBEB4   |
    JSR CODE_0FCB8A     ; $0FBEB5   |
    BRA CODE_0FBEE5     ; $0FBEB8   |

.gamemode07
    REP #$20            ; $0FBEBA   |
    DEC $1405           ; $0FBEBC   |
    SEP #$20            ; $0FBEBF   |
    LDA $1405           ; $0FBEC1   |
    ORA $1406           ; $0FBEC4   |
    BEQ CODE_0FBED3     ; $0FBEC7   |
    LDA $35             ; $0FBEC9   |
    AND #$C0            ; $0FBECB   |
    ORA $36             ; $0FBECD   |
    AND #$D0            ; $0FBECF   |
    BEQ CODE_0FBEE5     ; $0FBED1   |

CODE_0FBED3:
    INC $0118           ; $0FBED3   |
    LDA $012B           ; $0FBED6   |
    BNE CODE_0FBF12     ; $0FBED9   |
    LDA #$F1            ; $0FBEDB   |
    STA $004D           ; $0FBEDD   |
    STA $012B           ; $0FBEE0   |
    BRA CODE_0FBF12     ; $0FBEE3   |

CODE_0FBEE5:
    JSL $008259         ; $0FBEE5   | init OAM buffer
    JSR CODE_0FCC6F     ; $0FBEE9   |
    JSL $0FBF39         ; $0FBEEC   |
    JSL $0394CF         ; $0FBEF0   |
    REP #$20            ; $0FBEF4   |
    LDA $094B           ; $0FBEF6   |
    AND #$00E0          ; $0FBEF9   |
    BEQ CODE_0FBF07     ; $0FBEFC   |
    LDX #$08            ; $0FBEFE   |
    LDA #$9067          ; $0FBF00   |
    JSL $7EDE44         ; $0FBF03   | GSU init

CODE_0FBF07:
    LDX #$08            ; $0FBF07   |
    LDA #$B1EF          ; $0FBF09   |
    JSL $7EDE44         ; $0FBF0C   | GSU init
    SEP #$20            ; $0FBF10   |

CODE_0FBF12:
    PLB                 ; $0FBF12   |
    RTL                 ; $0FBF13   |

CODE_0FBF14:
    LDA $0000,x         ; $0FBF14   |
    BEQ CODE_0FBF36     ; $0FBF17   |
    PHX                 ; $0FBF19   |
    SEP #$10            ; $0FBF1A   |
    JSR CODE_0FBFCD     ; $0FBF1C   |
    REP #$10            ; $0FBF1F   |
    PLX                 ; $0FBF21   |
    LDA $0002,x         ; $0FBF22   |
    STA $70E2,y         ; $0FBF25   |
    LDA $0004,x         ; $0FBF28   |
    STA $7182,y         ; $0FBF2B   |
    TXA                 ; $0FBF2E   |
    CLC                 ; $0FBF2F   |
    ADC #$0006          ; $0FBF30   |
    TAX                 ; $0FBF33   |
    BRA CODE_0FBF14     ; $0FBF34   |

CODE_0FBF36:
    SEP #$30            ; $0FBF36   |
    RTS                 ; $0FBF38   |

    PHB                 ; $0FBF39   |
    PHK                 ; $0FBF3A   |
    PLB                 ; $0FBF3B   |
    PHD                 ; $0FBF3C   |
    REP #$20            ; $0FBF3D   |
    LDA #$7960          ; $0FBF3F   |
    TCD                 ; $0FBF42   |
    INC $14             ; $0FBF43   |
    LDX #$09            ; $0FBF45   |
    LDA #$884C          ; $0FBF47   |
    JSL $7EDE44         ; $0FBF4A   | GSU init
    LDX #$5C            ; $0FBF4E   |

CODE_0FBF50:
    STX $12             ; $0FBF50   |
    LDY $2137           ; $0FBF52   |
    LDY $213F           ; $0FBF55   |
    LDA $213C           ; $0FBF58   |
    CLC                 ; $0FBF5B   |
    ADC $7970           ; $0FBF5C   |
    STA $7970           ; $0FBF5F   |
    JSR CODE_0FBF70     ; $0FBF62   |
    DEX                 ; $0FBF65   |
    DEX                 ; $0FBF66   |
    DEX                 ; $0FBF67   |
    DEX                 ; $0FBF68   |
    BPL CODE_0FBF50     ; $0FBF69   |
    SEP #$20            ; $0FBF6B   |
    PLD                 ; $0FBF6D   |
    PLB                 ; $0FBF6E   |
    RTL                 ; $0FBF6F   |

CODE_0FBF70:
    LDA $6F00,x         ; $0FBF70   |
    BEQ CODE_0FBF7F     ; $0FBF73   |
    JSR CODE_0FBF84     ; $0FBF75   |
    LDY $6F00,x         ; $0FBF78   |
    LDA $BF66,y         ; $0FBF7B   |
    PHA                 ; $0FBF7E   |

CODE_0FBF7F:
    RTS                 ; $0FBF7F   |

DATA_0FBF80:         dw $BFA4
DATA_0FBF82:         dw $BFBB

CODE_0FBF84:
    LDA $7A96,x         ; $0FBF84   |
    BEQ CODE_0FBF8C     ; $0FBF87   |
    DEC $7A96,x         ; $0FBF89   |

CODE_0FBF8C:
    LDA $7A98,x         ; $0FBF8C   |
    BEQ CODE_0FBF94     ; $0FBF8F   |
    DEC $7A98,x         ; $0FBF91   |

CODE_0FBF94:
    LDA $7AF6,x         ; $0FBF94   |
    BEQ CODE_0FBF9C     ; $0FBF97   |
    DEC $7AF6,x         ; $0FBF99   |

CODE_0FBF9C:
    LDA $7AF8,x         ; $0FBF9C   |
    BEQ CODE_0FBFA4     ; $0FBF9F   |
    DEC $7AF8,x         ; $0FBFA1   |

CODE_0FBFA4:
    RTS                 ; $0FBFA4   |

    LDA #$001C          ; $0FBFA5   |
    STA $6F00,x         ; $0FBFA8   |
    LDA $7360,x         ; $0FBFAB   |
    ASL A               ; $0FBFAE   |
    REP #$10            ; $0FBFAF   |
    TAY                 ; $0FBFB1   |
    LDA $B66C,y         ; $0FBFB2   |
    STA $00             ; $0FBFB5   |
    SEP #$10            ; $0FBFB7   |
    JMP ($7960)         ; $0FBFB9   |

    LDA $7360,x         ; $0FBFBC   |
    ASL A               ; $0FBFBF   |
    REP #$10            ; $0FBFC0   |
    TAY                 ; $0FBFC2   |
    LDA $B698,y         ; $0FBFC3   |
    STA $00             ; $0FBFC6   |
    SEP #$10            ; $0FBFC8   |
    JMP ($7960)         ; $0FBFCA   |

CODE_0FBFCD:
    JSR CODE_0FBFD9     ; $0FBFCD   |
    BCC CODE_0FBFD8     ; $0FBFD0   |
    LDA #$02FF          ; $0FBFD2   |
    STA $74A0,y         ; $0FBFD5   |

CODE_0FBFD8:
    RTS                 ; $0FBFD8   |

CODE_0FBFD9:
    PHA                 ; $0FBFD9   |
    LDY #$5C            ; $0FBFDA   |

CODE_0FBFDC:
    LDA $6F00,y         ; $0FBFDC   |
    BEQ CODE_0FBFEA     ; $0FBFDF   |
    DEY                 ; $0FBFE1   |
    DEY                 ; $0FBFE2   |
    DEY                 ; $0FBFE3   |
    DEY                 ; $0FBFE4   |
    BPL CODE_0FBFDC     ; $0FBFE5   |
    PLA                 ; $0FBFE7   |
    CLC                 ; $0FBFE8   |
    RTS                 ; $0FBFE9   |

CODE_0FBFEA:
    LDA #$001A          ; $0FBFEA   |
    STA $6F00,y         ; $0FBFED   |
    LDA #$00FF          ; $0FBFF0   |
    STA $74A0,y         ; $0FBFF3   |
    LDA #$0000          ; $0FBFF6   |
    STA $7D96,y         ; $0FBFF9   |
    STA $7220,y         ; $0FBFFC   |
    STA $7222,y         ; $0FBFFF   |
    STA $7976,y         ; $0FC002   |
    STA $7400,y         ; $0FC005   |
    STA $70E0,y         ; $0FC008   |
    STA $7180,y         ; $0FC00B   |
    STA $7D36,y         ; $0FC00E   |
    STA $7978,y         ; $0FC011   |
    STA $79D6,y         ; $0FC014   |
    STA $79D8,y         ; $0FC017   |
    STA $7A36,y         ; $0FC01A   |
    STA $7A38,y         ; $0FC01D   |
    STA $7900,y         ; $0FC020   |
    STA $7902,y         ; $0FC023   |
    STA $7A96,y         ; $0FC026   |
    STA $7A98,y         ; $0FC029   |
    STA $7AF6,y         ; $0FC02C   |
    STA $7AF8,y         ; $0FC02F   |
    STA $7402,y         ; $0FC032   |
    STA $7860,y         ; $0FC035   |
    STA $6F02,y         ; $0FC038   |
    STA $7D38,y         ; $0FC03B   |
    STA $7680,y         ; $0FC03E   |
    STA $7682,y         ; $0FC041   |
    STA $7540,y         ; $0FC044   |
    STA $75E0,y         ; $0FC047   |
    STA $77C0,y         ; $0FC04A   |
    STA $7542,y         ; $0FC04D   |
    STA $75E2,y         ; $0FC050   |
    STA $6FA0,y         ; $0FC053   |
    STA $6FA2,y         ; $0FC056   |
    DEC A               ; $0FC059   |
    STA $7722,y         ; $0FC05A   |
    LDA #$1FFF          ; $0FC05D   |
    STA $7862,y         ; $0FC060   |
    PLA                 ; $0FC063   |
    STA $7360,y         ; $0FC064   |
    PHX                 ; $0FC067   |
    ASL A               ; $0FC068   |
    REP #$10            ; $0FC069   |
    TAX                 ; $0FC06B   |
    LDA $B6F1,x         ; $0FC06C   |
    AND #$00FF          ; $0FC06F   |
    STA $7042,y         ; $0FC072   |
    LDA $B6F0,x         ; $0FC075   |
    AND #$00FF          ; $0FC078   |
    STA $74A2,y         ; $0FC07B   |
    LDA $B6C4,x         ; $0FC07E   |
    STA $7040,y         ; $0FC081   |
    SEP #$10            ; $0FC084   |
    PLX                 ; $0FC086   |
    SEC                 ; $0FC087   |
    RTS                 ; $0FC088   |

    LDA #$0009          ; $0FC089   |
    STA $7AF6,y         ; $0FC08C   |
    RTS                 ; $0FC08F   |

DATA_0FC090:         dw $0030, $0000

    LDA $76,x           ; $0FC094   |
    DEC A               ; $0FC096   |
    BEQ CODE_0FC0C8     ; $0FC097   |
    DEC A               ; $0FC099   |
    BEQ CODE_0FC10C     ; $0FC09A   |
    DEC A               ; $0FC09C   |
    BEQ CODE_0FC0FE     ; $0FC09D   |
    LDA $7A96,x         ; $0FC09F   |
    BNE CODE_0FC0C5     ; $0FC0A2   |
    LDA #$0008          ; $0FC0A4   |
    STA $004D           ; $0FC0A7   |
    INC $76,x           ; $0FC0AA   |
    LDA $76,x           ; $0FC0AC   |
    ASL A               ; $0FC0AE   |
    TAY                 ; $0FC0AF   |
    LDA $C08E,y         ; $0FC0B0   |
    STA $7A96,x         ; $0FC0B3   |
    LDA #$0003          ; $0FC0B6   |
    STA $7402,x         ; $0FC0B9   |
    LDA #$000A          ; $0FC0BC   |
    STA $7A98,x         ; $0FC0BF   |
    JMP CODE_0FC17C     ; $0FC0C2   |

CODE_0FC0C5:
    JMP CODE_0FC162     ; $0FC0C5   |

CODE_0FC0C8:
    LDA $7A96,x         ; $0FC0C8   |
    BNE CODE_0FC0E1     ; $0FC0CB   |
    INC $76,x           ; $0FC0CD   |
    LDA #$0010          ; $0FC0CF   |
    STA $7A96,x         ; $0FC0D2   |
    LDA #$0008          ; $0FC0D5   |
    STA $7A98,x         ; $0FC0D8   |
    STZ $7402,x         ; $0FC0DB   |
    JMP CODE_0FC162     ; $0FC0DE   |

CODE_0FC0E1:
    LDA $7A98,x         ; $0FC0E1   |
    BNE CODE_0FC0FB     ; $0FC0E4   |
    LDA #$0003          ; $0FC0E6   |
    STA $7A98,x         ; $0FC0E9   |
    LDA $7402,x         ; $0FC0EC   |
    INC A               ; $0FC0EF   |
    CMP #$0005          ; $0FC0F0   |
    BCC CODE_0FC0F8     ; $0FC0F3   |
    LDA #$0003          ; $0FC0F5   |

CODE_0FC0F8:
    STA $7402,x         ; $0FC0F8   |

CODE_0FC0FB:
    JMP CODE_0FC17C     ; $0FC0FB   |

CODE_0FC0FE:
    LDA $7182,x         ; $0FC0FE   |
    CMP #$FFC0          ; $0FC101   |
    BPL CODE_0FC109     ; $0FC104   |
    INC $0B4C           ; $0FC106   |

CODE_0FC109:
    JMP CODE_0FC162     ; $0FC109   |

CODE_0FC10C:
    LDA $7A96,x         ; $0FC10C   |
    BNE CODE_0FC109     ; $0FC10F   |
    INC $76,x           ; $0FC111   |
    LDA #$FC00          ; $0FC113   |
    STA $75E2,x         ; $0FC116   |
    STA $762E           ; $0FC119   |
    STA $7632           ; $0FC11C   |
    STA $7636           ; $0FC11F   |
    STA $763A           ; $0FC122   |
    LDA #$0040          ; $0FC125   |
    STA $7542,x         ; $0FC128   |
    STA $758E           ; $0FC12B   |
    STA $7592           ; $0FC12E   |
    STA $7596           ; $0FC131   |
    STA $759A           ; $0FC134   |
    JMP CODE_0FC162     ; $0FC137   |

DATA_0FC13A:         dw $0001, $0001, $0002, $0002
DATA_0FC142:         dw $0003, $0002, $0002, $0001
DATA_0FC14A:         dw $FFFF, $FFFE, $FFFE, $FFFD
DATA_0FC152:         dw $FFFE, $FFFE, $FFFF, $FFFF

DATA_0FC15A:         dw $0CC4, $0CC6, $0CC8, $4CC6

CODE_0FC162:
    LDA $7A98,x         ; $0FC162   |
    BNE CODE_0FC17C     ; $0FC165   |
    LDA $7402,x         ; $0FC167   |
    INC A               ; $0FC16A   |
    CMP #$0003          ; $0FC16B   |
    BNE CODE_0FC173     ; $0FC16E   |
    LDA #$0000          ; $0FC170   |

CODE_0FC173:
    STA $7402,x         ; $0FC173   |
    LDA #$0008          ; $0FC176   |
    STA $7A98,x         ; $0FC179   |

CODE_0FC17C:
    LDA $14             ; $0FC17C   |
    AND #$0006          ; $0FC17E   |
    TAY                 ; $0FC181   |
    LDA $C15A,y         ; $0FC182   |
    REP #$10            ; $0FC185   |
    LDY $7362,x         ; $0FC187   |
    STA $6004,y         ; $0FC18A   |
    SEP #$10            ; $0FC18D   |

CODE_0FC18F:
    LDA $7AF6,x         ; $0FC18F   |
    BNE CODE_0FC1AE     ; $0FC192   |
    LDA #$0008          ; $0FC194   |
    STA $7AF6,x         ; $0FC197   |
    LDA $18,x           ; $0FC19A   |
    INC A               ; $0FC19C   |
    INC A               ; $0FC19D   |
    AND #$001F          ; $0FC19E   |
    STA $18,x           ; $0FC1A1   |
    TAY                 ; $0FC1A3   |
    LDA $7182,x         ; $0FC1A4   |
    CLC                 ; $0FC1A7   |
    ADC $C13A,y         ; $0FC1A8   |
    STA $7182,x         ; $0FC1AB   |

CODE_0FC1AE:
    RTS                 ; $0FC1AE   |

    LDA $7A98,x         ; $0FC1AF   |
    BNE CODE_0FC1C4     ; $0FC1B2   |
    LDA $7402,x         ; $0FC1B4   |
    INC A               ; $0FC1B7   |
    AND #$0001          ; $0FC1B8   |
    STA $7402,x         ; $0FC1BB   |
    LDA #$0006          ; $0FC1BE   |
    STA $7A98,x         ; $0FC1C1   |

CODE_0FC1C4:
    JMP CODE_0FC18F     ; $0FC1C4   |

    REP #$10            ; $0FC1C7   |
    LDX #$01FE          ; $0FC1C9   |

CODE_0FC1CC:
    LDA $702000,x       ; $0FC1CC   |
    STA $702D6C,x       ; $0FC1D0   |
    STA $702F6C,x       ; $0FC1D4   |
    DEX                 ; $0FC1D8   |
    DEX                 ; $0FC1D9   |
    BPL CODE_0FC1CC     ; $0FC1DA   |
    SEP #$10            ; $0FC1DC   |
    JSR CODE_0FC807     ; $0FC1DE   |
    LDA #$2D6C          ; $0FC1E1   |
    STA $70336E         ; $0FC1E4   |
    LDA #$2F6C          ; $0FC1E8   |
    STA $703370         ; $0FC1EB   |
    STZ $003B           ; $0FC1EF   |
    STZ $003F           ; $0FC1F2   |
    STZ $0039           ; $0FC1F5   |
    STZ $003D           ; $0FC1F8   |
    STZ $6094           ; $0FC1FB   |
    STZ $6096           ; $0FC1FE   |
    STZ $609C           ; $0FC201   |
    STZ $609E           ; $0FC204   |
    LDX #$00            ; $0FC207   |
    JSR CODE_0FC884     ; $0FC209   |
    LDX #$04            ; $0FC20C   |
    JSR CODE_0FC884     ; $0FC20E   |
    LDA #$0200          ; $0FC211   |
    STA $7AF8,x         ; $0FC214   |
    STZ $7900,x         ; $0FC217   |
    LDY $18,x           ; $0FC21A   |
    TYX                 ; $0FC21C   |
    JMP ($C220,x)       ; $0FC21D   |

DATA_0FC220:         dw $C232
DATA_0FC222:         dw $C267
DATA_0FC224:         dw $C34D
DATA_0FC226:         dw $C3C5
DATA_0FC228:         dw $C430
DATA_0FC22A:         dw $C4BD
DATA_0FC22C:         dw $C517
DATA_0FC22E:         dw $C57A
DATA_0FC230:         dw $C5D2

    LDX $12             ; $0FC232   |
    JSR CODE_0FC281     ; $0FC234   |
    JSR CODE_0FC253     ; $0FC237   |
    BNE CODE_0FC252     ; $0FC23A   |
    REP #$10            ; $0FC23C   |
    LDX #$BD12          ; $0FC23E   |
    JSR CODE_0FBF14     ; $0FC241   |
    REP #$20            ; $0FC244   |
    LDX $12             ; $0FC246   |
    LDA #$0500          ; $0FC248   |
    STA $7AF8,x         ; $0FC24B   |

CODE_0FC24E:
    INC $18,x           ; $0FC24E   |
    INC $18,x           ; $0FC250   |

CODE_0FC252:
    RTS                 ; $0FC252   |

CODE_0FC253:
    LDA $7AF8,x         ; $0FC253   |
    BNE CODE_0FC260     ; $0FC256   |
    LDY $1402           ; $0FC258   |
    BNE CODE_0FC261     ; $0FC25B   |
    INC $1402           ; $0FC25D   |

CODE_0FC260:
    RTS                 ; $0FC260   |

CODE_0FC261:
    LDY #$00            ; $0FC261   |
    STY $1402           ; $0FC263   |
    RTS                 ; $0FC266   |

    LDX $12             ; $0FC267   |
    JSR CODE_0FC884     ; $0FC269   |
    JSR CODE_0FC61D     ; $0FC26C   |
    LDA $0039           ; $0FC26F   |
    CMP #$0100          ; $0FC272   |
    BCS CODE_0FC2E8     ; $0FC275   |
    CLC                 ; $0FC277   |
    ADC #$0002          ; $0FC278   |
    STA $0039           ; $0FC27B   |
    STA $6094           ; $0FC27E   |

CODE_0FC281:
    LDA $14             ; $0FC281   |
    AND #$0003          ; $0FC283   |
    BNE CODE_0FC2E7     ; $0FC286   |
    LDA $7900,x         ; $0FC288   |
    CLC                 ; $0FC28B   |
    ADC #$0050          ; $0FC28C   |
    CMP #$00F0          ; $0FC28F   |
    BCC CODE_0FC297     ; $0FC292   |
    LDA #$0000          ; $0FC294   |

CODE_0FC297:
    STA $7900,x         ; $0FC297   |
    ORA #$1900          ; $0FC29A   |
    STA $00             ; $0FC29D   |
    REP #$10            ; $0FC29F   |
    LDA $7E4000         ; $0FC2A1   |
    TAX                 ; $0FC2A5   |
    LDA #$0005          ; $0FC2A6   |
    STA $02             ; $0FC2A9   |
    LDA #$6108          ; $0FC2AB   |
    STA $04             ; $0FC2AE   |

CODE_0FC2B0:
    LDA $04             ; $0FC2B0   |
    STA $7E4002,x       ; $0FC2B2   |
    CLC                 ; $0FC2B6   |
    ADC #$0020          ; $0FC2B7   |
    STA $04             ; $0FC2BA   |
    LDA #$001F          ; $0FC2BC   |
    STA $7E4004,x       ; $0FC2BF   |
    LDY #$0010          ; $0FC2C3   |
    LDA $00             ; $0FC2C6   |

CODE_0FC2C8:
    STA $7E4006,x       ; $0FC2C8   |
    INC A               ; $0FC2CC   |
    INX                 ; $0FC2CD   |
    INX                 ; $0FC2CE   |
    DEY                 ; $0FC2CF   |
    BNE CODE_0FC2C8     ; $0FC2D0   |
    STA $00             ; $0FC2D2   |
    INX                 ; $0FC2D4   |
    INX                 ; $0FC2D5   |
    INX                 ; $0FC2D6   |
    INX                 ; $0FC2D7   |
    DEC $02             ; $0FC2D8   |
    BNE CODE_0FC2B0     ; $0FC2DA   |
    LDA #$FFFF          ; $0FC2DC   |
    STA $7E4002,x       ; $0FC2DF   |
    SEP #$10            ; $0FC2E3   |
    LDX $12             ; $0FC2E5   |

CODE_0FC2E7:
    RTS                 ; $0FC2E7   |

CODE_0FC2E8:
    LDA $70336C         ; $0FC2E8   |
    CMP #$0020          ; $0FC2EC   |
    BCC CODE_0FC2FB     ; $0FC2EF   |
    LDA $16,x           ; $0FC2F1   |
    CMP #$01C2          ; $0FC2F3   |
    BCS CODE_0FC309     ; $0FC2F6   |
    JSR CODE_0FC807     ; $0FC2F8   |

CODE_0FC2FB:
    LDA $14             ; $0FC2FB   |
    LSR A               ; $0FC2FD   |
    BCC CODE_0FC309     ; $0FC2FE   |
    LDX #$08            ; $0FC300   |
    LDA #$B4A9          ; $0FC302   |
    JSL $7EDE44         ; $0FC305   | GSU init

CODE_0FC309:
    LDX $12             ; $0FC309   |
    JSR CODE_0FC253     ; $0FC30B   |
    BNE CODE_0FC34C     ; $0FC30E   |
    LDA #$0076          ; $0FC310   |
    JSR CODE_0FC78D     ; $0FC313   |
    LDX #$1C            ; $0FC316   |

CODE_0FC318:
    LDA $5FCE72,x       ; $0FC318   |
    STA $702082,x       ; $0FC31C   |
    LDA $5FCE90,x       ; $0FC320   |
    STA $7020A2,x       ; $0FC324   |
    DEX                 ; $0FC328   |
    DEX                 ; $0FC329   |
    BPL CODE_0FC318     ; $0FC32A   |
    REP #$10            ; $0FC32C   |
    LDX #$BD8C          ; $0FC32E   |
    JSR CODE_0FBF14     ; $0FC331   |
    LDA #$1C10          ; $0FC334   |
    LSR A               ; $0FC337   |
    ORA #$20C2          ; $0FC338   |
    LDX $12             ; $0FC33B   |
    LDA #$01C0          ; $0FC33D   |
    STA $7AF8,x         ; $0FC340   |
    LDA #$0002          ; $0FC343   |
    STA $7A98,x         ; $0FC346   |
    JMP CODE_0FC24E     ; $0FC349   |

CODE_0FC34C:
    RTS                 ; $0FC34C   |

    LDX $12             ; $0FC34D   |
    LDA $6094           ; $0FC34F   |
    CMP #$0300          ; $0FC352   |
    BCS CODE_0FC36B     ; $0FC355   |
    ADC #$0002          ; $0FC357   |
    STA $6094           ; $0FC35A   |
    CMP #$0100          ; $0FC35D   |
    BCC CODE_0FC365     ; $0FC360   |
    LDA #$0100          ; $0FC362   |

CODE_0FC365:
    STA $0039           ; $0FC365   |
    JMP CODE_0FC61D     ; $0FC368   |

CODE_0FC36B:
    LDA #$00FF          ; $0FC36B   |
    STA $74A2,x         ; $0FC36E   |
    JSR CODE_0FC253     ; $0FC371   |
    BNE CODE_0FC3C4     ; $0FC374   |
    LDA #$0075          ; $0FC376   |
    JSR CODE_0FC78D     ; $0FC379   |
    REP #$10            ; $0FC37C   |
    LDX #$BD94          ; $0FC37E   |
    JSR CODE_0FBF14     ; $0FC381   |
    REP #$20            ; $0FC384   |
    LDX $12             ; $0FC386   |
    LDA #$0088          ; $0FC388   |
    STA $70E2,x         ; $0FC38B   |
    LDA #$0048          ; $0FC38E   |
    STA $7182,x         ; $0FC391   |
    STZ $7220,x         ; $0FC394   |
    STZ $7222,x         ; $0FC397   |
    STZ $7542,x         ; $0FC39A   |
    STZ $75E2,x         ; $0FC39D   |
    STZ $7540,x         ; $0FC3A0   |
    STZ $75E0,x         ; $0FC3A3   |
    LDA #$0005          ; $0FC3A6   |
    STA $74A2,x         ; $0FC3A9   |
    LDA $7042,x         ; $0FC3AC   |
    EOR #$0030          ; $0FC3AF   |
    STA $7042,x         ; $0FC3B2   |
    LDA #$02FF          ; $0FC3B5   |
    STA $74A0,x         ; $0FC3B8   |
    LDA #$0200          ; $0FC3BB   |
    STA $7AF8,x         ; $0FC3BE   |
    JMP CODE_0FC24E     ; $0FC3C1   |

CODE_0FC3C4:
    RTS                 ; $0FC3C4   |

    LDX $12             ; $0FC3C5   |
    JSR CODE_0FC884     ; $0FC3C7   |
    JSR CODE_0FC61D     ; $0FC3CA   |
    LDA $6094           ; $0FC3CD   |
    CMP #$0300          ; $0FC3D0   |
    BCS CODE_0FC3E7     ; $0FC3D3   |
    ADC #$0002          ; $0FC3D5   |
    STA $6094           ; $0FC3D8   |
    CMP #$0100          ; $0FC3DB   |
    BCC CODE_0FC3E3     ; $0FC3DE   |
    LDA #$0100          ; $0FC3E0   |

CODE_0FC3E3:
    STA $0039           ; $0FC3E3   |
    RTS                 ; $0FC3E6   |

CODE_0FC3E7:
    JSR CODE_0FC253     ; $0FC3E7   |
    BNE CODE_0FC42F     ; $0FC3EA   |
    LDX #$48            ; $0FC3EC   |
    LDA #$1000          ; $0FC3EE   |
    JSR CODE_0FC74B     ; $0FC3F1   |
    LDA #$0077          ; $0FC3F4   |
    JSR CODE_0FC78D     ; $0FC3F7   |
    LDX #$1C            ; $0FC3FA   |

CODE_0FC3FC:
    LDA $5FCEAE,x       ; $0FC3FC   |
    STA $702082,x       ; $0FC400   |
    DEX                 ; $0FC404   |
    DEX                 ; $0FC405   |
    BPL CODE_0FC3FC     ; $0FC406   |
    REP #$10            ; $0FC408   |
    LDX #$BD9C          ; $0FC40A   |
    JSR CODE_0FBF14     ; $0FC40D   |
    LDA #$1C10          ; $0FC410   |
    LSR A               ; $0FC413   |
    ORA #$03A9          ; $0FC414   |
    TRB $0960           ; $0FC417   |
    REP #$20            ; $0FC41A   |
    LDA #$FE24          ; $0FC41C   |
    STA $003D           ; $0FC41F   |
    STZ $14             ; $0FC422   |
    LDX $12             ; $0FC424   |
    LDA #$0300          ; $0FC426   |
    STA $7AF8,x         ; $0FC429   |
    JMP CODE_0FC24E     ; $0FC42C   |

CODE_0FC42F:
    RTS                 ; $0FC42F   |

    LDX $12             ; $0FC430   |
    LDA $14             ; $0FC432   |
    LSR A               ; $0FC434   |
    BCC CODE_0FC43D     ; $0FC435   |
    INC $003D           ; $0FC437   |
    INC $003F           ; $0FC43A   |

CODE_0FC43D:
    LDA $0039           ; $0FC43D   |
    CMP #$0100          ; $0FC440   |
    BCS CODE_0FC451     ; $0FC443   |
    ADC #$0002          ; $0FC445   |
    STA $0039           ; $0FC448   |
    STA $6094           ; $0FC44B   |
    JMP CODE_0FC61D     ; $0FC44E   |

CODE_0FC451:
    LDA #$00FF          ; $0FC451   |
    STA $74A2,x         ; $0FC454   |
    JSR CODE_0FC253     ; $0FC457   |
    BNE CODE_0FC4BC     ; $0FC45A   |
    LDA #$0017          ; $0FC45C   |
    STA $1407           ; $0FC45F   |
    LDY #$8C10          ; $0FC462   |
    RTL                 ; $0FC465   |

    ORA #$02A0          ; $0FC466   |
    STY $096C           ; $0FC469   |
    LDA #$1088          ; $0FC46C   |
    STA $0948           ; $0FC46F   |
    LDA #$0001          ; $0FC472   |
    TSB $0960           ; $0FC475   |
    LDX #$49            ; $0FC478   |
    LDA #$1800          ; $0FC47A   |
    JSR CODE_0FC74B     ; $0FC47D   |
    LDA #$0078          ; $0FC480   |
    JSR CODE_0FC78D     ; $0FC483   |
    LDX #$1C            ; $0FC486   |

CODE_0FC488:
    LDA $5FCFBC,x       ; $0FC488   |
    STA $7020A2,x       ; $0FC48C   |
    LDA $5FCFDA,x       ; $0FC490   |
    STA $7020C2,x       ; $0FC494   |
    DEX                 ; $0FC498   |
    DEX                 ; $0FC499   |
    BPL CODE_0FC488     ; $0FC49A   |
    REP #$10            ; $0FC49C   |
    LDX #$BDA4          ; $0FC49E   |
    JSR CODE_0FBF14     ; $0FC4A1   |
    LDA #$1C03          ; $0FC4A4   |
    RTS                 ; $0FC4A7   |

    ORA #$20C2          ; $0FC4A8   |
    LDA #$0178          ; $0FC4AB   |
    STA $003D           ; $0FC4AE   |
    LDX $12             ; $0FC4B1   |
    LDA #$0400          ; $0FC4B3   |
    STA $7AF8,x         ; $0FC4B6   |
    JMP CODE_0FC24E     ; $0FC4B9   |

CODE_0FC4BC:
    RTS                 ; $0FC4BC   |

    LDA $6096           ; $0FC4BD   |
    JSR CODE_0FCB3D     ; $0FC4C0   |
    LDX $12             ; $0FC4C3   |
    LDA $0039           ; $0FC4C5   |
    CMP #$0100          ; $0FC4C8   |
    BCS CODE_0FC4DF     ; $0FC4CB   |
    ADC #$0002          ; $0FC4CD   |
    STA $0039           ; $0FC4D0   |
    STA $6094           ; $0FC4D3   |
    LDA $14             ; $0FC4D6   |
    LSR A               ; $0FC4D8   |
    BCC CODE_0FC4DE     ; $0FC4D9   |
    INC $003B           ; $0FC4DB   |

CODE_0FC4DE:
    RTS                 ; $0FC4DE   |

CODE_0FC4DF:
    JSR CODE_0FC253     ; $0FC4DF   |
    BNE CODE_0FC516     ; $0FC4E2   |
    LDA #$0001          ; $0FC4E4   |
    TSB $0960           ; $0FC4E7   |
    LDA #$0079          ; $0FC4EA   |
    JSR CODE_0FC78D     ; $0FC4ED   |
    LDX #$1C            ; $0FC4F0   |

CODE_0FC4F2:
    LDA $5FCFF8,x       ; $0FC4F2   |
    STA $702062,x       ; $0FC4F6   |
    LDA $5FD016,x       ; $0FC4FA   |
    STA $702082,x       ; $0FC4FE   |
    DEX                 ; $0FC502   |
    DEX                 ; $0FC503   |
    BPL CODE_0FC4F2     ; $0FC504   |
    LDY #$01            ; $0FC506   |
    STY $096C           ; $0FC508   |
    LDX $12             ; $0FC50B   |
    LDA #$0100          ; $0FC50D   |
    STA $7AF8,x         ; $0FC510   |
    JMP CODE_0FC24E     ; $0FC513   |

CODE_0FC516:
    RTS                 ; $0FC516   |

    LDX $12             ; $0FC517   |
    LDA $0039           ; $0FC519   |
    CMP #$0100          ; $0FC51C   |
    BCS CODE_0FC530     ; $0FC51F   |
    ADC #$0002          ; $0FC521   |
    STA $0039           ; $0FC524   |
    STA $6094           ; $0FC527   |
    JSR CODE_0FCB3D     ; $0FC52A   |
    LDX $12             ; $0FC52D   |
    RTS                 ; $0FC52F   |

CODE_0FC530:
    JSR CODE_0FC253     ; $0FC530   |
    BNE CODE_0FC579     ; $0FC533   |
    LDA #$007A          ; $0FC535   |
    JSR CODE_0FC78D     ; $0FC538   |
    LDX #$1C            ; $0FC53B   |

CODE_0FC53D:
    LDA $5FD034,x       ; $0FC53D   |
    STA $7020A2,x       ; $0FC541   |
    LDA $5FD052,x       ; $0FC545   |
    STA $7020C2,x       ; $0FC549   |
    DEX                 ; $0FC54D   |
    DEX                 ; $0FC54E   |
    BPL CODE_0FC53D     ; $0FC54F   |
    REP #$10            ; $0FC551   |
    LDX #$BDAE          ; $0FC553   |
    JSR CODE_0FBF14     ; $0FC556   |
    REP #$20            ; $0FC559   |
    LDA #$0215          ; $0FC55B   |
    STA $1407           ; $0FC55E   |
    LDY #$8C02          ; $0FC561   |
    RTL                 ; $0FC564   |

    ORA #$20A0          ; $0FC565   |
    STY $096C           ; $0FC568   |
    STZ $0948           ; $0FC56B   |
    LDX $12             ; $0FC56E   |
    LDA #$0480          ; $0FC570   |
    STA $7AF8,x         ; $0FC573   |
    JMP CODE_0FC24E     ; $0FC576   |

CODE_0FC579:
    RTS                 ; $0FC579   |

    LDX $12             ; $0FC57A   |
    LDA $0039           ; $0FC57C   |
    CMP #$0100          ; $0FC57F   |
    BCS CODE_0FC58E     ; $0FC582   |
    ADC #$0002          ; $0FC584   |
    STA $0039           ; $0FC587   |
    STA $6094           ; $0FC58A   |
    RTS                 ; $0FC58D   |

CODE_0FC58E:
    JSR CODE_0FC253     ; $0FC58E   |
    BNE CODE_0FC5D1     ; $0FC591   |
    LDA #$007B          ; $0FC593   |
    JSR CODE_0FC78D     ; $0FC596   |
    LDX #$1C            ; $0FC599   |

CODE_0FC59B:
    LDA $5FD070,x       ; $0FC59B   |
    STA $702042,x       ; $0FC59F   |
    LDA $5FD08E,x       ; $0FC5A3   |
    STA $702062,x       ; $0FC5A7   |
    LDA $5FCF9E,x       ; $0FC5AB   |
    STA $7021E2,x       ; $0FC5AF   |
    DEX                 ; $0FC5B3   |
    DEX                 ; $0FC5B4   |
    BPL CODE_0FC59B     ; $0FC5B5   |
    REP #$10            ; $0FC5B7   |
    LDX #$BDB6          ; $0FC5B9   |
    JSR CODE_0FBF14     ; $0FC5BC   |
    LDA #$1C03          ; $0FC5BF   |
    RTS                 ; $0FC5C2   |

    ORA #$20C2          ; $0FC5C3   |
    LDX $12             ; $0FC5C6   |
    LDA #$0300          ; $0FC5C8   |
    STA $7AF8,x         ; $0FC5CB   |
    JMP CODE_0FC24E     ; $0FC5CE   |

CODE_0FC5D1:
    RTS                 ; $0FC5D1   |

    LDX $12             ; $0FC5D2   |
    LDA $003D           ; $0FC5D4   |
    LSR A               ; $0FC5D7   |
    STA $7E5042         ; $0FC5D8   |
    LSR A               ; $0FC5DC   |
    STA $7E5040         ; $0FC5DD   |
    LDA #$0008          ; $0FC5E1   |
    TSB $094A           ; $0FC5E4   |
    LDA $0039           ; $0FC5E7   |
    CMP #$0100          ; $0FC5EA   |
    BCS CODE_0FC5F9     ; $0FC5ED   |
    ADC #$0002          ; $0FC5EF   |
    STA $0039           ; $0FC5F2   |
    STA $6094           ; $0FC5F5   |
    RTS                 ; $0FC5F8   |

CODE_0FC5F9:
    JSR CODE_0FC253     ; $0FC5F9   |
    BNE CODE_0FC5FE     ; $0FC5FC   |

CODE_0FC5FE:
    RTS                 ; $0FC5FE   |

DATA_0FC5FF:         dw $0001, $0002, $0010, $FFC0

DATA_0FC607:         dw $0010, $0008, $0018, $0004

DATA_0FC60F:         dw $0055, $0040, $0055, $0055
DATA_0FC617:         dw $0055, $0008, $0100

CODE_0FC61D:
    LDA #$0080          ; $0FC61D   |
    LDY $7A98,x         ; $0FC620   |
    BNE CODE_0FC633     ; $0FC623   |
    LDY $76,x           ; $0FC625   |
    LDA $7A38,x         ; $0FC627   |
    CMP $C60F,y         ; $0FC62A   |
    BMI CODE_0FC633     ; $0FC62D   |
    SEC                 ; $0FC62F   |
    SBC #$0002          ; $0FC630   |

CODE_0FC633:
    STA $7A38,x         ; $0FC633   |
    CLC                 ; $0FC636   |
    ADC $7A36,x         ; $0FC637   |
    CMP #$0C00          ; $0FC63A   |
    BCC CODE_0FC6B6     ; $0FC63D   |
    LDY $76,x           ; $0FC63F   |
    BNE CODE_0FC648     ; $0FC641   |
    AND #$00FF          ; $0FC643   |
    BRA CODE_0FC6B6     ; $0FC646   |

CODE_0FC648:
    PHA                 ; $0FC648   |
    XBA                 ; $0FC649   |
    AND #$00FF          ; $0FC64A   |
    ASL A               ; $0FC64D   |
    TAY                 ; $0FC64E   |
    CPY #$22            ; $0FC64F   |
    BCS CODE_0FC6AA     ; $0FC651   |
    LDA $7A37,x         ; $0FC653   |
    AND #$00FF          ; $0FC656   |
    ASL A               ; $0FC659   |
    STA $00             ; $0FC65A   |
    CPY #$20            ; $0FC65C   |
    BNE CODE_0FC69B     ; $0FC65E   |
    CMP #$001E          ; $0FC660   |
    BNE CODE_0FC6AA     ; $0FC663   |
    PHY                 ; $0FC665   |
    LDA #$0238          ; $0FC666   |
    JSR CODE_0FBFCD     ; $0FC669   |
    LDA $70E2,x         ; $0FC66C   |
    CLC                 ; $0FC66F   |
    ADC #$0014          ; $0FC670   |
    STA $70E2,y         ; $0FC673   |
    LDA $7182,x         ; $0FC676   |
    CLC                 ; $0FC679   |
    ADC #$FFE8          ; $0FC67A   |
    STA $7182,y         ; $0FC67D   |
    LDA #$023A          ; $0FC680   |
    JSR CODE_0FBFCD     ; $0FC683   |
    LDA $70E2,x         ; $0FC686   |
    CLC                 ; $0FC689   |
    ADC #$0014          ; $0FC68A   |
    STA $70E2,y         ; $0FC68D   |
    LDA $7182,x         ; $0FC690   |
    CLC                 ; $0FC693   |
    ADC #$FFE8          ; $0FC694   |
    STA $7182,y         ; $0FC697   |
    PLY                 ; $0FC69A   |

CODE_0FC69B:
    CPY $00             ; $0FC69B   |
    BEQ CODE_0FC6AA     ; $0FC69D   |
    LDA $C5FB,y         ; $0FC69F   |
    STA $7A38,x         ; $0FC6A2   |
    PLA                 ; $0FC6A5   |
    AND #$FF00          ; $0FC6A6   |
    PHA                 ; $0FC6A9   |

CODE_0FC6AA:
    PLA                 ; $0FC6AA   |
    CMP #$1800          ; $0FC6AB   |
    BCC CODE_0FC6B6     ; $0FC6AE   |
    AND #$00FF          ; $0FC6B0   |
    ORA #$1000          ; $0FC6B3   |

CODE_0FC6B6:
    STA $7A36,x         ; $0FC6B6   |
    XBA                 ; $0FC6B9   |
    AND #$00FF          ; $0FC6BA   |
    STA $7402,x         ; $0FC6BD   |
    LDY $76,x           ; $0FC6C0   |
    BEQ CODE_0FC718     ; $0FC6C2   |
    LDA $75E0,x         ; $0FC6C4   |
    SEC                 ; $0FC6C7   |
    SBC #$0001          ; $0FC6C8   |
    CMP #$0010          ; $0FC6CB   |
    BPL CODE_0FC6D3     ; $0FC6CE   |
    LDA #$0010          ; $0FC6D0   |

CODE_0FC6D3:
    STA $75E0,x         ; $0FC6D3   |
    LDY #$58            ; $0FC6D6   |

CODE_0FC6D8:
    LDA $6F00,y         ; $0FC6D8   |
    BEQ CODE_0FC711     ; $0FC6DB   |
    LDA $7360,y         ; $0FC6DD   |
    CMP #$0233          ; $0FC6E0   |
    BCC CODE_0FC711     ; $0FC6E3   |
    CMP #$0236          ; $0FC6E5   |
    BCS CODE_0FC711     ; $0FC6E8   |
    LDA $75E0,y         ; $0FC6EA   |
    EOR #$FFFF          ; $0FC6ED   |
    INC A               ; $0FC6F0   |
    SEP #$20            ; $0FC6F1   |
    STA $211B           ; $0FC6F3   |
    XBA                 ; $0FC6F6   |
    STA $211B           ; $0FC6F7   |
    LDA $75E0,x         ; $0FC6FA   |
    STA $211C           ; $0FC6FD   |
    LDA $2134           ; $0FC700   |
    ASL A               ; $0FC703   |
    REP #$20            ; $0FC704   |
    LDA $2135           ; $0FC706   |
    ROL A               ; $0FC709   |
    EOR #$FFFF          ; $0FC70A   |
    INC A               ; $0FC70D   |
    STA $7220,y         ; $0FC70E   |

CODE_0FC711:
    DEY                 ; $0FC711   |
    DEY                 ; $0FC712   |
    DEY                 ; $0FC713   |
    DEY                 ; $0FC714   |
    BPL CODE_0FC6D8     ; $0FC715   |
    RTS                 ; $0FC717   |

CODE_0FC718:
    LDA $7182,x         ; $0FC718   |
    CMP #$0058          ; $0FC71B   |
    BCC CODE_0FC72D     ; $0FC71E   |
    LDA $7970           ; $0FC720   |
    AND #$0006          ; $0FC723   |
    TAY                 ; $0FC726   |
    LDA $C607,y         ; $0FC727   |
    STA $7A98,x         ; $0FC72A   |

CODE_0FC72D:
    LDY $7A98,x         ; $0FC72D   |
    BEQ CODE_0FC734     ; $0FC730   |
    LDY #$02            ; $0FC732   |

CODE_0FC734:
    LDA $C5FF,y         ; $0FC734   |
    STA $7542,x         ; $0FC737   |
    STA $7540,x         ; $0FC73A   |
    LDA $C603,y         ; $0FC73D   |
    STA $75E2,x         ; $0FC740   |
    EOR #$FFFF          ; $0FC743   |
    INC A               ; $0FC746   |
    STA $75E0,x         ; $0FC747   |
    RTS                 ; $0FC74A   |

CODE_0FC74B:
    PHA                 ; $0FC74B   |
    REP #$10            ; $0FC74C   |
    TXA                 ; $0FC74E   |
    LDX #$5800          ; $0FC74F   |
    JSL $00B756         ; $0FC752   |
    TAY                 ; $0FC756   |
    LDA $7E4800         ; $0FC757   |
    TAX                 ; $0FC75B   |
    PLA                 ; $0FC75C   |
    STA $7E0000,x       ; $0FC75D   |
    LDA #$0180          ; $0FC761   |
    STA $7E0002,x       ; $0FC764   |
    LDA #$0018          ; $0FC768   |
    STA $7E0004,x       ; $0FC76B   |
    LDA #$7058          ; $0FC76F   |
    STA $7E0006,x       ; $0FC772   |
    TYA                 ; $0FC776   |
    STA $7E0008,x       ; $0FC777   |
    TXA                 ; $0FC77B   |
    CLC                 ; $0FC77C   |
    ADC #$000C          ; $0FC77D   |
    STA $7E000A,x       ; $0FC780   |
    STA $7E4800         ; $0FC784   |
    SEP #$10            ; $0FC788   |
    LDX $12             ; $0FC78A   |
    RTS                 ; $0FC78C   |

CODE_0FC78D:
    REP #$10            ; $0FC78D   |
    JSL $00B753         ; $0FC78F   |
    TAY                 ; $0FC793   |
    LDA $7E4800         ; $0FC794   |
    TAX                 ; $0FC798   |
    LDA $003F           ; $0FC799   |
    STA $003B           ; $0FC79C   |
    STZ $0039           ; $0FC79F   |
    STZ $6094           ; $0FC7A2   |
    STZ $003F           ; $0FC7A5   |
    LDA $095F           ; $0FC7A8   |
    XBA                 ; $0FC7AB   |
    STA $095F           ; $0FC7AC   |
    AND #$FC00          ; $0FC7AF   |
    STA $7E0000,x       ; $0FC7B2   |
    LDA #$0180          ; $0FC7B6   |
    STA $7E0002,x       ; $0FC7B9   |
    LDA #$0018          ; $0FC7BD   |
    STA $7E0004,x       ; $0FC7C0   |
    LDA #$7068          ; $0FC7C4   |
    STA $7E0006,x       ; $0FC7C7   |
    TYA                 ; $0FC7CB   |
    STA $7E0008,x       ; $0FC7CC   |
    TXA                 ; $0FC7D0   |
    CLC                 ; $0FC7D1   |
    ADC #$000C          ; $0FC7D2   |
    STA $7E000A,x       ; $0FC7D5   |
    STA $7E4800         ; $0FC7D9   |
    SEP #$10            ; $0FC7DD   |
    LDX $12             ; $0FC7DF   |
    LDY #$5C            ; $0FC7E1   |

CODE_0FC7E3:
    LDA $6F00,y         ; $0FC7E3   |
    BEQ CODE_0FC800     ; $0FC7E6   |
    LDA #$00FF          ; $0FC7E8   |
    STA $74A0,y         ; $0FC7EB   |
    LDA $74A2,y         ; $0FC7EE   |
    AND #$FFFB          ; $0FC7F1   |
    STA $74A2,y         ; $0FC7F4   |
    LDA $7042,y         ; $0FC7F7   |
    ORA #$0030          ; $0FC7FA   |
    STA $7042,y         ; $0FC7FD   |

CODE_0FC800:
    DEY                 ; $0FC800   |
    DEY                 ; $0FC801   |
    DEY                 ; $0FC802   |
    DEY                 ; $0FC803   |
    BPL CODE_0FC7E3     ; $0FC804   |
    RTS                 ; $0FC806   |

CODE_0FC807:
    PHB                 ; $0FC807   |
    LDY #$70            ; $0FC808   |
    PHY                 ; $0FC80A   |
    PLB                 ; $0FC80B   |
    LDA #$0000          ; $0FC80C   |
    STA $70336C         ; $0FC80F   |
    LDA $16,x           ; $0FC813   |
    CLC                 ; $0FC815   |
    ADC #$001E          ; $0FC816   |
    STA $16,x           ; $0FC819   |
    REP #$10            ; $0FC81B   |
    TAX                 ; $0FC81D   |
    LDY #$001C          ; $0FC81E   |

CODE_0FC821:
    LDA $2042,y         ; $0FC821   |
    STA $2DAE,y         ; $0FC824   |
    LDA $5FD0C8,x       ; $0FC827   |
    STA $2FAE,y         ; $0FC82B   |
    LDA $2062,y         ; $0FC82E   |
    STA $2DCE,y         ; $0FC831   |
    LDA $5FD2A8,x       ; $0FC834   |
    STA $2FCE,y         ; $0FC838   |
    LDA $2102,y         ; $0FC83B   |
    STA $2E6E,y         ; $0FC83E   |
    LDA $5FD488,x       ; $0FC841   |
    STA $306E,y         ; $0FC845   |
    DEX                 ; $0FC848   |
    DEX                 ; $0FC849   |
    DEY                 ; $0FC84A   |
    DEY                 ; $0FC84B   |
    BPL CODE_0FC821     ; $0FC84C   |
    SEP #$10            ; $0FC84E   |
    LDX $12             ; $0FC850   |
    PLB                 ; $0FC852   |
    RTS                 ; $0FC853   |

DATA_0FC854:         dw $0001, $0001, $0000, $0001
DATA_0FC85C:         dw $0002, $0002, $0002, $0001
DATA_0FC864:         dw $0002, $0003, $0001, $0002
DATA_0FC86C:         dw $0003, $0003, $0002, $0003
DATA_0FC874:         dw $0002, $0003, $0002, $0002
DATA_0FC87C:         dw $0003, $0003, $0002, $0003

CODE_0FC884:
    PHB                 ; $0FC884   |
    LDY #$00            ; $0FC885   |
    PHY                 ; $0FC887   |
    PLB                 ; $0FC888   |
    LDA $003D           ; $0FC889   |
    STA $7E5040         ; $0FC88C   |
    LDA $7902,x         ; $0FC890   |
    CLC                 ; $0FC893   |
    ADC #$0004          ; $0FC894   |
    AND #$01FE          ; $0FC897   |
    STA $7902,x         ; $0FC89A   |
    REP #$10            ; $0FC89D   |
    TAY                 ; $0FC89F   |
    LDX #$002E          ; $0FC8A0   |

CODE_0FC8A3:
    LDA $003D           ; $0FC8A3   |
    BNE CODE_0FC8C4     ; $0FC8A6   |
    LDA $E954,y         ; $0FC8A8   |
    SEP #$20            ; $0FC8AB   |
    STA $211B           ; $0FC8AD   |
    XBA                 ; $0FC8B0   |
    STA $211B           ; $0FC8B1   |
    LDA $0FC854,x       ; $0FC8B4   |
    STA $211C           ; $0FC8B8   |
    REP #$20            ; $0FC8BB   |
    LDA $003D           ; $0FC8BD   |
    CLC                 ; $0FC8C0   |
    ADC $2135           ; $0FC8C1   |

CODE_0FC8C4:
    STA $7E5042,x       ; $0FC8C4   |
    TYA                 ; $0FC8C8   |
    SEC                 ; $0FC8C9   |
    SBC #$0060          ; $0FC8CA   |
    AND #$01FE          ; $0FC8CD   |
    TAY                 ; $0FC8D0   |
    DEX                 ; $0FC8D1   |
    DEX                 ; $0FC8D2   |
    BPL CODE_0FC8A3     ; $0FC8D3   |
    SEP #$10            ; $0FC8D5   |
    LDA #$0010          ; $0FC8D7   |
    TSB $094A           ; $0FC8DA   |
    LDX $12             ; $0FC8DD   |
    PLB                 ; $0FC8DF   |
    RTS                 ; $0FC8E0   |

    LDA #$FEC0          ; $0FC8E1   |
    BRA CODE_0FC8EE     ; $0FC8E4   |

    LDA #$FFC0          ; $0FC8E6   |
    BRA CODE_0FC8EE     ; $0FC8E9   |

    LDA #$FC00          ; $0FC8EB   |

CODE_0FC8EE:
    STA $7220,x         ; $0FC8EE   |
    STA $75E0,x         ; $0FC8F1   |
    LDY $74A1,x         ; $0FC8F4   |
    LDA $6094,y         ; $0FC8F7   |
    BNE CODE_0FC8FF     ; $0FC8FA   |
    JMP CODE_0FC992     ; $0FC8FC   |

CODE_0FC8FF:
    LDA $7680,x         ; $0FC8FF   |
    BMI CODE_0FC907     ; $0FC902   |
    JMP CODE_0FC99D     ; $0FC904   |

CODE_0FC907:
    LDA $7220,x         ; $0FC907   |
    EOR #$FFFF          ; $0FC90A   |
    LSR A               ; $0FC90D   |
    LSR A               ; $0FC90E   |
    LSR A               ; $0FC90F   |
    ADC #$0040          ; $0FC910   |
    TAY                 ; $0FC913   |
    STY $4202           ; $0FC914   |
    LDY $70E2,x         ; $0FC917   |
    STY $4203           ; $0FC91A   |
    LDA #$02FF          ; $0FC91D   |
    STA $74A0,x         ; $0FC920   |
    LDA $74A2,x         ; $0FC923   |
    EOR #$0004          ; $0FC926   |
    STA $74A2,x         ; $0FC929   |
    LDA $7402,x         ; $0FC92C   |
    EOR #$0001          ; $0FC92F   |
    STA $7402,x         ; $0FC932   |
    LDA $4216           ; $0FC935   |
    LSR A               ; $0FC938   |
    LSR A               ; $0FC939   |
    LSR A               ; $0FC93A   |
    LSR A               ; $0FC93B   |
    LSR A               ; $0FC93C   |
    LSR A               ; $0FC93D   |
    EOR #$FFFF          ; $0FC93E   |
    SEC                 ; $0FC941   |
    ADC #$00F0          ; $0FC942   |
    STA $70E2,x         ; $0FC945   |
    INC $18,x           ; $0FC948   |
    LDA $18,x           ; $0FC94A   |
    CMP #$0003          ; $0FC94C   |
    BCC CODE_0FC956     ; $0FC94F   |
    JSL $03A31E         ; $0FC951   |
    RTS                 ; $0FC955   |

CODE_0FC956:
    LSR A               ; $0FC956   |
    BCC CODE_0FC975     ; $0FC957   |
    TXA                 ; $0FC959   |
    AND #$0004          ; $0FC95A   |
    BEQ CODE_0FC968     ; $0FC95D   |
    LDA $74A2,x         ; $0FC95F   |
    ORA #$00F0          ; $0FC962   |
    STA $74A2,x         ; $0FC965   |

CODE_0FC968:
    LDA $7220,x         ; $0FC968   |
    CMP #$8000          ; $0FC96B   |
    ROR A               ; $0FC96E   |
    CMP #$8000          ; $0FC96F   |
    ROR A               ; $0FC972   |
    BRA CODE_0FC983     ; $0FC973   |

CODE_0FC975:
    LDA $74A2,x         ; $0FC975   |
    AND #$000F          ; $0FC978   |
    STA $74A2,x         ; $0FC97B   |
    LDA $7220,x         ; $0FC97E   |
    ASL A               ; $0FC981   |
    ASL A               ; $0FC982   |

CODE_0FC983:
    STA $7220,x         ; $0FC983   |
    STA $75E0,x         ; $0FC986   |
    LDA $7042,x         ; $0FC989   |
    EOR #$0030          ; $0FC98C   |
    STA $7042,x         ; $0FC98F   |

CODE_0FC992:
    LDA $70E2,x         ; $0FC992   |
    BPL CODE_0FC99D     ; $0FC995   |
    LDA #$00F0          ; $0FC997   |
    STA $70E2,x         ; $0FC99A   |

CODE_0FC99D:
    RTS                 ; $0FC99D   |

    LDA #$1800          ; $0FC99E   |
    STA $16,x           ; $0FC9A1   |
    LDA $0039           ; $0FC9A3   |
    CMP #$0100          ; $0FC9A6   |
    BCC CODE_0FCA25     ; $0FC9A9   |
    LDA #$10C0          ; $0FC9AB   |
    STA $00             ; $0FC9AE   |
    LDA #$8001          ; $0FC9B0   |
    STA $3014           ; $0FC9B3   |
    LDA $16,x           ; $0FC9B6   |
    SEC                 ; $0FC9B8   |
    SBC #$0014          ; $0FC9B9   |
    CMP #$0080          ; $0FC9BC   |
    BCS CODE_0FC9D2     ; $0FC9BF   |
    JSL $03A31E         ; $0FC9C1   |
    LDY #$02            ; $0FC9C5   |
    STY $094B           ; $0FC9C7   |
    LDX #$4A            ; $0FC9CA   |
    LDA #$5000          ; $0FC9CC   |
    JMP CODE_0FC74B     ; $0FC9CF   |

CODE_0FC9D2:
    STA $16,x           ; $0FC9D2   |
    STA $300C           ; $0FC9D4   |
    CMP #$0480          ; $0FC9D7   |
    LDA #$0007          ; $0FC9DA   |
    BCS CODE_0FC9E2     ; $0FC9DD   |
    LDA #$0004          ; $0FC9DF   |

CODE_0FC9E2:
    STA $74A2,x         ; $0FC9E2   |
    LDA #$0054          ; $0FC9E5   |
    STA $3016           ; $0FC9E8   |
    LDX #$08            ; $0FC9EB   |
    LDA #$9004          ; $0FC9ED   |
    JSL $7EDE44         ; $0FC9F0   | GSU init
    LDA #$2000          ; $0FC9F4   |
    STA $0CF9           ; $0FC9F7   |
    LDX $12             ; $0FC9FA   |
    LDY #$62            ; $0FC9FC   |
    STY $094B           ; $0FC9FE   |
    LDY $3008           ; $0FCA01   |
    STY $211B           ; $0FCA04   |
    LDY $3009           ; $0FCA07   |
    STY $211B           ; $0FCA0A   |
    LDY $00             ; $0FCA0D   |
    STY $211C           ; $0FCA0F   |
    LDA $2135           ; $0FCA12   |
    ASL A               ; $0FCA15   |
    STA $7220,x         ; $0FCA16   |
    LDY $01             ; $0FCA19   |
    STY $211C           ; $0FCA1B   |
    LDA $2135           ; $0FCA1E   |
    ASL A               ; $0FCA21   |
    STA $7222,x         ; $0FCA22   |

CODE_0FCA25:
    RTS                 ; $0FCA25   |

    LDA #$F7A0          ; $0FCA26   |
    STA $7220,x         ; $0FCA29   |
    LDA $70E2,x         ; $0FCA2C   |
    BPL CODE_0FCA36     ; $0FCA2F   |
    JSL $03A31E         ; $0FCA31   |
    RTS                 ; $0FCA35   |

CODE_0FCA36:
    CMP #$0200          ; $0FCA36   |
    BPL CODE_0FCA72     ; $0FCA39   |
    LDY $D2             ; $0FCA3B   |
    BNE CODE_0FCA73     ; $0FCA3D   |
    LDA #$0200          ; $0FCA3F   |
    STA $70E2,x         ; $0FCA42   |
    LDY $745E           ; $0FCA45   |
    CPY #$0B            ; $0FCA48   |
    BNE CODE_0FCA72     ; $0FCA4A   |
    LDA #$0002          ; $0FCA4C   |
    STA $D2             ; $0FCA4F   |
    LDA #$0080          ; $0FCA51   |
    STA $763C           ; $0FCA54   |
    LDA #$0100          ; $0FCA57   |
    STA $7A94           ; $0FCA5A   |
    STZ $7AF4           ; $0FCA5D   |
    STZ $727C           ; $0FCA60   |
    STZ $727E           ; $0FCA63   |
    STZ $759C           ; $0FCA66   |
    STZ $759E           ; $0FCA69   |
    LDA #$0029          ; $0FCA6C   |
    STA $7A96,x         ; $0FCA6F   |

CODE_0FCA72:
    RTS                 ; $0FCA72   |

CODE_0FCA73:
    LDA $7A96,x         ; $0FCA73   |
    BNE CODE_0FCA89     ; $0FCA76   |
    LDA #$0004          ; $0FCA78   |
    STA $7A96,x         ; $0FCA7B   |
    LDA $7402,x         ; $0FCA7E   |
    CMP #$0003          ; $0FCA81   |
    BCS CODE_0FCA89     ; $0FCA84   |
    INC $7402,x         ; $0FCA86   |

CODE_0FCA89:
    RTS                 ; $0FCA89   |

    LDA #$0080          ; $0FCA8A   |
    STA $76,x           ; $0FCA8D   |
    LDA #$0080          ; $0FCA8F   |
    STA $7220,x         ; $0FCA92   |
    LDA #$FC00          ; $0FCA95   |
    BRA CODE_0FCAA3     ; $0FCA98   |

    LDA #$FF80          ; $0FCA9A   |
    STA $7220,x         ; $0FCA9D   |
    LDA #$FD00          ; $0FCAA0   |

CODE_0FCAA3:
    STA $7222,x         ; $0FCAA3   |
    LDA #$0020          ; $0FCAA6   |
    STA $7542,x         ; $0FCAA9   |
    LDA #$0300          ; $0FCAAC   |
    STA $75E2,x         ; $0FCAAF   |
    RTS                 ; $0FCAB2   |

DATA_0FCAB3:         dw $0000, $0001, $0001, $0000
DATA_0FCABB:         dw $0000, $0001, $0001, $0000

DATA_0FCAC3:         dw $0000, $0000, $0040, $0040
DATA_0FCACB:         dw $00C0, $00C0, $0080, $0080

    LDA $78,x           ; $0FCAD3   |
    CLC                 ; $0FCAD5   |
    ADC $76,x           ; $0FCAD6   |
    STA $78,x           ; $0FCAD8   |
    XBA                 ; $0FCADA   |
    AND #$0007          ; $0FCADB   |
    ASL A               ; $0FCADE   |
    TAY                 ; $0FCADF   |
    LDA $CAB3,y         ; $0FCAE0   |
    STA $7402,x         ; $0FCAE3   |
    LDA $7042,x         ; $0FCAE6   |
    AND #$003F          ; $0FCAE9   |
    ORA $CAC3,y         ; $0FCAEC   |
    STA $7042,x         ; $0FCAEF   |
    RTS                 ; $0FCAF2   |

    LDA #$0080          ; $0FCAF3   |
    STA $16,x           ; $0FCAF6   |
    LDA $0039           ; $0FCAF8   |
    CMP #$0100          ; $0FCAFB   |
    BCC CODE_0FCB3C     ; $0FCAFE   |
    LDA #$0000          ; $0FCB00   |
    STA $00             ; $0FCB03   |
    LDA #$8041          ; $0FCB05   |
    STA $3014           ; $0FCB08   |
    LDA $16,x           ; $0FCB0B   |
    CLC                 ; $0FCB0D   |
    ADC #$0010          ; $0FCB0E   |
    CMP #$1B00          ; $0FCB11   |
    BCC CODE_0FCB39     ; $0FCB14   |
    LDY $74A2,x         ; $0FCB16   |
    BMI CODE_0FCB2D     ; $0FCB19   |
    DEY                 ; $0FCB1B   |
    TYA                 ; $0FCB1C   |
    STA $74A2,x         ; $0FCB1D   |
    LDY #$02            ; $0FCB20   |
    STY $094B           ; $0FCB22   |
    LDX #$4B            ; $0FCB25   |
    LDA #$4000          ; $0FCB27   |
    JMP CODE_0FC74B     ; $0FCB2A   |

CODE_0FCB2D:
    JSL $03A31E         ; $0FCB2D   |
    LDX #$09            ; $0FCB31   |
    LDA #$5400          ; $0FCB33   |
    JMP CODE_0FC74B     ; $0FCB36   |

CODE_0FCB39:
    JSR CODE_0FC9D2     ; $0FCB39   |

CODE_0FCB3C:
    RTS                 ; $0FCB3C   |

CODE_0FCB3D:
    STA $3014           ; $0FCB3D   |
    LDA #$0030          ; $0FCB40   |
    STA $3004           ; $0FCB43   |
    LDA #$0070          ; $0FCB46   |
    STA $3006           ; $0FCB49   |
    LDA #$0090          ; $0FCB4C   |
    STA $3008           ; $0FCB4F   |
    LDA #$00A0          ; $0FCB52   |
    STA $300A           ; $0FCB55   |
    LDA #$3800          ; $0FCB58   |
    STA $300C           ; $0FCB5B   |
    LDA #$5800          ; $0FCB5E   |
    STA $300E           ; $0FCB61   |
    LDA #$7000          ; $0FCB64   |
    STA $3010           ; $0FCB67   |
    LDA #$8000          ; $0FCB6A   |
    STA $3012           ; $0FCB6D   |
    LDX #$08            ; $0FCB70   |
    LDA #$9083          ; $0FCB72   |
    JSL $7EDE44         ; $0FCB75   | GSU init
    REP #$10            ; $0FCB79   |
    JSL $00BE39         ; $0FCB7B   |

DATA_0FCB7F:         dw $51EC, $727E, $7033, $01C0

    SEP #$10            ; $0FCB88   |

CODE_0FCB8A:
    RTS                 ; $0FCB8A   |

CODE_0FCB8A:
    REP #$20            ; $0FCB8A   |
    LDX #$00            ; $0FCB8C   |
    LDA #$1400          ; $0FCB8E   |
    STA $00             ; $0FCB91   |
    LDA #$1800          ; $0FCB93   |
    STA $02             ; $0FCB96   |
    LDA #$1C00          ; $0FCB98   |
    STA $04             ; $0FCB9B   |
    LDA $00             ; $0FCB9D   |
    STA $13BE,x         ; $0FCB9F   |
    LDA $02             ; $0FCBA2   |
    STA $11BE,x         ; $0FCBA4   |
    CLC                 ; $0FCBA7   |
    ADC #$0010          ; $0FCBA8   |
    STA $123E,x         ; $0FCBAB   |
    CLC                 ; $0FCBAE   |
    ADC #$0010          ; $0FCBAF   |
    STA $12BE,x         ; $0FCBB2   |
    CLC                 ; $0FCBB5   |
    ADC #$0010          ; $0FCBB6   |
    STA $133E,x         ; $0FCBB9   |
    LDA $04             ; $0FCBBC   |
    STA $11FE,x         ; $0FCBBE   |
    CLC                 ; $0FCBC1   |
    ADC #$0010          ; $0FCBC2   |
    STA $127E,x         ; $0FCBC5   |
    CLC                 ; $0FCBC8   |
    ADC #$0010          ; $0FCBC9   |
    STA $12FE,x         ; $0FCBCC   |
    CLC                 ; $0FCBCF   |
    ADC #$0010          ; $0FCBD0   |
    STA $137E,x         ; $0FCBD3   |
    INC $02             ; $0FCBD6   |
    INC $04             ; $0FCBD8   |
    INX                 ; $0FCBDA   |
    INX                 ; $0FCBDB   |
    CPX #$9020          ; $0FCBDC   |
    LDA $40A9,x         ; $0FCBDF   |
    CLC                 ; $0FCBE2   |
    STA $02             ; $0FCBE3   |
    LDA #$1C40          ; $0FCBE5   |
    STA $04             ; $0FCBE8   |
    LDA $00             ; $0FCBEA   |
    STA $13BE,x         ; $0FCBEC   |
    LDA $02             ; $0FCBEF   |
    STA $11BE,x         ; $0FCBF1   |
    CLC                 ; $0FCBF4   |
    ADC #$0010          ; $0FCBF5   |
    STA $123E,x         ; $0FCBF8   |
    CLC                 ; $0FCBFB   |
    ADC #$0010          ; $0FCBFC   |
    STA $12BE,x         ; $0FCBFF   |
    CLC                 ; $0FCC02   |
    ADC #$0010          ; $0FCC03   |
    STA $133E,x         ; $0FCC06   |
    LDA $04             ; $0FCC09   |
    STA $11FE,x         ; $0FCC0B   |
    CLC                 ; $0FCC0E   |
    ADC #$0010          ; $0FCC0F   |
    STA $127E,x         ; $0FCC12   |
    CLC                 ; $0FCC15   |
    ADC #$0010          ; $0FCC16   |
    STA $12FE,x         ; $0FCC19   |
    CLC                 ; $0FCC1C   |
    ADC #$0010          ; $0FCC1D   |
    STA $137E,x         ; $0FCC20   |
    INC $02             ; $0FCC23   |
    INC $04             ; $0FCC25   |
    INX                 ; $0FCC27   |
    INX                 ; $0FCC28   |
    CPX #$9040          ; $0FCC29   |
    LDA $2D20,x         ; $0FCC2C   |
    CMP $7E80A9         ; $0FCC2F   |
    STA $11BC           ; $0FCC33   |
    JSR CODE_0FCCBC     ; $0FCC36   |
    INC $0D15           ; $0FCC39   |
    LDA #$00A0          ; $0FCC3C   |
    STA $11B6           ; $0FCC3F   |
    STZ $11B8           ; $0FCC42   |
    STZ $11BA           ; $0FCC45   |
    STZ $13FE           ; $0FCC48   |
    STZ $1400           ; $0FCC4B   |
    STZ $1402           ; $0FCC4E   |
    LDA #$FFFF          ; $0FCC51   |
    STA $47             ; $0FCC54   |
    LDA #$0000          ; $0FCC56   |
    STA $7020F2         ; $0FCC59   |
    STA $7020F6         ; $0FCC5D   |
    STA $7020FC         ; $0FCC61   |
    STA $7020FE         ; $0FCC65   |
    SEP #$20            ; $0FCC69   |
    STZ $1404           ; $0FCC6B   |
    RTS                 ; $0FCC6E   |

CODE_0FCC6F:
    REP #$20            ; $0FCC6F   |
    LDA $11B6           ; $0FCC71   |
    BNE CODE_0FCC80     ; $0FCC74   |
    LDA $11B8           ; $0FCC76   |
    ASL A               ; $0FCC79   |
    TAX                 ; $0FCC7A   |
    JSR ($CC99,x)       ; $0FCC7B   |

    BRA CODE_0FCC83     ; $0FCC7E   |

CODE_0FCC80:
    DEC $11B6           ; $0FCC80   |

CODE_0FCC83:
    LDA $11B8           ; $0FCC83   |
    CMP #$0006          ; $0FCC86   |
    BNE CODE_0FCC93     ; $0FCC89   |
    LDX $11BA           ; $0FCC8B   |
    LDA $CD56,x         ; $0FCC8E   |
    BEQ CODE_0FCC96     ; $0FCC91   |

CODE_0FCC93:
    STZ $1402           ; $0FCC93   |

CODE_0FCC96:
    SEP #$20            ; $0FCC96   |
    RTS                 ; $0FCC98   |

DATA_0FCC99:         dw $CCA7
DATA_0FCC9B:         dw $CCBC
DATA_0FCC9D:         dw $CCC0
DATA_0FCC9F:         dw $CCF5
DATA_0FCCA1:         dw $CDAA
DATA_0FCCA3:         dw $CE63
DATA_0FCCA5:         dw $CEA0

    JSR CODE_0FCCF5     ; $0FCCA7   |
    LDA #$7E80          ; $0FCCAA   |
    STA $11BC           ; $0FCCAD   |
    STZ $1400           ; $0FCCB0   |
    LDA #$FFFF          ; $0FCCB3   |
    STA $47             ; $0FCCB6   |
    STZ $13FE           ; $0FCCB8   |
    RTS                 ; $0FCCBB   |

CODE_0FCCBC:
    JSR CODE_0FCDAA     ; $0FCCBC   |
    RTS                 ; $0FCCBF   |

    LDA $7020F2         ; $0FCCC0   |
    CLC                 ; $0FCCC4   |
    ADC #$0421          ; $0FCCC5   |
    CMP #$8000          ; $0FCCC8   |
    BCC CODE_0FCCE4     ; $0FCCCB   |
    LDA $1404           ; $0FCCCD   |
    AND #$00FF          ; $0FCCD0   |
    ASL A               ; $0FCCD3   |
    TAX                 ; $0FCCD4   |
    LDA $CEDB,x         ; $0FCCD5   |
    STA $11B6           ; $0FCCD8   |
    INC $1404           ; $0FCCDB   |
    INC $11B8           ; $0FCCDE   |
    LDA #$7FFF          ; $0FCCE1   |

CODE_0FCCE4:
    STA $7020F2         ; $0FCCE4   |
    STA $7020F6         ; $0FCCE8   |
    STA $7020FC         ; $0FCCEC   |
    STA $7020FE         ; $0FCCF0   |
    RTS                 ; $0FCCF4   |

CODE_0FCCF5:
    LDX $11BA           ; $0FCCF5   |
    LDA $CD56,x         ; $0FCCF8   |
    BEQ CODE_0FCD4A     ; $0FCCFB   |
    CMP #$FFFF          ; $0FCCFD   |
    BEQ CODE_0FCD55     ; $0FCD00   |
    STA $60A8           ; $0FCD02   |
    LDA #$000F          ; $0FCD05   |
    STA $60AA           ; $0FCD08   |
    SEP #$20            ; $0FCD0B   |
    LDA $012D           ; $0FCD0D   |
    PHA                 ; $0FCD10   |
    LDA $012E           ; $0FCD11   |
    PHA                 ; $0FCD14   |
    LDA #$13            ; $0FCD15   |
    STA $012D           ; $0FCD17   |
    LDA #$3C            ; $0FCD1A   |
    STA $012E           ; $0FCD1C   |
    REP #$20            ; $0FCD1F   |
    LDX #$09            ; $0FCD21   |
    LDA #$E9AF          ; $0FCD23   |
    JSL $7EDE44         ; $0FCD26   | GSU init
    SEP #$20            ; $0FCD2A   |
    PLA                 ; $0FCD2C   |
    STA $012E           ; $0FCD2D   |
    PLA                 ; $0FCD30   |
    STA $012D           ; $0FCD31   |
    REP #$20            ; $0FCD34   |
    INC $0D15           ; $0FCD36   |
    INC $11B8           ; $0FCD39   |
    INC $11BA           ; $0FCD3C   |
    INC $11BA           ; $0FCD3F   |
    INC $13FE           ; $0FCD42   |
    INC $13FE           ; $0FCD45   |
    BRA CODE_0FCD55     ; $0FCD48   |

CODE_0FCD4A:
    LDA $1402           ; $0FCD4A   |
    BEQ CODE_0FCD55     ; $0FCD4D   |
    LDA #$0006          ; $0FCD4F   |
    STA $11B8           ; $0FCD52   |

CODE_0FCD55:
    RTS                 ; $0FCD55   |

DATA_0FCD56:         dw $CF78
DATA_0FCD58:         dw $CF9A
DATA_0FCD5A:         dw $0000
DATA_0FCD5C:         dw $CFD1
DATA_0FCD5E:         dw $D00D
DATA_0FCD60:         dw $D042
DATA_0FCD62:         dw $D084
DATA_0FCD64:         dw $0000
DATA_0FCD66:         dw $D0C0
DATA_0FCD68:         dw $D0D9
DATA_0FCD6A:         dw $0000
DATA_0FCD6C:         dw $D0F8
DATA_0FCD6E:         dw $D108
DATA_0FCD70:         dw $D142
DATA_0FCD72:         dw $0000
DATA_0FCD74:         dw $D174
DATA_0FCD76:         dw $D1A8
DATA_0FCD78:         dw $D1C0
DATA_0FCD7A:         dw $0000
DATA_0FCD7C:         dw $D1D2
DATA_0FCD7E:         dw $D215
DATA_0FCD80:         dw $D24F
DATA_0FCD82:         dw $D25F
DATA_0FCD84:         dw $D293
DATA_0FCD86:         dw $D2D1
DATA_0FCD88:         dw $D309
DATA_0FCD8A:         dw $0000
DATA_0FCD8C:         dw $D327
DATA_0FCD8E:         dw $D365
DATA_0FCD90:         dw $D395
DATA_0FCD92:         dw $0000
DATA_0FCD94:         dw $D3C6
DATA_0FCD96:         dw $D3DF
DATA_0FCD98:         dw $D420
DATA_0FCD9A:         dw $D44B
DATA_0FCD9C:         dw $0000
DATA_0FCD9E:         dw $D487
DATA_0FCDA0:         dw $D4C3
DATA_0FCDA2:         dw $D4ED
DATA_0FCDA4:         dw $0000
DATA_0FCDA6:         dw $D52A
DATA_0FCDA8:         dw $FFFF

CODE_0FCDAA:
    INC $11B8           ; $0FCDAA   |
    REP #$10            ; $0FCDAD   |
    LDA #$0000          ; $0FCDAF   |
    STA $01             ; $0FCDB2   |
    LDA $60B0           ; $0FCDB4   |
    BEQ CODE_0FCDD2     ; $0FCDB7   |
    LDY $11BC           ; $0FCDB9   |
    LDX $1400           ; $0FCDBC   |
    LDA $CE38,x         ; $0FCDBF   |
    TAX                 ; $0FCDC2   |
    LDA #$0080          ; $0FCDC3   |
    JSL $00BEA6         ; $0FCDC6   |
    JSR CODE_0FCE40     ; $0FCDCA   |
    JSR CODE_0FCE4D     ; $0FCDCD   |
    BRA CODE_0FCDF9     ; $0FCDD0   |

CODE_0FCDD2:
    LDY $11BC           ; $0FCDD2   |
    LDX $1400           ; $0FCDD5   |
    LDA $CE38,x         ; $0FCDD8   |
    TAX                 ; $0FCDDB   |
    LDA #$0080          ; $0FCDDC   |
    JSL $00BEA6         ; $0FCDDF   |
    JSR CODE_0FCE40     ; $0FCDE3   |
    JSR CODE_0FCE4D     ; $0FCDE6   |
    LDY $11BC           ; $0FCDE9   |
    LDX #$13BE          ; $0FCDEC   |
    LDA #$0040          ; $0FCDEF   |
    JSL $00BEA6         ; $0FCDF2   |
    JSR CODE_0FCE4D     ; $0FCDF6   |

CODE_0FCDF9:
    LDY $11BC           ; $0FCDF9   |
    LDX $1400           ; $0FCDFC   |
    LDA $CE38,x         ; $0FCDFF   |
    TAX                 ; $0FCE02   |
    LDA #$0080          ; $0FCE03   |
    JSL $00BEA6         ; $0FCE06   |
    JSR CODE_0FCE40     ; $0FCE0A   |
    JSR CODE_0FCE4D     ; $0FCE0D   |
    LDY $11BC           ; $0FCE10   |
    LDX #$13BE          ; $0FCE13   |
    LDA #$0040          ; $0FCE16   |
    JSL $00BEA6         ; $0FCE19   |
    JSR CODE_0FCE4D     ; $0FCE1D   |
    LDA $60B0           ; $0FCE20   |
    BEQ CODE_0FCE35     ; $0FCE23   |
    LDY $11BC           ; $0FCE25   |
    LDX #$13BE          ; $0FCE28   |
    LDA #$0040          ; $0FCE2B   |
    JSL $00BEA6         ; $0FCE2E   |
    JSR CODE_0FCE4D     ; $0FCE32   |

CODE_0FCE35:
    SEP #$10            ; $0FCE35   |
    RTS                 ; $0FCE37   |

DATA_0FCE38:         dw $11BE, $123E, $12BE, $133E

CODE_0FCE40:
    LDA $1400           ; $0FCE40   |
    CLC                 ; $0FCE43   |
    ADC #$0002          ; $0FCE44   |
    AND #$0007          ; $0FCE47   |
    STA $1400           ; $0FCE4A   |

CODE_0FCE4D:
    LDA $11BC           ; $0FCE4D   |
    CLC                 ; $0FCE50   |
    ADC #$0020          ; $0FCE51   |
    STA $11BC           ; $0FCE54   |
    AND #$7FF0          ; $0FCE57   |
    BNE CODE_0FCE62     ; $0FCE5A   |
    LDA #$7C00          ; $0FCE5C   |
    STA $11BC           ; $0FCE5F   |

CODE_0FCE62:
    RTS                 ; $0FCE62   |

    LDX $13FE           ; $0FCE63   |
    LDA $47             ; $0FCE66   |
    CLC                 ; $0FCE68   |
    ADC #$0002          ; $0FCE69   |
    STA $47             ; $0FCE6C   |
    CMP $CE8E,x         ; $0FCE6E   |
    BCC CODE_0FCE8F     ; $0FCE71   |
    LDA $CE8E,x         ; $0FCE73   |
    STA $47             ; $0FCE76   |
    LDA #$0003          ; $0FCE78   |
    STA $11B8           ; $0FCE7B   |
    LDA $1404           ; $0FCE7E   |
    AND #$00FF          ; $0FCE81   |
    ASL A               ; $0FCE84   |
    TAX                 ; $0FCE85   |
    LDA $CEDB,x         ; $0FCE86   |
    STA $11B6           ; $0FCE89   |
    INC $1404           ; $0FCE8C   |

CODE_0FCE8F:
    RTS                 ; $0FCE8F   |

DATA_0FCE90:         dw $002F, $005F, $008F, $00BF
DATA_0FCE98:         dw $00EF, $011F, $014F, $017F

    LDA $7020F2         ; $0FCEA0   |
    SEC                 ; $0FCEA4   |
    SBC #$0421          ; $0FCEA5   |
    BPL CODE_0FCECA     ; $0FCEA8   |
    INC $11BA           ; $0FCEAA   |
    INC $11BA           ; $0FCEAD   |
    JSR CODE_0FCF2D     ; $0FCEB0   |
    STZ $11B8           ; $0FCEB3   |
    LDA $1404           ; $0FCEB6   |
    AND #$00FF          ; $0FCEB9   |
    ASL A               ; $0FCEBC   |
    TAX                 ; $0FCEBD   |
    LDA $CEDB,x         ; $0FCEBE   |
    STA $11B6           ; $0FCEC1   |
    INC $1404           ; $0FCEC4   |
    LDA #$0000          ; $0FCEC7   |

CODE_0FCECA:
    STA $7020F2         ; $0FCECA   |
    STA $7020F6         ; $0FCECE   |
    STA $7020FC         ; $0FCED2   |
    STA $7020FE         ; $0FCED6   |
    RTS                 ; $0FCEDA   |

DATA_0FCEDB:         dw $0180, $0140, $0050, $0180
DATA_0FCEE3:         dw $01E0, $0100, $0130, $0020
DATA_0FCEEB:         dw $00C0, $0100, $0050, $00A0
DATA_0FCEF3:         dw $01C0, $0180, $0050, $0170
DATA_0FCEFB:         dw $0100, $0080, $0050, $0140
DATA_0FCF03:         dw $0140, $0080, $0150, $0160
DATA_0FCF0B:         dw $0160, $0120, $0050, $0180
DATA_0FCF13:         dw $0180, $0180, $0050, $0090
DATA_0FCF1B:         dw $0180, $0180, $0180, $0050
DATA_0FCF23:         dw $0180, $0180, $0180, $0050
DATA_0FCF2B:         dw $0000

CODE_0FCF2D:
    LDA #$0000          ; $0FCF2D   |
    STA $01             ; $0FCF30   |
    REP #$10            ; $0FCF32   |
    LDY #$7E60          ; $0FCF34   |
    LDX #$13BE          ; $0FCF37   |
    LDA #$0040          ; $0FCF3A   |
    JSL $00BEA6         ; $0FCF3D   |
    LDY #$7E80          ; $0FCF41   |
    LDX #$13BE          ; $0FCF44   |
    LDA #$0040          ; $0FCF47   |
    JSL $00BEA6         ; $0FCF4A   |
    LDY #$7EA0          ; $0FCF4E   |
    LDX #$13BE          ; $0FCF51   |
    LDA #$0040          ; $0FCF54   |
    JSL $00BEA6         ; $0FCF57   |
    LDY #$7EC0          ; $0FCF5B   |
    LDX #$13BE          ; $0FCF5E   |
    LDA #$0040          ; $0FCF61   |
    JSL $00BEA6         ; $0FCF64   |
    LDY #$7EE0          ; $0FCF68   |
    LDX #$13BE          ; $0FCF6B   |
    LDA #$0040          ; $0FCF6E   |
    JSL $00BEA6         ; $0FCF71   |
    SEP #$10            ; $0FCF75   |
    RTS                 ; $0FCF77   |

DATA_0FCF78:         db $FE, $00, $FD, $00, $FC, $2E, $AA, $D0
DATA_0FCF80:         db $E3, $E6, $E5, $DE, $CF, $D0, $E3, $E6
DATA_0FCF88:         db $E5, $DE, $D0, $EB, $E0, $E4, $DC, $D0
DATA_0FCF90:         db $D8, $DE, $E6, $D0, $F3, $F3, $F3, $FE
DATA_0FCF98:         db $01, $FF

DATA_0FCF9A:         db $FE, $02, $FD, $10, $FC, $38, $BD, $DF
DATA_0FCFA2:         db $E0, $EA, $D0, $E0, $EA, $D0, $D8, $D0
DATA_0FCFAA:         db $EA, $EB, $E6, $E9, $F0, $D0, $D8, $D9
DATA_0FCFB2:         db $E6, $EC, $EB, $FE, $03, $FD, $18, $FC
DATA_0FCFBA:         db $3A, $D9, $D8, $D9, $F0, $D0, $B6, $D8
DATA_0FCFC2:         db $E9, $E0, $E6, $D0, $D8, $E5, $DB, $D0
DATA_0FCFCA:         db $C2, $E6, $EA, $DF, $E0, $F3, $FF

DATA_0FCFD1:         db $FE, $00, $FD, $00, $FC, $20, $D0, $AA
DATA_0FCFD9:         db $D0, $EA, $EB, $E6, $E9, $E2, $D0, $DF
DATA_0FCFE1:         db $EC, $E9, $E9, $E0, $DC, $EA, $D0, $D8
DATA_0FCFE9:         db $DA, $E9, $E6, $EA, $EA, $D0, $EB, $DF
DATA_0FCFF1:         db $DC, $FE, $01, $FD, $08, $FC, $36, $DB
DATA_0FCFF9:         db $EC, $EA, $E2, $F0, $CF, $D0, $E7, $E9
DATA_0FD001:         db $DC, $C9, $DB, $D8, $EE, $E5, $D0, $EA
DATA_0FD009:         db $E2, $F0, $F3, $FF

DATA_0FD00D:         db $FE, $02, $FD, $10, $FC, $30, $B2, $E5
DATA_0FD015:         db $D0, $DF, $E0, $EA, $D0, $D9, $E0, $E3
DATA_0FD01D:         db $E3, $CF, $D0, $DF, $DC, $D0, $EA, $EC
DATA_0FD025:         db $E7, $E7, $E6, $E9, $EB, $EA, $FE, $03
DATA_0FD02D:         db $FD, $18, $FC, $4D, $D8, $D0, $E7, $D8
DATA_0FD035:         db $E0, $E9, $D0, $E6, $DD, $D0, $EB, $EE
DATA_0FD03D:         db $E0, $E5, $EA, $F3, $FF

DATA_0FD042:         db $FE, $00, $FD, $00, $FC, $20, $BC, $EC
DATA_0FD04A:         db $DB, $DB, $DC, $E5, $E3, $F0, $CF, $D0
DATA_0FD052:         db $D8, $D0, $EA, $DF, $D8, $DB, $E6, $EE
DATA_0FD05A:         db $D0, $D8, $E7, $E7, $DC, $D8, $E9, $EA
DATA_0FD062:         db $FE, $01, $FD, $08, $FC, $24, $E0, $E5
DATA_0FD06A:         db $D0, $D8, $D0, $DE, $D8, $E7, $D0, $D9
DATA_0FD072:         db $DC, $EB, $EE, $DC, $DC, $E5, $D0, $EB
DATA_0FD07A:         db $DF, $DC, $D0, $DA, $E3, $E6, $EC, $DB
DATA_0FD082:         db $EA, $FF

DATA_0FD084:         db $FE, $02, $FD, $10, $FC, $30, $D8, $E5
DATA_0FD08C:         db $DB, $D0, $E9, $D8, $DA, $DC, $EA, $D0
DATA_0FD094:         db $EB, $E6, $EE, $D8, $E9, $DB, $EA, $D0
DATA_0FD09C:         db $EB, $DF, $DC, $FE, $03, $FD, $18, $FC
DATA_0FD0A4:         db $29, $EA, $EB, $E6, $E9, $E2, $D0, $EE
DATA_0FD0AC:         db $E0, $EB, $DF, $D0, $D9, $E3, $E0, $E5
DATA_0FD0B4:         db $DB, $E0, $E5, $DE, $D0, $EA, $E7, $DC
DATA_0FD0BC:         db $DC, $DB, $F3, $FF

DATA_0FD0C0:         db $FE, $00, $FE, $01, $FD, $00, $FC, $10
DATA_0FD0C8:         db $FB, $D2, $BC, $AC, $BB, $BB, $AE, $AE
DATA_0FD0D0:         db $AE, $AE, $AC, $B1, $C7, $C7, $C7, $D2
DATA_0FD0D8:         db $FF

DATA_0FD0D9:         db $FE, $02, $FD, $10, $FC, $37, $D2, $BD
DATA_0FD0E1:         db $B1, $AE, $D0, $AB, $AA, $AB, $B2, $AE
DATA_0FD0E9:         db $BC, $D0, $AA, $BB, $AE, $D0, $B6, $B2
DATA_0FD0F1:         db $B7, $AE, $C7, $D2, $FE, $03, $FF

DATA_0FD0F8:         db $FE, $00, $FE, $01, $FD, $00, $FC, $54
DATA_0FD100:         db $FB, $C0, $B8, $C0, $C7, $C7, $C7, $FF

DATA_0FD108:         db $FE, $02, $FD, $10, $FC, $30, $BC, $E5
DATA_0FD110:         db $D8, $EB, $DA, $DF, $E0, $E5, $DE, $D0
DATA_0FD118:         db $E6, $E5, $E3, $F0, $D0, $E6, $E5, $DC
DATA_0FD120:         db $D0, $D9, $D8, $D9, $F0, $CF, $FE, $03
DATA_0FD128:         db $FD, $18, $FC, $39, $EB, $DF, $DC, $D0
DATA_0FD130:         db $DA, $E9, $DC, $D8, $EB, $EC, $E9, $DC
DATA_0FD138:         db $D0, $ED, $D8, $E5, $E0, $EA, $DF, $DC
DATA_0FD140:         db $EA, $FF

DATA_0FD142:         db $FE, $00, $FD, $00, $FC, $47, $E0, $E5
DATA_0FD14A:         db $EB, $E6, $D0, $EB, $DF, $DC, $D0, $DB
DATA_0FD152:         db $D8, $E9, $E2, $E5, $DC, $EA, $EA, $FE
DATA_0FD15A:         db $01, $FD, $08, $FC, $41, $DD, $E9, $E6
DATA_0FD162:         db $E4, $D0, $EE, $DF, $DC, $E5, $DA, $DC
DATA_0FD16A:         db $D0, $E0, $EB, $D0, $DA, $D8, $E4, $DC
DATA_0FD172:         db $F3, $FF

DATA_0FD174:         db $FE, $00, $FD, $00, $FC, $34, $BD, $DF
DATA_0FD17C:         db $DC, $D0, $EA, $DC, $DA, $E6, $E5, $DB
DATA_0FD184:         db $D0, $D9, $D8, $D9, $F0, $D0, $DD, $D8
DATA_0FD18C:         db $E3, $E3, $EA, $FE, $01, $FD, $08, $FC
DATA_0FD194:         db $3B, $EC, $E5, $DB, $DC, $EB, $DC, $DA
DATA_0FD19C:         db $EB, $DC, $DB, $D0, $EB, $E6, $EE, $D8
DATA_0FD1A4:         db $E9, $DB, $EA, $FF

DATA_0FD1A8:         db $FE, $02, $FE, $03, $FD, $10, $FC, $48
DATA_0FD1B0:         db $EB, $DF, $DC, $D0, $E6, $E7, $DC, $E5
DATA_0FD1B8:         db $D0, $EA, $DC, $D8, $F3, $F3, $F3, $FF

DATA_0FD1C0:         db $FE, $00, $FE, $01, $FD, $00, $FC, $48
DATA_0FD1C8:         db $FB, $B8, $B1, $D0, $B7, $B8, $F3, $F3
DATA_0FD1D0:         db $F3, $FF

DATA_0FD1D2:         db $FE, $00, $FD, $00, $FC, $28, $B6, $DC
DATA_0FD1DA:         db $D8, $E5, $EE, $DF, $E0, $E3, $DC, $CF
DATA_0FD1E2:         db $D0, $DF, $DC, $E9, $DC, $D0, $E0, $EA
DATA_0FD1EA:         db $D0, $C2, $E6, $EA, $DF, $E0, $2B, $EA
DATA_0FD1F2:         db $FE, $01, $FD, $08, $FC, $26, $B2, $EA
DATA_0FD1FA:         db $E3, $D8, $E5, $DB, $CF, $D0, $DF, $E6
DATA_0FD202:         db $E4, $DC, $D0, $EB, $E6, $D0, $D8, $E3
DATA_0FD20A:         db $E3, $D0, $C2, $E6, $EA, $DF, $E0, $DC
DATA_0FD212:         db $EA, $F3, $FF

DATA_0FD215:         db $FE, $02, $FD, $10, $FC, $4A, $B2, $EB
DATA_0FD21D:         db $2B, $EA, $D0, $D8, $D0, $E3, $E6, $ED
DATA_0FD225:         db $DC, $E3, $F0, $D0, $DB, $D8, $F0, $CF
DATA_0FD22D:         db $FE, $03, $FD, $18, $FC, $2D, $D8, $E5
DATA_0FD235:         db $DB, $D0, $C2, $E6, $EA, $DF, $E0, $D0
DATA_0FD23D:         db $E0, $EA, $D0, $EB, $D8, $E2, $E0, $E5
DATA_0FD245:         db $DE, $D0, $D8, $D0, $EE, $D8, $E3, $E2
DATA_0FD24D:         db $F3, $FF

DATA_0FD24F:         db $FE, $00, $FE, $01, $FD, $00, $FC, $4C
DATA_0FD257:         db $FB, $B1, $BE, $B1, $C6, $C7, $C6, $FF

DATA_0FD25F:         db $FE, $02, $FD, $10, $FC, $28, $BC, $EC
DATA_0FD267:         db $DB, $DB, $DC, $E5, $E3, $F0, $CF, $D0
DATA_0FD26F:         db $D8, $D0, $D9, $D8, $D9, $F0, $D0, $DB
DATA_0FD277:         db $E9, $E6, $E7, $EA, $D0, $E0, $E5, $FE
DATA_0FD27F:         db $03, $FD, $18, $FC, $4C, $E6, $E5, $EB
DATA_0FD287:         db $E6, $D0, $DF, $E0, $EA, $D0, $D9, $D8
DATA_0FD28F:         db $DA, $E2, $F3, $FF

DATA_0FD293:         db $FE, $00, $FD, $00, $FC, $26, $BD, $DF
DATA_0FD29B:         db $DC, $D0, $D9, $D8, $D9, $F0, $D0, $EA
DATA_0FD2A3:         db $DC, $DC, $E4, $EA, $D0, $EB, $E6, $D0
DATA_0FD2AB:         db $D9, $DC, $D0, $DD, $E0, $E5, $DC, $F3
DATA_0FD2B3:         db $FE, $01, $FD, $08, $FC, $30, $BD, $DF
DATA_0FD2BB:         db $E0, $EA, $D0, $E0, $EA, $D0, $ED, $DC
DATA_0FD2C3:         db $E9, $F0, $D0, $DD, $E6, $E9, $EB, $EC
DATA_0FD2CB:         db $E5, $D8, $EB, $DC, $C7, $FF

DATA_0FD2D1:         db $FE, $02, $FD, $10, $FC, $2B, $C0, $DF
DATA_0FD2D9:         db $D8, $C9, $C6, $D0, $D0, $BC, $E6, $E4
DATA_0FD2E1:         db $DC, $EB, $DF, $E0, $E5, $DE, $D0, $DC
DATA_0FD2E9:         db $E3, $EA, $DC, $D0, $DD, $DC, $E3, $E3
DATA_0FD2F1:         db $FE, $03, $FD, $18, $FC, $4E, $EE, $E0
DATA_0FD2F9:         db $EB, $DF, $D0, $EB, $DF, $DC, $D0, $D9
DATA_0FD301:         db $D8, $D9, $F0, $D0, $F3, $F3, $F3, $FF

DATA_0FD309:         db $FE, $00, $FD, $00, $FC, $38, $B5, $DC
DATA_0FD311:         db $EB, $2B, $EA, $D0, $EB, $D8, $E2, $DC
DATA_0FD319:         db $D0, $D8, $D0, $E7, $DC, $DC, $E2, $D0
DATA_0FD321:         db $F3, $F3, $F3, $FE, $01, $FF

DATA_0FD327:         db $FE, $00, $FD, $00, $FC, $28, $B2, $EB
DATA_0FD32F:         db $D0, $E3, $E6, $E6, $E2, $EA, $D0, $E3
DATA_0FD337:         db $E0, $E2, $DC, $D0, $D8, $D0, $E4, $D8
DATA_0FD33F:         db $E7, $F3, $D0, $B6, $D8, $F0, $D9, $DC
DATA_0FD347:         db $FE, $01, $FD, $08, $FC, $30, $EB, $DF
DATA_0FD34F:         db $DC, $D0, $EA, $EB, $E6, $E9, $E2, $D0
DATA_0FD357:         db $EE, $D8, $EA, $D0, $EC, $EA, $E0, $E5
DATA_0FD35F:         db $DE, $D0, $E0, $EB, $C6, $FF

DATA_0FD365:         db $FE, $02, $FD, $10, $FC, $28, $AB, $EC
DATA_0FD36D:         db $EB, $D0, $C2, $E6, $EA, $DF, $E0, $D0
DATA_0FD375:         db $DA, $D8, $E5, $2B, $EB, $D0, $DD, $E0
DATA_0FD37D:         db $DE, $EC, $E9, $DC, $D0, $E0, $EB, $FE
DATA_0FD385:         db $03, $FD, $18, $FC, $58, $D0, $D0, $D0
DATA_0FD38D:         db $D0, $D0, $D0, $E6, $EC, $EB, $F3, $FF

DATA_0FD395:         db $FE, $00, $FD, $00, $FC, $2F, $C2, $E6
DATA_0FD39D:         db $EA, $DF, $E0, $D0, $DB, $DC, $DA, $E0
DATA_0FD3A5:         db $DB, $DC, $EA, $D0, $EB, $E6, $D0, $EB
DATA_0FD3AD:         db $D8, $E3, $E2, $D0, $EB, $E6, $FE, $01
DATA_0FD3B5:         db $FD, $08, $FC, $5D, $DF, $E0, $EA, $D0
DATA_0FD3BD:         db $DD, $E9, $E0, $DC, $E5, $DB, $EA, $F3
DATA_0FD3C5:         db $FF

DATA_0FD3C6:         db $FE, $00, $FE, $01, $FD, $00, $FC, $10
DATA_0FD3CE:         db $FB, $AA, $AA, $AA, $AA, $AA, $AA, $AA
DATA_0FD3D6:         db $AA, $AA, $AA, $B4, $B4, $C7, $C7, $C7
DATA_0FD3DE:         db $FF

DATA_0FD3DF:         db $FE, $02, $FD, $10, $FC, $28, $B4, $D8
DATA_0FD3E7:         db $E4, $DC, $E2, $CF, $D0, $EB, $DF, $DC
DATA_0FD3EF:         db $D0, $DC, $ED, $E0, $E3, $D0, $B6, $D8
DATA_0FD3F7:         db $DE, $E0, $E2, $E6, $E6, $E7, $D8, $CF
DATA_0FD3FF:         db $FE, $03, $FD, $18, $FC, $27, $D8, $E5
DATA_0FD407:         db $DB, $D0, $E2, $E0, $DB, $E5, $D8, $E7
DATA_0FD40F:         db $E7, $DC, $E9, $D0, $E6, $DD, $D0, $EB
DATA_0FD417:         db $DF, $DC, $D0, $D9, $D8, $D9, $F0, $CF
DATA_0FD41F:         db $FF

DATA_0FD420:         db $FE, $00, $FD, $00, $FC, $34, $E8, $EC
DATA_0FD428:         db $E0, $DA, $E2, $E3, $F0, $D0, $DB, $E0
DATA_0FD430:         db $EA, $E7, $D8, $EB, $DA, $DF, $DC, $EA
DATA_0FD438:         db $D0, $DF, $E0, $EA, $FE, $01, $FD, $08
DATA_0FD440:         db $FC, $6A, $EB, $E6, $D8, $DB, $E0, $DC
DATA_0FD448:         db $EA, $CF, $FF

DATA_0FD44B:         db $FE, $02, $FD, $10, $FC, $2C, $EE, $DF
DATA_0FD453:         db $DC, $E5, $D0, $DF, $DC, $D0, $DB, $E0
DATA_0FD45B:         db $EA, $DA, $E6, $ED, $DC, $E9, $EA, $D0
DATA_0FD463:         db $EB, $DF, $D8, $EB, $D0, $DF, $DC, $FE
DATA_0FD46B:         db $03, $FD, $18, $FC, $36, $E4, $E0, $EA
DATA_0FD473:         db $EA, $DC, $DB, $D0, $EB, $DF, $DC, $D0
DATA_0FD47B:         db $E6, $EB, $DF, $DC, $E9, $D0, $D9, $D8
DATA_0FD483:         db $D9, $F0, $C7, $FF

DATA_0FD487:         db $FE, $00, $FD, $00, $FC, $29, $C2, $E6
DATA_0FD48F:         db $EA, $DF, $E0, $D0, $DF, $DC, $D8, $DB
DATA_0FD497:         db $EA, $D0, $E3, $DC, $E0, $EA, $EC, $E9
DATA_0FD49F:         db $DC, $E3, $F0, $D0, $D9, $D8, $DA, $E2
DATA_0FD4A7:         db $FE, $01, $FD, $08, $FC, $37, $EB, $E6
DATA_0FD4AF:         db $D0, $EB, $DF, $DC, $D0, $E6, $EB, $DF
DATA_0FD4B7:         db $DC, $E9, $D0, $C2, $E6, $EA, $DF, $E0
DATA_0FD4BF:         db $DC, $EA, $CF, $FF

DATA_0FD4C3:         db $FE, $02, $FD, $10, $FC, $38, $EC, $E5
DATA_0FD4CB:         db $D8, $EE, $D8, $E9, $DC, $D0, $E6, $DD
DATA_0FD4D3:         db $D0, $EB, $DF, $DC, $D0, $DB, $D8, $E5
DATA_0FD4DB:         db $DE, $DC, $E9, $FE, $03, $FD, $18, $FC
DATA_0FD4E3:         db $6A, $D8, $EB, $D0, $DF, $D8, $E5, $DB
DATA_0FD4EB:         db $F3, $FF

DATA_0FD4ED:         db $FE, $00, $FD, $00, $FC, $20, $B4, $D8
DATA_0FD4F5:         db $E4, $DC, $E2, $2B, $EA, $D0, $DD, $E6
DATA_0FD4FD:         db $E9, $DA, $DC, $EA, $D0, $D8, $E9, $DC
DATA_0FD505:         db $D0, $D8, $DA, $EB, $E0, $ED, $DC, $E3
DATA_0FD50D:         db $F0, $FE, $01, $FD, $08, $FC, $3A, $EA
DATA_0FD515:         db $DC, $D8, $E9, $DA, $DF, $E0, $E5, $DE
DATA_0FD51D:         db $D0, $EB, $DF, $DC, $D0, $E0, $EA, $E3
DATA_0FD525:         db $D8, $E5, $DB, $F3, $FF

DATA_0FD52A:         db $FE, $00, $FD, $00, $FC, $22, $C0, $E0
DATA_0FD532:         db $E3, $E3, $D0, $EB, $DF, $DC, $EA, $DC
DATA_0FD53A:         db $D0, $EB, $EE, $E6, $D0, $DA, $DF, $E0
DATA_0FD542:         db $E3, $DB, $E9, $DC, $E5, $D0, $DC, $ED
DATA_0FD54A:         db $DC, $E9, $FE, $01, $FD, $08, $FC, $21
DATA_0FD552:         db $E9, $DC, $D8, $DA, $DF, $D0, $EB, $DF
DATA_0FD55A:         db $DC, $E0, $E9, $D0, $E7, $D8, $E9, $DC
DATA_0FD562:         db $E5, $EB, $EA, $D0, $EA, $D8, $DD, $DC
DATA_0FD56A:         db $E3, $F0, $C6, $FF, $A9, $C0, $FF, $9D
DATA_0FD572:         db $20, $72, $60

DATA_0FD575:         dw $D589
DATA_0FD577:         dw $D5D2
DATA_0FD579:         dw $D67E
DATA_0FD57B:         dw $D6FD

    TXY                 ; $0FD57D   |
    LDA $76,x           ; $0FD57E   |
    ASL A               ; $0FD580   |
    TAX                 ; $0FD581   |
    JSR ($D575,x)       ; $0FD582   |

    JSR CODE_0FD725     ; $0FD585   |
    RTS                 ; $0FD588   |

    TYX                 ; $0FD589   |
    LDA $70E2,x         ; $0FD58A   |
    CMP #$0084          ; $0FD58D   |
    BPL CODE_0FD5AA     ; $0FD590   |
    LDA #$0066          ; $0FD592   |
    STA $7A96,x         ; $0FD595   |
    LDA #$0058          ; $0FD598   |
    STA $7AF6,x         ; $0FD59B   |
    STZ $7220,x         ; $0FD59E   |
    LDA #$0030          ; $0FD5A1   |
    STA $7A98,x         ; $0FD5A4   |
    INC $76,x           ; $0FD5A7   |
    RTS                 ; $0FD5A9   |

CODE_0FD5AA:
    LDA $7A98,x         ; $0FD5AA   |
    BNE CODE_0FD5C3     ; $0FD5AD   |
    LDA #$0006          ; $0FD5AF   |
    STA $7A98,x         ; $0FD5B2   |
    INC $7402,x         ; $0FD5B5   |
    LDA $7402,x         ; $0FD5B8   |
    CMP #$0008          ; $0FD5BB   |
    BMI CODE_0FD5C3     ; $0FD5BE   |
    STZ $7402,x         ; $0FD5C0   |

CODE_0FD5C3:
    LDA $7AF8,x         ; $0FD5C3   |
    BNE CODE_0FD5D1     ; $0FD5C6   |
    LDA #$0002          ; $0FD5C8   |
    STA $7AF8,x         ; $0FD5CB   |
    DEC $003D           ; $0FD5CE   |

CODE_0FD5D1:
    RTS                 ; $0FD5D1   |

    TYX                 ; $0FD5D2   |
    LDA $7AF6,x         ; $0FD5D3   |
    BNE CODE_0FD605     ; $0FD5D6   |
    DEC A               ; $0FD5D8   |
    STA $7AF6,x         ; $0FD5D9   |
    LDA #$023D          ; $0FD5DC   |
    JSR CODE_0FBFCD     ; $0FD5DF   |
    LDA $70E2,x         ; $0FD5E2   |
    SEC                 ; $0FD5E5   |
    SBC #$0010          ; $0FD5E6   |
    STA $70E2,y         ; $0FD5E9   |
    LDA $7182,x         ; $0FD5EC   |
    SEC                 ; $0FD5EF   |
    SBC #$0070          ; $0FD5F0   |
    STA $7182,y         ; $0FD5F3   |
    LDA #$0700          ; $0FD5F6   |
    STA $7222,y         ; $0FD5F9   |
    STA $75E2,y         ; $0FD5FC   |
    LDA #$0100          ; $0FD5FF   |
    STA $7A36,y         ; $0FD602   |

CODE_0FD605:
    LDY $7402,x         ; $0FD605   |
    CPY #$09            ; $0FD608   |
    BEQ CODE_0FD625     ; $0FD60A   |
    LDA $7A98,x         ; $0FD60C   |
    BNE CODE_0FD624     ; $0FD60F   |
    CPY #$06            ; $0FD611   |
    BNE CODE_0FD61B     ; $0FD613   |
    LDA #$0007          ; $0FD615   |
    STA $7402,x         ; $0FD618   |

CODE_0FD61B:
    LDA #$0002          ; $0FD61B   |
    STA $7A98,x         ; $0FD61E   |
    INC $7402,x         ; $0FD621   |

CODE_0FD624:
    RTS                 ; $0FD624   |

CODE_0FD625:
    LDA $7A96,x         ; $0FD625   |
    BNE CODE_0FD639     ; $0FD628   |
    INC $7402,x         ; $0FD62A   |
    LDY #$22            ; $0FD62D   |
    STY $18,x           ; $0FD62F   |
    LDA #$02E0          ; $0FD631   |
    STA $7A96,x         ; $0FD634   |
    INC $76,x           ; $0FD637   |

CODE_0FD639:
    RTS                 ; $0FD639   |

DATA_0FD63A:         dw $221E, $2423, $2425, $1E23
DATA_0FD642:         dw $2122, $201F, $1E1F, $1D1E
DATA_0FD64A:         dw $1B1C, $191A, $1718, $1516
DATA_0FD652:         dw $1314, $1112, $0F10, $0D0E
DATA_0FD65A:         dw $0B0C

DATA_0FD65C:         dw $04FF, $0404, $0332, $1003
DATA_0FD664:         dw $0202, $0403, $F002, $24FF
DATA_0FD66C:         dw $0202, $02A0, $0202, $0202
DATA_0FD674:         dw $0202, $0202, $0220, $0202
DATA_0FD67C:         dw $0402

    TYX                 ; $0FD67E   |
    LDA $7A98,x         ; $0FD67F   |
    BNE CODE_0FD6CA     ; $0FD682   |
    DEC $18,x           ; $0FD684   |
    BPL CODE_0FD691     ; $0FD686   |
    LDA #$4005          ; $0FD688   |
    STA $7040,x         ; $0FD68B   |
    INC $76,x           ; $0FD68E   |
    RTS                 ; $0FD690   |

CODE_0FD691:
    SEP #$20            ; $0FD691   |
    LDY $18,x           ; $0FD693   |
    LDA $D65C,y         ; $0FD695   |
    STA $7A98,x         ; $0FD698   |
    LDA $D63A,y         ; $0FD69B   |
    STA $7402,x         ; $0FD69E   |
    REP #$20            ; $0FD6A1   |
    TAY                 ; $0FD6A3   |
    CPY #$1C            ; $0FD6A4   |
    BNE CODE_0FD6BC     ; $0FD6A6   |
    LDA #$023F          ; $0FD6A8   |
    JSR CODE_0FBFCD     ; $0FD6AB   |
    LDA $70E2,x         ; $0FD6AE   |
    STA $70E2,y         ; $0FD6B1   |
    LDA $7182,x         ; $0FD6B4   |
    STA $7182,y         ; $0FD6B7   |
    STY $78,x           ; $0FD6BA   |

CODE_0FD6BC:
    LDY $78,x           ; $0FD6BC   |
    BEQ CODE_0FD6CA     ; $0FD6BE   |
    LDA $7402,x         ; $0FD6C0   |
    SEC                 ; $0FD6C3   |
    SBC #$001C          ; $0FD6C4   |
    STA $7402,y         ; $0FD6C7   |

CODE_0FD6CA:
    LDA $7A96,x         ; $0FD6CA   |
    BNE CODE_0FD6FC     ; $0FD6CD   |
    DEC A               ; $0FD6CF   |
    STA $7A96,x         ; $0FD6D0   |
    LDA #$023C          ; $0FD6D3   |
    JSR CODE_0FBFCD     ; $0FD6D6   |
    LDA $70E2,x         ; $0FD6D9   |
    SEC                 ; $0FD6DC   |
    SBC #$0012          ; $0FD6DD   |
    STA $70E2,y         ; $0FD6E0   |
    LDA $7182,x         ; $0FD6E3   |
    SEC                 ; $0FD6E6   |
    SBC #$0070          ; $0FD6E7   |
    STA $7182,y         ; $0FD6EA   |
    LDA #$0400          ; $0FD6ED   |
    STA $7222,y         ; $0FD6F0   |
    STA $75E2,y         ; $0FD6F3   |
    LDA #$0040          ; $0FD6F6   |
    STA $7542,y         ; $0FD6F9   |

CODE_0FD6FC:
    RTS                 ; $0FD6FC   |

    TYX                 ; $0FD6FD   |
    RTS                 ; $0FD6FE   |

DATA_0FD6FF:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_0FD707:         db $08, $09, $0A, $0B, $0C, $0D, $0D, $0E
DATA_0FD70F:         db $0F, $10, $11, $10, $0F, $11, $10, $10
DATA_0FD717:         db $10, $10, $12, $13, $14, $15, $15, $15
DATA_0FD71F:         db $15, $15, $15, $14, $16, $16

CODE_0FD725:
    LDA $7402,x         ; $0FD725   |
    CMP $7A36,x         ; $0FD728   |
    BEQ CODE_0FD764     ; $0FD72B   |
    STA $7A36,x         ; $0FD72D   |
    REP #$10            ; $0FD730   |
    TAY                 ; $0FD732   |
    LDA $D6FF,y         ; $0FD733   |
    AND #$00FF          ; $0FD736   |
    ASL A               ; $0FD739   |
    ASL A               ; $0FD73A   |
    ASL A               ; $0FD73B   |
    ASL A               ; $0FD73C   |
    TAY                 ; $0FD73D   |
    LDA #$0008          ; $0FD73E   |
    STA $00             ; $0FD741   |
    PHX                 ; $0FD743   |
    LDX #$0000          ; $0FD744   |

CODE_0FD747:
    LDA $D765,y         ; $0FD747   |
    STA $6128,x         ; $0FD74A   |
    CLC                 ; $0FD74D   |
    ADC #$0200          ; $0FD74E   |
    STA $612A,x         ; $0FD751   |
    INX                 ; $0FD754   |
    INX                 ; $0FD755   |
    INX                 ; $0FD756   |
    INX                 ; $0FD757   |
    INY                 ; $0FD758   |
    INY                 ; $0FD759   |
    DEC $00             ; $0FD75A   |
    BNE CODE_0FD747     ; $0FD75C   |
    INC $0B85           ; $0FD75E   |
    PLX                 ; $0FD761   |
    SEP #$10            ; $0FD762   |

CODE_0FD764:
    RTS                 ; $0FD764   |

DATA_0FD765:         dw $C000, $C040, $C200, $C240
DATA_0FD76D:         dw $CC00, $CC40, $E000, $E400

DATA_0FD775:         dw $C080, $C0C0, $C280, $C2C0
DATA_0FD77D:         dw $CC80, $CCC0, $E040, $E440

DATA_0FD785:         dw $C100, $C140, $C300, $C340
DATA_0FD78D:         dw $CD00, $CD40, $E080, $E480

DATA_0FD795:         dw $C180, $C1C0, $C380, $C3C0
DATA_0FD79D:         dw $CD80, $CDC0, $E0C0, $E4C0

DATA_0FD7A5:         dw $C600, $C640, $C800, $C840
DATA_0FD7AD:         dw $D000, $D040, $E000, $E400

DATA_0FD7B5:         dw $C680, $C6C0, $C880, $C8C0
DATA_0FD7BD:         dw $D080, $D0C0, $E440, $E040

DATA_0FD7C5:         dw $C700, $C740, $C900, $C940
DATA_0FD7CD:         dw $D100, $D140, $E480, $E080

DATA_0FD7D5:         dw $C780, $C7C0, $C980, $C9C0
DATA_0FD7DD:         dw $D180, $D1C0, $E4C0, $E0C0

DATA_0FD7E5:         dw $D400, $D440, $D600, $D640
DATA_0FD7ED:         dw $D100, $D140, $E480, $E080

DATA_0FD7F5:         dw $D480, $D4C0, $D680, $D6C0
DATA_0FD7FD:         dw $D100, $D140, $E480, $E080

DATA_0FD805:         dw $DA60, $DAA0, $DAE0, $DAE0
DATA_0FD80D:         dw $D180, $D1C0, $E100, $E100

DATA_0FD815:         dw $DB20, $DB60, $DBA0, $DBA0
DATA_0FD81D:         dw $CC80, $CCC0, $E140, $E140

DATA_0FD825:         dw $DA60, $DAA0, $DAE0, $DAE0
DATA_0FD82D:         dw $CC00, $CC40, $E140, $E140

DATA_0FD835:         dw $C000, $C040, $C200, $C240
DATA_0FD83D:         dw $CC00, $CC40, $E140, $E140

DATA_0FD845:         dw $C000, $C040, $C200, $C240
DATA_0FD84D:         dw $CD00, $CD40, $E140, $E140

DATA_0FD855:         dw $C000, $C040, $C200, $C240
DATA_0FD85D:         dw $D100, $D140, $E140, $E140

DATA_0FD865:         dw $C000, $C040, $C200, $C240
DATA_0FD86D:         dw $CD00, $CD40, $E140, $E140

DATA_0FD875:         dw $C000, $C040, $C200, $C240
DATA_0FD87D:         dw $D180, $D1C0, $E140, $E140

DATA_0FD885:         dw $C100, $C140, $C200, $C240
DATA_0FD88D:         dw $CD00, $CD40, $E140, $E140

DATA_0FD895:         dw $D580, $D5C0, $D780, $D7C0
DATA_0FD89D:         dw $CD00, $CD40, $E140, $E140

DATA_0FD8A5:         dw $DA00, $DA20, $DC00, $DC20
DATA_0FD8AD:         dw $CD00, $CD40, $E140, $E140
DATA_0FD8B5:         dw $D500, $D520, $D700, $D720
DATA_0FD8BD:         dw $CD00, $CD40, $E140, $E140

DATA_0FD8C5:         dw $C000, $C040, $C200, $C240
DATA_0FD8CD:         dw $CD00, $CD40, $E140, $E140

    RTS                 ; $0FD8D5   |

DATA_0FD8D6:         dw $0100, $0001, $0100, $0001

DATA_0FD8DE:         dw $0000, $0404, $0606, $0202

DATA_0FD8E6:         dw $0060, $0074, $0076, $0600
DATA_0FD8EE:         dw $FC00, $FE00, $0000

    LDY $78,x           ; $0FD8F4   |
    CPY #$06            ; $0FD8F6   |
    BNE CODE_0FD916     ; $0FD8F8   |
    STZ $7222,x         ; $0FD8FA   |
    STZ $7220,x         ; $0FD8FD   |
    STZ $7542,x         ; $0FD900   |
    LDA #$0001          ; $0FD903   |
    STA $7402,x         ; $0FD906   |
    LDA #$007C          ; $0FD909   |
    STA $7182,x         ; $0FD90C   |
    LDA #$0804          ; $0FD90F   |
    STA $7040,x         ; $0FD912   |
    RTS                 ; $0FD915   |

CODE_0FD916:
    LDA $D8E6,y         ; $0FD916   |
    CMP $7182,x         ; $0FD919   |
    BPL CODE_0FD931     ; $0FD91C   |
    STA $7182,x         ; $0FD91E   |
    INY                 ; $0FD921   |
    INY                 ; $0FD922   |
    STY $78,x           ; $0FD923   |
    LDA $D8EC,y         ; $0FD925   |
    STA $7222,x         ; $0FD928   |
    LDA #$FF20          ; $0FD92B   |
    STA $7220,x         ; $0FD92E   |

CODE_0FD931:
    LDA $7A98,x         ; $0FD931   |
    BNE CODE_0FD965     ; $0FD934   |
    LDA $78,x           ; $0FD936   |
    AND #$0002          ; $0FD938   |
    LSR A               ; $0FD93B   |
    TAY                 ; $0FD93C   |
    LDA $D8EC,y         ; $0FD93D   |
    STA $00             ; $0FD940   |
    INC $18,x           ; $0FD942   |
    LDA $18,x           ; $0FD944   |
    BIT #$0008          ; $0FD946   |
    BEQ CODE_0FD94D     ; $0FD949   |
    STZ $18,x           ; $0FD94B   |

CODE_0FD94D:
    TAY                 ; $0FD94D   |
    SEP #$20            ; $0FD94E   |
    LDA $D8DE,y         ; $0FD950   |
    EOR $00             ; $0FD953   |
    STA $7400,x         ; $0FD955   |
    LDA #$02            ; $0FD958   |
    STA $7A98,x         ; $0FD95A   |
    LDA $D8D6,y         ; $0FD95D   |
    STA $7402,x         ; $0FD960   |
    REP #$20            ; $0FD963   |

CODE_0FD965:
    RTS                 ; $0FD965   |

    RTS                 ; $0FD966   |

DATA_0FD967:         dw $D9BA
DATA_0FD969:         dw $D9D4
DATA_0FD96B:         dw $DA04
DATA_0FD96D:         dw $DA3B
DATA_0FD96F:         dw $DA8A
DATA_0FD971:         dw $D6FD

    TXY                 ; $0FD973   |
    LDA $76,x           ; $0FD974   |
    ASL A               ; $0FD976   |
    TAX                 ; $0FD977   |
    JSR ($D967,x)       ; $0FD978   |

    LDA $7A36,x         ; $0FD97B   |
    STA $300C           ; $0FD97E   |
    EOR #$FFFF          ; $0FD981   |
    INC A               ; $0FD984   |
    CLC                 ; $0FD985   |
    ADC #$0200          ; $0FD986   |
    STA $3016           ; $0FD989   |
    LDA #$0054          ; $0FD98C   |
    STA $301A           ; $0FD98F   |
    LDA #$A0E0          ; $0FD992   |
    STA $3018           ; $0FD995   |
    STZ $3006           ; $0FD998   |
    STZ $3004           ; $0FD99B   |
    LDA #$0010          ; $0FD99E   |
    STA $3010           ; $0FD9A1   |
    ASL A               ; $0FD9A4   |
    STA $3012           ; $0FD9A5   |
    LDX #$08            ; $0FD9A8   |
    LDA #$8295          ; $0FD9AA   |
    JSL $7EDE44         ; $0FD9AD   | GSU init
    LDA #$0800          ; $0FD9B1   |
    STA $0CF9           ; $0FD9B4   |
    LDX $12             ; $0FD9B7   |
    RTS                 ; $0FD9B9   |

    TYX                 ; $0FD9BA   |
    LDA #$0050          ; $0FD9BB   |
    CMP $7182,x         ; $0FD9BE   |
    BPL CODE_0FD9CB     ; $0FD9C1   |
    STA $7182,x         ; $0FD9C3   |
    STZ $7222,x         ; $0FD9C6   |
    INC $76,x           ; $0FD9C9   |

CODE_0FD9CB:
    RTS                 ; $0FD9CB   |

DATA_0FD9CC:         dw $0140, $00C0

DATA_0FD9D0:         dw $0020, $FFE0

    TYX                 ; $0FD9D4   |
    LDY $78,x           ; $0FD9D5   |
    LDA $7A36,x         ; $0FD9D7   |
    CMP $D9CC,y         ; $0FD9DA   |
    BEQ CODE_0FD9E7     ; $0FD9DD   |
    CLC                 ; $0FD9DF   |
    ADC $D9D0,y         ; $0FD9E0   |
    STA $7A36,x         ; $0FD9E3   |
    RTS                 ; $0FD9E6   |

CODE_0FD9E7:
    INY                 ; $0FD9E7   |
    INY                 ; $0FD9E8   |
    STY $78,x           ; $0FD9E9   |
    CPY #$04            ; $0FD9EB   |
    BNE CODE_0FDA03     ; $0FD9ED   |
    LDA #$0080          ; $0FD9EF   |
    STA $7220,x         ; $0FD9F2   |
    LDA #$FC00          ; $0FD9F5   |
    STA $7222,x         ; $0FD9F8   |
    LDA #$0040          ; $0FD9FB   |
    STA $7542,x         ; $0FD9FE   |
    INC $76,x           ; $0FDA01   |

CODE_0FDA03:
    RTS                 ; $0FDA03   |

    TYX                 ; $0FDA04   |
    LDA $7A36,x         ; $0FDA05   |
    CMP #$0100          ; $0FDA08   |
    BEQ CODE_0FDA14     ; $0FDA0B   |
    CLC                 ; $0FDA0D   |
    ADC #$0010          ; $0FDA0E   |
    STA $7A36,x         ; $0FDA11   |

CODE_0FDA14:
    LDA #$006E          ; $0FDA14   |
    CMP $7182,x         ; $0FDA17   |
    BPL CODE_0FDA2A     ; $0FDA1A   |
    STA $7182,x         ; $0FDA1C   |
    STZ $7220,x         ; $0FDA1F   |
    STZ $7222,x         ; $0FDA22   |
    STZ $7542,x         ; $0FDA25   |
    INC $76,x           ; $0FDA28   |

CODE_0FDA2A:
    RTS                 ; $0FDA2A   |

DATA_0FDA2B:         dw $0140, $00C0, $0120, $0100
DATA_0FDA33:         dw $0010, $FFF0, $0008, $FFF8

    TYX                 ; $0FDA3B   |
    LDY $78,x           ; $0FDA3C   |
    LDA $7A36,x         ; $0FDA3E   |
    CMP $DA2B,y         ; $0FDA41   |
    BEQ CODE_0FDA4E     ; $0FDA44   |
    CLC                 ; $0FDA46   |
    ADC $DA33,y         ; $0FDA47   |
    STA $7A36,x         ; $0FDA4A   |
    RTS                 ; $0FDA4D   |

CODE_0FDA4E:
    INY                 ; $0FDA4E   |
    INY                 ; $0FDA4F   |
    CPY #$08            ; $0FDA50   |
    BEQ CODE_0FDA57     ; $0FDA52   |
    STY $78,x           ; $0FDA54   |
    RTS                 ; $0FDA56   |

CODE_0FDA57:
    LDA #$0040          ; $0FDA57   |
    STA $7A96,x         ; $0FDA5A   |
    STZ $78,x           ; $0FDA5D   |
    LDA #$007A          ; $0FDA5F   |
    STA $7AF6,x         ; $0FDA62   |
    INC $76,x           ; $0FDA65   |
    RTS                 ; $0FDA67   |

DATA_0FDA68:         dw $00C0, $0140, $00C0, $0140
DATA_0FDA70:         dw $00E0, $0100, $FFE0, $0020
DATA_0FDA78:         dw $FFE0, $0020, $FFE0

DATA_0FDA7E:         dw $0020, $0024, $0000, $0010
DATA_0FDA86:         dw $0000, $0000

    TYX                 ; $0FDA8A   |
    LDA $7A96,x         ; $0FDA8B   |
    BNE CODE_0FDACD     ; $0FDA8E   |
    LDA $7A98,x         ; $0FDA90   |
    BNE CODE_0FDACD     ; $0FDA93   |
    LDY $78,x           ; $0FDA95   |
    LDA $7A36,x         ; $0FDA97   |
    CMP $DA68,y         ; $0FDA9A   |
    BEQ CODE_0FDAA8     ; $0FDA9D   |
    CLC                 ; $0FDA9F   |
    ADC $DA74,y         ; $0FDAA0   |
    STA $7A36,x         ; $0FDAA3   |
    BRA CODE_0FDACD     ; $0FDAA6   |

CODE_0FDAA8:
    INY                 ; $0FDAA8   |
    INY                 ; $0FDAA9   |
    STY $78,x           ; $0FDAAA   |
    LDA $DA7E,y         ; $0FDAAC   |
    STA $7A98,x         ; $0FDAAF   |
    CPY #$0C            ; $0FDAB2   |
    BNE CODE_0FDACD     ; $0FDAB4   |
    LDY $18,x           ; $0FDAB6   |
    LDA #$0001          ; $0FDAB8   |
    STA $79D6,y         ; $0FDABB   |
    LDA #$0080          ; $0FDABE   |
    STA $7A98,y         ; $0FDAC1   |
    LDA #$2005          ; $0FDAC4   |
    STA $7040,x         ; $0FDAC7   |
    INC $76,x           ; $0FDACA   |
    RTS                 ; $0FDACC   |

CODE_0FDACD:
    LDA $7AF6,x         ; $0FDACD   |
    BNE CODE_0FDAF0     ; $0FDAD0   |
    DEC A               ; $0FDAD2   |
    STA $7AF6,x         ; $0FDAD3   |
    LDA #$023E          ; $0FDAD6   |
    JSR CODE_0FBFCD     ; $0FDAD9   |
    LDA $70E2,x         ; $0FDADC   |
    STA $70E2,y         ; $0FDADF   |
    LDA #$000A          ; $0FDAE2   |
    STA $7978,y         ; $0FDAE5   |
    LDA #$0002          ; $0FDAE8   |
    STA $7A98,y         ; $0FDAEB   |
    STY $18,x           ; $0FDAEE   |

CODE_0FDAF0:
    LDY $18,x           ; $0FDAF0   |
    BEQ CODE_0FDB2F     ; $0FDAF2   |
    LDA $7A36,x         ; $0FDAF4   |
    STA $7A36,y         ; $0FDAF7   |
    EOR #$FFFF          ; $0FDAFA   |
    INC A               ; $0FDAFD   |
    CLC                 ; $0FDAFE   |
    ADC #$0200          ; $0FDAFF   |
    STA $300C           ; $0FDB02   |
    LDA #$001C          ; $0FDB05   |
    STA $3000           ; $0FDB08   |
    LDX #$0B            ; $0FDB0B   |
    LDA #$86B6          ; $0FDB0D   |
    JSL $7EDE44         ; $0FDB10   | GSU init
    LDX $12             ; $0FDB14   |
    LDY $18,x           ; $0FDB16   |
    LDA $7182,x         ; $0FDB18   |
    CLC                 ; $0FDB1B   |
    ADC #$0010          ; $0FDB1C   |
    SEC                 ; $0FDB1F   |
    SBC $3000           ; $0FDB20   |
    STA $7182,y         ; $0FDB23   |
    LDA $7A98,y         ; $0FDB26   |
    BNE CODE_0FDB2F     ; $0FDB29   |
    INC A               ; $0FDB2B   |
    STA $7402,y         ; $0FDB2C   |

CODE_0FDB2F:
    RTS                 ; $0FDB2F   |

    RTS                 ; $0FDB30   |

DATA_0FDB31:         dw $D6FD
DATA_0FDB33:         dw $DBB0
DATA_0FDB35:         dw $D6FD

DATA_0FDB37:         dw $A0A1, $A081, $A0E1, $A0C1
DATA_0FDB3F:         dw $8081, $80A1

    TXY                 ; $0FDB43   |
    LDA $76,x           ; $0FDB44   |
    ASL A               ; $0FDB46   |
    TAX                 ; $0FDB47   |
    JSR ($DB31,x)       ; $0FDB48   |

    LDA $7A36,x         ; $0FDB4B   |
    STA $300C           ; $0FDB4E   |
    EOR #$FFFF          ; $0FDB51   |
    INC A               ; $0FDB54   |
    CLC                 ; $0FDB55   |
    ADC #$0200          ; $0FDB56   |
    STA $3016           ; $0FDB59   |
    LDY $78,x           ; $0FDB5C   |
    LDA #$0054          ; $0FDB5E   |
    STA $301A           ; $0FDB61   |
    LDA $DB37,y         ; $0FDB64   |
    STA $3018           ; $0FDB67   |
    LDA #$0020          ; $0FDB6A   |
    STA $3006           ; $0FDB6D   |
    STZ $3004           ; $0FDB70   |
    STA $3012           ; $0FDB73   |
    LSR A               ; $0FDB76   |
    STA $3010           ; $0FDB77   |
    LDX #$08            ; $0FDB7A   |
    LDA #$8295          ; $0FDB7C   |
    JSL $7EDE44         ; $0FDB7F   | GSU init
    LDA #$0800          ; $0FDB83   |
    STA $0CF9           ; $0FDB86   |
    LDX $12             ; $0FDB89   |
    LDY $74A2,x         ; $0FDB8B   |
    BPL CODE_0FDB99     ; $0FDB8E   |
    SEP #$20            ; $0FDB90   |
    LDA #$06            ; $0FDB92   |
    STA $74A2,x         ; $0FDB94   |
    REP #$20            ; $0FDB97   |

CODE_0FDB99:
    RTS                 ; $0FDB99   |

DATA_0FDB9A:         db $00, $08, $0A, $08, $00, $02, $04, $06
DATA_0FDBA2:         db $04, $02, $00

DATA_0FDBA5:         db $FF, $03, $40, $03, $03, $03, $04, $40
DATA_0FDBAD:         db $03, $04, $30

    TYX                 ; $0FDBB0   |
    LDA $7A98,x         ; $0FDBB1   |
    BNE CODE_0FDBD4     ; $0FDBB4   |
    DEC $18,x           ; $0FDBB6   |
    BPL CODE_0FDBC3     ; $0FDBB8   |
    INC $76,x           ; $0FDBBA   |
    LDA #$2005          ; $0FDBBC   |
    STA $7040,x         ; $0FDBBF   |
    RTS                 ; $0FDBC2   |

CODE_0FDBC3:
    SEP #$20            ; $0FDBC3   |
    LDY $18,x           ; $0FDBC5   |
    LDA $DBA5,y         ; $0FDBC7   |
    STA $7A98,x         ; $0FDBCA   |
    LDA $DB9A,y         ; $0FDBCD   |
    STA $78,x           ; $0FDBD0   |
    REP #$20            ; $0FDBD2   |

CODE_0FDBD4:
    RTS                 ; $0FDBD4   |

    RTS                 ; $0FDBD5   |

DATA_0FDBD6:         dw $0090, $007C, $008C, $00A4

DATA_0FDBDE:         dw $007B, $0076, $006E, $0077

DATA_0FDBE6:         dw $0218, $01B0, $0190, $0180

    LDY #$07            ; $0FDBEE   |
    STY $16,x           ; $0FDBF0   |
    LDA #$0400          ; $0FDBF2   |
    STA $75E2,x         ; $0FDBF5   |
    LDA #$0008          ; $0FDBF8   |
    STA $00             ; $0FDBFB   |

CODE_0FDBFD:
    LDY $00             ; $0FDBFD   |
    LDA $DBD4,y         ; $0FDBFF   |
    STA $02             ; $0FDC02   |
    LDA $DBDC,y         ; $0FDC04   |
    STA $04             ; $0FDC07   |
    LDA $DBE4,y         ; $0FDC09   |
    STA $06             ; $0FDC0C   |
    LDA #$0241          ; $0FDC0E   |
    JSR CODE_0FBFCD     ; $0FDC11   |
    LDA $02             ; $0FDC14   |
    STA $70E2,y         ; $0FDC16   |
    LDA $04             ; $0FDC19   |
    STA $7182,y         ; $0FDC1B   |
    LDA $06             ; $0FDC1E   |
    STA $7A96,y         ; $0FDC20   |
    LDA $00             ; $0FDC23   |
    STA $7722,y         ; $0FDC25   |
    LSR A               ; $0FDC28   |
    DEC A               ; $0FDC29   |
    STA $7402,y         ; $0FDC2A   |
    LDA #$0100          ; $0FDC2D   |
    STA $7A98,y         ; $0FDC30   |
    LDA #$0002          ; $0FDC33   |
    STA $7978,y         ; $0FDC36   |
    LDA #$0000          ; $0FDC39   |
    STA $7900,y         ; $0FDC3C   |
    LDA #$0100          ; $0FDC3F   |
    STA $7A36,y         ; $0FDC42   |
    DEC $00             ; $0FDC45   |
    DEC $00             ; $0FDC47   |
    BNE CODE_0FDBFD     ; $0FDC49   |
    LDA #$0242          ; $0FDC4B   |
    JSR CODE_0FBFCD     ; $0FDC4E   |
    LDA #$0060          ; $0FDC51   |
    STA $70E2,y         ; $0FDC54   |
    LDA #$0078          ; $0FDC57   |
    STA $7182,y         ; $0FDC5A   |
    LDA #$0009          ; $0FDC5D   |
    STA $7976,y         ; $0FDC60   |
    RTS                 ; $0FDC63   |

DATA_0FDC64:         dw $DC73
DATA_0FDC66:         dw $DCB6
DATA_0FDC68:         dw $DCEC

    TXY                 ; $0FDC6A   |
    LDA $76,x           ; $0FDC6B   |
    ASL A               ; $0FDC6D   |
    TAX                 ; $0FDC6E   |
    JSR ($DC64,x)       ; $0FDC6F   |

    RTS                 ; $0FDC72   |

    TYX                 ; $0FDC73   |
    LDA $7A98,x         ; $0FDC74   |
    BNE CODE_0FDC7C     ; $0FDC77   |
    STZ $7402,x         ; $0FDC79   |

CODE_0FDC7C:
    LDA $7A96,x         ; $0FDC7C   |
    BNE CODE_0FDCB5     ; $0FDC7F   |
    INC $76,x           ; $0FDC81   |
    DEC $16,x           ; $0FDC83   |
    BNE CODE_0FDCA6     ; $0FDC85   |
    LDA #$0014          ; $0FDC87   |
    STA $7A98,x         ; $0FDC8A   |
    LDA #$0004          ; $0FDC8D   |
    STA $7402,x         ; $0FDC90   |
    DEC A               ; $0FDC93   |
    STA $18,x           ; $0FDC94   |
    INC $76,x           ; $0FDC96   |
    LDA #$0004          ; $0FDC98   |
    LDY $7A36,x         ; $0FDC9B   |
    BEQ CODE_0FDCA3     ; $0FDC9E   |
    LDA #$0001          ; $0FDCA0   |

CODE_0FDCA3:
    STA $16,x           ; $0FDCA3   |
    RTS                 ; $0FDCA5   |

CODE_0FDCA6:
    INC $7402,x         ; $0FDCA6   |
    LDA #$FC00          ; $0FDCA9   |
    STA $7222,x         ; $0FDCAC   |
    LDA #$0040          ; $0FDCAF   |
    STA $7542,x         ; $0FDCB2   |

CODE_0FDCB5:
    RTS                 ; $0FDCB5   |

    TYX                 ; $0FDCB6   |
    LDA $7222,x         ; $0FDCB7   |
    BMI CODE_0FDCE7     ; $0FDCBA   |
    LDA #$0002          ; $0FDCBC   |
    STA $7402,x         ; $0FDCBF   |
    LDA #$0086          ; $0FDCC2   |
    CMP $7182,x         ; $0FDCC5   |
    BPL CODE_0FDCE7     ; $0FDCC8   |
    STA $7182,x         ; $0FDCCA   |
    STZ $7222,x         ; $0FDCCD   |
    STZ $7542,x         ; $0FDCD0   |
    LDA #$0003          ; $0FDCD3   |
    STA $7402,x         ; $0FDCD6   |
    LDA #$0004          ; $0FDCD9   |
    STA $7A98,x         ; $0FDCDC   |
    LDA #$000A          ; $0FDCDF   |
    STA $7A96,x         ; $0FDCE2   |
    DEC $76,x           ; $0FDCE5   |

CODE_0FDCE7:
    RTS                 ; $0FDCE7   |

DATA_0FDCE8:         db $18, $98

DATA_0FDCEA:         db $10, $90

    TYX                 ; $0FDCEC   |
    LDA $7A98,x         ; $0FDCED   |
    BNE CODE_0FDD41     ; $0FDCF0   |
    LDA $7402,x         ; $0FDCF2   |
    INC A               ; $0FDCF5   |
    CMP #$0008          ; $0FDCF6   |
    BNE CODE_0FDCFE     ; $0FDCF9   |
    LDA #$0004          ; $0FDCFB   |

CODE_0FDCFE:
    STA $7402,x         ; $0FDCFE   |
    DEC $18,x           ; $0FDD01   |
    BNE CODE_0FDD3B     ; $0FDD03   |
    DEC $16,x           ; $0FDD05   |
    BNE CODE_0FDD32     ; $0FDD07   |
    LDA #$5005          ; $0FDD09   |
    STA $7040,x         ; $0FDD0C   |
    LDA #$0003          ; $0FDD0F   |
    LDY $7A36,x         ; $0FDD12   |
    BEQ CODE_0FDD1A     ; $0FDD15   |
    LDA #$FFFF          ; $0FDD17   |

CODE_0FDD1A:
    STA $16,x           ; $0FDD1A   |
    INC $7A36,x         ; $0FDD1C   |
    STZ $76,x           ; $0FDD1F   |
    LDA $DCE8,y         ; $0FDD21   |
    AND #$00FF          ; $0FDD24   |
    STA $7A96,x         ; $0FDD27   |
    LDA $DCEA,y         ; $0FDD2A   |
    AND #$00FF          ; $0FDD2D   |
    BRA CODE_0FDD3E     ; $0FDD30   |

CODE_0FDD32:
    LDY #$03            ; $0FDD32   |
    STY $18,x           ; $0FDD34   |
    LDA #$0014          ; $0FDD36   |
    BRA CODE_0FDD3E     ; $0FDD39   |

CODE_0FDD3B:
    LDA #$0004          ; $0FDD3B   |

CODE_0FDD3E:
    STA $7A98,x         ; $0FDD3E   |

CODE_0FDD41:
    RTS                 ; $0FDD41   |

    RTS                 ; $0FDD42   |

DATA_0FDD43:         dw $C001, $E001, $E021, $E041

DATA_0FDD4B:         dw $E061, $0000, $0020, $0040
DATA_0FDD53:         dw $0060

DATA_0FDD55:         dw $DDB3
DATA_0FDD57:         dw $DE06
DATA_0FDD59:         dw $DE3D
DATA_0FDD5B:         dw $DE65
DATA_0FDD5D:         dw $DEFD
DATA_0FDD5F:         dw $DF25

    TXY                 ; $0FDD61   |
    LDA $76,x           ; $0FDD62   |
    ASL A               ; $0FDD64   |
    TAX                 ; $0FDD65   |
    JSR ($DD55,x)       ; $0FDD66   |

CODE_0FDD69:
    LDY $78,x           ; $0FDD69   |
    LDA $DD43,y         ; $0FDD6B   |
    STA $3018           ; $0FDD6E   |
    LDA #$0054          ; $0FDD71   |
    STA $301A           ; $0FDD74   |
    LDA $7A38,x         ; $0FDD77   |
    STA $300A           ; $0FDD7A   |
    LDA $7A36,x         ; $0FDD7D   |
    STA $300C           ; $0FDD80   |
    LDA #$0200          ; $0FDD83   |
    SEC                 ; $0FDD86   |
    SBC $300C           ; $0FDD87   |
    STA $3016           ; $0FDD8A   |
    LDY $7722,x         ; $0FDD8D   |
    LDA $DD4B,y         ; $0FDD90   |
    STA $3006           ; $0FDD93   |
    STZ $3004           ; $0FDD96   |
    LDX #$08            ; $0FDD99   |
    LDA #$84A5          ; $0FDD9B   |
    JSL $7EDE44         ; $0FDD9E   | GSU init
    LDX $12             ; $0FDDA2   |
    LDA #$0800          ; $0FDDA4   |
    STA $0CF9           ; $0FDDA7   |
    RTS                 ; $0FDDAA   |

DATA_0FDDAB:         dw $0048, $0120, $00C0, $0018

    TYX                 ; $0FDDB3   |
    LDA $7A98,x         ; $0FDDB4   |
    BNE CODE_0FDDDA     ; $0FDDB7   |
    DEC $18,x           ; $0FDDB9   |
    LDY $18,x           ; $0FDDBB   |
    BNE CODE_0FDDC5     ; $0FDDBD   |
    STZ $7220,x         ; $0FDDBF   |
    INC $76,x           ; $0FDDC2   |
    RTS                 ; $0FDDC4   |

CODE_0FDDC5:
    LDY $7722,x         ; $0FDDC5   |
    LDA $DDA9,y         ; $0FDDC8   |
    STA $7220,x         ; $0FDDCB   |
    LDA #$000E          ; $0FDDCE   |
    STA $7A98,x         ; $0FDDD1   |
    LDA #$000A          ; $0FDDD4   |
    STA $7AF8,x         ; $0FDDD7   |

CODE_0FDDDA:
    LDY $18,x           ; $0FDDDA   |
    CPY #$01            ; $0FDDDC   |
    BNE CODE_0FDE05     ; $0FDDDE   |
    LDA $7A36,x         ; $0FDDE0   |
    LDY $7AF8,x         ; $0FDDE3   |
    BNE CODE_0FDDF6     ; $0FDDE6   |
    SEC                 ; $0FDDE8   |
    SBC #$0030          ; $0FDDE9   |
    CMP #$0100          ; $0FDDEC   |
    BPL CODE_0FDE02     ; $0FDDEF   |
    LDA #$0100          ; $0FDDF1   |
    BRA CODE_0FDE02     ; $0FDDF4   |

CODE_0FDDF6:
    CLC                 ; $0FDDF6   |
    ADC #$0010          ; $0FDDF7   |
    CMP #$0180          ; $0FDDFA   |
    BMI CODE_0FDE02     ; $0FDDFD   |
    LDA #$0180          ; $0FDDFF   |

CODE_0FDE02:
    STA $7A36,x         ; $0FDE02   |

CODE_0FDE05:
    RTS                 ; $0FDE05   |

    TYX                 ; $0FDE06   |
    LDA $7A96,x         ; $0FDE07   |
    BNE CODE_0FDE05     ; $0FDE0A   |
    LDY $7722,x         ; $0FDE0C   |
    CPY #$02            ; $0FDE0F   |
    BNE CODE_0FDE24     ; $0FDE11   |
    LDA #$0010          ; $0FDE13   |
    STA $7A98,x         ; $0FDE16   |
    LDA #$0002          ; $0FDE19   |
    STA $16,x           ; $0FDE1C   |
    STA $78,x           ; $0FDE1E   |
    ASL A               ; $0FDE20   |
    STA $76,x           ; $0FDE21   |
    RTS                 ; $0FDE23   |

CODE_0FDE24:
    LDY #$02            ; $0FDE24   |
    STY $78,x           ; $0FDE26   |
    LDA #$0010          ; $0FDE28   |
    STA $7540,x         ; $0FDE2B   |
    LDA #$0040          ; $0FDE2E   |
    STA $75E2,x         ; $0FDE31   |
    LDA #$0300          ; $0FDE34   |
    STA $75E0,x         ; $0FDE37   |
    INC $76,x           ; $0FDE3A   |
    RTS                 ; $0FDE3C   |

    TYX                 ; $0FDE3D   |
    LDA #$0078          ; $0FDE3E   |
    CMP $7182,x         ; $0FDE41   |
    BNE CODE_0FDE4F     ; $0FDE44   |
    LDA #$0010          ; $0FDE46   |
    STA $7542,x         ; $0FDE49   |
    INC $76,x           ; $0FDE4C   |
    RTS                 ; $0FDE4E   |

CODE_0FDE4F:
    BPL CODE_0FDE55     ; $0FDE4F   |
    DEC $7182,x         ; $0FDE51   |
    RTS                 ; $0FDE54   |

CODE_0FDE55:
    INC $7182,x         ; $0FDE55   |
    RTS                 ; $0FDE58   |

DATA_0FDE59:         dw $0002, $FFFE

DATA_0FDE5D:         dw $000A, $0000

DATA_0FDE61:         dw $0006, $0004

CODE_0FDE65:
    TYX                 ; $0FDE65   |
    LDA $7A96,x         ; $0FDE66   |
    BNE CODE_0FDE89     ; $0FDE69   |
    LDA #$0010          ; $0FDE6B   |
    STA $7A96,x         ; $0FDE6E   |
    LDA $7360,x         ; $0FDE71   |
    CMP #$0244          ; $0FDE74   |
    BNE CODE_0FDE7F     ; $0FDE77   |
    LDA #$0040          ; $0FDE79   |
    STA $7A96,x         ; $0FDE7C   |

CODE_0FDE7F:
    LDA $75E2,x         ; $0FDE7F   |
    EOR #$FFFF          ; $0FDE82   |
    INC A               ; $0FDE85   |
    STA $75E2,x         ; $0FDE86   |

CODE_0FDE89:
    LDA $7AF6,x         ; $0FDE89   |
    BNE CODE_0FDEE0     ; $0FDE8C   |
    LDA #$0002          ; $0FDE8E   |
    STA $7AF6,x         ; $0FDE91   |
    LDA $7220,x         ; $0FDE94   |
    STA $3002           ; $0FDE97   |
    LDA $7222,x         ; $0FDE9A   |
    STA $3004           ; $0FDE9D   |
    LDX #$0B            ; $0FDEA0   |
    LDA #$BCF8          ; $0FDEA2   |
    JSL $7EDE44         ; $0FDEA5   | GSU init
    LDX $12             ; $0FDEA9   |
    LDA $3002           ; $0FDEAB   |
    SEP #$20            ; $0FDEAE   |
    EOR #$FF            ; $0FDEB0   |
    INC A               ; $0FDEB2   |
    CMP #$80            ; $0FDEB3   |
    ROR A               ; $0FDEB5   |
    REP #$20            ; $0FDEB6   |
    SEC                 ; $0FDEB8   |
    SBC $7A38,x         ; $0FDEB9   |
    BEQ CODE_0FDEE0     ; $0FDEBC   |
    BPL CODE_0FDECE     ; $0FDEBE   |
    CMP #$FF80          ; $0FDEC0   |
    BMI CODE_0FDED3     ; $0FDEC3   |

CODE_0FDEC5:
    LDA $7A38,x         ; $0FDEC5   |
    SEC                 ; $0FDEC8   |
    SBC #$0002          ; $0FDEC9   |
    BRA CODE_0FDEDA     ; $0FDECC   |

CODE_0FDECE:
    CMP #$0080          ; $0FDECE   |
    BPL CODE_0FDEC5     ; $0FDED1   |

CODE_0FDED3:
    LDA $7A38,x         ; $0FDED3   |
    CLC                 ; $0FDED6   |
    ADC #$0002          ; $0FDED7   |

CODE_0FDEDA:
    AND #$00FF          ; $0FDEDA   |
    STA $7A38,x         ; $0FDEDD   |

CODE_0FDEE0:
    LDY $7900,x         ; $0FDEE0   |
    LDA $78,x           ; $0FDEE3   |
    CLC                 ; $0FDEE5   |
    ADC $DE59,y         ; $0FDEE6   |
    CMP $DE5D,y         ; $0FDEE9   |
    BNE CODE_0FDEFA     ; $0FDEEC   |
    LDA $7900,x         ; $0FDEEE   |
    EOR #$0002          ; $0FDEF1   |
    STA $7900,x         ; $0FDEF4   |
    LDA $DE61,y         ; $0FDEF7   |

CODE_0FDEFA:
    STA $78,x           ; $0FDEFA   |
    RTS                 ; $0FDEFC   |

    TYX                 ; $0FDEFD   |
    LDA $7A98,x         ; $0FDEFE   |
    BNE CODE_0FDF24     ; $0FDF01   |
    DEC $16,x           ; $0FDF03   |
    BNE CODE_0FDF1C     ; $0FDF05   |
    LDA #$FC00          ; $0FDF07   |
    STA $7222,x         ; $0FDF0A   |
    LDA #$0080          ; $0FDF0D   |
    STA $7542,x         ; $0FDF10   |
    LDA #$0800          ; $0FDF13   |
    STA $75E2,x         ; $0FDF16   |
    INC $76,x           ; $0FDF19   |
    RTS                 ; $0FDF1B   |

CODE_0FDF1C:
    STZ $78,x           ; $0FDF1C   |
    LDA #$0020          ; $0FDF1E   |
    STA $7A98,x         ; $0FDF21   |

CODE_0FDF24:
    RTS                 ; $0FDF24   |

    TYX                 ; $0FDF25   |
    LDA #$0077          ; $0FDF26   |
    CMP $7182,x         ; $0FDF29   |
    BPL CODE_0FDF51     ; $0FDF2C   |
    STA $7182,x         ; $0FDF2E   |
    LDY #$02            ; $0FDF31   |
    STY $78,x           ; $0FDF33   |
    STZ $7222,x         ; $0FDF35   |
    LDA #$0010          ; $0FDF38   |
    STA $7540,x         ; $0FDF3B   |
    STZ $7542,x         ; $0FDF3E   |
    LDA #$0040          ; $0FDF41   |
    STA $75E2,x         ; $0FDF44   |
    LDA #$0300          ; $0FDF47   |
    STA $75E0,x         ; $0FDF4A   |
    LDY #$02            ; $0FDF4D   |
    STY $76,x           ; $0FDF4F   |

CODE_0FDF51:
    RTS                 ; $0FDF51   |

    RTS                 ; $0FDF52   |

DATA_0FDF53:         db $04, $02, $08, $02, $04, $02, $08, $04
DATA_0FDF5B:         db $10

DATA_0FDF5C:         db $01, $00, $02, $00, $01, $00, $02, $01
DATA_0FDF64:         db $00

    LDA $7A98,x         ; $0FDF65   |
    BNE CODE_0FDF85     ; $0FDF68   |
    DEC $16,x           ; $0FDF6A   |
    BPL CODE_0FDF73     ; $0FDF6C   |
    LDA #$0008          ; $0FDF6E   |
    STA $16,x           ; $0FDF71   |

CODE_0FDF73:
    SEP #$20            ; $0FDF73   |
    LDY $16,x           ; $0FDF75   |
    LDA $DF53,y         ; $0FDF77   |
    STA $7A98,x         ; $0FDF7A   |
    LDA $DF5C,y         ; $0FDF7D   |
    STA $7402,x         ; $0FDF80   |
    REP #$20            ; $0FDF83   |

CODE_0FDF85:
    RTS                 ; $0FDF85   |

DATA_0FDF86:         dw $0000, $0015, $0025

    LDY #$02            ; $0FDF8C   |
    LDA #$0100          ; $0FDF8E   |
    STA $7A96,x         ; $0FDF91   |
    LDA #$FF40          ; $0FDF94   |
    STA $75E0,x         ; $0FDF97   |
    LDA #$00C0          ; $0FDF9A   |
    STA $76,x           ; $0FDF9D   |
    LDA #$0008          ; $0FDF9F   |
    STA $00             ; $0FDFA2   |

CODE_0FDFA4:
    LDY $00             ; $0FDFA4   |
    LDA $DF84,y         ; $0FDFA6   |
    STA $02             ; $0FDFA9   |
    LDA #$0244          ; $0FDFAB   |
    JSR CODE_0FBFCD     ; $0FDFAE   |
    LDA #$04E0          ; $0FDFB1   |
    STA $70E2,y         ; $0FDFB4   |
    LDA #$0040          ; $0FDFB7   |
    STA $7182,y         ; $0FDFBA   |
    LDA $02             ; $0FDFBD   |
    STA $7AF8,y         ; $0FDFBF   |
    LDA $00             ; $0FDFC2   |
    STA $7722,y         ; $0FDFC4   |
    LSR A               ; $0FDFC7   |
    DEC A               ; $0FDFC8   |
    STA $7402,y         ; $0FDFC9   |
    LDA #$0100          ; $0FDFCC   |
    STA $7A36,y         ; $0FDFCF   |
    LDA #$0002          ; $0FDFD2   |
    STA $7400,y         ; $0FDFD5   |
    DEC $00             ; $0FDFD8   |
    DEC $00             ; $0FDFDA   |
    BNE CODE_0FDFA4     ; $0FDFDC   |
    RTS                 ; $0FDFDE   |

    LDA $7A96,x         ; $0FDFDF   |
    BNE CODE_0FDFEE     ; $0FDFE2   |
    INC A               ; $0FDFE4   |
    STA $7540,x         ; $0FDFE5   |
    DEC $76,x           ; $0FDFE8   |
    BPL CODE_0FDFEE     ; $0FDFEA   |
    STZ $76,x           ; $0FDFEC   |

CODE_0FDFEE:
    LDA $7A98,x         ; $0FDFEE   |
    BNE CODE_0FE007     ; $0FDFF1   |
    LDA #$0006          ; $0FDFF3   |
    STA $7A98,x         ; $0FDFF6   |
    INC $7402,x         ; $0FDFF9   |
    LDA $7402,x         ; $0FDFFC   |
    CMP #$0008          ; $0FDFFF   |
    BMI CODE_0FE007     ; $0FE002   |
    STZ $7402,x         ; $0FE004   |

CODE_0FE007:
    LDA $18,x           ; $0FE007   |
    CLC                 ; $0FE009   |
    ADC $76,x           ; $0FE00A   |
    BIT #$FF00          ; $0FE00C   |
    BEQ CODE_0FE017     ; $0FE00F   |
    DEC $003D           ; $0FE011   |
    AND #$00FF          ; $0FE014   |

CODE_0FE017:
    STA $18,x           ; $0FE017   |
    JSR CODE_0FD725     ; $0FE019   |
    RTS                 ; $0FE01C   |

    RTS                 ; $0FE01D   |

    LDA $7AF8,x         ; $0FE01E   |
    BNE CODE_0FE055     ; $0FE021   |
    LDA $7A98,x         ; $0FE023   |
    BNE CODE_0FE04E     ; $0FE026   |
    DEC A               ; $0FE028   |
    STA $7A98,x         ; $0FE029   |
    LDA #$FE80          ; $0FE02C   |
    LDY $7722,x         ; $0FE02F   |
    CPY #$08            ; $0FE032   |
    BNE CODE_0FE039     ; $0FE034   |
    LDA #$FD00          ; $0FE036   |

CODE_0FE039:
    STA $7220,x         ; $0FE039   |
    LDA #$0020          ; $0FE03C   |
    STA $7542,x         ; $0FE03F   |
    LDA #$0080          ; $0FE042   |
    STA $75E2,x         ; $0FE045   |
    LDA #$FF80          ; $0FE048   |
    STA $7222,x         ; $0FE04B   |

CODE_0FE04E:
    TXY                 ; $0FE04E   |
    JSR CODE_0FDE65     ; $0FE04F   |
    JSR CODE_0FDD69     ; $0FE052   |

CODE_0FE055:
    RTS                 ; $0FE055   |

; freespace
DATA_0FE056:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE05E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE066:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE06E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE076:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE07E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE086:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE08E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE096:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE09E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE0FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE106:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE10E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE116:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE11E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE126:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE12E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE136:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE13E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE146:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE14E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE156:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE15E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE166:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE16E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE176:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE17E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE186:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE18E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE196:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE19E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE1FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE206:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE20E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE216:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE21E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE226:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE22E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE236:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE23E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE246:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE24E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE256:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE25E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE266:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE26E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE276:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE27E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE286:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE28E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE296:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE29E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE2FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE306:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE30E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE316:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE31E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE326:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE32E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE336:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE33E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE346:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE34E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE356:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE35E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE366:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE36E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE376:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE37E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE386:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE38E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE396:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE39E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE3FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE406:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE40E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE416:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE41E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE426:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE42E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE436:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE43E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE446:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE44E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE456:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE45E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE466:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE46E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE476:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE47E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE486:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE48E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE496:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE49E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE4FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE506:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE50E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE516:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE51E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE526:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE52E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE536:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE53E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE546:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE54E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE556:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE55E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE566:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE56E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE576:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE57E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE586:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE58E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE596:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE59E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE5FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE606:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE60E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE616:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE61E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE626:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE62E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE636:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE63E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE646:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE64E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE656:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE65E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE666:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE66E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE676:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE67E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE686:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE68E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE696:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE69E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE6FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE706:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE70E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE716:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE71E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE726:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE72E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE736:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE73E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE746:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE74E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE756:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE75E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE766:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE76E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE776:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE77E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE786:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE78E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE796:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE79E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE7FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE806:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE80E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE816:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE81E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE826:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE82E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE836:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE83E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE846:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE84E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE856:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE85E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE866:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE86E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE876:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE87E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE886:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE88E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE896:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE89E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE8FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE906:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE90E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE916:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE91E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE926:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE92E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE936:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE93E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE946:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE94E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE956:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE95E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE966:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE96E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE976:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE97E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE986:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE98E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE996:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE99E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FE9FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEA9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEABE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEACE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEADE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEAFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEB9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBCE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEBFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEC9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECCE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FECFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FED9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDCE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEDFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEE9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEECE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEED6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEEFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF06:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF0E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF16:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF1E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF26:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF2E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF36:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF3E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF46:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF4E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF56:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF5E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF66:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF6E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF76:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF7E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF86:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF8E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF96:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEF9E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFA6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFAE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFB6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFBE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFC6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFCE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFD6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFDE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFE6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFEE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFF6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FEFFE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF006:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF00E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF016:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF01E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF026:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF02E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF036:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF03E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF046:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF04E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF056:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF05E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF066:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF06E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF076:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF07E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF086:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF08E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF096:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF09E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF0FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF106:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF10E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF116:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF11E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF126:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF12E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF136:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF13E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF146:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF14E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF156:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF15E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF166:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF16E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF176:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF17E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF186:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF18E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF196:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF19E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF1FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF206:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF20E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF216:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF21E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF226:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF22E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF236:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF23E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF246:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF24E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF256:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF25E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF266:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF26E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF276:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF27E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF286:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF28E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF296:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF29E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF2FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF306:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF30E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF316:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF31E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF326:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF32E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF336:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF33E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF346:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF34E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF356:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF35E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF366:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF36E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF376:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF37E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF386:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF38E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF396:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF39E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF3FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF406:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF40E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF416:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF41E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF426:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF42E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF436:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF43E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF446:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF44E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF456:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF45E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF466:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF46E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF476:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF47E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF486:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF48E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF496:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF49E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF4FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF506:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF50E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF516:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF51E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF526:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF52E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF536:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF53E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF546:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF54E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF556:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF55E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF566:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF56E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF576:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF57E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF586:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF58E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF596:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF59E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF5FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF606:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF60E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF616:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF61E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF626:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF62E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF636:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF63E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF646:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF64E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF656:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF65E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF666:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF66E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF676:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF67E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF686:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF68E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF696:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF69E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF6FE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF706:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF70E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF716:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF71E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF726:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF72E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF736:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF73E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF746:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF74E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF756:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF75E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF766:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF76E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF776:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF77E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF786:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF78E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF796:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF79E:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7A6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7AE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7B6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7BE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7C6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7CE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7D6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7DE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7E6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7EE:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7F6:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0FF7FE:         db $FF, $FF

DATA_0FF800:         dw $12E8, $12E8
DATA_0FF804:         dw $12E8, $12E8
DATA_0FF808:         dw $12E8, $12E8
DATA_0FF80C:         dw $12E8, $12E8
DATA_0FF810:         dw $12E8, $12E8
DATA_0FF814:         dw $12E8, $12E8
DATA_0FF818:         dw $12E8, $12E8
DATA_0FF81C:         dw $12E8, $12E8
DATA_0FF820:         dw $12E8, $12E8
DATA_0FF824:         dw $12E8, $12E8
DATA_0FF828:         dw $12E8, $12E8
DATA_0FF82C:         dw $12E8, $12E8
DATA_0FF830:         dw $12E8, $12E8
DATA_0FF834:         dw $12E8, $1284
DATA_0FF838:         dw $1286, $1288
DATA_0FF83C:         dw $12E8, $12E8
DATA_0FF840:         dw $12E8, $12E8
DATA_0FF844:         dw $12E8, $12E8
DATA_0FF848:         dw $12E8, $12E8
DATA_0FF84C:         dw $12E8, $12E8
DATA_0FF850:         dw $12E8, $1284
DATA_0FF854:         dw $1286, $1288
DATA_0FF858:         dw $12E8, $12E8
DATA_0FF85C:         dw $12E8, $12E8
DATA_0FF860:         dw $12E8, $12E8
DATA_0FF864:         dw $12E8, $12E8
DATA_0FF868:         dw $12E8, $12E8
DATA_0FF86C:         dw $12E8, $12E8
DATA_0FF870:         dw $12E8, $12E8
DATA_0FF874:         dw $12E8, $12E8
DATA_0FF878:         dw $12E8, $12E8
DATA_0FF87C:         dw $12E8, $12E8
DATA_0FF880:         dw $12E8, $12E8
DATA_0FF884:         dw $12E8, $12E8
DATA_0FF888:         dw $12E8, $12E8
DATA_0FF88C:         dw $12E8, $12E8
DATA_0FF890:         dw $12E8, $12E8
DATA_0FF894:         dw $12E8, $12E8
DATA_0FF898:         dw $12E8, $128C
DATA_0FF89C:         dw $128E, $12E8
DATA_0FF8A0:         dw $12E8, $1284
DATA_0FF8A4:         dw $1286, $1288
DATA_0FF8A8:         dw $12E8, $12E8
DATA_0FF8AC:         dw $12E8, $1284
DATA_0FF8B0:         dw $1286, $1288
DATA_0FF8B4:         dw $128C, $128E
DATA_0FF8B8:         dw $12E8, $12E8
DATA_0FF8BC:         dw $12E8, $12E8
DATA_0FF8C0:         dw $1280, $1282
DATA_0FF8C4:         dw $1284, $1286
DATA_0FF8C8:         dw $1288, $12E8
DATA_0FF8CC:         dw $12E8, $12E8
DATA_0FF8D0:         dw $12E8, $12E8
DATA_0FF8D4:         dw $12E8, $12E8
DATA_0FF8D8:         dw $12AA, $12AC
DATA_0FF8DC:         dw $12AE, $12E8
DATA_0FF8E0:         dw $12E8, $12E8
DATA_0FF8E4:         dw $12E8, $12E8
DATA_0FF8E8:         dw $12E8, $1280
DATA_0FF8EC:         dw $1282, $12E8
DATA_0FF8F0:         dw $12E8, $12AA
DATA_0FF8F4:         dw $12AC, $12AE
DATA_0FF8F8:         dw $12E8, $12E8
DATA_0FF8FC:         dw $12E8, $12E8
DATA_0FF900:         dw $12A0, $12A2
DATA_0FF904:         dw $12A4, $12A6
DATA_0FF908:         dw $12A8, $12E8
DATA_0FF90C:         dw $12E8, $128C
DATA_0FF910:         dw $128E, $12E8
DATA_0FF914:         dw $12E8, $12E8
DATA_0FF918:         dw $12CA, $12CC
DATA_0FF91C:         dw $12CE, $12E8
DATA_0FF920:         dw $12E8, $12E8
DATA_0FF924:         dw $12E8, $12E8
DATA_0FF928:         dw $12E8, $12C0
DATA_0FF92C:         dw $12C2, $128C
DATA_0FF930:         dw $128E, $12CA
DATA_0FF934:         dw $12CC, $12CE
DATA_0FF938:         dw $128C, $128E
DATA_0FF93C:         dw $12E8, $12E8
DATA_0FF940:         dw $12C0, $12C2
DATA_0FF944:         dw $12C4, $12C6
DATA_0FF948:         dw $12C8, $12E8
DATA_0FF94C:         dw $12AA, $12AC
DATA_0FF950:         dw $12AE, $12E8
DATA_0FF954:         dw $12E8, $12E8
DATA_0FF958:         dw $12EA, $12EC
DATA_0FF95C:         dw $12EE, $12E8
DATA_0FF960:         dw $1280, $1282
DATA_0FF964:         dw $12A4, $12A6
DATA_0FF968:         dw $12A8, $12C0
DATA_0FF96C:         dw $12C2, $12AC
DATA_0FF970:         dw $12AE, $12EA
DATA_0FF974:         dw $12EC, $12C6
DATA_0FF978:         dw $12C6, $12AE
DATA_0FF97C:         dw $12E8, $12E8
DATA_0FF980:         dw $16E0, $16E0
DATA_0FF984:         dw $16E0, $16E0
DATA_0FF988:         dw $16E0, $16E2
DATA_0FF98C:         dw $16E2, $16E0
DATA_0FF990:         dw $16E0, $16E2
DATA_0FF994:         dw $16E2, $16E2
DATA_0FF998:         dw $16E0, $16E0
DATA_0FF99C:         dw $16E0, $16E2
DATA_0FF9A0:         dw $16E0, $16E0
DATA_0FF9A4:         dw $16E0, $16E0
DATA_0FF9A8:         dw $16E2, $16E0
DATA_0FF9AC:         dw $16E0, $16E0
DATA_0FF9B0:         dw $16E0, $16E0
DATA_0FF9B4:         dw $16E0, $16E0
DATA_0FF9B8:         dw $16E0, $16E0
DATA_0FF9BC:         dw $16E2, $16E2
DATA_0FF9C0:         dw $16E6, $16E6
DATA_0FF9C4:         dw $16E6, $16E6
DATA_0FF9C8:         dw $16E6, $16E6
DATA_0FF9CC:         dw $16E6, $16E6
DATA_0FF9D0:         dw $16E6, $16E6
DATA_0FF9D4:         dw $16E6, $16E6
DATA_0FF9D8:         dw $16E6, $16E6
DATA_0FF9DC:         dw $16E6, $16E6
DATA_0FF9E0:         dw $16E6, $16E6
DATA_0FF9E4:         dw $16E6, $16E6
DATA_0FF9E8:         dw $16E6, $16E6
DATA_0FF9EC:         dw $16E6, $16E6
DATA_0FF9F0:         dw $16E6, $16E6
DATA_0FF9F4:         dw $16E6, $16E6
DATA_0FF9F8:         dw $16E6, $16E6
DATA_0FF9FC:         dw $16E6, $16E6
DATA_0FFA00:         dw $16E6, $16E6
DATA_0FFA04:         dw $16E6, $16E6
DATA_0FFA08:         dw $16E6, $16E6
DATA_0FFA0C:         dw $16E6, $16E6
DATA_0FFA10:         dw $16E6, $16E6
DATA_0FFA14:         dw $16E6, $16E6
DATA_0FFA18:         dw $16E6, $16E6
DATA_0FFA1C:         dw $16E6, $16E6
DATA_0FFA20:         dw $16E6, $16E6
DATA_0FFA24:         dw $16E6, $16E6
DATA_0FFA28:         dw $16E6, $16E6
DATA_0FFA2C:         dw $16E6, $16E6
DATA_0FFA30:         dw $16E6, $16E6
DATA_0FFA34:         dw $16E6, $16E6
DATA_0FFA38:         dw $16E6, $16E6
DATA_0FFA3C:         dw $16E6, $16E6
DATA_0FFA40:         dw $16E6, $16E6
DATA_0FFA44:         dw $16E6, $16E6
DATA_0FFA48:         dw $16E6, $16E6
DATA_0FFA4C:         dw $16E6, $16E6
DATA_0FFA50:         dw $16E6, $16E6
DATA_0FFA54:         dw $16E6, $16E6
DATA_0FFA58:         dw $16E6, $16E6
DATA_0FFA5C:         dw $16E6, $16E6
DATA_0FFA60:         dw $16E6, $16E6
DATA_0FFA64:         dw $16E6, $16E6
DATA_0FFA68:         dw $16E6, $16E6
DATA_0FFA6C:         dw $16E6, $16E6
DATA_0FFA70:         dw $16E6, $16E6
DATA_0FFA74:         dw $16E6, $16E6
DATA_0FFA78:         dw $16E6, $16E6
DATA_0FFA7C:         dw $16E6, $16E6
DATA_0FFA80:         dw $16E6, $16E6
DATA_0FFA84:         dw $16E6, $16E6
DATA_0FFA88:         dw $16E6, $16E6
DATA_0FFA8C:         dw $16E6, $16E6
DATA_0FFA90:         dw $16E6, $16E6
DATA_0FFA94:         dw $12E4, $128A
DATA_0FFA98:         dw $16E6, $16E6
DATA_0FFA9C:         dw $16E6, $16E6
DATA_0FFAA0:         dw $16E6, $16E6
DATA_0FFAA4:         dw $16E6, $16E6
DATA_0FFAA8:         dw $16E6, $16E6
DATA_0FFAAC:         dw $16E6, $16E6
DATA_0FFAB0:         dw $16E6, $16E6
DATA_0FFAB4:         dw $16E6, $16E6
DATA_0FFAB8:         dw $16E6, $16E6
DATA_0FFABC:         dw $16E6, $16E6
DATA_0FFAC0:         dw $16E6, $16E6
DATA_0FFAC4:         dw $16E6, $16E6
DATA_0FFAC8:         dw $16E6, $16E6
DATA_0FFACC:         dw $16E6, $16E6
DATA_0FFAD0:         dw $16E6, $16E6
DATA_0FFAD4:         dw $16E6, $16E6
DATA_0FFAD8:         dw $16E6, $16E6
DATA_0FFADC:         dw $16E6, $16E6
DATA_0FFAE0:         dw $16E6, $16E6
DATA_0FFAE4:         dw $16E6, $16E6
DATA_0FFAE8:         dw $16E6, $16E6
DATA_0FFAEC:         dw $16E6, $16E6
DATA_0FFAF0:         dw $16E6, $16E6
DATA_0FFAF4:         dw $16E6, $16E6
DATA_0FFAF8:         dw $16E6, $16E6
DATA_0FFAFC:         dw $16E6, $16E6
DATA_0FFB00:         dw $16E6, $12E4
DATA_0FFB04:         dw $128A, $16E6
DATA_0FFB08:         dw $16E6, $16E6
DATA_0FFB0C:         dw $16E6, $16E6
DATA_0FFB10:         dw $16E6, $16E6
DATA_0FFB14:         dw $16E6, $16E6
DATA_0FFB18:         dw $16E6, $16E6
DATA_0FFB1C:         dw $16E6, $16E6
DATA_0FFB20:         dw $16E6, $16E6
DATA_0FFB24:         dw $16E6, $16E6
DATA_0FFB28:         dw $16E6, $16E6
DATA_0FFB2C:         dw $16E6, $16E6
DATA_0FFB30:         dw $16E6, $16E6
DATA_0FFB34:         dw $16E6, $16E6
DATA_0FFB38:         dw $16E6, $16E6
DATA_0FFB3C:         dw $16E6, $16E6
DATA_0FFB40:         dw $16E6, $16E6
DATA_0FFB44:         dw $16E6, $16E6
DATA_0FFB48:         dw $16E6, $16E6
DATA_0FFB4C:         dw $16E6, $16E6
DATA_0FFB50:         dw $16E6, $16E6
DATA_0FFB54:         dw $16E6, $16E6
DATA_0FFB58:         dw $16E6, $16E6
DATA_0FFB5C:         dw $16E6, $16E6
DATA_0FFB60:         dw $16E6, $16E6
DATA_0FFB64:         dw $16E6, $16E6
DATA_0FFB68:         dw $16E6, $16E6
DATA_0FFB6C:         dw $16E6, $16E6
DATA_0FFB70:         dw $12E4, $128A
DATA_0FFB74:         dw $16E6, $16E6
DATA_0FFB78:         dw $16E6, $16E6
DATA_0FFB7C:         dw $16E6, $16E6
DATA_0FFB80:         dw $16E6, $16E6
DATA_0FFB84:         dw $16E6, $16E6
DATA_0FFB88:         dw $16E6, $16E6
DATA_0FFB8C:         dw $16E6, $16E6
DATA_0FFB90:         dw $16E6, $16E6
DATA_0FFB94:         dw $16E6, $16E6
DATA_0FFB98:         dw $16E6, $16E6
DATA_0FFB9C:         dw $12E4, $128A
DATA_0FFBA0:         dw $16E6, $16E6
DATA_0FFBA4:         dw $16E6, $16E6
DATA_0FFBA8:         dw $16E6, $16E6
DATA_0FFBAC:         dw $16E6, $16E6
DATA_0FFBB0:         dw $16E6, $16E6
DATA_0FFBB4:         dw $16E6, $16E6
DATA_0FFBB8:         dw $16E6, $16E6
DATA_0FFBBC:         dw $16E6, $16E6
DATA_0FFBC0:         dw $16E6, $16E6
DATA_0FFBC4:         dw $16E6, $16E6
DATA_0FFBC8:         dw $12E4, $128A
DATA_0FFBCC:         dw $16E6, $16E6
DATA_0FFBD0:         dw $16E6, $16E6
DATA_0FFBD4:         dw $16E6, $16E6
DATA_0FFBD8:         dw $16E6, $16E6
DATA_0FFBDC:         dw $16E6, $16E6
DATA_0FFBE0:         dw $16E6, $16E6
DATA_0FFBE4:         dw $16E6, $16E6
DATA_0FFBE8:         dw $16E6, $16E6
DATA_0FFBEC:         dw $16E6, $16E6
DATA_0FFBF0:         dw $16E6, $16E6
DATA_0FFBF4:         dw $16E6, $12E4
DATA_0FFBF8:         dw $128A, $16E6
DATA_0FFBFC:         dw $16E6, $16E6
DATA_0FFC00:         dw $16E6, $16E6
DATA_0FFC04:         dw $16E6, $16E6
DATA_0FFC08:         dw $16E6, $16E6
DATA_0FFC0C:         dw $16E6, $16E6
DATA_0FFC10:         dw $16E6, $16E6
DATA_0FFC14:         dw $16E6, $16E6
DATA_0FFC18:         dw $16E6, $16E6
DATA_0FFC1C:         dw $16E6, $16E6
DATA_0FFC20:         dw $16E6, $16E6
DATA_0FFC24:         dw $16E6, $16E6
DATA_0FFC28:         dw $12E4, $128A
DATA_0FFC2C:         dw $16E6, $16E6
DATA_0FFC30:         dw $16E6, $16E6
DATA_0FFC34:         dw $16E6, $16E6
DATA_0FFC38:         dw $16E6, $16E6
DATA_0FFC3C:         dw $16E6, $16E6
DATA_0FFC40:         dw $16E6, $16E6
DATA_0FFC44:         dw $16E6, $16E6
DATA_0FFC48:         dw $16E6, $16E6
DATA_0FFC4C:         dw $16E6, $16E6
DATA_0FFC50:         dw $16E6, $16E6
DATA_0FFC54:         dw $16E6, $16E6
DATA_0FFC58:         dw $16E6, $16E6
DATA_0FFC5C:         dw $16E6, $16E6
DATA_0FFC60:         dw $16E6, $16E6
DATA_0FFC64:         dw $16E6, $16E6
DATA_0FFC68:         dw $16E6, $16E6
DATA_0FFC6C:         dw $16E6, $16E6
DATA_0FFC70:         dw $16E6, $16E6
DATA_0FFC74:         dw $16E6, $16E6
DATA_0FFC78:         dw $12E4, $128A
DATA_0FFC7C:         dw $16E6, $16E6

; title screen tilemap
DATA_0FFC80:         dw $2722, $2722, $2722, $2722
DATA_0FFC88:         dw $2722, $2722, $2722, $2722
DATA_0FFC90:         dw $2722, $2722, $2722, $2722
DATA_0FFC98:         dw $2722, $2722, $2722, $2722
DATA_0FFCA0:         dw $2722, $2722, $2722, $2722
DATA_0FFCA8:         dw $2722, $2722, $2722, $2722
DATA_0FFCB0:         dw $2722, $2722, $2722, $2722
DATA_0FFCB8:         dw $2722, $2722, $2722, $2722
DATA_0FFCC0:         dw $2722, $2722, $2722, $2722
DATA_0FFCC8:         dw $2722, $2722, $2722, $2722
DATA_0FFCD0:         dw $2722, $2722, $2722, $2722
DATA_0FFCD8:         dw $2722, $2722, $2722, $2722
DATA_0FFCE0:         dw $2722, $2722, $2722, $2722
DATA_0FFCE8:         dw $2722, $2722, $2722, $2722
DATA_0FFCF0:         dw $2722, $2722, $2722, $2722
DATA_0FFCF8:         dw $2722, $2722, $2722, $2722
DATA_0FFD00:         dw $2722, $2722, $2722, $2722
DATA_0FFD08:         dw $2B00, $2F01, $2302, $2303
DATA_0FFD10:         dw $2304, $2B05, $2F06, $2F07
DATA_0FFD18:         dw $2308, $2B09, $2F0A, $2722
DATA_0FFD20:         dw $2F0B, $2F0C, $2F0B, $2F0C
DATA_0FFD28:         dw $2F0B, $2F0C, $2F0B, $2F0C
DATA_0FFD30:         dw $2F0B, $2F0C, $2F0B, $2F0C
DATA_0FFD38:         dw $2722, $2722, $2722, $2722
DATA_0FFD40:         dw $2722, $2722, $2722, $2722
DATA_0FFD48:         dw $2B10, $2F11, $2312, $2313
DATA_0FFD50:         dw $2314, $2B15, $2F16, $2F17
DATA_0FFD58:         dw $2318, $2B19, $2F1A, $2778
DATA_0FFD60:         dw $2F1B, $2F1C, $2F1B, $2F1C
DATA_0FFD68:         dw $2F1B, $2F1C, $2F1B, $2F1C
DATA_0FFD70:         dw $2F1B, $2F1C, $2F1B, $2F1C
DATA_0FFD78:         dw $2722, $2722, $2722, $2722
DATA_0FFD80:         dw $2722, $2722, $2722, $2722
DATA_0FFD88:         dw $2720, $2721, $277F, $A76A
DATA_0FFD90:         dw $2722, $2722, $2722, $2722
DATA_0FFD98:         dw $2722, $2722, $2722, $2723
DATA_0FFDA0:         dw $2724, $2722, $2722, $2722
DATA_0FFDA8:         dw $2722, $2722, $A777, $277F
DATA_0FFDB0:         dw $2725, $2726, $2722, $2722
DATA_0FFDB8:         dw $2722, $2722, $2722, $2722
DATA_0FFDC0:         dw $2722, $2722, $2722, $2722
DATA_0FFDC8:         dw $2727, $2728, $2729, $272A
DATA_0FFDD0:         dw $272B, $272C, $E76A, $272D
DATA_0FFDD8:         dw $272E, $272F, $2722, $2730
DATA_0FFDE0:         dw $2731, $2732, $2733, $2734
DATA_0FFDE8:         dw $2735, $2736, $2737, $2738
DATA_0FFDF0:         dw $2739, $273A, $273B, $2722
DATA_0FFDF8:         dw $2722, $2722, $2722, $2722
DATA_0FFE00:         dw $2722, $2722, $2722, $2722
DATA_0FFE08:         dw $2722, $273C, $273D, $273E
DATA_0FFE10:         dw $273F, $2740, $2741, $2742
DATA_0FFE18:         dw $2743, $2744, $A76A, $2730
DATA_0FFE20:         dw $2745, $2746, $2747, $2748
DATA_0FFE28:         dw $2749, $274A, $274B, $274C
DATA_0FFE30:         dw $274D, $274E, $274F, $2722
DATA_0FFE38:         dw $2722, $2722, $2722, $2722
DATA_0FFE40:         dw $2722, $2722, $2722, $2722
DATA_0FFE48:         dw $2722, $2722, $2750, $2751
DATA_0FFE50:         dw $2752, $2753, $2754, $2755
DATA_0FFE58:         dw $2756, $2757, $2740, $2730
DATA_0FFE60:         dw $2757, $2758, $2759, $275A
DATA_0FFE68:         dw $275B, $275C, $2739, $275D
DATA_0FFE70:         dw $275E, $275F, $A73B, $2722
DATA_0FFE78:         dw $2722, $2722, $2722, $2722
DATA_0FFE80:         dw $2722, $2722, $2722, $2722
DATA_0FFE88:         dw $2722, $2722, $2760, $2761
DATA_0FFE90:         dw $2762, $2763, $2764, $2765
DATA_0FFE98:         dw $2766, $2767, $2768, $2730
DATA_0FFEA0:         dw $2767, $2768, $2769, $276A
DATA_0FFEA8:         dw $276B, $276C, $276D, $276E
DATA_0FFEB0:         dw $276F, $2770, $2722, $2722
DATA_0FFEB8:         dw $2722, $2722, $2722, $2722
DATA_0FFEC0:         dw $2722, $2722, $2722, $2722
DATA_0FFEC8:         dw $2722, $2722, $2771, $6772
DATA_0FFED0:         dw $2772, $2773, $2722, $2722
DATA_0FFED8:         dw $2774, $2776, $A726, $2775
DATA_0FFEE0:         dw $2776, $A726, $2722, $2722
DATA_0FFEE8:         dw $2722, $2722, $2777, $2775
DATA_0FFEF0:         dw $2779, $277A, $2722, $2722
DATA_0FFEF8:         dw $2722, $2722, $2722, $2722
DATA_0FFF00:         dw $2722, $2722, $2722, $2722
DATA_0FFF08:         dw $2722, $2722, $2722, $2722
DATA_0FFF10:         dw $2722, $2722, $2722, $2722
DATA_0FFF18:         dw $2722, $2722, $2722, $2722
DATA_0FFF20:         dw $277B, $277C, $270D, $270E
DATA_0FFF28:         dw $270F, $277D, $277E, $271D
DATA_0FFF30:         dw $271E, $271F, $2722, $2722
DATA_0FFF38:         dw $2722, $2722, $2722, $2722
DATA_0FFF40:         dw $2722, $2722, $2722, $2722
DATA_0FFF48:         dw $2722, $2722, $2722, $2722
DATA_0FFF50:         dw $2722, $2722, $2722, $2722
DATA_0FFF58:         dw $2722, $2722, $2722, $2722
DATA_0FFF60:         dw $2722, $2722, $2722, $2722
DATA_0FFF68:         dw $2722, $2722, $2722, $2722
DATA_0FFF70:         dw $2722, $2722, $2722, $2722
DATA_0FFF78:         dw $2722, $2722, $2722, $2722
DATA_0FFF80:         dw $2722, $2722, $2722, $2722
DATA_0FFF88:         dw $2722, $2722, $2722, $2722
DATA_0FFF90:         dw $2722, $2722, $2722, $2722
DATA_0FFF98:         dw $2722, $2722, $2722, $2722
DATA_0FFFA0:         dw $2722, $2722, $2722, $2722
DATA_0FFFA8:         dw $2722, $2722, $2722, $2722
DATA_0FFFB0:         dw $2722, $2722, $2722, $2722
DATA_0FFFB8:         dw $2722, $2722, $2722, $2722
DATA_0FFFC0:         dw $2722, $2722, $2722, $2722
DATA_0FFFC8:         dw $2722, $2722, $2722, $2722
DATA_0FFFD0:         dw $2722, $2722, $2722, $2722
DATA_0FFFD8:         dw $2722, $2722, $2722, $2722
DATA_0FFFE0:         dw $2722, $2722, $2722, $2722
DATA_0FFFE8:         dw $2722, $2722, $2722, $2722
DATA_0FFFF0:         dw $2722, $2722, $2722, $2722
DATA_0FFFF8:         dw $2722, $2722, $2722, $2722
