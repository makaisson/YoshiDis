org $078000

.init_bubble_plant
    LDA #$0006          ; $078000   |
    STA $7A98,x         ; $078003   |
    LDA #$005A          ; $078006   |
    STA $7A96,x         ; $078009   |
    RTL                 ; $07800C   |

DATA_07800D:         db $00, $06, $07

DATA_078010:         db $04, $04, $04, $14, $02, $20, $02, $04

DATA_078018:         db $00, $02, $01, $02, $05, $03, $05, $04

.main_bubble_plant
    JSL $03AF23         ; $078020   |
    JSR CODE_078425     ; $078024   |
    LDA $16,x           ; $078027   |
    BNE CODE_078055     ; $078029   |
    LDA $7A96,x         ; $07802B   |
    BEQ CODE_078055     ; $07802E   |
    LDA $7A98,x         ; $078030   |
    BEQ CODE_078036     ; $078033   |
    RTL                 ; $078035   |

CODE_078036:
    LDA #$0006          ; $078036   |
    STA $7A98,x         ; $078039   |
    LDA $18,x           ; $07803C   |
    INC A               ; $07803E   |
    CMP #$0003          ; $07803F   |
    BCC CODE_078047     ; $078042   |
    LDA #$0000          ; $078044   |

CODE_078047:
    STA $18,x           ; $078047   |
    TAY                 ; $078049   |
    LDA $800D,y         ; $07804A   |
    AND #$00FF          ; $07804D   |
    STA $7402,x         ; $078050   |
    BRA CODE_0780C0     ; $078053   |

CODE_078055:
    LDA $7AF6,x         ; $078055   |
    BNE CODE_0780AB     ; $078058   |
    LDA $16,x           ; $07805A   |
    TAY                 ; $07805C   |
    INC $16,x           ; $07805D   |
    LDA $8010,y         ; $07805F   |
    AND #$00FF          ; $078062   |
    STA $7AF6,x         ; $078065   |
    LDA $8018,y         ; $078068   |
    AND #$00FF          ; $07806B   |
    STA $7402,x         ; $07806E   |
    CPY #$04            ; $078071   |
    BNE CODE_0780C0     ; $078073   |
    LDA #$0019          ; $078075   |
    JSL $03A364         ; $078078   |
    BCC CODE_0780C0     ; $07807C   |
    LDA $70E2,x         ; $07807E   |
    STA $70E2,y         ; $078081   |
    LDA $7182,x         ; $078084   |
    SEC                 ; $078087   |
    SBC #$0018          ; $078088   |
    STA $7182,y         ; $07808B   |
    LDA #$FF00          ; $07808E   |
    STA $7222,y         ; $078091   |
    LDA #$0004          ; $078094   |
    STA $7402,y         ; $078097   |
    LDA #$000A          ; $07809A   |
    STA $7A98,y         ; $07809D   |
    LDA $6FA0,y         ; $0780A0   |
    AND #$F9FF          ; $0780A3   |
    STA $6FA0,y         ; $0780A6   |
    BRA CODE_0780C0     ; $0780A9   |

CODE_0780AB:
    LSR A               ; $0780AB   |
    BNE CODE_0780C0     ; $0780AC   |
    LDA $16,x           ; $0780AE   |
    CMP #$0008          ; $0780B0   |
    BNE CODE_0780C0     ; $0780B3   |
    STZ $16,x           ; $0780B5   |
    STZ $7402,x         ; $0780B7   |
    LDA #$005A          ; $0780BA   |
    STA $7A96,x         ; $0780BD   |

CODE_0780C0:
    RTL                 ; $0780C0   |

DATA_0780C1:         db $FF, $9F

.init_egg_plant								 ; also needlenose plant
    JSL $02A007         ; $0780C3   |
    SEP #$20            ; $0780C7   |
    LDA $70E2,x         ; $0780C9   |
    AND #$10            ; $0780CC   |
    LSR A               ; $0780CE   |
    LSR A               ; $0780CF   |
    LSR A               ; $0780D0   |
    STA $7900,x         ; $0780D1   |
    LSR A               ; $0780D4   |
    TAY                 ; $0780D5   |
    LDA $6FA3,x         ; $0780D6   |
    AND $80C1,y         ; $0780D9   |
    STA $6FA3,x         ; $0780DC   |
    LDY #$03            ; $0780DF   |
    STY $18,x           ; $0780E1   |
    LDA $8119,y         ; $0780E3   |
    STA $7402,x         ; $0780E6   |
    LDA $811D,y         ; $0780E9   |
    STA $7A96,x         ; $0780EC   |
    REP #$20            ; $0780EF   |
    BRA CODE_07810C     ; $0780F1   |

.main_egg_plant								 ; also needlenose plant
    JSL $03AF23         ; $0780F3   |
    JSR CODE_078425     ; $0780F7   |
    LDA $61AE           ; $0780FA   |
    ORA $60AC           ; $0780FD   |
    BEQ CODE_078103     ; $078100   |
    RTL                 ; $078102   |

CODE_078103:
    JSR CODE_078411     ; $078103   |
    LDY $16,x           ; $078106   |
    TYX                 ; $078108   |
    JSR ($8113,x)       ; $078109   |

CODE_07810C:
    LDA $60C0           ; $07810C   |
    STA $7902,x         ; $07810F   |
    RTL                 ; $078112   |

DATA_078113:         dw $813D, $838A, $83C9

DATA_078119:         dw $0102, $0002
DATA_07811D:         dw $0204, $0402

DATA_078121:         dw $0000, $0080, $FF80, $0100
DATA_078129:         dw $FF00, $0040, $FFC0, $00C0
DATA_078131:         dw $0040, $FFC0, $0080, $FF80
DATA_078139:         dw $0100, $FF00

    LDX $12             ; $07813D   |
    LDA $7A96,x         ; $07813F   |
    BNE CODE_07815B     ; $078142   |
    LDY $18,x           ; $078144   |
    DEY                 ; $078146   |
    BMI CODE_07815C     ; $078147   |
    STY $18,x           ; $078149   |
    SEP #$20            ; $07814B   |
    LDA $8119,y         ; $07814D   |
    STA $7402,x         ; $078150   |
    LDA $811D,y         ; $078153   |
    STA $7A96,x         ; $078156   |
    REP #$20            ; $078159   |

CODE_07815B:
    RTS                 ; $07815B   |

CODE_07815C:
    SEP #$20            ; $07815C   |
    INC $16,x           ; $07815E   |
    INC $16,x           ; $078160   |
    LDY #$03            ; $078162   |
    STY $18,x           ; $078164   |
    LDA $8382,y         ; $078166   |
    STA $7402,x         ; $078169   |
    LDA $8386,y         ; $07816C   |
    STA $7A96,x         ; $07816F   |
    REP #$20            ; $078172   |
    LDY $7900,x         ; $078174   |
    TYX                 ; $078177   |
    JMP ($817B,x)       ; $078178   |

DATA_07817B:         dw $817F, $8297

    LDX $12             ; $07817F   |
    LDX #$09            ; $078181   |
    LDA #$91D5          ; $078183   |
    JSL $7EDE44         ; $078186   | GSU init
    LDX $12             ; $07818A   |
    LDA $300C           ; $07818C   |
    CMP #$0006          ; $07818F   |
    BCS CODE_0781FB     ; $078192   |
    CMP #$0005          ; $078194   |
    BEQ CODE_0781A0     ; $078197   |
    LDY $17,x           ; $078199   |
    BEQ CODE_0781A0     ; $07819B   |
    JMP CODE_078238     ; $07819D   |

CODE_0781A0:
    LDA $10             ; $0781A0   |
    AND #$0007          ; $0781A2   |
    ASL A               ; $0781A5   |
    CMP $78,x           ; $0781A6   |
    BNE CODE_0781AF     ; $0781A8   |
    INC A               ; $0781AA   |
    INC A               ; $0781AB   |
    AND #$000E          ; $0781AC   |

CODE_0781AF:
    STA $78,x           ; $0781AF   |
    TAY                 ; $0781B1   |
    LDA $8121,y         ; $0781B2   |
    STA $00             ; $0781B5   |
    LDA #$0025          ; $0781B7   |
    JSL $03A364         ; $0781BA   |
    BCC CODE_0781FB     ; $0781BE   |
    LDA #$0002          ; $0781C0   |
    STA $74A2,y         ; $0781C3   |
    STA $7A36,y         ; $0781C6   |
    LDA $70E2,x         ; $0781C9   |
    STA $70E2,y         ; $0781CC   |
    LDA $7182,x         ; $0781CF   |
    SEC                 ; $0781D2   |
    SBC #$0014          ; $0781D3   |
    STA $7182,y         ; $0781D6   |
    LDA $00             ; $0781D9   |
    STA $7220,y         ; $0781DB   |
    LDA #$FA00          ; $0781DE   |
    STA $7222,y         ; $0781E1   |
    LDA #$0040          ; $0781E4   |
    STA $7542,y         ; $0781E7   |
    LDA $6FA2,y         ; $0781EA   |
    AND #$FFE0          ; $0781ED   |
    STA $6FA2,y         ; $0781F0   |
    LDA #$0014          ; $0781F3   |\ play sound #$0014
    JSL $0085D2         ; $0781F6   |/
    RTS                 ; $0781FA   |

CODE_0781FB:
    LDA #$01DF          ; $0781FB   |
    JSL $008B21         ; $0781FE   |
    LDA $70E2,x         ; $078202   |
    STA $70A2,y         ; $078205   |
    LDA $7182,x         ; $078208   |
    SEC                 ; $07820B   |
    SBC #$0014          ; $07820C   |
    STA $7142,y         ; $07820F   |
    LDA #$0005          ; $078212   |
    STA $7E4C,y         ; $078215   |
    LDA #$0005          ; $078218   |
    STA $73C2,y         ; $07821B   |
    LDA #$0004          ; $07821E   |
    STA $7782,y         ; $078221   |
    LDA #$0002          ; $078224   |
    STA $7462,y         ; $078227   |
    LDA #$FF00          ; $07822A   |
    STA $71E2,y         ; $07822D   |
    LDA #$0037          ; $078230   |\ play sound #$0037
    JSL $0085D2         ; $078233   |/
    RTS                 ; $078237   |

CODE_078238:
    LDA #$0006          ; $078238   |
    SEC                 ; $07823B   |
    SBC $300C           ; $07823C   |
    DEC A               ; $07823F   |
    STA $00             ; $078240   |
    LDY #$00            ; $078242   |
    STY $17,x           ; $078244   |

CODE_078246:
    LDA $00             ; $078246   |
    ASL A               ; $078248   |
    TAY                 ; $078249   |
    LDA $8131,y         ; $07824A   |
    STA $02             ; $07824D   |
    LDA #$0025          ; $07824F   |
    JSL $03A364         ; $078252   |
    BCC CODE_07828F     ; $078256   |
    LDA #$0002          ; $078258   |
    STA $74A2,y         ; $07825B   |
    STA $7A36,y         ; $07825E   |
    LDA $70E2,x         ; $078261   |
    STA $70E2,y         ; $078264   |
    LDA $7182,x         ; $078267   |
    SEC                 ; $07826A   |
    SBC #$0014          ; $07826B   |
    STA $7182,y         ; $07826E   |
    LDA $02             ; $078271   |
    STA $7220,y         ; $078273   |
    LDA #$FA00          ; $078276   |
    STA $7222,y         ; $078279   |
    LDA #$0040          ; $07827C   |
    STA $7542,y         ; $07827F   |
    LDA $6FA2,y         ; $078282   |
    AND #$FFE0          ; $078285   |
    STA $6FA2,y         ; $078288   |
    DEC $00             ; $07828B   |
    BPL CODE_078246     ; $07828D   |

CODE_07828F:
    LDA #$0014          ; $07828F   |\ play sound #$0014
    JSL $0085D2         ; $078292   |/
    RTS                 ; $078296   |

    LDX $12             ; $078297   |
    LDX #$09            ; $078299   |
    LDA #$91D5          ; $07829B   |
    JSL $7EDE44         ; $07829E   | GSU init
    LDX $12             ; $0782A2   |
    LDA $300C           ; $0782A4   |
    CMP #$0006          ; $0782A7   |
    BCS CODE_0782DE     ; $0782AA   |
    STA $00             ; $0782AC   |
    LDA #$0163          ; $0782AE   |
    STA $3008           ; $0782B1   |
    LDA #$0164          ; $0782B4   |
    STA $300A           ; $0782B7   |
    LDX #$09            ; $0782BA   |
    LDA #$91DB          ; $0782BC   |
    JSL $7EDE44         ; $0782BF   | GSU init
    LDX $12             ; $0782C3   |
    LDA $300C           ; $0782C5   |
    CLC                 ; $0782C8   |
    ADC $00             ; $0782C9   |
    STA $00             ; $0782CB   |
    CMP #$0006          ; $0782CD   |
    BCS CODE_0782DE     ; $0782D0   |
    CMP #$0005          ; $0782D2   |
    BEQ CODE_0782E1     ; $0782D5   |
    LDY $17,x           ; $0782D7   |
    BEQ CODE_0782E1     ; $0782D9   |
    JMP CODE_078330     ; $0782DB   |

CODE_0782DE:
    JMP CODE_0781FB     ; $0782DE   |

CODE_0782E1:
    LDA $10             ; $0782E1   |
    AND #$0007          ; $0782E3   |
    ASL A               ; $0782E6   |
    CMP $78,x           ; $0782E7   |
    BNE CODE_0782F0     ; $0782E9   |
    INC A               ; $0782EB   |
    INC A               ; $0782EC   |
    AND #$000E          ; $0782ED   |

CODE_0782F0:
    STA $78,x           ; $0782F0   |
    TAY                 ; $0782F2   |
    LDA $8121,y         ; $0782F3   |
    STA $00             ; $0782F6   |
    LDA #$0163          ; $0782F8   |
    JSL $03A364         ; $0782FB   |
    BCC CODE_0782DE     ; $0782FF   |
    LDA #$0002          ; $078301   |
    STA $74A2,y         ; $078304   |
    LDA $70E2,x         ; $078307   |
    STA $70E2,y         ; $07830A   |
    LDA $7182,x         ; $07830D   |
    SEC                 ; $078310   |
    SBC #$0014          ; $078311   |
    STA $7182,y         ; $078314   |
    LDA $00             ; $078317   |
    STA $7220,y         ; $078319   |
    LDA #$FA00          ; $07831C   |
    STA $7222,y         ; $07831F   |
    LDA #$0040          ; $078322   |
    STA $7542,y         ; $078325   |
    LDA #$0014          ; $078328   |\ play sound #$0014
    JSL $0085D2         ; $07832B   |/
    RTS                 ; $07832F   |

CODE_078330:
    LDA #$0006          ; $078330   |
    SEC                 ; $078333   |
    SBC $00             ; $078334   |
    DEC A               ; $078336   |
    STA $00             ; $078337   |
    LDY #$00            ; $078339   |
    STY $17,x           ; $07833B   |

CODE_07833D:
    LDA $00             ; $07833D   |
    ASL A               ; $07833F   |
    TAY                 ; $078340   |
    LDA $8131,y         ; $078341   |
    STA $02             ; $078344   |
    LDA #$0163          ; $078346   |
    JSL $03A364         ; $078349   |
    BCC CODE_07837A     ; $07834D   |
    LDA #$0002          ; $07834F   |
    STA $74A2,y         ; $078352   |
    LDA $70E2,x         ; $078355   |
    STA $70E2,y         ; $078358   |
    LDA $7182,x         ; $07835B   |
    SEC                 ; $07835E   |
    SBC #$0014          ; $07835F   |
    STA $7182,y         ; $078362   |
    LDA $02             ; $078365   |
    STA $7220,y         ; $078367   |
    LDA #$FA00          ; $07836A   |
    STA $7222,y         ; $07836D   |
    LDA #$0040          ; $078370   |
    STA $7542,y         ; $078373   |
    DEC $00             ; $078376   |
    BPL CODE_07833D     ; $078378   |

CODE_07837A:
    LDA #$0014          ; $07837A   |\ play sound #$0014
    JSL $0085D2         ; $07837D   |/
    RTS                 ; $078381   |

DATA_078382:         db $09, $0A, $09, $08

DATA_078386:         db $02, $08, $02, $04

    LDX $12             ; $07838A   |
    LDA $7A96,x         ; $07838C   |
    BNE CODE_0783A8     ; $07838F   |
    LDY $18,x           ; $078391   |
    DEY                 ; $078393   |
    BMI CODE_0783A9     ; $078394   |
    STY $18,x           ; $078396   |
    SEP #$20            ; $078398   |
    LDA $8382,y         ; $07839A   |
    STA $7402,x         ; $07839D   |
    LDA $8386,y         ; $0783A0   |
    STA $7A96,x         ; $0783A3   |
    REP #$20            ; $0783A6   |

CODE_0783A8:
    RTS                 ; $0783A8   |

CODE_0783A9:
    SEP #$20            ; $0783A9   |
    INC $16,x           ; $0783AB   |
    INC $16,x           ; $0783AD   |
    LDY #$02            ; $0783AF   |
    STY $18,x           ; $0783B1   |
    LDA $83C6,y         ; $0783B3   |
    STA $7402,x         ; $0783B6   |
    LDA #$06            ; $0783B9   |
    STA $7A96,x         ; $0783BB   |
    LDA #$20            ; $0783BE   |
    STA $7A98,x         ; $0783C0   |
    REP #$20            ; $0783C3   |
    RTS                 ; $0783C5   |

DATA_0783C6:         db $07, $06, $00

    LDX $12             ; $0783C9   |
    LDY $17,x           ; $0783CB   |
    BNE CODE_0783D4     ; $0783CD   |
    LDA $7A98,x         ; $0783CF   |
    BNE CODE_0783DC     ; $0783D2   |

CODE_0783D4:
    LDA $7402,x         ; $0783D4   |
    CMP #$0000          ; $0783D7   |
    BEQ CODE_0783FA     ; $0783DA   |

CODE_0783DC:
    LDA $7A96,x         ; $0783DC   |
    BNE CODE_0783F9     ; $0783DF   |
    LDY $18,x           ; $0783E1   |
    DEY                 ; $0783E3   |
    BPL CODE_0783E8     ; $0783E4   |
    LDY #$02            ; $0783E6   |

CODE_0783E8:
    STY $18,x           ; $0783E8   |
    SEP #$20            ; $0783EA   |
    LDA #$06            ; $0783EC   |
    STA $7A96,x         ; $0783EE   |
    LDA $83C6,y         ; $0783F1   |
    STA $7402,x         ; $0783F4   |
    REP #$20            ; $0783F7   |

CODE_0783F9:
    RTS                 ; $0783F9   |

CODE_0783FA:
    SEP #$20            ; $0783FA   |
    STZ $16,x           ; $0783FC   |
    LDY #$03            ; $0783FE   |
    STY $18,x           ; $078400   |
    LDA $8119,y         ; $078402   |
    STA $7402,x         ; $078405   |
    LDA $811D,y         ; $078408   |
    STA $7A96,x         ; $07840B   |
    REP #$20            ; $07840E   |
    RTS                 ; $078410   |

CODE_078411:
    LDA $60D4           ; $078411   |
    BEQ CODE_078424     ; $078414   |
    LDA $60C0           ; $078416   |
    BNE CODE_078424     ; $078419   |
    LDA $7902,x         ; $07841B   |
    BEQ CODE_078424     ; $07841E   |
    LDY #$01            ; $078420   |
    STY $17,x           ; $078422   |

CODE_078424:
    RTS                 ; $078424   |

CODE_078425:
    LDA #$0040          ; $078425   |
    STA $7542,x         ; $078428   |
    LDA $7CD6,x         ; $07842B   |
    STA $300A           ; $07842E   |
    LDA $7CD8,x         ; $078431   |
    STA $300C           ; $078434   |
    LDA $7BB6,x         ; $078437   |
    STA $300E           ; $07843A   |
    LDA $7BB8,x         ; $07843D   |
    STA $3010           ; $078440   |
    LDX #$09            ; $078443   |
    LDA #$933A          ; $078445   |
    JSL $7EDE44         ; $078448   | GSU init
    LDX $12             ; $07844C   |
    LDY $3002           ; $07844E   |
    BMI CODE_078485     ; $078451   |
    LDA $3000           ; $078453   |
    CMP #$0008          ; $078456   |
    BPL CODE_078485     ; $078459   |
    CPY $12             ; $07845B   |
    BCC CODE_078486     ; $07845D   |

CODE_07845F:
    LDA $7222,y         ; $07845F   |
    CMP #$0100          ; $078462   |
    BPL CODE_07846A     ; $078465   |
    LDA #$0100          ; $078467   |

CODE_07846A:
    STA $7222,x         ; $07846A   |
    LDA $7CD8,y         ; $07846D   |
    SEC                 ; $078470   |
    SBC $7BB8,y         ; $078471   |
    SEC                 ; $078474   |
    SBC #$000E          ; $078475   |
    STA $7182,x         ; $078478   |
    LDA $70E2,x         ; $07847B   |
    CLC                 ; $07847E   |
    ADC $72C0,y         ; $07847F   |
    STA $70E2,x         ; $078482   |

CODE_078485:
    RTS                 ; $078485   |

CODE_078486:
    STY $00             ; $078486   |
    LDA $7360,x         ; $078488   |
    JSL $03A366         ; $07848B   |
    BCS CODE_078495     ; $07848F   |
    LDY $00             ; $078491   |
    BRA CODE_07845F     ; $078493   |

CODE_078495:
    LDA $70E2,x         ; $078495   |
    STA $70E2,y         ; $078498   |
    LDA $7182,x         ; $07849B   |
    STA $7182,y         ; $07849E   |
    LDA $16,x           ; $0784A1   |
    STA $7976,y         ; $0784A3   |
    LDA $18,x           ; $0784A6   |
    STA $7978,y         ; $0784A8   |
    LDA $76,x           ; $0784AB   |
    STA $79D6,y         ; $0784AD   |
    LDA $78,x           ; $0784B0   |
    STA $79D8,y         ; $0784B2   |
    LDA $7A36,x         ; $0784B5   |
    STA $7A36,y         ; $0784B8   |
    LDA $7A38,x         ; $0784BB   |
    STA $7A38,y         ; $0784BE   |
    LDA $7900,x         ; $0784C1   |
    STA $7900,y         ; $0784C4   |
    LDA $7902,x         ; $0784C7   |
    STA $7902,y         ; $0784CA   |
    LDA $7A96,x         ; $0784CD   |
    STA $7A96,y         ; $0784D0   |
    LDA $7A98,x         ; $0784D3   |
    STA $7A98,y         ; $0784D6   |
    LDA $7AF6,x         ; $0784D9   |
    STA $7AF6,y         ; $0784DC   |
    LDA $7AF8,x         ; $0784DF   |
    STA $7AF8,y         ; $0784E2   |
    LDA $7402,x         ; $0784E5   |
    STA $7402,y         ; $0784E8   |
    LDA $7860,x         ; $0784EB   |
    STA $7860,y         ; $0784EE   |
    LDA $7720,x         ; $0784F1   |
    STA $7720,y         ; $0784F4   |
    LDA $7680,x         ; $0784F7   |
    STA $7680,y         ; $0784FA   |
    LDA $7682,x         ; $0784FD   |
    STA $7682,y         ; $078500   |
    LDA $6FA2,x         ; $078503   |
    STA $6FA2,y         ; $078506   |
    SEP #$20            ; $078509   |
    LDA $74A0,x         ; $07850B   |
    STA $74A0,y         ; $07850E   |
    REP #$20            ; $078511   |
    PLA                 ; $078513   |
    JMP CODE_0703A3     ; $078514   |

DATA_078518:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_078520:         db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
DATA_078528:         db $10, $11, $12, $13, $14, $15, $16, $17

DATA_078530:         dw $FFA0, $0060

DATA_078534:         dw $0060, $FFA0

DATA_078538:         dw $0000, $0002, $0004, $0008

.init_stilt_guy
    LDA $7902,x         ; $078540   |
    BNE CODE_07856B     ; $078543   |
    LDA $70E2,x         ; $078545   |
    AND #$0010          ; $078548   |
    LSR A               ; $07854B   |
    STA $00             ; $07854C   |
    LDA $7182,x         ; $07854E   |
    AND #$0010          ; $078551   |
    ORA $00             ; $078554   |
    LSR A               ; $078556   |
    LSR A               ; $078557   |
    TAY                 ; $078558   |
    LDA $8538,y         ; $078559   |
    INC A               ; $07855C   |
    STA $7902,x         ; $07855D   |
    LDA $7042,x         ; $078560   |
    ORA $8538,y         ; $078563   |
    STA $7042,x         ; $078566   |
    BRA CODE_078575     ; $078569   |

CODE_07856B:
    LDA $7902,x         ; $07856B   |
    DEC A               ; $07856E   |
    ORA $7042,x         ; $07856F   |
    STA $7042,x         ; $078572   |

CODE_078575:
    LDA #$0003          ; $078575   |
    STA $7A96,x         ; $078578   |
    LDA #$0000          ; $07857B   |
    STA $7402,x         ; $07857E   |
    LDY $7400,x         ; $078581   |
    LDA #$0001          ; $078584   |
    STA $18,x           ; $078587   |
    LDA $7860,x         ; $078589   |
    STA $78,x           ; $07858C   |
    RTL                 ; $07858E   |

.main_stilt_guy
    LDA $6F00,x         ; $07858F   |
    CMP #$0008          ; $078592   |
    BNE CODE_0785A8     ; $078595   |
    STZ $6162           ; $078597   |
    STZ $6168           ; $07859A   |
    LDA #$0010          ; $07859D   |
    STA $6F00,x         ; $0785A0   |
    PLY                 ; $0785A3   |
    PLA                 ; $0785A4   |
    JSR CODE_07874D     ; $0785A5   |

CODE_0785A8:
    JSL $03AF23         ; $0785A8   |
    LDY $7D36,x         ; $0785AC   |
    BPL CODE_07860A     ; $0785AF   |
    LDA $60D4           ; $0785B1   |
    BEQ CODE_07860A     ; $0785B4   |
    LDA $7C18,x         ; $0785B6   |
    SEC                 ; $0785B9   |
    SBC $6122           ; $0785BA   |
    SEC                 ; $0785BD   |
    SBC $7BB8,x         ; $0785BE   |
    CMP #$FFF8          ; $0785C1   |
    BCC CODE_07860A     ; $0785C4   |
    LDY $7400,x         ; $0785C6   |
    LDA $8530,y         ; $0785C9   |
    STA $00             ; $0785CC   |
    LDA #$01F7          ; $0785CE   |
    JSL $008B21         ; $0785D1   |
    LDA $70E2,x         ; $0785D5   |
    STA $70A2,y         ; $0785D8   |
    LDA $7182,x         ; $0785DB   |
    STA $7142,y         ; $0785DE   |
    LDA $7400,x         ; $0785E1   |
    STA $73C0,y         ; $0785E4   |
    LDA $00             ; $0785E7   |
    STA $71E0,y         ; $0785E9   |
    LDA #$FC00          ; $0785EC   |
    STA $71E2,y         ; $0785EF   |
    LDA #$00C0          ; $0785F2   |
    STA $7782,y         ; $0785F5   |
    LDA $7902,x         ; $0785F8   |
    DEC A               ; $0785FB   |
    ORA $7002,y         ; $0785FC   |
    STA $7002,y         ; $0785FF   |
    JSL $0CFF61         ; $078602   |
    JMP CODE_0703B2     ; $078606   |

CODE_07860A:
    LDA $16,x           ; $07860A   |
    TAX                 ; $07860C   |
    JMP ($8610,x)       ; $07860D   |

DATA_078610:         dw $8644, $86C6

DATA_078614:         dw $0000, $FFFF, $0000, $FFFF
DATA_07861C:         dw $0000, $FFFF, $FFFE, $FFFF
DATA_078624:         dw $FFFE, $FFFF, $FFFE, $FFFF
DATA_07862C:         dw $0000, $FFFF, $0000, $FFFF
DATA_078634:         dw $0000, $0000, $FFFE, $FFFE
DATA_07863C:         dw $FFFE, $FFFF, $FFFE, $FFFF

    LDX $12             ; $078644   |
    JSR CODE_0786EE     ; $078646   |
    LDA $7860,x         ; $078649   |
    STA $78,x           ; $07864C   |
    JSR CODE_078737     ; $07864E   |
    JSL $03A5B7         ; $078651   |
    LDA $7A96,x         ; $078655   |
    BNE CODE_0786C5     ; $078658   |
    LDA #$0003          ; $07865A   |
    STA $7A96,x         ; $07865D   |
    LDA $7402,x         ; $078660   |
    STA $00             ; $078663   |
    CLC                 ; $078665   |
    ADC $18,x           ; $078666   |
    CMP #$0018          ; $078668   |
    BCC CODE_078670     ; $07866B   |
    LDA #$0000          ; $07866D   |

CODE_078670:
    STA $7402,x         ; $078670   |
    LDA $18,x           ; $078673   |
    BPL CODE_078689     ; $078675   |
    LDA $00             ; $078677   |
    ASL A               ; $078679   |
    TAY                 ; $07867A   |
    LDA $8614,y         ; $07867B   |
    LDY $7400,x         ; $07867E   |
    BNE CODE_0786A2     ; $078681   |
    EOR #$FFFF          ; $078683   |
    INC A               ; $078686   |
    BRA CODE_0786A2     ; $078687   |

CODE_078689:
    CLC                 ; $078689   |
    ADC $00             ; $07868A   |
    CMP #$0018          ; $07868C   |
    BCC CODE_078694     ; $07868F   |
    LDA #$0000          ; $078691   |

CODE_078694:
    ASL A               ; $078694   |
    TAY                 ; $078695   |
    LDA $8614,y         ; $078696   |
    LDY $7400,x         ; $078699   |
    BEQ CODE_0786A2     ; $07869C   |
    EOR #$FFFF          ; $07869E   |
    INC A               ; $0786A1   |

CODE_0786A2:
    CLC                 ; $0786A2   |
    ADC $70E2,x         ; $0786A3   |
    STA $70E2,x         ; $0786A6   |
    LDA $18,x           ; $0786A9   |
    BPL CODE_0786C5     ; $0786AB   |
    LDA $7402,x         ; $0786AD   |
    BEQ CODE_0786B7     ; $0786B0   |
    CMP #$000C          ; $0786B2   |
    BNE CODE_0786C5     ; $0786B5   |

CODE_0786B7:
    LDA #$0001          ; $0786B7   |
    STA $18,x           ; $0786BA   |
    LDA $7400,x         ; $0786BC   |
    EOR #$0002          ; $0786BF   |
    STA $7400,x         ; $0786C2   |

CODE_0786C5:
    RTL                 ; $0786C5   |
    LDX $12             ; $0786C6   |
    LDA $7860,x         ; $0786C8   |
    STA $78,x           ; $0786CB   |
    JSL $03A5B7         ; $0786CD   |
    LDA $7860,x         ; $0786D1   |
    BIT #$0001          ; $0786D4   |
    BEQ CODE_0786E3     ; $0786D7   |
    DEC $76,x           ; $0786D9   |
    BMI CODE_0786E4     ; $0786DB   |
    LDA #$FE00          ; $0786DD   |
    STA $7222,x         ; $0786E0   |

CODE_0786E3:
    RTL                 ; $0786E3   |

CODE_0786E4:
    STZ $7220,x         ; $0786E4   |
    STZ $16,x           ; $0786E7   |
    RTL                 ; $0786E9   |

DATA_0786EA:         dw $0008, $0004

CODE_0786EE:
    LDA $7400,x         ; $0786EE   |
    LDY $18,x           ; $0786F1   |
    BPL CODE_0786F8     ; $0786F3   |
    EOR #$0002          ; $0786F5   |

CODE_0786F8:
    TAY                 ; $0786F8   |
    LDA $7860,x         ; $0786F9   |
    AND $86EA,y         ; $0786FC   |
    BEQ CODE_07870A     ; $0786FF   |
    LDA $18,x           ; $078701   |
    EOR #$FFFF          ; $078703   |
    INC A               ; $078706   |
    STA $18,x           ; $078707   |
    RTS                 ; $078709   |

CODE_07870A:
    LDA $7860,x         ; $07870A   |
    BIT #$0001          ; $07870D   |
    BNE CODE_07872F     ; $078710   |
    LDA $78,x           ; $078712   |
    BIT #$0001          ; $078714   |
    BEQ CODE_078730     ; $078717   |
    LDA $70276E,x       ; $078719   |
    STA $70E2,x         ; $07871D   |
    LDA $702770,x       ; $078720   |
    STA $7182,x         ; $078724   |
    LDA $18,x           ; $078727   |
    EOR #$FFFF          ; $078729   |
    INC A               ; $07872C   |
    STA $18,x           ; $07872D   |

CODE_07872F:
    RTS                 ; $07872F   |

CODE_078730:
    LDA $7860,x         ; $078730   |
    STA $78,x           ; $078733   |
    PLA                 ; $078735   |
    RTL                 ; $078736   |

CODE_078737:
    LDY $7D36,x         ; $078737   |
    BPL CODE_078754     ; $07873A   |
    LDA $7E04           ; $07873C   |
    BNE CODE_078749     ; $07873F   |
    JSL $07FC2F         ; $078741   |
    BEQ CODE_078753     ; $078745   |
    BCS CODE_078753     ; $078747   |

CODE_078749:
    JSL $03A858         ; $078749   |

CODE_07874D:
    LDY $77C2,x         ; $07874D   |
    JMP CODE_07880B     ; $078750   |

CODE_078753:
    RTS                 ; $078753   |

CODE_078754:
    DEY                 ; $078754   |
    BMI CODE_078753     ; $078755   |
    BEQ CODE_078753     ; $078757   |
    LDA $6F00,y         ; $078759   |
    CMP #$0010          ; $07875C   |
    BNE CODE_078753     ; $07875F   |
    LDA $7D38,y         ; $078761   |
    BEQ CODE_078753     ; $078764   |
    LDA $7CD8,x         ; $078766   |
    SEC                 ; $078769   |
    SBC #$0008          ; $07876A   |
    CMP $7CD8,y         ; $07876D   |
    BPL CODE_07878C     ; $078770   |
    PHY                 ; $078772   |
    TYX                 ; $078773   |
    JSL $03B24B         ; $078774   |
    PLY                 ; $078778   |
    LDX $12             ; $078779   |
    LDA $7CD6,x         ; $07877B   |
    SEC                 ; $07877E   |
    SBC $7CD6,y         ; $07877F   |
    AND #$8000          ; $078782   |
    ASL A               ; $078785   |
    ROL A               ; $078786   |
    ASL A               ; $078787   |
    TAY                 ; $078788   |
    JMP CODE_07880B     ; $078789   |

CODE_07878C:
    LDA $7542,y         ; $07878C   |
    CMP #$0040          ; $07878F   |
    BMI CODE_078798     ; $078792   |
    PLA                 ; $078794   |
    JMP CODE_078826     ; $078795   |

CODE_078798:
    LDA $7220,y         ; $078798   |
    CMP #$8000          ; $07879B   |
    ROR A               ; $07879E   |
    CMP #$8000          ; $07879F   |
    ROR A               ; $0787A2   |
    STA $00             ; $0787A3   |
    TYX                 ; $0787A5   |
    JSL $03B24B         ; $0787A6   |
    LDX $12             ; $0787AA   |
    LDA #$01F7          ; $0787AC   |
    JSL $008B21         ; $0787AF   |
    LDA $70E2,x         ; $0787B3   |
    STA $70A2,y         ; $0787B6   |
    LDA $7182,x         ; $0787B9   |
    STA $7142,y         ; $0787BC   |
    LDA $7400,x         ; $0787BF   |
    STA $73C0,y         ; $0787C2   |
    LDA $00             ; $0787C5   |
    STA $71E0,y         ; $0787C7   |
    LDA #$FC00          ; $0787CA   |
    STA $71E2,y         ; $0787CD   |
    LDA #$00C0          ; $0787D0   |
    STA $7782,y         ; $0787D3   |
    LDA $7902,x         ; $0787D6   |
    DEC A               ; $0787D9   |
    ORA $7002,y         ; $0787DA   |
    STA $7002,y         ; $0787DD   |
    LDA #$001E          ; $0787E0   |
    STA $7360,x         ; $0787E3   |
    LDA $7040,x         ; $0787E6   |
    AND #$07FF          ; $0787E9   |
    ORA #$1800          ; $0787EC   |
    STA $7040,x         ; $0787EF   |
    SEP #$20            ; $0787F2   |
    STZ $7180,x         ; $0787F4   |
    REP #$20            ; $0787F7   |
    STZ $7402,x         ; $0787F9   |
    LDA $7182,x         ; $0787FC   |
    SEC                 ; $0787FF   |
    SBC #$0020          ; $078800   |
    STA $7182,x         ; $078803   |
    PLA                 ; $078806   |
    JMP CODE_0703B2     ; $078807   |

CODE_07880B:
    LDA $8534,y         ; $07880B   |
    STA $7220,x         ; $07880E   |
    LDA #$0015          ; $078811   |
    STA $7402,x         ; $078814   |
    LDA #$0003          ; $078817   |
    STA $76,x           ; $07881A   |
    LDY #$02            ; $07881C   |
    STY $16,x           ; $07881E   |
    PLA                 ; $078820   |
    RTL                 ; $078821   |

DATA_078822:         dw $0080, $FF80

CODE_078826:
    TYX                 ; $078826   |
    JSL $03B24B         ; $078827   |
    LDX $12             ; $07882B   |

.head_bop_stilt_guy
    PHX                 ; $07882D   |
    LDA #$01F7          ; $07882E   |
    JSL $008B21         ; $078831   |
    LDA $70E2,x         ; $078835   |
    STA $70A2,y         ; $078838   |
    LDA $7182,x         ; $07883B   |
    STA $7142,y         ; $07883E   |
    LDA $7902,x         ; $078841   |
    DEC A               ; $078844   |
    ORA $7002,y         ; $078845   |
    STA $7002,y         ; $078848   |
    LDA $7400,x         ; $07884B   |
    STA $73C0,y         ; $07884E   |
    TAX                 ; $078851   |
    LDA $91BA,x         ; $078852   |
    STA $71E0,y         ; $078855   |
    LDA #$FC00          ; $078858   |
    STA $71E2,y         ; $07885B   |
    LDA #$00C0          ; $07885E   |
    STA $7782,y         ; $078861   |
    PLX                 ; $078864   |
    PHY                 ; $078865   |
    JSL $03A331         ; $078866   |
    PLY                 ; $07886A   |
    LDA #$001E          ; $07886B   |
    TXY                 ; $07886E   |
    JSL $03A377         ; $07886F   |
    LDA $7182,x         ; $078873   |
    SEC                 ; $078876   |
    SBC #$0018          ; $078877   |
    STA $7182,x         ; $07887A   |
    LDA $6F00,x         ; $07887D   |
    CMP #$0010          ; $078880   |
    BEQ CODE_07888A     ; $078883   |
    CMP #$000E          ; $078885   |
    BNE CODE_078890     ; $078888   |

CODE_07888A:
    LDA #$0002          ; $07888A   |
    STA $6F00,x         ; $07888D   |

CODE_078890:
    RTL                 ; $078890   |

DATA_078891:         dw $FF80, $0080

DATA_078895:         db $16, $17, $18, $17, $19, $17, $18, $17
DATA_07889D:         db $19, $17, $18, $17, $19, $17, $17, $1A
DATA_0788A5:         db $1B, $1A

.init_slugger
    LDA $7902,x         ; $0788A7   |
    BNE CODE_0788B3     ; $0788AA   |
    LDA $70E2,x         ; $0788AC   |
    INC A               ; $0788AF   |
    STA $7902,x         ; $0788B0   |

CODE_0788B3:
    LDA $8932           ; $0788B3   |
    AND #$00FF          ; $0788B6   |
    STA $7402,x         ; $0788B9   |
    LDA #$0004          ; $0788BC   |
    STA $7A96,x         ; $0788BF   |
    LDY $7400,x         ; $0788C2   |
    LDA $8891,y         ; $0788C5   |
    STA $7220,x         ; $0788C8   |
    STZ $7900,x         ; $0788CB   |
    RTL                 ; $0788CE   |

DATA_0788CF:         dw $FF00, $0100

    LDA $7042,x         ; $0788D3   |
    AND #$FFF1          ; $0788D6   |
    LDY $7D38,x         ; $0788D9   |
    BEQ CODE_0788E1     ; $0788DC   |
    ORA #$0004          ; $0788DE   |

CODE_0788E1:
    STA $7042,x         ; $0788E1   |
    JSL $03AF23         ; $0788E4   |
    LDA $7900,x         ; $0788E8   |
    BEQ CODE_0788F0     ; $0788EB   |
    JMP CODE_078EC3     ; $0788ED   |

CODE_0788F0:
    LDA $7E04           ; $0788F0   |
    BNE CODE_0788FB     ; $0788F3   |
    JSL $07FC2A         ; $0788F5   |
    BCS CODE_07890A     ; $0788F9   |

CODE_0788FB:
    JSL $03A5B7         ; $0788FB   |
    JSR CODE_078DE5     ; $0788FF   |
    TXY                 ; $078902   |
    LDA $16,x           ; $078903   |
    ASL A               ; $078905   |
    TAX                 ; $078906   |
    JMP ($8928,x)       ; $078907   |

CODE_07890A:
    LDY $77C2,x         ; $07890A   |
    LDA $88CF,y         ; $07890D   |
    STA $60A8           ; $078910   |
    STA $60B4           ; $078913   |
    LDA $6FA2,x         ; $078916   |
    AND #$FCFF          ; $078919   |
    STA $6FA2,x         ; $07891C   |
    LDA #$8895          ; $07891F   |
    STA $00             ; $078922   |
    JSR CODE_07A580     ; $078924   |
    RTL                 ; $078927   |

DATA_078928:         dw $8937, $8A26, $8AEA, $8BB5, $8CD4

DATA_078932:         db $00, $01, $02, $03, $04

    TYX                 ; $078937   |
    LDA $7400,x         ; $078938   |
    TAY                 ; $07893B   |
    LDA $8891,y         ; $07893C   |
    STA $7220,x         ; $07893F   |
    JSR CODE_078EF1     ; $078942   |
    BCC CODE_078962     ; $078945   |
    JSR CODE_078F2C     ; $078947   |
    BCC CODE_078962     ; $07894A   |
    JSR CODE_078F27     ; $07894C   |
    BCC CODE_078962     ; $07894F   |
    LDA #$0030          ; $078951   |
    STA $04             ; $078954   |
    STA $08             ; $078956   |
    ASL A               ; $078958   |
    STA $06             ; $078959   |
    STA $0A             ; $07895B   |
    JSR CODE_078CF1     ; $07895D   |
    BMI CODE_07898D     ; $078960   |

CODE_078962:
    LDA #$0003          ; $078962   |
    STA $16,x           ; $078965   |
    STZ $7220,x         ; $078967   |
    LDA $02             ; $07896A   |
    STA $7400,x         ; $07896C   |
    LDA #$0000          ; $07896F   |
    STA $18,x           ; $078972   |
    TAY                 ; $078974   |
    LDA $8CB2,y         ; $078975   |
    AND #$00FF          ; $078978   |
    STA $7402,x         ; $07897B   |
    LDA $8CC3,y         ; $07897E   |
    AND #$00FF          ; $078981   |
    STA $7A96,x         ; $078984   |
    STZ $76,x           ; $078987   |
    JSR CODE_07A218     ; $078989   |
    RTL                 ; $07898C   |

CODE_07898D:
    LDA #$0020          ; $07898D   |
    STA $04             ; $078990   |
    STA $08             ; $078992   |
    ASL A               ; $078994   |
    STA $06             ; $078995   |
    STA $0A             ; $078997   |
    JSR CODE_078D33     ; $078999   |
    BMI CODE_0789C9     ; $07899C   |
    LDA #$0002          ; $07899E   |
    STA $16,x           ; $0789A1   |
    STZ $7220,x         ; $0789A3   |
    LDA $02             ; $0789A6   |
    STA $7400,x         ; $0789A8   |
    LDA #$0000          ; $0789AB   |
    STA $18,x           ; $0789AE   |
    TAY                 ; $0789B0   |
    LDA $8ADE,y         ; $0789B1   |
    AND #$00FF          ; $0789B4   |
    STA $7402,x         ; $0789B7   |
    LDA $8AE2,y         ; $0789BA   |
    AND #$00FF          ; $0789BD   |
    STA $7A96,x         ; $0789C0   |
    STZ $76,x           ; $0789C3   |
    JSR CODE_07A218     ; $0789C5   |
    RTL                 ; $0789C8   |

CODE_0789C9:
    LDA $7220,x         ; $0789C9   |
    BPL CODE_0789DD     ; $0789CC   |
    LDA $7902,x         ; $0789CE   |
    DEC A               ; $0789D1   |
    SEC                 ; $0789D2   |
    SBC #$0018          ; $0789D3   |
    CMP $70E2,x         ; $0789D6   |
    BPL CODE_0789EA     ; $0789D9   |
    BRA CODE_0789FA     ; $0789DB   |

CODE_0789DD:
    LDA $7902,x         ; $0789DD   |
    DEC A               ; $0789E0   |
    CLC                 ; $0789E1   |
    ADC #$0018          ; $0789E2   |
    CMP $70E2,x         ; $0789E5   |
    BPL CODE_0789FA     ; $0789E8   |

CODE_0789EA:
    LDA $7400,x         ; $0789EA   |
    EOR #$0002          ; $0789ED   |
    STA $7400,x         ; $0789F0   |
    TAY                 ; $0789F3   |
    LDA $8891,y         ; $0789F4   |
    STA $7220,x         ; $0789F7   |

CODE_0789FA:
    LDA $7A96,x         ; $0789FA   |
    BNE CODE_078A1D     ; $0789FD   |
    LDA $18,x           ; $0789FF   |
    INC A               ; $078A01   |
    CMP #$0005          ; $078A02   |
    BCC CODE_078A0A     ; $078A05   |
    LDA #$0000          ; $078A07   |

CODE_078A0A:
    STA $7978,x         ; $078A0A   |
    TAY                 ; $078A0D   |
    LDA $8932,y         ; $078A0E   |
    AND #$00FF          ; $078A11   |
    STA $7402,x         ; $078A14   |
    LDA #$0004          ; $078A17   |
    STA $7A96,x         ; $078A1A   |

CODE_078A1D:
    RTL                 ; $078A1D   |

DATA_078A1E:         db $08, $07, $06, $05, $20, $04, $04, $10

    TYX                 ; $078A26   |
    JSR CODE_078EF1     ; $078A27   |
    BCC CODE_078A47     ; $078A2A   |
    JSR CODE_078F2C     ; $078A2C   |
    BCC CODE_078A47     ; $078A2F   |
    JSR CODE_078F27     ; $078A31   |
    BCC CODE_078A47     ; $078A34   |
    LDA #$0030          ; $078A36   |
    STA $04             ; $078A39   |
    STA $08             ; $078A3B   |
    ASL A               ; $078A3D   |
    STA $06             ; $078A3E   |
    STA $0A             ; $078A40   |
    JSR CODE_078CF1     ; $078A42   |
    BMI CODE_078A72     ; $078A45   |

CODE_078A47:
    LDA #$0003          ; $078A47   |
    STA $16,x           ; $078A4A   |
    STZ $7220,x         ; $078A4C   |
    LDA $02             ; $078A4F   |
    STA $7400,x         ; $078A51   |
    LDA #$0000          ; $078A54   |
    STA $18,x           ; $078A57   |
    TAY                 ; $078A59   |
    LDA $8CB2,y         ; $078A5A   |
    AND #$00FF          ; $078A5D   |
    STA $7402,x         ; $078A60   |
    LDA $8CC3,y         ; $078A63   |
    AND #$00FF          ; $078A66   |
    STA $7A96,x         ; $078A69   |
    STZ $76,x           ; $078A6C   |
    JSR CODE_07A218     ; $078A6E   |
    RTL                 ; $078A71   |

CODE_078A72:
    LDA #$0020          ; $078A72   |
    STA $04             ; $078A75   |
    STA $08             ; $078A77   |
    ASL A               ; $078A79   |
    STA $06             ; $078A7A   |
    STA $0A             ; $078A7C   |
    JSR CODE_078D33     ; $078A7E   |
    BMI CODE_078AAE     ; $078A81   |
    LDA #$0002          ; $078A83   |
    STA $16,x           ; $078A86   |
    STZ $7220,x         ; $078A88   |
    LDA $02             ; $078A8B   |
    STA $7400,x         ; $078A8D   |
    LDA #$0000          ; $078A90   |
    STA $18,x           ; $078A93   |
    TAY                 ; $078A95   |
    LDA $8ADE,y         ; $078A96   |
    AND #$00FF          ; $078A99   |
    STA $7402,x         ; $078A9C   |
    LDA $8AE2,y         ; $078A9F   |
    AND #$00FF          ; $078AA2   |
    STA $7A96,x         ; $078AA5   |
    STZ $76,x           ; $078AA8   |
    JSR CODE_07A218     ; $078AAA   |
    RTL                 ; $078AAD   |

CODE_078AAE:
    LDA $7A96,x         ; $078AAE   |
    BNE CODE_078ADD     ; $078AB1   |
    LDA $18,x           ; $078AB3   |
    INC A               ; $078AB5   |
    CMP #$0004          ; $078AB6   |
    BCC CODE_078AC7     ; $078AB9   |
    LDA #$0000          ; $078ABB   |
    STA $7A96,x         ; $078ABE   |
    LDA #$0004          ; $078AC1   |
    STA $16,x           ; $078AC4   |
    RTL                 ; $078AC6   |

CODE_078AC7:
    STA $7978,x         ; $078AC7   |
    TAY                 ; $078ACA   |
    LDA $8A1E,y         ; $078ACB   |
    AND #$00FF          ; $078ACE   |
    STA $7402,x         ; $078AD1   |
    LDA $8A22,y         ; $078AD4   |
    AND #$00FF          ; $078AD7   |
    STA $7A96,x         ; $078ADA   |

CODE_078ADD:
    RTL                 ; $078ADD   |

DATA_078ADE:         db $05, $06, $07, $08, $04, $02, $02, $02

DATA_078AE6:         dw $FFE8, $0018

    TYX                 ; $078AEA   |
    JSR CODE_078EF1     ; $078AEB   |
    BCC CODE_078B1C     ; $078AEE   |
    JSR CODE_078F2C     ; $078AF0   |
    BCC CODE_078B1C     ; $078AF3   |
    JSR CODE_078F27     ; $078AF5   |
    BCC CODE_078B1C     ; $078AF8   |
    LDA #$0018          ; $078AFA   |
    STA $04             ; $078AFD   |
    STA $08             ; $078AFF   |
    ASL A               ; $078B01   |
    STA $06             ; $078B02   |
    STA $0A             ; $078B04   |
    JSR CODE_078D33     ; $078B06   |
    BPL CODE_078B1C     ; $078B09   |
    LDA #$0030          ; $078B0B   |
    STA $04             ; $078B0E   |
    STA $08             ; $078B10   |
    ASL A               ; $078B12   |
    STA $06             ; $078B13   |
    STA $0A             ; $078B15   |
    JSR CODE_078CF1     ; $078B17   |
    BMI CODE_078B47     ; $078B1A   |

CODE_078B1C:
    LDA #$0003          ; $078B1C   |
    STA $16,x           ; $078B1F   |
    STZ $7220,x         ; $078B21   |
    LDA $02             ; $078B24   |
    STA $7400,x         ; $078B26   |
    LDA #$0000          ; $078B29   |
    STA $18,x           ; $078B2C   |
    TAY                 ; $078B2E   |
    LDA $8CB2,y         ; $078B2F   |
    AND #$00FF          ; $078B32   |
    STA $7402,x         ; $078B35   |
    LDA $8CC3,y         ; $078B38   |
    AND #$00FF          ; $078B3B   |
    STA $7A96,x         ; $078B3E   |
    STZ $76,x           ; $078B41   |
    JSR CODE_07A218     ; $078B43   |
    RTL                 ; $078B46   |

CODE_078B47:
    LDA #$0020          ; $078B47   |
    STA $04             ; $078B4A   |
    STA $08             ; $078B4C   |
    ASL A               ; $078B4E   |
    STA $06             ; $078B4F   |
    STA $0A             ; $078B51   |
    JSR CODE_078D33     ; $078B53   |
    BPL CODE_078B8E     ; $078B56   |
    LDA #$0001          ; $078B58   |
    STA $16,x           ; $078B5B   |
    LDA $02             ; $078B5D   |
    STA $7400,x         ; $078B5F   |
    LDA #$0000          ; $078B62   |
    STA $18,x           ; $078B65   |
    TAY                 ; $078B67   |
    LDA $8A1E,y         ; $078B68   |
    AND #$00FF          ; $078B6B   |
    STA $7402,x         ; $078B6E   |
    LDA $8A22,y         ; $078B71   |
    AND #$00FF          ; $078B74   |
    STA $7A96,x         ; $078B77   |
    RTL                 ; $078B7A   |

    CMP $7400,x         ; $078B7B   |
    BEQ CODE_078B8E     ; $078B7E   |
    STA $7400,x         ; $078B80   |
    TAY                 ; $078B83   |
    LDA $70E2,x         ; $078B84   |
    CLC                 ; $078B87   |
    ADC $8AE6,y         ; $078B88   |
    STA $70E2,x         ; $078B8B   |

CODE_078B8E:
    LDA $7A96,x         ; $078B8E   |
    BNE CODE_078BB4     ; $078B91   |
    LDA $18,x           ; $078B93   |
    INC A               ; $078B95   |
    CMP #$0004          ; $078B96   |
    BCC CODE_078B9E     ; $078B99   |
    LDA #$0003          ; $078B9B   |

CODE_078B9E:
    STA $7978,x         ; $078B9E   |
    TAY                 ; $078BA1   |
    LDA $8ADE,y         ; $078BA2   |
    AND #$00FF          ; $078BA5   |
    STA $7402,x         ; $078BA8   |
    LDA $8AE2,y         ; $078BAB   |
    AND #$00FF          ; $078BAE   |
    STA $7A96,x         ; $078BB1   |

CODE_078BB4:
    RTL                 ; $078BB4   |

    LDX $12             ; $078BB5   |
    LDY $18,x           ; $078BB7   |
    CPY #$08            ; $078BB9   |
    BCC CODE_078BC2     ; $078BBB   |
    JSR CODE_078F2C     ; $078BBD   |
    BCC CODE_078BEB     ; $078BC0   |

CODE_078BC2:
    LDA $18,x           ; $078BC2   |
    SEC                 ; $078BC4   |
    SBC #$0001          ; $078BC5   |
    CMP #$0007          ; $078BC8   |
    BCC CODE_078C0B     ; $078BCB   |
    CMP #$0010          ; $078BCD   |
    BCS CODE_078BE8     ; $078BD0   |
    LDA #$0030          ; $078BD2   |
    STA $04             ; $078BD5   |
    STA $08             ; $078BD7   |
    ASL A               ; $078BD9   |
    STA $06             ; $078BDA   |
    STA $0A             ; $078BDC   |
    JSR CODE_078CF1     ; $078BDE   |
    BMI CODE_078BE8     ; $078BE1   |
    TYA                 ; $078BE3   |
    CMP $78,x           ; $078BE4   |
    BNE CODE_078BEB     ; $078BE6   |

CODE_078BE8:
    JMP CODE_078C84     ; $078BE8   |

CODE_078BEB:
    LDA $02             ; $078BEB   |
    STA $7400,x         ; $078BED   |
    LDA #$0000          ; $078BF0   |
    STA $18,x           ; $078BF3   |
    TAY                 ; $078BF5   |
    LDA $8CB2,y         ; $078BF6   |
    AND #$00FF          ; $078BF9   |
    STA $7402,x         ; $078BFC   |
    LDA $8CC3,y         ; $078BFF   |
    AND #$00FF          ; $078C02   |
    STA $7A96,x         ; $078C05   |
    STZ $76,x           ; $078C08   |
    RTL                 ; $078C0A   |

CODE_078C0B:
    LDA $76,x           ; $078C0B   |
    BNE CODE_078C84     ; $078C0D   |
    JSR CODE_078E3E     ; $078C0F   |
    JSR CODE_078F76     ; $078C12   |
    JSR CODE_078FA0     ; $078C15   |
    LDA #$0008          ; $078C18   |
    STA $04             ; $078C1B   |
    ASL A               ; $078C1D   |
    STA $06             ; $078C1E   |
    LDA #$0010          ; $078C20   |
    STA $08             ; $078C23   |
    ASL A               ; $078C25   |
    STA $0A             ; $078C26   |
    JSR CODE_078CF1     ; $078C28   |
    BMI CODE_078C84     ; $078C2B   |
    LDA $7360,y         ; $078C2D   |
    CMP #$0022          ; $078C30   |
    BCC CODE_078C47     ; $078C33   |
    CMP #$002C          ; $078C35   |
    BCS CODE_078C47     ; $078C38   |
    LDA #$0001          ; $078C3A   |
    STA $7A36,y         ; $078C3D   |
    SEP #$20            ; $078C40   |
    STA $77C0,y         ; $078C42   |
    REP #$20            ; $078C45   |

CODE_078C47:
    LDA $70E2,y         ; $078C47   |
    SEC                 ; $078C4A   |
    SBC $72C0,y         ; $078C4B   |
    STA $70E2,y         ; $078C4E   |
    LDA $7220,y         ; $078C51   |
    EOR #$FFFF          ; $078C54   |
    INC A               ; $078C57   |
    STA $7220,y         ; $078C58   |
    LDA $7182,y         ; $078C5B   |
    SEC                 ; $078C5E   |
    SBC $72C2,y         ; $078C5F   |
    STA $7182,y         ; $078C62   |
    LDA #$FC00          ; $078C65   |
    STA $7222,y         ; $078C68   |
    TYA                 ; $078C6B   |
    STA $78,x           ; $078C6C   |
    INC $76,x           ; $078C6E   |
    LDA $7CD6,y         ; $078C70   |
    STA $00             ; $078C73   |
    LDA $7CD8,y         ; $078C75   |
    STA $02             ; $078C78   |
    JSR CODE_07FD16     ; $078C7A   |
    LDA #$0067          ; $078C7D   |\ play sound #$0067
    JSL $0085D2         ; $078C80   |/

CODE_078C84:
    LDA $7A96,x         ; $078C84   |
    BNE CODE_078CB1     ; $078C87   |
    LDA $18,x           ; $078C89   |
    INC A               ; $078C8B   |
    CMP #$0011          ; $078C8C   |
    BCC CODE_078C9B     ; $078C8F   |
    LDA #$0000          ; $078C91   |
    STA $7A96,x         ; $078C94   |
    INC $16,x           ; $078C97   |
    BRA CODE_078CB1     ; $078C99   |

CODE_078C9B:
    STA $7978,x         ; $078C9B   |
    TAY                 ; $078C9E   |
    LDA $8CB2,y         ; $078C9F   |
    AND #$00FF          ; $078CA2   |
    STA $7402,x         ; $078CA5   |
    LDA $8CC3,y         ; $078CA8   |
    AND #$00FF          ; $078CAB   |
    STA $7A96,x         ; $078CAE   |

CODE_078CB1:
    RTL                 ; $078CB1   |

DATA_078CB2:         db $08, $06, $09, $0A, $0B, $0C, $0D, $0E
DATA_078CBA:         db $0F, $10, $11, $12, $13, $14, $15, $09
DATA_078CC2:         db $05

DATA_078CC3:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_078CCB:         db $20, $01, $01, $01, $02, $02, $03, $03
DATA_078CD3:         db $10

    TYX                 ; $078CD4   |
    LDA $7A96,x         ; $078CD5   |
    BNE CODE_078CF0     ; $078CD8   |
    LDA #$0000          ; $078CDA   |
    STA $16,x           ; $078CDD   |
    STZ $18,x           ; $078CDF   |
    LDA $8932           ; $078CE1   |
    AND #$00FF          ; $078CE4   |
    STA $7402,x         ; $078CE7   |
    LDA #$0004          ; $078CEA   |
    STA $7A96,x         ; $078CED   |

CODE_078CF0:
    RTL                 ; $078CF0   |

CODE_078CF1:
    TXA                 ; $078CF1   |
    STA $3002           ; $078CF2   |
    PHX                 ; $078CF5   |
    LDX #$09            ; $078CF6   |
    LDA #$8F33          ; $078CF8   |
    JSL $7EDE44         ; $078CFB   | GSU init
    PLX                 ; $078CFF   |
    LDY $3002           ; $078D00   |
    BMI CODE_078D32     ; $078D03   |
    LDA $7CD6,x         ; $078D05   |
    SEC                 ; $078D08   |
    SBC $7CD6,y         ; $078D09   |
    PHA                 ; $078D0C   |
    AND #$8000          ; $078D0D   |
    ASL A               ; $078D10   |
    ROL A               ; $078D11   |
    ASL A               ; $078D12   |
    STA $02             ; $078D13   |
    PLA                 ; $078D15   |
    CLC                 ; $078D16   |
    ADC $04             ; $078D17   |
    CMP $06             ; $078D19   |
    BCS CODE_078D2F     ; $078D1B   |
    LDA $7CD8,x         ; $078D1D   |
    SEC                 ; $078D20   |
    SBC $7CD8,y         ; $078D21   |
    CLC                 ; $078D24   |
    ADC $08             ; $078D25   |
    CMP $0A             ; $078D27   |
    BCS CODE_078D2F     ; $078D29   |
    CPY #$00            ; $078D2B   |
    BRA CODE_078D32     ; $078D2D   |

CODE_078D2F:
    LDA #$FFFF          ; $078D2F   |

CODE_078D32:
    RTS                 ; $078D32   |

CODE_078D33:
    LDA $70E2,x         ; $078D33   |
    SEC                 ; $078D36   |
    SBC $608C           ; $078D37   |
    PHA                 ; $078D3A   |
    AND #$8000          ; $078D3B   |
    ASL A               ; $078D3E   |
    ROL A               ; $078D3F   |
    ASL A               ; $078D40   |
    STA $02             ; $078D41   |
    PLA                 ; $078D43   |
    CLC                 ; $078D44   |
    ADC $04             ; $078D45   |
    CMP $06             ; $078D47   |
    BCS CODE_078D5D     ; $078D49   |
    LDA $7182,x         ; $078D4B   |
    SEC                 ; $078D4E   |
    SBC $6090           ; $078D4F   |
    CLC                 ; $078D52   |
    ADC $08             ; $078D53   |
    CMP $0A             ; $078D55   |
    BCS CODE_078D5D     ; $078D57   |
    LDA $02             ; $078D59   |
    BRA CODE_078D60     ; $078D5B   |

CODE_078D5D:
    LDA #$FFFF          ; $078D5D   |

CODE_078D60:
    RTS                 ; $078D60   |

DATA_078D61:         dw $000A, $FFF6, $000A, $FFF6
DATA_078D69:         dw $000A, $FFF6, $000B, $FFF5
DATA_078D71:         dw $000A, $FFF6, $0008, $FFF8
DATA_078D79:         dw $000C, $FFF4, $000F, $FFF1
DATA_078D81:         dw $0008, $FFF8, $0010, $FFF0
DATA_078D89:         dw $0008, $FFF8, $FFEC, $0014
DATA_078D91:         dw $FFEE, $0012, $FFFA, $0006
DATA_078D99:         dw $0008, $FFF8, $0009, $FFF7
DATA_078DA1:         dw $0001, $FFFF, $FFF6, $000A
DATA_078DA9:         dw $FFEC, $0014, $FFEE, $0012
DATA_078DB1:         dw $0001, $FFFF, $000F, $FFF1
DATA_078DB9:         dw $FFF7, $FFF6, $FFF5, $FFF6
DATA_078DC1:         dw $FFF8, $FFF3, $FFF3, $FFF1
DATA_078DC9:         dw $FFED, $FFF7, $0009, $0004
DATA_078DD1:         dw $FFF4, $FFEC, $FFEE, $FFF1
DATA_078DD9:         dw $FFEC, $FFEC, $FFF7, $0009
DATA_078DE1:         dw $000D, $0006


CODE_078DE5:
    LDA $6122           ; $078DE5   |
    ASL A               ; $078DE8   |
    CLC                 ; $078DE9   |
    ADC #$0004          ; $078DEA   |
    STA $00             ; $078DED   |
    LDA $6120           ; $078DEF   |
    ASL A               ; $078DF2   |
    CLC                 ; $078DF3   |
    ADC #$0004          ; $078DF4   |
    STA $02             ; $078DF7   |
    LDA $7402,x         ; $078DF9   |
    ASL A               ; $078DFC   |
    TAY                 ; $078DFD   |
    LDA $7CD8,x         ; $078DFE   |
    CLC                 ; $078E01   |
    ADC $8DB9,y         ; $078E02   |
    SEC                 ; $078E05   |
    SBC $611E           ; $078E06   |
    CLC                 ; $078E09   |
    ADC $6122           ; $078E0A   |
    CLC                 ; $078E0D   |
    ADC #$0002          ; $078E0E   |
    CMP $00             ; $078E11   |
    BCS CODE_078E39     ; $078E13   |
    LDA $7402,x         ; $078E15   |
    ASL A               ; $078E18   |
    ASL A               ; $078E19   |
    ORA $7400,x         ; $078E1A   |
    TAY                 ; $078E1D   |
    LDA $7CD6,x         ; $078E1E   |
    CLC                 ; $078E21   |
    ADC $8D61,y         ; $078E22   |
    SEC                 ; $078E25   |
    SBC $611C           ; $078E26   |
    CLC                 ; $078E29   |
    ADC $6120           ; $078E2A   |
    CLC                 ; $078E2D   |
    ADC #$0002          ; $078E2E   |
    CMP $02             ; $078E31   |
    BCS CODE_078E39     ; $078E33   |
    JSL $03A858         ; $078E35   |

CODE_078E39:
    RTS                 ; $078E39   |

DATA_078E3A:         dw $FE00, $0200

CODE_078E3E:
    LDA $76             ; $078E3E   |
    CMP #$000B          ; $078E40   |
    BNE CODE_078EC2     ; $078E43   |
    LDA $7BB8           ; $078E45   |
    ASL A               ; $078E48   |
    CLC                 ; $078E49   |
    ADC #$0004          ; $078E4A   |
    STA $00             ; $078E4D   |
    LDA $7BB6           ; $078E4F   |
    ASL A               ; $078E52   |
    CLC                 ; $078E53   |
    ADC #$0004          ; $078E54   |
    STA $02             ; $078E57   |
    LDA $7402,x         ; $078E59   |
    ASL A               ; $078E5C   |
    TAY                 ; $078E5D   |
    LDA $7CD8,x         ; $078E5E   |
    CLC                 ; $078E61   |
    ADC $8DB9,y         ; $078E62   |
    SEC                 ; $078E65   |
    SBC $7CD8           ; $078E66   |
    CLC                 ; $078E69   |
    ADC $7BB8           ; $078E6A   |
    CLC                 ; $078E6D   |
    ADC #$0002          ; $078E6E   |
    CMP $00             ; $078E71   |
    BCS CODE_078E95     ; $078E73   |
    LDA $7402,x         ; $078E75   |
    ASL A               ; $078E78   |
    ASL A               ; $078E79   |
    ORA $7400,x         ; $078E7A   |
    TAY                 ; $078E7D   |
    LDA $7CD6,x         ; $078E7E   |
    CLC                 ; $078E81   |
    ADC $8D61,y         ; $078E82   |
    SEC                 ; $078E85   |
    SBC $7CD6           ; $078E86   |
    CLC                 ; $078E89   |
    ADC $7BB6           ; $078E8A   |
    CLC                 ; $078E8D   |
    ADC #$0002          ; $078E8E   |
    CMP $02             ; $078E91   |
    BCC CODE_078E9B     ; $078E93   |

CODE_078E95:
    LDY $7D36,x         ; $078E95   |
    DEY                 ; $078E98   |
    BNE CODE_078EC2     ; $078E99   |

CODE_078E9B:
    LDY $7400,x         ; $078E9B   |
    LDA $8E3A,y         ; $078E9E   |
    STA $7220           ; $078EA1   |
    LDA $7222           ; $078EA4   |
    EOR #$FFFF          ; $078EA7   |
    INC A               ; $078EAA   |
    STA $7222           ; $078EAB   |
    LDA $7CD6           ; $078EAE   |
    STA $00             ; $078EB1   |
    LDA $7CD8           ; $078EB3   |
    STA $02             ; $078EB6   |
    JSR CODE_07FD16     ; $078EB8   |
    LDA #$0067          ; $078EBB   |\ play sound #$0067
    JSL $0085D2         ; $078EBE   |/

CODE_078EC2:
    RTS                 ; $078EC2   |

CODE_078EC3:
    LDY $7D36,x         ; $078EC3   |
    BPL CODE_078EDA     ; $078EC6   |
    LDA $7E04           ; $078EC8   |
    BEQ CODE_078ED1     ; $078ECB   |
    JMP CODE_0703B2     ; $078ECD   |

CODE_078ED1:
    JSL $07FC2F         ; $078ED1   |
    BCC CODE_078EDA     ; $078ED5   |
    JMP CODE_07890A     ; $078ED7   |

CODE_078EDA:
    LDA #$8895          ; $078EDA   |
    STA $00             ; $078EDD   |
    JSR CODE_07A623     ; $078EDF   |
    LDA $7900,x         ; $078EE2   |
    BNE CODE_078EF0     ; $078EE5   |
    LDA $6FA2,x         ; $078EE7   |
    ORA #$0100          ; $078EEA   |
    STA $6FA2,x         ; $078EED   |

CODE_078EF0:
    RTL                 ; $078EF0   |

CODE_078EF1:
    LDA $76             ; $078EF1   |
    CMP #$000B          ; $078EF3   |
    BNE CODE_078F25     ; $078EF6   |
    LDA $70E2,x         ; $078EF8   |
    SEC                 ; $078EFB   |
    SBC $70E2           ; $078EFC   |
    STA $02             ; $078EFF   |
    CLC                 ; $078F01   |
    ADC #$0010          ; $078F02   |
    CMP #$0020          ; $078F05   |
    BCS CODE_078F25     ; $078F08   |
    LDY #$00            ; $078F0A   |
    LDA $02             ; $078F0C   |
    BPL CODE_078F12     ; $078F0E   |
    INY                 ; $078F10   |
    INY                 ; $078F11   |

CODE_078F12:
    TYA                 ; $078F12   |
    STA $02             ; $078F13   |
    LDA $7182,x         ; $078F15   |
    SEC                 ; $078F18   |
    SBC $7182           ; $078F19   |
    CLC                 ; $078F1C   |
    ADC #$0010          ; $078F1D   |
    CMP #$0020          ; $078F20   |
    BCC CODE_078F26     ; $078F23   |

CODE_078F25:
    SEC                 ; $078F25   |

CODE_078F26:
    RTS                 ; $078F26   |

CODE_078F27:
    LDA #$011D          ; $078F27   |
    BRA CODE_078F2F     ; $078F2A   |

CODE_078F2C:
    LDA #$009E          ; $078F2C   |

CODE_078F2F:
    STA $301C           ; $078F2F   |
    TXA                 ; $078F32   |
    STA $3002           ; $078F33   |
    LDX #$09            ; $078F36   |
    LDA #$8EBF          ; $078F38   |
    JSL $7EDE44         ; $078F3B   | GSU init
    LDX $12             ; $078F3F   |
    LDY $3002           ; $078F41   |
    BMI CODE_078F70     ; $078F44   |
    LDA $7CD6,x         ; $078F46   |
    SEC                 ; $078F49   |
    SBC $7CD6,y         ; $078F4A   |
    PHA                 ; $078F4D   |
    AND #$8000          ; $078F4E   |
    ASL A               ; $078F51   |
    ROL A               ; $078F52   |
    ASL A               ; $078F53   |
    STA $02             ; $078F54   |
    PLA                 ; $078F56   |
    CLC                 ; $078F57   |
    ADC #$0010          ; $078F58   |
    CMP #$0020          ; $078F5B   |
    BCS CODE_078F70     ; $078F5E   |
    LDA $7CD8,x         ; $078F60   |
    SEC                 ; $078F63   |
    SBC $7CD8,y         ; $078F64   |
    CLC                 ; $078F67   |
    ADC #$0010          ; $078F68   |
    CMP #$0020          ; $078F6B   |
    BCC CODE_078F71     ; $078F6E   |

CODE_078F70:
    SEC                 ; $078F70   |

CODE_078F71:
    RTS                 ; $078F71   |

DATA_078F72:         dw $FC00, $0400

CODE_078F76:
    LDY $7400,x         ; $078F76   |
    LDA $8F72,y         ; $078F79   |
    STA $0E             ; $078F7C   |
    LDA #$009E          ; $078F7E   |
    JSR CODE_078FD4     ; $078F81   |
    BCS CODE_078F9F     ; $078F84   |
    LDA $0E             ; $078F86   |
    STA $7220,y         ; $078F88   |
    LDA $7CD6,y         ; $078F8B   |
    STA $00             ; $078F8E   |
    LDA $7CD8,y         ; $078F90   |
    STA $02             ; $078F93   |
    JSR CODE_07FD16     ; $078F95   |
    LDA #$0067          ; $078F98   |\ play sound #$0067
    JSL $0085D2         ; $078F9B   |/

CODE_078F9F:
    RTS                 ; $078F9F   |

CODE_078FA0:
    LDY $7400,x         ; $078FA0   |
    LDA $8F72,y         ; $078FA3   |
    STA $0E             ; $078FA6   |
    LDA #$011D          ; $078FA8   |
    JSR CODE_078FD4     ; $078FAB   |
    BCS CODE_078FD3     ; $078FAE   |
    LDA $0E             ; $078FB0   |
    STA $7220,y         ; $078FB2   |
    LDA $7222,y         ; $078FB5   |
    EOR #$FFFF          ; $078FB8   |
    INC A               ; $078FBB   |
    STA $7222,y         ; $078FBC   |
    LDA $7CD6,y         ; $078FBF   |
    STA $00             ; $078FC2   |
    LDA $7CD8,y         ; $078FC4   |
    STA $02             ; $078FC7   |
    JSR CODE_07FD16     ; $078FC9   |
    LDA #$0067          ; $078FCC   |\ play sound #$0067
    JSL $0085D2         ; $078FCF   |/

CODE_078FD3:
    RTS                 ; $078FD3   |

CODE_078FD4:
    STA $301C           ; $078FD4   |
    TXA                 ; $078FD7   |
    STA $3002           ; $078FD8   |
    LDX #$09            ; $078FDB   |
    LDA #$8EBF          ; $078FDD   |
    JSL $7EDE44         ; $078FE0   | GSU init
    LDX $12             ; $078FE4   |
    LDY $3002           ; $078FE6   |
    BMI CODE_07901F     ; $078FE9   |
    LDA $7BB8,x         ; $078FEB   |
    CLC                 ; $078FEE   |
    ADC $7BB8,y         ; $078FEF   |
    STA $00             ; $078FF2   |
    LDA $7BB6,x         ; $078FF4   |
    CLC                 ; $078FF7   |
    ADC $7BB6,y         ; $078FF8   |
    STA $02             ; $078FFB   |
    LDA $7CD8,x         ; $078FFD   |
    SEC                 ; $079000   |
    SBC $7CD8,y         ; $079001   |
    BPL CODE_07900A     ; $079004   |
    EOR #$FFFF          ; $079006   |
    INC A               ; $079009   |

CODE_07900A:
    CMP $00             ; $07900A   |
    BCS CODE_079020     ; $07900C   |
    LDA $7CD6,x         ; $07900E   |
    SEC                 ; $079011   |
    SBC $7CD6,y         ; $079012   |
    BPL CODE_07901B     ; $079015   |
    EOR #$FFFF          ; $079017   |
    INC A               ; $07901A   |

CODE_07901B:
    CMP $02             ; $07901B   |
    BCC CODE_079020     ; $07901D   |

CODE_07901F:
    SEC                 ; $07901F   |

CODE_079020:
    RTS                 ; $079020   |

DATA_079021:         db $A8, $FF, $58, $00

.init_spear_guy_long
    LDA #$9261          ; $079025   |
    STA $18,x           ; $079028   |
    LDA #$0800          ; $07902A   |
    BRA CODE_079037     ; $07902D   |

.init_spear_guy_short
    LDA #$926D          ; $07902F   |
    STA $18,x           ; $079032   |
    LDA #$0000          ; $079034   |

CODE_079037:
    STA $78,x           ; $079037   |
    LDA #$0004          ; $079039   |
    STA $16,x           ; $07903C   |
    SEP #$20            ; $07903E   |
    TAY                 ; $079040   |
    LDA #$04            ; $079041   |
    STA $7A96,x         ; $079043   |
    LDA $906F,y         ; $079046   |
    STA $7402,x         ; $079049   |
    TAY                 ; $07904C   |
    LDA $9078,y         ; $07904D   |
    STA $7B56,x         ; $079050   |
    LDA $907E,y         ; $079053   |
    STA $7BB6,x         ; $079056   |
    REP #$20            ; $079059   |
    LDY $7400,x         ; $07905B   |
    LDA $9021,y         ; $07905E   |
    STA $7220,x         ; $079061   |
    LDA #$0003          ; $079064   |
    STA $7902,x         ; $079067   |
    RTL                 ; $07906A   |

DATA_07906B:         dw $0004, $0002

DATA_07906F:         db $04, $03, $02, $01, $00
DATA_079074:         db $04, $04, $30, $01

DATA_079078:         db $08, $08, $08, $08, $08, $06

DATA_07907E:         db $06, $06, $06, $06, $06, $0A
DATA_079084:         db $20, $00, $20, $00, $00, $02
DATA_07908A:         db $00, $FE, $E0, $FF, $20, $00

.main_spear_guy
    LDA $6F00,x         ; $079090   |
    CMP #$0008          ; $079093   |
    BEQ CODE_07909B     ; $079096   |
    JMP CODE_0790D1     ; $079098   |

CODE_07909B:
    LDA $77C2,x         ; $07909B   |
    AND #$00FF          ; $07909E   |
    EOR $7400,x         ; $0790A1   |
    BEQ CODE_0790A9     ; $0790A4   |

CODE_0790A6:
    JMP CODE_0791BF     ; $0790A6   |

CODE_0790A9:
    LDA $6150           ; $0790A9   |
    CMP #$0003          ; $0790AC   |
    BCS CODE_0790A6     ; $0790AF   |
    LDA #$003C          ; $0790B1   |\ play sound #$003C
    JSL $0085D2         ; $0790B4   |/
    LDA #$0010          ; $0790B8   |
    STA $6F00,x         ; $0790BB   |
    STZ $6162           ; $0790BE   |
    STZ $6168           ; $0790C1   |
    PLA                 ; $0790C4   |
    PLY                 ; $0790C5   |
    JSL $03AF23         ; $0790C6   |
    JSR CODE_079377     ; $0790CA   |
    LDY #$02            ; $0790CD   |
    BRA CODE_0790E1     ; $0790CF   |

CODE_0790D1:
    JSL $03AF23         ; $0790D1   |
    JSL $03A5B7         ; $0790D5   |
    JSR CODE_079279     ; $0790D9   |
    BPL CODE_0790E1     ; $0790DC   |
    JMP CODE_079135     ; $0790DE   |

CODE_0790E1:
    LDA $906B,y         ; $0790E1   |
    STA $76,x           ; $0790E4   |
    LDA #$0020          ; $0790E6   |
    STA $7A96,x         ; $0790E9   |
    LDA #$0005          ; $0790EC   |
    STA $7402,x         ; $0790EF   |
    TAY                 ; $0790F2   |
    LDA $9078,y         ; $0790F3   |
    AND #$00FF          ; $0790F6   |
    STA $7B56,x         ; $0790F9   |
    LDA $907E,y         ; $0790FC   |
    AND #$00FF          ; $0790FF   |
    STA $7BB6,x         ; $079102   |
    LDA $6FA2,x         ; $079105   |
    AND #$FC3F          ; $079108   |
    ORA #$0080          ; $07910B   |
    STA $6FA2,x         ; $07910E   |
    LDA $7040,x         ; $079111   |
    ORA #$0004          ; $079114   |
    STA $7040,x         ; $079117   |
    LDY $7D36,x         ; $07911A   |
    DEY                 ; $07911D   |
    BMI CODE_079135     ; $07911E   |
    LDA $6F00,y         ; $079120   |
    CMP #$0010          ; $079123   |
    BNE CODE_079135     ; $079126   |
    LDA $7D38,y         ; $079128   |
    BEQ CODE_079135     ; $07912B   |
    TYX                 ; $07912D   |
    JSL $03B25B         ; $07912E   |
    JSR CODE_079377     ; $079132   |

CODE_079135:
    TXY                 ; $079135   |
    LDX $76,y           ; $079136   |
    JMP ($913B,x)       ; $079138   |

DATA_07913B:         dw $9141, $916F, $91BE

    TYX                 ; $079141   |
    LDA $7A96,x         ; $079142   |
    BNE CODE_07916E     ; $079145   |
    DEC $16,x           ; $079147   |
    BPL CODE_079150     ; $079149   |
    LDA #$0004          ; $07914B   |
    STA $16,x           ; $07914E   |

CODE_079150:
    SEP #$20            ; $079150   |
    LDY $16,x           ; $079152   |
    LDA #$04            ; $079154   |
    STA $7A96,x         ; $079156   |
    LDA $906F,y         ; $079159   |
    STA $7402,x         ; $07915C   |
    TAY                 ; $07915F   |
    LDA $9078,y         ; $079160   |
    STA $7B56,x         ; $079163   |
    LDA $907E,y         ; $079166   |
    STA $7BB6,x         ; $079169   |
    REP #$20            ; $07916C   |

CODE_07916E:
    RTL                 ; $07916E   |

    TYX                 ; $07916F   |
    LDA $7220,x         ; $079170   |
    BNE CODE_079178     ; $079173   |
    STZ $7540,x         ; $079175   |

CODE_079178:
    LDA $7A96,x         ; $079178   |
    BNE CODE_0791B9     ; $07917B   |
    LDA #$0004          ; $07917D   |
    STA $16,x           ; $079180   |
    SEP #$20            ; $079182   |
    TAY                 ; $079184   |
    LDA #$04            ; $079185   |
    STA $7A96,x         ; $079187   |
    LDA $906F,y         ; $07918A   |
    STA $7402,x         ; $07918D   |
    TAY                 ; $079190   |
    LDA $9078,y         ; $079191   |
    STA $7B56,x         ; $079194   |
    LDA $907E,y         ; $079197   |
    STA $7BB6,x         ; $07919A   |
    REP #$20            ; $07919D   |
    LDY $7400,x         ; $07919F   |
    LDA $9021,y         ; $0791A2   |
    STA $7220,x         ; $0791A5   |
    STZ $7540,x         ; $0791A8   |
    STZ $76,x           ; $0791AB   |
    LDA $6FA2,x         ; $0791AD   |
    AND #$FC3F          ; $0791B0   |
    ORA #$0140          ; $0791B3   |
    STA $6FA2,x         ; $0791B6   |

CODE_0791B9:
    RTL                 ; $0791B9   |

DATA_0791BA:         dw $FF00, $0100

    TYX                 ; $0791BE   |

CODE_0791BF:
    JSR CODE_0791E7     ; $0791BF   |
    JSL $03A331         ; $0791C2   |
    LDA #$001E          ; $0791C6   |
    TXY                 ; $0791C9   |
    JSL $03A377         ; $0791CA   |
    LDA $7902,x         ; $0791CE   |
    DEC A               ; $0791D1   |
    ORA $7042,x         ; $0791D2   |
    STA $7042,x         ; $0791D5   |
    LDA $6F00,x         ; $0791D8   |
    CMP #$0010          ; $0791DB   |
    BNE CODE_0791E6     ; $0791DE   |
    LDA #$0002          ; $0791E0   |
    STA $6F00,x         ; $0791E3   |

CODE_0791E6:
    RTL                 ; $0791E6   |

CODE_0791E7:
    PHX                 ; $0791E7   |
    LDA #$01EA          ; $0791E8   |
    JSL $008B21         ; $0791EB   |
    LDA $70E2,x         ; $0791EF   |
    STA $70A2,y         ; $0791F2   |
    LDA $7182,x         ; $0791F5   |
    STA $7142,y         ; $0791F8   |
    LDA $7400,x         ; $0791FB   |
    STA $73C0,y         ; $0791FE   |
    TAX                 ; $079201   |
    LDA $91BA,x         ; $079202   |
    STA $71E0,y         ; $079205   |
    LDA #$FC00          ; $079208   |
    STA $71E2,y         ; $07920B   |
    LDA #$0020          ; $07920E   |
    STA $7782,y         ; $079211   |
    PLX                 ; $079214   |
    PHX                 ; $079215   |
    LDA #$01EB          ; $079216   |
    JSL $008B21         ; $079219   |
    LDA $70E2,x         ; $07921D   |
    STA $70A2,y         ; $079220   |
    LDA $7182,x         ; $079223   |
    STA $7142,y         ; $079226   |
    LDA $7000,y         ; $079229   |
    CLC                 ; $07922C   |
    ADC $79D8,x         ; $07922D   |
    STA $7000,y         ; $079230   |
    LDA $7400,x         ; $079233   |
    STA $73C0,y         ; $079236   |
    EOR #$0002          ; $079239   |
    TAX                 ; $07923C   |
    LDA $91BA,x         ; $07923D   |
    STA $71E0,y         ; $079240   |
    LDA #$FC00          ; $079243   |
    STA $71E2,y         ; $079246   |
    LDA #$0020          ; $079249   |
    STA $7782,y         ; $07924C   |
    PLX                 ; $07924F   |
    RTS                 ; $079250   |

DATA_079251:         dw $0040, $0000, $0008, $0009
DATA_079259:         dw $0009, $0008, $0008, $000A
DATA_079261:         dw $FFE9, $FFEB, $FFEA, $FFE9
DATA_079269:         dw $FFE8, $FFEF, $FFF5, $FFF7
DATA_079271:         dw $FFF6, $FFF5, $FFF4, $FFF9

CODE_079279:
    JSR CODE_07931E     ; $079279   |
    LDY $7D36,x         ; $07927C   |
    BEQ CODE_0792B9     ; $07927F   |
    BMI CODE_0792B9     ; $079281   |
    DEY                 ; $079283   |
    LDA $6F00,y         ; $079284   |
    CMP #$0010          ; $079287   |
    BNE CODE_0792B9     ; $07928A   |
    LDA $7D38,y         ; $07928C   |
    BEQ CODE_0792B9     ; $07928F   |
    LDX $12             ; $079291   |
    LDA $7C76,x         ; $079293   |
    AND #$8000          ; $079296   |
    ASL A               ; $079299   |
    ROL A               ; $07929A   |
    ASL A               ; $07929B   |
    EOR $7400,x         ; $07929C   |
    BEQ CODE_0792A3     ; $07929F   |
    TAY                 ; $0792A1   |
    RTS                 ; $0792A2   |

CODE_0792A3:
    TYX                 ; $0792A3   |
    JSL $03B25B         ; $0792A4   |
    LDX $12             ; $0792A8   |
    LDA #$003B          ; $0792AA   |\ play sound #$003B
    JSL $0085D2         ; $0792AD   |/
    JSR CODE_0791E7     ; $0792B1   |
    PLA                 ; $0792B4   |
    JMP CODE_0703B2     ; $0792B5   |

CODE_0792B9:
    TXA                 ; $0792B9   |
    STA $3002           ; $0792BA   |
    PHX                 ; $0792BD   |
    LDX #$09            ; $0792BE   |
    LDA #$8F33          ; $0792C0   |
    JSL $7EDE44         ; $0792C3   | GSU init
    PLX                 ; $0792C7   |
    LDY $3002           ; $0792C8   |
    BMI CODE_07931D     ; $0792CB   |
    LDA $7400,x         ; $0792CD   |
    LSR A               ; $0792D0   |
    LSR A               ; $0792D1   |
    ROR A               ; $0792D2   |
    STA $00             ; $0792D3   |
    LDA $7CD6,x         ; $0792D5   |
    SEC                 ; $0792D8   |
    SBC $7CD6,y         ; $0792D9   |
    STA $02             ; $0792DC   |
    EOR $00             ; $0792DE   |
    BMI CODE_07931B     ; $0792E0   |
    LDA $02             ; $0792E2   |
    EOR $7220,y         ; $0792E4   |
    BMI CODE_07931B     ; $0792E7   |
    LDA $02             ; $0792E9   |
    CLC                 ; $0792EB   |
    ADC #$0018          ; $0792EC   |
    CMP #$0030          ; $0792EF   |
    BCS CODE_07931B     ; $0792F2   |
    LDA $02             ; $0792F4   |
    BPL CODE_0792FC     ; $0792F6   |
    EOR #$FFFF          ; $0792F8   |
    INC A               ; $0792FB   |

CODE_0792FC:
    STA $04             ; $0792FC   |
    LSR A               ; $0792FE   |
    STA $02             ; $0792FF   |
    LDA $7CD8,x         ; $079301   |
    SEC                 ; $079304   |
    SBC $7CD8,y         ; $079305   |
    STA $00             ; $079308   |
    EOR $7222,y         ; $07930A   |
    BMI CODE_07931B     ; $07930D   |
    LDA $00             ; $07930F   |
    CLC                 ; $079311   |
    ADC $02             ; $079312   |
    CMP $04             ; $079314   |
    BCS CODE_07931B     ; $079316   |
    LDY #$02            ; $079318   |
    RTS                 ; $07931A   |

CODE_07931B:
    LDY #$FF            ; $07931B   |

CODE_07931D:
    RTS                 ; $07931D   |

CODE_07931E:
    LDY $7D36,x         ; $07931E   |
    BMI CODE_079376     ; $079321   |
    LDA $6122           ; $079323   |
    ASL A               ; $079326   |
    STA $02             ; $079327   |
    LDA $18,x           ; $079329   |
    STA $00             ; $07932B   |
    LDA $7402,x         ; $07932D   |
    ASL A               ; $079330   |
    TAY                 ; $079331   |
    LDA $7182,x         ; $079332   |
    CLC                 ; $079335   |
    ADC ($00),y         ; $079336   |
    SEC                 ; $079338   |
    SBC $611E           ; $079339   |
    CLC                 ; $07933C   |
    ADC $6122           ; $07933D   |
    CMP $02             ; $079340   |
    BCS CODE_079376     ; $079342   |
    LDA $7402,x         ; $079344   |
    ASL A               ; $079347   |
    TAY                 ; $079348   |
    LDA $9255,y         ; $079349   |
    LDY $7400,x         ; $07934C   |
    BEQ CODE_079358     ; $07934F   |
    EOR #$FFFF          ; $079351   |
    CLC                 ; $079354   |
    ADC #$0009          ; $079355   |

CODE_079358:
    STA $00             ; $079358   |
    LDA $6120           ; $07935A   |
    ASL A               ; $07935D   |
    STA $02             ; $07935E   |
    LDA $70E2,x         ; $079360   |
    CLC                 ; $079363   |
    ADC $00             ; $079364   |
    SEC                 ; $079366   |
    SBC $611C           ; $079367   |
    CLC                 ; $07936A   |
    ADC $6120           ; $07936B   |
    CMP $02             ; $07936E   |
    BCS CODE_079376     ; $079370   |
    JSL $03A858         ; $079372   |

CODE_079376:
    RTS                 ; $079376   |

CODE_079377:
    LDY $7400,x         ; $079377   |
    LDA $9084,y         ; $07937A   |
    STA $7540,x         ; $07937D   |
    LDA $9088,y         ; $079380   |
    STA $7220,x         ; $079383   |
    LDA $908C,y         ; $079386   |
    STA $00             ; $079389   |
    LDA #$01E0          ; $07938B   |
    JSL $008B21         ; $07938E   |
    LDA $7400,x         ; $079392   |
    EOR #$0002          ; $079395   |
    STA $73C0,y         ; $079398   |
    LDA #$0004          ; $07939B   |
    STA $7782,y         ; $07939E   |
    STA $7E4C,y         ; $0793A1   |
    LDA $00             ; $0793A4   |
    STA $71E0,y         ; $0793A6   |
    LDA #$FFF0          ; $0793A9   |
    STA $71E2,y         ; $0793AC   |
    LDA $70E2,x         ; $0793AF   |
    STA $70A2,y         ; $0793B2   |
    LDA $7182,x         ; $0793B5   |
    CLC                 ; $0793B8   |
    ADC #$000C          ; $0793B9   |
    STA $7142,y         ; $0793BC   |
    RTS                 ; $0793BF   |

DATA_0793C0:         dw $FFA8, $0058, $0100, $FF00
DATA_0793C8:         dw $FFEC, $0005, $FFF3, $FFFD
DATA_0793D0:         dw $FFF8, $FFF8

DATA_0793D4:         dw $0000, $0001, $0002, $0003
DATA_0793DC:         dw $0004, $0005, $0006, $0007
DATA_0793E4:         dw $0008, $0009, $0008, $0005
DATA_0793EC:         dw $0010, $0020, $0002, $0002
DATA_0793F4:         dw $0006, $0008, $0010

.init_snifit
    LDY $7400,x         ; $0793FA   |
    LDA $93C0,y         ; $0793FD   |
    STA $7220,x         ; $079400   |
    LDA #$0004          ; $079403   |
    STA $7A96,x         ; $079406   |
    LDA $93D4           ; $079409   |
    STA $7402,x         ; $07940C   |
    RTL                 ; $07940F   |

.main_snifit
    JSL $03AF23         ; $079410   |
    LDA $16,x           ; $079414   |
    TAX                 ; $079416   |
    JSR ($941F,x)       ; $079417   |
    JSL $03A5B7         ; $07941A   |
    RTL                 ; $07941E   |

DATA_07941F:         dw $9423
DATA_079421:         dw $9476

    LDX $12             ; $079423   |
    LDA $7680,x         ; $079425   |
    CMP #$00F0          ; $079428   |
    BCS CODE_079432     ; $07942B   |
    LDA $7A98,x         ; $07942D   |
    BEQ CODE_079454     ; $079430   |

CODE_079432:
    LDA $7A96,x         ; $079432   |
    BNE CODE_079475     ; $079435   |
    LDA #$0004          ; $079437   |
    STA $7A96,x         ; $07943A   |
    LDA $18,x           ; $07943D   |
    INC A               ; $07943F   |
    INC A               ; $079440   |
    CMP #$000A          ; $079441   |
    BCC CODE_079449     ; $079444   |
    LDA #$0000          ; $079446   |

CODE_079449:
    STA $18,x           ; $079449   |
    TAY                 ; $07944B   |
    LDA $93D4,y         ; $07944C   |
    STA $7402,x         ; $07944F   |
    BRA CODE_079475     ; $079452   |

CODE_079454:
    STZ $18,x           ; $079454   |
    STZ $7220,x         ; $079456   |
    LDA $93EC           ; $079459   |
    STA $7A96,x         ; $07945C   |
    LDA $93DE           ; $07945F   |
    STA $7402,x         ; $079462   |
    LDA $6FA2,x         ; $079465   |
    AND #$F83F          ; $079468   |
    ORA #$0400          ; $07946B   |
    STA $6FA2,x         ; $07946E   |
    INC $16,x           ; $079471   |
    INC $16,x           ; $079473   |

CODE_079475:
    RTS                 ; $079475   |

    LDX $12             ; $079476   |
    LDA $76,x           ; $079478   |
    BEQ CODE_079486     ; $07947A   |
    LDA $7220,x         ; $07947C   |
    BNE CODE_079486     ; $07947F   |
    STZ $7540,x         ; $079481   |
    STZ $76,x           ; $079484   |

CODE_079486:
    LDA $7A96,x         ; $079486   |
    BNE CODE_0794B5     ; $079489   |
    LDA $18,x           ; $07948B   |
    INC A               ; $07948D   |
    INC A               ; $07948E   |
    CMP #$000E          ; $07948F   |
    BCS CODE_0794B8     ; $079492   |
    STA $18,x           ; $079494   |
    TAY                 ; $079496   |
    LDA $93EC,y         ; $079497   |
    STA $7A96,x         ; $07949A   |
    LDA $93DE,y         ; $07949D   |
    STA $7402,x         ; $0794A0   |
    TYX                 ; $0794A3   |
    JMP ($94A7,x)       ; $0794A4   |

DATA_0794A7:         dw $94B5
DATA_0794A9:         dw $94D3
DATA_0794AB:         dw $950D
DATA_0794AD:         dw $94B5
DATA_0794AF:         dw $94B5
DATA_0794B1:         dw $94B5
DATA_0794B3:         dw $94B5

CODE_0794B5:
    LDX $12             ; $0794B5   |
    RTS                 ; $0794B7   |

CODE_0794B8:
    STZ $16,x           ; $0794B8   |
    STZ $18,x           ; $0794BA   |
    LDA $6FA2,x         ; $0794BC   |
    AND #$F83F          ; $0794BF   |
    ORA #$0140          ; $0794C2   |
    STA $6FA2,x         ; $0794C5   |
    LDA #$0080          ; $0794C8   |
    STA $7A98,x         ; $0794CB   |
    JSL $0793FA         ; $0794CE   |
    RTS                 ; $0794D2   |

    LDX $12             ; $0794D3   |
    LDY $7400,x         ; $0794D5   |
    LDA $93CC,y         ; $0794D8   |
    STA $00             ; $0794DB   |
    LDA #$01F5          ; $0794DD   |
    JSL $008B21         ; $0794E0   |
    LDA $7CD6,x         ; $0794E4   |
    CLC                 ; $0794E7   |
    ADC $00             ; $0794E8   |
    STA $70A2,y         ; $0794EA   |
    LDA $7182,x         ; $0794ED   |
    SEC                 ; $0794F0   |
    SBC #$000A          ; $0794F1   |
    STA $7142,y         ; $0794F4   |
    LDA $7400,x         ; $0794F7   |
    STA $73C0,y         ; $0794FA   |
    LDA #$0006          ; $0794FD   |
    STA $7E4C,y         ; $079500   |
    STA $7782,y         ; $079503   |
    LDA #$0002          ; $079506   |
    STA $7E4E,y         ; $079509   |
    RTS                 ; $07950C   |

    LDX $12             ; $07950D   |
    INC $76,x           ; $07950F   |
    LDY $7400,x         ; $079511   |
    LDA $93C4,y         ; $079514   |
    STA $7220,x         ; $079517   |
    LDA #$0010          ; $07951A   |
    STA $7540,x         ; $07951D   |
    LDA $958D,y         ; $079520   |
    STA $00             ; $079523   |
    LDA $93C8,y         ; $079525   |
    STA $02             ; $079528   |
    LDA $93D0,y         ; $07952A   |
    STA $04             ; $07952D   |
    LDA #$0114          ; $07952F   |
    JSL $03A364         ; $079532   |
    BCC CODE_079556     ; $079536   |
    LDA $7CD6,x         ; $079538   |
    CLC                 ; $07953B   |
    ADC $02             ; $07953C   |
    STA $70E2,y         ; $07953E   |
    LDA $7182,x         ; $079541   |
    SEC                 ; $079544   |
    SBC #$0001          ; $079545   |
    STA $7182,y         ; $079548   |
    LDA $7400,x         ; $07954B   |
    STA $7400,y         ; $07954E   |
    LDA $00             ; $079551   |
    STA $7220,y         ; $079553   |

CODE_079556:
    LDA #$01F6          ; $079556   |
    JSL $008B21         ; $079559   |
    LDA $7CD6,x         ; $07955D   |
    CLC                 ; $079560   |
    ADC $04             ; $079561   |
    STA $70A2,y         ; $079563   |
    LDA $7182,x         ; $079566   |
    SEC                 ; $079569   |
    SBC #$0004          ; $07956A   |
    STA $7142,y         ; $07956D   |
    LDA $7400,x         ; $079570   |
    STA $73C0,y         ; $079573   |
    LDA #$0002          ; $079576   |
    STA $7E4C,y         ; $079579   |
    STA $7782,y         ; $07957C   |
    LDA #$0005          ; $07957F   |
    STA $7E4E,y         ; $079582   |
    LDA #$0047          ; $079585   |\ play sound #$0047
    JSL $0085D2         ; $079588   |/
    RTS                 ; $07958C   |

DATA_07958D:         dw $FE00, $0200

.init_snifit_bullet
    LDY $7400,x         ; $079591   |
    LDA $958D,y         ; $079594   |
    STA $7220,x         ; $079597   |
    RTL                 ; $07959A   |

.main_snifit_bullet
    JSL $03AF23         ; $07959B   |
    LDY $7D36,x         ; $07959F   |
    BPL CODE_0795A8     ; $0795A2   |
    JSL $03A858         ; $0795A4   |

CODE_0795A8:
    RTL                 ; $0795A8   |

DATA_0795A9:         db $03, $04, $05, $06

DATA_0795AD:         db $08, $02

DATA_0795AF:         db $01, $02, $01, $00, $01, $02, $01, $00
DATA_0795B7:         db $01, $02, $01, $00, $01, $02, $01, $00
DATA_0795BF:         db $01, $02, $01, $00

DATA_0795C3:         db $08, $09, $08, $07, $08, $0C, $0B, $0A
DATA_0795CB:         db $08, $0C, $0B, $0A, $08, $09, $08, $07

DATA_0795D3:         db $0E, $0F, $10, $0F, $0E, $0D, $0E, $0F
DATA_0795DB:         db $10, $0F, $0E, $0D, $0E, $0F, $10, $0F
DATA_0795E3:         db $0E, $0D

DATA_0795E5:         db $00, $11, $11, $00, $00, $11, $11, $00
DATA_0795ED:         db $00, $11, $11, $00, $00

DATA_0795F2:         db $08, $03, $03, $05, $05, $03, $03, $05
DATA_0795FA:         db $05, $03, $03, $05, $05

DATA_0795FF:         db $00, $02, $00, $00, $00, $02, $00, $00
DATA_079607:         db $00, $02, $00, $00, $00

DATA_07960C:         dw $FF00, $0100

DATA_079610:         dw $FC80, $0380
DATA_079614:         dw $FF00, $0100
DATA_079618:         dw $0008, $0004
DATA_07961C:         dw $0100, $FF00
DATA_079620:         dw $FFE0, $0020

DATA_079624:         dw $0406, $0202

.init_poochy
    LDA $0C46           ; $079628   |
    BEQ CODE_079631     ; $07962B   |
    JMP CODE_0703A3     ; $07962D   |

CODE_079631:
    INC $0C46           ; $079631   |
    RTL                 ; $079634   |

.main_poochy
    JSL $03AF23         ; $079635   |
    JSL $03A5B7         ; $079639   |
    LDA $7182,x         ; $07963D   |
    CMP #$0800          ; $079640   |
    BMI CODE_07964C     ; $079643   |
    STZ $0C46           ; $079645   |
    JMP CODE_0703A3     ; $079648   |

CODE_07964C:
    JSR CODE_079D3D     ; $07964C   |
    JSR CODE_079EA0     ; $07964F   |
    JSR CODE_079B88     ; $079652   |
    JSR CODE_079C71     ; $079655   |
    JSR CODE_079CBC     ; $079658   |
    LDA $0C46           ; $07965B   |
    BNE CODE_079669     ; $07965E   |
    LDA $7040,x         ; $079660   |
    ORA #$0004          ; $079663   |
    STA $7040,x         ; $079666   |

CODE_079669:
    LDA $16,x           ; $079669   |
    TAX                 ; $07966B   |
    JSR ($9670,x)       ; $07966C   |
    RTL                 ; $07966F   |

DATA_079670:         dw $967A
DATA_079672:         dw $99AE
DATA_079674:         dw $9A3B

DATA_079676:         dw $001D, $FFE3

    LDX $12             ; $07967A   |
    JSR CODE_079960     ; $07967C   |
    LDY $77,x           ; $07967F   |
    BEQ CODE_079696     ; $079681   |
    STZ $7220,x         ; $079683   |
    TYX                 ; $079686   |
    JMP ($968A,x)       ; $079687   |

DATA_07968A:         dw $97EE
DATA_07968C:         dw $97EE
DATA_07968E:         dw $98D9
DATA_079690:         dw $992B
DATA_079692:         dw $98D9
DATA_079694:         dw $992B

CODE_079696:
    LDA $0C46           ; $079696   |
    BNE CODE_07969E     ; $079699   |
    JMP CODE_079B48     ; $07969B   |

CODE_07969E:
    LDA #$0300          ; $07969E   |
    STA $00             ; $0796A1   |
    ASL A               ; $0796A3   |
    STA $02             ; $0796A4   |
    JSR CODE_079C2E     ; $0796A6   |
    BCS CODE_0796EF     ; $0796A9   |
    LDA $60DE           ; $0796AB   |
    BNE CODE_0796B6     ; $0796AE   |
    LDY $76,x           ; $0796B0   |
    BEQ CODE_0796B6     ; $0796B2   |
    BPL CODE_0796CB     ; $0796B4   |

CODE_0796B6:
    LDA $7A98,x         ; $0796B6   |
    BNE CODE_0796E0     ; $0796B9   |
    LDA $77C2,x         ; $0796BB   |
    AND #$00FF          ; $0796BE   |
    DEC A               ; $0796C1   |
    STA $02             ; $0796C2   |
    LDA $7C16,x         ; $0796C4   |
    STA $00             ; $0796C7   |
    BRA CODE_0796FD     ; $0796C9   |

CODE_0796CB:
    LDA $7CD6,x         ; $0796CB   |
    SEC                 ; $0796CE   |
    SBC $7CD6,y         ; $0796CF   |
    STA $00             ; $0796D2   |
    AND #$8000          ; $0796D4   |
    ASL A               ; $0796D7   |
    ROL A               ; $0796D8   |
    ASL A               ; $0796D9   |
    DEC A               ; $0796DA   |
    STA $02             ; $0796DB   |
    JMP CODE_079825     ; $0796DD   |

CODE_0796E0:
    LDA $7400,x         ; $0796E0   |
    TAY                 ; $0796E3   |
    DEC A               ; $0796E4   |
    STA $02             ; $0796E5   |
    LDA $9676,y         ; $0796E7   |
    STA $00             ; $0796EA   |
    JMP CODE_079825     ; $0796EC   |

CODE_0796EF:
    LDY $76,x           ; $0796EF   |
    BEQ CODE_0796FA     ; $0796F1   |
    BPL CODE_0796CB     ; $0796F3   |
    LDA $7A98,x         ; $0796F5   |
    BNE CODE_0796E0     ; $0796F8   |

CODE_0796FA:
    JMP CODE_07976A     ; $0796FA   |

CODE_0796FD:
    STZ $75E0,x         ; $0796FD   |
    LDA #$0010          ; $079700   |
    STA $7540,x         ; $079703   |
    LDA $77C2,x         ; $079706   |
    AND #$00FF          ; $079709   |
    CMP $7400,x         ; $07970C   |
    BNE CODE_07974E     ; $07970F   |
    LDA $00             ; $079711   |
    BPL CODE_079719     ; $079713   |
    EOR #$FFFF          ; $079715   |
    INC A               ; $079718   |

CODE_079719:
    CMP #$0030          ; $079719   |
    BMI CODE_07974E     ; $07971C   |
    LDA $7540,x         ; $07971E   |
    ASL A               ; $079721   |
    STA $04             ; $079722   |
    LDA $7220,x         ; $079724   |
    CLC                 ; $079727   |
    ADC $7540,x         ; $079728   |
    CMP $04             ; $07972B   |
    BCS CODE_07973D     ; $07972D   |
    STZ $7220,x         ; $07972F   |
    STZ $7540,x         ; $079732   |
    LDA $02             ; $079735   |
    INC A               ; $079737   |
    CMP $7400,x         ; $079738   |
    BNE CODE_07976A     ; $07973B   |

CODE_07973D:
    LDY $7400,x         ; $07973D   |
    LDA $9610,y         ; $079740   |
    STA $75E0,x         ; $079743   |
    LDA #$0030          ; $079746   |
    STA $7540,x         ; $079749   |
    BRA CODE_0797B8     ; $07974C   |

CODE_07974E:
    LDA $7220,x         ; $07974E   |
    BEQ CODE_07975C     ; $079751   |
    LDA $7400,x         ; $079753   |
    DEC A               ; $079756   |
    EOR $7220,x         ; $079757   |
    BPL CODE_0797B8     ; $07975A   |

CODE_07975C:
    STZ $7220,x         ; $07975C   |
    STZ $7540,x         ; $07975F   |
    LDA $02             ; $079762   |
    INC A               ; $079764   |
    CMP $7400,x         ; $079765   |
    BEQ CODE_079783     ; $079768   |

CODE_07976A:
    LDY #$02            ; $07976A   |
    STY $77,x           ; $07976C   |
    LDY #$0C            ; $07976E   |
    STY $18,x           ; $079770   |
    SEP #$20            ; $079772   |
    LDA $95F2,y         ; $079774   |
    STA $7A96,x         ; $079777   |
    LDA $95E5,y         ; $07977A   |
    STA $7402,x         ; $07977D   |
    REP #$20            ; $079780   |
    RTS                 ; $079782   |

CODE_079783:
    LDA $7A96,x         ; $079783   |
    BNE CODE_0797B7     ; $079786   |
    LDY #$00            ; $079788   |
    LDA $60DE           ; $07978A   |
    BEQ CODE_079791     ; $07978D   |
    LDY #$01            ; $07978F   |

CODE_079791:
    LDA $95AD,y         ; $079791   |
    AND #$00FF          ; $079794   |
    STA $7A96,x         ; $079797   |
    LDA $18,x           ; $07979A   |
    DEC A               ; $07979C   |
    AND #$0003          ; $07979D   |
    STA $18,x           ; $0797A0   |
    TAY                 ; $0797A2   |
    LDA $95AF,y         ; $0797A3   |
    AND #$00FF          ; $0797A6   |
    STA $7402,x         ; $0797A9   |
    CPY #$00            ; $0797AC   |
    BNE CODE_0797B7     ; $0797AE   |
    LDA #$00A2          ; $0797B0   |\
    JSL $0085D2         ; $0797B3   |/ play sound #$00A2

CODE_0797B7:
    RTS                 ; $0797B7   |

CODE_0797B8:
    LDA $7A96,x         ; $0797B8   |
    BNE CODE_0797ED     ; $0797BB   |
    LDA $7220,x         ; $0797BD   |
    BPL CODE_0797C6     ; $0797C0   |
    EOR #$FFFF          ; $0797C2   |
    INC A               ; $0797C5   |

CODE_0797C6:
    XBA                 ; $0797C6   |
    SEP #$20            ; $0797C7   |
    AND #$03            ; $0797C9   |
    TAY                 ; $0797CB   |
    LDA $9624,y         ; $0797CC   |
    STA $7A96,x         ; $0797CF   |
    LDA $18,x           ; $0797D2   |
    INC A               ; $0797D4   |
    AND #$03            ; $0797D5   |
    STA $18,x           ; $0797D7   |
    TAY                 ; $0797D9   |
    LDA $95A9,y         ; $0797DA   |
    STA $7402,x         ; $0797DD   |
    REP #$20            ; $0797E0   |
    CPY #$00            ; $0797E2   |
    BNE CODE_0797ED     ; $0797E4   |
    LDA #$00A2          ; $0797E6   |\
    JSL $0085D2         ; $0797E9   |/ play sound #$00A2

CODE_0797ED:
    RTS                 ; $0797ED   |

CODE_0797EE:
    LDX $12             ; $0797EE   |
    LDA $7A96,x         ; $0797F0   |
    BNE CODE_079815     ; $0797F3   |
    LDY $18,x           ; $0797F5   |
    DEY                 ; $0797F7   |
    BMI CODE_079816     ; $0797F8   |
    STY $18,x           ; $0797FA   |
    SEP #$20            ; $0797FC   |
    LDA $7400,x         ; $0797FE   |
    EOR $95FF,y         ; $079801   |
    STA $7400,x         ; $079804   |
    LDA $95E5,y         ; $079807   |
    STA $7402,x         ; $07980A   |
    LDA $95F2,y         ; $07980D   |
    STA $7A96,x         ; $079810   |
    REP #$20            ; $079813   |

CODE_079815:
    RTS                 ; $079815   |

CODE_079816:
    LDY #$00            ; $079816   |
    STY $77,x           ; $079818   |
    LDY $76,x           ; $07981A   |
    BPL CODE_079822     ; $07981C   |
    LDY #$00            ; $07981E   |
    STY $76,x           ; $079820   |

CODE_079822:
    STZ $18,x           ; $079822   |
    RTS                 ; $079824   |

CODE_079825:
    STZ $75E0,x         ; $079825   |
    LDA #$0010          ; $079828   |
    STA $7540,x         ; $07982B   |
    LDA $00             ; $07982E   |
    CLC                 ; $079830   |
    ADC #$001C          ; $079831   |
    CMP #$0038          ; $079834   |
    BCC CODE_07986A     ; $079837   |
    LDA $7540,x         ; $079839   |
    ASL A               ; $07983C   |
    STA $04             ; $07983D   |
    LDA $7220,x         ; $07983F   |
    CLC                 ; $079842   |
    ADC $7540,x         ; $079843   |
    CMP $04             ; $079846   |
    BCS CODE_079858     ; $079848   |
    STZ $7220,x         ; $07984A   |
    STZ $7540,x         ; $07984D   |
    LDA $02             ; $079850   |
    INC A               ; $079852   |
    CMP $7400,x         ; $079853   |
    BNE CODE_07988E     ; $079856   |

CODE_079858:
    LDY $7400,x         ; $079858   |
    LDA $9610,y         ; $07985B   |
    STA $75E0,x         ; $07985E   |
    LDA #$0030          ; $079861   |
    STA $7540,x         ; $079864   |
    JMP CODE_0797B8     ; $079867   |

CODE_07986A:
    LDA $7220,x         ; $07986A   |
    BEQ CODE_079876     ; $07986D   |
    EOR $02             ; $07986F   |
    BPL CODE_079876     ; $079871   |
    JMP CODE_0797B8     ; $079873   |

CODE_079876:
    STZ $7220,x         ; $079876   |
    STZ $7540,x         ; $079879   |
    LDA $02             ; $07987C   |
    INC A               ; $07987E   |
    CMP $7400,x         ; $07987F   |
    BNE CODE_07988E     ; $079882   |
    LDY $76,x           ; $079884   |
    LDA $7D38,y         ; $079886   |
    BEQ CODE_079891     ; $079889   |
    JMP CODE_079783     ; $07988B   |

CODE_07988E:
    JMP CODE_07976A     ; $07988E   |

CODE_079891:
    LDA $7CD8,x         ; $079891   |
    SEC                 ; $079894   |
    SBC $7CD8,y         ; $079895   |
    CLC                 ; $079898   |
    ADC #$0010          ; $079899   |
    CMP #$0020          ; $07989C   |
    BCC CODE_0798A4     ; $07989F   |
    JMP CODE_07997B     ; $0798A1   |

CODE_0798A4:
    SEP #$20            ; $0798A4   |
    LDA $10             ; $0798A6   |
    AND #$06            ; $0798A8   |
    CLC                 ; $0798AA   |
    ADC #$04            ; $0798AB   |
    STA $77,x           ; $0798AD   |
    TAX                 ; $0798AF   |
    REP #$20            ; $0798B0   |
    JMP ($98B5,x)       ; $0798B2   |

DATA_0798B5:         dw $98C1
DATA_0798B7:         dw $98C1
DATA_0798B9:         dw $98C1
DATA_0798BB:         dw $9913
DATA_0798BD:         dw $98C1
DATA_0798BF:         dw $9948

    STA $12A6,y         ; $0798C1   |
    LDA #$000F          ; $0798C3   |
    STA $18,x           ; $0798C6   |
    TAY                 ; $0798C8   |
    LDA $95C3,y         ; $0798C9   |
    AND #$00FF          ; $0798CC   |
    STA $7402,x         ; $0798CF   |
    LDA #$0004          ; $0798D2   |
    STA $7A96,x         ; $0798D5   |
    RTS                 ; $0798D8   |

    LDX $12             ; $0798D9   |
    LDA $7A96,x         ; $0798DB   |
    BNE CODE_07990D     ; $0798DE   |
    DEC $18,x           ; $0798E0   |
    BMI CODE_07990E     ; $0798E2   |
    LDY $18,x           ; $0798E4   |
    LDA $95C3,y         ; $0798E6   |
    AND #$00FF          ; $0798E9   |
    STA $7402,x         ; $0798EC   |
    LDA #$0004          ; $0798EF   |
    STA $7A96,x         ; $0798F2   |
    CPY #$09            ; $0798F5   |
    BNE CODE_07990D     ; $0798F7   |
    LDY $76,x           ; $0798F9   |
    LDA #$FE00          ; $0798FB   |
    STA $7222,y         ; $0798FE   |
    LDA #$0040          ; $079901   |
    STA $7542,y         ; $079904   |
    LDA #$0001          ; $079907   |
    STA $7D38,y         ; $07990A   |

CODE_07990D:
    RTS                 ; $07990D   |

CODE_07990E:
    LDY #$00            ; $07990E   |
    STY $77,x           ; $079910   |
    RTS                 ; $079912   |

    LDX $12             ; $079913   |
    LDA #$0011          ; $079915   |
    STA $18,x           ; $079918   |
    TAY                 ; $07991A   |
    LDA $95D3,y         ; $07991B   |
    AND #$00FF          ; $07991E   |
    STA $7402,x         ; $079921   |
    LDA #$0002          ; $079924   |
    STA $7A96,x         ; $079927   |
    RTS                 ; $07992A   |

    LDX $12             ; $07992B   |
    LDA $7A96,x         ; $07992D   |
    BNE CODE_079947     ; $079930   |
    DEC $18,x           ; $079932   |
    BMI CODE_07990E     ; $079934   |
    LDY $18,x           ; $079936   |
    LDA $95D3,y         ; $079938   |
    AND #$00FF          ; $07993B   |
    STA $7402,x         ; $07993E   |
    LDA #$0002          ; $079941   |
    STA $7A96,x         ; $079944   |

CODE_079947:
    RTS                 ; $079947   |

    LDX $12             ; $079948   |
    LDA #$0013          ; $07994A   |
    STA $18,x           ; $07994D   |
    TAY                 ; $07994F   |
    LDA $95AF,y         ; $079950   |
    AND #$00FF          ; $079953   |
    STA $7402,x         ; $079956   |
    LDA #$0002          ; $079959   |
    STA $7A96,x         ; $07995C   |
    RTS                 ; $07995F   |

CODE_079960:
    LDY $7862,x         ; $079960   |
    BNE CODE_07996D     ; $079963   |
    LDA $7860,x         ; $079965   |
    BIT #$0001          ; $079968   |
    BEQ CODE_0799A7     ; $07996B   |

CODE_07996D:
    LDA $7860,x         ; $07996D   |
    BIT #$000C          ; $079970   |
    BNE CODE_07997A     ; $079973   |
    RTS                 ; $079975   |

DATA_079976:         dw $FF00, $0100

CODE_07997A:
    PLA                 ; $07997A   |

CODE_07997B:
    LDA $78,x           ; $07997B   |
    BNE CODE_07998D     ; $07997D   |
    LDA #$0006          ; $07997F   |
    STA $7A96,x         ; $079982   |
    LDA #$000D          ; $079985   |
    STA $7402,x         ; $079988   |
    INC $78,x           ; $07998B   |

CODE_07998D:
    LDY $7400,x         ; $07998D   |
    LDA $9976,y         ; $079990   |
    STA $7220,x         ; $079993   |
    STZ $7540,x         ; $079996   |
    LDA $7A96,x         ; $079999   |
    BNE CODE_0799A6     ; $07999C   |
    LDA #$FA00          ; $07999E   |
    STA $7222,x         ; $0799A1   |
    STZ $78,x           ; $0799A4   |

CODE_0799A6:
    RTS                 ; $0799A6   |

CODE_0799A7:
    LDA #$0002          ; $0799A7   |
    STA $16,x           ; $0799AA   |
    PLA                 ; $0799AC   |
    RTS                 ; $0799AD   |
    LDX $12             ; $0799AE   |
    LDA $7222,x         ; $0799B0   |
    BMI CODE_0799BA     ; $0799B3   |
    LDY $7862,x         ; $0799B5   |
    BNE CODE_0799F2     ; $0799B8   |

CODE_0799BA:
    LDA $7860,x         ; $0799BA   |
    BIT #$0001          ; $0799BD   |
    BNE CODE_0799F2     ; $0799C0   |
    LDA $7220,x         ; $0799C2   |
    BNE CODE_0799D0     ; $0799C5   |
    LDY $7400,x         ; $0799C7   |
    LDA $9976,y         ; $0799CA   |
    STA $7220,x         ; $0799CD   |

CODE_0799D0:
    LDA $7222,x         ; $0799D0   |
    CLC                 ; $0799D3   |
    ADC #$0100          ; $0799D4   |
    CMP #$0200          ; $0799D7   |
    BCS CODE_0799E1     ; $0799DA   |
    LDA #$0004          ; $0799DC   |
    BRA CODE_0799EE     ; $0799DF   |

CODE_0799E1:
    LDA $7222,x         ; $0799E1   |
    BPL CODE_0799EB     ; $0799E4   |
    LDA #$0003          ; $0799E6   |
    BRA CODE_0799EE     ; $0799E9   |

CODE_0799EB:
    LDA #$0005          ; $0799EB   |

CODE_0799EE:
    STA $7402,x         ; $0799EE   |
    RTS                 ; $0799F1   |

CODE_0799F2:
    LDA #$0000          ; $0799F2   |
    STA $16,x           ; $0799F5   |
    RTS                 ; $0799F7   |

CODE_0799F8:
    LDA $7860,x         ; $0799F8   |
    BIT #$000C          ; $0799FB   |
    BEQ CODE_079A26     ; $0799FE   |
    LDA #$FC00          ; $079A00   |
    STA $7222,x         ; $079A03   |
    LDA #$0400          ; $079A06   |
    STA $75E2,x         ; $079A09   |
    LDA #$0040          ; $079A0C   |
    STA $7542,x         ; $079A0F   |
    STZ $18,x           ; $079A12   |
    STZ $76,x           ; $079A14   |
    STZ $78,x           ; $079A16   |
    STZ $7A36,x         ; $079A18   |
    STZ $7A38,x         ; $079A1B   |
    STZ $7900,x         ; $079A1E   |
    STZ $7902,x         ; $079A21   |
    BRA CODE_0799A7     ; $079A24   |

CODE_079A26:
    RTS                 ; $079A26   |

    STZ $76,x           ; $079A27   |
    STZ $78,x           ; $079A29   |
    STZ $7220,x         ; $079A2B   |
    STZ $7540,x         ; $079A2E   |
    STZ $18,x           ; $079A31   |
    LDA #$0004          ; $079A33   |
    STA $16,x           ; $079A36   |
    RTS                 ; $079A38   |

DATA_079A39:         db $05, $06

    LDX $12             ; $079A3B   |
    LDA $78,x           ; $079A3D   |
    TAX                 ; $079A3F   |
    JMP ($9A43,x)       ; $079A40   |

DATA_079A43:         dw $9A47, $9B17

    LDX $12             ; $079A47   |
    JSR CODE_0799F8     ; $079A49   |
    JSR CODE_079AB5     ; $079A4C   |
    JSR CODE_079A6F     ; $079A4F   |
    LDA $7A96,x         ; $079A52   |
    BNE CODE_079A6E     ; $079A55   |
    SEP #$20            ; $079A57   |
    LDA $18,x           ; $079A59   |
    EOR #$01            ; $079A5B   |
    STA $18,x           ; $079A5D   |
    LDY $18,x           ; $079A5F   |
    LDA $9A39,y         ; $079A61   |
    STA $7402,x         ; $079A64   |
    LDA #$04            ; $079A67   |
    STA $7A96,x         ; $079A69   |
    REP #$20            ; $079A6C   |

CODE_079A6E:
    RTS                 ; $079A6E   |

CODE_079A6F:
    LDA $7AF6,x         ; $079A6F   |
    BNE CODE_079AB0     ; $079A72   |
    LDY $7862,x         ; $079A74   |
    BEQ CODE_079A8D     ; $079A77   |
    LDA #$FF00          ; $079A79   |
    STA $75E2,x         ; $079A7C   |
    LDA #$0020          ; $079A7F   |
    STA $7542,x         ; $079A82   |
    LDA #$0000          ; $079A85   |
    STA $7AF6,x         ; $079A88   |
    BRA CODE_079AB0     ; $079A8B   |

CODE_079A8D:
    LDA #$0400          ; $079A8D   |
    STA $75E2,x         ; $079A90   |
    LDA #$0040          ; $079A93   |
    STA $7542,x         ; $079A96   |
    STZ $18,x           ; $079A99   |
    STZ $76,x           ; $079A9B   |
    STZ $78,x           ; $079A9D   |
    STZ $7A36,x         ; $079A9F   |
    STZ $7A38,x         ; $079AA2   |
    STZ $7900,x         ; $079AA5   |
    STZ $7902,x         ; $079AA8   |
    LDA #$0000          ; $079AAB   |
    STA $16,x           ; $079AAE   |

CODE_079AB0:
    RTS                 ; $079AB0   |

DATA_079AB1:         dw $FE00, $0200

CODE_079AB5:
    STZ $7220,x         ; $079AB5   |
    TXA                 ; $079AB8   |
    STA $3002           ; $079AB9   |
    LDX #$09            ; $079ABC   |
    LDA #$8F33          ; $079ABE   |
    JSL $7EDE44         ; $079AC1   | GSU init
    LDX $12             ; $079AC5   |
    LDY $3002           ; $079AC7   | r1
    BMI CODE_079AF4     ; $079ACA   |
    LDA $7360,y         ; $079ACC   |
    CMP #$0022          ; $079ACF   |
    BCC CODE_079AF4     ; $079AD2   |
    CMP #$0026          ; $079AD4   |
    BCS CODE_079AF4     ; $079AD7   |
    LDA $7CD6,x         ; $079AD9   |
    SEC                 ; $079ADC   |
    SBC $7CD6,y         ; $079ADD   |
    STA $00             ; $079AE0   |
    LDA $7400,x         ; $079AE2   |
    DEC A               ; $079AE5   |
    EOR $00             ; $079AE6   |
    BPL CODE_079AFF     ; $079AE8   |

CODE_079AEA:
    LDY $7400,x         ; $079AEA   |
    LDA $9AB1,y         ; $079AED   |
    STA $7220,x         ; $079AF0   |
    RTS                 ; $079AF3   |

CODE_079AF4:
    LDA $77C2,x         ; $079AF4   |
    AND #$00FF          ; $079AF7   |
    CMP $7400,x         ; $079AFA   |
    BEQ CODE_079AEA     ; $079AFD   |

CODE_079AFF:
    LDA #$0002          ; $079AFF   |
    STA $78,x           ; $079B02   |
    LDA #$0003          ; $079B04   |
    STA $18,x           ; $079B07   |
    LDA #$0004          ; $079B09   |
    STA $7A96,x         ; $079B0C   |
    STZ $7220,x         ; $079B0F   |
    RTS                 ; $079B12   |

DATA_079B13:         db $00, $11, $11, $00

    LDX $12             ; $079B17   |
    JSR CODE_079A6F     ; $079B19   |
    LDA $7A96,x         ; $079B1C   |
    BNE CODE_079B42     ; $079B1F   |
    DEC $18,x           ; $079B21   |
    BMI CODE_079B43     ; $079B23   |
    SEP #$20            ; $079B25   |
    LDY $18,x           ; $079B27   |
    LDA $9B13,y         ; $079B29   |
    STA $7402,x         ; $079B2C   |
    LDA #$04            ; $079B2F   |
    STA $7A96,x         ; $079B31   |
    CPY #$01            ; $079B34   |
    BNE CODE_079B40     ; $079B36   |
    LDA $7400,x         ; $079B38   |
    EOR #$02            ; $079B3B   |
    STA $7400,x         ; $079B3D   |

CODE_079B40:
    REP #$20            ; $079B40   |

CODE_079B42:
    RTS                 ; $079B42   |

CODE_079B43:
    STZ $18,x           ; $079B43   |
    STZ $78,x           ; $079B45   |
    RTS                 ; $079B47   |

CODE_079B48:
    LDA $77C2,x         ; $079B48   |
    AND #$00FF          ; $079B4B   |
    CMP $7400,x         ; $079B4E   |
    BNE CODE_079B76     ; $079B51   |
    LDA $7220,x         ; $079B53   |
    BEQ CODE_079B6D     ; $079B56   |
    STZ $75E0,x         ; $079B58   |
    LDA #$0010          ; $079B5B   |
    STA $7540,x         ; $079B5E   |
    LDA $7400,x         ; $079B61   |
    DEC A               ; $079B64   |
    EOR $7220,x         ; $079B65   |
    BMI CODE_079B73     ; $079B68   |
    STZ $7220,x         ; $079B6A   |

CODE_079B6D:
    STZ $7540,x         ; $079B6D   |
    JMP CODE_07976A     ; $079B70   |

CODE_079B73:
    JMP CODE_0797B8     ; $079B73   |

CODE_079B76:
    LDY $7400,x         ; $079B76   |
    LDA $9610,y         ; $079B79   |
    STA $75E0,x         ; $079B7C   |
    LDA #$0030          ; $079B7F   |
    STA $7540,x         ; $079B82   |
    JMP CODE_0797B8     ; $079B85   |

CODE_079B88:
    TXA                 ; $079B88   |
    STA $3002           ; $079B89   |
    LDX #$09            ; $079B8C   |
    LDA #$8F33          ; $079B8E   |
    JSL $7EDE44         ; $079B91   | GSU init
    LDX $12             ; $079B95   |
    LDY $3002           ; $079B97   | r1
    BMI CODE_079BCB     ; $079B9A   |
    LDA $7360,y         ; $079B9C   |
    CMP #$0022          ; $079B9F   |
    BCC CODE_079BCB     ; $079BA2   |
    CMP #$0026          ; $079BA4   |
    BCS CODE_079BCB     ; $079BA7   |
    LDA $7CD6,x         ; $079BA9   |
    SEC                 ; $079BAC   |
    SBC $7CD6,y         ; $079BAD   |
    CLC                 ; $079BB0   |
    ADC #$0100          ; $079BB1   |
    CMP #$0200          ; $079BB4   |
    BCS CODE_079BCB     ; $079BB7   |
    LDA $7CD8,x         ; $079BB9   |
    SEC                 ; $079BBC   |
    SBC $7CD8,y         ; $079BBD   |
    CLC                 ; $079BC0   |
    ADC #$0100          ; $079BC1   |
    CMP #$0200          ; $079BC4   |
    BCS CODE_079BCB     ; $079BC7   |
    STY $76,x           ; $079BC9   |

CODE_079BCB:
    LDY $76,x           ; $079BCB   |
    BEQ CODE_079C2D     ; $079BCD   |
    BMI CODE_079C2D     ; $079BCF   |
    LDA $6F00,y         ; $079BD1   |
    CMP #$0010          ; $079BD4   |
    BNE CODE_079C05     ; $079BD7   |
    LDA $7360,y         ; $079BD9   |
    CMP #$0022          ; $079BDC   |
    BCC CODE_079C05     ; $079BDF   |
    CMP #$0026          ; $079BE1   |
    BCS CODE_079C05     ; $079BE4   |
    LDA $79D8,y         ; $079BE6   |
    BNE CODE_079C05     ; $079BE9   |
    LDA $7680,y         ; $079BEB   |
    CLC                 ; $079BEE   |
    ADC #$0030          ; $079BEF   |
    CMP #$0150          ; $079BF2   |
    BCS CODE_079C05     ; $079BF5   |
    LDA $7682,y         ; $079BF7   |
    CLC                 ; $079BFA   |
    ADC #$0030          ; $079BFB   |
    CMP #$0150          ; $079BFE   |
    BCS CODE_079C05     ; $079C01   |
    BRA CODE_079C11     ; $079C03   |

CODE_079C05:
    LDA #$0020          ; $079C05   |
    STA $7A98,x         ; $079C08   |
    LDY #$FF            ; $079C0B   |
    STY $76,x           ; $079C0D   |
    BRA CODE_079C1D     ; $079C0F   |

CODE_079C11:
    LDA $7680,x         ; $079C11   |
    CLC                 ; $079C14   |
    ADC #$0028          ; $079C15   |
    CMP #$0128          ; $079C18   |
    BCC CODE_079C2D     ; $079C1B   |

CODE_079C1D:
    STZ $7A98,x         ; $079C1D   |
    LDY #$00            ; $079C20   |
    STY $76,x           ; $079C22   |
    STZ $7540,x         ; $079C24   |
    STZ $7220,x         ; $079C27   |
    STZ $75E0,x         ; $079C2A   |

CODE_079C2D:
    RTS                 ; $079C2D   |

CODE_079C2E:
    LDA $7CD8,x         ; $079C2E   |
    SEC                 ; $079C31   |
    SBC $611E           ; $079C32   |
    STA $08             ; $079C35   |
    LDA $7CD6,x         ; $079C37   |
    SEC                 ; $079C3A   |
    SBC $611C           ; $079C3B   |
    PHA                 ; $079C3E   |
    BPL CODE_079C45     ; $079C3F   |
    EOR #$FFFF          ; $079C41   |
    INC A               ; $079C44   |

CODE_079C45:
    STA $04             ; $079C45   |
    PLA                 ; $079C47   |
    CLC                 ; $079C48   |
    ADC $00             ; $079C49   |
    CMP $02             ; $079C4B   |
    BCS CODE_079C6C     ; $079C4D   |
    LDA $04             ; $079C4F   |
    ASL A               ; $079C51   |
    STA $04             ; $079C52   |
    ASL A               ; $079C54   |
    STA $06             ; $079C55   |
    LDA $08             ; $079C57   |
    CLC                 ; $079C59   |
    ADC $04             ; $079C5A   |
    CMP $06             ; $079C5C   |
    BCC CODE_079C6C     ; $079C5E   |
    LDA $08             ; $079C60   |
    CLC                 ; $079C62   |
    ADC #$0020          ; $079C63   |
    BPL CODE_079C6B     ; $079C66   |
    SEC                 ; $079C68   |
    BRA CODE_079C6C     ; $079C69   |

CODE_079C6B:
    CLC                 ; $079C6B   |

CODE_079C6C:
    RTS                 ; $079C6C   |

DATA_079C6D:         dw $0200, $FE00

CODE_079C71:
    LDY $7D36,x         ; $079C71   |
    DEY                 ; $079C74   |
    BMI CODE_079CB7     ; $079C75   |
    BEQ CODE_079CB7     ; $079C77   |
    LDA $6F00,y         ; $079C79   |
    CMP #$0010          ; $079C7C   |
    BNE CODE_079CB7     ; $079C7F   |
    LDA $7360,y         ; $079C81   |
    CMP #$0022          ; $079C84   |
    BCC CODE_079CB7     ; $079C87   |
    CMP #$0026          ; $079C89   |
    BCS CODE_079CB7     ; $079C8C   |
    LDA $79D8,y         ; $079C8E   |
    BNE CODE_079CB7     ; $079C91   |
    LDA #$0001          ; $079C93   |
    STA $7D38,y         ; $079C96   |
    LDA #$0040          ; $079C99   |
    STA $7542,y         ; $079C9C   |
    LDA #$FC00          ; $079C9F   |
    STA $7222,y         ; $079CA2   |
    LDA $7C76,x         ; $079CA5   |
    AND #$8000          ; $079CA8   |
    ASL A               ; $079CAB   |
    ROL A               ; $079CAC   |
    ASL A               ; $079CAD   |
    TAX                 ; $079CAE   |
    LDA $9C6D,x         ; $079CAF   |
    STA $7220,y         ; $079CB2   |
    LDX $12             ; $079CB5   |

CODE_079CB7:
    RTS                 ; $079CB7   |

DATA_079CB8:         dw $0100, $FF00

CODE_079CBC:
    LDA $7220,x         ; $079CBC   |
    BNE CODE_079CC9     ; $079CBF   |
    LDA $7860,x         ; $079CC1   |
    BIT #$0001          ; $079CC4   |
    BNE CODE_079CF6     ; $079CC7   |

CODE_079CC9:
    TXA                 ; $079CC9   |
    STA $3002           ; $079CCA   |
    LDX #$09            ; $079CCD   |
    LDA #$9011          ; $079CCF   |
    JSL $7EDE44         ; $079CD2   | GSU init

CODE_079CD6:
    LDX $12             ; $079CD6   |
    LDY $301C           ; $079CD8   | r14
    BMI CODE_079CF6     ; $079CDB   |
    BEQ CODE_079CF6     ; $079CDD   |
    LDA $6F00,y         ; $079CDF   |
    CMP #$000E          ; $079CE2   |
    BCC CODE_079CF7     ; $079CE5   |
    LDA $6FA2,y         ; $079CE7   |
    BIT #$6000          ; $079CEA   |
    BNE CODE_079CF7     ; $079CED   |
    TYX                 ; $079CEF   |
    JSL $03B25B         ; $079CF0   |
    LDX $12             ; $079CF4   |

CODE_079CF6:
    RTS                 ; $079CF6   |

CODE_079CF7:
    LDX #$09            ; $079CF7   |
    LDA $301E           ; $079CF9   |
    JSL $7EDE44         ; $079CFC   | GSU init
    BRA CODE_079CD6     ; $079D00   |

    LDA #$0001          ; $079D02   |
    STA $7D38,y         ; $079D05   |
    LDA #$0400          ; $079D08   |
    STA $75E2,y         ; $079D0B   |
    LDA #$0040          ; $079D0E   |
    STA $7542,y         ; $079D11   |
    LDA #$0000          ; $079D14   |
    STA $7540,y         ; $079D17   |
    STA $7860,y         ; $079D1A   |
    STA $7978,y         ; $079D1D   |
    LDA $7C76,y         ; $079D20   |
    AND #$8000          ; $079D23   |
    ASL A               ; $079D26   |
    ROL A               ; $079D27   |
    ASL A               ; $079D28   |
    TAX                 ; $079D29   |
    LDA $9CB8,x         ; $079D2A   |
    STA $7220,y         ; $079D2D   |
    LDA #$FE00          ; $079D30   |
    STA $7222,y         ; $079D33   |
    LDX $12             ; $079D36   |
    RTS                 ; $079D38   |

DATA_079D39:         dw $0008, $0004

CODE_079D3D:
    LDY $77C0,x         ; $079D3D   |
    BNE CODE_079D52     ; $079D40   |
    JSL $07FC2A         ; $079D42   |
    BCS CODE_079D49     ; $079D46   |
    RTS                 ; $079D48   |

CODE_079D49:
    STZ $76,x           ; $079D49   |
    SEP #$20            ; $079D4B   |
    INC $77C0,x         ; $079D4D   |
    REP #$20            ; $079D50   |

CODE_079D52:
    JSR CODE_079CBC     ; $079D52   |
    JSR CODE_079EA0     ; $079D55   |
    LDY $7D36,x         ; $079D58   |
    BPL CODE_079D74     ; $079D5B   |
    LDA $60AA           ; $079D5D   |
    BMI CODE_079D74     ; $079D60   |
    LDA $60FC           ; $079D62   |
    AND #$0007          ; $079D65   |
    BNE CODE_079D74     ; $079D68   |
    LDA $7182,x         ; $079D6A   |
    SEC                 ; $079D6D   |
    SBC #$0022          ; $079D6E   |
    STA $6090           ; $079D71   |

CODE_079D74:
    LDY $77,x           ; $079D74   |
    TYX                 ; $079D76   |
    JMP ($9D7A,x)       ; $079D77   |

DATA_079D7A:         dw $9D82
DATA_079D7C:         dw $9E1F
DATA_079D7E:         dw $9E26
DATA_079D80:         dw $9E3E

    LDX $12             ; $079D82   |
    JSL $07FC2F         ; $079D84   |
    BCC CODE_079DDD     ; $079D88   |
    LDA $60C4           ; $079D8A   |
    CMP $7400,x         ; $079D8D   |
    BEQ CODE_079DBE     ; $079D90   |
    LDA $7860,x         ; $079D92   |
    BIT #$0001          ; $079D95   |
    BNE CODE_079DA2     ; $079D98   |
    LDY $7862,x         ; $079D9A   |
    BEQ CODE_079E19     ; $079D9D   |
    LDA $7860,x         ; $079D9F   |

CODE_079DA2:
    LDY $7400,x         ; $079DA2   |
    AND $9D39,y         ; $079DA5   |
    BNE CODE_079E02     ; $079DA8   |
    LDY $7400,x         ; $079DAA   |
    LDA $9610,y         ; $079DAD   |
    STA $75E0,x         ; $079DB0   |
    LDA #$0008          ; $079DB3   |
    STA $7540,x         ; $079DB6   |

CODE_079DB9:
    JSR CODE_0797B8     ; $079DB9   |
    BRA CODE_079E1D     ; $079DBC   |

CODE_079DBE:
    JSR CODE_079E7E     ; $079DBE   |
    BNE CODE_079DB9     ; $079DC1   |
    SEP #$20            ; $079DC3   |
    LDY #$02            ; $079DC5   |
    STY $77,x           ; $079DC7   |
    LDY #$03            ; $079DC9   |
    STY $18,x           ; $079DCB   |
    LDA $95F2,y         ; $079DCD   |
    STA $7A96,x         ; $079DD0   |
    LDA $95E5,y         ; $079DD3   |
    STA $7402,x         ; $079DD6   |
    REP #$20            ; $079DD9   |
    BRA CODE_079E1D     ; $079DDB   |

CODE_079DDD:
    JSR CODE_079E7E     ; $079DDD   |
    BNE CODE_079DB9     ; $079DE0   |
    LDA #$0000          ; $079DE2   |
    STA $16,x           ; $079DE5   |
    STZ $18,x           ; $079DE7   |
    STZ $76,x           ; $079DE9   |
    STZ $78,x           ; $079DEB   |
    STZ $7A36,x         ; $079DED   |
    STZ $7A38,x         ; $079DF0   |
    STZ $7900,x         ; $079DF3   |
    STZ $7902,x         ; $079DF6   |
    SEP #$20            ; $079DF9   |
    STZ $77C0,x         ; $079DFB   |
    REP #$20            ; $079DFE   |
    BRA CODE_079E1D     ; $079E00   |

CODE_079E02:
    STZ $7540,x         ; $079E02   |
    SEP #$20            ; $079E05   |
    LDY #$04            ; $079E07   |
    STY $77,x           ; $079E09   |
    LDA #$06            ; $079E0B   |
    STA $7A96,x         ; $079E0D   |
    LDA #$0D            ; $079E10   |
    STA $7402,x         ; $079E12   |
    REP #$20            ; $079E15   |
    BRA CODE_079E1D     ; $079E17   |

CODE_079E19:
    LDY #$06            ; $079E19   |
    STY $77,x           ; $079E1B   |

CODE_079E1D:
    PLA                 ; $079E1D   |
    RTL                 ; $079E1E   |

    LDX $12             ; $079E1F   |
    JSR CODE_0797EE     ; $079E21   |
    BRA CODE_079E1D     ; $079E24   |

    LDX $12             ; $079E26   |
    LDA $7A96,x         ; $079E28   |
    BNE CODE_079E1D     ; $079E2B   |
    LDY $7400,x         ; $079E2D   |
    LDA $9976,y         ; $079E30   |
    STA $7220,x         ; $079E33   |
    LDA #$FA00          ; $079E36   |
    STA $7222,x         ; $079E39   |
    BRA CODE_079E19     ; $079E3C   |

    LDX $12             ; $079E3E   |
    LDA $7220,x         ; $079E40   |
    BNE CODE_079E4E     ; $079E43   |
    LDY $7400,x         ; $079E45   |
    LDA $9976,y         ; $079E48   |
    STA $7220,x         ; $079E4B   |

CODE_079E4E:
    LDY $7862,x         ; $079E4E   |
    BNE CODE_079E78     ; $079E51   |
    LDY #$04            ; $079E53   |
    LDA $7222,x         ; $079E55   |
    CLC                 ; $079E58   |
    ADC #$0100          ; $079E59   |
    CMP #$0200          ; $079E5C   |
    BCC CODE_079E72     ; $079E5F   |
    LDY #$03            ; $079E61   |
    LDA $7222,x         ; $079E63   |
    BMI CODE_079E72     ; $079E66   |
    LDA $7860,x         ; $079E68   |
    BIT #$0001          ; $079E6B   |
    BNE CODE_079E78     ; $079E6E   |
    LDY #$05            ; $079E70   |

CODE_079E72:
    TYA                 ; $079E72   |
    STA $7402,x         ; $079E73   |
    BRA CODE_079E1D     ; $079E76   |

CODE_079E78:
    LDY #$00            ; $079E78   |
    STY $77,x           ; $079E7A   |
    BRA CODE_079E1D     ; $079E7C   |

CODE_079E7E:
    STZ $75E0,x         ; $079E7E   |
    LDA #$0040          ; $079E81   |
    STA $7540,x         ; $079E84   |
    LDA $7220,x         ; $079E87   |
    BEQ CODE_079E97     ; $079E8A   |
    AND #$8000          ; $079E8C   |
    ASL A               ; $079E8F   |
    ROL A               ; $079E90   |
    ASL A               ; $079E91   |
    EOR $7400,x         ; $079E92   |
    BNE CODE_079E9F     ; $079E95   |

CODE_079E97:
    STZ $7220,x         ; $079E97   |
    STZ $7540,x         ; $079E9A   |
    LDY #$00            ; $079E9D   |

CODE_079E9F:
    RTS                 ; $079E9F   |

CODE_079EA0:
    LDY $7862,x         ; $079EA0   |
    BEQ CODE_079EB2     ; $079EA3   |
    LDA #$FF00          ; $079EA5   |
    STA $75E2,x         ; $079EA8   |
    LDA #$0020          ; $079EAB   |
    STA $7542,x         ; $079EAE   |
    RTS                 ; $079EB1   |

CODE_079EB2:
    LDA #$0400          ; $079EB2   |
    STA $75E2,x         ; $079EB5   |
    LDA #$0040          ; $079EB8   |
    STA $7542,x         ; $079EBB   |
    RTS                 ; $079EBE   |

DATA_079EBF:         db $00, $01, $02, $03, $04, $05, $06, $07
DATA_079EC7:         db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
DATA_079ECF:         db $10, $11, $12, $13, $12, $11, $14, $15
DATA_079ED7:         db $05, $18, $19, $1A, $19, $1B, $19, $1A
DATA_079EDF:         db $19, $1B, $19, $1A, $19, $1B, $19, $19
DATA_079EE7:         db $1C, $1D, $1C

DATA_079EEA:         db $04, $04, $10, $04, $04, $04, $20, $03
DATA_079EF2:         db $02, $01, $01, $01, $10, $04, $04, $04
DATA_079EFA:         db $04, $10, $00, $00, $02, $00, $04, $00
DATA_079F02:         db $08, $00

DATA_079F04:         dw $FFA0, $0060

DATA_079F08:         dw $0006, $FFFA

DATA_079F0C:         dw $0001, $FFFF

DATA_079F10:         dw $FFFD, $0003, $FFFE, $0002
DATA_079F18:         dw $FFFE, $0002, $FFFD, $0003
DATA_079F20:         dw $FFFD, $0003, $FFFE, $0002
DATA_079F28:         dw $FFFC, $0004, $FFFC, $0004
DATA_079F30:         dw $0000, $0000, $0002, $FFFE
DATA_079F38:         dw $0003, $FFFD, $0005, $FFFB
DATA_079F40:         dw $0009, $FFF7, $000F, $FFF1
DATA_079F48:         dw $000F, $FFF1, $000C, $FFF4
DATA_079F50:         dw $FFFF, $0001, $FFF8, $0008
DATA_079F58:         dw $FFF8, $0008, $FFF8, $0008
DATA_079F60:         dw $FFFA, $0006, $FFFD, $0003
DATA_079F68:         dw $FFEC, $0014, $FFF6, $000A
DATA_079F70:         dw $FFF8, $FFF8, $FFF7, $FFF7
DATA_079F78:         dw $FFF6, $FFF6, $FFF7, $FFF7
DATA_079F80:         dw $FFF8, $FFF8, $FFF8, $FFF8
DATA_079F88:         dw $FFF8, $FFF8, $FFF7, $FFF7
DATA_079F90:         dw $FFF7, $FFF7, $FFF5, $FFF5
DATA_079F98:         dw $FFF6, $FFF6, $FFF7, $FFF7
DATA_079FA0:         dw $FFF7, $FFF7, $FFFD, $FFFD
DATA_079FA8:         dw $FFFB, $FFFB, $FFF8, $FFF8
DATA_079FB0:         dw $FFF0, $FFF0, $FFF8, $FFF8
DATA_079FB8:         dw $FFFA, $FFFA, $FFFB, $FFFB
DATA_079FC0:         dw $FFF8, $FFF8, $FFF7, $FFF7
DATA_079FC8:         dw $FFFC, $FFFC, $FFEA, $FFEA

.init_green_glove
    LDA #$FFFF          ; $079FD0   |
    STA $76,x           ; $079FD3   |
    STZ $7900,x         ; $079FD5   |
    JSR CODE_07A0EB     ; $079FD8   |
    RTL                 ; $079FDB   |

.main_green_glove
    LDA $6F00,x         ; $079FDC   |
    CMP #$0010          ; $079FDF   |
    BNE CODE_079FE9     ; $079FE2   |
    LDA $7D96,x         ; $079FE4   |
    BEQ CODE_07A022     ; $079FE7   |

CODE_079FE9:
    LDA $7040,x         ; $079FE9   |
    ORA #$0004          ; $079FEC   |
    LDA $7040,x         ; $079FEF   |
    LDY $76,x           ; $079FF2   |
    BMI CODE_07A022     ; $079FF4   |
    LDA #$0040          ; $079FF6   |
    STA $7542,y         ; $079FF9   |
    LDA #$0001          ; $079FFC   |
    STA $7D38,y         ; $079FFF   |
    STA $74A2,y         ; $07A002   |
    LDA #$0000          ; $07A005   |
    STA $7A36,y         ; $07A008   |
    LDA $6FA0,y         ; $07A00B   |
    AND #$FFBF          ; $07A00E   |
    STA $6FA0,y         ; $07A011   |
    LDA $7040,y         ; $07A014   |
    ORA #$0004          ; $07A017   |
    STA $7040,y         ; $07A01A   |
    LDA #$FFFF          ; $07A01D   |
    STA $76,x           ; $07A020   |

CODE_07A022:
    JSL $03AF23         ; $07A022   |
    LDA $7040,x         ; $07A026   |
    AND #$000C          ; $07A029   |
    BNE CODE_07A040     ; $07A02C   |
    JSL $03A2F8         ; $07A02E   |
    BCC CODE_07A040     ; $07A032   |
    LDY $76,x           ; $07A034   |
    BMI CODE_07A03F     ; $07A036   |
    TYX                 ; $07A038   |
    JSL $03A31E         ; $07A039   |
    LDX $12             ; $07A03D   |

CODE_07A03F:
    RTL                 ; $07A03F   |

CODE_07A040:
    LDA $7402,x         ; $07A040   |
    CMP #$000D          ; $07A043   |
    BNE CODE_07A059     ; $07A046   |
    LDA $14             ; $07A048   |
    AND #$0006          ; $07A04A   |
    TAY                 ; $07A04D   |
    LDA $7042,x         ; $07A04E   |
    AND #$FFF1          ; $07A051   |
    ORA $9EFC,y         ; $07A054   |
    BRA CODE_07A05F     ; $07A057   |

CODE_07A059:
    LDA $7042,x         ; $07A059   |
    AND #$FFF1          ; $07A05C   |

CODE_07A05F:
    STA $7042,x         ; $07A05F   |
    LDA $7900,x         ; $07A062   |
    BEQ CODE_07A06A     ; $07A065   |
    JMP CODE_07A54E     ; $07A067   |

CODE_07A06A:
    LDA $7E04           ; $07A06A   |
    BNE CODE_07A075     ; $07A06D   |
    JSL $07FC2A         ; $07A06F   |
    BCS CODE_07A080     ; $07A073   |

CODE_07A075:
    JSL $03A5B7         ; $07A075   |
    LDA $16,x           ; $07A079   |
    TAX                 ; $07A07B   |
    JSR ($A0E1,x)       ; $07A07C   |

    RTL                 ; $07A07F   |

CODE_07A080:
    LDY $76,x           ; $07A080   |
    BMI CODE_07A0B0     ; $07A082   |
    LDA #$0040          ; $07A084   |
    STA $7542,y         ; $07A087   |
    LDA #$0001          ; $07A08A   |
    STA $7D38,y         ; $07A08D   |
    STA $74A2,y         ; $07A090   |
    LDA #$0000          ; $07A093   |
    STA $7A36,y         ; $07A096   |
    LDA $6FA0,y         ; $07A099   |
    AND #$FFBF          ; $07A09C   |
    STA $6FA0,y         ; $07A09F   |
    LDA $7040,y         ; $07A0A2   |
    ORA #$0004          ; $07A0A5   |
    STA $7040,y         ; $07A0A8   |
    LDA #$FFFF          ; $07A0AB   |
    STA $76,x           ; $07A0AE   |

CODE_07A0B0:
    LDY $77C2,x         ; $07A0B0   |
    LDA $88CF,y         ; $07A0B3   |
    STA $60A8           ; $07A0B6   |
    STA $60B4           ; $07A0B9   |
    LDY $76,x           ; $07A0BC   |
    BMI CODE_07A0D8     ; $07A0BE   |
    LDA $6FA0,y         ; $07A0C0   |
    AND #$FFBF          ; $07A0C3   |
    STA $6FA0,y         ; $07A0C6   |
    LDA #$0000          ; $07A0C9   |
    STA $7A36,y         ; $07A0CC   |
    STA $7D38,y         ; $07A0CF   |
    LDA #$0040          ; $07A0D2   |
    STA $7542,x         ; $07A0D5   |

CODE_07A0D8:
    LDA #$9ED8          ; $07A0D8   |
    STA $00             ; $07A0DB   |
    JSR CODE_07A580     ; $07A0DD   |
    RTL                 ; $07A0E0   |

DATA_07A0E1:         dw $A111
DATA_07A0E3:         dw $A230
DATA_07A0E5:         dw $A31B
DATA_07A0E7:         dw $A38D
DATA_07A0E9:         dw $A355

CODE_07A0EB:
    LDY $7400,x         ; $07A0EB   |
    LDA $9F04,y         ; $07A0EE   |
    STA $7220,x         ; $07A0F1   |
    STZ $18,x           ; $07A0F4   |
    LDA $9EBF           ; $07A0F6   |
    AND #$00FF          ; $07A0F9   |
    STA $7402,x         ; $07A0FC   |
    LDA #$0004          ; $07A0FF   |
    STA $7A96,x         ; $07A102   |
    LDA #$007C          ; $07A105   |
    STA $7A98,x         ; $07A108   |
    LDA #$0000          ; $07A10B   |
    STA $16,x           ; $07A10E   |
    RTS                 ; $07A110   |

    LDX $12             ; $07A111   |
    JSR CODE_07A538     ; $07A113   |
    BMI CODE_07A129     ; $07A116   |
    JSL $07FC1F         ; $07A118   |
    BPL CODE_07A126     ; $07A11C   |
    LDA $77C2,x         ; $07A11E   |
    AND #$00FF          ; $07A121   |
    STA $02             ; $07A124   |

CODE_07A126:
    JMP CODE_07A202     ; $07A126   |

CODE_07A129:
    JSR CODE_07A171     ; $07A129   |
    LDA $7860,x         ; $07A12C   |
    BIT #$0001          ; $07A12F   |
    BEQ CODE_07A139     ; $07A132   |
    AND #$000C          ; $07A134   |
    BEQ CODE_07A146     ; $07A137   |

CODE_07A139:
    LDA $70E2,x         ; $07A139   |
    SEC                 ; $07A13C   |
    SBC $72C0,x         ; $07A13D   |
    STA $70E2,x         ; $07A140   |
    JMP CODE_07A1EB     ; $07A143   |

CODE_07A146:
    LDA $7A96,x         ; $07A146   |
    BNE CODE_07A170     ; $07A149   |
    LDA $7A98,x         ; $07A14B   |
    BNE CODE_07A153     ; $07A14E   |
    JSR CODE_07A1EB     ; $07A150   |

CODE_07A153:
    SEP #$20            ; $07A153   |
    LDA $7978,x         ; $07A155   |
    INC A               ; $07A158   |
    CMP #$05            ; $07A159   |
    BCC CODE_07A15F     ; $07A15B   |
    LDA #$00            ; $07A15D   |

CODE_07A15F:
    STA $7978,x         ; $07A15F   |
    TAY                 ; $07A162   |
    LDA $9EBF,y         ; $07A163   |
    STA $7402,x         ; $07A166   |
    LDA #$04            ; $07A169   |
    STA $7A96,x         ; $07A16B   |
    REP #$20            ; $07A16E   |

CODE_07A170:
    RTS                 ; $07A170   |

CODE_07A171:
    LDY $7D36,x         ; $07A171   |
    DEY                 ; $07A174   |
    BEQ CODE_07A1EA     ; $07A175   |
    BMI CODE_07A1EA     ; $07A177   |
    LDA $6F00,y         ; $07A179   |
    CMP #$0010          ; $07A17C   |
    BNE CODE_07A1EA     ; $07A17F   |
    LDA $7360,y         ; $07A181   |
    CMP #$0022          ; $07A184   |
    BCC CODE_07A1EA     ; $07A187   |
    CMP #$002C          ; $07A189   |
    BCS CODE_07A1EA     ; $07A18C   |
    LDA $79D8,y         ; $07A18E   |
    BNE CODE_07A1EA     ; $07A191   |
    LDA $7A36,y         ; $07A193   |
    BMI CODE_07A1EA     ; $07A196   |
    LDA #$0005          ; $07A198   |
    STA $74A2,y         ; $07A19B   |
    LDA #$0000          ; $07A19E   |
    STA $7540,y         ; $07A1A1   |
    STA $7542,y         ; $07A1A4   |
    STA $7220,y         ; $07A1A7   |
    STA $7222,y         ; $07A1AA   |
    STA $7D38,y         ; $07A1AD   |
    STA $7402,y         ; $07A1B0   |
    LDA $6FA0,y         ; $07A1B3   |
    ORA #$0040          ; $07A1B6   |
    STA $6FA0,y         ; $07A1B9   |
    LDA $6FA2,y         ; $07A1BC   |
    AND #$FFE0          ; $07A1BF   |
    STA $6FA2,y         ; $07A1C2   |
    LDA $7040,y         ; $07A1C5   |
    AND #$FFF3          ; $07A1C8   |
    STA $7040,y         ; $07A1CB   |
    LDA #$FFFF          ; $07A1CE   |
    STA $7A36,y         ; $07A1D1   |
    TYA                 ; $07A1D4   |
    STA $76,x           ; $07A1D5   |
    STZ $7220,x         ; $07A1D7   |
    STZ $7540,x         ; $07A1DA   |
    LDA $7040,x         ; $07A1DD   |
    AND #$FFF3          ; $07A1E0   |
    STA $7040,x         ; $07A1E3   |
    PLA                 ; $07A1E6   |
    JMP CODE_07A302     ; $07A1E7   |

CODE_07A1EA:
    RTS                 ; $07A1EA   |

CODE_07A1EB:
    LDA $7400,x         ; $07A1EB   |
    EOR #$0002          ; $07A1EE   |
    STA $7400,x         ; $07A1F1   |
    TAY                 ; $07A1F4   |
    LDA $9F04,y         ; $07A1F5   |
    STA $7220,x         ; $07A1F8   |
    LDA #$007C          ; $07A1FB   |
    STA $7A98,x         ; $07A1FE   |
    RTS                 ; $07A201   |

CODE_07A202:
    STZ $7220,x         ; $07A202   |
    LDA $02             ; $07A205   |
    STA $7400,x         ; $07A207   |
    LDA #$0016          ; $07A20A   |
    STA $7402,x         ; $07A20D   |
    LDA #$0002          ; $07A210   |
    STA $16,x           ; $07A213   |
    STZ $7A96,x         ; $07A215   |

CODE_07A218:
    LDA $7860,x         ; $07A218   |
    BIT #$0001          ; $07A21B   |
    BEQ CODE_07A225     ; $07A21E   |
    AND #$000C          ; $07A220   |
    BEQ CODE_07A22F     ; $07A223   |

CODE_07A225:
    LDA $70E2,x         ; $07A225   |
    SEC                 ; $07A228   |
    SBC $72C0,x         ; $07A229   |
    STA $70E2,x         ; $07A22C   |

CODE_07A22F:
    RTS                 ; $07A22F   |

    LDX $12             ; $07A230   |
    LDY $7D36,x         ; $07A232   |
    DEY                 ; $07A235   |
    BEQ CODE_07A23A     ; $07A236   |
    BPL CODE_07A23D     ; $07A238   |

CODE_07A23A:
    JMP CODE_07A2DB     ; $07A23A   |

CODE_07A23D:
    LDA $6F00,y         ; $07A23D   |
    CMP #$0010          ; $07A240   |
    BNE CODE_07A23A     ; $07A243   |
    LDA $7D38,y         ; $07A245   |
    BEQ CODE_07A23A     ; $07A248   |
    JSL $07FC0D         ; $07A24A   |
    BPL CODE_07A253     ; $07A24E   |

CODE_07A250:
    JMP CODE_07A2DB     ; $07A250   |

CODE_07A253:
    LDA $7360,y         ; $07A253   |
    CMP #$0022          ; $07A256   |
    BCC CODE_07A250     ; $07A259   |
    CMP #$002C          ; $07A25B   |
    BCS CODE_07A2DB     ; $07A25E   |
    LDA $7542,y         ; $07A260   |
    CMP #$0040          ; $07A263   |
    BCS CODE_07A278     ; $07A266   |
    LDA $7220,y         ; $07A268   |
    CMP #$8000          ; $07A26B   |
    ROR A               ; $07A26E   |
    STA $7220,x         ; $07A26F   |
    LDA #$0040          ; $07A272   |
    STA $7540,x         ; $07A275   |

CODE_07A278:
    LDA #$0005          ; $07A278   |
    STA $74A2,y         ; $07A27B   |
    LDA #$0000          ; $07A27E   |
    STA $7540,y         ; $07A281   |
    STA $7542,y         ; $07A284   |
    STA $7220,y         ; $07A287   |
    STA $7222,y         ; $07A28A   |
    STA $7D38,y         ; $07A28D   |
    STA $7402,y         ; $07A290   |
    LDA #$FFFF          ; $07A293   |
    STA $7A36,y         ; $07A296   |
    LDA $6FA0,y         ; $07A299   |
    ORA #$0040          ; $07A29C   |
    STA $6FA0,y         ; $07A29F   |
    LDA $6FA2,y         ; $07A2A2   |
    AND #$FFE0          ; $07A2A5   |
    STA $6FA2,y         ; $07A2A8   |
    LDA $7040,y         ; $07A2AB   |
    AND #$FFF3          ; $07A2AE   |
    STA $7040,y         ; $07A2B1   |
    TYA                 ; $07A2B4   |
    AND #$00FF          ; $07A2B5   |
    STA $76,x           ; $07A2B8   |
    LDA $7040,x         ; $07A2BA   |
    AND #$FFF3          ; $07A2BD   |
    STA $7040,x         ; $07A2C0   |
    LDA $7CD8,x         ; $07A2C3   |
    SEC                 ; $07A2C6   |
    SBC #$0010          ; $07A2C7   |
    SEC                 ; $07A2CA   |
    SBC $7CD8,y         ; $07A2CB   |
    BCC CODE_07A2D5     ; $07A2CE   |
    JSR CODE_07A4D3     ; $07A2D0   |
    BRA CODE_07A2D8     ; $07A2D3   |

CODE_07A2D5:
    JSR CODE_07A474     ; $07A2D5   |

CODE_07A2D8:
    JMP CODE_07A342     ; $07A2D8   |

CODE_07A2DB:
    LDA $7A96,x         ; $07A2DB   |
    BNE CODE_07A2FE     ; $07A2DE   |
    JSR CODE_07A538     ; $07A2E0   |
    BMI CODE_07A2FF     ; $07A2E3   |
    JSL $07FC1F         ; $07A2E5   |
    BPL CODE_07A2F3     ; $07A2E9   |
    LDA $77C2,x         ; $07A2EB   |
    AND #$00FF          ; $07A2EE   |
    STA $02             ; $07A2F1   |

CODE_07A2F3:
    LDA $02             ; $07A2F3   |
    STA $7400,x         ; $07A2F5   |
    LDA #$0040          ; $07A2F8   |
    STA $7A96,x         ; $07A2FB   |

CODE_07A2FE:
    RTS                 ; $07A2FE   |

CODE_07A2FF:
    JMP CODE_07A0EB     ; $07A2FF   |

CODE_07A302:
    LDA #$0004          ; $07A302   |
    STA $16,x           ; $07A305   |
    STZ $18,x           ; $07A307   |
    LDA $9EC4           ; $07A309   |
    AND #$00FF          ; $07A30C   |
    STA $7402,x         ; $07A30F   |
    LDA #$0004          ; $07A312   |
    STA $7A96,x         ; $07A315   |
    JMP CODE_07A3C4     ; $07A318   |

    LDX $12             ; $07A31B   |
    LDA $7A96,x         ; $07A31D   |
    BNE CODE_07A33F     ; $07A320   |
    LDA $18,x           ; $07A322   |
    INC A               ; $07A324   |
    CMP #$0002          ; $07A325   |
    BCC CODE_07A32D     ; $07A328   |
    JMP CODE_07A372     ; $07A32A   |

CODE_07A32D:
    STA $18,x           ; $07A32D   |
    TAY                 ; $07A32F   |
    LDA $9EC4,y         ; $07A330   |
    AND #$00FF          ; $07A333   |
    STA $7402,x         ; $07A336   |
    LDA #$0004          ; $07A339   |
    STA $7A96,x         ; $07A33C   |

CODE_07A33F:
    JMP CODE_07A3C4     ; $07A33F   |

CODE_07A342:
    LDA #$0023          ; $07A342   |\ play sound #$0023
    JSL $0085D2         ; $07A345   |/
    LDA #$0008          ; $07A349   |
    STA $16,x           ; $07A34C   |
    LDA #$003E          ; $07A34E   |
    STA $7A96,x         ; $07A351   |
    RTS                 ; $07A354   |

    LDX $12             ; $07A355   |
    LDA $7220,x         ; $07A357   |
    BEQ CODE_07A367     ; $07A35A   |
    LDA $7400,x         ; $07A35C   |
    LSR A               ; $07A35F   |
    LSR A               ; $07A360   |
    ROR A               ; $07A361   |
    EOR $7220,x         ; $07A362   |
    BPL CODE_07A3C4     ; $07A365   |

CODE_07A367:
    STZ $7220,x         ; $07A367   |
    STZ $7540,x         ; $07A36A   |
    LDA $7A96,x         ; $07A36D   |
    BNE CODE_07A3C4     ; $07A370   |

CODE_07A372:
    LDA #$0006          ; $07A372   |
    STA $16,x           ; $07A375   |
    STZ $18,x           ; $07A377   |
    LDA $9EC6           ; $07A379   |
    AND #$00FF          ; $07A37C   |
    STA $7402,x         ; $07A37F   |
    LDA $9EEA           ; $07A382   |
    AND #$00FF          ; $07A385   |
    STA $7A96,x         ; $07A388   |
    BRA CODE_07A3C4     ; $07A38B   |

    LDX $12             ; $07A38D   |
    LDA $77C2,x         ; $07A38F   |
    STA $7400,x         ; $07A392   |
    LDA $7A96,x         ; $07A395   |
    BNE CODE_07A3B7     ; $07A398   |
    LDA $18,x           ; $07A39A   |
    INC A               ; $07A39C   |
    CMP #$0012          ; $07A39D   |
    BCS CODE_07A3EC     ; $07A3A0   |
    STA $18,x           ; $07A3A2   |
    TAY                 ; $07A3A4   |
    LDA $9EC6,y         ; $07A3A5   |
    AND #$00FF          ; $07A3A8   |
    STA $7402,x         ; $07A3AB   |
    LDA $9EEA,y         ; $07A3AE   |
    AND #$00FF          ; $07A3B1   |
    STA $7A96,x         ; $07A3B4   |

CODE_07A3B7:
    LDA $18,x           ; $07A3B7   |
    CMP #$000B          ; $07A3B9   |
    BEQ CODE_07A3EF     ; $07A3BC   |
    BCS CODE_07A3EB     ; $07A3BE   |
    JSL $0EB14D         ; $07A3C0   |

CODE_07A3C4:
    LDA $7402,x         ; $07A3C4   |
    ASL A               ; $07A3C7   |
    ASL A               ; $07A3C8   |
    ORA $7400,x         ; $07A3C9   |
    TAY                 ; $07A3CC   |
    LDA $9F10,y         ; $07A3CD   |
    STA $00             ; $07A3D0   |
    LDA $9F70,y         ; $07A3D2   |
    STA $02             ; $07A3D5   |
    LDY $76,x           ; $07A3D7   |
    LDA $70E2,x         ; $07A3D9   |
    CLC                 ; $07A3DC   |
    ADC $00             ; $07A3DD   |
    STA $70E2,y         ; $07A3DF   |
    LDA $7182,x         ; $07A3E2   |
    CLC                 ; $07A3E5   |
    ADC $02             ; $07A3E6   |
    STA $7182,y         ; $07A3E8   |

CODE_07A3EB:
    RTS                 ; $07A3EB   |

CODE_07A3EC:
    JMP CODE_07A0EB     ; $07A3EC   |

CODE_07A3EF:
    JSL $0EB148         ; $07A3EF   |
    LDA $611C           ; $07A3F3   |
    STA $3002           ; $07A3F6   |
    LDA $611E           ; $07A3F9   |
    STA $3004           ; $07A3FC   |
    LDY $76,x           ; $07A3FF   |
    LDA $7CD6,y         ; $07A401   |
    STA $3006           ; $07A404   |
    LDA $7CD8,y         ; $07A407   |
    STA $3008           ; $07A40A   |
    LDA #$06F0          ; $07A40D   |
    STA $300C           ; $07A410   |
    LDX #$09            ; $07A413   |
    LDA #$907C          ; $07A415   |
    JSL $7EDE44         ; $07A418   | GSU init
    LDX $12             ; $07A41C   |
    LDY $76,x           ; $07A41E   |
    LDA $3002           ; $07A420   |
    STA $7220,y         ; $07A423   |
    LDA $3004           ; $07A426   |
    STA $7222,y         ; $07A429   |
    LDA #$0001          ; $07A42C   |
    STA $7542,y         ; $07A42F   |
    STA $7D38,y         ; $07A432   |
    LDA #$0001          ; $07A435   |
    STA $7A36,y         ; $07A438   |
    STA $74A2,y         ; $07A43B   |
    SEP #$20            ; $07A43E   |
    STA $77C0,y         ; $07A440   |
    REP #$20            ; $07A443   |
    LDA $6FA0,y         ; $07A445   |
    AND #$FFBF          ; $07A448   |
    STA $6FA0,y         ; $07A44B   |
    LDA $7040,y         ; $07A44E   |
    ORA #$0004          ; $07A451   |
    STA $7040,y         ; $07A454   |
    LDA #$FFFF          ; $07A457   |
    STA $76,x           ; $07A45A   |
    LDA $7040,x         ; $07A45C   |
    ORA #$0004          ; $07A45F   |
    STA $7040,x         ; $07A462   |
    LDA #$0020          ; $07A465   |\ play sound #$0020
    JSL $0085D2         ; $07A468   |/
    LDA #$004A          ; $07A46C   |\ play sound #$004A
    JSL $0085D2         ; $07A46F   |/
    RTS                 ; $07A473   |

CODE_07A474:
    PHY                 ; $07A474   |
    LDA $7402,x         ; $07A475   |
    ASL A               ; $07A478   |
    ASL A               ; $07A479   |
    ORA $7400,x         ; $07A47A   |
    TAY                 ; $07A47D   |
    LDA $9F10,y         ; $07A47E   |
    STA $00             ; $07A481   |
    LDA $9F70,y         ; $07A483   |
    STA $02             ; $07A486   |
    PLY                 ; $07A488   |
    LDA $70E2,x         ; $07A489   |
    CLC                 ; $07A48C   |
    ADC $00             ; $07A48D   |
    STA $70E2,y         ; $07A48F   |
    LDA $7182,x         ; $07A492   |
    CLC                 ; $07A495   |
    ADC $02             ; $07A496   |
    STA $7182,y         ; $07A498   |
    LDY $7400,x         ; $07A49B   |
    LDA $9F08,y         ; $07A49E   |
    STA $00             ; $07A4A1   |
    LDA #$01F6          ; $07A4A3   |
    JSL $008B21         ; $07A4A6   |
    LDA $7400,x         ; $07A4AA   |
    STA $73C0,y         ; $07A4AD   |
    LDA $70E2,x         ; $07A4B0   |
    SEC                 ; $07A4B3   |
    SBC $00             ; $07A4B4   |
    STA $70A2,y         ; $07A4B6   |
    LDA $7182,x         ; $07A4B9   |
    SEC                 ; $07A4BC   |
    SBC #$0007          ; $07A4BD   |
    STA $7142,y         ; $07A4C0   |
    LDA #$0002          ; $07A4C3   |
    STA $7E4C,y         ; $07A4C6   |
    STA $7782,y         ; $07A4C9   |
    LDA #$0005          ; $07A4CC   |
    STA $7E4E,y         ; $07A4CF   |
    RTS                 ; $07A4D2   |

CODE_07A4D3:
    LDA #$0017          ; $07A4D3   |
    STA $7402,x         ; $07A4D6   |
    PHY                 ; $07A4D9   |
    LDA $7402,x         ; $07A4DA   |
    ASL A               ; $07A4DD   |
    ASL A               ; $07A4DE   |
    ORA $7400,x         ; $07A4DF   |
    TAY                 ; $07A4E2   |
    LDA $9F10,y         ; $07A4E3   |
    STA $00             ; $07A4E6   |
    LDA $9F70,y         ; $07A4E8   |
    STA $02             ; $07A4EB   |
    PLY                 ; $07A4ED   |
    LDA $70E2,x         ; $07A4EE   |
    CLC                 ; $07A4F1   |
    ADC $00             ; $07A4F2   |
    STA $70E2,y         ; $07A4F4   |
    LDA $7182,x         ; $07A4F7   |
    CLC                 ; $07A4FA   |
    ADC $02             ; $07A4FB   |
    STA $7182,y         ; $07A4FD   |
    LDY $7400,x         ; $07A500   |
    LDA $9F0C,y         ; $07A503   |
    STA $00             ; $07A506   |
    LDA #$01F9          ; $07A508   |
    JSL $008B21         ; $07A50B   |
    LDA $7400,x         ; $07A50F   |
    STA $73C0,y         ; $07A512   |
    LDA $70E2,x         ; $07A515   |
    SEC                 ; $07A518   |
    SBC $00             ; $07A519   |
    STA $70A2,y         ; $07A51B   |
    LDA $7182,x         ; $07A51E   |
    SEC                 ; $07A521   |
    SBC #$000B          ; $07A522   |
    STA $7142,y         ; $07A525   |
    LDA #$0002          ; $07A528   |
    STA $7E4C,y         ; $07A52B   |
    STA $7782,y         ; $07A52E   |
    LDA #$0005          ; $07A531   |
    STA $7E4E,y         ; $07A534   |
    RTS                 ; $07A537   |

CODE_07A538:
    LDA #$0030          ; $07A538   |
    STA $04             ; $07A53B   |
    ASL A               ; $07A53D   |
    STA $06             ; $07A53E   |
    LDA #$0020          ; $07A540   |
    STA $08             ; $07A543   |
    CLC                 ; $07A545   |
    ADC #$0030          ; $07A546   |
    STA $0A             ; $07A549   |
    JMP CODE_078CF1     ; $07A54B   |

CODE_07A54E:
    LDY $7D36,x         ; $07A54E   |
    BPL CODE_07A565     ; $07A551   |
    LDA $7E04           ; $07A553   |
    BEQ CODE_07A55C     ; $07A556   |
    JMP CODE_0703B2     ; $07A558   |

CODE_07A55C:
    JSL $07FC2A         ; $07A55C   |
    BCC CODE_07A565     ; $07A560   |
    JMP CODE_07A0B0     ; $07A562   |

CODE_07A565:
    LDA #$9ED8          ; $07A565   |
    STA $00             ; $07A568   |
    JSR CODE_07A623     ; $07A56A   |
    RTL                 ; $07A56D   |

DATA_07A56E:         dw $2020, $0202, $0202, $0202
DATA_07A576:         dw $0202, $0202, $0202, $0620
DATA_07A57E:         dw $1018

CODE_07A580:
    LDA $60D4           ; $07A580   |
    BNE CODE_07A5CA     ; $07A583   |
    JSL $03B20B         ; $07A585   |
    LDY $77C0,x         ; $07A589   |
    CPY #$02            ; $07A58C   |
    BCS CODE_07A5CA     ; $07A58E   |
    SEP #$20            ; $07A590   |
    INC $77C0,x         ; $07A592   |
    LDA ($00)           ; $07A595   |
    STA $7402,x         ; $07A597   |
    LDA $A56E           ; $07A59A   |
    STA $7A96,x         ; $07A59D   |
    REP #$20            ; $07A5A0   |
    STZ $7220,x         ; $07A5A2   |
    STZ $7540,x         ; $07A5A5   |
    STZ $7978,x         ; $07A5A8   |
    LDA #$0001          ; $07A5AB   |
    STA $7900,x         ; $07A5AE   |
    LDA #$001C          ; $07A5B1   |\ play sound #$001C
    JSL $0085D2         ; $07A5B4   |/
    LDA $7CD6,x         ; $07A5B8   |
    STA $00             ; $07A5BB   |
    LDA $7CD8,x         ; $07A5BD   |
    STA $02             ; $07A5C0   |
    LDA #$01E7          ; $07A5C2   |
    JSL $03B56E         ; $07A5C5   |
    RTS                 ; $07A5C9   |

CODE_07A5CA:
    LDA #$003B          ; $07A5CA   |\ play sound #$003B
    JSL $0085D2         ; $07A5CD   |/
    JSL $0CFF61         ; $07A5D1   |
    JSL $03A32E         ; $07A5D5   |
    LDA #$0004          ; $07A5D9   |
    STA $00             ; $07A5DC   |
    JSR CODE_07A5EF     ; $07A5DE   |
    PLA                 ; $07A5E1   |
    RTL                 ; $07A5E2   |

DATA_07A5E3:         dw $0000, $0100, $FF00

DATA_07A5E9:         dw $FD80, $FE00, $FE00

CODE_07A5EF:
    PHX                 ; $07A5EF   |
    LDX $00             ; $07A5F0   |
    LDA $A5E3,x         ; $07A5F2   |
    STA $02             ; $07A5F5   |
    LDA $A5E9,x         ; $07A5F7   |
    STA $04             ; $07A5FA   |
    PLX                 ; $07A5FC   |
    LDA #$0115          ; $07A5FD   |
    JSL $03A34C         ; $07A600   |
    BCC CODE_07A622     ; $07A604   |
    LDA $70E2,x         ; $07A606   |
    STA $70E2,y         ; $07A609   |
    LDA $7182,x         ; $07A60C   |
    STA $7182,y         ; $07A60F   |
    LDA $02             ; $07A612   |
    STA $7220,y         ; $07A614   |
    LDA $04             ; $07A617   |
    STA $7222,y         ; $07A619   |
    DEC $00             ; $07A61C   |
    DEC $00             ; $07A61E   |
    BPL CODE_07A5EF     ; $07A620   |

CODE_07A622:
    RTS                 ; $07A622   |

CODE_07A623:
    LDA $7860,x         ; $07A623   |
    AND #$0001          ; $07A626   |
    BEQ CODE_07A658     ; $07A629   |
    LDA $7A96,x         ; $07A62B   |
    BNE CODE_07A658     ; $07A62E   |
    LDA $7978,x         ; $07A630   |
    INC A               ; $07A633   |
    CMP #$0012          ; $07A634   |
    BCS CODE_07A659     ; $07A637   |
    STA $7978,x         ; $07A639   |
    TAY                 ; $07A63C   |
    LDA ($00),y         ; $07A63D   |
    AND #$00FF          ; $07A63F   |
    STA $7402,x         ; $07A642   |
    LDA $A56E,y         ; $07A645   |
    AND #$00FF          ; $07A648   |
    STA $7A96,x         ; $07A64B   |
    CPY #$10            ; $07A64E   |
    BNE CODE_07A658     ; $07A650   |
    LDA #$FD00          ; $07A652   |
    STA $7222,x         ; $07A655   |

CODE_07A658:
    RTS                 ; $07A658   |

CODE_07A659:
    LDY $77C0,x         ; $07A659   |
    PHY                 ; $07A65C   |
    LDA $7360,x         ; $07A65D   |
    TXY                 ; $07A660   |
    JSL $03A377         ; $07A661   |
    SEP #$20            ; $07A665   |
    PLA                 ; $07A667   |
    STA $77C0,x         ; $07A668   |
    REP #$20            ; $07A66B   |
    STZ $7900,x         ; $07A66D   |
    LDA #$FFFF          ; $07A670   |
    STA $76,x           ; $07A673   |
    RTS                 ; $07A675   |

DATA_07A676:         dw $FE80, $0180

.init_lakitu                                 ; spawns one or two lakitus
    LDA $0C3C           ; $07A67A   |
    BEQ CODE_07A683     ; $07A67D   |
    JMP CODE_0703A3     ; $07A67F   |

CODE_07A683:
    LDA #$0001          ; $07A683   |
    STA $0C3C           ; $07A686   |
    LDA #$0200          ; $07A689   |
    STA $75E0,x         ; $07A68C   |
    LDA #$0200          ; $07A68F   |
    STA $75E2,x         ; $07A692   |
    LDA #$0008          ; $07A695   |
    STA $7540,x         ; $07A698   |
    LDA #$0008          ; $07A69B   |
    STA $7542,x         ; $07A69E   |
    LDA #$A6FA          ; $07A6A1   |
    STA $7A36,x         ; $07A6A4   |
    JSR CODE_07A84D     ; $07A6A7   |
    LDA $70E2,x         ; $07A6AA   |
    AND #$0010          ; $07A6AD   |
    BEQ CODE_07A6F9     ; $07A6B0   |
    LDY $7400,x         ; $07A6B2   |
    LDA $70E2,x         ; $07A6B5   |
    CLC                 ; $07A6B8   |
    ADC $A676,y         ; $07A6B9   |
    AND #$FFE0          ; $07A6BC   |
    STA $00             ; $07A6BF   |
    LDA #$011B          ; $07A6C1   |
    JSL $03A364         ; $07A6C4   |
    BCC CODE_07A6F9     ; $07A6C8   |
    LDA $00             ; $07A6CA   |
    STA $70E2,y         ; $07A6CC   |
    LDA $7182,x         ; $07A6CF   |
    STA $7182,y         ; $07A6D2   |
    LDA #$0200          ; $07A6D5   |
    STA $75E0,y         ; $07A6D8   |
    LDA #$0200          ; $07A6DB   |
    STA $75E2,y         ; $07A6DE   |
    LDA #$0008          ; $07A6E1   |
    STA $7540,y         ; $07A6E4   |
    LDA #$0008          ; $07A6E7   |
    STA $7542,y         ; $07A6EA   |
    LDA #$A6FE          ; $07A6ED   |
    STA $7A36,y         ; $07A6F0   |
    TYX                 ; $07A6F3   |
    JSR CODE_07A84D     ; $07A6F4   |
    LDX $12             ; $07A6F7   |

CODE_07A6F9:
    RTL                 ; $07A6F9   |

DATA_07A6FA:         dw $0088, $0068, $0098, $0058

.main_lakitu                                 ; spawns one or two lakitus
    LDA $6F00,x         ; $07A702   |
    CMP #$0008          ; $07A705   |
    BNE CODE_07A751     ; $07A708   |
    LDA #$011C          ; $07A70A   |
    JSL $03A364         ; $07A70D   |
    BCC CODE_07A741     ; $07A711   |
    LDA $70E2,x         ; $07A713   |
    STA $70E2,y         ; $07A716   |
    LDA $7182,x         ; $07A719   |
    STA $7182,y         ; $07A71C   |
    LDA #$0008          ; $07A71F   |
    STA $6F00,y         ; $07A722   |
    TYA                 ; $07A725   |
    AND #$00FF          ; $07A726   |
    INC A               ; $07A729   |
    STA $6162           ; $07A72A   |
    LDA $7040,y         ; $07A72D   |
    AND #$FFF3          ; $07A730   |
    STA $7040,y         ; $07A733   |
    TXA                 ; $07A736   |
    INC A               ; $07A737   |
    STA $7976,y         ; $07A738   |
    JSL $07A956         ; $07A73B   |
    BRA CODE_07A74A     ; $07A73F   |

CODE_07A741:
    LDA #$0010          ; $07A741   |
    STA $6F00,x         ; $07A744   |
    STZ $6162           ; $07A747   |

CODE_07A74A:
    STZ $6168           ; $07A74A   |
    PLA                 ; $07A74D   |
    PLY                 ; $07A74E   |
    BRA CODE_07A754     ; $07A74F   |

CODE_07A751:
    JSR CODE_07A9C6     ; $07A751   |

CODE_07A754:
    JSL $03AF23         ; $07A754   |
    JSR CODE_07AA37     ; $07A758   |
    LDA $77C2,x         ; $07A75B   |
    STA $7400,x         ; $07A75E   |
    LDA $0C3C           ; $07A761   |
    BNE CODE_07A783     ; $07A764   |
    LDA #$FC00          ; $07A766   |
    STA $75E0,x         ; $07A769   |
    STA $75E2,x         ; $07A76C   |
    LDA #$0040          ; $07A76F   |
    STA $7542,x         ; $07A772   |
    STA $7540,x         ; $07A775   |
    LDA $7040,x         ; $07A778   |
    ORA #$0004          ; $07A77B   |
    STA $7040,x         ; $07A77E   |
    BRA CODE_07A800     ; $07A781   |

CODE_07A783:
    LDA $77C2,x         ; $07A783   |
    LSR A               ; $07A786   |
    LSR A               ; $07A787   |
    ROR A               ; $07A788   |
    EOR $7220,x         ; $07A789   |
    BMI CODE_07A793     ; $07A78C   |
    LDA #$0010          ; $07A78E   |
    BRA CODE_07A796     ; $07A791   |

CODE_07A793:
    LDA #$0008          ; $07A793   |

CODE_07A796:
    STA $7540,x         ; $07A796   |
    LDA $7220,x         ; $07A799   |
    BPL CODE_07A7A2     ; $07A79C   |
    EOR #$FFFF          ; $07A79E   |
    INC A               ; $07A7A1   |

CODE_07A7A2:
    CMP #$0080          ; $07A7A2   |
    BCC CODE_07A7C8     ; $07A7A5   |
    LDA $7220,x         ; $07A7A7   |
    AND #$8000          ; $07A7AA   |
    ASL A               ; $07A7AD   |
    ROL A               ; $07A7AE   |
    ASL A               ; $07A7AF   |
    TAY                 ; $07A7B0   |
    LDA $7A36,x         ; $07A7B1   |
    STA $00             ; $07A7B4   |
    LDA $7680,x         ; $07A7B6   |
    CMP ($00),y         ; $07A7B9   |
    BPL CODE_07A7C2     ; $07A7BB   |
    LDA #$0200          ; $07A7BD   |
    BRA CODE_07A7C5     ; $07A7C0   |

CODE_07A7C2:
    LDA #$FE00          ; $07A7C2   |

CODE_07A7C5:
    STA $75E0,x         ; $07A7C5   |

CODE_07A7C8:
    LDA $7682,x         ; $07A7C8   |
    SEC                 ; $07A7CB   |
    SBC #$0030          ; $07A7CC   |
    EOR $7222,x         ; $07A7CF   |
    BMI CODE_07A7D9     ; $07A7D2   |
    LDA #$0010          ; $07A7D4   |
    BRA CODE_07A7DC     ; $07A7D7   |

CODE_07A7D9:
    LDA #$0008          ; $07A7D9   |

CODE_07A7DC:
    STA $7542,x         ; $07A7DC   |
    LDA $7222,x         ; $07A7DF   |
    BPL CODE_07A7E8     ; $07A7E2   |
    EOR #$FFFF          ; $07A7E4   |
    INC A               ; $07A7E7   |

CODE_07A7E8:
    CMP #$0100          ; $07A7E8   |
    BCC CODE_07A800     ; $07A7EB   |
    LDA $7682,x         ; $07A7ED   |
    CMP #$0030          ; $07A7F0   |
    BPL CODE_07A7FA     ; $07A7F3   |
    LDA #$0200          ; $07A7F5   |
    BRA CODE_07A7FD     ; $07A7F8   |

CODE_07A7FA:
    LDA #$FE00          ; $07A7FA   |

CODE_07A7FD:
    STA $75E2,x         ; $07A7FD   |

CODE_07A800:
    LDA $14             ; $07A800   |
    AND #$0007          ; $07A802   |
    BNE CODE_07A83C     ; $07A805   |
    LDA #$01F8          ; $07A807   |
    JSL $008B21         ; $07A80A   |
    LDA #$0002          ; $07A80E   |
    STA $73C2,y         ; $07A811   |
    LDA #$0008          ; $07A814   |
    STA $7782,y         ; $07A817   |
    LDA $7CD6,x         ; $07A81A   |
    SEC                 ; $07A81D   |
    SBC #$0008          ; $07A81E   |
    SEC                 ; $07A821   |
    SBC $72C0,x         ; $07A822   |
    STA $70A2,y         ; $07A825   |
    LDA $10             ; $07A828   |
    AND #$0007          ; $07A82A   |
    CLC                 ; $07A82D   |
    ADC $7CD8,x         ; $07A82E   |
    SEC                 ; $07A831   |
    SBC #$0008          ; $07A832   |
    SEC                 ; $07A835   |
    SBC $72C2,x         ; $07A836   |
    STA $7142,y         ; $07A839   |

CODE_07A83C:
    LDA $16,x           ; $07A83C   |
    TAX                 ; $07A83E   |
    JSR ($A847,x)       ; $07A83F   |

    JSL $03A5B7         ; $07A842   |
    RTL                 ; $07A846   |

DATA_07A847:         dw $A869
DATA_07A849:         dw $A869
DATA_07A84B:         dw $A8E6

CODE_07A84D:
    LDA $10             ; $07A84D   |
    AND #$007F          ; $07A84F   |
    CLC                 ; $07A852   |
    ADC #$0080          ; $07A853   |
    STA $7A96,x         ; $07A856   |
    STZ $7402,x         ; $07A859   |
    STZ $16,x           ; $07A85C   |
    LDA #$0003          ; $07A85E   |
    STA $76,x           ; $07A861   |
    LDA #$A896          ; $07A863   |
    STA $78,x           ; $07A866   |
    RTS                 ; $07A868   |

    LDX $12             ; $07A869   |
    LDA $7A96,x         ; $07A86B   |
    BNE CODE_07A881     ; $07A86E   |
    LDA $7680,x         ; $07A870   |
    ORA $7682,x         ; $07A873   |
    AND #$FF00          ; $07A876   |
    BEQ CODE_07A88F     ; $07A879   |
    LDA #$0050          ; $07A87B   |
    STA $7A96,x         ; $07A87E   |

CODE_07A881:
    AND $76,x           ; $07A881   |
    BNE CODE_07A88E     ; $07A883   |
    LDA $7402,x         ; $07A885   |
    EOR #$0001          ; $07A888   |
    STA $7402,x         ; $07A88B   |

CODE_07A88E:
    RTS                 ; $07A88E   |

CODE_07A88F:
    LDA $78,x           ; $07A88F   |
    STA $00             ; $07A891   |
    JMP ($7960)         ; $07A893   |

    LDA #$0050          ; $07A896   |
    STA $7A96,x         ; $07A899   |
    LDA #$0002          ; $07A89C   |
    STA $7402,x         ; $07A89F   |
    LDA #$0002          ; $07A8A2   |
    STA $16,x           ; $07A8A5   |
    LDA #$0007          ; $07A8A7   |
    STA $76,x           ; $07A8AA   |
    LDA #$A8CC          ; $07A8AC   |
    STA $78,x           ; $07A8AF   |
    RTS                 ; $07A8B1   |

DATA_07A8B2:         db $0C, $02, $02, $02, $02, $02, $02, $02
DATA_07A8BA:         db $02, $06, $10, $40, $20

DATA_07A8BF:         db $04, $05, $06, $07, $08, $09, $0A, $0B
DATA_07A8C7:         db $0A, $0C, $0A, $0D, $0E

    STZ $76,x           ; $07A8CC   |
    LDA $A8B2           ; $07A8CE   |
    AND #$00FF          ; $07A8D1   |
    STA $7A96,x         ; $07A8D4   |
    LDA $A8BF           ; $07A8D7   |
    AND #$00FF          ; $07A8DA   |
    STA $7402,x         ; $07A8DD   |
    LDA #$0004          ; $07A8E0   |
    STA $16,x           ; $07A8E3   |
    RTS                 ; $07A8E5   |

    LDX $12             ; $07A8E6   |
    LDA $7680,x         ; $07A8E8   |
    ORA $7682,x         ; $07A8EB   |
    AND #$FF00          ; $07A8EE   |
    BNE CODE_07A903     ; $07A8F1   |
    LDA $7A96,x         ; $07A8F3   |
    BEQ CODE_07A8FB     ; $07A8F6   |
    JMP CODE_07A928     ; $07A8F8   |

CODE_07A8FB:
    LDA $76,x           ; $07A8FB   |
    INC A               ; $07A8FD   |
    CMP #$000D          ; $07A8FE   |
    BCC CODE_07A906     ; $07A901   |

CODE_07A903:
    JMP CODE_07A84D     ; $07A903   |

CODE_07A906:
    STA $76,x           ; $07A906   |
    TAY                 ; $07A908   |
    LDA $A8B2,y         ; $07A909   |
    AND #$00FF          ; $07A90C   |
    STA $7A96,x         ; $07A90F   |
    LDA $A8BF,y         ; $07A912   |
    AND #$00FF          ; $07A915   |
    STA $7402,x         ; $07A918   |
    CPY #$0C            ; $07A91B   |
    BNE CODE_07A928     ; $07A91D   |
    JSL $0EB148         ; $07A91F   |
    JSR CODE_07AA8D     ; $07A923   |
    BRA CODE_07A944     ; $07A926   |

CODE_07A928:
    LDA $76,x           ; $07A928   |
    CMP #$000B          ; $07A92A   |
    BCC CODE_07A944     ; $07A92D   |
    CMP #$000C          ; $07A92F   |
    BCS CODE_07A944     ; $07A932   |
    JSL $0EB14D         ; $07A934   |
    STZ $7540,x         ; $07A938   |
    STZ $7542,x         ; $07A93B   |
    STZ $7220,x         ; $07A93E   |
    STZ $7222,x         ; $07A941   |

CODE_07A944:
    RTS                 ; $07A944   |

CODE_07A945:
    LDA $7CD6,x         ; $07A945   |
    STA $00             ; $07A948   |
    LDA $7CD8,x         ; $07A94A   |
    STA $02             ; $07A94D   |
    LDA #$01E6          ; $07A94F   |
    JSL $03B56E         ; $07A952   |
    STZ $7222,x         ; $07A956   |
    STZ $7540,x         ; $07A959   |
    STZ $75E0,x         ; $07A95C   |
    LDA #$0040          ; $07A95F   |
    STA $7542,x         ; $07A962   |
    LDA #$0400          ; $07A965   |
    STA $75E2,x         ; $07A968   |
    LDA #$000F          ; $07A96B   |
    STA $7402,x         ; $07A96E   |
    LDA #$000E          ; $07A971   |
    STA $6F00,x         ; $07A974   |
    LDA #$0280          ; $07A977   |
    STA $7AF8,x         ; $07A97A   |
    RTL                 ; $07A97D   |

DATA_07A97E:         dw $0010, $0018, $0010, $0018
DATA_07A986:         dw $0000, $0008, $0000, $0008
DATA_07A98E:         dw $0000, $0008, $0000, $0008
DATA_07A996:         dw $0000, $0008, $0008, $0010
DATA_07A99E:         dw $0008, $0010, $0010, $0018
DATA_07A9A6:         dw $0010, $0018, $0010, $0018
DATA_07A9AE:         dw $0010, $0018, $0010, $0018
DATA_07A9B6:         dw $0010, $0018, $0008, $000A
DATA_07A9BE:         dw $0000, $0200, $0400, $0800

CODE_07A9C6:
    LDY $74A2,x         ; $07A9C6   |
    BMI CODE_07AA36     ; $07A9C9   |
    REP #$10            ; $07A9CB   |
    LDA $7402,x         ; $07A9CD   |
    CMP #$000F          ; $07A9D0   |
    BEQ CODE_07AA16     ; $07A9D3   |
    ASL A               ; $07A9D5   |
    ASL A               ; $07A9D6   |
    TAY                 ; $07A9D7   |
    LDA $A97E,y         ; $07A9D8   |
    STA $00             ; $07A9DB   |
    LDA $A980,y         ; $07A9DD   |
    STA $02             ; $07A9E0   |
    LDA $14             ; $07A9E2   |
    AND #$0008          ; $07A9E4   |
    LSR A               ; $07A9E7   |
    LSR A               ; $07A9E8   |
    TAY                 ; $07A9E9   |
    LDA $A9BA,y         ; $07A9EA   |
    STA $04             ; $07A9ED   |
    LDA $7362,x         ; $07A9EF   |
    CLC                 ; $07A9F2   |
    ADC $00             ; $07A9F3   |
    TAY                 ; $07A9F5   |
    LDA $6004,y         ; $07A9F6   |
    AND #$FFF0          ; $07A9F9   |
    ORA $04             ; $07A9FC   |
    STA $6004,y         ; $07A9FE   |
    LDA $7362,x         ; $07AA01   |
    CLC                 ; $07AA04   |
    ADC $02             ; $07AA05   |
    TAY                 ; $07AA07   |
    LDA $6004,y         ; $07AA08   |
    AND #$FFF0          ; $07AA0B   |
    ORA $04             ; $07AA0E   |
    STA $6004,y         ; $07AA10   |
    LDA $7402,x         ; $07AA13   |

CODE_07AA16:
    CMP #$000D          ; $07AA16   |
    BNE CODE_07AA34     ; $07AA19   |
    LDA $14             ; $07AA1B   |
    AND #$0006          ; $07AA1D   |
    TAY                 ; $07AA20   |
    LDA $A9BE,y         ; $07AA21   |
    STA $00             ; $07AA24   |
    LDY $7362,x         ; $07AA26   |
    LDA $6004,y         ; $07AA29   |
    AND #$F1FF          ; $07AA2C   |
    ORA $00             ; $07AA2F   |
    STA $6004,y         ; $07AA31   |

CODE_07AA34:
    SEP #$10            ; $07AA34   |

CODE_07AA36:
    RTS                 ; $07AA36   |

CODE_07AA37:
    LDY $7D36,x         ; $07AA37   |
    BMI CODE_07AA5A     ; $07AA3A   |
    DEY                 ; $07AA3C   |
    BEQ CODE_07AA59     ; $07AA3D   |
    BMI CODE_07AA59     ; $07AA3F   |
    LDA $6F00,y         ; $07AA41   |
    CMP #$0010          ; $07AA44   |
    BNE CODE_07AA59     ; $07AA47   |
    LDA $7D38,y         ; $07AA49   |
    BEQ CODE_07AA59     ; $07AA4C   |
    TYX                 ; $07AA4E   |
    JSL $03B24B         ; $07AA4F   |
    LDX $12             ; $07AA53   |
    PLA                 ; $07AA55   |
    JMP CODE_07A945     ; $07AA56   |

CODE_07AA59:
    RTS                 ; $07AA59   |

CODE_07AA5A:
    JSL $07FC2F         ; $07AA5A   |
    BCS CODE_07AA67     ; $07AA5E   |
    BEQ CODE_07AA66     ; $07AA60   |
    JSL $03A858         ; $07AA62   |

CODE_07AA66:
    RTS                 ; $07AA66   |

CODE_07AA67:
    LDA #$011C          ; $07AA67   |
    JSL $03A34C         ; $07AA6A   |
    BCC CODE_07AA81     ; $07AA6E   |
    LDA $70E2,x         ; $07AA70   |
    STA $70E2,y         ; $07AA73   |
    LDA $7182,x         ; $07AA76   |
    STA $7182,y         ; $07AA79   |
    TXA                 ; $07AA7C   |
    INC A               ; $07AA7D   |
    STA $7976,y         ; $07AA7E   |

CODE_07AA81:
    JSL $03B20B         ; $07AA81   |
    PLA                 ; $07AA85   |
    JMP CODE_07A945     ; $07AA86   |

DATA_07AA89:         dw $FFF0, $0000

CODE_07AA8D:
    LDA $611C           ; $07AA8D   |
    STA $3002           ; $07AA90   |
    LDA $611E           ; $07AA93   |
    STA $3004           ; $07AA96   |
    LDY $7400,x         ; $07AA99   |
    LDA $7CD6,x         ; $07AA9C   |
    CLC                 ; $07AA9F   |
    ADC $AA89,y         ; $07AAA0   |
    STA $00             ; $07AAA3   |
    STA $3006           ; $07AAA5   |
    LDA $7CD8,x         ; $07AAA8   |
    STA $3008           ; $07AAAB   |
    LDA #$0200          ; $07AAAE   |
    STA $300C           ; $07AAB1   |
    LDX #$09            ; $07AAB4   |
    LDA #$907C          ; $07AAB6   |
    JSL $7EDE44         ; $07AAB9   | GSU init
    LDX $12             ; $07AABD   |
    LDA #$011D          ; $07AABF   |
    JSL $03A34C         ; $07AAC2   |
    BCC CODE_07AAE3     ; $07AAC6   |
    LDA $3002           ; $07AAC8   |
    STA $7220,y         ; $07AACB   |
    LDA $3004           ; $07AACE   |
    STA $7222,y         ; $07AAD1   |
    LDA $00             ; $07AAD4   |
    STA $70E2,y         ; $07AAD6   |
    LDA $7182,x         ; $07AAD9   |
    SEC                 ; $07AADC   |
    SBC #$0008          ; $07AADD   |
    STA $7182,y         ; $07AAE0   |

CODE_07AAE3:
    RTS                 ; $07AAE3   |

DATA_07AAE4:         dw $FFC0, $0140

DATA_07AAE8:         dw $FFC0, $0140

    LDA $7682,x         ; $07AAEC   |
    AND #$FF00          ; $07AAEF   |
    BEQ CODE_07AB48     ; $07AAF2   |
    BMI CODE_07AB48     ; $07AAF4   |
    LDA #$FFFF          ; $07AAF6   |
    STA $74A2,x         ; $07AAF9   |
    STZ $7542,x         ; $07AAFC   |
    STZ $7222,x         ; $07AAFF   |
    LDA $7AF8,x         ; $07AB02   |
    BNE CODE_07AB48     ; $07AB05   |
    LDA #$0005          ; $07AB07   |
    STA $74A2,x         ; $07AB0A   |
    LDA #$0200          ; $07AB0D   |
    STA $75E0,x         ; $07AB10   |
    LDA #$0200          ; $07AB13   |
    STA $75E2,x         ; $07AB16   |
    LDA #$0008          ; $07AB19   |
    STA $7540,x         ; $07AB1C   |
    LDA #$0008          ; $07AB1F   |
    STA $7542,x         ; $07AB22   |
    JSR CODE_07A84D     ; $07AB25   |
    LDY $0073           ; $07AB28   |
    LDA $0039           ; $07AB2B   |
    CLC                 ; $07AB2E   |
    ADC $AAE4,y         ; $07AB2F   |
    STA $70E2,x         ; $07AB32   |
    LDY $0075           ; $07AB35   |
    LDA $003B           ; $07AB38   |
    CLC                 ; $07AB3B   |
    ADC $AAE8,y         ; $07AB3C   |
    STA $7182,x         ; $07AB3F   |
    LDA #$0010          ; $07AB42   |
    STA $6F00,x         ; $07AB45   |

CODE_07AB48:
    RTL                 ; $07AB48   |

DATA_07AB49:         dw $FFD0, $0030

DATA_07AB4D:         dw $FE00, $0200

.init_lava_drop_horizontal
    LDA $70E2,x         ; $07AB51   |
    CLC                 ; $07AB54   |
    ADC $AB49           ; $07AB55   |
    STA $18,x           ; $07AB58   |
    LDA $70E2,x         ; $07AB5A   |
    CLC                 ; $07AB5D   |
    ADC $AB4B           ; $07AB5E   |
    STA $76,x           ; $07AB61   |
    LDA #$0004          ; $07AB63   |
    STA $7540,x         ; $07AB66   |
    LDA $70E2,x         ; $07AB69   |
    AND #$0010          ; $07AB6C   |
    LSR A               ; $07AB6F   |
    LSR A               ; $07AB70   |
    LSR A               ; $07AB71   |
    EOR #$0002          ; $07AB72   |
    STA $7400,x         ; $07AB75   |
    TAY                 ; $07AB78   |
    LDA $AB4D,y         ; $07AB79   |
    STA $7220,x         ; $07AB7C   |
    LDA $70E2,x         ; $07AB7F   |
    SEC                 ; $07AB82   |
    SBC $AB49,y         ; $07AB83   |
    STA $70E2,x         ; $07AB86   |
    LDA #$0003          ; $07AB89   |
    STA $7A96,x         ; $07AB8C   |
    RTL                 ; $07AB8F   |

DATA_07AB90:         db $00, $09, $08, $07, $06, $05, $04, $00

DATA_07AB98:         dw $0008, $FFF8

.main_lava_drop_horizontal
    JSL $03AF23         ; $07AB9C   |
    LDA $7220,x         ; $07ABA0   |
    BEQ CODE_07AC1C     ; $07ABA3   |
    LDA $18,x           ; $07ABA5   |
    CMP $70E2,x         ; $07ABA7   |
    BCS CODE_07AC05     ; $07ABAA   |
    LDA $76,x           ; $07ABAC   |
    CMP $70E2,x         ; $07ABAE   |
    BCC CODE_07AC05     ; $07ABB1   |
    LDA $7A96,x         ; $07ABB3   |
    BNE CODE_07ABC8     ; $07ABB6   |
    LDA #$0003          ; $07ABB8   |
    STA $7A96,x         ; $07ABBB   |
    LDA $7402,x         ; $07ABBE   |
    INC A               ; $07ABC1   |
    AND #$0003          ; $07ABC2   |
    STA $7402,x         ; $07ABC5   |

CODE_07ABC8:
    LDA $14             ; $07ABC8   |
    AND #$0007          ; $07ABCA   |
    BNE CODE_07AC03     ; $07ABCD   |
    LDY $7400,x         ; $07ABCF   |
    LDA $70E2,x         ; $07ABD2   |
    CLC                 ; $07ABD5   |
    ADC $AB98,y         ; $07ABD6   |
    STA $00             ; $07ABD9   |
    LDA #$01FA          ; $07ABDB   |
    JSL $008B21         ; $07ABDE   |
    LDA $10             ; $07ABE2   |
    AND #$0006          ; $07ABE4   |
    SEC                 ; $07ABE7   |
    SBC #$0002          ; $07ABE8   |
    CLC                 ; $07ABEB   |
    ADC $7182,x         ; $07ABEC   |
    STA $7142,y         ; $07ABEF   |
    LDA $00             ; $07ABF2   |
    STA $70A2,y         ; $07ABF4   |
    LDA #$0006          ; $07ABF7   |
    STA $7782,y         ; $07ABFA   |
    LDA #$0003          ; $07ABFD   |
    STA $73C2,y         ; $07AC00   |

CODE_07AC03:
    BRA CODE_07AC19     ; $07AC03   |

CODE_07AC05:
    STA $70E2,x         ; $07AC05   |
    STZ $7220,x         ; $07AC08   |
    STZ $7540,x         ; $07AC0B   |
    LDA #$0007          ; $07AC0E   |
    STA $78,x           ; $07AC11   |
    LDA #$0004          ; $07AC13   |
    STA $7A96,x         ; $07AC16   |

CODE_07AC19:
    JMP CODE_07FC4B     ; $07AC19   |

CODE_07AC1C:
    LDA $7A96,x         ; $07AC1C   |
    BNE CODE_07AC19     ; $07AC1F   |
    LDA #$0004          ; $07AC21   |
    STA $7A96,x         ; $07AC24   |
    LDA $78,x           ; $07AC27   |
    DEC A               ; $07AC29   |
    BMI CODE_07AC47     ; $07AC2A   |
    STA $78,x           ; $07AC2C   |
    TAY                 ; $07AC2E   |
    LDA $AB90,y         ; $07AC2F   |
    AND #$00FF          ; $07AC32   |
    STA $7402,x         ; $07AC35   |
    CPY #$00            ; $07AC38   |
    BNE CODE_07AC19     ; $07AC3A   |
    LDA $7400,x         ; $07AC3C   |
    EOR #$0002          ; $07AC3F   |
    STA $7400,x         ; $07AC42   |
    BRA CODE_07AC19     ; $07AC45   |

CODE_07AC47:
    LDA $7400,x         ; $07AC47   |
    TAY                 ; $07AC4A   |
    LDA $AB4D,y         ; $07AC4B   |
    STA $7220,x         ; $07AC4E   |
    LDA #$0004          ; $07AC51   |
    STA $7540,x         ; $07AC54   |
    LDA #$0003          ; $07AC57   |
    STA $7A96,x         ; $07AC5A   |
    BRA CODE_07AC19     ; $07AC5D   |

.init_lava_drop_vertical
    LDA $7182,x         ; $07AC5F   |
    CLC                 ; $07AC62   |
    ADC $AB49           ; $07AC63   |
    STA $18,x           ; $07AC66   |
    LDA $7182,x         ; $07AC68   |
    CLC                 ; $07AC6B   |
    ADC $AB4B           ; $07AC6C   |
    STA $76,x           ; $07AC6F   |
    LDA #$0004          ; $07AC71   |
    STA $7542,x         ; $07AC74   |
    LDA $70E2,x         ; $07AC77   |
    AND #$0010          ; $07AC7A   |
    LSR A               ; $07AC7D   |
    LSR A               ; $07AC7E   |
    LSR A               ; $07AC7F   |
    EOR #$0002          ; $07AC80   |
    STA $7976,x         ; $07AC83   |
    TAY                 ; $07AC86   |
    LDA $AB4D,y         ; $07AC87   |
    STA $7222,x         ; $07AC8A   |
    LDA $7182,x         ; $07AC8D   |
    SEC                 ; $07AC90   |
    SBC $AB49,y         ; $07AC91   |
    STA $7182,x         ; $07AC94   |
    LDA $ACCA,y         ; $07AC97   |
    STA $00             ; $07AC9A   |
    LDY $78,x           ; $07AC9C   |
    LDA ($00),y         ; $07AC9E   |
    AND #$00FF          ; $07ACA0   |
    STA $7402,x         ; $07ACA3   |
    LDA #$0003          ; $07ACA6   |
    STA $7A96,x         ; $07ACA9   |
    LDA #$0003          ; $07ACAC   |
    STA $78,x           ; $07ACAF   |
    RTL                 ; $07ACB1   |

DATA_07ACB2:         db $00, $01, $02, $03

DATA_07ACB6:         db $0A, $0B, $0C, $0D

DATA_07ACBA:         db $0D, $09, $08, $07, $06, $05, $04, $00

DATA_07ACC2:         db $03, $13, $12, $11, $10, $0F, $0E, $0A

DATA_07ACCA:         dw $ACB2
DATA_07ACCC:         dw $ACB6
DATA_07ACCE:         dw $ACBA
DATA_07ACD0:         dw $ACC2

.main_lava_drop_vertical
    JSL $03AF23         ; $07ACD2   |
    LDA $7222,x         ; $07ACD6   |
    BNE CODE_07ACDE     ; $07ACD9   |
    JMP CODE_07AD75     ; $07ACDB   |

CODE_07ACDE:
    LDA $18,x           ; $07ACDE   |
    CMP $7182,x         ; $07ACE0   |
    BCS CODE_07AD4D     ; $07ACE3   |
    LDA $76,x           ; $07ACE5   |
    CMP $7182,x         ; $07ACE7   |
    BCC CODE_07AD4D     ; $07ACEA   |
    LDA $7A96,x         ; $07ACEC   |
    BNE CODE_07AD11     ; $07ACEF   |
    LDA #$0003          ; $07ACF1   |
    STA $7A96,x         ; $07ACF4   |
    LDY $16,x           ; $07ACF7   |
    LDA $ACCA,y         ; $07ACF9   |
    STA $00             ; $07ACFC   |
    DEC $78,x           ; $07ACFE   |
    BPL CODE_07AD07     ; $07AD00   |
    LDA #$0003          ; $07AD02   |
    STA $78,x           ; $07AD05   |

CODE_07AD07:
    LDY $78,x           ; $07AD07   |
    LDA ($00),y         ; $07AD09   |
    AND #$00FF          ; $07AD0B   |
    STA $7402,x         ; $07AD0E   |

CODE_07AD11:
    LDA $14             ; $07AD11   |
    AND #$0007          ; $07AD13   |
    BNE CODE_07AD4B     ; $07AD16   |
    LDY $16,x           ; $07AD18   |
    LDA $7182,x         ; $07AD1A   |
    CLC                 ; $07AD1D   |
    ADC $AB98,y         ; $07AD1E   |
    STA $00             ; $07AD21   |
    LDA #$01FB          ; $07AD23   |
    JSL $008B21         ; $07AD26   |
    LDA $10             ; $07AD2A   |
    AND #$0006          ; $07AD2C   |
    SEC                 ; $07AD2F   |
    SBC #$0002          ; $07AD30   |
    CLC                 ; $07AD33   |
    ADC $70E2,x         ; $07AD34   |
    STA $70A2,y         ; $07AD37   |
    LDA $00             ; $07AD3A   |
    STA $7142,y         ; $07AD3C   |
    LDA #$0006          ; $07AD3F   |
    STA $7782,y         ; $07AD42   |
    LDA #$0003          ; $07AD45   |
    STA $73C2,y         ; $07AD48   |

CODE_07AD4B:
    BRA CODE_07AD72     ; $07AD4B   |

CODE_07AD4D:
    STA $7182,x         ; $07AD4D   |
    STZ $7222,x         ; $07AD50   |
    STZ $7542,x         ; $07AD53   |
    LDA #$0007          ; $07AD56   |
    STA $78,x           ; $07AD59   |
    LDA #$0004          ; $07AD5B   |
    STA $7A96,x         ; $07AD5E   |
    LDY $16,x           ; $07AD61   |
    LDA $ACCE,y         ; $07AD63   |
    STA $00             ; $07AD66   |
    LDY $78,x           ; $07AD68   |
    LDA ($00),y         ; $07AD6A   |
    AND #$00FF          ; $07AD6C   |
    STA $7402,x         ; $07AD6F   |

CODE_07AD72:
    JMP CODE_07FC4B     ; $07AD72   |

CODE_07AD75:
    LDY $16,x           ; $07AD75   |
    LDA $ACCE,y         ; $07AD77   |
    STA $00             ; $07AD7A   |
    LDA $7A96,x         ; $07AD7C   |
    BNE CODE_07AD72     ; $07AD7F   |
    DEC $78,x           ; $07AD81   |
    BMI CODE_07AD97     ; $07AD83   |
    LDY $78,x           ; $07AD85   |
    LDA ($00),y         ; $07AD87   |
    AND #$00FF          ; $07AD89   |
    STA $7402,x         ; $07AD8C   |
    LDA #$0004          ; $07AD8F   |
    STA $7A96,x         ; $07AD92   |
    BRA CODE_07AD72     ; $07AD95   |

CODE_07AD97:
    LDA #$0004          ; $07AD97   |
    STA $7542,x         ; $07AD9A   |
    LDA #$0003          ; $07AD9D   |
    STA $7A96,x         ; $07ADA0   |
    LDA #$0003          ; $07ADA3   |
    STA $78,x           ; $07ADA6   |
    LDA $16,x           ; $07ADA8   |
    EOR #$0002          ; $07ADAA   |
    STA $16,x           ; $07ADAD   |
    TAY                 ; $07ADAF   |
    LDA $AB4D,y         ; $07ADB0   |
    STA $7222,x         ; $07ADB3   |
    LDA $ACCA,y         ; $07ADB6   |
    STA $00             ; $07ADB9   |
    LDY $78,x           ; $07ADBB   |
    LDA ($00),y         ; $07ADBD   |
    AND #$00FF          ; $07ADBF   |
    STA $7402,x         ; $07ADC2   |
    BRA CODE_07AD72     ; $07ADC5   |

    LDY #$FF            ; $07ADC7   |
    RTS                 ; $07ADC9   |

DATA_07ADCA:         dw $0000, $00FF

DATA_07ADCE:         dw $2A01, $2B00

DATA_07ADD2:         db $00, $02, $00, $00, $00

.init_fat_guy                                ; red and green
    LDA $7902,x         ; $07ADD7   |
    BNE CODE_07AE0C     ; $07ADDA   |
    LDA #$002A          ; $07ADDC   |
    STA $3008           ; $07ADDF   |
    LDA #$002C          ; $07ADE2   |
    STA $300A           ; $07ADE5   |
    LDX #$09            ; $07ADE8   |
    LDA #$91DB          ; $07ADEA   |
    JSL $7EDE44         ; $07ADED   | GSU init
    LDX $12             ; $07ADF1   |
    LDA $300C           ; $07ADF3   |
    CMP #$0003          ; $07ADF6   |
    BCC CODE_07ADFF     ; $07ADF9   |
    JMP CODE_0703A3     ; $07ADFB   |

CODE_07ADFF:
    LDA $70E2,x         ; $07ADFF   |
    AND #$0010          ; $07AE02   |
    LSR A               ; $07AE05   |
    LSR A               ; $07AE06   |
    LSR A               ; $07AE07   |
    INC A               ; $07AE08   |
    STA $7902,x         ; $07AE09   |

CODE_07AE0C:
    TAY                 ; $07AE0C   |
    DEY                 ; $07AE0D   |
    LDA $7042,x         ; $07AE0E   |
    ORA $ADD3,y         ; $07AE11   |
    STA $7042,x         ; $07AE14   |
    LDA $ADCF,y         ; $07AE17   |
    STA $78,x           ; $07AE1A   |
    TYX                 ; $07AE1C   |
    JMP ($AE20,x)       ; $07AE1D   |

DATA_07AE20:         dw $AE24
DATA_07AE22:         dw $AE46

    LDX $12             ; $07AE24   |
    LDY $7400,x         ; $07AE26   |
    LDA $ADC7,y         ; $07AE29   |
    STA $7220,x         ; $07AE2C   |
    LDA #$0000          ; $07AE2F   |
    STA $16,x           ; $07AE32   |
    LDA #$0003          ; $07AE34   |
    STA $7A96,x         ; $07AE37   |
    LDA $AE7A           ; $07AE3A   |
    AND #$00FF          ; $07AE3D   |
    STA $7402,x         ; $07AE40   |
    STZ $18,x           ; $07AE43   |
    RTL                 ; $07AE45   |

    LDX $12             ; $07AE46   |
    LDY $7400,x         ; $07AE48   |
    LDA $ADCB,y         ; $07AE4B   |
    STA $7220,x         ; $07AE4E   |
    LDA #$0002          ; $07AE51   |
    STA $16,x           ; $07AE54   |
    LDA #$0002          ; $07AE56   |
    STA $7A96,x         ; $07AE59   |
    LDA $AEAD           ; $07AE5C   |
    AND #$00FF          ; $07AE5F   |
    STA $7402,x         ; $07AE62   |
    STZ $18,x           ; $07AE65   |
    RTL                 ; $07AE67   |

.main_fat_guy                                ; red and green
    JSL $03AF23         ; $07AE68   |
    LDA $16,x           ; $07AE6C   |
    TAX                 ; $07AE6E   |
    JMP ($AE72,x)       ; $07AE6F   |

DATA_07AE72:         dw $AE86
DATA_07AE74:         dw $AEAF
DATA_07AE76:         dw $AED8
DATA_07AE78:         dw $AF0E

DATA_07AE7A:         db $04, $05, $06, $07, $08, $09, $0A, $0B
DATA_07AE82:         db $0C, $0D, $0E, $0F

    LDX $12             ; $07AE86   |
    LDA $7A96,x         ; $07AE88   |
    BNE CODE_07AEAA     ; $07AE8B   |
    LDA #$0003          ; $07AE8D   |
    STA $7A96,x         ; $07AE90   |
    LDA $18,x           ; $07AE93   |
    INC A               ; $07AE95   |
    CMP #$000C          ; $07AE96   |
    BCC CODE_07AE9E     ; $07AE99   |
    LDA #$0000          ; $07AE9B   |

CODE_07AE9E:
    STA $18,x           ; $07AE9E   |
    TAY                 ; $07AEA0   |
    LDA $AE7A,y         ; $07AEA1   |
    AND #$00FF          ; $07AEA4   |
    STA $7402,x         ; $07AEA7   |

CODE_07AEAA:
    JMP CODE_07AF4A     ; $07AEAA   |

    BPL CODE_07AEC0     ; $07AEAD   |
    LDX $12             ; $07AEAF   |
    LDA $7A96,x         ; $07AEB1   |
    BNE CODE_07AECD     ; $07AEB4   |
    LDA #$0002          ; $07AEB6   |
    STA $7A96,x         ; $07AEB9   |
    LDA $18,x           ; $07AEBC   |
    EOR #$0001          ; $07AEBE   |
    STA $18,x           ; $07AEC1   |
    TAY                 ; $07AEC3   |
    LDA $AEAD,y         ; $07AEC4   |
    AND #$00FF          ; $07AEC7   |
    STA $7402,x         ; $07AECA   |

CODE_07AECD:
    JMP CODE_07AF4A     ; $07AECD   |

DATA_07AED0:         dw $0213, $0001

DATA_07AED4:         dw $0304, $0202

    LDX $12             ; $07AED8   |
    LDA $7A96,x         ; $07AEDA   |
    BNE CODE_07AEF5     ; $07AEDD   |
    DEC $18,x           ; $07AEDF   |
    BMI CODE_07AEF8     ; $07AEE1   |
    SEP #$20            ; $07AEE3   |
    LDY $18,x           ; $07AEE5   |
    LDA $AED0,y         ; $07AEE7   |
    STA $7402,x         ; $07AEEA   |
    LDA $AED4,y         ; $07AEED   |
    STA $7A96,x         ; $07AEF0   |
    REP #$20            ; $07AEF3   |

CODE_07AEF5:
    JMP CODE_07AF4A     ; $07AEF5   |

CODE_07AEF8:
    BRA CODE_07AF24     ; $07AEF8   |

DATA_07AEFA:         db $00, $01, $02, $01, $00, $15, $16, $17

DATA_07AF02:         db $03, $03, $05, $03, $02, $04, $05, $0F

DATA_07AF0A:         dw $0100, $FF00

    LDX $12             ; $07AF0E   |
    LDA $7860,x         ; $07AF10   |
    AND #$0001          ; $07AF13   |
    BEQ CODE_07AF1B     ; $07AF16   |
    STZ $7220,x         ; $07AF18   |

CODE_07AF1B:
    LDA $7A96,x         ; $07AF1B   |
    BNE CODE_07AF4A     ; $07AF1E   |
    DEC $18,x           ; $07AF20   |
    BPL CODE_07AF36     ; $07AF22   |

CODE_07AF24:
    LDA $77C2,x         ; $07AF24   |
    AND #$00FF          ; $07AF27   |
    EOR #$0002          ; $07AF2A   |
    STA $7400,x         ; $07AF2D   |
    JSL $07AE46         ; $07AF30   |
    BRA CODE_07AF4A     ; $07AF34   |

CODE_07AF36:
    LDY $18,x           ; $07AF36   |
    LDA $AEFA,y         ; $07AF38   |
    AND #$00FF          ; $07AF3B   |
    STA $7402,x         ; $07AF3E   |
    LDA $AF02,y         ; $07AF41   |
    AND #$00FF          ; $07AF44   |
    STA $7A96,x         ; $07AF47   |

CODE_07AF4A:
    LDY $7D36,x         ; $07AF4A   |
    BMI CODE_07AF90     ; $07AF4D   |
    DEY                 ; $07AF4F   |
    BMI CODE_07AF8F     ; $07AF50   |
    BEQ CODE_07AF8F     ; $07AF52   |
    LDA $6F00,y         ; $07AF54   |
    CMP #$0010          ; $07AF57   |
    BNE CODE_07AF8F     ; $07AF5A   |
    LDA $7D38,y         ; $07AF5C   |
    BEQ CODE_07AF8F     ; $07AF5F   |
    LDA $7542,y         ; $07AF61   |
    CMP #$0040          ; $07AF64   |
    BPL CODE_07AFE3     ; $07AF67   |
    PHY                 ; $07AF69   |
    JSL $03B24B         ; $07AF6A   |
    PLY                 ; $07AF6E   |
    LDA #$FE00          ; $07AF6F   |
    STA $7222,x         ; $07AF72   |
    LDA $7220,y         ; $07AF75   |
    CMP #$8000          ; $07AF78   |
    ROR A               ; $07AF7B   |
    CMP #$8000          ; $07AF7C   |
    ROR A               ; $07AF7F   |
    STA $7220,x         ; $07AF80   |
    PHY                 ; $07AF83   |
    JSL $03B53D         ; $07AF84   |
    PLX                 ; $07AF88   |
    JSL $03B24B         ; $07AF89   |
    LDX $12             ; $07AF8D   |

CODE_07AF8F:
    RTL                 ; $07AF8F   |

CODE_07AF90:
    LDA $7E04           ; $07AF90   |
    BNE CODE_07AF9D     ; $07AF93   |
    JSL $07FC2F         ; $07AF95   |
    BCS CODE_07AFA1     ; $07AF99   |
    BEQ CODE_07AF8F     ; $07AF9B   |

CODE_07AF9D:
    JMP CODE_0703A8     ; $07AF9D   |

CODE_07AFA1:
    LDA $60D4           ; $07AFA1   |
    BEQ CODE_07AFA9     ; $07AFA4   |
    JMP CODE_07B04B     ; $07AFA6   |

CODE_07AFA9:
    LDA #$0015          ; $07AFA9   |\ play sound #$0015
    JSL $0085D2         ; $07AFAC   |/
    LDA #$FC00          ; $07AFB0   |
    STA $60AA           ; $07AFB3   |
    LDA #$0008          ; $07AFB6   |
    STA $60C0           ; $07AFB9   |
    LDA #$8001          ; $07AFBC   |
    STA $60D2           ; $07AFBF   |
    STZ $7220,x         ; $07AFC2   |
    LDA #$0004          ; $07AFC5   |
    STA $16,x           ; $07AFC8   |
    LDA #$0003          ; $07AFCA   |
    STA $18,x           ; $07AFCD   |
    TAY                 ; $07AFCF   |
    LDA $AED0,y         ; $07AFD0   |
    AND #$00FF          ; $07AFD3   |
    STA $7402,x         ; $07AFD6   |
    LDA $AED4,y         ; $07AFD9   |
    AND #$00FF          ; $07AFDC   |
    STA $7A96,x         ; $07AFDF   |
    RTL                 ; $07AFE2   |

CODE_07AFE3:
    LDA $7CD6,x         ; $07AFE3   |
    SEC                 ; $07AFE6   |
    SBC $7CD6,y         ; $07AFE7   |
    EOR $7220,y         ; $07AFEA   |
    BMI CODE_07AF8F     ; $07AFED   |
    PHY                 ; $07AFEF   |
    LDA #$0015          ; $07AFF0   |\ play sound #$0015
    JSL $0085D2         ; $07AFF3   |/
    PLY                 ; $07AFF7   |
    LDX #$00            ; $07AFF8   |
    LDA $7220,y         ; $07AFFA   |
    BPL CODE_07B001     ; $07AFFD   |
    INX                 ; $07AFFF   |
    INX                 ; $07B000   |

CODE_07B001:
    LDA $AF0A,x         ; $07B001   |
    STA $00             ; $07B004   |
    LDX $12             ; $07B006   |
    LDA $00             ; $07B008   |
    STA $7220,x         ; $07B00A   |
    EOR #$FFFF          ; $07B00D   |
    INC A               ; $07B010   |
    STA $7220,y         ; $07B011   |
    LDA #$FE00          ; $07B014   |
    STA $7222,x         ; $07B017   |
    LDA $7222,y         ; $07B01A   |
    EOR #$FFFF          ; $07B01D   |
    INC A               ; $07B020   |
    STA $7222,y         ; $07B021   |
    LDA $7860,x         ; $07B024   |
    AND #$FFFE          ; $07B027   |
    STA $7860,x         ; $07B02A   |
    LDA #$0006          ; $07B02D   |
    STA $16,x           ; $07B030   |
    LDA #$0007          ; $07B032   |
    STA $18,x           ; $07B035   |
    TAY                 ; $07B037   |
    LDA $AEFA,y         ; $07B038   |
    AND #$00FF          ; $07B03B   |
    STA $7402,x         ; $07B03E   |
    LDA $AF02,y         ; $07B041   |
    AND #$00FF          ; $07B044   |
    STA $7A96,x         ; $07B047   |
    RTL                 ; $07B04A   |

CODE_07B04B:
    JSL $03A79C         ; $07B04B   |
    LDX $12             ; $07B04F   |
    RTL                 ; $07B051   |

.init_fang_dangling
    LDA #$0004          ; $07B052   |
    STA $7402,x         ; $07B055   |
    RTL                 ; $07B058   |

.main_fang_dangling
    JSR CODE_07B253     ; $07B059   |
    JSL $03AF23         ; $07B05C   |
    LDY $7A38,x         ; $07B060   |
    BEQ CODE_07B068     ; $07B063   |
    JMP CODE_07B24F     ; $07B065   |

CODE_07B068:
    JSR CODE_07B194     ; $07B068   |
    LDA $16,x           ; $07B06B   |
    TAX                 ; $07B06D   |
    JSR ($B076,x)       ; $07B06E   |

    JSL $03A5B7         ; $07B071   |
    RTL                 ; $07B075   |

DATA_07B076:         dw $B080
DATA_07B078:         dw $B0D1
DATA_07B07A:         dw $B14A

DATA_07B07C:         dw $FFFF, $0000

    LDX $12             ; $07B080   |
    LDA $7CD8,x         ; $07B082   |
    SEC                 ; $07B085   |
    SBC $611E           ; $07B086   |
    CLC                 ; $07B089   |
    ADC #$0020          ; $07B08A   |
    BPL CODE_07B0C6     ; $07B08D   |
    LDA $7CD6,x         ; $07B08F   |
    SEC                 ; $07B092   |
    SBC $611C           ; $07B093   |
    CLC                 ; $07B096   |
    ADC #$0080          ; $07B097   |
    CMP #$0100          ; $07B09A   |
    BCS CODE_07B0C6     ; $07B09D   |
    LDA #$0194          ; $07B09F   |
    STA $18,x           ; $07B0A2   |
    JSR CODE_07B177     ; $07B0A4   |
    LDA #$0000          ; $07B0A7   |
    STA $7402,x         ; $07B0AA   |
    LDY #$00            ; $07B0AD   |
    LDA $7222,x         ; $07B0AF   |
    BPL CODE_07B0B6     ; $07B0B2   |
    INY                 ; $07B0B4   |
    INY                 ; $07B0B5   |

CODE_07B0B6:
    LDA $B0CD,y         ; $07B0B6   |
    STA $7A96,x         ; $07B0B9   |
    LDA #$0040          ; $07B0BC   |
    STA $7AF6,x         ; $07B0BF   |
    INC $16,x           ; $07B0C2   |
    INC $16,x           ; $07B0C4   |

CODE_07B0C6:
    RTS                 ; $07B0C6   |

DATA_07B0C7:         db $00, $01, $02, $03, $02, $01, $03, $00
DATA_07B0CF:         db $01, $00

    LDX $12             ; $07B0D1   |
    JSR CODE_07B165     ; $07B0D3   |
    LDA $7CD8,x         ; $07B0D6   |
    SEC                 ; $07B0D9   |
    SBC $611E           ; $07B0DA   |
    CLC                 ; $07B0DD   |
    ADC #$0010          ; $07B0DE   |
    BMI CODE_07B0F5     ; $07B0E1   |
    LDA $18,x           ; $07B0E3   |
    CLC                 ; $07B0E5   |
    ADC #$0004          ; $07B0E6   |
    AND #$01FE          ; $07B0E9   |
    STA $18,x           ; $07B0EC   |
    JSR CODE_07B177     ; $07B0EE   |
    INC $16,x           ; $07B0F1   |
    INC $16,x           ; $07B0F3   |

CODE_07B0F5:
    LDA $7A96,x         ; $07B0F5   |
    BNE CODE_07B11D     ; $07B0F8   |
    LDY #$00            ; $07B0FA   |
    LDA $7222,x         ; $07B0FC   |
    BPL CODE_07B103     ; $07B0FF   |
    INY                 ; $07B101   |
    INY                 ; $07B102   |

CODE_07B103:
    LDA $B0CD,y         ; $07B103   |
    STA $7A96,x         ; $07B106   |
    LDA $78,x           ; $07B109   |
    DEC A               ; $07B10B   |
    BPL CODE_07B111     ; $07B10C   |
    LDA #$0005          ; $07B10E   |

CODE_07B111:
    STA $78,x           ; $07B111   |
    TAY                 ; $07B113   |
    LDA $B0C7,y         ; $07B114   |
    AND #$00FF          ; $07B117   |
    STA $7402,x         ; $07B11A   |

CODE_07B11D:
    LDA $7A98,x         ; $07B11D   |
    BNE CODE_07B149     ; $07B120   |
    LDA #$01FC          ; $07B122   |
    JSL $008B21         ; $07B125   |
    LDA $70E2,x         ; $07B129   |
    SEC                 ; $07B12C   |
    SBC $72C0,x         ; $07B12D   |
    STA $70A2,y         ; $07B130   |
    LDA $7182,x         ; $07B133   |
    SEC                 ; $07B136   |
    SBC $72C2,x         ; $07B137   |
    STA $7142,y         ; $07B13A   |
    LDA #$003C          ; $07B13D   |
    STA $7782,y         ; $07B140   |
    LDA #$000C          ; $07B143   |
    STA $7A98,x         ; $07B146   |

CODE_07B149:
    RTS                 ; $07B149   |

    LDX $12             ; $07B14A   |
    LDA $18,x           ; $07B14C   |
    BNE CODE_07B156     ; $07B14E   |
    LDY $76,x           ; $07B150   |

.init_fang_flying_wavily
    BNE CODE_07B162     ; $07B152   |
    INC $76,x           ; $07B154   |

CODE_07B156:
    CLC                 ; $07B156   |
    ADC #$0004          ; $07B157   |
    AND #$01FE          ; $07B15A   |
    STA $18,x           ; $07B15D   |
    JSR CODE_07B177     ; $07B15F   |

CODE_07B162:
    JMP CODE_07B0F5     ; $07B162   |

CODE_07B165:
    LDA $7AF6,x         ; $07B165   |
    BEQ CODE_07B176     ; $07B168   |
    AND #$0003          ; $07B16A   |
    BNE CODE_07B176     ; $07B16D   |
    LDA #$001B          ; $07B16F   |\ play sound #$001B
    JSL $0085D2         ; $07B172   |/

CODE_07B176:
    RTS                 ; $07B176   |

CODE_07B177:
    REP #$10            ; $07B177   |
    TXY                 ; $07B179   |
    TAX                 ; $07B17A   |
    LDA $00E9D4,x       ; $07B17B   |
    STA $7222,y         ; $07B17F   |
    LDA $00E954,x       ; $07B182   |
    LDX $7400,y         ; $07B186   |
    EOR $B07C,x         ; $07B189   |
    INC A               ; $07B18C   |
    STA $7220,y         ; $07B18D   |
    TYX                 ; $07B190   |
    SEP #$10            ; $07B191   |
    RTS                 ; $07B193   |

CODE_07B194:
    LDY $7D36,x         ; $07B194   |
    BPL CODE_07B1A5     ; $07B197   |
    JSL $07FC2F         ; $07B199   |
    BCS CODE_07B1A5     ; $07B19D   |
    BEQ CODE_07B1A5     ; $07B19F   |
    JSL $03A858         ; $07B1A1   |

CODE_07B1A5:
    RTS                 ; $07B1A5   |

DATA_07B1A6:         dw $FEA0, $0160, $0020, $FFE0

DATA_07B1AE:         dw $F800, $0800

DATA_07B1B2:         dw $FF80, $0080

    LDA $70E2,x         ; $07B1B6   |
    AND #$0010          ; $07B1B9   |
    LSR A               ; $07B1BC   |
    LSR A               ; $07B1BD   |
    LSR A               ; $07B1BE   |
    TAY                 ; $07B1BF   |
    LDA $7182,x         ; $07B1C0   |
    STA $18,x           ; $07B1C3   |
    LDA $B1A6,y         ; $07B1C5   |
    STA $7222,x         ; $07B1C8   |
    LDA $B1AE,y         ; $07B1CB   |
    STA $75E2,x         ; $07B1CE   |
    LDA #$0008          ; $07B1D1   |
    STA $7542,x         ; $07B1D4   |
    LDY $7400,x         ; $07B1D7   |
    LDA $B1B2,y         ; $07B1DA   |
    STA $7220,x         ; $07B1DD   |
    LDA #$0000          ; $07B1E0   |
    STA $7402,x         ; $07B1E3   |
    LDY #$00            ; $07B1E6   |
    LDA $7222,x         ; $07B1E8   |
    BPL CODE_07B1EF     ; $07B1EB   |
    INY                 ; $07B1ED   |
    INY                 ; $07B1EE   |

CODE_07B1EF:
    LDA $B0CD,y         ; $07B1EF   |
    STA $7A96,x         ; $07B1F2   |
    LDA #$0040          ; $07B1F5   |
    STA $7AF6,x         ; $07B1F8   |
    RTL                 ; $07B1FB   |

.main_fang_flying_wavily
    LDA $7A36,x         ; $07B1FC   |
    BEQ CODE_07B20F     ; $07B1FF   |
    LDA $6F00,x         ; $07B201   |
    CMP #$0010          ; $07B204   |
    BEQ CODE_07B20F     ; $07B207   |
    DEC $0C4A           ; $07B209   |
    STZ $7A36,x         ; $07B20C   |

CODE_07B20F:
    JSR CODE_07B253     ; $07B20F   |
    JSL $03AF23         ; $07B212   |
    JSL $07FC64         ; $07B216   |
    BCC CODE_07B22B     ; $07B21A   |
    LDA $7A36,x         ; $07B21C   |
    BEQ CODE_07B227     ; $07B21F   |
    DEC $0C4A           ; $07B221   |
    STZ $7A36,x         ; $07B224   |

CODE_07B227:
    JMP CODE_0703A3     ; $07B227   |

CODE_07B22B:
    JSR CODE_07B165     ; $07B22B   |
    LDY $7A38,x         ; $07B22E   |
    BNE CODE_07B24F     ; $07B231   |
    JSR CODE_07B194     ; $07B233   |
    LDY #$00            ; $07B236   |
    LDA $7182,x         ; $07B238   |
    CMP $18,x           ; $07B23B   |
    BPL CODE_07B241     ; $07B23D   |
    INY                 ; $07B23F   |
    INY                 ; $07B240   |

CODE_07B241:
    LDA $B1AE,y         ; $07B241   |
    STA $75E2,x         ; $07B244   |
    JSR CODE_07B0F5     ; $07B247   |
    JSL $03A5B7         ; $07B24A   |
    RTL                 ; $07B24E   |

CODE_07B24F:
    JSR CODE_07B0F5     ; $07B24F   |
    RTL                 ; $07B252   |

CODE_07B253:
    LDA $7D38,x         ; $07B253   |
    BEQ CODE_07B281     ; $07B256   |
    STZ $7D38,x         ; $07B258   |
    LDA #$0001          ; $07B25B   |
    STA $7A38,x         ; $07B25E   |
    LDA #$0040          ; $07B261   |
    STA $7542,x         ; $07B264   |
    LDA #$FF00          ; $07B267   |
    STA $75E2,x         ; $07B26A   |
    LDA #$0020          ; $07B26D   |
    STA $75E0,x         ; $07B270   |
    LDA #$0200          ; $07B273   |
    LDY $7221,x         ; $07B276   |
    BPL CODE_07B27E     ; $07B279   |
    LDA #$FE00          ; $07B27B   |

CODE_07B27E:
    STA $7220,x         ; $07B27E   |

CODE_07B281:
    RTS                 ; $07B281   |

DATA_07B282:         dw $0020, $FFE0

DATA_07B286:         dw $FF00, $0100

DATA_07B28A:         dw $0100, $FF00

.init_flopsy_fish							 ; also the randomly jumping one
    LDA $021A           ; $07B28E   |
    CMP #$0029          ; $07B291   |
    BNE CODE_07B2A0     ; $07B294   |
    LDA $7182,x         ; $07B296   |
    CLC                 ; $07B299   |
    ADC #$0004          ; $07B29A   |
    STA $7182,x         ; $07B29D   |

CODE_07B2A0:
    LDA $70E2,x         ; $07B2A0   |
    AND #$0010          ; $07B2A3   |
    LSR A               ; $07B2A6   |
    LSR A               ; $07B2A7   |
    LSR A               ; $07B2A8   |
    EOR #$0002          ; $07B2A9   |
    STA $7400,x         ; $07B2AC   |
    TAY                 ; $07B2AF   |
    LDA $70E2,x         ; $07B2B0   |
    STA $18,x           ; $07B2B3   |
    CLC                 ; $07B2B5   |
    ADC $B282,y         ; $07B2B6   |
    STA $70E2,x         ; $07B2B9   |
    LDA $B286,y         ; $07B2BC   |
    STA $7220,x         ; $07B2BF   |
    LDA #$0003          ; $07B2C2   |
    STA $76,x           ; $07B2C5   |
    TAY                 ; $07B2C7   |
    LDA $B2EB,y         ; $07B2C8   |
    AND #$00FF          ; $07B2CB   |
    STA $7402,x         ; $07B2CE   |
    LDA $B2EF,y         ; $07B2D1   |
    AND #$00FF          ; $07B2D4   |
    STA $7A96,x         ; $07B2D7   |
    LDA $7182,x         ; $07B2DA   |
    CLC                 ; $07B2DD   |
    ADC #$0004          ; $07B2DE   |
    STA $7A36,x         ; $07B2E1   |
    STA $7902,x         ; $07B2E4   |
    STZ $7900,x         ; $07B2E7   |
    RTL                 ; $07B2EA   |

DATA_07B2EB:         db $0E, $00, $01, $00

DATA_07B2EF:		 db $0A, $08, $0A, $08

.main_flopsy_fish 							 ; the non-jumping one
    LDA $6F00,x         ; $07B2F3   |
    CMP #$000C          ; $07B2F6   |
    BNE CODE_07B301     ; $07B2F9   |
    LDA #$0003          ; $07B2FB   |
    STA $7402,x         ; $07B2FE   |

CODE_07B301:
    JSL $03AF23         ; $07B301   |
    LDA $16,x           ; $07B305   |
    TAX                 ; $07B307   |
    JSR ($B330,x)       ; $07B308   |

    JSL $03A5B7         ; $07B30B   |
    RTL                 ; $07B30F   |

.main_flopsy_fish_jumping
    LDA $6F00,x         ; $07B310   |
    CMP #$000C          ; $07B313   |
    BNE CODE_07B31E     ; $07B316   |
    LDA #$0003          ; $07B318   |
    STA $7402,x         ; $07B31B   |

CODE_07B31E:
    JSL $03AF23         ; $07B31E   |
    JSR CODE_07B33E     ; $07B322   |
    LDA $16,x           ; $07B325   |
    TAX                 ; $07B327   |
    JSR ($B330,x)       ; $07B328   |

    JSL $03A5B7         ; $07B32B   |
    RTL                 ; $07B32F   |

DATA_07B330:         dw $B35F, $B3FE, $B455, $B492
DATA_07B338:         dw $B53D, $B580, $B5D6

CODE_07B33E:
    LDA $7A38,x         ; $07B33E   |
    BNE CODE_07B35E     ; $07B341   |
    LDA $10             ; $07B343   |
    AND #$003F          ; $07B345   |
    BNE CODE_07B35E     ; $07B348   |
    STZ $7220,x         ; $07B34A   |
    STZ $7540,x         ; $07B34D   |
    STZ $7222,x         ; $07B350   |
    STZ $7542,x         ; $07B353   |
    INC $7A38,x         ; $07B356   |
    LDA #$0004          ; $07B359   |
    STA $16,x           ; $07B35C   |

CODE_07B35E:
    RTS                 ; $07B35E   |

    LDX $12             ; $07B35F   |
    JSR CODE_07B645     ; $07B361   |
    LDA $70E2,x         ; $07B364   |
    SEC                 ; $07B367   |
    SBC $18,x           ; $07B368   |
    PHA                 ; $07B36A   |
    CLC                 ; $07B36B   |
    ADC #$0020          ; $07B36C   |
    CMP #$0040          ; $07B36F   |
    BCS CODE_07B3BB     ; $07B372   |
    STZ $7540,x         ; $07B374   |
    PLA                 ; $07B377   |
    CLC                 ; $07B378   |
    ADC #$0010          ; $07B379   |
    CMP #$0020          ; $07B37C   |
    BCC CODE_07B387     ; $07B37F   |
    LDA #$0004          ; $07B381   |
    STA $7540,x         ; $07B384   |

CODE_07B387:
    LDY #$00            ; $07B387   |
    LDA $70E2,x         ; $07B389   |
    CMP $18,x           ; $07B38C   |
    BCC CODE_07B392     ; $07B38E   |
    INY                 ; $07B390   |
    INY                 ; $07B391   |

CODE_07B392:
    LDA $B28A,y         ; $07B392   |
    STA $75E0,x         ; $07B395   |
    LDA $7A96,x         ; $07B398   |
    BNE CODE_07B3BA     ; $07B39B   |
    DEC $76,x           ; $07B39D   |
    BPL CODE_07B3A6     ; $07B39F   |
    LDA #$0003          ; $07B3A1   |
    STA $76,x           ; $07B3A4   |

CODE_07B3A6:
    LDY $76,x           ; $07B3A6   |
    LDA $B2EB,y         ; $07B3A8   |
    AND #$00FF          ; $07B3AB   |
    STA $7402,x         ; $07B3AE   |
    LDA $B2EF,y         ; $07B3B1   |
    AND #$00FF          ; $07B3B4   |
    STA $7A96,x         ; $07B3B7   |

CODE_07B3BA:
    RTS                 ; $07B3BA   |

CODE_07B3BB:
    PLA                 ; $07B3BB   |
    AND #$8000          ; $07B3BC   |
    ASL A               ; $07B3BF   |
    ROL A               ; $07B3C0   |
    ASL A               ; $07B3C1   |
    TAY                 ; $07B3C2   |
    LDA $18,x           ; $07B3C3   |
    CLC                 ; $07B3C5   |
    ADC $B282,y         ; $07B3C6   |
    STA $70E2,x         ; $07B3C9   |
    STZ $7220,x         ; $07B3CC   |
    STZ $7540,x         ; $07B3CF   |
    LDA #$0008          ; $07B3D2   |
    STA $7A96,x         ; $07B3D5   |
    LDA #$0004          ; $07B3D8   |
    STA $76,x           ; $07B3DB   |
    LDA #$0000          ; $07B3DD   |
    STA $7402,x         ; $07B3E0   |
    LDA $B3F0,y         ; $07B3E3   |
    STA $78,x           ; $07B3E6   |
    INC $7A38,x         ; $07B3E8   |
    INC $16,x           ; $07B3EB   |
    INC $16,x           ; $07B3ED   |
    RTS                 ; $07B3EF   |

DATA_07B3F0:         dw $B3F9, $B3F4

DATA_07B3F4:         db $00, $0E, $10, $0E, $00

DATA_07B3F9:         db $00, $01, $0F, $01, $00

    LDX $12             ; $07B3FE   |
    JSR CODE_07B645     ; $07B400   |
    LDA $7A96,x         ; $07B403   |
    BNE CODE_07B42D     ; $07B406   |
    DEC $76,x           ; $07B408   |
    BMI CODE_07B42E     ; $07B40A   |
    LDY $76,x           ; $07B40C   |
    CPY #$02            ; $07B40E   |
    BNE CODE_07B41B     ; $07B410   |
    LDA $7400,x         ; $07B412   |
    EOR #$0002          ; $07B415   |
    STA $7400,x         ; $07B418   |

CODE_07B41B:
    LDA #$0008          ; $07B41B   |
    STA $7A96,x         ; $07B41E   |
    LDA $78,x           ; $07B421   |
    STA $00             ; $07B423   |
    LDA ($00),y         ; $07B425   | table at $07B3F4 or $07B3F9
    AND #$00FF          ; $07B427   |
    STA $7402,x         ; $07B42A   |

CODE_07B42D:
    RTS                 ; $07B42D   |

CODE_07B42E:
    STZ $7A38,x         ; $07B42E   |

CODE_07B431:
    LDA #$0003          ; $07B431   |
    STA $76,x           ; $07B434   |
    TAY                 ; $07B436   |
    LDA $B2EB,y         ; $07B437   |
    AND #$00FF          ; $07B43A   |
    STA $7402,x         ; $07B43D   |
    LDA $B2EF,y         ; $07B440   |
    AND #$00FF          ; $07B443   |
    STA $7A96,x         ; $07B446   |
    LDY $7400,x         ; $07B449   |
    LDA $B286,y         ; $07B44C   |
    STA $7220,x         ; $07B44F   |
    STZ $16,x           ; $07B452   |
    RTS                 ; $07B454   |

    LDX $12             ; $07B455   |
    LDA $7A96,x         ; $07B457   |
    BNE CODE_07B46E     ; $07B45A   |
    DEC $76,x           ; $07B45C   |
    BMI CODE_07B46F     ; $07B45E   |
    LDY $76,x           ; $07B460   |
    LDA #$0002          ; $07B462   |
    STA $7A96,x         ; $07B465   |
    LDA #$0002          ; $07B468   |
    STA $7402,x         ; $07B46B   |

CODE_07B46E:
    RTS                 ; $07B46E   |

CODE_07B46F:
    LDA #$0002          ; $07B46F   |
    STA $76,x           ; $07B472   |
    TAY                 ; $07B474   |
    LDA $B48F,y         ; $07B475   |
    AND #$00FF          ; $07B478   |
    STA $7402,x         ; $07B47B   |
    LDA #$0006          ; $07B47E   |
    STA $7A96,x         ; $07B481   |
    LDA #$F900          ; $07B484   |
    STA $7222,x         ; $07B487   |
    INC $16,x           ; $07B48A   |
    INC $16,x           ; $07B48C   |
    RTS                 ; $07B48E   |

DATA_07B48F:         db $05, $04, $03

    LDX $12             ; $07B492   |
    JSR CODE_07B674     ; $07B494   |
    LDA $7222,x         ; $07B497   |
    CLC                 ; $07B49A   |
    ADC #$0100          ; $07B49B   |
    BMI CODE_07B4A3     ; $07B49E   |
    JMP CODE_07B52F     ; $07B4A0   |

CODE_07B4A3:
    LDY $7900,x         ; $07B4A3   |
    BNE CODE_07B4DD     ; $07B4A6   |
    LDA $7182,x         ; $07B4A8   |
    CMP $7A36,x         ; $07B4AB   |
    BPL CODE_07B4DD     ; $07B4AE   |
    LDA #$01FE          ; $07B4B0   |
    JSL $008B21         ; $07B4B3   |
    LDA $70E2,x         ; $07B4B7   |
    STA $70A2,y         ; $07B4BA   |
    LDA $7A36,x         ; $07B4BD   |
    SEC                 ; $07B4C0   |
    SBC #$0008          ; $07B4C1   |
    STA $7142,y         ; $07B4C4   |
    LDA #$0006          ; $07B4C7   |
    STA $73C2,y         ; $07B4CA   |
    LDA #$0002          ; $07B4CD   |
    STA $7782,y         ; $07B4D0   |
    LDA #$0003          ; $07B4D3   |\ play sound #$0003
    JSL $0085D2         ; $07B4D6   |/
    INC $7900,x         ; $07B4DA   |

CODE_07B4DD:
    LDA $7182,x         ; $07B4DD   |
    CMP $7A36,x         ; $07B4E0   |
    BPL CODE_07B50F     ; $07B4E3   |
    LDA $7A98,x         ; $07B4E5   |
    BNE CODE_07B50F     ; $07B4E8   |
    LDA #$01FD          ; $07B4EA   |
    JSL $008B21         ; $07B4ED   |
    LDA $70E2,x         ; $07B4F1   |
    STA $70A2,y         ; $07B4F4   |
    LDA $7182,x         ; $07B4F7   |
    STA $7142,y         ; $07B4FA   |
    LDA #$000F          ; $07B4FD   |
    STA $73C2,y         ; $07B500   |
    LDA #$0003          ; $07B503   |
    STA $7782,y         ; $07B506   |
    LDA #$0006          ; $07B509   |
    STA $7A98,x         ; $07B50C   |

CODE_07B50F:
    LDA $7A96,x         ; $07B50F   |
    BNE CODE_07B52E     ; $07B512   |
    DEC $76,x           ; $07B514   |
    BPL CODE_07B51D     ; $07B516   |
    LDA #$0002          ; $07B518   |
    STA $76,x           ; $07B51B   |

CODE_07B51D:
    LDY $76,x           ; $07B51D   |
    LDA $B48F,y         ; $07B51F   |
    AND #$00FF          ; $07B522   |
    STA $7402,x         ; $07B525   |
    LDA #$0006          ; $07B528   |
    STA $7A96,x         ; $07B52B   |

CODE_07B52E:
    RTS                 ; $07B52E   |

CODE_07B52F:
    LDA #$0006          ; $07B52F   |
    STA $7402,x         ; $07B532   |
    STZ $7900,x         ; $07B535   |
    INC $16,x           ; $07B538   |
    INC $16,x           ; $07B53A   |
    RTS                 ; $07B53C   |

    LDX $12             ; $07B53D   |
    JSR CODE_07B674     ; $07B53F   |
    LDY #$06            ; $07B542   |
    LDA $7222,x         ; $07B544   |
    CLC                 ; $07B547   |
    ADC #$0100          ; $07B548   |
    CMP #$0100          ; $07B54B   |
    BCC CODE_07B55E     ; $07B54E   |
    LDY #$07            ; $07B550   |
    CMP #$0180          ; $07B552   |
    BCC CODE_07B55E     ; $07B555   |
    CMP #$0200          ; $07B557   |
    BCS CODE_07B563     ; $07B55A   |
    LDY #$08            ; $07B55C   |

CODE_07B55E:
    TYA                 ; $07B55E   |
    STA $7402,x         ; $07B55F   |
    RTS                 ; $07B562   |

CODE_07B563:
    LDA #$0002          ; $07B563   |
    STA $76,x           ; $07B566   |
    TAY                 ; $07B568   |
    LDA $B57D,y         ; $07B569   |
    AND #$00FF          ; $07B56C   |
    STA $7402,x         ; $07B56F   |
    LDA #$0006          ; $07B572   |
    STA $7A96,x         ; $07B575   |
    INC $16,x           ; $07B578   |
    INC $16,x           ; $07B57A   |
    RTS                 ; $07B57C   |

DATA_07B57D:         db $0B, $0A, $09

    LDX $12             ; $07B580   |
    JSR CODE_07B674     ; $07B582   |
    LDA $7A36,x         ; $07B585   |
    SEC                 ; $07B588   |
    SBC $7182,x         ; $07B589   |
    CMP #$0020          ; $07B58C   |
    BCC CODE_07B5B1     ; $07B58F   |
    LDA $7A96,x         ; $07B591   |
    BNE CODE_07B5B0     ; $07B594   |
    DEC $76,x           ; $07B596   |
    BPL CODE_07B59F     ; $07B598   |
    LDA #$0002          ; $07B59A   |
    STA $76,x           ; $07B59D   |

CODE_07B59F:
    LDY $76,x           ; $07B59F   |
    LDA $B57D,y         ; $07B5A1   |
    AND #$00FF          ; $07B5A4   |
    STA $7402,x         ; $07B5A7   |
    LDA #$0006          ; $07B5AA   |
    STA $7A96,x         ; $07B5AD   |

CODE_07B5B0:
    RTS                 ; $07B5B0   |

CODE_07B5B1:
    LDA #$0003          ; $07B5B1   |
    STA $76,x           ; $07B5B4   |
    TAY                 ; $07B5B6   |
    LDA $B5CE,y         ; $07B5B7   |
    AND #$00FF          ; $07B5BA   |
    STA $7402,x         ; $07B5BD   |
    LDA $B5D2,y         ; $07B5C0   |
    AND #$00FF          ; $07B5C3   |
    STA $7A96,x         ; $07B5C6   |
    INC $16,x           ; $07B5C9   |
    INC $16,x           ; $07B5CB   |
    RTS                 ; $07B5CD   |

DATA_07B5CE:         db $01, $02, $0D, $0C

DATA_07B5D2:         db $08, $0C, $08, $08

    LDX $12             ; $07B5D6   |
    JSR CODE_07B674     ; $07B5D8   |
    LDY $7900,x         ; $07B5DB   |
    BNE CODE_07B615     ; $07B5DE   |
    LDA $7182,x         ; $07B5E0   |
    CMP $7A36,x         ; $07B5E3   |
    BMI CODE_07B615     ; $07B5E6   |
    LDA #$01FE          ; $07B5E8   |
    JSL $008B21         ; $07B5EB   |
    LDA $70E2,x         ; $07B5EF   |
    STA $70A2,y         ; $07B5F2   |
    LDA $7A36,x         ; $07B5F5   |
    SEC                 ; $07B5F8   |
    SBC #$0008          ; $07B5F9   |
    STA $7142,y         ; $07B5FC   |
    LDA #$0006          ; $07B5FF   |
    STA $73C2,y         ; $07B602   |
    LDA #$0002          ; $07B605   |
    STA $7782,y         ; $07B608   |
    LDA #$0003          ; $07B60B   |\ play sound #$0003
    JSL $0085D2         ; $07B60E   |/
    INC $7900,x         ; $07B612   |

CODE_07B615:
    LDA $7A96,x         ; $07B615   |
    BNE CODE_07B638     ; $07B618   |
    DEC $76,x           ; $07B61A   |
    BPL CODE_07B624     ; $07B61C   |
    STZ $7900,x         ; $07B61E   |
    JMP CODE_07B431     ; $07B621   |

CODE_07B624:
    LDY $76,x           ; $07B624   |
    LDA $B5CE,y         ; $07B626   |
    AND #$00FF          ; $07B629   |
    STA $7402,x         ; $07B62C   |
    LDA $B5D2,y         ; $07B62F   |
    AND #$00FF          ; $07B632   |
    STA $7A96,x         ; $07B635   |

CODE_07B638:
    RTS                 ; $07B638   |

DATA_07B639:         dw $0040, $FFC0

DATA_07B63D:         dw $0008, $0008

DATA_07B641:         dw $0000, $0004

CODE_07B645:
    LDA $7222,x         ; $07B645   |
    AND #$8000          ; $07B648   |
    ASL A               ; $07B64B   |
    ROL A               ; $07B64C   |
    ASL A               ; $07B64D   |
    TAY                 ; $07B64E   |
    LDA $7CD8,x         ; $07B64F   |
    CLC                 ; $07B652   |
    ADC $B641,y         ; $07B653   |
    LDY #$00            ; $07B656   |
    CMP $7A36,x         ; $07B658   |
    BMI CODE_07B65F     ; $07B65B   |
    INY                 ; $07B65D   |
    INY                 ; $07B65E   |

CODE_07B65F:
    LDA $B639,y         ; $07B65F   |
    STA $75E2,x         ; $07B662   |
    LDA $B63D,y         ; $07B665   |
    STA $7542,x         ; $07B668   |
    RTS                 ; $07B66B   |

DATA_07B66C:         dw $0400, $FF00

DATA_07B670:         dw $0040, $0040

CODE_07B674:
    LDA $7222,x         ; $07B674   |
    AND #$8000          ; $07B677   |
    ASL A               ; $07B67A   |
    ROL A               ; $07B67B   |
    ASL A               ; $07B67C   |
    TAY                 ; $07B67D   |
    LDA $7CD8,x         ; $07B67E   |
    CLC                 ; $07B681   |
    ADC $B641,y         ; $07B682   |
    LDY #$00            ; $07B685   |
    CMP $7A36,x         ; $07B687   |
    BMI CODE_07B68E     ; $07B68A   |
    INY                 ; $07B68C   |
    INY                 ; $07B68D   |

CODE_07B68E:
    LDA $B66C,y         ; $07B68E   |
    STA $75E2,x         ; $07B691   |
    LDA $B670,y         ; $07B694   |
    STA $7542,x         ; $07B697   |
    RTS                 ; $07B69A   |

DATA_07B69B:         dw $FFE0, $0020

DATA_07B69F:         dw $0060, $0030

.init_blue_sluggy
    LDY $7400,x         ; $07B6A3   |
    LDA $B69B,y         ; $07B6A6   |
    STA $7220,x         ; $07B6A9   |

.init_pink_sluggy
    LDA #$0008          ; $07B6AC   |
    STA $7A96,x         ; $07B6AF   |
    LDA #$0003          ; $07B6B2   |
    STA $18,x           ; $07B6B5   |
    TAY                 ; $07B6B7   |
    LDA $B74B,y         ; $07B6B8   |
    AND #$00FF          ; $07B6BB   |
    STA $7402,x         ; $07B6BE   |
    LDA #$0100          ; $07B6C1   |
    STA $7542,x         ; $07B6C4   |
    LDA $70E2,x         ; $07B6C7   |
    AND #$0010          ; $07B6CA   |
    LSR A               ; $07B6CD   |
    LSR A               ; $07B6CE   |
    LSR A               ; $07B6CF   |
    TAY                 ; $07B6D0   |
    LDA $B69F,y         ; $07B6D1   |
    STA $7900,x         ; $07B6D4   |
    ASL A               ; $07B6D7   |
    STA $7902,x         ; $07B6D8   |
    RTL                 ; $07B6DB   |

.main_sluggy                                 ; blue and pink
    LDA $7D38,x         ; $07B6DC   |
    BEQ CODE_07B704     ; $07B6DF   |
    LDA $61B0           ; $07B6E1   |
    ORA $0B55           ; $07B6E4   |
    ORA $0398           ; $07B6E7   |
    BNE CODE_07B704     ; $07B6EA   |
    LDA #$0005          ; $07B6EC   |
    STA $7402,x         ; $07B6EF   |
    LDA $7042,x         ; $07B6F2   |
    AND #$FF7F          ; $07B6F5   |
    STA $7042,x         ; $07B6F8   |
    LDA $6FA2,x         ; $07B6FB   |
    AND #$FFE0          ; $07B6FE   |
    STA $6FA2,x         ; $07B701   |

CODE_07B704:
    JSL $03AF23         ; $07B704   |
    JSL $07B853         ; $07B708   |
    LDA $16,x           ; $07B70C   |
    TAX                 ; $07B70E   |
    JSR ($B716,x)       ; $07B70F   |

    JMP CODE_0707B8     ; $07B712   |

DATA_07B716:         dw $B71E
DATA_07B718:         dw $B774
DATA_07B71A:         dw $B7C1
DATA_07B71C:         dw $B82B

    LDX $12             ; $07B71E   |
    JSL $07FC7B         ; $07B720   |
    LDA $7CD6,x         ; $07B724   |
    SEC                 ; $07B727   |
    SBC $611C           ; $07B728   |
    CLC                 ; $07B72B   |
    ADC $7900,x         ; $07B72C   |
    CMP $7902,x         ; $07B72F   |
    BCS CODE_07B74F     ; $07B732   |
    STZ $7220,x         ; $07B734   |
    LDA #$0004          ; $07B737   |
    STA $18,x           ; $07B73A   |
    TAY                 ; $07B73C   |
    LDA $B76F,y         ; $07B73D   |
    AND #$00FF          ; $07B740   |
    STA $7402,x         ; $07B743   |
    INC $16,x           ; $07B746   |
    INC $16,x           ; $07B748   |
    RTS                 ; $07B74A   |

DATA_07B74B:         db $01, $02, $01, $00

CODE_07B74F:
    LDA $7A96,x         ; $07B74F   |
    BNE CODE_07B76E     ; $07B752   |
    LDA #$0008          ; $07B754   |
    STA $7A96,x         ; $07B757   |
    DEC $18,x           ; $07B75A   |
    BPL CODE_07B763     ; $07B75C   |
    LDA #$0003          ; $07B75E   |
    STA $18,x           ; $07B761   |

CODE_07B763:
    LDY $18,x           ; $07B763   |
    LDA $B74B,y         ; $07B765   |
    AND #$00FF          ; $07B768   |
    STA $7402,x         ; $07B76B   |

CODE_07B76E:
    RTS                 ; $07B76E   |

DATA_07B76F:         db $04, $03, $02, $01, $00

    LDX $12             ; $07B774   |
    LDA $7A96,x         ; $07B776   |
    BNE CODE_07B790     ; $07B779   |
    LDA #$0004          ; $07B77B   |
    STA $7A96,x         ; $07B77E   |
    DEC $18,x           ; $07B781   |
    BMI CODE_07B791     ; $07B783   |
    LDY $18,x           ; $07B785   |
    LDA $B76F,y         ; $07B787   |
    AND #$00FF          ; $07B78A   |
    STA $7402,x         ; $07B78D   |

CODE_07B790:
    RTS                 ; $07B790   |

CODE_07B791:
    LDA $7182,x         ; $07B791   |
    CLC                 ; $07B794   |
    ADC #$0004          ; $07B795   |
    STA $7182,x         ; $07B798   |
    LDA #$0005          ; $07B79B   |
    STA $7402,x         ; $07B79E   |
    LDA #$0400          ; $07B7A1   |
    STA $75E2,x         ; $07B7A4   |
    LDA #$0040          ; $07B7A7   |
    STA $7542,x         ; $07B7AA   |
    LDA #$0005          ; $07B7AD   |
    STA $18,x           ; $07B7B0   |
    INC $16,x           ; $07B7B2   |
    INC $16,x           ; $07B7B4   |
    RTS                 ; $07B7B6   |

DATA_07B7B7:         db $02, $01, $00, $01, $02

DATA_07B7BC:         db $10, $04, $04, $01, $01

    LDX $12             ; $07B7C1   |
    LDA $7860,x         ; $07B7C3   |
    BIT #$0001          ; $07B7C6   |
    BEQ CODE_07B7FE     ; $07B7C9   |
    LDA $76,x           ; $07B7CB   |
    BNE CODE_07B7E1     ; $07B7CD   |
    LDA #$0060          ; $07B7CF   |\ play sound #$0060
    JSL $0085D2         ; $07B7D2   |/
    LDA $7042,x         ; $07B7D6   |
    ORA #$0080          ; $07B7D9   |
    STA $7042,x         ; $07B7DC   |
    INC $76,x           ; $07B7DF   |

CODE_07B7E1:
    LDA $7A96,x         ; $07B7E1   |
    BNE CODE_07B7FE     ; $07B7E4   |
    DEC $18,x           ; $07B7E6   |
    BMI CODE_07B7FF     ; $07B7E8   |
    LDY $18,x           ; $07B7EA   |
    LDA $B7B7,y         ; $07B7EC   |
    AND #$00FF          ; $07B7EF   |
    STA $7402,x         ; $07B7F2   |
    LDA $B7BC,y         ; $07B7F5   |
    AND #$00FF          ; $07B7F8   |
    STA $7A96,x         ; $07B7FB   |

CODE_07B7FE:
    RTS                 ; $07B7FE   |

CODE_07B7FF:
    LDA #$0008          ; $07B7FF   |
    STA $7A96,x         ; $07B802   |
    LDA #$0003          ; $07B805   |
    STA $18,x           ; $07B808   |
    TAY                 ; $07B80A   |
    LDA $B74B,y         ; $07B80B   |
    AND #$00FF          ; $07B80E   |
    STA $7402,x         ; $07B811   |
    LDA $6FA2,x         ; $07B814   |
    ORA #$0100          ; $07B817   |
    STA $6FA2,x         ; $07B81A   |
    LDY $7400,x         ; $07B81D   |
    LDA $B69B,y         ; $07B820   |
    STA $7220,x         ; $07B823   |
    INC $16,x           ; $07B826   |
    INC $16,x           ; $07B828   |
    RTS                 ; $07B82A   |

    LDX $12             ; $07B82B   |
    JMP CODE_07B74F     ; $07B82D   |

    LDY $7D36,x         ; $07B830   |
    BPL CODE_07B852     ; $07B833   |
    LDA $7860,x         ; $07B835   |
    BIT #$0001          ; $07B838   |
    BEQ CODE_07B845     ; $07B83B   |
    JSL $07FC2A         ; $07B83D   |
    BCS CODE_07B849     ; $07B841   |
    BEQ CODE_07B852     ; $07B843   |

CODE_07B845:
    JMP CODE_0703A8     ; $07B845   |

CODE_07B849:
    LDA #$000E          ; $07B849   |
    STA $6F00,x         ; $07B84C   |
    STZ $7220,x         ; $07B84F   |

CODE_07B852:
    RTL                 ; $07B852   |

    LDY $7D36,x         ; $07B853   |
    DEY                 ; $07B856   |
    BMI CODE_07B8B2     ; $07B857   |
    BEQ CODE_07B8B2     ; $07B859   |
    LDA $6F00,y         ; $07B85B   |
    CMP #$0010          ; $07B85E   |
    BNE CODE_07B8B2     ; $07B861   |
    LDA $7D38,y         ; $07B863   |
    BEQ CODE_07B8B2     ; $07B866   |
    LDA #$0062          ; $07B868   |\ play sound #$0062
    JSL $0085D2         ; $07B86B   |/
    LDA #$000E          ; $07B86F   |
    STA $6F00,x         ; $07B872   |
    STZ $7222,x         ; $07B875   |
    STZ $7220,x         ; $07B878   |
    STZ $7540,x         ; $07B87B   |
    STZ $75E0,x         ; $07B87E   |
    LDA #$0040          ; $07B881   |
    STA $7542,x         ; $07B884   |
    LDA #$0400          ; $07B887   |
    STA $75E2,x         ; $07B88A   |
    LDA #$0005          ; $07B88D   |
    STA $7402,x         ; $07B890   |
    LDA $7042,x         ; $07B893   |
    AND #$FF7F          ; $07B896   |
    STA $7042,x         ; $07B899   |
    LDA $6FA2,x         ; $07B89C   |
    AND #$FFE0          ; $07B89F   |
    STA $6FA2,x         ; $07B8A2   |
    SEP #$20            ; $07B8A5   |
    LDA #$FF            ; $07B8A7   |
    STA $74A0,x         ; $07B8A9   |
    REP #$20            ; $07B8AC   |
    INC $78,x           ; $07B8AE   |
    PLY                 ; $07B8B0   |
    PLA                 ; $07B8B1   |

CODE_07B8B2:
    RTL                 ; $07B8B2   |

DATA_07B8B3:         dw $0021, $0023, $0025

    LDA $79D8,x         ; $07B8B9   |
    BNE CODE_07B938     ; $07B8BC   |
    LDA $7A38,x         ; $07B8BE   |
    BNE CODE_07B928     ; $07B8C1   |
    LDA $60AA           ; $07B8C3   |
    BMI CODE_07B91F     ; $07B8C6   |
    LDA #$0001          ; $07B8C8   |
    STA $61B4           ; $07B8CB   |
    LDA $7A36,x         ; $07B8CE   |
    BNE CODE_07B8F3     ; $07B8D1   |
    LDA #$0003          ; $07B8D3   |
    STA $7A96,x         ; $07B8D6   |
    LDA #$0002          ; $07B8D9   |
    STA $7402,x         ; $07B8DC   |
    LDA #$0100          ; $07B8DF   |
    STA $60AA           ; $07B8E2   |
    LDA $7182,x         ; $07B8E5   |
    SEC                 ; $07B8E8   |
    SBC #$0020          ; $07B8E9   |
    STA $6090           ; $07B8EC   |
    INC $7A36,x         ; $07B8EF   |
    RTL                 ; $07B8F2   |

CODE_07B8F3:
    LDA $7182,x         ; $07B8F3   |
    SEC                 ; $07B8F6   |
    SBC $6090           ; $07B8F7   |
    SEC                 ; $07B8FA   |
    SBC #$0010          ; $07B8FB   |
    CMP #$0004          ; $07B8FE   |
    BMI CODE_07B939     ; $07B901   |
    PHA                 ; $07B903   |
    ASL A               ; $07B904   |
    ASL A               ; $07B905   |
    ASL A               ; $07B906   |
    ASL A               ; $07B907   |
    STA $60AA           ; $07B908   |
    PLA                 ; $07B90B   |
    LDY #$02            ; $07B90C   |
    CMP #$0018          ; $07B90E   |
    BCS CODE_07B91A     ; $07B911   |
    DEY                 ; $07B913   |
    CMP #$0010          ; $07B914   |
    BCS CODE_07B91A     ; $07B917   |
    DEY                 ; $07B919   |

CODE_07B91A:
    TYA                 ; $07B91A   |
    STA $7402,x         ; $07B91B   |
    RTL                 ; $07B91E   |

CODE_07B91F:
    LDA #$0003          ; $07B91F   |
    STA $7A96,x         ; $07B922   |
    INC $7A38,x         ; $07B925   |

CODE_07B928:
    LDA $7A96,x         ; $07B928   |
    BNE CODE_07B938     ; $07B92B   |
    DEC $7402,x         ; $07B92D   |
    BMI CODE_07B939     ; $07B930   |
    LDA #$0003          ; $07B932   |
    STA $7A96,x         ; $07B935   |

CODE_07B938:
    RTL                 ; $07B938   |

CODE_07B939:
    SEP #$20            ; $07B939   |
    LDA #$FF            ; $07B93B   |
    STA $74A2,x         ; $07B93D   |
    REP #$20            ; $07B940   |
    LDA #$01EE          ; $07B942   |
    JSL $008B21         ; $07B945   |
    LDA #$0008          ; $07B949   |
    STA $73C2,y         ; $07B94C   |
    LDA #$0002          ; $07B94F   |
    STA $7782,y         ; $07B952   |
    LDA $7CD6,x         ; $07B955   |
    STA $70A2,y         ; $07B958   |
    LDA $7CD8,x         ; $07B95B   |
    STA $7142,y         ; $07B95E   |
    LDA #$003B          ; $07B961   |\ play sound #$003B
    JSL $0085D2         ; $07B964   |/
    JMP CODE_0703A3     ; $07B968   |

DATA_07B96C:         dw $002F, $002E, $002D, $002C
DATA_07B974:         dw $002B, $002A, $0029, $0028
DATA_07B97C:         dw $FA58, $F800, $FA58, $0000
DATA_07B984:         dw $05A8, $0800, $05A8, $0000
DATA_07B98C:         dw $FA58, $0000, $05A8, $0800
DATA_07B994:         dw $05A8, $0000, $FA58, $F800
DATA_07B99C:         dw $0000, $0002, $0004, $0008

.init_arrow_cloud_up
    LDA #$000E          ; $07B9A4   |
    BRA CODE_07B9CA     ; $07B9A7   |

.init_arrow_cloud_up_right
    LDA #$000C          ; $07B9A9   |
    BRA CODE_07B9CA     ; $07B9AC   |

.init_arrow_cloud_right
    LDA #$000A          ; $07B9AE   |
    BRA CODE_07B9CA     ; $07B9B1   |

.init_arrow_cloud_down_right
    LDA #$0008          ; $07B9B3   |
    BRA CODE_07B9CA     ; $07B9B6   |

.init_arrow_cloud_down
    LDA #$0006          ; $07B9B8   |
    BRA CODE_07B9CA     ; $07B9BB   |

.init_arrow_cloud_down_left
    LDA #$0004          ; $07B9BD   |
    BRA CODE_07B9CA     ; $07B9C0   |

.init_arrow_cloud_left
    LDA #$0002          ; $07B9C2   |
    BRA CODE_07B9CA     ; $07B9C5   |

.init_arrow_cloud_up_left
    LDA #$0000          ; $07B9C7   |

CODE_07B9CA:
    STA $18,x           ; $07B9CA   |
    LDA #$0002          ; $07B9CC   |
    STA $7402,x         ; $07B9CF   |
    STA $76,x           ; $07B9D2   |
    LDA #$0008          ; $07B9D4   |
    STA $7A96,x         ; $07B9D7   |
    STZ $7400,x         ; $07B9DA   |
    LDA $10             ; $07B9DD   |
    AND #$0003          ; $07B9DF   |
    ASL A               ; $07B9E2   |
    TAY                 ; $07B9E3   |
    LDA $7042,x         ; $07B9E4   |
    ORA $B99C,y         ; $07B9E7   |
    STA $7042,x         ; $07B9EA   |
    RTL                 ; $07B9ED   |

.init_arrow_cloud_rotating
    LDY #$03            ; $07B9EE   |
    STY $4202           ; $07B9F0   |
    LDA $10             ; $07B9F3   |
    AND #$0007          ; $07B9F5   |
    INC A               ; $07B9F8   |
    TAY                 ; $07B9F9   |
    STY $4203           ; $07B9FA   |
    LDA #$0017          ; $07B9FD   |
    STA $76,x           ; $07BA00   |
    LDA #$0008          ; $07BA02   |
    STA $7A96,x         ; $07BA05   |
    LDA $4216           ; $07BA08   |
    DEC A               ; $07BA0B   |
    STA $7402,x         ; $07BA0C   |
    STA $4204           ; $07BA0F   |
    LDY #$03            ; $07BA12   |
    STY $4206           ; $07BA14   |
    STZ $7400,x         ; $07BA17   |
    LDA $10             ; $07BA1A   |
    AND #$0003          ; $07BA1C   |
    ASL A               ; $07BA1F   |
    TAY                 ; $07BA20   |
    LDA $7042,x         ; $07BA21   |
    ORA $B99C,y         ; $07BA24   |
    STA $7042,x         ; $07BA27   |
    LDA $4214           ; $07BA2A   |
    ASL A               ; $07BA2D   |
    STA $18,x           ; $07BA2E   |
    RTL                 ; $07BA30   |

.main_arrow_cloud                            ; all except rotating
    JSL $03AF23         ; $07BA31   |
    JSL $07BA78         ; $07BA35   |
    JSR CODE_07BA62     ; $07BA39   |
    RTL                 ; $07BA3C   |

.main_arrow_cloud_rotating
    JSL $03AF23         ; $07BA3D   |
    LDA $7402,x         ; $07BA41   |
    STA $4204           ; $07BA44   |
    LDY #$03            ; $07BA47   |
    STY $4206           ; $07BA49   |
    NOP                 ; $07BA4C   |
    NOP                 ; $07BA4D   |
    NOP                 ; $07BA4E   |
    NOP                 ; $07BA4F   |
    NOP                 ; $07BA50   |
    NOP                 ; $07BA51   |
    NOP                 ; $07BA52   |
    NOP                 ; $07BA53   |
    LDA $4214           ; $07BA54   |
    ASL A               ; $07BA57   |
    STA $18,x           ; $07BA58   |
    JSL $07BA78         ; $07BA5A   |
    JSR CODE_07BA62     ; $07BA5E   |
    RTL                 ; $07BA61   |

CODE_07BA62:
    LDA $7A96,x         ; $07BA62   |
    BNE CODE_07BA77     ; $07BA65   |
    DEC $7402,x         ; $07BA67   |
    BPL CODE_07BA71     ; $07BA6A   |
    LDA $76,x           ; $07BA6C   |
    STA $7402,x         ; $07BA6E   |

CODE_07BA71:
    LDA #$0008          ; $07BA71   |
    STA $7A96,x         ; $07BA74   |

CODE_07BA77:
    RTS                 ; $07BA77   |

    LDY $7D36,x         ; $07BA78   |
    DEY                 ; $07BA7B   |
    BMI CODE_07BA9A     ; $07BA7C   |
    BEQ CODE_07BA9A     ; $07BA7E   |
    LDA $6F00,y         ; $07BA80   |
    CMP #$0010          ; $07BA83   |
    BNE CODE_07BA9A     ; $07BA86   |
    LDA $7D38,y         ; $07BA88   |
    BEQ CODE_07BA9A     ; $07BA8B   |
    LDA $7360,y         ; $07BA8D   |
    CMP #$0022          ; $07BA90   |
    BCC CODE_07BA9A     ; $07BA93   |
    CMP #$002C          ; $07BA95   |
    BCC CODE_07BA9D     ; $07BA98   |

CODE_07BA9A:
    JMP CODE_07BB13     ; $07BA9A   |

CODE_07BA9D:
    LDA $70E2,x         ; $07BA9D   |
    STA $70E2,y         ; $07BAA0   |
    LDA $7182,x         ; $07BAA3   |
    STA $7182,y         ; $07BAA6   |
    LDA #$0000          ; $07BAA9   |
    STA $7542,y         ; $07BAAC   |
    LDA $18,x           ; $07BAAF   |
    TAX                 ; $07BAB1   |
    LDA $B97C,x         ; $07BAB2   |
    STA $7220,y         ; $07BAB5   |
    LDA $B98C,x         ; $07BAB8   |
    STA $7222,y         ; $07BABB   |
    LDA #$FFFF          ; $07BABE   |
    STA $7A96,y         ; $07BAC1   |
    INC A               ; $07BAC4   |
    SEP #$20            ; $07BAC5   |
    STA $77C0,y         ; $07BAC7   |
    REP #$20            ; $07BACA   |
    LDX $12             ; $07BACC   |
    JSL $039F2B         ; $07BACE   |
    LDA #$0200          ; $07BAD2   |
    JSL $008B21         ; $07BAD5   |
    LDA $70E2,x         ; $07BAD9   |
    STA $70A2,y         ; $07BADC   |
    LDA $7182,x         ; $07BADF   |
    STA $7142,y         ; $07BAE2   |
    LDA #$0080          ; $07BAE5   |
    STA $7782,y         ; $07BAE8   |
    LDA $7042,x         ; $07BAEB   |
    AND #$000E          ; $07BAEE   |
    ORA $7002,y         ; $07BAF1   |
    STA $7002,y         ; $07BAF4   |
    LDA $18,x           ; $07BAF7   |
    LSR A               ; $07BAF9   |
    STA $73C2,y         ; $07BAFA   |
    LDA #$0020          ; $07BAFD   |\ play sound #$0020
    JSL $0085D2         ; $07BB00   |/
    LDY $18,x           ; $07BB04   |
    LDA $B96C,y         ; $07BB06   |
    JSL $0085D2         ; $07BB09   |
    JSL $03A32E         ; $07BB0D   |
    PLY                 ; $07BB11   |
    PLA                 ; $07BB12   |

CODE_07BB13:
    RTL                 ; $07BB13   |

DATA_07BB14:         dw $FF80, $0080

DATA_07BB18:         dw $FFE0, $0020

DATA_07BB1C:         dw $0800, $F800

.init_flutter
    LDY $7400,x         ; $07BB20   |
    LDA $BB14,y         ; $07BB23   |
    STA $7220,x         ; $07BB26   |
    LDA $70E2,x         ; $07BB29   |
    AND #$0010          ; $07BB2C   |
    LSR A               ; $07BB2F   |
    LSR A               ; $07BB30   |
    LSR A               ; $07BB31   |
    TAY                 ; $07BB32   |
    LDA $7182,x         ; $07BB33   |
    STA $18,x           ; $07BB36   |
    CLC                 ; $07BB38   |
    ADC $BB18,y         ; $07BB39   |
    STA $7182,x         ; $07BB3C   |
    LDA $BB1C,y         ; $07BB3F   |
    STA $75E2,x         ; $07BB42   |
    LDA #$0008          ; $07BB45   |
    STA $7542,x         ; $07BB48   |
    LDA #$0004          ; $07BB4B   |
    STA $7A96,x         ; $07BB4E   |
    LDA #$0003          ; $07BB51   |
    STA $76,x           ; $07BB54   |
    TAY                 ; $07BB56   |
    LDA $BB8A,y         ; $07BB57   |
    AND #$00FF          ; $07BB5A   |
    STA $7402,x         ; $07BB5D   |
    RTL                 ; $07BB60   |

.main_flutter
    LDA $7D38,x         ; $07BB61   |
    BEQ CODE_07BB72     ; $07BB64   |
    LDA $6FA0,x         ; $07BB66   |
    AND #$FFDF          ; $07BB69   |
    ORA #$0200          ; $07BB6C   |
    STA $6FA0,x         ; $07BB6F   |

CODE_07BB72:
    JSL $03AF23         ; $07BB72   |
    JSL $07BE69         ; $07BB76   |
    JSL $07E336         ; $07BB7A   |
    LDA $16,x           ; $07BB7E   |
    TAX                 ; $07BB80   |
    JMP ($BB84,x)       ; $07BB81   |

DATA_07BB84:         dw $BB8E
DATA_07BB86:         dw $BC9E
DATA_07BB88:         dw $BD21

DATA_07BB8A:         db $01, $02, $01, $00

    LDX $12             ; $07BB8E   |
    JSL $07BBC9         ; $07BB90   |
    LDA $7A96,x         ; $07BB94   |
    BNE CODE_07BBB3     ; $07BB97   |
    DEC $76,x           ; $07BB99   |
    BPL CODE_07BBA2     ; $07BB9B   |
    LDA #$0003          ; $07BB9D   |
    STA $76,x           ; $07BBA0   |

CODE_07BBA2:
    LDY $76,x           ; $07BBA2   |
    LDA $BB8A,y         ; $07BBA4   |
    AND #$00FF          ; $07BBA7   |
    STA $7402,x         ; $07BBAA   |
    LDA #$0004          ; $07BBAD   |
    STA $7A96,x         ; $07BBB0   |

CODE_07BBB3:
    LDY #$00            ; $07BBB3   |
    LDA $7182,x         ; $07BBB5   |
    CMP $18,x           ; $07BBB8   |
    BMI CODE_07BBBE     ; $07BBBA   |
    INY                 ; $07BBBC   |
    INY                 ; $07BBBD   |

CODE_07BBBE:
    LDA $BB1C,y         ; $07BBBE   |
    STA $75E2,x         ; $07BBC1   |
    RTL                 ; $07BBC4   |

DATA_07BBC5:         dw $0100, $FF00

    LDY $7D36,x         ; $07BBC9   |
    BPL CODE_07BBF3     ; $07BBCC   |
    JSL $07FC2F         ; $07BBCE   |
    BEQ CODE_07BC05     ; $07BBD2   |
    BCC CODE_07BBEF     ; $07BBD4   |
    LDA $60A8           ; $07BBD6   |
    STA $7220,x         ; $07BBD9   |
    LDA $60AA           ; $07BBDC   |
    STA $7222,x         ; $07BBDF   |
    LDA #$001C          ; $07BBE2   |\ play sound #$001C
    JSL $0085D2         ; $07BBE5   |/
    JSL $03B20B         ; $07BBE9   |
    BRA CODE_07BC1B     ; $07BBED   |

CODE_07BBEF:
    JMP CODE_0703A8     ; $07BBEF   |

CODE_07BBF3:
    DEY                 ; $07BBF3   |
    BMI CODE_07BC05     ; $07BBF4   |
    BEQ CODE_07BC05     ; $07BBF6   |
    LDA $6F00,y         ; $07BBF8   |
    CMP #$0010          ; $07BBFB   |
    BNE CODE_07BC05     ; $07BBFE   |
    LDA $7D38,y         ; $07BC00   |
    BNE CODE_07BC08     ; $07BC03   |

CODE_07BC05:
    JMP CODE_07BC8F     ; $07BC05   |

CODE_07BC08:
    LDA $7220,y         ; $07BC08   |
    STA $7220,x         ; $07BC0B   |
    LDA $7222,y         ; $07BC0E   |
    STA $7222,x         ; $07BC11   |
    TYX                 ; $07BC14   |
    JSL $03B24B         ; $07BC15   |
    LDX $12             ; $07BC19   |

CODE_07BC1B:
    LDA $7220,x         ; $07BC1B   |
    STA $7900,x         ; $07BC1E   |
    LDA $7222,x         ; $07BC21   |
    STA $7902,x         ; $07BC24   |
    LDA #$0100          ; $07BC27   |
    STA $7542,x         ; $07BC2A   |
    STA $7540,x         ; $07BC2D   |
    STZ $75E2,x         ; $07BC30   |
    LDA #$0006          ; $07BC33   |
    STA $79D6,x         ; $07BC36   |
    TAY                 ; $07BC39   |
    LDA $BC90,y         ; $07BC3A   |
    AND #$00FF          ; $07BC3D   |
    STA $7402,x         ; $07BC40   |
    LDA $BC97,y         ; $07BC43   |
    AND #$00FF          ; $07BC46   |
    STA $7A96,x         ; $07BC49   |
    LDY $77C2,x         ; $07BC4C   |
    LDA $BBC5,y         ; $07BC4F   |
    STA $00             ; $07BC52   |
    LDA #$0202          ; $07BC54   |
    JSL $008B21         ; $07BC57   |
    LDA $70E2,x         ; $07BC5B   |
    STA $70A2,y         ; $07BC5E   |
    LDA $7182,x         ; $07BC61   |
    SEC                 ; $07BC64   |
    SBC #$0008          ; $07BC65   |
    STA $7142,y         ; $07BC68   |
    LDA $00             ; $07BC6B   |
    STA $71E0,y         ; $07BC6D   |
    LDA #$FE00          ; $07BC70   |
    STA $71E2,y         ; $07BC73   |
    LDA #$0020          ; $07BC76   |
    STA $7502,y         ; $07BC79   |
    LDA #$0400          ; $07BC7C   |
    STA $75A2,y         ; $07BC7F   |
    LDA #$0040          ; $07BC82   |
    STA $7782,y         ; $07BC85   |
    LDA #$0002          ; $07BC88   |
    STA $16,x           ; $07BC8B   |
    PLY                 ; $07BC8D   |
    PLA                 ; $07BC8E   |

CODE_07BC8F:
    RTL                 ; $07BC8F   |

DATA_07BC90:         db $03, $04, $05, $06, $05, $04, $03

DATA_07BC97:         db $02, $02, $02, $04, $02, $02, $02

    LDX $12             ; $07BC9E   |
    JSL $07BE33         ; $07BCA0   |
    LDA $7220,x         ; $07BCA4   |
    EOR $7900,x         ; $07BCA7   |
    BMI CODE_07BCB5     ; $07BCAA   |
    STZ $7220,x         ; $07BCAC   |
    STZ $7540,x         ; $07BCAF   |
    STZ $7900,x         ; $07BCB2   |

CODE_07BCB5:
    LDA $7222,x         ; $07BCB5   |
    EOR $7902,x         ; $07BCB8   |
    BPL CODE_07BCC6     ; $07BCBB   |
    STZ $7222,x         ; $07BCBD   |
    STZ $7542,x         ; $07BCC0   |
    STZ $7902,x         ; $07BCC3   |

CODE_07BCC6:
    LDA $7A96,x         ; $07BCC6   |
    BNE CODE_07BCE5     ; $07BCC9   |
    DEC $79D6,x         ; $07BCCB   |
    BMI CODE_07BCE6     ; $07BCCE   |
    LDY $79D6,x         ; $07BCD0   |
    LDA $BC90,y         ; $07BCD3   |
    AND #$00FF          ; $07BCD6   |
    STA $7402,x         ; $07BCD9   |
    LDA $BC97,y         ; $07BCDC   |
    AND #$00FF          ; $07BCDF   |
    STA $7A96,x         ; $07BCE2   |

CODE_07BCE5:
    RTL                 ; $07BCE5   |

CODE_07BCE6:
    STZ $7220,x         ; $07BCE6   |
    STZ $7540,x         ; $07BCE9   |
    STZ $7900,x         ; $07BCEC   |
    STZ $7222,x         ; $07BCEF   |
    STZ $7542,x         ; $07BCF2   |
    STZ $7902,x         ; $07BCF5   |
    LDA #$0003          ; $07BCF8   |
    STA $76,x           ; $07BCFB   |
    TAY                 ; $07BCFD   |
    LDA $BD19,y         ; $07BCFE   |
    AND #$00FF          ; $07BD01   |
    STA $7402,x         ; $07BD04   |
    LDA #$0002          ; $07BD07   |
    STA $7A96,x         ; $07BD0A   |
    LDA #$0040          ; $07BD0D   |
    STA $7A98,x         ; $07BD10   |
    LDA #$0004          ; $07BD13   |
    STA $16,x           ; $07BD16   |
    RTL                 ; $07BD18   |

DATA_07BD19:         db $08, $09, $08, $07

DATA_07BD1D:         dw $FFF0, $0000

    LDX $12             ; $07BD21   |
    LDA $7A98,x         ; $07BD23   |
    BEQ CODE_07BD31     ; $07BD26   |
    LDA $77C2,x         ; $07BD28   |
    AND #$00FF          ; $07BD2B   |
    STA $7400,x         ; $07BD2E   |

CODE_07BD31:
    JSL $07BE33         ; $07BD31   |
    LDA $7A96,x         ; $07BD35   |
    BNE CODE_07BD54     ; $07BD38   |
    DEC $76,x           ; $07BD3A   |
    BPL CODE_07BD43     ; $07BD3C   |
    LDA #$0003          ; $07BD3E   |
    STA $76,x           ; $07BD41   |

CODE_07BD43:
    LDY $76,x           ; $07BD43   |
    LDA $BD19,y         ; $07BD45   |
    AND #$00FF          ; $07BD48   |
    STA $7402,x         ; $07BD4B   |
    LDA #$0002          ; $07BD4E   |
    STA $7A96,x         ; $07BD51   |

CODE_07BD54:
    LDA $7AF6,x         ; $07BD54   |
    BNE CODE_07BDA7     ; $07BD57   |
    LDA #$000E          ; $07BD59   |
    STA $7AF6,x         ; $07BD5C   |
    LDY $7400,x         ; $07BD5F   |
    LDA $70E2,x         ; $07BD62   |
    CLC                 ; $07BD65   |
    ADC $BD1D,y         ; $07BD66   |
    STA $00             ; $07BD69   |
    LDA $7182,x         ; $07BD6B   |
    SEC                 ; $07BD6E   |
    SBC #$0010          ; $07BD6F   |
    STA $02             ; $07BD72   |
    LDA #$FE00          ; $07BD74   |
    CLC                 ; $07BD77   |
    ADC $7220,x         ; $07BD78   |
    STA $04             ; $07BD7B   |
    LDA #$FE00          ; $07BD7D   |
    CLC                 ; $07BD80   |
    ADC $7222,x         ; $07BD81   |
    STA $06             ; $07BD84   |
    LDA #$0002          ; $07BD86   |
    STA $08             ; $07BD89   |
    JSR CODE_07BDE8     ; $07BD8B   |
    LDY $7400,x         ; $07BD8E   |
    LDA $00             ; $07BD91   |
    CLC                 ; $07BD93   |
    ADC #$0010          ; $07BD94   |
    STA $00             ; $07BD97   |
    LDA #$0200          ; $07BD99   |
    CLC                 ; $07BD9C   |
    ADC $7220,x         ; $07BD9D   |
    STA $04             ; $07BDA0   |
    STZ $08             ; $07BDA2   |
    JSR CODE_07BDE8     ; $07BDA4   |

CODE_07BDA7:
    LDA $78,x           ; $07BDA7   |
    BNE CODE_07BDE7     ; $07BDA9   |
    LDA $7A98,x         ; $07BDAB   |
    BNE CODE_07BDE7     ; $07BDAE   |
    LDA $611C           ; $07BDB0   |
    STA $3002           ; $07BDB3   |
    LDA $611E           ; $07BDB6   |
    STA $3004           ; $07BDB9   |
    LDA $7CD6,x         ; $07BDBC   |
    STA $3006           ; $07BDBF   |
    LDA $7CD8,x         ; $07BDC2   |
    STA $3008           ; $07BDC5   |
    LDA #$0200          ; $07BDC8   |
    STA $300C           ; $07BDCB   |
    LDX #$09            ; $07BDCE   |
    LDA #$907C          ; $07BDD0   |
    JSL $7EDE44         ; $07BDD3   | GSU init
    LDX $12             ; $07BDD7   |
    LDA $3002           ; $07BDD9   |
    STA $7220,x         ; $07BDDC   |
    LDA $3004           ; $07BDDF   |
    STA $7222,x         ; $07BDE2   |
    INC $78,x           ; $07BDE5   |

CODE_07BDE7:
    RTL                 ; $07BDE7   |

CODE_07BDE8:
    LDA #$0203          ; $07BDE8   |
    JSL $008B21         ; $07BDEB   |
    LDA $00             ; $07BDEF   |
    STA $70A2,y         ; $07BDF1   |
    LDA $02             ; $07BDF4   |
    STA $7142,y         ; $07BDF6   |
    LDA $04             ; $07BDF9   |
    STA $71E0,y         ; $07BDFB   |
    LDA $06             ; $07BDFE   |
    STA $71E2,y         ; $07BE00   |
    LDA $75A0,y         ; $07BE03   |
    CLC                 ; $07BE06   |
    ADC $7220,x         ; $07BE07   |
    STA $75A0,y         ; $07BE0A   |
    LDA $75A2,y         ; $07BE0D   |
    CLC                 ; $07BE10   |
    ADC $7222,x         ; $07BE11   |
    STA $75A2,y         ; $07BE14   |
    LDA $7968           ; $07BE17   |
    STA $73C0,y         ; $07BE1A   |
    LDA #$0040          ; $07BE1D   |
    STA $7502,y         ; $07BE20   |
    STA $7500,y         ; $07BE23   |
    LDA #$0002          ; $07BE26   |
    STA $7782,y         ; $07BE29   |
    LDA #$0006          ; $07BE2C   |
    STA $73C2,y         ; $07BE2F   |
    RTS                 ; $07BE32   |

    LDY $7D36,x         ; $07BE33   |
    BPL CODE_07BE4F     ; $07BE36   |
    JSL $07FC2F         ; $07BE38   |
    BEQ CODE_07BE68     ; $07BE3C   |
    BCC CODE_07BE4B     ; $07BE3E   |
    LDA #$001C          ; $07BE40   |\ play sound #$001C
    JSL $0085D2         ; $07BE43   |/
    JMP CODE_0703B2     ; $07BE47   |

CODE_07BE4B:
    JMP CODE_0703A8     ; $07BE4B   |

CODE_07BE4F:
    DEY                 ; $07BE4F   |
    BMI CODE_07BE68     ; $07BE50   |
    BEQ CODE_07BE68     ; $07BE52   |
    LDA $6F00,y         ; $07BE54   |
    CMP #$0010          ; $07BE57   |
    BNE CODE_07BE68     ; $07BE5A   |
    LDA $7D38,y         ; $07BE5C   |
    BEQ CODE_07BE68     ; $07BE5F   |
    TYX                 ; $07BE61   |
    JSL $03B24B         ; $07BE62   |
    LDX $12             ; $07BE66   |

CODE_07BE68:
    RTL                 ; $07BE68   |

    LDA $7A36,x         ; $07BE69   |
    BEQ CODE_07BE8F     ; $07BE6C   |
    LDA $7680,x         ; $07BE6E   |
    CLC                 ; $07BE71   |
    ADC #$0050          ; $07BE72   |
    CMP #$0190          ; $07BE75   |
    BCS CODE_07BE86     ; $07BE78   |
    LDA $7682,x         ; $07BE7A   |
    CLC                 ; $07BE7D   |
    ADC #$0050          ; $07BE7E   |
    CMP #$0190          ; $07BE81   |
    BCC CODE_07BE8F     ; $07BE84   |

CODE_07BE86:
    DEC $0C6C           ; $07BE86   |
    PLY                 ; $07BE89   |
    PLA                 ; $07BE8A   |
    JMP CODE_0703A3     ; $07BE8B   |

CODE_07BE8F:
    RTL                 ; $07BE8F   |

.init_spray_fish
    LDA $70E2,x         ; $07BE90   |
    SEC                 ; $07BE93   |
    SBC #$0020          ; $07BE94   |
    STA $76,x           ; $07BE97   |
    CLC                 ; $07BE99   |
    ADC #$0040          ; $07BE9A   |
    STA $78,x           ; $07BE9D   |
    LDA $7182,x         ; $07BE9F   |
    CLC                 ; $07BEA2   |
    ADC #$0008          ; $07BEA3   |
    STA $7182,x         ; $07BEA6   |
    STA $7A38,x         ; $07BEA9   |
    SEC                 ; $07BEAC   |
    SBC #$001C          ; $07BEAD   |
    STA $7A36,x         ; $07BEB0   |
    RTL                 ; $07BEB3   |

; gsu table
DATA_07BEB4:         dw $FFF0, $FFFB, $FFEA, $FFF5
DATA_07BEBC:         dw $FFE4, $FFEF, $FFDE, $FFE9
DATA_07BEC4:         dw $FFD8, $FFE3, $FFD2, $FFDD
DATA_07BECC:         dw $FFCC, $FFD7, $FFC6, $FFD1
DATA_07BED4:         dw $FFC0, $FFCB, $FFBA, $FFC5
DATA_07BEDC:         dw $FFB4, $FFBF, $FFAE, $FFB9
DATA_07BEE4:         dw $FFA8, $FFB3, $FFA2, $FFAD
DATA_07BEEC:         dw $FF9C, $FFA7, $FF96, $FFA1
DATA_07BEF4:         dw $FF90, $FF9B, $FF8A, $FF95

.main_spray_fish
    LDY $74A2,x         ; $07BEFC   |
    BMI CODE_07BF23     ; $07BEFF   |
    LDA $7402,x         ; $07BF01   |
    STA $3002           ; $07BF04   |
    LDA $16,x           ; $07BF07   |
    STA $3004           ; $07BF09   |
    LDA #$BEB4          ; $07BF0C   |
    STA $3006           ; $07BF0F   |
    LDA #$0007          ; $07BF12   |
    STA $3008           ; $07BF15   |
    LDX #$08            ; $07BF18   |
    LDA #$9332          ; $07BF1A   |
    JSL $7EDE44         ; $07BF1D   | GSU init
    LDX $12             ; $07BF21   |

CODE_07BF23:
    JSL $03AF23         ; $07BF23   |
    LDA $18,x           ; $07BF27   |
    TAX                 ; $07BF29   |
    JMP ($BF2D,x)       ; $07BF2A   |

DATA_07BF2D:         dw $BF39
DATA_07BF2F:         dw $BFBF
DATA_07BF31:         dw $BFF3
DATA_07BF33:         dw $C04E
DATA_07BF35:         dw $C0B1
DATA_07BF37:         dw $C0DD

    LDX $12             ; $07BF39   |
    LDA $77C2,x         ; $07BF3B   |
    AND #$00FF          ; $07BF3E   |
    STA $7400,x         ; $07BF41   |
    LDA $7A96,x         ; $07BF44   |
    BNE CODE_07BF81     ; $07BF47   |
    LDA $7C18,x         ; $07BF49   |
    SEC                 ; $07BF4C   |
    SBC #$0018          ; $07BF4D   |
    CMP #$00A0          ; $07BF50   |
    BCS CODE_07BF81     ; $07BF53   |
    LDY $77C2,x         ; $07BF55   |
    DEY                 ; $07BF58   |
    BMI CODE_07BF5F     ; $07BF59   |
    EOR #$FFFF          ; $07BF5B   |
    INC A               ; $07BF5E   |

CODE_07BF5F:
    CLC                 ; $07BF5F   |
    ADC $608C           ; $07BF60   |
    CMP $76,x           ; $07BF63   |
    BPL CODE_07BF6B     ; $07BF65   |
    LDA $76,x           ; $07BF67   |
    BRA CODE_07BF71     ; $07BF69   |

CODE_07BF6B:
    CMP $78,x           ; $07BF6B   |
    BMI CODE_07BF71     ; $07BF6D   |
    LDA $78,x           ; $07BF6F   |

CODE_07BF71:
    STA $70E2,x         ; $07BF71   |
    SEC                 ; $07BF74   |
    SBC $608C           ; $07BF75   |
    CLC                 ; $07BF78   |
    ADC #$0020          ; $07BF79   |
    CMP #$0040          ; $07BF7C   |
    BCS CODE_07BF82     ; $07BF7F   |

CODE_07BF81:
    RTL                 ; $07BF81   |

CODE_07BF82:
    LDA #$01BA          ; $07BF82   |
    JSL $008B21         ; $07BF85   |
    LDA $70E2,x         ; $07BF89   |
    STA $70A2,y         ; $07BF8C   |
    LDA $7A36,x         ; $07BF8F   |
    STA $7142,y         ; $07BF92   |
    LDA #$001A          ; $07BF95   |
    STA $7E4C,y         ; $07BF98   |
    LDA #$0003          ; $07BF9B   |
    STA $7782,y         ; $07BF9E   |
    LDA #$0061          ; $07BFA1   |\ play sound #$0061
    JSL $0085D2         ; $07BFA4   |/
    LDA #$0018          ; $07BFA8   |
    STA $7A96,x         ; $07BFAB   |
    LDA $7A38,x         ; $07BFAE   |
    STA $7182,x         ; $07BFB1   |
    LDA #$FF00          ; $07BFB4   |
    STA $7222,x         ; $07BFB7   |
    INC $18,x           ; $07BFBA   |
    INC $18,x           ; $07BFBC   |
    RTL                 ; $07BFBE   |

    LDX $12             ; $07BFBF   |
    LDA $7A96,x         ; $07BFC1   |
    BNE CODE_07BFDC     ; $07BFC4   |
    STZ $7222,x         ; $07BFC6   |
    INC $7402,x         ; $07BFC9   |
    LDA #$0030          ; $07BFCC   |
    STA $7A98,x         ; $07BFCF   |
    LDA #$00D1          ; $07BFD2   |
    STA $7AF6,x         ; $07BFD5   |
    INC $18,x           ; $07BFD8   |
    INC $18,x           ; $07BFDA   |

CODE_07BFDC:
    JSR CODE_07C285     ; $07BFDC   |
    RTL                 ; $07BFDF   |

DATA_07BFE0:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_07BFE8:         db $01, $01, $01, $01, $01, $01, $01, $01
DATA_07BFF0:         db $01, $01, $C0

    LDX $12             ; $07BFF3   |
    LDA $7A98,x         ; $07BFF5   |
    BNE CODE_07BFDC     ; $07BFF8   |
    LDA #$0002          ; $07BFFA   |
    STA $7402,x         ; $07BFFD   |
    LDA $14             ; $07C000   |
    AND #$0003          ; $07C002   |
    BNE CODE_07C00E     ; $07C005   |
    LDA #$0051          ; $07C007   |\ play sound #$0051
    JSL $0085D2         ; $07C00A   |/

CODE_07C00E:
    LDA $7AF6,x         ; $07C00E   |
    BEQ CODE_07C046     ; $07C011   |
    JSL $07C192         ; $07C013   |
    LDA $16,x           ; $07C017   |
    CMP #$0012          ; $07C019   |
    BEQ CODE_07C026     ; $07C01C   |
    LDA $7A96,x         ; $07C01E   |
    CMP #$0002          ; $07C021   |
    BCS CODE_07C02B     ; $07C024   |

CODE_07C026:
    LDA $7A96,x         ; $07C026   |
    BNE CODE_07C03F     ; $07C029   |

CODE_07C02B:
    LDA $16,x           ; $07C02B   |
    CMP #$0012          ; $07C02D   |
    BCS CODE_07C046     ; $07C030   |
    INC A               ; $07C032   |
    STA $16,x           ; $07C033   |
    TAY                 ; $07C035   |
    LDA $BFE0,y         ; $07C036   |
    AND #$00FF          ; $07C039   |
    STA $7A96,x         ; $07C03C   |

CODE_07C03F:
    JSR CODE_07C11A     ; $07C03F   |
    JSR CODE_07C285     ; $07C042   |
    RTL                 ; $07C045   |

CODE_07C046:
    INC $18,x           ; $07C046   |
    INC $18,x           ; $07C048   |
    JSR CODE_07C285     ; $07C04A   |
    RTL                 ; $07C04D   |

    LDX $12             ; $07C04E   |
    LDA $16,x           ; $07C050   |
    BEQ CODE_07C09D     ; $07C052   |
    JSR CODE_07C11A     ; $07C054   |
    LDA $7A98,x         ; $07C057   |
    BNE CODE_07C0AD     ; $07C05A   |
    DEC $16,x           ; $07C05C   |
    BNE CODE_07C095     ; $07C05E   |
    LDA #$01BA          ; $07C060   |
    JSL $008B21         ; $07C063   |
    LDA $70E2,x         ; $07C067   |
    STA $70A2,y         ; $07C06A   |
    LDA $7A36,x         ; $07C06D   |
    STA $7142,y         ; $07C070   |
    LDA #$001A          ; $07C073   |
    STA $7E4C,y         ; $07C076   |
    LDA #$0003          ; $07C079   |
    STA $7782,y         ; $07C07C   |
    LDA #$0061          ; $07C07F   |\ play sound #$0061
    JSL $0085D2         ; $07C082   |/
    LDA #$0018          ; $07C086   |
    STA $7A96,x         ; $07C089   |
    LDA #$0100          ; $07C08C   |
    STA $7222,x         ; $07C08F   |
    STZ $7402,x         ; $07C092   |

CODE_07C095:
    LDA #$0001          ; $07C095   |
    STA $7A98,x         ; $07C098   |
    BRA CODE_07C0AD     ; $07C09B   |

CODE_07C09D:
    LDA $7A96,x         ; $07C09D   |
    BNE CODE_07C0AD     ; $07C0A0   |
    LDA #$0040          ; $07C0A2   |
    STA $7A96,x         ; $07C0A5   |
    STZ $7222,x         ; $07C0A8   |
    STZ $18,x           ; $07C0AB   |

CODE_07C0AD:
    JSR CODE_07C285     ; $07C0AD   |
    RTL                 ; $07C0B0   |

    LDX $12             ; $07C0B1   |
    LDA $16,x           ; $07C0B3   |
    BEQ CODE_07C0BD     ; $07C0B5   |
    DEC $16,x           ; $07C0B7   |
    JSR CODE_07C11A     ; $07C0B9   |
    RTL                 ; $07C0BC   |

CODE_07C0BD:
    LDA #$0000          ; $07C0BD   |
    STA $7402,x         ; $07C0C0   |
    LDA $7A38,x         ; $07C0C3   |
    CMP $7182,x         ; $07C0C6   |
    BPL CODE_07C0D9     ; $07C0C9   |
    STA $7182,x         ; $07C0CB   |
    LDA #$0140          ; $07C0CE   |
    STA $7A96,x         ; $07C0D1   |
    INC $18,x           ; $07C0D4   |
    INC $18,x           ; $07C0D6   |
    RTL                 ; $07C0D8   |

CODE_07C0D9:
    INC $7182,x         ; $07C0D9   |
    RTL                 ; $07C0DC   |

    LDX $12             ; $07C0DD   |
    LDA $7A96,x         ; $07C0DF   |
    BNE CODE_07C0EF     ; $07C0E2   |
    LDA #$0040          ; $07C0E4   |
    STA $7A96,x         ; $07C0E7   |
    STZ $7222,x         ; $07C0EA   |
    STZ $18,x           ; $07C0ED   |

CODE_07C0EF:
    RTL                 ; $07C0EF   |

DATA_07C0F0:         dw $0001, $0001, $0001, $0001
DATA_07C0F8:         dw $0001, $0001, $0001, $0001
DATA_07C100:         dw $0001, $0001, $0001, $0001
DATA_07C108:         dw $0001, $0001, $0001, $0001
DATA_07C110:         dw $0001, $0001, $0003, $FC00
DATA_07C118:         dw $0400

CODE_07C11A:
    LDA $16,x           ; $07C11A   |
    ASL A               ; $07C11C   |
    TAY                 ; $07C11D   |
    LDA $14             ; $07C11E   |
    AND $C0F0,y         ; $07C120   |
    BNE CODE_07C189     ; $07C123   |
    LDY $7400,x         ; $07C125   |
    LDA $C116,y         ; $07C128   |
    STA $00             ; $07C12B   |
    LDA $16,x           ; $07C12D   |
    DEC A               ; $07C12F   |
    ASL A               ; $07C130   |
    ASL A               ; $07C131   |
    TAY                 ; $07C132   |
    LDA $BEB4,y         ; $07C133   |
    PHY                 ; $07C136   |
    LDY $7400,x         ; $07C137   |
    BEQ CODE_07C140     ; $07C13A   |
    EOR #$FFFF          ; $07C13C   |
    INC A               ; $07C13F   |

CODE_07C140:
    PLY                 ; $07C140   |
    CLC                 ; $07C141   |
    ADC $70E2,x         ; $07C142   |
    STA $02             ; $07C145   |
    INY                 ; $07C147   |
    INY                 ; $07C148   |
    LDA $7182,x         ; $07C149   |
    CLC                 ; $07C14C   |
    ADC $BEB4,y         ; $07C14D   |
    STA $04             ; $07C150   |
    LDA #$0206          ; $07C152   |
    JSL $008B21         ; $07C155   |
    LDA $7002,y         ; $07C159   |
    ORA #$0006          ; $07C15C   |
    STA $7002,y         ; $07C15F   |
    LDA $7400,x         ; $07C162   |
    STA $73C0,y         ; $07C165   |
    LDA $02             ; $07C168   |
    STA $70A2,y         ; $07C16A   |
    LDA $04             ; $07C16D   |
    STA $7142,y         ; $07C16F   |
    LDA $00             ; $07C172   |
    STA $71E0,y         ; $07C174   |
    LDA #$FC00          ; $07C177   |
    STA $71E2,y         ; $07C17A   |
    LDA #$0010          ; $07C17D   |
    STA $7782,y         ; $07C180   |
    LDA #$0002          ; $07C183   |
    STA $73C2,y         ; $07C186   |

CODE_07C189:
    RTS                 ; $07C189   |

DATA_07C18A:         dw $FE00, $0200

DATA_07C18E:         dw $0180, $0060

    LDA #$0007          ; $07C192   |
    STA $3000           ; $07C195   |
    LDA #$BEB4          ; $07C198   |
    STA $3002           ; $07C19B   |
    LDA $16,x           ; $07C19E   |
    STA $3018           ; $07C1A0   |
    LDX #$A908          ; $07C1A3   |
    ROL $94,x           ; $07C1A6   |
    JSL $7EDE44         ; $07C1A8   | GSU init
    LDX $12             ; $07C1AC   |
    LDA $3016           ; $07C1AE   |
    BPL CODE_07C1B6     ; $07C1B1   |
    JMP CODE_07C284     ; $07C1B3   |

CODE_07C1B6:
    STA $16,x           ; $07C1B6   |
    DEC A               ; $07C1B8   |
    ASL A               ; $07C1B9   |
    ASL A               ; $07C1BA   |
    TAY                 ; $07C1BB   |
    LDA $BEB4,y         ; $07C1BC   |
    PHY                 ; $07C1BF   |
    LDY $7400,x         ; $07C1C0   |
    BEQ CODE_07C1C9     ; $07C1C3   |
    EOR #$FFFF          ; $07C1C5   |
    INC A               ; $07C1C8   |

CODE_07C1C9:
    PLY                 ; $07C1C9   |
    CLC                 ; $07C1CA   |
    ADC $70E2,x         ; $07C1CB   |
    STA $00             ; $07C1CE   |
    INY                 ; $07C1D0   |
    INY                 ; $07C1D1   |
    LDA $7182,x         ; $07C1D2   |
    CLC                 ; $07C1D5   |
    ADC $BEB4,y         ; $07C1D6   |
    STA $02             ; $07C1D9   |
    LDA $7AF8,x         ; $07C1DB   |
    BNE CODE_07C203     ; $07C1DE   |
    LDA #$0004          ; $07C1E0   |
    STA $7AF8,x         ; $07C1E3   |
    LDA #$0204          ; $07C1E6   |
    JSL $008B21         ; $07C1E9   |
    LDA $00             ; $07C1ED   |
    STA $70A2,y         ; $07C1EF   |
    LDA $02             ; $07C1F2   |
    STA $7142,y         ; $07C1F4   |
    LDA #$0002          ; $07C1F7   |
    STA $7782,y         ; $07C1FA   |
    LDA #$0001          ; $07C1FD   |
    STA $73C2,y         ; $07C200   |

CODE_07C203:
    LDA $10             ; $07C203   |
    AND #$0003          ; $07C205   |
    XBA                 ; $07C208   |
    LSR A               ; $07C209   |
    CLC                 ; $07C20A   |
    ADC #$0100          ; $07C20B   |
    STA $04             ; $07C20E   |
    LDA $10             ; $07C210   |
    AND #$0001          ; $07C212   |
    BEQ CODE_07C21F     ; $07C215   |
    LDA $04             ; $07C217   |
    EOR #$FFFF          ; $07C219   |
    INC A               ; $07C21C   |
    STA $04             ; $07C21D   |

CODE_07C21F:
    LDA $10             ; $07C21F   |
    AND #$000C          ; $07C221   |
    XBA                 ; $07C224   |
    LSR A               ; $07C225   |
    LSR A               ; $07C226   |
    LSR A               ; $07C227   |
    CLC                 ; $07C228   |
    ADC #$0100          ; $07C229   |
    STA $06             ; $07C22C   |
    LDA $10             ; $07C22E   |
    AND #$0100          ; $07C230   |
    BNE CODE_07C23D     ; $07C233   |
    LDA $06             ; $07C235   |
    EOR #$FFFF          ; $07C237   |
    INC A               ; $07C23A   |
    STA $06             ; $07C23B   |

CODE_07C23D:
    LDA #$0205          ; $07C23D   |
    JSL $008B21         ; $07C240   |
    LDA $7002,y         ; $07C244   |
    ORA #$0006          ; $07C247   |
    STA $7002,y         ; $07C24A   |
    LDA $00             ; $07C24D   |
    STA $70A2,y         ; $07C24F   |
    LDA $02             ; $07C252   |
    STA $7142,y         ; $07C254   |
    LDA $04             ; $07C257   |
    STA $71E0,y         ; $07C259   |
    STA $71E2,y         ; $07C25C   |
    LDA #$0006          ; $07C25F   |
    STA $7782,y         ; $07C262   |
    LDA #$0002          ; $07C265   |
    STA $73C2,y         ; $07C268   |
    LDY $7400,x         ; $07C26B   |
    LDA $60FC           ; $07C26E   |
    AND $C18E,y         ; $07C271   |
    BNE CODE_07C27F     ; $07C274   |
    LDA $C18A,y         ; $07C276   |
    STA $60A8           ; $07C279   |
    STA $60B4           ; $07C27C   |

CODE_07C27F:
    PLY                 ; $07C27F   |
    PLA                 ; $07C280   |
    JSR CODE_07C285     ; $07C281   |

CODE_07C284:
    RTL                 ; $07C284   |

CODE_07C285:
    LDY $7D36,x         ; $07C285   |
    BMI CODE_07C2AF     ; $07C288   |
    DEY                 ; $07C28A   |
    BMI CODE_07C2AE     ; $07C28B   |
    BEQ CODE_07C2AE     ; $07C28D   |
    LDA $6F00,y         ; $07C28F   |
    CMP #$0010          ; $07C292   |
    BNE CODE_07C2AE     ; $07C295   |
    LDA $7D38,y         ; $07C297   |
    BEQ CODE_07C2AE     ; $07C29A   |
    TYX                 ; $07C29C   |
    JSL $03B24B         ; $07C29D   |
    LDX $12             ; $07C2A1   |
    LDA #$0008          ; $07C2A3   |
    STA $18,x           ; $07C2A6   |
    STZ $7222,x         ; $07C2A8   |
    STZ $7542,x         ; $07C2AB   |

CODE_07C2AE:
    RTS                 ; $07C2AE   |

CODE_07C2AF:
    LDA $7C18,x         ; $07C2AF   |
    SEC                 ; $07C2B2   |
    SBC $6122           ; $07C2B3   |
    SEC                 ; $07C2B6   |
    SBC $7BB8,x         ; $07C2B7   |
    CMP #$FFF8          ; $07C2BA   |
    BCC CODE_07C2C5     ; $07C2BD   |
    JSL $03B20B         ; $07C2BF   |
    BRA CODE_07C2C9     ; $07C2C3   |

CODE_07C2C5:
    JSL $03A858         ; $07C2C5   |

CODE_07C2C9:
    RTS                 ; $07C2C9   |

DATA_07C2CA:         dw $FFFF, $0005

DATA_07C2CE:         dw $0030, $0060

DATA_07C2D2:         dw $0000, $0100

.init_wall_lakitu
    LDA $70E2,x         ; $07C2D6   |
    AND #$0010          ; $07C2D9   |
    LSR A               ; $07C2DC   |
    LSR A               ; $07C2DD   |
    LSR A               ; $07C2DE   |
    STA $16,x           ; $07C2DF   |
    TAY                 ; $07C2E1   |
    LDA $C2CA,y         ; $07C2E2   |
    STA $74A2,x         ; $07C2E5   |
    LDA $C2CE,y         ; $07C2E8   |
    STA $7A96,x         ; $07C2EB   |
    LDA $7040,x         ; $07C2EE   |
    AND #$FEFF          ; $07C2F1   |
    ORA $C2D2,y         ; $07C2F4   |
    STA $7040,x         ; $07C2F7   |
    LDA #$0000          ; $07C2FA   |
    STA $7402,x         ; $07C2FD   |
    LDA $7182,x         ; $07C300   |
    CLC                 ; $07C303   |
    ADC #$000B          ; $07C304   |
    STA $7182,x         ; $07C307   |
    RTL                 ; $07C30A   |

    LDA $00             ; $07C30B   |
    STA $70E2,y         ; $07C30D   |
    LDA $02             ; $07C310   |
    CLC                 ; $07C312   |
    ADC #$000B          ; $07C313   |
    STA $7182,y         ; $07C316   |
    LDA #$FFFF          ; $07C319   |
    STA $74A2,y         ; $07C31C   |
    LDA #$0030          ; $07C31F   |
    STA $7A96,y         ; $07C322   |
    LDA $7040,y         ; $07C325   |
    AND #$FEFF          ; $07C328   |
    STA $7040,y         ; $07C32B   |
    LDA #$0000          ; $07C32E   |
    STA $7402,y         ; $07C331   |
    LDA #$0001          ; $07C334   |
    STA $79D8,y         ; $07C337   |
    LDA $7040,y         ; $07C33A   |
    AND #$FFF3          ; $07C33D   |
    STA $7040,y         ; $07C340   |
    RTL                 ; $07C343   |

.main_wall_lakitu
    LDA $6F00,x         ; $07C344   |
    CMP #$0010          ; $07C347   |
    BNE CODE_07C351     ; $07C34A   |
    LDA $7D38,x         ; $07C34C   |
    BEQ CODE_07C373     ; $07C34F   |

CODE_07C351:
    LDA #$0010          ; $07C351   |
    STA $7402,x         ; $07C354   |
    LDA $79D8,x         ; $07C357   |
    BEQ CODE_07C39D     ; $07C35A   |
    LDA #$0040          ; $07C35C   |
    STA $0CD6           ; $07C35F   |
    DEC $0C4E           ; $07C362   |
    STZ $79D8,x         ; $07C365   |
    LDA $7040,x         ; $07C368   |
    ORA #$0004          ; $07C36B   |
    STA $7040,x         ; $07C36E   |
    BRA CODE_07C39D     ; $07C371   |

CODE_07C373:
    LDY $74A2,x         ; $07C373   |
    BMI CODE_07C39D     ; $07C376   |
    LDA $7402,x         ; $07C378   |
    CMP #$000E          ; $07C37B   |
    BNE CODE_07C39D     ; $07C37E   |
    LDA $14             ; $07C380   |
    AND #$0006          ; $07C382   |
    TAY                 ; $07C385   |
    LDA $A9BE,y         ; $07C386   |
    STA $00             ; $07C389   |
    REP #$10            ; $07C38B   |
    LDY $7362,x         ; $07C38D   |
    LDA $6004,y         ; $07C390   |
    AND #$F1FF          ; $07C393   |
    ORA $00             ; $07C396   |
    STA $6004,y         ; $07C398   |
    SEP #$10            ; $07C39B   |

CODE_07C39D:
    JSL $03AF23         ; $07C39D   |
    LDA $16,x           ; $07C3A1   |
    TAX                 ; $07C3A3   |
    JMP ($C3A7,x)       ; $07C3A4   |

DATA_07C3A7:         dw $C3AB
DATA_07C3A9:         dw $C3CF

    LDX $12             ; $07C3AB   |
    LDA $79D8,x         ; $07C3AD   |
    BEQ CODE_07C3BF     ; $07C3B0   |
    JSL $07FC64         ; $07C3B2   |
    BCC CODE_07C3BF     ; $07C3B6   |
    DEC $0C4E           ; $07C3B8   |
    JMP CODE_0703A3     ; $07C3BB   |

CODE_07C3BF:
    LDA $18,x           ; $07C3BF   |
    TAX                 ; $07C3C1   |
    JMP ($C3C5,x)       ; $07C3C2   |

DATA_07C3C5:         dw $C3DB
DATA_07C3C7:         dw $C467
DATA_07C3C9:         dw $C40B
DATA_07C3CB:         dw $C50C
DATA_07C3CD:         dw $C4A1

    LDX $12             ; $07C3CF   |
    LDA $18,x           ; $07C3D1   |
    TAX                 ; $07C3D3   |
    JMP ($C3D7,x)       ; $07C3D4   |

DATA_07C3D7:         dw $C40B
DATA_07C3D9:         dw $C50C

    LDX $12             ; $07C3DB   |
    LDA $7A96,x         ; $07C3DD   |
    BNE CODE_07C40A     ; $07C3E0   |
    LDA #$0005          ; $07C3E2   |
    STA $74A2,x         ; $07C3E5   |
    LDA $7040,x         ; $07C3E8   |
    ORA #$0100          ; $07C3EB   |
    STA $7040,x         ; $07C3EE   |
    LDA #$0003          ; $07C3F1   |
    STA $76,x           ; $07C3F4   |
    TAY                 ; $07C3F6   |
    LDA $C467,y         ; $07C3F7   |
    AND #$00FF          ; $07C3FA   |
    STA $7402,x         ; $07C3FD   |
    LDA #$0003          ; $07C400   |
    STA $7A96,x         ; $07C403   |
    INC $18,x           ; $07C406   |
    INC $18,x           ; $07C408   |

CODE_07C40A:
    RTL                 ; $07C40A   |

    LDX $12             ; $07C40B   |
    LDA $7A96,x         ; $07C40D   |
    BNE CODE_07C43C     ; $07C410   |
    LDA $7680,x         ; $07C412   |
    ORA $7682,x         ; $07C415   |
    AND #$FF00          ; $07C418   |
    BNE CODE_07C43C     ; $07C41B   |
    LDA #$0012          ; $07C41D   |
    STA $76,x           ; $07C420   |
    TAY                 ; $07C422   |
    LDA $C4E6,y         ; $07C423   |
    AND #$00FF          ; $07C426   |
    STA $7402,x         ; $07C429   |
    LDA $C4F9,y         ; $07C42C   |
    AND #$00FF          ; $07C42F   |
    STA $7A96,x         ; $07C432   |
    INC $18,x           ; $07C435   |
    INC $18,x           ; $07C437   |
    JMP CODE_07C5D8     ; $07C439   |

CODE_07C43C:
    LDA $7A98,x         ; $07C43C   |
    BNE CODE_07C464     ; $07C43F   |
    LDA $7A36,x         ; $07C441   |
    BEQ CODE_07C44B     ; $07C444   |
    STZ $7A36,x         ; $07C446   |
    BRA CODE_07C455     ; $07C449   |

CODE_07C44B:
    LDA $10             ; $07C44B   |
    AND #$000F          ; $07C44D   |
    BNE CODE_07C464     ; $07C450   |
    INC $7A36,x         ; $07C452   |

CODE_07C455:
    LDA #$0010          ; $07C455   |
    STA $7A98,x         ; $07C458   |
    LDA $7400,x         ; $07C45B   |
    EOR #$0002          ; $07C45E   |
    STA $7400,x         ; $07C461   |

CODE_07C464:
    JMP CODE_07C5D8     ; $07C464   |

DATA_07C467:         db $01, $03, $04, $05

    LDX $12             ; $07C46B   |
    LDA $7A96,x         ; $07C46D   |
    BNE CODE_07C487     ; $07C470   |
    DEC $76,x           ; $07C472   |
    BMI CODE_07C48A     ; $07C474   |
    LDY $76,x           ; $07C476   |
    LDA $C467,y         ; $07C478   |
    AND #$00FF          ; $07C47B   |
    STA $7402,x         ; $07C47E   |
    LDA #$0003          ; $07C481   |
    STA $7A96,x         ; $07C484   |

CODE_07C487:
    JMP CODE_07C5D8     ; $07C487   |

CODE_07C48A:
    LDA #$0000          ; $07C48A   |
    STA $7402,x         ; $07C48D   |
    LDA #$0060          ; $07C490   |
    STA $7A96,x         ; $07C493   |
    INC $18,x           ; $07C496   |
    INC $18,x           ; $07C498   |
    JMP CODE_07C5D8     ; $07C49A   |

DATA_07C49D:         db $05, $04, $03, $01

    LDX $12             ; $07C4A1   |
    LDA $7A96,x         ; $07C4A3   |
    BNE CODE_07C4BD     ; $07C4A6   |
    DEC $76,x           ; $07C4A8   |
    BMI CODE_07C4C0     ; $07C4AA   |
    LDY $76,x           ; $07C4AC   |
    LDA $C49D,y         ; $07C4AE   |
    AND #$00FF          ; $07C4B1   |
    STA $7402,x         ; $07C4B4   |
    LDA #$0003          ; $07C4B7   |
    STA $7A96,x         ; $07C4BA   |

CODE_07C4BD:
    JMP CODE_07C5D8     ; $07C4BD   |

CODE_07C4C0:
    LDA $79D8,x         ; $07C4C0   |
    BNE CODE_07C4DF     ; $07C4C3   |
    STZ $76,x           ; $07C4C5   |
    LDA #$0030          ; $07C4C7   |
    STA $7A96,x         ; $07C4CA   |
    LDA #$FFFF          ; $07C4CD   |
    STA $74A2,x         ; $07C4D0   |
    LDA $7040,x         ; $07C4D3   |
    AND #$FEFF          ; $07C4D6   |
    STA $7040,x         ; $07C4D9   |
    STZ $18,x           ; $07C4DC   |
    RTL                 ; $07C4DE   |

CODE_07C4DF:
    DEC $0C4E           ; $07C4DF   |
    JMP CODE_0703A3     ; $07C4E2   |

DATA_07C4E6:         db $0F, $0E, $0B, $0D, $0B, $0C, $0B, $0A
DATA_07C4EE:         db $09, $08, $07, $06, $04, $03, $02, $03
DATA_07C4F6:         db $02, $03, $02

DATA_07C4F9:         db $20, $40, $10, $06, $02, $02, $02, $02
DATA_07C501:         db $02, $02, $02, $02, $0C, $08, $08, $08
DATA_07C509:         db $08, $08, $08

    LDX $12             ; $07C50C   |
    LDA $7680,x         ; $07C50E   |
    ORA $7682,x         ; $07C511   |
    AND #$FF00          ; $07C514   |
    BEQ CODE_07C51C     ; $07C517   |
    JMP CODE_07C5A9     ; $07C519   |

CODE_07C51C:
    LDA $76,x           ; $07C51C   |
    CMP #$0002          ; $07C51E   |
    BCC CODE_07C52C     ; $07C521   |
    LDA $77C2,x         ; $07C523   |
    AND #$00FF          ; $07C526   |
    STA $7400,x         ; $07C529   |

CODE_07C52C:
    LDA $7A96,x         ; $07C52C   |
    BNE CODE_07C582     ; $07C52F   |
    DEC $76,x           ; $07C531   |
    BMI CODE_07C5A9     ; $07C533   |
    LDY $76,x           ; $07C535   |
    LDA $C4E6,y         ; $07C537   |
    AND #$00FF          ; $07C53A   |
    STA $7402,x         ; $07C53D   |
    LDA $C4F9,y         ; $07C540   |
    AND #$00FF          ; $07C543   |
    STA $7A96,x         ; $07C546   |
    CPY #$01            ; $07C549   |
    BNE CODE_07C566     ; $07C54B   |
    LDA $611C           ; $07C54D   |
    SEC                 ; $07C550   |
    SBC #$0008          ; $07C551   |
    STA $7900,x         ; $07C554   |
    LDA $611E           ; $07C557   |
    SEC                 ; $07C55A   |
    SBC #$0008          ; $07C55B   |
    STA $7902,x         ; $07C55E   |
    STZ $7A38,x         ; $07C561   |
    BRA CODE_07C588     ; $07C564   |

CODE_07C566:
    CPY #$00            ; $07C566   |
    BNE CODE_07C582     ; $07C568   |
    LDA $7900,x         ; $07C56A   |
    STA $00             ; $07C56D   |
    LDA $7902,x         ; $07C56F   |
    STA $02             ; $07C572   |
    LDA $7A38,x         ; $07C574   |
    STA $04             ; $07C577   |
    JSL $07FCB3         ; $07C579   |
    JSR CODE_07C632     ; $07C57D   |
    BRA CODE_07C5A7     ; $07C580   |

CODE_07C582:
    LDY $76,x           ; $07C582   |
    CPY #$01            ; $07C584   |
    BNE CODE_07C5A7     ; $07C586   |

CODE_07C588:
    LDA $7900,x         ; $07C588   |
    STA $00             ; $07C58B   |
    LDA $7902,x         ; $07C58D   |
    STA $02             ; $07C590   |
    LDA $7A38,x         ; $07C592   |
    STA $04             ; $07C595   |
    JSL $07FCB8         ; $07C597   |
    LDA $7A38,x         ; $07C59B   |
    INC A               ; $07C59E   |
    CMP #$0020          ; $07C59F   |
    BCS CODE_07C5A7     ; $07C5A2   |
    STA $7A38,x         ; $07C5A4   |

CODE_07C5A7:
    BRA CODE_07C5D8     ; $07C5A7   |

CODE_07C5A9:
    LDA $16,x           ; $07C5A9   |
    BEQ CODE_07C5BF     ; $07C5AB   |
    LDA #$0000          ; $07C5AD   |
    STA $7402,x         ; $07C5B0   |
    LDA #$0060          ; $07C5B3   |
    STA $7A96,x         ; $07C5B6   |
    STZ $76,x           ; $07C5B9   |
    STZ $18,x           ; $07C5BB   |
    BRA CODE_07C5D8     ; $07C5BD   |

CODE_07C5BF:
    LDA #$0003          ; $07C5BF   |
    STA $76,x           ; $07C5C2   |
    TAY                 ; $07C5C4   |
    LDA $C49D,y         ; $07C5C5   |
    AND #$00FF          ; $07C5C8   |
    STA $7402,x         ; $07C5CB   |
    LDA #$0003          ; $07C5CE   |
    STA $7A96,x         ; $07C5D1   |
    INC $18,x           ; $07C5D4   |
    INC $18,x           ; $07C5D6   |

CODE_07C5D8:
    LDY $7D36,x         ; $07C5D8   |
    BMI CODE_07C5F9     ; $07C5DB   |
    DEY                 ; $07C5DD   |
    BMI CODE_07C5F8     ; $07C5DE   |
    BEQ CODE_07C5F8     ; $07C5E0   |
    LDA $6F00,y         ; $07C5E2   |
    CMP #$0010          ; $07C5E5   |
    BNE CODE_07C5F8     ; $07C5E8   |
    LDA $7D38,y         ; $07C5EA   |
    BEQ CODE_07C5F8     ; $07C5ED   |
    TYX                 ; $07C5EF   |
    JSL $03B24B         ; $07C5F0   |
    LDX $12             ; $07C5F4   |
    BRA CODE_07C60C     ; $07C5F6   |

CODE_07C5F8:
    RTL                 ; $07C5F8   |

CODE_07C5F9:
    JSL $07FC2F         ; $07C5F9   |
    BEQ CODE_07C5F8     ; $07C5FD   |
    BCC CODE_07C5F8     ; $07C5FF   |
    JSL $03B20B         ; $07C601   |
    LDA #$001C          ; $07C605   |\ play sound #$001C
    JSL $0085D2         ; $07C608   |/

CODE_07C60C:
    LDA #$FC00          ; $07C60C   |
    STA $7222,x         ; $07C60F   |
    LDA #$0040          ; $07C612   |
    STA $7542,x         ; $07C615   |
    LDA #$0010          ; $07C618   |
    STA $7402,x         ; $07C61B   |
    LDA #$000E          ; $07C61E   |
    STA $6F00,x         ; $07C621   |
    SEP #$20            ; $07C624   |
    LDA #$FF            ; $07C626   |
    STA $74A0,x         ; $07C628   |
    REP #$20            ; $07C62B   |
    RTL                 ; $07C62D   |

    JMP CODE_0703A8     ; $07C62E   |

CODE_07C632:
    LDA $7900,x         ; $07C632   |
    STA $3002           ; $07C635   |
    LDA $7902,x         ; $07C638   |
    STA $3004           ; $07C63B   |
    LDY $7400,x         ; $07C63E   |
    LDA $7CD6,x         ; $07C641   |
    CLC                 ; $07C644   |
    ADC $AA89,y         ; $07C645   |
    STA $00             ; $07C648   |
    STA $3006           ; $07C64A   |
    LDA $7CD8,x         ; $07C64D   |
    STA $3008           ; $07C650   |
    LDA #$0380          ; $07C653   |
    STA $300C           ; $07C656   |
    LDX #$09            ; $07C659   |
    LDA #$907C          ; $07C65B   |
    JSL $7EDE44         ; $07C65E   | GSU init
    LDX $12             ; $07C662   |
    LDA #$011D          ; $07C664   |
    JSL $03A34C         ; $07C667   |
    BCC CODE_07C688     ; $07C66B   |
    LDA $3002           ; $07C66D   |
    STA $7220,y         ; $07C670   |
    LDA $3004           ; $07C673   |
    STA $7222,y         ; $07C676   |
    LDA $00             ; $07C679   |
    STA $70E2,y         ; $07C67B   |
    LDA $7182,x         ; $07C67E   |
    SEC                 ; $07C681   |
    SBC #$0008          ; $07C682   |
    STA $7182,y         ; $07C685   |

CODE_07C688:
    RTS                 ; $07C688   |

    LDA $79D8,x         ; $07C689   |
    BEQ CODE_07C6A1     ; $07C68C   |
    LDA #$0040          ; $07C68E   |
    STA $0CD6           ; $07C691   |
    JSL $07FC64         ; $07C694   |
    BCC CODE_07C6A1     ; $07C698   |
    DEC $0C4E           ; $07C69A   |
    JMP CODE_0703A3     ; $07C69D   |

CODE_07C6A1:
    RTL                 ; $07C6A1   |

DATA_07C6A2:         dw $FFA0, $0060

.init_grunt_walking

CODE_07C6A6:
    LDY $7400,x         ; $07C6A6   |
    LDA $C6A2,y         ; $07C6A9   |
    STA $7220,x         ; $07C6AC   |
    LDA #$0004          ; $07C6AF   |
    STA $7A96,x         ; $07C6B2   |
    LDA #$0004          ; $07C6B5   |
    STA $18,x           ; $07C6B8   |
    TAY                 ; $07C6BA   |
    LDA $C714,y         ; $07C6BB   |
    AND #$00FF          ; $07C6BE   |
    STA $7402,x         ; $07C6C1   |
    STZ $16,x           ; $07C6C4   |
    RTL                 ; $07C6C6   |

DATA_07C6C7:         dw $FF00, $0100

.init_grunt_running

CODE_07C6CB:
    LDY $7400,x         ; $07C6CB   |
    LDA $C6C7,y         ; $07C6CE   |
    STA $7220,x         ; $07C6D1   |
    LDA #$0003          ; $07C6D4   |
    STA $7A96,x         ; $07C6D7   |
    LDA #$0001          ; $07C6DA   |
    STA $18,x           ; $07C6DD   |
    TAY                 ; $07C6DF   |
    LDA $C73F,y         ; $07C6E0   |
    AND #$00FF          ; $07C6E3   |
    STA $7402,x         ; $07C6E6   |
    STZ $16,x           ; $07C6E9   |
    RTL                 ; $07C6EB   |

.main_grunt_walking
    JSL $03AF23         ; $07C6EC   |
    LDA $16,x           ; $07C6F0   |
    TAX                 ; $07C6F2   |
    JMP ($C6F6,x)       ; $07C6F3   |

DATA_07C6F6:         dw $C719
DATA_07C6F8:         dw $C79D
DATA_07C6FA:         dw $C7EB
DATA_07C6FC:         dw $C76A
DATA_07C6FE:         dw $C83A

.main_grunt_running
    JSL $03AF23         ; $07C700   |
    LDA $16,x           ; $07C704   |
    TAX                 ; $07C706   |
    JMP ($C70A,x)       ; $07C707   |

DATA_07C70A:         dw $C741
DATA_07C70C:         dw $C79D
DATA_07C70E:         dw $C7EB
DATA_07C710:         dw $C76A
DATA_07C712:         dw $C83A

DATA_07C714:         db $04, $03, $02, $01, $00

    LDX $12             ; $07C719   |
    JSL $07C866         ; $07C71B   |
    LDA $7A96,x         ; $07C71F   |
    BNE CODE_07C73E     ; $07C722   |
    DEC $18,x           ; $07C724   |
    BPL CODE_07C72D     ; $07C726   |
    LDA #$0004          ; $07C728   |
    STA $18,x           ; $07C72B   |

CODE_07C72D:
    LDY $18,x           ; $07C72D   |
    LDA $C714,y         ; $07C72F   |
    AND #$00FF          ; $07C732   |
    STA $7402,x         ; $07C735   |
    LDA #$0004          ; $07C738   |
    STA $7A96,x         ; $07C73B   |

CODE_07C73E:
    RTL                 ; $07C73E   |

DATA_07C73F:         db $08, $07

    LDX $12             ; $07C741   |
    JSL $07C866         ; $07C743   |
    LDA #$C73F          ; $07C747   |
    STA $00             ; $07C74A   |

CODE_07C74C:
    LDA $7A96,x         ; $07C74C   |
    BNE CODE_07C767     ; $07C74F   |
    LDA $18,x           ; $07C751   |
    EOR #$0001          ; $07C753   |
    STA $18,x           ; $07C756   |
    TAY                 ; $07C758   |
    LDA ($00),y         ; $07C759   |
    AND #$00FF          ; $07C75B   |
    STA $7402,x         ; $07C75E   |
    LDA #$0003          ; $07C761   |
    STA $7A96,x         ; $07C764   |

CODE_07C767:
    RTL                 ; $07C767   |

DATA_07C768:         db $06, $05

    LDX $12             ; $07C76A   |
    JSL $07C923         ; $07C76C   |
    LDA $79D8,x         ; $07C770   |
    BEQ CODE_07C796     ; $07C773   |
    LDA $7A98,x         ; $07C775   |
    BNE CODE_07C796     ; $07C778   |
    LDA $7400,x         ; $07C77A   |
    EOR #$0002          ; $07C77D   |
    STA $7400,x         ; $07C780   |
    LDA $7220,x         ; $07C783   |
    EOR #$FFFF          ; $07C786   |
    INC A               ; $07C789   |
    STA $7220,x         ; $07C78A   |
    LDA #$0020          ; $07C78D   |
    STA $7A98,x         ; $07C790   |
    DEC $79D8,x         ; $07C793   |

CODE_07C796:
    LDA #$C768          ; $07C796   |
    STA $00             ; $07C799   |
    BRA CODE_07C74C     ; $07C79B   |

    LDX $12             ; $07C79D   |
    LDA $7860,x         ; $07C79F   |
    AND #$0001          ; $07C7A2   |
    BEQ CODE_07C7C8     ; $07C7A5   |
    SEP #$20            ; $07C7A7   |
    LDA #$10            ; $07C7A9   |
    STA $18,x           ; $07C7AB   |
    TAY                 ; $07C7AD   |
    LDA $C7C9,y         ; $07C7AE   |
    STA $7402,x         ; $07C7B1   |
    LDA $C7DA,y         ; $07C7B4   |
    STA $7A96,x         ; $07C7B7   |
    LDA $76,x           ; $07C7BA   |
    STA $7400,x         ; $07C7BC   |
    INC $16,x           ; $07C7BF   |
    INC $16,x           ; $07C7C1   |
    REP #$20            ; $07C7C3   |
    STZ $7220,x         ; $07C7C5   |

CODE_07C7C8:
    RTL                 ; $07C7C8   |

DATA_07C7C9:         db $0D, $0A, $0C, $0A, $0B, $0A, $0C, $0A
DATA_07C7D1:         db $0B, $0A, $0C, $0A, $0B, $0A, $09, $10
DATA_07C7D9:         db $0F

DATA_07C7DA:         db $42, $12, $02, $02, $02, $02, $02, $02
DATA_07C7E2:         db $02, $02, $02, $02, $02, $08, $20, $02
DATA_07C7EA:         db $02

    LDX $12             ; $07C7EB   |
    LDA $7A96,x         ; $07C7ED   |
    BNE CODE_07C808     ; $07C7F0   |
    DEC $18,x           ; $07C7F2   |
    BMI CODE_07C809     ; $07C7F4   |
    SEP #$20            ; $07C7F6   |
    LDY $18,x           ; $07C7F8   |
    LDA $C7C9,y         ; $07C7FA   |
    STA $7402,x         ; $07C7FD   |
    LDA $C7DA,y         ; $07C800   |
    STA $7A96,x         ; $07C803   |
    REP #$20            ; $07C806   |

CODE_07C808:
    RTL                 ; $07C808   |

CODE_07C809:
    LDY $7400,x         ; $07C809   |
    LDA $C6C7,y         ; $07C80C   |
    STA $7220,x         ; $07C80F   |
    LDA #$0003          ; $07C812   |
    STA $7A96,x         ; $07C815   |
    LDA #$0001          ; $07C818   |
    STA $18,x           ; $07C81B   |
    TAY                 ; $07C81D   |
    LDA $C768,y         ; $07C81E   |
    AND #$00FF          ; $07C821   |
    STA $7402,x         ; $07C824   |
    LDA #$0003          ; $07C827   |
    STA $79D8,x         ; $07C82A   |
    INC $16,x           ; $07C82D   |
    INC $16,x           ; $07C82F   |
    RTL                 ; $07C831   |

DATA_07C832:         db $12, $13, $12, $11

DATA_07C836:         db $40, $03, $03, $03

    LDX $12             ; $07C83A   |
    LDA $7A96,x         ; $07C83C   |
    BNE CODE_07C857     ; $07C83F   |
    DEC $18,x           ; $07C841   |
    BMI CODE_07C858     ; $07C843   |
    SEP #$20            ; $07C845   |
    LDY $18,x           ; $07C847   |
    LDA $C832,y         ; $07C849   |
    STA $7402,x         ; $07C84C   |
    LDA $C836,y         ; $07C84F   |
    STA $7A96,x         ; $07C852   |
    REP #$20            ; $07C855   |

CODE_07C857:
    RTL                 ; $07C857   |

CODE_07C858:
    LDA $7360,x         ; $07C858   |
    CMP #$0159          ; $07C85B   |
    BNE CODE_07C863     ; $07C85E   |
    JMP CODE_07C6A6     ; $07C860   |

CODE_07C863:
    JMP CODE_07C6CB     ; $07C863   |

    LDY $7D36,x         ; $07C866   |
    BPL CODE_07C86E     ; $07C869   |
    JMP CODE_07C8F8     ; $07C86B   |

CODE_07C86E:
    DEY                 ; $07C86E   |
    BEQ CODE_07C873     ; $07C86F   |
    BPL CODE_07C876     ; $07C871   |

CODE_07C873:
    JMP CODE_07C8F7     ; $07C873   |

CODE_07C876:
    LDA $6F00,y         ; $07C876   |
    CMP #$0010          ; $07C879   |
    BNE CODE_07C8F7     ; $07C87C   |
    LDA $7D38,y         ; $07C87E   |
    BEQ CODE_07C8F7     ; $07C881   |
    LDA #$000E          ; $07C883   |
    STA $7402,x         ; $07C886   |
    LDA #$FE00          ; $07C889   |
    STA $7222,x         ; $07C88C   |
    LDA $7860,x         ; $07C88F   |
    AND #$FFFE          ; $07C892   |
    STA $7860,x         ; $07C895   |
    LDA $7220,y         ; $07C898   |
    CMP #$8000          ; $07C89B   |
    ROR A               ; $07C89E   |
    CMP #$8000          ; $07C89F   |
    ROR A               ; $07C8A2   |
    STA $7220,x         ; $07C8A3   |
    AND #$8000          ; $07C8A6   |
    ASL A               ; $07C8A9   |
    ROL A               ; $07C8AA   |
    ASL A               ; $07C8AB   |
    STA $76,x           ; $07C8AC   |
    PHY                 ; $07C8AE   |
    JSL $03B53D         ; $07C8AF   |
    PLX                 ; $07C8B3   |
    JSL $03B24B         ; $07C8B4   |
    LDX $12             ; $07C8B8   |
    LDA #$0207          ; $07C8BA   |
    JSL $008B21         ; $07C8BD   |
    LDA $70E2,x         ; $07C8C1   |
    STA $70A2,y         ; $07C8C4   |
    LDA $7182,x         ; $07C8C7   |
    SEC                 ; $07C8CA   |
    SBC #$000E          ; $07C8CB   |
    STA $7142,y         ; $07C8CE   |
    LDA $7222,x         ; $07C8D1   |
    SEC                 ; $07C8D4   |
    SBC #$0100          ; $07C8D5   |
    STA $71E2,y         ; $07C8D8   |
    LDA $7220,x         ; $07C8DB   |
    EOR #$FFFF          ; $07C8DE   |
    INC A               ; $07C8E1   |
    STA $71E0,y         ; $07C8E2   |
    LDA #$00C0          ; $07C8E5   |
    STA $7782,y         ; $07C8E8   |
    LDA $7400,x         ; $07C8EB   |
    STA $73C0,y         ; $07C8EE   |
    INC $16,x           ; $07C8F1   |
    INC $16,x           ; $07C8F3   |
    PLY                 ; $07C8F5   |
    PLA                 ; $07C8F6   |

CODE_07C8F7:
    RTL                 ; $07C8F7   |

CODE_07C8F8:
    JSL $07FC2F         ; $07C8F8   |
    BEQ CODE_07C922     ; $07C8FC   |
    BCC CODE_07C91E     ; $07C8FE   |
    STZ $7220,x         ; $07C900   |
    SEP #$20            ; $07C903   |
    LDA #$03            ; $07C905   |
    STA $18,x           ; $07C907   |
    TAY                 ; $07C909   |
    LDA $C832,y         ; $07C90A   |
    STA $7402,x         ; $07C90D   |
    LDA $C836,y         ; $07C910   |
    STA $7A96,x         ; $07C913   |
    LDA #$08            ; $07C916   |
    STA $16,x           ; $07C918   |
    REP #$20            ; $07C91A   |
    PLY                 ; $07C91C   |
    PLA                 ; $07C91D   |

CODE_07C91E:
    JSL $03A858         ; $07C91E   |

CODE_07C922:
    RTL                 ; $07C922   |

    LDY $7D36,x         ; $07C923   |
    BMI CODE_07C963     ; $07C926   |
    DEY                 ; $07C928   |
    BMI CODE_07C962     ; $07C929   |
    BEQ CODE_07C962     ; $07C92B   |
    LDA $6F00,y         ; $07C92D   |
    CMP #$0010          ; $07C930   |
    BNE CODE_07C962     ; $07C933   |
    LDA $7D38,y         ; $07C935   |
    BEQ CODE_07C962     ; $07C938   |
    PHY                 ; $07C93A   |
    JSL $03B24B         ; $07C93B   |
    PLY                 ; $07C93F   |
    LDA #$FE00          ; $07C940   |
    STA $7222,x         ; $07C943   |
    LDA $7220,y         ; $07C946   |
    CMP #$8000          ; $07C949   |
    ROR A               ; $07C94C   |
    CMP #$8000          ; $07C94D   |
    ROR A               ; $07C950   |
    STA $7220,x         ; $07C951   |
    PHY                 ; $07C954   |
    JSL $03B53D         ; $07C955   |
    PLX                 ; $07C959   |
    JSL $03B24B         ; $07C95A   |
    LDX $12             ; $07C95E   |
    PLY                 ; $07C960   |
    PLA                 ; $07C961   |

CODE_07C962:
    RTL                 ; $07C962   |

CODE_07C963:
    JSL $03A5B7         ; $07C963   |
    RTL                 ; $07C967   |

.init_spear_guy_dancing
    LDY $7900,x         ; $07C968   |
    BNE CODE_07C9BE     ; $07C96B   |
    LDA $0C50           ; $07C96D   |
    BNE CODE_07C976     ; $07C970   |
    JMP CODE_0703A3     ; $07C972   |

CODE_07C976:
    STZ $7400,x         ; $07C976   |
    LDA $7B58,x         ; $07C979   |
    SEC                 ; $07C97C   |
    SBC #$0004          ; $07C97D   |
    STA $7B58,x         ; $07C980   |
    LDA $7BB8,x         ; $07C983   |
    CLC                 ; $07C986   |
    ADC #$0002          ; $07C987   |
    STA $7BB8,x         ; $07C98A   |
    LDA $70E2,x         ; $07C98D   |
    AND #$0010          ; $07C990   |
    LSR A               ; $07C993   |
    LSR A               ; $07C994   |
    LSR A               ; $07C995   |
    TAY                 ; $07C996   |
    INC A               ; $07C997   |
    STA $7900,x         ; $07C998   |
    LDA $0CD8           ; $07C99B   |
    BEQ CODE_07C9B4     ; $07C99E   |
    LDA $70E2,x         ; $07C9A0   |
    CLC                 ; $07C9A3   |
    ADC $0C62,y         ; $07C9A4   |
    STA $70E2,x         ; $07C9A7   |
    LDA $0C58,y         ; $07C9AA   |
    STA $16,x           ; $07C9AD   |
    TAX                 ; $07C9AF   |
    JSR ($C9F7,x)       ; $07C9B0   |

    RTL                 ; $07C9B3   |

CODE_07C9B4:
    LDA $70E2,x         ; $07C9B4   |
    CLC                 ; $07C9B7   |
    ADC $0C5E,y         ; $07C9B8   |
    STA $70E2,x         ; $07C9BB   |

CODE_07C9BE:
    LDA #$0004          ; $07C9BE   |
    STA $16,x           ; $07C9C1   |
    TAX                 ; $07C9C3   |
    JSR ($C9F7,x)       ; $07C9C4   |

    RTL                 ; $07C9C7   |

.main_spear_guy_dancing
    JSL $03AF23         ; $07C9C8   |
    INC $0C66           ; $07C9CC   |
    JSR CODE_07CE47     ; $07C9CF   |
    LDA $0CD8           ; $07C9D2   |
    BEQ CODE_07C9EC     ; $07C9D5   |
    STZ $7220,x         ; $07C9D7   |
    STZ $7400,x         ; $07C9DA   |
    LDY $7900,x         ; $07C9DD   |
    DEY                 ; $07C9E0   |
    LDA $0C58,y         ; $07C9E1   |
    STA $16,x           ; $07C9E4   |
    TAX                 ; $07C9E6   |
    JSR ($C9F7,x)       ; $07C9E7   |

    BRA CODE_07C9F2     ; $07C9EA   |

CODE_07C9EC:
    LDA $16,x           ; $07C9EC   |
    TAX                 ; $07C9EE   |
    JSR ($CA09,x)       ; $07C9EF   |

CODE_07C9F2:
    JSL $03A5B7         ; $07C9F2   |
    RTL                 ; $07C9F6   |

DATA_07C9F7:         dw $CA2B
DATA_07C9F9:         dw $CAA9
DATA_07C9FB:         dw $CB31
DATA_07C9FD:         dw $CB86
DATA_07C9FF:         dw $CBE0
DATA_07CA01:         dw $CC58
DATA_07CA03:         dw $CCCA
DATA_07CA05:         dw $CD28
DATA_07CA07:         dw $CDA9

DATA_07CA09:         dw $CA44
DATA_07CA0B:         dw $CAC2
DATA_07CA0D:         dw $CB4A
DATA_07CA0F:         dw $CBA8
DATA_07CA11:         dw $CC0B
DATA_07CA13:         dw $CC71
DATA_07CA15:         dw $CCE3
DATA_07CA17:         dw $CD41
DATA_07CA19:         dw $CDC2

DATA_07CA1B:         db $00, $FE, $00, $02, $07, $03, $02, $01
DATA_07CA23:         db $00, $06

DATA_07CA25:         db $08, $08, $08, $08, $08, $08

    LDX $12             ; $07CA2B   |
    LDA #$0005          ; $07CA2D   |
    STA $18,x           ; $07CA30   |
    SEP #$20            ; $07CA32   |
    TAY                 ; $07CA34   |
    LDA $CA1F,y         ; $07CA35   |
    STA $7402,x         ; $07CA38   |
    LDA $CA25,y         ; $07CA3B   |
    STA $7A96,x         ; $07CA3E   |
    REP #$20            ; $07CA41   |
    RTS                 ; $07CA43   |

    LDX $12             ; $07CA44   |
    LDA $7860,x         ; $07CA46   |
    BIT #$0001          ; $07CA49   |
    BEQ CODE_07CA51     ; $07CA4C   |
    STZ $7220,x         ; $07CA4E   |

CODE_07CA51:
    LDA $7A96,x         ; $07CA51   |
    BNE CODE_07CA8E     ; $07CA54   |
    DEC $18,x           ; $07CA56   |
    BMI CODE_07CA8F     ; $07CA58   |
    SEP #$20            ; $07CA5A   |
    LDY $18,x           ; $07CA5C   |
    LDA $CA1F,y         ; $07CA5E   |
    STA $7402,x         ; $07CA61   |
    LDA $CA25,y         ; $07CA64   |
    STA $7A96,x         ; $07CA67   |
    REP #$20            ; $07CA6A   |
    CPY #$03            ; $07CA6C   |
    BNE CODE_07CA8E     ; $07CA6E   |
    LDA #$FE00          ; $07CA70   |
    STA $7222,x         ; $07CA73   |
    LDA $7860,x         ; $07CA76   |
    AND #$FFFE          ; $07CA79   |
    STA $7860,x         ; $07CA7C   |
    LDA #$0040          ; $07CA7F   |
    STA $7542,x         ; $07CA82   |
    LDY $7400,x         ; $07CA85   |
    LDA $CA1B,y         ; $07CA88   |
    STA $7220,x         ; $07CA8B   |

CODE_07CA8E:
    RTS                 ; $07CA8E   |

CODE_07CA8F:
    LDA #$0004          ; $07CA8F   |
    STA $16,x           ; $07CA92   |
    TAX                 ; $07CA94   |
    JSR ($C9F7,x)       ; $07CA95   |

    RTS                 ; $07CA98   |

DATA_07CA99:         dw $0200, $FE00

DATA_07CA9D:         db $06, $00, $05, $04, $03, $07

DATA_07CAA3:         db $08, $08, $08, $08, $08, $08

    LDX $12             ; $07CAA9   |
    LDA #$0005          ; $07CAAB   |
    STA $18,x           ; $07CAAE   |
    SEP #$20            ; $07CAB0   |
    TAY                 ; $07CAB2   |
    LDA $CA9D,y         ; $07CAB3   |
    STA $7402,x         ; $07CAB6   |
    LDA $CAA3,y         ; $07CAB9   |
    STA $7A96,x         ; $07CABC   |
    REP #$20            ; $07CABF   |
    RTS                 ; $07CAC1   |

    LDX $12             ; $07CAC2   |
    LDA $7860,x         ; $07CAC4   |
    BIT #$0001          ; $07CAC7   |
    BEQ CODE_07CACF     ; $07CACA   |
    STZ $7220,x         ; $07CACC   |

CODE_07CACF:
    LDA $7A96,x         ; $07CACF   |
    BNE CODE_07CB0C     ; $07CAD2   |
    DEC $18,x           ; $07CAD4   |
    BMI CODE_07CB0D     ; $07CAD6   |
    SEP #$20            ; $07CAD8   |
    LDY $18,x           ; $07CADA   |
    LDA $CA9D,y         ; $07CADC   |
    STA $7402,x         ; $07CADF   |
    LDA $CAA3,y         ; $07CAE2   |
    STA $7A96,x         ; $07CAE5   |
    REP #$20            ; $07CAE8   |
    CPY #$03            ; $07CAEA   |
    BNE CODE_07CB0C     ; $07CAEC   |
    LDA #$FE00          ; $07CAEE   |
    STA $7222,x         ; $07CAF1   |
    LDA $7860,x         ; $07CAF4   |
    AND #$FFFE          ; $07CAF7   |
    STA $7860,x         ; $07CAFA   |
    LDA #$0040          ; $07CAFD   |
    STA $7542,x         ; $07CB00   |
    LDY $7400,x         ; $07CB03   |
    LDA $CA99,y         ; $07CB06   |
    STA $7220,x         ; $07CB09   |

CODE_07CB0C:
    RTS                 ; $07CB0C   |

CODE_07CB0D:
    LDA #$0004          ; $07CB0D   |
    STA $16,x           ; $07CB10   |
    TAX                 ; $07CB12   |
    JSR ($C9F7,x)       ; $07CB13   |
    RTS                 ; $07CB16   |

DATA_07CB17:         db $00, $05, $04, $03, $02, $01, $00, $05
DATA_07CB1F:         db $04, $03, $02, $01, $00

DATA_07CB24:         db $02, $04, $04, $04, $04, $04, $04, $04
DATA_07CB2C:         db $04, $04, $04, $04, $02

    LDX $12             ; $07CB31   |
    LDA #$000C          ; $07CB33   |
    STA $18,x           ; $07CB36   |
    TAY                 ; $07CB38   |
    SEP #$20            ; $07CB39   |
    LDA $CB17,y         ; $07CB3B   |
    STA $7402,x         ; $07CB3E   |
    LDA $CB24,y         ; $07CB41   |
    STA $7A96,x         ; $07CB44   |
    REP #$20            ; $07CB47   |
    RTS                 ; $07CB49   |

    LDX $12             ; $07CB4A   |
    LDA $7A96,x         ; $07CB4C   |
    BNE CODE_07CB67     ; $07CB4F   |
    DEC $18,x           ; $07CB51   |
    BMI CODE_07CB68     ; $07CB53   |
    SEP #$20            ; $07CB55   |
    LDY $18,x           ; $07CB57   |
    LDA $CB17,y         ; $07CB59   |
    STA $7402,x         ; $07CB5C   |
    LDA $CB24,y         ; $07CB5F   |
    STA $7A96,x         ; $07CB62   |
    REP #$20            ; $07CB65   |

CODE_07CB67:
    RTS                 ; $07CB67   |

CODE_07CB68:
    LDA #$0004          ; $07CB68   |
    STA $16,x           ; $07CB6B   |
    TAX                 ; $07CB6D   |
    JSR ($C9F7,x)       ; $07CB6E   |
    RTS                 ; $07CB71   |

DATA_07CB72:         dw $FFAB, $0055

DATA_07CB76:         db $08, $09, $0A, $0B, $0B, $0A, $09, $08

DATA_07CB7E:         db $06, $06, $06, $06, $06, $06, $06, $06

    LDX $12             ; $07CB86   |
    LDA #$0007          ; $07CB88   |
    STA $18,x           ; $07CB8B   |
    SEP #$20            ; $07CB8D   |
    TAY                 ; $07CB8F   |
    LDA $CB76,y         ; $07CB90   |
    STA $7402,x         ; $07CB93   |
    LDA $CB7E,y         ; $07CB96   |
    STA $7A96,x         ; $07CB99   |
    REP #$20            ; $07CB9C   |
    LDY $7400,x         ; $07CB9E   |
    LDA $CB72,y         ; $07CBA1   |
    STA $7220,x         ; $07CBA4   |
    RTS                 ; $07CBA7   |

    LDX $12             ; $07CBA8   |
    LDA $7A96,x         ; $07CBAA   |
    BNE CODE_07CBD2     ; $07CBAD   |
    DEC $18,x           ; $07CBAF   |
    BMI CODE_07CBD3     ; $07CBB1   |
    SEP #$20            ; $07CBB3   |
    LDY $18,x           ; $07CBB5   |
    LDA $CB76,y         ; $07CBB7   |
    STA $7402,x         ; $07CBBA   |
    LDA $CB7E,y         ; $07CBBD   |
    STA $7A96,x         ; $07CBC0   |
    REP #$20            ; $07CBC3   |
    CPY #$03            ; $07CBC5   |
    BNE CODE_07CBD2     ; $07CBC7   |
    LDA $7400,x         ; $07CBC9   |
    EOR #$0002          ; $07CBCC   |
    STA $7400,x         ; $07CBCF   |

CODE_07CBD2:
    RTS                 ; $07CBD2   |

CODE_07CBD3:
    STZ $7220,x         ; $07CBD3   |
    LDA #$0004          ; $07CBD6   |
    STA $16,x           ; $07CBD9   |
    TAX                 ; $07CBDB   |
    JSR ($C9F7,x)       ; $07CBDC   |

    RTS                 ; $07CBDF   |

    LDX $12             ; $07CBE0   |
    LDA $7400,x         ; $07CBE2   |
    EOR #$0002          ; $07CBE5   |
    STA $7400,x         ; $07CBE8   |
    LDA #$0007          ; $07CBEB   |
    STA $18,x           ; $07CBEE   |
    TAY                 ; $07CBF0   |
    SEP #$20            ; $07CBF1   |
    LDA $CB76,y         ; $07CBF3   |
    STA $7402,x         ; $07CBF6   |
    LDA $CB7E,y         ; $07CBF9   |
    STA $7A96,x         ; $07CBFC   |
    REP #$20            ; $07CBFF   |
    LDY $7400,x         ; $07CC01   |
    LDA $CB72,y         ; $07CC04   |
    STA $7220,x         ; $07CC07   |
    RTS                 ; $07CC0A   |

    LDX $12             ; $07CC0B   |
    LDX $12             ; $07CC0D   |
    LDA $7A96,x         ; $07CC0F   |
    BNE CODE_07CC37     ; $07CC12   |
    DEC $18,x           ; $07CC14   |
    BMI CODE_07CC38     ; $07CC16   |
    SEP #$20            ; $07CC18   |
    LDY $18,x           ; $07CC1A   |
    LDA $CB76,y         ; $07CC1C   |
    STA $7402,x         ; $07CC1F   |
    LDA $CB7E,y         ; $07CC22   |
    STA $7A96,x         ; $07CC25   |
    REP #$20            ; $07CC28   |
    CPY #$03            ; $07CC2A   |
    BNE CODE_07CC37     ; $07CC2C   |
    LDA $7400,x         ; $07CC2E   |
    EOR #$0002          ; $07CC31   |
    STA $7400,x         ; $07CC34   |

CODE_07CC37:
    RTS                 ; $07CC37   |

CODE_07CC38:
    STZ $7220,x         ; $07CC38   |
    LDA $7400,x         ; $07CC3B   |
    EOR #$0002          ; $07CC3E   |
    STA $7400,x         ; $07CC41   |
    LDA #$0004          ; $07CC44   |
    STA $16,x           ; $07CC47   |
    TAX                 ; $07CC49   |
    JSR ($C9F7,x)       ; $07CC4A   |

    RTS                 ; $07CC4D   |

DATA_07CC4E:         db $0C, $0D, $0E, $0D, $0C
DATA_07CC53:         db $08, $04, $18, $04, $08

    LDX $12             ; $07CC58   |
    LDA #$0004          ; $07CC5A   |
    STA $18,x           ; $07CC5D   |
    SEP #$20            ; $07CC5F   |
    TAY                 ; $07CC61   |
    LDA $CC4E,y         ; $07CC62   |
    STA $7402,x         ; $07CC65   |
    LDA $CC53,y         ; $07CC68   |
    STA $7A96,x         ; $07CC6B   |
    REP #$20            ; $07CC6E   |
    RTS                 ; $07CC70   |

    LDX $12             ; $07CC71   |
    LDA $7A96,x         ; $07CC73   |
    BNE CODE_07CCA7     ; $07CC76   |
    DEC $18,x           ; $07CC78   |
    BMI CODE_07CCA8     ; $07CC7A   |
    SEP #$20            ; $07CC7C   |
    LDY $18,x           ; $07CC7E   |
    LDA $CC4E,y         ; $07CC80   |
    STA $7402,x         ; $07CC83   |
    LDA $CC53,y         ; $07CC86   |
    STA $7A96,x         ; $07CC89   |
    REP #$20            ; $07CC8C   |
    CPY #$02            ; $07CC8E   |
    BNE CODE_07CCA7     ; $07CC90   |
    LDA #$FE08          ; $07CC92   |
    STA $7222,x         ; $07CC95   |
    LDA $7860,x         ; $07CC98   |
    AND #$FFFE          ; $07CC9B   |
    STA $7860,x         ; $07CC9E   |
    LDA #$002A          ; $07CCA1   |
    STA $7542,x         ; $07CCA4   |

CODE_07CCA7:
    RTS                 ; $07CCA7   |

CODE_07CCA8:
    LDA #$0004          ; $07CCA8   |
    STA $16,x           ; $07CCAB   |
    TAX                 ; $07CCAD   |
    JSR ($C9F7,x)       ; $07CCAE   |

    RTS                 ; $07CCB1   |

DATA_07CCB2:         db $03, $03, $03, $07, $03, $03, $03, $07

DATA_07CCBA:         db $00, $00, $00, $06, $00, $00, $00, $06

DATA_07CCC2:         db $06, $06, $06, $06, $06, $06, $06, $06

    LDX $12             ; $07CCCA   |
    LDA #$0007          ; $07CCCC   |
    STA $18,x           ; $07CCCF   |
    SEP #$20            ; $07CCD1   |
    TAY                 ; $07CCD3   |
    LDA $CCB2,y         ; $07CCD4   |
    STA $7402,x         ; $07CCD7   |
    LDA $CCC2,y         ; $07CCDA   |
    STA $7A96,x         ; $07CCDD   |
    REP #$20            ; $07CCE0   |
    RTS                 ; $07CCE2   |

    LDX $12             ; $07CCE3   |
    LDA $7A96,x         ; $07CCE5   |
    BNE CODE_07CD1D     ; $07CCE8   |
    DEC $18,x           ; $07CCEA   |
    BMI CODE_07CD1E     ; $07CCEC   |
    SEP #$20            ; $07CCEE   |
    LDY $18,x           ; $07CCF0   |
    LDA $CCB2,y         ; $07CCF2   |
    STA $7402,x         ; $07CCF5   |
    LDA $CCC2,y         ; $07CCF8   |
    STA $7A96,x         ; $07CCFB   |
    REP #$20            ; $07CCFE   |
    CPY #$06            ; $07CD00   |
    BEQ CODE_07CD08     ; $07CD02   |
    CPY #$02            ; $07CD04   |
    BNE CODE_07CD1D     ; $07CD06   |

CODE_07CD08:
    LDA #$FE80          ; $07CD08   |
    STA $7222,x         ; $07CD0B   |
    LDA $7860,x         ; $07CD0E   |
    AND #$FFFE          ; $07CD11   |
    STA $7860,x         ; $07CD14   |
    LDA #$0040          ; $07CD17   |
    STA $7542,x         ; $07CD1A   |

CODE_07CD1D:
    RTS                 ; $07CD1D   |

CODE_07CD1E:
    LDA #$0004          ; $07CD1E   |
    STA $16,x           ; $07CD21   |
    TAX                 ; $07CD23   |
    JSR ($C9F7,x)       ; $07CD24   |

    RTS                 ; $07CD27   |

    LDX $12             ; $07CD28   |
    LDA #$0007          ; $07CD2A   |
    STA $18,x           ; $07CD2D   |
    SEP #$20            ; $07CD2F   |
    TAY                 ; $07CD31   |
    LDA $CCBA,y         ; $07CD32   |
    STA $7402,x         ; $07CD35   |
    LDA $CCC2,y         ; $07CD38   |
    STA $7A96,x         ; $07CD3B   |
    REP #$20            ; $07CD3E   |
    RTS                 ; $07CD40   |

    LDX $12             ; $07CD41   |
    LDA $7A96,x         ; $07CD43   |
    BNE CODE_07CD7B     ; $07CD46   |
    DEC $18,x           ; $07CD48   |
    BMI CODE_07CD7C     ; $07CD4A   |
    SEP #$20            ; $07CD4C   |
    LDY $18,x           ; $07CD4E   |
    LDA $CCBA,y         ; $07CD50   |
    STA $7402,x         ; $07CD53   |
    LDA $CCC2,y         ; $07CD56   |
    STA $7A96,x         ; $07CD59   |
    REP #$20            ; $07CD5C   |
    CPY #$06            ; $07CD5E   |
    BEQ CODE_07CD66     ; $07CD60   |
    CPY #$02            ; $07CD62   |
    BNE CODE_07CD7B     ; $07CD64   |

CODE_07CD66:
    LDA #$FE80          ; $07CD66   |
    STA $7222,x         ; $07CD69   |
    LDA $7860,x         ; $07CD6C   |
    AND #$FFFE          ; $07CD6F   |
    STA $7860,x         ; $07CD72   |
    LDA #$0040          ; $07CD75   |
    STA $7542,x         ; $07CD78   |

CODE_07CD7B:
    RTS                 ; $07CD7B   |

CODE_07CD7C:
    LDA $7400,x         ; $07CD7C   |
    EOR #$0002          ; $07CD7F   |
    STA $7400,x         ; $07CD82   |
    LDA #$0004          ; $07CD85   |
    STA $16,x           ; $07CD88   |
    TAX                 ; $07CD8A   |
    JSR ($C9F7,x)       ; $07CD8B   |

    RTS                 ; $07CD8E   |

DATA_07CD8F:         db $0F, $10, $10, $0F, $10, $10, $0F, $10
DATA_07CD97:         db $10, $0F, $10, $10, $0F

DATA_07CD9C:         db $02, $04, $04, $04, $04, $04, $04, $04
DATA_07CDA4:         db $04, $04, $04, $04, $02

    LDX $12             ; $07CDA9   |
    LDA #$000C          ; $07CDAB   |
    STA $18,x           ; $07CDAE   |
    SEP #$20            ; $07CDB0   |
    TAY                 ; $07CDB2   |
    LDA $CD8F,y         ; $07CDB3   |
    STA $7402,x         ; $07CDB6   |
    LDA $CD9C,y         ; $07CDB9   |
    STA $7A96,x         ; $07CDBC   |
    REP #$20            ; $07CDBF   |
    RTS                 ; $07CDC1   |

    LDX $12             ; $07CDC2   |
    LDA $7A96,x         ; $07CDC4   |
    BNE CODE_07CDF8     ; $07CDC7   |
    DEC $18,x           ; $07CDC9   |
    BMI CODE_07CDF9     ; $07CDCB   |
    SEP #$20            ; $07CDCD   |
    LDY $18,x           ; $07CDCF   |
    LDA $CD8F,y         ; $07CDD1   |
    STA $7402,x         ; $07CDD4   |
    LDA $CD9C,y         ; $07CDD7   |
    STA $7A96,x         ; $07CDDA   |
    REP #$20            ; $07CDDD   |
    CPY #$0A            ; $07CDDF   |
    BEQ CODE_07CDEF     ; $07CDE1   |
    CPY #$07            ; $07CDE3   |
    BEQ CODE_07CDEF     ; $07CDE5   |
    CPY #$04            ; $07CDE7   |
    BEQ CODE_07CDEF     ; $07CDE9   |
    CPY #$01            ; $07CDEB   |
    BNE CODE_07CDF8     ; $07CDED   |

CODE_07CDEF:
    LDA $7400,x         ; $07CDEF   |
    EOR #$0002          ; $07CDF2   |
    STA $7400,x         ; $07CDF5   |

CODE_07CDF8:
    RTS                 ; $07CDF8   |

CODE_07CDF9:
    LDA #$0004          ; $07CDF9   |
    STA $16,x           ; $07CDFC   |
    TAX                 ; $07CDFE   |
    JSR ($C9F7,x)       ; $07CDFF   |

    RTS                 ; $07CE02   |

DATA_07CE03:         dw $0010, $000F, $000E, $000C
DATA_07CE0B:         dw $000D, $000E, $0010, $000C
DATA_07CE13:         dw $0005, $0002, $0003, $0006
DATA_07CE1B:         dw $000E, $000E, $000E, $0007
DATA_07CE23:         dw $0008

DATA_07CE25:         dw $FFE4, $FFE2, $FFE1, $FFE0
DATA_07CE2D:         dw $FFDF, $FFE1, $FFE7, $FFE3
DATA_07CE35:         dw $FFE2, $FFE3, $FFE4, $FFE3
DATA_07CE3D:         dw $FFE6, $FFE3, $FFDE, $FFE4
DATA_07CE45:         dw $FFE3

CODE_07CE47:
    LDA $7402,x         ; $07CE47   |
    ASL A               ; $07CE4A   |
    TAY                 ; $07CE4B   |
    LDA $6122           ; $07CE4C   |
    CLC                 ; $07CE4F   |
    ADC #$0001          ; $07CE50   |
    STA $00             ; $07CE53   |
    LDA $CE25,y         ; $07CE55   |
    CLC                 ; $07CE58   |
    ADC $7182,x         ; $07CE59   |
    SEC                 ; $07CE5C   |
    SBC $611E           ; $07CE5D   |
    BPL CODE_07CE66     ; $07CE60   |
    EOR #$FFFF          ; $07CE62   |
    INC A               ; $07CE65   |

CODE_07CE66:
    CMP $00             ; $07CE66   |
    BCS CODE_07CE98     ; $07CE68   |
    LDA $6120           ; $07CE6A   |
    CLC                 ; $07CE6D   |
    ADC #$0001          ; $07CE6E   |
    STA $00             ; $07CE71   |
    LDA $CE03,y         ; $07CE73   |
    LDY $7400,x         ; $07CE76   |
    BEQ CODE_07CE82     ; $07CE79   |
    EOR #$FFFF          ; $07CE7B   |
    CLC                 ; $07CE7E   |
    ADC #$0009          ; $07CE7F   |

CODE_07CE82:
    CLC                 ; $07CE82   |
    ADC $70E2,x         ; $07CE83   |
    SEC                 ; $07CE86   |
    SBC $611C           ; $07CE87   |
    BPL CODE_07CE90     ; $07CE8A   |
    EOR #$FFFF          ; $07CE8C   |
    INC A               ; $07CE8F   |

CODE_07CE90:
    CMP $00             ; $07CE90   |
    BCS CODE_07CE98     ; $07CE92   |
    JSL $03A858         ; $07CE94   |

CODE_07CE98:
    RTS                 ; $07CE98   |

DATA_07CE99:         dw $FF00, $0100

.init_zeus_guy
    STZ $16,x           ; $07CE9D   |
    STZ $79D8,x         ; $07CE9F   |
    LDA #$D08D          ; $07CEA2   |
    STA $7902,x         ; $07CEA5   |
    JSR CODE_07D0A1     ; $07CEA8   |
    RTL                 ; $07CEAB   |

DATA_07CEAC:         dw $0200, $FE00

.main_zeus_guy
    LDA $6F00,x         ; $07CEB0   |
    CMP #$0008          ; $07CEB3   |
    BNE CODE_07CEF4     ; $07CEB6   |
    LDA $6150           ; $07CEB8   |
    CMP #$0003          ; $07CEBB   |
    BCS CODE_07CED8     ; $07CEBE   |
    LDA $77C2,x         ; $07CEC0   |
    AND #$00FF          ; $07CEC3   |
    STA $7400,x         ; $07CEC6   |
    TAY                 ; $07CEC9   |
    LDA $CEAC,y         ; $07CECA   |
    STA $7220,x         ; $07CECD   |
    LDA #$0001          ; $07CED0   |
    STA $7540,x         ; $07CED3   |
    BRA CODE_07CEE6     ; $07CED6   |

CODE_07CED8:
    LDA $7860,x         ; $07CED8   |
    AND #$0001          ; $07CEDB   |
    BEQ CODE_07CEE6     ; $07CEDE   |
    LDA #$FE00          ; $07CEE0   |
    STA $7222,x         ; $07CEE3   |

CODE_07CEE6:
    STZ $6162           ; $07CEE6   |
    STZ $6168           ; $07CEE9   |
    LDA #$0010          ; $07CEEC   |
    STA $6F00,x         ; $07CEEF   |
    PLY                 ; $07CEF2   |
    PLA                 ; $07CEF3   |

CODE_07CEF4:
    JSL $03AF23         ; $07CEF4   |
    LDA $7540,x         ; $07CEF8   |
    BEQ CODE_07CF00     ; $07CEFB   |
    JMP CODE_07D80C     ; $07CEFD   |

CODE_07CF00:
    STZ $7900,x         ; $07CF00   |
    LDA $7042,x         ; $07CF03   |
    AND #$FFF1          ; $07CF06   |
    STA $7042,x         ; $07CF09   |
    TAX                 ; $07CF0C   |
    STA $3002           ; $07CF0D   |
    LDX #$09            ; $07CF10   |
    LDA #$8F33          ; $07CF12   |
    JSL $7EDE44         ; $07CF15   | GSU init
    LDX $12             ; $07CF19   |
    LDA $3002           ; $07CF1B   |
    STA $7A38,x         ; $07CF1E   |
    LDA $7402,x         ; $07CF21   |
    CMP #$0000          ; $07CF24   |
    BNE CODE_07CF32     ; $07CF27   |
    LDA $77C2,x         ; $07CF29   |
    AND #$00FF          ; $07CF2C   |
    STA $7400,x         ; $07CF2F   |

CODE_07CF32:
    JSR CODE_07D4DF     ; $07CF32   |
    JSR CODE_07D550     ; $07CF35   |
    JSR CODE_07D5D2     ; $07CF38   |
    LDA $16,x           ; $07CF3B   |
    CMP #$0004          ; $07CF3D   |
    BCS CODE_07CF61     ; $07CF40   |
    LDY $7A38,x         ; $07CF42   |
    BMI CODE_07CF61     ; $07CF45   |
    JSL $07FC1F         ; $07CF47   |
    BMI CODE_07CF61     ; $07CF4B   |
    LDA $7CD6,x         ; $07CF4D   |
    SEC                 ; $07CF50   |
    SBC $7CD6,y         ; $07CF51   |
    AND #$8000          ; $07CF54   |
    ASL A               ; $07CF57   |
    ROL A               ; $07CF58   |
    ASL A               ; $07CF59   |
    STA $7400,x         ; $07CF5A   |
    STZ $16,x           ; $07CF5D   |
    INC $76,x           ; $07CF5F   |

CODE_07CF61:
    LDA $7860,x         ; $07CF61   |
    BIT #$0001          ; $07CF64   |
    BEQ CODE_07CF75     ; $07CF67   |
    STZ $7A36,x         ; $07CF69   |
    LDA $16,x           ; $07CF6C   |
    TAX                 ; $07CF6E   |
    JSR ($CF9A,x)       ; $07CF6F   |

    JMP CODE_07D79D     ; $07CF72   |

CODE_07CF75:
    LDA $7A36,x         ; $07CF75   |
    BEQ CODE_07CF83     ; $07CF78   |
    LDY $7400,x         ; $07CF7A   |
    LDA $CE99,y         ; $07CF7D   |
    STA $7220,x         ; $07CF80   |

CODE_07CF83:
    LDA #$0020          ; $07CF83   |
    STA $7402,x         ; $07CF86   |
    STZ $7A96,x         ; $07CF89   |
    LDA #$000C          ; $07CF8C   |
    STA $79D8,x         ; $07CF8F   |
    LDA #$0002          ; $07CF92   |
    STA $18,x           ; $07CF95   |
    JMP CODE_07D79D     ; $07CF97   |

DATA_07CF9A:         dw $D00E, $D031, $D05B, $D072

DATA_07CFA2:         dw $D0A1, $D123, $D239, $D2B4
DATA_07CFAA:         dw $D327, $D39D, $D492

DATA_07CFB0:         dw $D0D5, $D13E, $D283, $D2FF
DATA_07CFB8:         dw $D372, $D3C7, $D49F

DATA_07CFBE:         dw $0004, $0006, $0008, $000A
DATA_07CFC6:         dw $0004, $0006, $0008, $0004
DATA_07CFCE:         dw $0006, $0008, $0004, $0006
DATA_07CFD6:         dw $0008, $0004, $0006, $0008
DATA_07CFDE:         dw $0004, $0006, $0008, $0004
DATA_07CFE6:         dw $0006, $0008, $0004, $0006
DATA_07CFEE:         dw $0008, $0004, $0006, $0008
DATA_07CFF6:         dw $0004, $0006, $0008, $0004
DATA_07CFFE:         dw $000A, $000A, $000A, $000A
DATA_07D006:         dw $000A, $0004, $0006, $0008

    LDX $12             ; $07D00E   |
    LDA #$D08D          ; $07D010   |
    STA $7902,x         ; $07D013   |
    LDA $76,x           ; $07D016   |
    BEQ CODE_07D02A     ; $07D018   |
    LDA $79D8,x         ; $07D01A   |
    AND #$0002          ; $07D01D   |
    EOR #$0002          ; $07D020   |
    STA $79D8,x         ; $07D023   |
    TAX                 ; $07D026   |
    JMP ($CFA2,x)       ; $07D027   |

CODE_07D02A:
    LDA $79D8,x         ; $07D02A   |
    TAX                 ; $07D02D   |
    JMP ($CFB0,x)       ; $07D02E   |

    LDX $12             ; $07D031   |
    LDA #$D091          ; $07D033   |
    STA $7902,x         ; $07D036   |
    LDA $76,x           ; $07D039   |
    BEQ CODE_07D02A     ; $07D03B   |
    LDA $10             ; $07D03D   |
    AND #$0007          ; $07D03F   |
    BEQ CODE_07D049     ; $07D042   |
    LDA #$0000          ; $07D044   |
    BRA CODE_07D054     ; $07D047   |

CODE_07D049:
    LDA $10             ; $07D049   |
    AND #$0038          ; $07D04B   |
    LSR A               ; $07D04E   |
    LSR A               ; $07D04F   |
    TAY                 ; $07D050   |
    LDA $CFFE,y         ; $07D051   |

CODE_07D054:
    STA $79D8,x         ; $07D054   |
    TAX                 ; $07D057   |
    JMP ($CFA2,x)       ; $07D058   |

    LDX $12             ; $07D05B   |
    LDA $76,x           ; $07D05D   |
    BEQ CODE_07D02A     ; $07D05F   |
    LDA $10             ; $07D061   |
    AND #$000F          ; $07D063   |
    ASL A               ; $07D066   |
    TAY                 ; $07D067   |
    LDA $CFBE,y         ; $07D068   |
    STA $79D8,x         ; $07D06B   |
    TAX                 ; $07D06E   |
    JMP ($CFA2,x)       ; $07D06F   |

    LDX $12             ; $07D072   |
    LDA $76,x           ; $07D074   |
    BEQ CODE_07D02A     ; $07D076   |
    LDA $10             ; $07D078   |
    AND #$000F          ; $07D07A   |
    ASL A               ; $07D07D   |
    TAY                 ; $07D07E   |
    LDA $CFDE,y         ; $07D07F   |
    STA $79D8,x         ; $07D082   |
    TAX                 ; $07D085   |
    JMP ($CFA2,x)       ; $07D086   |

DATA_07D089:         db $00, $1F, $1E, $1D, $20, $02
DATA_07D08F:         db $02, $02, $08, $02, $02, $02

DATA_07D095:         dw $0008, $0004

DATA_07D099:         dw $FFFC, $0004

DATA_07D09D:         dw $FFFE, $0002

CODE_07D0A1:
    LDX $12             ; $07D0A1   |
    LDA $7902,x         ; $07D0A3   |
    STA $00             ; $07D0A6   |
    LDA #$0003          ; $07D0A8   |
    STA $18,x           ; $07D0AB   |
    SEP #$20            ; $07D0AD   |
    TAY                 ; $07D0AF   |
    LDA $D089,y         ; $07D0B0   |
    STA $7402,x         ; $07D0B3   |
    LDA ($00),y         ; $07D0B6   |
    STA $7A96,x         ; $07D0B8   |
    REP #$20            ; $07D0BB   |
    LDY $7400,x         ; $07D0BD   |
    LDA $7860,x         ; $07D0C0   |
    AND $D095,y         ; $07D0C3   |
    BNE CODE_07D0D2     ; $07D0C6   |
    LDA $70E2,x         ; $07D0C8   |
    CLC                 ; $07D0CB   |
    ADC $D099,y         ; $07D0CC   |
    STA $70E2,x         ; $07D0CF   |

CODE_07D0D2:
    STZ $76,x           ; $07D0D2   |
    RTS                 ; $07D0D4   |

    LDX $12             ; $07D0D5   |
    LDA $7A96,x         ; $07D0D7   |
    BNE CODE_07D10F     ; $07D0DA   |
    DEC $18,x           ; $07D0DC   |
    BMI CODE_07D110     ; $07D0DE   |
    LDA $7902,x         ; $07D0E0   |
    STA $00             ; $07D0E3   |
    SEP #$20            ; $07D0E5   |
    LDY $18,x           ; $07D0E7   |
    LDA $D089,y         ; $07D0E9   |
    STA $7402,x         ; $07D0EC   |
    LDA ($00),y         ; $07D0EF   |
    STA $7A96,x         ; $07D0F1   |
    REP #$20            ; $07D0F4   |
    CPY #$02            ; $07D0F6   |
    BNE CODE_07D10F     ; $07D0F8   |
    LDY $7400,x         ; $07D0FA   |
    LDA $7860,x         ; $07D0FD   |
    AND $D095,y         ; $07D100   |
    BNE CODE_07D10F     ; $07D103   |
    LDA $70E2,x         ; $07D105   |
    CLC                 ; $07D108   |
    ADC $D09D,y         ; $07D109   |
    STA $70E2,x         ; $07D10C   |

CODE_07D10F:
    RTS                 ; $07D10F   |

CODE_07D110:
    INC $76,x           ; $07D110   |
    RTS                 ; $07D112   |

DATA_07D113:         db $00, $1D, $1E, $1F

DATA_07D117:         dw $0002, $FFFE

DATA_07D11B:         dw $0004, $FFFC

DATA_07D11F:         dw $0004, $0008

    LDX $12             ; $07D123   |
    LDA #$0003          ; $07D125   |
    STA $18,x           ; $07D128   |
    SEP #$20            ; $07D12A   |
    TAY                 ; $07D12C   |
    LDA $D113,y         ; $07D12D   |
    STA $7402,x         ; $07D130   |
    LDA $D08D,y         ; $07D133   |
    STA $7A96,x         ; $07D136   |
    REP #$20            ; $07D139   |
    STZ $76,x           ; $07D13B   |
    RTS                 ; $07D13D   |

    LDX $12             ; $07D13E   |
    LDA $7A96,x         ; $07D140   |
    BNE CODE_07D18F     ; $07D143   |
    DEC $18,x           ; $07D145   |
    BMI CODE_07D190     ; $07D147   |
    SEP #$20            ; $07D149   |
    LDY $18,x           ; $07D14B   |
    LDA $D113,y         ; $07D14D   |
    STA $7402,x         ; $07D150   |
    LDA $D08D,y         ; $07D153   |
    STA $7A96,x         ; $07D156   |
    REP #$20            ; $07D159   |
    CPY #$01            ; $07D15B   |
    BNE CODE_07D176     ; $07D15D   |
    LDY $7400,x         ; $07D15F   |
    LDA $7860,x         ; $07D162   |
    AND $D11F,y         ; $07D165   |
    BNE CODE_07D18F     ; $07D168   |
    LDA $70E2,x         ; $07D16A   |
    CLC                 ; $07D16D   |
    ADC $D117,y         ; $07D16E   |
    STA $70E2,x         ; $07D171   |
    BRA CODE_07D18F     ; $07D174   |

CODE_07D176:
    CPY #$00            ; $07D176   |
    BNE CODE_07D18F     ; $07D178   |
    LDY $7400,x         ; $07D17A   |
    LDA $7860,x         ; $07D17D   |
    AND $D11F,y         ; $07D180   |
    BNE CODE_07D18F     ; $07D183   |
    LDA $70E2,x         ; $07D185   |
    CLC                 ; $07D188   |
    ADC $D11B,y         ; $07D189   |
    STA $70E2,x         ; $07D18C   |

CODE_07D18F:
    RTS                 ; $07D18F   |

CODE_07D190:
    INC $76,x           ; $07D190   |
    RTS                 ; $07D192   |

DATA_07D193:         db $01, $02, $03, $02, $01, $00

DATA_07D199:         db $02, $01, $08, $01, $02, $08

DATA_07D19F:         dw $FFFE, $FFFF

DATA_07D1A3:         dw $0504, $0706, $0908
DATA_07D1A9:         dw $0708, $0506, $0004

DATA_07D1AF:         dw $0202, $0202, $0101
DATA_07D1B5:         dw $0201, $0202, $0802

DATA_07D1BB:         dw $FFFD, $FFFE, $FFFF

DATA_07D1C1:         db $17, $16, $15, $14, $13, $12, $11, $10
DATA_07D1C9:         db $0F, $0E, $0D, $0C, $0B, $0A, $00

DATA_07D1D0:         db $02, $02, $02, $02, $02, $02, $02, $02
DATA_07D1D8:         db $02, $02, $02, $02, $02, $02, $08

DATA_07D1DF:         dw $FFFA, $FFFB, $FFFC
DATA_07D1E5:         dw $FFFD, $FFFE, $FFFF

DATA_07D1EB:         db $1C, $18, $19, $1A, $19, $18, $00

DATA_07D1F2:         db $12, $01, $02, $30, $02, $02, $08

DATA_07D1F9:         dw $FFF0, $0010

DATA_07D1FD:         dw $0000, $0002, $0004, $0008

DATA_07D205:         dw $0008, $FFF8

DATA_07D209:         dw $0001, $0000, $0001, $0000
DATA_07D211:         dw $0003, $0002, $0003, $0002
DATA_07D219:         dw $0005, $0004, $0005, $0004
DATA_07D221:         dw $0007, $0006, $0007, $0006
DATA_07D229:         dw $0009, $0008, $0009, $0008
DATA_07D231:         dw $000B, $000A, $000B, $000A

    LDX $12             ; $07D239   |
    JSR CODE_07D61E     ; $07D23B   |
    LDA #$0005          ; $07D23E   |
    STA $18,x           ; $07D241   |
    LDY $7A38,x         ; $07D243   |
    BMI CODE_07D267     ; $07D246   |
    LDA $7CD6,x         ; $07D248   |
    SEC                 ; $07D24B   |
    SBC $7CD6,y         ; $07D24C   |
    BPL CODE_07D255     ; $07D24F   |
    EOR #$FFFF          ; $07D251   |
    INC A               ; $07D254   |

CODE_07D255:
    LSR A               ; $07D255   |
    LSR A               ; $07D256   |
    LSR A               ; $07D257   |
    CMP #$0002          ; $07D258   |
    BCS CODE_07D267     ; $07D25B   |
    ASL A               ; $07D25D   |
    TAY                 ; $07D25E   |
    LDA $18,x           ; $07D25F   |
    CLC                 ; $07D261   |
    ADC $D19F,y         ; $07D262   |
    STA $18,x           ; $07D265   |

CODE_07D267:
    SEP #$20            ; $07D267   |
    LDY $18,x           ; $07D269   |
    LDA $D193,y         ; $07D26B   |
    STA $7402,x         ; $07D26E   |
    LDA $D199,y         ; $07D271   |
    STA $7A96,x         ; $07D274   |
    REP #$20            ; $07D277   |
    LDA #$003C          ; $07D279   |\ play sound #$003C
    JSL $0085D2         ; $07D27C   |/
    STZ $76,x           ; $07D280   |
    RTS                 ; $07D282   |

    LDX $12             ; $07D283   |
    JSR CODE_07D61E     ; $07D285   |
    LDA $7A96,x         ; $07D288   |
    BNE CODE_07D2AA     ; $07D28B   |
    DEC $18,x           ; $07D28D   |
    BMI CODE_07D2AB     ; $07D28F   |
    SEP #$20            ; $07D291   |
    LDY $18,x           ; $07D293   |
    LDA $D193,y         ; $07D295   |
    STA $7402,x         ; $07D298   |
    LDA $D199,y         ; $07D29B   |
    STA $7A96,x         ; $07D29E   |
    REP #$20            ; $07D2A1   |
    CPY #$02            ; $07D2A3   |
    BNE CODE_07D2AA     ; $07D2A5   |
    JSR CODE_07D701     ; $07D2A7   |

CODE_07D2AA:
    RTS                 ; $07D2AA   |

CODE_07D2AB:
    LDA #$0000          ; $07D2AB   |
    STA $7402,x         ; $07D2AE   |
    INC $76,x           ; $07D2B1   |
    RTS                 ; $07D2B3   |

    LDX $12             ; $07D2B4   |
    JSR CODE_07D61E     ; $07D2B6   |
    LDA #$000B          ; $07D2B9   |
    STA $18,x           ; $07D2BC   |
    LDY $7A38,x         ; $07D2BE   |
    BMI CODE_07D2E3     ; $07D2C1   |
    LDA $7CD6,x         ; $07D2C3   |
    SEC                 ; $07D2C6   |
    SBC $7CD6,y         ; $07D2C7   |
    BPL CODE_07D2D0     ; $07D2CA   |
    EOR #$FFFF          ; $07D2CC   |
    INC A               ; $07D2CF   |

CODE_07D2D0:
    LSR A               ; $07D2D0   |
    LSR A               ; $07D2D1   |
    LSR A               ; $07D2D2   |
    LSR A               ; $07D2D3   |
    CMP #$0003          ; $07D2D4   |
    BCS CODE_07D2E3     ; $07D2D7   |
    ASL A               ; $07D2D9   |
    TAY                 ; $07D2DA   |
    LDA $18,x           ; $07D2DB   |
    CLC                 ; $07D2DD   |
    ADC $D1BB,y         ; $07D2DE   |
    STA $18,x           ; $07D2E1   |

CODE_07D2E3:
    SEP #$20            ; $07D2E3   |
    LDY $18,x           ; $07D2E5   |
    LDA $D1A3,y         ; $07D2E7   |
    STA $7402,x         ; $07D2EA   |
    LDA $D1AF,y         ; $07D2ED   |
    STA $7A96,x         ; $07D2F0   |
    REP #$20            ; $07D2F3   |
    LDA #$003C          ; $07D2F5   |\ play sound #$003C
    JSL $0085D2         ; $07D2F8   |/
    STZ $76,x           ; $07D2FC   |
    RTS                 ; $07D2FE   |

    LDX $12             ; $07D2FF   |
    JSR CODE_07D61E     ; $07D301   |
    LDA $7A96,x         ; $07D304   |
    BNE CODE_07D326     ; $07D307   |
    DEC $18,x           ; $07D309   |
    BMI CODE_07D2AB     ; $07D30B   |
    SEP #$20            ; $07D30D   |
    LDY $18,x           ; $07D30F   |
    LDA $D1A3,y         ; $07D311   |
    STA $7402,x         ; $07D314   |
    LDA $D1AF,y         ; $07D317   |
    STA $7A96,x         ; $07D31A   |
    REP #$20            ; $07D31D   |
    CPY #$05            ; $07D31F   |
    BNE CODE_07D326     ; $07D321   |
    JSR CODE_07D701     ; $07D323   |

CODE_07D326:
    RTS                 ; $07D326   |

    LDX $12             ; $07D327   |
    JSR CODE_07D61E     ; $07D329   |
    LDA #$000E          ; $07D32C   |
    STA $18,x           ; $07D32F   |
    LDY $7A38,x         ; $07D331   |
    BMI CODE_07D356     ; $07D334   |
    LDA $7CD6,x         ; $07D336   |
    SEC                 ; $07D339   |
    SBC $7CD6,y         ; $07D33A   |
    BPL CODE_07D343     ; $07D33D   |
    EOR #$FFFF          ; $07D33F   |
    INC A               ; $07D342   |

CODE_07D343:
    LSR A               ; $07D343   |
    LSR A               ; $07D344   |
    LSR A               ; $07D345   |
    LSR A               ; $07D346   |
    CMP #$0006          ; $07D347   |
    BCS CODE_07D356     ; $07D34A   |
    ASL A               ; $07D34C   |
    TAY                 ; $07D34D   |
    LDA $18,x           ; $07D34E   |
    CLC                 ; $07D350   |
    ADC $D1DF,y         ; $07D351   |
    STA $18,x           ; $07D354   |

CODE_07D356:
    SEP #$20            ; $07D356   |
    LDY $18,x           ; $07D358   |
    LDA $D1C1,y         ; $07D35A   |
    STA $7402,x         ; $07D35D   |
    LDA $D1D0,y         ; $07D360   |
    STA $7A96,x         ; $07D363   |
    REP #$20            ; $07D366   |
    LDA #$003C          ; $07D368   |\ play sound #$003C
    JSL $0085D2         ; $07D36B   |/
    STZ $76,x           ; $07D36F   |
    RTS                 ; $07D371   |

    LDX $12             ; $07D372   |
    JSR CODE_07D61E     ; $07D374   |
    LDA $7A96,x         ; $07D377   |
    BNE CODE_07D399     ; $07D37A   |
    DEC $18,x           ; $07D37C   |
    BMI CODE_07D39A     ; $07D37E   |
    SEP #$20            ; $07D380   |
    LDY $18,x           ; $07D382   |
    LDA $D1C1,y         ; $07D384   |
    STA $7402,x         ; $07D387   |
    LDA $D1D0,y         ; $07D38A   |
    STA $7A96,x         ; $07D38D   |
    REP #$20            ; $07D390   |
    CPY #$05            ; $07D392   |
    BNE CODE_07D399     ; $07D394   |
    JSR CODE_07D701     ; $07D396   |

CODE_07D399:
    RTS                 ; $07D399   |

CODE_07D39A:
    JMP CODE_07D2AB     ; $07D39A   |

    LDX $12             ; $07D39D   |
    LDA #$0006          ; $07D39F   |
    STA $18,x           ; $07D3A2   |
    STZ $7220,x         ; $07D3A4   |
    SEP #$20            ; $07D3A7   |
    TAY                 ; $07D3A9   |
    LDA $D1EB,y         ; $07D3AA   |
    STA $7402,x         ; $07D3AD   |
    LDA $D1F2,y         ; $07D3B0   |
    STA $7A96,x         ; $07D3B3   |
    LDA #$2E            ; $07D3B6   |
    STA $77C0,x         ; $07D3B8   |
    REP #$20            ; $07D3BB   |
    LDA #$003C          ; $07D3BD   |\ play sound #$003C
    JSL $0085D2         ; $07D3C0   |/
    STZ $76,x           ; $07D3C4   |
    RTS                 ; $07D3C6   |

    LDX $12             ; $07D3C7   |
    STZ $7220,x         ; $07D3C9   |
    LDA $7402,x         ; $07D3CC   |
    CMP #$001A          ; $07D3CF   |
    BNE CODE_07D43A     ; $07D3D2   |
    LDA $7A98,x         ; $07D3D4   |
    BNE CODE_07D41F     ; $07D3D7   |
    LDY $7400,x         ; $07D3D9   |
    LDA $70E2,x         ; $07D3DC   |
    CLC                 ; $07D3DF   |
    ADC $D205,y         ; $07D3E0   |
    STA $00             ; $07D3E3   |
    LDY $77C0,x         ; $07D3E5   |
    LDA $D209,y         ; $07D3E8   |
    STA $02             ; $07D3EB   |
    DEY                 ; $07D3ED   |
    DEY                 ; $07D3EE   |
    BPL CODE_07D3F3     ; $07D3EF   |
    LDY #$02            ; $07D3F1   |

CODE_07D3F3:
    SEP #$20            ; $07D3F3   |
    TYA                 ; $07D3F5   |
    STA $77C0,x         ; $07D3F6   |
    REP #$20            ; $07D3F9   |
    LDA #$0228          ; $07D3FB   |
    JSL $008B21         ; $07D3FE   |
    LDA $00             ; $07D402   |
    STA $70A2,y         ; $07D404   |
    LDA $7182,x         ; $07D407   |
    CLC                 ; $07D40A   |
    ADC #$0008          ; $07D40B   |
    STA $7142,y         ; $07D40E   |
    LDA $02             ; $07D411   |
    STA $73C2,y         ; $07D413   |
    LDA #$0002          ; $07D416   |
    STA $7782,y         ; $07D419   |
    STA $7A98,x         ; $07D41C   |

CODE_07D41F:
    LDA $14             ; $07D41F   |
    AND #$0003          ; $07D421   |
    ASL A               ; $07D424   |
    TAY                 ; $07D425   |
    LDA $7042,x         ; $07D426   |
    ORA $D1FD,y         ; $07D429   |
    STA $7042,x         ; $07D42C   |
    CPY #$00            ; $07D42F   |
    BNE CODE_07D43A     ; $07D431   |
    LDA #$000E          ; $07D433   |\ play sound #$000E
    JSL $0085D2         ; $07D436   |/

CODE_07D43A:
    LDA $7A96,x         ; $07D43A   |
    BNE CODE_07D487     ; $07D43D   |
    DEC $18,x           ; $07D43F   |
    BPL CODE_07D446     ; $07D441   |
    JMP CODE_07D2AB     ; $07D443   |

CODE_07D446:
    SEP #$20            ; $07D446   |
    LDY $18,x           ; $07D448   |
    LDA $D1EB,y         ; $07D44A   |
    STA $7402,x         ; $07D44D   |
    LDA $D1F2,y         ; $07D450   |
    STA $7A96,x         ; $07D453   |
    REP #$20            ; $07D456   |
    CPY #$00            ; $07D458   |
    BNE CODE_07D487     ; $07D45A   |
    LDY $7400,x         ; $07D45C   |
    LDA $70E2,x         ; $07D45F   |
    CLC                 ; $07D462   |
    ADC $D1F9,y         ; $07D463   |
    STA $00             ; $07D466   |
    LDA #$00FE          ; $07D468   |
    JSL $03A364         ; $07D46B   |
    BCC CODE_07D487     ; $07D46F   |
    LDA $7400,x         ; $07D471   |
    STA $7400,y         ; $07D474   |
    LDA $00             ; $07D477   |
    STA $70E2,y         ; $07D479   |
    LDA $7182,x         ; $07D47C   |
    STA $7182,y         ; $07D47F   |
    TYX                 ; $07D482   |
    JSL $07D8D4         ; $07D483   |

CODE_07D487:
    LDX $12             ; $07D487   |
    RTS                 ; $07D489   |

DATA_07D48A:         db $00, $21, $20, $21

DATA_07D48E:         db $04, $04, $00, $20

CODE_07D492:
    LDX $12             ; $07D492   |
    STZ $7220,x         ; $07D494   |
    LDA #$0003          ; $07D497   |
    STA $18,x           ; $07D49A   |
    STZ $76,x           ; $07D49C   |
    RTS                 ; $07D49E   |

    LDX $12             ; $07D49F   |
    LDA $7860,x         ; $07D4A1   |
    BIT #$0001          ; $07D4A4   |
    BEQ CODE_07D4D1     ; $07D4A7   |
    LDA $7A96,x         ; $07D4A9   |
    BNE CODE_07D4D1     ; $07D4AC   |
    DEC $18,x           ; $07D4AE   |
    BMI CODE_07D4D2     ; $07D4B0   |
    SEP #$20            ; $07D4B2   |
    LDY $18,x           ; $07D4B4   |
    LDA $D48A,y         ; $07D4B6   |
    STA $7402,x         ; $07D4B9   |
    LDA $D48E,y         ; $07D4BC   |
    STA $7A96,x         ; $07D4BF   |
    REP #$20            ; $07D4C2   |
    CPY #$02            ; $07D4C4   |
    BNE CODE_07D4D1     ; $07D4C6   |
    LDA #$FA80          ; $07D4C8   |
    STA $7222,x         ; $07D4CB   |
    INC $7A36,x         ; $07D4CE   |

CODE_07D4D1:
    RTS                 ; $07D4D1   |

CODE_07D4D2:
    STZ $7220,x         ; $07D4D2   |
    STZ $79D8,x         ; $07D4D5   |
    INC $76,x           ; $07D4D8   |
    RTS                 ; $07D4DA   |

DATA_07D4DB:         dw $FFE0, $0020

CODE_07D4DF:
    STZ $16,x           ; $07D4DF   |
    STZ $7220,x         ; $07D4E1   |
    LDA #$0080          ; $07D4E4   |
    STA $00             ; $07D4E7   |
    STA $04             ; $07D4E9   |
    ASL A               ; $07D4EB   |
    STA $02             ; $07D4EC   |
    STA $06             ; $07D4EE   |
    JSL $07FCFB         ; $07D4F0   |
    BCS CODE_07D547     ; $07D4F4   |
    LDA #$0002          ; $07D4F6   |
    STA $16,x           ; $07D4F9   |
    LDA #$0020          ; $07D4FB   |
    STA $00             ; $07D4FE   |
    ASL A               ; $07D500   |
    STA $02             ; $07D501   |
    LDA #$0010          ; $07D503   |
    STA $04             ; $07D506   |
    ASL A               ; $07D508   |
    STA $06             ; $07D509   |
    JSL $07FCFB         ; $07D50B   |
    BCS CODE_07D547     ; $07D50F   |
    LDY $7400,x         ; $07D511   |
    LDA $D4DB,y         ; $07D514   |
    STA $7220,x         ; $07D517   |
    LDA #$0010          ; $07D51A   |
    STA $00             ; $07D51D   |
    ASL A               ; $07D51F   |
    STA $02             ; $07D520   |
    LDA #$0010          ; $07D522   |
    STA $04             ; $07D525   |
    ASL A               ; $07D527   |
    STA $06             ; $07D528   |
    JSL $07FCFB         ; $07D52A   |
    BCS CODE_07D533     ; $07D52E   |
    STZ $7220,x         ; $07D530   |

CODE_07D533:
    LDA #$0004          ; $07D533   |
    STA $16,x           ; $07D536   |
    LDA $79D8,x         ; $07D538   |
    CMP #$0000          ; $07D53B   |
    BEQ CODE_07D545     ; $07D53E   |
    CMP #$0002          ; $07D540   |
    BNE CODE_07D547     ; $07D543   |

CODE_07D545:
    INC $76,x           ; $07D545   |

CODE_07D547:
    RTS                 ; $07D547   |

DATA_07D548:         dw $0008, $0004

DATA_07D54C:         dw $FFEC, $0014

CODE_07D550:
    LDY $7400,x         ; $07D550   |
    LDA $7CD6,x         ; $07D553   |
    CLC                 ; $07D556   |
    ADC $D54C,y         ; $07D557   |
    STA $00             ; $07D55A   |
    STA $3010           ; $07D55C   |
    LDA $7CD8,x         ; $07D55F   |
    STA $3000           ; $07D562   |
    LDX #$0A            ; $07D565   |
    LDA #$CE2F          ; $07D567   |
    JSL $7EDE91         ; $07D56A   | GSU init
    LDX $12             ; $07D56E   |
    LDA $300E           ; $07D570   |
    AND #$F800          ; $07D573   |
    CMP #$4000          ; $07D576   |
    BEQ CODE_07D5A0     ; $07D579   |
    LDA $00             ; $07D57B   |
    STA $3010           ; $07D57D   |
    LDA $7CD8,x         ; $07D580   |
    SEC                 ; $07D583   |
    SBC #$0008          ; $07D584   |
    STA $3000           ; $07D587   |
    LDX #$0A            ; $07D58A   |
    LDA #$CE2F          ; $07D58C   |
    JSL $7EDE91         ; $07D58F   | GSU init
    LDX $12             ; $07D593   |
    LDA $300E           ; $07D595   |
    AND #$F800          ; $07D598   |
    CMP #$4000          ; $07D59B   |
    BNE CODE_07D5B5     ; $07D59E   |

CODE_07D5A0:
    LDA #$0006          ; $07D5A0   |
    STA $16,x           ; $07D5A3   |
    LDA $79D8,x         ; $07D5A5   |
    CMP #$0000          ; $07D5A8   |
    BEQ CODE_07D5B2     ; $07D5AB   |
    CMP #$0002          ; $07D5AD   |
    BNE CODE_07D5B4     ; $07D5B0   |

CODE_07D5B2:
    INC $76,x           ; $07D5B2   |

CODE_07D5B4:
    RTS                 ; $07D5B4   |

CODE_07D5B5:
    LDA $79D8,x         ; $07D5B5   |
    CMP #$000C          ; $07D5B8   |
    BEQ CODE_07D5D1     ; $07D5BB   |
    LDY $7400,x         ; $07D5BD   |
    LDA $7860,x         ; $07D5C0   |
    AND $D548,y         ; $07D5C3   |
    BEQ CODE_07D5D1     ; $07D5C6   |
    LDA #$000C          ; $07D5C8   |
    STA $79D8,x         ; $07D5CB   |
    JSR CODE_07D492     ; $07D5CE   |

CODE_07D5D1:
    RTS                 ; $07D5D1   |

CODE_07D5D2:
    LDY $7A38,x         ; $07D5D2   |
    BMI CODE_07D619     ; $07D5D5   |
    LDA $7CD6,x         ; $07D5D7   |
    SEC                 ; $07D5DA   |
    SBC $7CD6,y         ; $07D5DB   |
    STA $00             ; $07D5DE   |
    CLC                 ; $07D5E0   |
    ADC #$0060          ; $07D5E1   |
    CMP #$00C0          ; $07D5E4   |
    BCS CODE_07D619     ; $07D5E7   |
    LDA $00             ; $07D5E9   |
    BPL CODE_07D5F1     ; $07D5EB   |
    EOR #$FFFF          ; $07D5ED   |
    INC A               ; $07D5F0   |

CODE_07D5F1:
    ASL A               ; $07D5F1   |
    STA $00             ; $07D5F2   |
    ASL A               ; $07D5F4   |
    STA $02             ; $07D5F5   |
    LDA $7CD8,x         ; $07D5F7   |
    SEC                 ; $07D5FA   |
    SBC $7CD8,y         ; $07D5FB   |
    CLC                 ; $07D5FE   |
    ADC $00             ; $07D5FF   |
    CMP $02             ; $07D601   |
    BCS CODE_07D619     ; $07D603   |
    LDA #$0006          ; $07D605   |
    STA $16,x           ; $07D608   |
    LDA $79D8,x         ; $07D60A   |
    CMP #$0000          ; $07D60D   |
    BEQ CODE_07D617     ; $07D610   |
    CMP #$0002          ; $07D612   |
    BNE CODE_07D619     ; $07D615   |

CODE_07D617:
    INC $76,x           ; $07D617   |

CODE_07D619:
    RTS                 ; $07D619   |

DATA_07D61A:         dw $FFF0, $0010

CODE_07D61E:
    LDA $7400,x         ; $07D61E   |
    DEC A               ; $07D621   |
    STA $00             ; $07D622   |
    LDY $7D36,x         ; $07D624   |
    BMI CODE_07D64F     ; $07D627   |
    DEY                 ; $07D629   |
    BEQ CODE_07D64F     ; $07D62A   |
    BMI CODE_07D64F     ; $07D62C   |
    LDA $6F00,y         ; $07D62E   |
    CMP #$0010          ; $07D631   |
    BNE CODE_07D64F     ; $07D634   |
    LDA $7D38,y         ; $07D636   |
    BEQ CODE_07D64F     ; $07D639   |
    LDA $7400,x         ; $07D63B   |
    DEC A               ; $07D63E   |
    STA $02             ; $07D63F   |
    LDA $7CD6,x         ; $07D641   |
    SEC                 ; $07D644   |
    SBC $7CD6,y         ; $07D645   |
    EOR $02             ; $07D648   |
    BMI CODE_07D64F     ; $07D64A   |
    JMP CODE_07D6A2     ; $07D64C   |

CODE_07D64F:
    LDY $7A38,x         ; $07D64F   |
    BMI CODE_07D6A2     ; $07D652   |
    LDA $7BB8,x         ; $07D654   |
    CLC                 ; $07D657   |
    ADC #$0008          ; $07D658   |
    CLC                 ; $07D65B   |
    ADC $7BB8,y         ; $07D65C   |
    STA $04             ; $07D65F   |
    ASL A               ; $07D661   |
    STA $02             ; $07D662   |
    LDA $7CD8,x         ; $07D664   |
    SEC                 ; $07D667   |
    SBC $7CD8,y         ; $07D668   |
    CLC                 ; $07D66B   |
    ADC $04             ; $07D66C   |
    CMP $02             ; $07D66E   |
    BCS CODE_07D6A2     ; $07D670   |
    LDA $7CD6,x         ; $07D672   |
    SEC                 ; $07D675   |
    SBC $7CD6,y         ; $07D676   |
    STA $02             ; $07D679   |
    EOR $00             ; $07D67B   |
    BPL CODE_07D6A2     ; $07D67D   |
    LDA $7BB6,x         ; $07D67F   |
    CLC                 ; $07D682   |
    ADC #$0008          ; $07D683   |
    CLC                 ; $07D686   |
    ADC $7BB6,y         ; $07D687   |
    STA $04             ; $07D68A   |
    LDA $02             ; $07D68C   |
    BPL CODE_07D694     ; $07D68E   |
    EOR #$FFFF          ; $07D690   |
    INC A               ; $07D693   |

CODE_07D694:
    CMP $04             ; $07D694   |
    BCS CODE_07D6A2     ; $07D696   |
    TYX                 ; $07D698   |
    JSL $03B24B         ; $07D699   |
    INC $7900,x         ; $07D69D   |
    LDX $12             ; $07D6A0   |

CODE_07D6A2:
    LDA $7BB8,x         ; $07D6A2   |
    CLC                 ; $07D6A5   |
    ADC $6122           ; $07D6A6   |
    STA $02             ; $07D6A9   |
    ASL A               ; $07D6AB   |
    STA $04             ; $07D6AC   |
    LDA $7CD8,x         ; $07D6AE   |
    SEC                 ; $07D6B1   |
    SBC $611E           ; $07D6B2   |
    CLC                 ; $07D6B5   |
    ADC $02             ; $07D6B6   |
    CMP $7964           ; $07D6B8   |
    BCS CODE_07D700     ; $07D6BB   |
    LDA $7CD6,x         ; $07D6BD   |
    SEC                 ; $07D6C0   |
    SBC $611C           ; $07D6C1   |
    STA $02             ; $07D6C4   |
    EOR $00             ; $07D6C6   |
    BPL CODE_07D700     ; $07D6C8   |
    LDA $7BB6,x         ; $07D6CA   |
    CLC                 ; $07D6CD   |
    ADC #$0008          ; $07D6CE   |
    CLC                 ; $07D6D1   |
    ADC $6120           ; $07D6D2   |
    STA $04             ; $07D6D5   |
    LDA $02             ; $07D6D7   |
    BPL CODE_07D6DF     ; $07D6D9   |
    EOR #$FFFF          ; $07D6DB   |
    INC A               ; $07D6DE   |

CODE_07D6DF:
    CMP $04             ; $07D6DF   |
    BCS CODE_07D700     ; $07D6E1   |
    LDA $61D6           ; $07D6E3   |
    BNE CODE_07D6FC     ; $07D6E6   |
    LDY $7400,x         ; $07D6E8   |
    LDA $7CD6,x         ; $07D6EB   |
    CLC                 ; $07D6EE   |
    ADC $D61A,y         ; $07D6EF   |
    STA $00             ; $07D6F2   |
    LDA $7CD8,x         ; $07D6F4   |
    STA $02             ; $07D6F7   |
    JSR CODE_07FD16     ; $07D6F9   |

CODE_07D6FC:
    JSL $03A858         ; $07D6FC   |

CODE_07D700:
    RTS                 ; $07D700   |

CODE_07D701:
    LDY $7400,x         ; $07D701   |
    LDA $7CD6,x         ; $07D704   |
    CLC                 ; $07D707   |
    ADC $D54C,y         ; $07D708   |
    STA $00             ; $07D70B   |
    STA $3010           ; $07D70D   |
    LDA $7CD8,x         ; $07D710   |
    STA $02             ; $07D713   |
    STA $3000           ; $07D715   |
    LDX #$0A            ; $07D718   |
    LDA #$CE2F          ; $07D71A   |
    JSL $7EDE91         ; $07D71D   | GSU init
    LDX $12             ; $07D721   |
    LDA $300E           ; $07D723   |
    AND #$F800          ; $07D726   |
    CMP #$4000          ; $07D729   |
    BNE CODE_07D731     ; $07D72C   |
    JSR CODE_07D75C     ; $07D72E   |

CODE_07D731:
    LDA $00             ; $07D731   |
    STA $3010           ; $07D733   |
    LDA $7CD8,x         ; $07D736   |
    SEC                 ; $07D739   |
    SBC #$0008          ; $07D73A   |
    STA $02             ; $07D73D   |
    STA $3000           ; $07D73F   |
    LDX #$0A            ; $07D742   |
    LDA #$CE2F          ; $07D744   |
    JSL $7EDE91         ; $07D747   | GSU init
    LDX $12             ; $07D74B   |
    LDA $300E           ; $07D74D   |
    AND #$F800          ; $07D750   |
    CMP #$4000          ; $07D753   |
    BNE CODE_07D75B     ; $07D756   |
    JSR CODE_07D75C     ; $07D758   |

CODE_07D75B:
    RTS                 ; $07D75B   |


CODE_07D75C:
    LDA #$0000          ; $07D75C   |
    STA $008F           ; $07D75F   |
    LDA $00             ; $07D762   |
    STA $0091           ; $07D764   |
    LDA $02             ; $07D767   |
    STA $0093           ; $07D769   |
    JSL $109295         ; $07D76C   |
    LDX $12             ; $07D770   |
    LDA #$01C3          ; $07D772   |
    JSL $008B21         ; $07D775   |
    LDA $00             ; $07D779   |
    AND #$FFF0          ; $07D77B   |
    STA $70A2,y         ; $07D77E   |
    LDA $02             ; $07D781   |
    AND #$FFF0          ; $07D783   |
    STA $7142,y         ; $07D786   |
    LDA #$000A          ; $07D789   |
    STA $73C2,y         ; $07D78C   |
    LDA #$0002          ; $07D78F   |
    STA $7782,y         ; $07D792   |
    LDA #$000A          ; $07D795   |\ play sound #$000A
    JSL $0085D2         ; $07D798   |/
    RTS                 ; $07D79C   |

CODE_07D79D:
    LDA $7900,x         ; $07D79D   |
    BNE CODE_07D7EA     ; $07D7A0   |
    LDY $7D36,x         ; $07D7A2   |
    BMI CODE_07D7EB     ; $07D7A5   |
    DEY                 ; $07D7A7   |
    BMI CODE_07D7EA     ; $07D7A8   |
    BEQ CODE_07D7EA     ; $07D7AA   |
    LDA $6F00,y         ; $07D7AC   |
    CMP #$0010          ; $07D7AF   |
    BNE CODE_07D7EA     ; $07D7B2   |
    LDA $7D38,y         ; $07D7B4   |
    BEQ CODE_07D7EA     ; $07D7B7   |
    LDA $7220,y         ; $07D7B9   |
    CMP #$8000          ; $07D7BC   |
    ROR A               ; $07D7BF   |
    CMP #$8000          ; $07D7C0   |
    ROR A               ; $07D7C3   |
    STA $7220,x         ; $07D7C4   |
    TYX                 ; $07D7C7   |
    JSL $03B24B         ; $07D7C8   |
    LDX $12             ; $07D7CC   |

CODE_07D7CE:
    LDA #$000E          ; $07D7CE   |
    STA $6F00,x         ; $07D7D1   |
    LDA #$0010          ; $07D7D4   |
    STA $18,x           ; $07D7D7   |
    SEP #$20            ; $07D7D9   |
    TAY                 ; $07D7DB   |
    LDA $D835,y         ; $07D7DC   |
    STA $7402,x         ; $07D7DF   |
    LDA $D846,y         ; $07D7E2   |
    STA $7A96,x         ; $07D7E5   |
    REP #$20            ; $07D7E8   |

CODE_07D7EA:
    RTL                 ; $07D7EA   |

CODE_07D7EB:
    LDA $7E04           ; $07D7EB   |
    BNE CODE_07D805     ; $07D7EE   |
    JSL $07FC2F         ; $07D7F0   |
    BCC CODE_07D803     ; $07D7F4   |

CODE_07D7F6:
    JSL $03B20B         ; $07D7F6   |
    LDA #$001C          ; $07D7FA   |\
    JSL $0085D2         ; $07D7FD   |/ play sound #$001C
    BRA CODE_07D7CE     ; $07D801   |

CODE_07D803:
    BEQ CODE_07D809     ; $07D803   |

CODE_07D805:
    JSL $03A858         ; $07D805   |

CODE_07D809:
    RTL                 ; $07D809   |

DATA_07D80A:         db $01, $20

CODE_07D80C:
    LDY #$BD00          ; $07D80C   |
    RTS                 ; $07D80F   |

DATA_07D810:         db $78, $89, $01, $00, $F0, $01, $C8

    LDA $D80A,y         ; $07D817   |
    AND #$00FF          ; $07D81A   |
    STA $7540,x         ; $07D81D   |
    LDA $7220,x         ; $07D820   |
    BEQ CODE_07D82E     ; $07D823   |
    LDA $7400,x         ; $07D825   |
    DEC A               ; $07D828   |
    EOR $7220,x         ; $07D829   |
    BMI CODE_07D834     ; $07D82C   |

CODE_07D82E:
    STZ $7220,x         ; $07D82E   |
    STZ $7540,x         ; $07D831   |

CODE_07D834:
    RTL                 ; $07D834   |

DATA_07D835:         db $2A, $2B, $2A, $2B, $2A, $2B, $2A, $2A
DATA_07D83D:         db $29, $28, $27, $26, $25, $24, $23, $22
DATA_07D845:         db $00

DATA_07D846:         db $20, $02, $02, $02, $02, $02, $02, $22
DATA_07D84E:         db $02, $02, $80, $02, $04, $02, $02, $04
DATA_07D856:         db $02

.head_bop_zeus_guy
    LDA $7042,x         ; $07D857   |
    AND #$FFF1          ; $07D85A   |
    STA $7042,x         ; $07D85D   |
    LDA $7860,x         ; $07D860   |
    BIT #$0001          ; $07D863   |
    BEQ CODE_07D86B     ; $07D866   |
    STZ $7220,x         ; $07D868   |

CODE_07D86B:
    LDA $7A96,x         ; $07D86B   |
    BNE CODE_07D898     ; $07D86E   |
    DEC $18,x           ; $07D870   |
    BMI CODE_07D8B0     ; $07D872   |
    SEP #$20            ; $07D874   |
    LDY $18,x           ; $07D876   |
    LDA $D835,y         ; $07D878   |
    STA $7402,x         ; $07D87B   |
    LDA $D846,y         ; $07D87E   |
    STA $7A96,x         ; $07D881   |
    REP #$20            ; $07D884   |
    CPY #$0F            ; $07D886   |
    BNE CODE_07D898     ; $07D888   |
    LDA $7860,x         ; $07D88A   |
    AND #$0001          ; $07D88D   |
    BEQ CODE_07D898     ; $07D890   |
    LDA #$FE80          ; $07D892   |
    STA $7222,x         ; $07D895   |

CODE_07D898:
    JSL $07FD6C         ; $07D898   |
    BEQ CODE_07D8A7     ; $07D89C   |
    PHP                 ; $07D89E   |
    LDA $7E04           ; $07D89F   |
    BNE CODE_07D8AB     ; $07D8A2   |
    PLP                 ; $07D8A4   |
    BCS CODE_07D8A8     ; $07D8A5   |

CODE_07D8A7:
    RTL                 ; $07D8A7   |

CODE_07D8A8:
    JMP CODE_07D7F6     ; $07D8A8   |

CODE_07D8AB:
    PLP                 ; $07D8AB   |
    JMP CODE_0703B2     ; $07D8AC   |

CODE_07D8B0:
    LDA #$0010          ; $07D8B0   |
    STA $6F00,x         ; $07D8B3   |
    JMP CODE_0707CE     ; $07D8B6   |

DATA_07D8BA:         db $01, $02, $03, $04, $05, $06, $07, $08
DATA_07D8C2:         db $09, $0A, $0B, $0A, $09, $08, $07, $06
DATA_07D8CA:         db $05, $04, $03, $02, $01, $00

DATA_07D8D0:         dw $FF00, $0100

.init_zeus_guy_energy
    LDA #$0015          ; $07D8D4   |
    STA $18,x           ; $07D8D7   |
    SEP #$20            ; $07D8D9   |
    TAY                 ; $07D8DB   |
    LDA $D8BA,y         ; $07D8DC   |
    STA $7402,x         ; $07D8DF   |
    LDA #$01            ; $07D8E2   |
    STA $7A96,x         ; $07D8E4   |
    REP #$20            ; $07D8E7   |
    LDY $7400,x         ; $07D8E9   |
    LDA $D8D0,y         ; $07D8EC   |
    STA $7220,x         ; $07D8EF   |
    RTL                 ; $07D8F2   |

.main_zeus_guy_energy
    JSL $03AF23         ; $07D8F3   |
    LDA $7A96,x         ; $07D8F7   |
    BNE CODE_07D91E     ; $07D8FA   |
    DEC $18,x           ; $07D8FC   |
    BPL CODE_07D905     ; $07D8FE   |
    LDA #$0015          ; $07D900   |
    STA $18,x           ; $07D903   |

CODE_07D905:
    SEP #$20            ; $07D905   |
    LDY $18,x           ; $07D907   |
    LDA $D8BA,y         ; $07D909   |
    STA $7402,x         ; $07D90C   |
    LDA $7402,x         ; $07D90F   |
    EOR #$01            ; $07D912   |
    STA $7402,x         ; $07D914   |
    LDA #$01            ; $07D917   |
    STA $7A96,x         ; $07D919   |
    REP #$20            ; $07D91C   |

CODE_07D91E:
    LDY $7D36,x         ; $07D91E   |
    BPL CODE_07D955     ; $07D921   |
    LDA #$020A          ; $07D923   |
    JSL $008B21         ; $07D926   |
    LDA $70E2,x         ; $07D92A   |
    SEC                 ; $07D92D   |
    SBC #$0004          ; $07D92E   |
    STA $70A2,y         ; $07D931   |
    LDA $7182,x         ; $07D934   |
    SEC                 ; $07D937   |
    SBC #$0004          ; $07D938   |
    STA $7142,y         ; $07D93B   |
    LDA #$0008          ; $07D93E   |
    STA $7782,y         ; $07D941   |
    LDA #$0004          ; $07D944   |
    STA $73C2,y         ; $07D947   |
    STA $7E4C,y         ; $07D94A   |
    JSL $03A858         ; $07D94D   |
    JSL $03A31E         ; $07D951   |

CODE_07D955:
    RTL                 ; $07D955   |

.init_koopa_shell                            ; red and green
    LDA #$0002          ; $07D956   |
    STA $78,x           ; $07D959   |
    RTL                 ; $07D95B   |

DATA_07D95C:         dw $0380, $FC80

DATA_07D960:         dw $FE40, $FF00

.main_koopa_shell                            ; red and green
    LDA $6F00,x         ; $07D964   |
    CMP #$0010          ; $07D967   |
    BEQ CODE_07D971     ; $07D96A   |
    STZ $79D6,x         ; $07D96C   |
    BRA CODE_07D976     ; $07D96F   |

CODE_07D971:
    LDA $7D38,x         ; $07D971   |
    BNE CODE_07D980     ; $07D974   |

CODE_07D976:
    JSL $03AF23         ; $07D976   |
    JSL $07E336         ; $07D97A   |
    BRA CODE_07D994     ; $07D97E   |

CODE_07D980:
    LDA $61B0           ; $07D980   |
    BEQ CODE_07D986     ; $07D983   |
    RTL                 ; $07D985   |

CODE_07D986:
    LDA $7D38,x         ; $07D986   |
    CMP #$0002          ; $07D989   |
    BCC CODE_07D991     ; $07D98C   |
    DEC $7D38,x         ; $07D98E   |

CODE_07D991:
    JSR CODE_07DC8C     ; $07D991   |

CODE_07D994:
    LDA $7860,x         ; $07D994   |
    BIT #$0001          ; $07D997   |
    BEQ CODE_07D9AA     ; $07D99A   |
    LDA $79D8,x         ; $07D99C   |
    CMP #$0002          ; $07D99F   |
    BCS CODE_07D9AD     ; $07D9A2   |
    INC A               ; $07D9A4   |
    STA $79D8,x         ; $07D9A5   |
    BRA CODE_07D9AD     ; $07D9A8   |

CODE_07D9AA:
    STZ $79D8,x         ; $07D9AA   |

CODE_07D9AD:
    LDA $79D8,x         ; $07D9AD   |
    CMP #$0001          ; $07D9B0   |
    BNE CODE_07D9CF     ; $07D9B3   |
    LDA #$001D          ; $07D9B5   |\ play sound #$001D
    JSL $0085D2         ; $07D9B8   |/
    LDA $76,x           ; $07D9BC   |
    CMP #$0002          ; $07D9BE   |
    BCS CODE_07D9CF     ; $07D9C1   |
    LDA $76,x           ; $07D9C3   |
    ASL A               ; $07D9C5   |
    TAY                 ; $07D9C6   |
    LDA $D960,y         ; $07D9C7   |
    STA $7222,x         ; $07D9CA   |
    INC $76,x           ; $07D9CD   |

CODE_07D9CF:
    LDA $7220,x         ; $07D9CF   |
    CLC                 ; $07D9D2   |
    ADC #$0180          ; $07D9D3   |
    CMP #$0301          ; $07D9D6   |
    BCS CODE_07DA52     ; $07D9D9   |
    LDY $7D38,x         ; $07D9DB   |
    CPY #$B002          ; $07D9DE   |
    ORA $BC             ; $07D9E1   |
    ROL $7D,x           ; $07D9E3   |
    BMI CODE_07D9EA     ; $07D9E5   |
    JMP CODE_07DA7A     ; $07D9E7   |

CODE_07D9EA:
    JSL $07FC2F         ; $07D9EA   |
    BCC CODE_07D9F9     ; $07D9EE   |
    JSL $03B20B         ; $07D9F0   |
    LDA #$001C          ; $07D9F4   |
    BRA CODE_07D9FC     ; $07D9F7   |

CODE_07D9F9:
    LDA #$000B          ; $07D9F9   |\ play sound #$000B

CODE_07D9FC:
    JSL $0085D2         ; $07D9FC   |/
    LDA $61D6           ; $07DA00   |
    CMP #$0020          ; $07DA03   |
    BCS CODE_07DA0E     ; $07DA06   |
    LDA #$0020          ; $07DA08   |
    STA $61D6           ; $07DA0B   |

CODE_07DA0E:
    LDA $60A8           ; $07DA0E   |
    BPL CODE_07DA17     ; $07DA11   |
    EOR #$FFFF          ; $07DA13   |
    INC A               ; $07DA16   |

CODE_07DA17:
    STA $00             ; $07DA17   |
    CMP #$0300          ; $07DA19   |
    BMI CODE_07DA26     ; $07DA1C   |
    LDA $00             ; $07DA1E   |
    CLC                 ; $07DA20   |
    ADC #$0080          ; $07DA21   |
    BRA CODE_07DA29     ; $07DA24   |

CODE_07DA26:
    LDA #$0380          ; $07DA26   |

CODE_07DA29:
    STA $00             ; $07DA29   |
    EOR #$FFFF          ; $07DA2B   |
    INC A               ; $07DA2E   |
    STA $02             ; $07DA2F   |
    LDA $7CD6,x         ; $07DA31   |
    SEC                 ; $07DA34   |
    SBC $611C           ; $07DA35   |
    AND #$8000          ; $07DA38   |
    ASL A               ; $07DA3B   |
    ROL A               ; $07DA3C   |
    ASL A               ; $07DA3D   |
    TAY                 ; $07DA3E   |
    LDA $7960,y         ; $07DA3F   |
    STA $7220,x         ; $07DA42   |
    LDA #$0004          ; $07DA45   |
    STA $7A96,x         ; $07DA48   |
    LDA #$0001          ; $07DA4B   |
    STA $7D38,x         ; $07DA4E   |
    RTL                 ; $07DA51   |

CODE_07DA52:
    LDA $7860,x         ; $07DA52   |
    AND #$000E          ; $07DA55   |
    BEQ CODE_07DA61     ; $07DA58   |
    LDA #$001C          ; $07DA5A   |\ play sound #$001C
    JSL $0085D2         ; $07DA5D   |/

CODE_07DA61:
    LDA $7A96,x         ; $07DA61   |
    BNE CODE_07DA76     ; $07DA64   |
    LDA $7402,x         ; $07DA66   |
    INC A               ; $07DA69   |
    AND #$0003          ; $07DA6A   |
    STA $7402,x         ; $07DA6D   |
    LDA #$0004          ; $07DA70   |
    STA $7A96,x         ; $07DA73   |

CODE_07DA76:
    JSR CODE_07DAA8     ; $07DA76   |
    RTL                 ; $07DA79   |

CODE_07DA7A:
    LDA $7A98,x         ; $07DA7A   |
    BNE CODE_07DA9B     ; $07DA7D   |
    LDA $7860,x         ; $07DA7F   |
    AND #$0001          ; $07DA82   |
    BNE CODE_07DA8B     ; $07DA85   |
    JSR CODE_07DAA8     ; $07DA87   |
    RTL                 ; $07DA8A   |

CODE_07DA8B:
    LDA $76,x           ; $07DA8B   |
    CMP #$0002          ; $07DA8D   |
    BCC CODE_07DA95     ; $07DA90   |
    STZ $7220,x         ; $07DA92   |

CODE_07DA95:
    STZ $7D38,x         ; $07DA95   |
    JSR CODE_07DC43     ; $07DA98   |

CODE_07DA9B:
    RTL                 ; $07DA9B   |

DATA_07DA9C:         db $0C, $0D, $0E, $0F, $10, $11, $12, $12

DATA_07DAA4:         dw $0200, $FE00

CODE_07DAA8:
    LDY $7D36,x         ; $07DAA8   |
    BPL CODE_07DADC     ; $07DAAB   |
    LDA $7D38,x         ; $07DAAD   |
    CMP #$0002          ; $07DAB0   |
    BCS CODE_07DADC     ; $07DAB3   |
    JSL $07FC2F         ; $07DAB5   |
    BCC CODE_07DAD5     ; $07DAB9   |
    LDA #$001C          ; $07DABB   |\ play sound #$001C
    JSL $0085D2         ; $07DABE   |/
    STZ $7220,x         ; $07DAC2   |
    JSL $03B20B         ; $07DAC5   |
    LDA $7860,x         ; $07DAC9   |
    BIT #$0001          ; $07DACC   |
    BEQ CODE_07DAD4     ; $07DACF   |
    STZ $7D38,x         ; $07DAD1   |

CODE_07DAD4:
    RTS                 ; $07DAD4   |

CODE_07DAD5:
    BEQ CODE_07DADB     ; $07DAD5   |
    JSL $03A858         ; $07DAD7   |

CODE_07DADB:
    RTS                 ; $07DADB   |

CODE_07DADC:
    DEY                 ; $07DADC   |
    BMI CODE_07DB5C     ; $07DADD   |
    BEQ CODE_07DB5C     ; $07DADF   |
    LDA $6F00,y         ; $07DAE1   |
    CMP #$0010          ; $07DAE4   |
    BNE CODE_07DB5C     ; $07DAE7   |
    LDA $7360,y         ; $07DAE9   |
    CMP #$0022          ; $07DAEC   |
    BCC CODE_07DAF6     ; $07DAEF   |
    CMP #$002C          ; $07DAF1   |
    BCC CODE_07DAFB     ; $07DAF4   |

CODE_07DAF6:
    CMP #$0107          ; $07DAF6   |
    BNE CODE_07DB00     ; $07DAF9   |

CODE_07DAFB:
    LDA $7D38,y         ; $07DAFB   |
    BNE CODE_07DB1A     ; $07DAFE   |

CODE_07DB00:
    LDA $6FA2,y         ; $07DB00   |
    BIT #$6000          ; $07DB03   |
    BNE CODE_07DB5C     ; $07DB06   |
    LDA $7360,y         ; $07DB08   |
    CMP #$0167          ; $07DB0B   |
    BCC CODE_07DB15     ; $07DB0E   |
    CMP #$0170          ; $07DB10   |
    BCC CODE_07DB5D     ; $07DB13   |

CODE_07DB15:
    LDA $7D38,y         ; $07DB15   |
    BEQ CODE_07DB1D     ; $07DB18   |

CODE_07DB1A:
    JMP CODE_07DC05     ; $07DB1A   |

CODE_07DB1D:
    LDA $6FA0,y         ; $07DB1D   |
    BIT #$0020          ; $07DB20   |
    BNE CODE_07DB5C     ; $07DB23   |
    LDA $7A36,x         ; $07DB25   |
    INC A               ; $07DB28   |
    CMP #$0009          ; $07DB29   |
    BCS CODE_07DB31     ; $07DB2C   |
    STA $7A36,x         ; $07DB2E   |

CODE_07DB31:
    CMP #$0008          ; $07DB31   |
    BCC CODE_07DB3F     ; $07DB34   |
    PHX                 ; $07DB36   |
    PHY                 ; $07DB37   |
    TYX                 ; $07DB38   |
    JSL $03A496         ; $07DB39   |
    PLY                 ; $07DB3D   |
    PLX                 ; $07DB3E   |

CODE_07DB3F:
    TYX                 ; $07DB3F   |
    JSL $0CFF61         ; $07DB40   |
    JSL $03A32E         ; $07DB44   |
    LDX $12             ; $07DB48   |

CODE_07DB4A:
    LDY $7A36,x         ; $07DB4A   |
    DEY                 ; $07DB4D   |
    CPY #$07            ; $07DB4E   |
    BCS CODE_07DB5C     ; $07DB50   |
    LDA $DA9C,y         ; $07DB52   |
    AND #$00FF          ; $07DB55   |
    JSL $0085D2         ; $07DB58   |

CODE_07DB5C:
    RTS                 ; $07DB5C   |

CODE_07DB5D:
    CMP #$0169          ; $07DB5D   |
    BCS CODE_07DB9F     ; $07DB60   |
    LDA $7D38,y         ; $07DB62   |
    BEQ CODE_07DB9F     ; $07DB65   |
    PHY                 ; $07DB67   |
    JSL $03B288         ; $07DB68   |
    SEP #$20            ; $07DB6C   |
    LDA #$FF            ; $07DB6E   |
    STA $74A0,x         ; $07DB70   |
    LDA $7C77,x         ; $07DB73   |
    AND #$80            ; $07DB76   |
    ASL A               ; $07DB78   |
    ROL A               ; $07DB79   |
    ASL A               ; $07DB7A   |
    EOR #$02            ; $07DB7B   |
    TAY                 ; $07DB7D   |
    REP #$20            ; $07DB7E   |
    LDA $DAA4,y         ; $07DB80   |
    STA $7220,x         ; $07DB83   |
    LDA #$000E          ; $07DB86   |
    STA $6F00,x         ; $07DB89   |
    LDA #$0040          ; $07DB8C   |
    STA $7542,x         ; $07DB8F   |
    LDA #$0400          ; $07DB92   |
    STA $75E2,x         ; $07DB95   |
    LDA #$FC00          ; $07DB98   |
    STA $7222,x         ; $07DB9B   |
    PLY                 ; $07DB9E   |

CODE_07DB9F:
    LDA $7A36,x         ; $07DB9F   |
    INC A               ; $07DBA2   |
    CMP #$0009          ; $07DBA3   |
    BCS CODE_07DBAB     ; $07DBA6   |
    STA $7A36,x         ; $07DBA8   |

CODE_07DBAB:
    CMP #$0008          ; $07DBAB   |
    BCC CODE_07DBB9     ; $07DBAE   |
    PHX                 ; $07DBB0   |
    PHY                 ; $07DBB1   |
    TYX                 ; $07DBB2   |
    JSL $03A496         ; $07DBB3   |
    PLY                 ; $07DBB7   |
    PLX                 ; $07DBB8   |

CODE_07DBB9:
    PHY                 ; $07DBB9   |
    TYX                 ; $07DBBA   |
    JSL $0CFF61         ; $07DBBB   |
    JSL $03B24B         ; $07DBBF   |
    PLY                 ; $07DBC3   |
    LDX $12             ; $07DBC4   |
    SEP #$20            ; $07DBC6   |
    LDA $7C77,x         ; $07DBC8   |
    AND #$80            ; $07DBCB   |
    ASL A               ; $07DBCD   |
    ROL A               ; $07DBCE   |
    ASL A               ; $07DBCF   |
    TAX                 ; $07DBD0   |
    REP #$20            ; $07DBD1   |
    LDA $DAA4,x         ; $07DBD3   |
    STA $7220,y         ; $07DBD6   |
    LDA #$000E          ; $07DBD9   |
    STA $6F00,y         ; $07DBDC   |
    LDA #$0040          ; $07DBDF   |
    STA $7542,y         ; $07DBE2   |
    LDA #$0400          ; $07DBE5   |
    STA $75E2,y         ; $07DBE8   |
    LDA #$FC00          ; $07DBEB   |
    STA $7222,y         ; $07DBEE   |
    LDA $6FA2,y         ; $07DBF1   |
    ORA #$0020          ; $07DBF4   |
    STA $6FA2,y         ; $07DBF7   |
    LDA #$0001          ; $07DBFA   |
    STA $7900,y         ; $07DBFD   |
    LDX $12             ; $07DC00   |
    JMP CODE_07DB4A     ; $07DC02   |

CODE_07DC05:
    TYX                 ; $07DC05   |
    JSL $03B24B         ; $07DC06   |
    BCS CODE_07DC42     ; $07DC0A   |
    JSL $03B288         ; $07DC0C   |
    SEP #$20            ; $07DC10   |
    LDA #$FF            ; $07DC12   |
    STA $74A0,x         ; $07DC14   |
    LDA $7C77,x         ; $07DC17   |
    AND #$80            ; $07DC1A   |
    ASL A               ; $07DC1C   |
    ROL A               ; $07DC1D   |
    ASL A               ; $07DC1E   |
    EOR #$02            ; $07DC1F   |
    TAY                 ; $07DC21   |
    REP #$20            ; $07DC22   |
    LDA $DAA4,y         ; $07DC24   |
    STA $7220,x         ; $07DC27   |
    LDA #$000E          ; $07DC2A   |
    STA $6F00,x         ; $07DC2D   |
    LDA #$0040          ; $07DC30   |
    STA $7542,x         ; $07DC33   |
    LDA #$0400          ; $07DC36   |
    STA $75E2,x         ; $07DC39   |
    LDA #$FC00          ; $07DC3C   |
    STA $7222,x         ; $07DC3F   |

CODE_07DC42:
    RTS                 ; $07DC42   |

CODE_07DC43:
    LDY $7D36,x         ; $07DC43   |
    DEY                 ; $07DC46   |
    BMI CODE_07DC8B     ; $07DC47   |
    BEQ CODE_07DC8B     ; $07DC49   |
    LDA $6F00,y         ; $07DC4B   |
    CMP #$0010          ; $07DC4E   |
    BNE CODE_07DC8B     ; $07DC51   |
    LDA $7D38,y         ; $07DC53   |
    BEQ CODE_07DC8B     ; $07DC56   |
    LDA $7360,y         ; $07DC58   |
    CMP #$0167          ; $07DC5B   |
    BCC CODE_07DC65     ; $07DC5E   |
    CMP #$0169          ; $07DC60   |
    BCC CODE_07DC8B     ; $07DC63   |

CODE_07DC65:
    STZ $00             ; $07DC65   |
    LDA $7CD6,x         ; $07DC67   |
    SEC                 ; $07DC6A   |
    SBC $7CD6,y         ; $07DC6B   |
    BPL CODE_07DC74     ; $07DC6E   |
    INC $00             ; $07DC70   |
    INC $00             ; $07DC72   |

CODE_07DC74:
    TYX                 ; $07DC74   |
    JSL $03B24B         ; $07DC75   |
    BCS CODE_07DC8B     ; $07DC79   |
    LDX $12             ; $07DC7B   |
    LDY $00             ; $07DC7D   |
    LDA $D95C,y         ; $07DC7F   |
    STA $7220,x         ; $07DC82   |
    LDA #$0001          ; $07DC85   |
    STA $7D38,x         ; $07DC88   |

CODE_07DC8B:
    RTS                 ; $07DC8B   |

CODE_07DC8C:
    LDA $7860,x         ; $07DC8C   |
    AND #$000E          ; $07DC8F   |
    BEQ CODE_07DC8B     ; $07DC92   |
    BIT #$0008          ; $07DC94   |
    BNE CODE_07DCED     ; $07DC97   |
    BIT #$0004          ; $07DC99   |
    BNE CODE_07DCC7     ; $07DC9C   |
    LDA $7902,x         ; $07DC9E   |
    REP #$10            ; $07DCA1   |
    TAX                 ; $07DCA3   |
    LDA $70001C,x       ; $07DCA4   |
    AND #$F800          ; $07DCA8   |
    CMP #$4000          ; $07DCAB   |
    BNE CODE_07DCC4     ; $07DCAE   |
    LDA $700018,x       ; $07DCB0   |
    STA $00             ; $07DCB4   |
    STA $0091           ; $07DCB6   |
    LDA $70001A,x       ; $07DCB9   |
    STA $02             ; $07DCBD   |
    STA $0093           ; $07DCBF   |
    BRA CODE_07DD11     ; $07DCC2   |

CODE_07DCC4:
    JMP CODE_07DD49     ; $07DCC4   |

CODE_07DCC7:
    LDA $7902,x         ; $07DCC7   |
    REP #$10            ; $07DCCA   |
    TAX                 ; $07DCCC   |
    LDA $700014,x       ; $07DCCD   |
    AND #$F800          ; $07DCD1   |
    CMP #$4000          ; $07DCD4   |
    BNE CODE_07DD49     ; $07DCD7   |
    LDA $700010,x       ; $07DCD9   |
    STA $00             ; $07DCDD   |
    STA $0091           ; $07DCDF   |
    LDA $700012,x       ; $07DCE2   |
    STA $02             ; $07DCE6   |
    STA $0093           ; $07DCE8   |
    BRA CODE_07DD11     ; $07DCEB   |

CODE_07DCED:
    LDA $7902,x         ; $07DCED   |
    REP #$10            ; $07DCF0   |
    TAX                 ; $07DCF2   |
    LDA $70000C,x       ; $07DCF3   |
    AND #$F800          ; $07DCF7   |
    CMP #$4000          ; $07DCFA   |
    BNE CODE_07DD49     ; $07DCFD   |
    LDA $700008,x       ; $07DCFF   |
    STA $00             ; $07DD03   |
    STA $0091           ; $07DD05   |
    LDA $70000A,x       ; $07DD08   |
    STA $02             ; $07DD0C   |
    STA $0093           ; $07DD0E   |

CODE_07DD11:
    SEP #$10            ; $07DD11   |
    LDA #$0000          ; $07DD13   |
    STA $008F           ; $07DD16   |
    JSL $109295         ; $07DD19   |
    LDX $12             ; $07DD1D   |
    LDA #$01C3          ; $07DD1F   |
    JSL $008B21         ; $07DD22   |
    LDA $00             ; $07DD26   |
    AND #$FFF0          ; $07DD28   |
    STA $70A2,y         ; $07DD2B   |
    LDA $02             ; $07DD2E   |
    AND #$FFF0          ; $07DD30   |
    STA $7142,y         ; $07DD33   |
    LDA #$000A          ; $07DD36   |
    STA $73C2,y         ; $07DD39   |
    LDA #$0002          ; $07DD3C   |
    STA $7782,y         ; $07DD3F   |
    LDA #$000A          ; $07DD42   |\ play sound #$000A
    JSL $0085D2         ; $07DD45   |/

CODE_07DD49:
    SEP #$10            ; $07DD49   |
    LDX $12             ; $07DD4B   |
    RTS                 ; $07DD4D   |

DATA_07DD4E:         dw $FFA0, $0060

.init_beach_koopa                            ; red and green
    LDY $7400,x         ; $07DD52   |
    LDA $DD4E,y         ; $07DD55   |
    STA $7220,x         ; $07DD58   |
    LDA #$010A          ; $07DD5B   |
    STA $7A36,x         ; $07DD5E   |
    LDA $7860,x         ; $07DD61   |
    STA $7A38,x         ; $07DD64   |
    SEP #$20            ; $07DD67   |
    STZ $7402,x         ; $07DD69   |
    LDA #$05            ; $07DD6C   |
    STA $7A96,x         ; $07DD6E   |
    LDA #$00            ; $07DD71   |
    STA $16,x           ; $07DD73   |
    REP #$20            ; $07DD75   |
    RTL                 ; $07DD77   |

.init_koopa                                  ; red and green
    LDY $7400,x         ; $07DD78   |
    LDA $DD4E,y         ; $07DD7B   |
    STA $7220,x         ; $07DD7E   |
    LDA #$000A          ; $07DD81   |
    STA $7A36,x         ; $07DD84   |
    LDA $7860,x         ; $07DD87   |
    STA $7A38,x         ; $07DD8A   |
    SEP #$20            ; $07DD8D   |
    STZ $7402,x         ; $07DD8F   |
    LDA #$05            ; $07DD92   |
    STA $7A96,x         ; $07DD94   |
    LDA #$00            ; $07DD97   |
    STA $16,x           ; $07DD99   |
    REP #$20            ; $07DD9B   |
    STZ $7900,x         ; $07DD9D   |
    RTL                 ; $07DDA0   |

.main_beach_koopa                            ; red and green
    LDX #$08            ; $07DDA1   |
    LDA #$949D          ; $07DDA3   |
    JSL $7EDE44         ; $07DDA6   | GSU init
    LDX $12             ; $07DDAA   |
    JSL $03AF23         ; $07DDAC   |
    LDA $7860,x         ; $07DDB0   |
    BIT #$0001          ; $07DDB3   |
    BNE CODE_07DDC6     ; $07DDB6   |
    LDA $7A38,x         ; $07DDB8   |
    BIT #$0001          ; $07DDBB   |
    BNE CODE_07DDC6     ; $07DDBE   |
    LDA #$0002          ; $07DDC0   |
    STA $7A98,x         ; $07DDC3   |

CODE_07DDC6:
    LDA $16,x           ; $07DDC6   |
    TAX                 ; $07DDC8   |
    JSR ($DDD1,x)       ; $07DDC9   |

    JSL $03A5B7         ; $07DDCC   |
    RTL                 ; $07DDD0   |

DATA_07DDD1:         dw $DE7F
DATA_07DDD3:         dw $DFFF
DATA_07DDD5:         dw $E12D
DATA_07DDD7:         dw $E1B4

.main_koopa                                  ; red and green
    LDA $6F00,x         ; $07DDD9   |
    CMP #$0008          ; $07DDDC   |
    BNE CODE_07DDE4     ; $07DDDF   |
    JMP CODE_07E234     ; $07DDE1   |

CODE_07DDE4:
    LDX #$08            ; $07DDE4   |
    LDA #$949D          ; $07DDE6   |
    JSL $7EDE44         ; $07DDE9   | GSU init
    LDX $12             ; $07DDED   |
    JSL $03AF23         ; $07DDEF   |
    JSL $07E35B         ; $07DDF3   |
    JSL $03A5B7         ; $07DDF7   |
    JSL $07E2A1         ; $07DDFB   |
    LDA $7860,x         ; $07DDFF   |
    BIT #$0001          ; $07DE02   |
    BNE CODE_07DE15     ; $07DE05   |
    LDA $7A38,x         ; $07DE07   |
    BIT #$0001          ; $07DE0A   |
    BNE CODE_07DE15     ; $07DE0D   |
    LDA #$0002          ; $07DE0F   |
    STA $7A98,x         ; $07DE12   |

CODE_07DE15:
    LDA $16,x           ; $07DE15   |
    TAX                 ; $07DE17   |
    JSR ($DE1C,x)       ; $07DE18   |

    RTL                 ; $07DE1B   |

DATA_07DE1C:         dw $DE2A
DATA_07DE1E:         dw $DFFF
DATA_07DE20:         dw $E0C6

DATA_07DE22:         db $07, $06, $05, $04, $03, $02, $01, $00

    LDX $12             ; $07DE2A   |
    JSR CODE_07E1E4     ; $07DE2C   |
    BEQ CODE_07DE36     ; $07DE2F   |
    JSR CODE_07E1F3     ; $07DE31   |
    BRA CODE_07DE39     ; $07DE34   |

CODE_07DE36:
    JSR CODE_07E1FD     ; $07DE36   |

CODE_07DE39:
    JSR CODE_07E303     ; $07DE39   |
    JSR CODE_07E250     ; $07DE3C   |
    LDA $7A98,x         ; $07DE3F   |
    BNE CODE_07DE4F     ; $07DE42   |
    LDY $7400,x         ; $07DE44   |
    LDA $DD4E,y         ; $07DE47   |
    STA $7220,x         ; $07DE4A   |
    BRA CODE_07DE67     ; $07DE4D   |

CODE_07DE4F:
    LDA #$000C          ; $07DE4F   |
    STA $7402,x         ; $07DE52   |
    LDA $7860,x         ; $07DE55   |
    AND #$0001          ; $07DE58   |
    BEQ CODE_07DE7E     ; $07DE5B   |
    LDA #$0008          ; $07DE5D   |
    STA $7402,x         ; $07DE60   |
    STZ $7220,x         ; $07DE63   |
    RTS                 ; $07DE66   |

CODE_07DE67:
    LDA $7A96,x         ; $07DE67   |
    BNE CODE_07DE7E     ; $07DE6A   |
    SEP #$20            ; $07DE6C   |
    LDA $7402,x         ; $07DE6E   |
    INC A               ; $07DE71   |
    AND #$07            ; $07DE72   |
    STA $7402,x         ; $07DE74   |
    LDA #$05            ; $07DE77   |
    STA $7A96,x         ; $07DE79   |
    REP #$20            ; $07DE7C   |

CODE_07DE7E:
    RTS                 ; $07DE7E   |

    LDX $12             ; $07DE7F   |
    LDA $79D8,x         ; $07DE81   |
    BEQ CODE_07DE89     ; $07DE84   |
    JMP CODE_07DF0D     ; $07DE86   |

CODE_07DE89:
    LDA $7AF6,x         ; $07DE89   |
    BNE CODE_07DF0D     ; $07DE8C   |
    LDA $70E2,x         ; $07DE8E   |
    STA $3006           ; $07DE91   |
    LDA $7182,x         ; $07DE94   |
    STA $3008           ; $07DE97   |
    LDX #$09            ; $07DE9A   |
    LDA #$9856          ; $07DE9C   |
    JSL $7EDE44         ; $07DE9F   | GSU init
    LDX $12             ; $07DEA3   |
    LDY $3012           ; $07DEA5   |
    BMI CODE_07DF0D     ; $07DEA8   |
    LDA $7CD8,x         ; $07DEAA   |
    SEC                 ; $07DEAD   |
    SBC $7CD8,y         ; $07DEAE   |
    CLC                 ; $07DEB1   |
    ADC #$0010          ; $07DEB2   |
    CMP #$0020          ; $07DEB5   |
    BCS CODE_07DF0D     ; $07DEB8   |
    LDA $7400,x         ; $07DEBA   |
    DEC A               ; $07DEBD   |
    STA $00             ; $07DEBE   |
    LDA $7CD6,x         ; $07DEC0   |
    SEC                 ; $07DEC3   |
    SBC $7CD6,y         ; $07DEC4   |
    STA $02             ; $07DEC7   |
    EOR $00             ; $07DEC9   |
    BPL CODE_07DF0D     ; $07DECB   |
    LDA $02             ; $07DECD   |
    BPL CODE_07DED5     ; $07DECF   |
    EOR #$FFFF          ; $07DED1   |
    INC A               ; $07DED4   |

CODE_07DED5:
    CMP #$0020          ; $07DED5   |
    BCS CODE_07DF0D     ; $07DED8   |
    ASL A               ; $07DEDA   |
    ASL A               ; $07DEDB   |
    ASL A               ; $07DEDC   |
    LDY $03             ; $07DEDD   |
    BMI CODE_07DEE5     ; $07DEDF   |
    EOR #$FFFF          ; $07DEE1   |
    INC A               ; $07DEE4   |

CODE_07DEE5:
    STA $7220,x         ; $07DEE5   |
    LDA #$FE00          ; $07DEE8   |
    STA $7222,x         ; $07DEEB   |
    LDA #$0020          ; $07DEEE   |
    STA $7542,x         ; $07DEF1   |
    LDA #$0001          ; $07DEF4   |
    STA $79D8,x         ; $07DEF7   |
    LDA $7860,x         ; $07DEFA   |
    AND #$FFFE          ; $07DEFD   |
    STA $7860,x         ; $07DF00   |
    STA $7A38,x         ; $07DF03   |
    LDA #$000C          ; $07DF06   |
    STA $7402,x         ; $07DF09   |
    RTS                 ; $07DF0C   |

CODE_07DF0D:
    JSR CODE_07E1E4     ; $07DF0D   |
    BEQ CODE_07DF17     ; $07DF10   |
    JSR CODE_07E1F3     ; $07DF12   |
    BRA CODE_07DF1A     ; $07DF15   |

CODE_07DF17:
    JSR CODE_07E1FD     ; $07DF17   |

CODE_07DF1A:
    JSR CODE_07E303     ; $07DF1A   |
    JSR CODE_07E250     ; $07DF1D   |
    LDA $7A98,x         ; $07DF20   |
    BNE CODE_07DF49     ; $07DF23   |
    STZ $79D8,x         ; $07DF25   |
    LDY $7400,x         ; $07DF28   |
    LDA $DD4E,y         ; $07DF2B   |
    STA $7220,x         ; $07DF2E   |
    LDA $7A96,x         ; $07DF31   |
    BNE CODE_07DF48     ; $07DF34   |
    SEP #$20            ; $07DF36   |
    LDA $7402,x         ; $07DF38   |
    INC A               ; $07DF3B   |
    AND #$07            ; $07DF3C   |
    STA $7402,x         ; $07DF3E   |
    LDA #$05            ; $07DF41   |
    STA $7A96,x         ; $07DF43   |
    REP #$20            ; $07DF46   |

CODE_07DF48:
    RTS                 ; $07DF48   |

CODE_07DF49:
    LDA #$000C          ; $07DF49   |
    LDY $7223,x         ; $07DF4C   |
    BMI CODE_07DF54     ; $07DF4F   |
    LDA #$0010          ; $07DF51   |

CODE_07DF54:
    STA $7402,x         ; $07DF54   |
    LDA $7860,x         ; $07DF57   |
    BIT #$0001          ; $07DF5A   |
    BEQ CODE_07DF93     ; $07DF5D   |
    LDY $7D36,x         ; $07DF5F   |
    BMI CODE_07DF90     ; $07DF62   |
    DEY                 ; $07DF64   |
    BMI CODE_07DF90     ; $07DF65   |
    BEQ CODE_07DF90     ; $07DF67   |
    LDA $7360,y         ; $07DF69   |
    CMP #$0167          ; $07DF6C   |
    BCC CODE_07DF90     ; $07DF6F   |
    CMP #$0169          ; $07DF71   |
    BCS CODE_07DF90     ; $07DF74   |
    LDA $6F00,y         ; $07DF76   |
    CMP #$0010          ; $07DF79   |
    BNE CODE_07DF90     ; $07DF7C   |
    LDA $7D38,y         ; $07DF7E   |
    BNE CODE_07DF90     ; $07DF81   |
    LDA $7220,y         ; $07DF83   |
    BNE CODE_07DF90     ; $07DF86   |
    LDA $7860,y         ; $07DF88   |
    BIT #$0001          ; $07DF8B   |
    BNE CODE_07DF94     ; $07DF8E   |

CODE_07DF90:
    JMP CODE_07DFEF     ; $07DF90   |

CODE_07DF93:
    RTS                 ; $07DF93   |

CODE_07DF94:
    LDA $7360,y         ; $07DF94   |
    CMP #$0167          ; $07DF97   |
    BNE CODE_07DFA1     ; $07DF9A   |
    LDA #$016B          ; $07DF9C   |
    BRA CODE_07DFA4     ; $07DF9F   |

CODE_07DFA1:
    LDA #$016C          ; $07DFA1   |

CODE_07DFA4:
    PHY                 ; $07DFA4   |
    TXY                 ; $07DFA5   |
    JSL $03A377         ; $07DFA6   |
    LDA #$0010          ; $07DFAA   |
    STA $6F00,x         ; $07DFAD   |
    LDA $7182,x         ; $07DFB0   |
    CLC                 ; $07DFB3   |
    ADC #$0008          ; $07DFB4   |
    STA $7182,x         ; $07DFB7   |
    LDA #$FFF8          ; $07DFBA   |
    STA $7720,x         ; $07DFBD   |
    LDA #$0004          ; $07DFC0   |
    STA $16,x           ; $07DFC3   |
    LDA #$0004          ; $07DFC5   |
    STA $18,x           ; $07DFC8   |
    SEP #$20            ; $07DFCA   |
    TAY                 ; $07DFCC   |
    LDA $E05C,y         ; $07DFCD   |
    STA $7402,x         ; $07DFD0   |
    LDA $E061,y         ; $07DFD3   |
    STA $7A96,x         ; $07DFD6   |
    REP #$20            ; $07DFD9   |
    LDA #$000A          ; $07DFDB   |
    STA $7A36,x         ; $07DFDE   |
    LDA $7860,x         ; $07DFE1   |
    STA $7A38,x         ; $07DFE4   |
    PLX                 ; $07DFE7   |
    JSL $03A31E         ; $07DFE8   |
    LDX $12             ; $07DFEC   |
    RTS                 ; $07DFEE   |

CODE_07DFEF:
    LDA #$0040          ; $07DFEF   |
    STA $7542,x         ; $07DFF2   |
    JMP CODE_07E042     ; $07DFF5   |

    RTS                 ; $07DFF8   |

DATA_07DFF9:         db $08, $09, $0A, $0A, $09, $08

    LDX $12             ; $07DFFF   |
    LDA $7860,x         ; $07E001   |
    STA $7A38,x         ; $07E004   |
    LDA $7860,x         ; $07E007   |
    BIT #$0001          ; $07E00A   |
    BNE CODE_07E01A     ; $07E00D   |
    LDA $7400,x         ; $07E00F   |
    EOR #$0002          ; $07E012   |
    STA $7400,x         ; $07E015   |
    BRA CODE_07E042     ; $07E018   |

CODE_07E01A:
    LDA $7A96,x         ; $07E01A   |
    BNE CODE_07E041     ; $07E01D   |
    DEC $18,x           ; $07E01F   |
    BMI CODE_07E042     ; $07E021   |
    SEP #$20            ; $07E023   |
    LDY $18,x           ; $07E025   |
    LDA $DFF9,y         ; $07E027   |
    STA $7402,x         ; $07E02A   |
    LDA #$05            ; $07E02D   |
    STA $7A96,x         ; $07E02F   |
    REP #$20            ; $07E032   |
    CPY #$02            ; $07E034   |
    BNE CODE_07E041     ; $07E036   |
    LDA $7400,x         ; $07E038   |
    EOR #$0002          ; $07E03B   |
    STA $7400,x         ; $07E03E   |

CODE_07E041:
    RTS                 ; $07E041   |

CODE_07E042:
    LDY $7400,x         ; $07E042   |
    LDA $DD4E,y         ; $07E045   |
    STA $7220,x         ; $07E048   |
    SEP #$20            ; $07E04B   |
    STZ $7402,x         ; $07E04D   |
    LDA #$05            ; $07E050   |
    STA $7A96,x         ; $07E052   |
    LDA #$00            ; $07E055   |
    STA $16,x           ; $07E057   |
    REP #$20            ; $07E059   |
    RTS                 ; $07E05B   |

DATA_07E05C:         db $08, $0D, $0C, $0B, $0E

DATA_07E061:         db $0A, $08, $10, $08, $60

DATA_07E066:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E06E:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E076:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E07E:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E086:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E08E:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E096:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E09E:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E0A6:         dw $FFFE, $0002, $0002, $FFFE
DATA_07E0AE:         dw $0000, $0000, $0000, $0000
DATA_07E0B6:         dw $0000, $0000, $0000, $0000
DATA_07E0BE:         dw $0000, $0000, $0000, $0000

    LDX $12             ; $07E0C6   |
    LDA $18,x           ; $07E0C8   |
    CMP #$0004          ; $07E0CA   |
    BNE CODE_07E0E1     ; $07E0CD   |
    LDA $7A96,x         ; $07E0CF   |
    LSR A               ; $07E0D2   |
    BCS CODE_07E0E1     ; $07E0D3   |
    ASL A               ; $07E0D5   |
    TAY                 ; $07E0D6   |
    LDA $70E2,x         ; $07E0D7   |
    CLC                 ; $07E0DA   |
    ADC $E066,y         ; $07E0DB   |
    STA $70E2,x         ; $07E0DE   |

CODE_07E0E1:
    LDA $7A96,x         ; $07E0E1   |
    BNE CODE_07E125     ; $07E0E4   |
    DEC $18,x           ; $07E0E6   |
    BMI CODE_07E126     ; $07E0E8   |
    SEP #$20            ; $07E0EA   |
    LDY $18,x           ; $07E0EC   |
    LDA $E05C,y         ; $07E0EE   |
    STA $7402,x         ; $07E0F1   |
    LDA $E061,y         ; $07E0F4   |
    STA $7A96,x         ; $07E0F7   |
    REP #$20            ; $07E0FA   |
    CPY #$03            ; $07E0FC   |
    BNE CODE_07E10F     ; $07E0FE   |
    LDA $7182,x         ; $07E100   |
    SEC                 ; $07E103   |
    SBC #$0008          ; $07E104   |
    STA $7182,x         ; $07E107   |
    STZ $7720,x         ; $07E10A   |
    BRA CODE_07E125     ; $07E10D   |

CODE_07E10F:
    CPY #$02            ; $07E10F   |
    BNE CODE_07E125     ; $07E111   |
    LDA #$FE00          ; $07E113   |
    STA $7222,x         ; $07E116   |
    LDA $7860,x         ; $07E119   |
    AND #$FFFE          ; $07E11C   |
    STA $7860,x         ; $07E11F   |
    STA $7A38,x         ; $07E122   |

CODE_07E125:
    RTS                 ; $07E125   |

CODE_07E126:
    JMP CODE_07E042     ; $07E126   |

DATA_07E129:         dw $FFE0, $0020

    LDX $12             ; $07E12D   |
    LDA $7400,x         ; $07E12F   |
    DEC A               ; $07E132   |
    EOR $7220,x         ; $07E133   |
    BPL CODE_07E193     ; $07E136   |
    LDA $7220,x         ; $07E138   |
    BEQ CODE_07E193     ; $07E13B   |
    LDA $7860,x         ; $07E13D   |
    BIT #$0001          ; $07E140   |
    BEQ CODE_07E191     ; $07E143   |
    LDA $6FA0,x         ; $07E145   |
    ORA #$0200          ; $07E148   |
    STA $6FA0,x         ; $07E14B   |
    LDA $14             ; $07E14E   |
    AND #$0003          ; $07E150   |
    BNE CODE_07E191     ; $07E153   |
    LDY $7400,x         ; $07E155   |
    LDA $E129,y         ; $07E158   |
    STA $00             ; $07E15B   |
    LDA #$01E0          ; $07E15D   |
    JSL $008B21         ; $07E160   |
    LDA $7400,x         ; $07E164   |
    EOR #$0002          ; $07E167   |
    STA $73C0,y         ; $07E16A   |
    LDA #$0004          ; $07E16D   |
    STA $7782,y         ; $07E170   |
    STA $7E4C,y         ; $07E173   |
    LDA $00             ; $07E176   |
    STA $71E0,y         ; $07E178   |
    LDA #$FFF0          ; $07E17B   |
    STA $71E2,y         ; $07E17E   |
    LDA $70E2,x         ; $07E181   |
    STA $70A2,y         ; $07E184   |
    LDA $7182,x         ; $07E187   |
    CLC                 ; $07E18A   |
    ADC #$0014          ; $07E18B   |
    STA $7142,y         ; $07E18E   |

CODE_07E191:
    PLA                 ; $07E191   |
    RTL                 ; $07E192   |

CODE_07E193:
    LDA $6FA0,x         ; $07E193   |
    ORA #$0200          ; $07E196   |
    STA $6FA0,x         ; $07E199   |
    STZ $7540,x         ; $07E19C   |
    STZ $7220,x         ; $07E19F   |
    LDA #$0008          ; $07E1A2   |
    STA $7A96,x         ; $07E1A5   |
    LDA #$0001          ; $07E1A8   |
    STA $18,x           ; $07E1AB   |
    LDA #$0006          ; $07E1AD   |
    STA $16,x           ; $07E1B0   |
    PLA                 ; $07E1B2   |
    RTL                 ; $07E1B3   |

    LDX $12             ; $07E1B4   |
    LDA $7A96,x         ; $07E1B6   |
    BNE CODE_07E1CB     ; $07E1B9   |
    DEC $18,x           ; $07E1BB   |
    BMI CODE_07E1CD     ; $07E1BD   |
    LDA #$000D          ; $07E1BF   |
    STA $7402,x         ; $07E1C2   |
    LDA #$0008          ; $07E1C5   |
    STA $7A96,x         ; $07E1C8   |

CODE_07E1CB:
    PLA                 ; $07E1CB   |
    RTL                 ; $07E1CC   |

CODE_07E1CD:
    STZ $18,x           ; $07E1CD   |
    JSR CODE_07E1E4     ; $07E1CF   |
    BNE CODE_07E1DD     ; $07E1D2   |
    LDA $6FA2,x         ; $07E1D4   |
    ORA #$0200          ; $07E1D7   |
    STA $6FA2,x         ; $07E1DA   |

CODE_07E1DD:
    JMP CODE_07E042     ; $07E1DD   |

DATA_07E1E0:         dw $016A, $016C

CODE_07E1E4:
    LDY #$02            ; $07E1E4   |
    LDA $7360,x         ; $07E1E6   |

CODE_07E1E9:
    CMP $E1E0,y         ; $07E1E9   |
    BEQ CODE_07E1F2     ; $07E1EC   |
    DEY                 ; $07E1EE   |
    DEY                 ; $07E1EF   |
    BPL CODE_07E1E9     ; $07E1F0   |

CODE_07E1F2:
    RTS                 ; $07E1F2   |

CODE_07E1F3:
    LDA $7860,x         ; $07E1F3   |
    BIT #$000C          ; $07E1F6   |
    BNE CODE_07E20F     ; $07E1F9   |
    BRA CODE_07E229     ; $07E1FB   |

CODE_07E1FD:
    LDA $7860,x         ; $07E1FD   |
    BIT #$000C          ; $07E200   |
    BNE CODE_07E20F     ; $07E203   |
    BIT #$0001          ; $07E205   |
    BNE CODE_07E229     ; $07E208   |
    LDA $7A38,x         ; $07E20A   |
    BEQ CODE_07E229     ; $07E20D   |

CODE_07E20F:
    LDA #$0005          ; $07E20F   |
    STA $18,x           ; $07E212   |
    SEP #$20            ; $07E214   |
    TAY                 ; $07E216   |
    LDA $DFF9,y         ; $07E217   |
    STA $7402,x         ; $07E21A   |
    LDA #$05            ; $07E21D   |
    STA $7A96,x         ; $07E21F   |
    LDA #$02            ; $07E222   |
    STA $16,x           ; $07E224   |
    REP #$20            ; $07E226   |
    PLA                 ; $07E228   |

CODE_07E229:
    LDA $7860,x         ; $07E229   |
    STA $7A38,x         ; $07E22C   |
    RTS                 ; $07E22F   |

DATA_07E230:         dw $016B, $016D

CODE_07E234:
    LDY #$02            ; $07E234   |
    LDA $7360,x         ; $07E236   |

CODE_07E239:
    CMP $E230,y         ; $07E239   |
    BEQ CODE_07E247     ; $07E23C   |
    DEY                 ; $07E23E   |
    DEY                 ; $07E23F   |
    BPL CODE_07E239     ; $07E240   |
    LDA #$0168          ; $07E242   |
    BRA CODE_07E24A     ; $07E245   |

CODE_07E247:
    LDA #$0167          ; $07E247   |

CODE_07E24A:
    TXY                 ; $07E24A   |
    JSL $03A377         ; $07E24B   |
    RTL                 ; $07E24F   |

CODE_07E250:
    LDY $7D36,x         ; $07E250   |
    DEY                 ; $07E253   |
    BMI CODE_07E2A0     ; $07E254   |
    BEQ CODE_07E2A0     ; $07E256   |
    LDA $7D38,y         ; $07E258   |
    BNE CODE_07E2A0     ; $07E25B   |
    LDA $7360,y         ; $07E25D   |
    CMP #$0169          ; $07E260   |
    BCC CODE_07E2A0     ; $07E263   |
    CMP #$016E          ; $07E265   |
    BCS CODE_07E2A0     ; $07E268   |
    LDA $6F00,y         ; $07E26A   |
    CMP #$0010          ; $07E26D   |
    BNE CODE_07E2A0     ; $07E270   |
    LDA $7400,x         ; $07E272   |
    DEC A               ; $07E275   |
    STA $00             ; $07E276   |
    LDA $7CD6,x         ; $07E278   |
    SEC                 ; $07E27B   |
    SBC $7CD6,y         ; $07E27C   |
    EOR $00             ; $07E27F   |
    BPL CODE_07E2A0     ; $07E281   |
    STZ $7220,x         ; $07E283   |
    LDA #$0005          ; $07E286   |
    STA $18,x           ; $07E289   |
    SEP #$20            ; $07E28B   |
    TAY                 ; $07E28D   |
    LDA $DFF9,y         ; $07E28E   |
    STA $7402,x         ; $07E291   |
    LDA #$05            ; $07E294   |
    STA $7A96,x         ; $07E296   |
    LDA #$02            ; $07E299   |
    STA $16,x           ; $07E29B   |
    REP #$20            ; $07E29D   |
    PLA                 ; $07E29F   |

CODE_07E2A0:
    RTS                 ; $07E2A0   |

    LDY $7D36,x         ; $07E2A1   |
    DEY                 ; $07E2A4   |
    BMI CODE_07E302     ; $07E2A5   |
    BEQ CODE_07E302     ; $07E2A7   |
    LDA $7D38,y         ; $07E2A9   |
    BEQ CODE_07E302     ; $07E2AC   |
    LDA $7360,y         ; $07E2AE   |
    CMP #$0167          ; $07E2B1   |
    BCC CODE_07E2BB     ; $07E2B4   |
    CMP #$0169          ; $07E2B6   |
    BCC CODE_07E302     ; $07E2B9   |

CODE_07E2BB:
    STZ $00             ; $07E2BB   |
    LDA $7CD6,x         ; $07E2BD   |
    SEC                 ; $07E2C0   |
    SBC $7CD6,y         ; $07E2C1   |
    BPL CODE_07E2CA     ; $07E2C4   |
    INC $00             ; $07E2C6   |
    INC $00             ; $07E2C8   |

CODE_07E2CA:
    TYX                 ; $07E2CA   |
    JSL $03B24B         ; $07E2CB   |
    LDX $12             ; $07E2CF   |
    LDA $7360,x         ; $07E2D1   |
    CMP #$016B          ; $07E2D4   |
    BNE CODE_07E2DE     ; $07E2D7   |
    LDA #$0167          ; $07E2D9   |
    BRA CODE_07E2E1     ; $07E2DC   |

CODE_07E2DE:
    LDA #$0168          ; $07E2DE   |

CODE_07E2E1:
    TXY                 ; $07E2E1   |
    JSL $03A377         ; $07E2E2   |
    LDA #$0010          ; $07E2E6   |
    STA $6F00,x         ; $07E2E9   |
    LDA #$0020          ; $07E2EC   |
    STA $7A98,x         ; $07E2EF   |
    LDA #$0001          ; $07E2F2   |
    STA $7D38,x         ; $07E2F5   |
    LDY $00             ; $07E2F8   |
    LDA $D95C,y         ; $07E2FA   |
    STA $7220,x         ; $07E2FD   |
    PLY                 ; $07E300   |
    PLA                 ; $07E301   |

CODE_07E302:
    RTL                 ; $07E302   |

CODE_07E303:
    LDA $61D6           ; $07E303   |
    BNE CODE_07E335     ; $07E306   |
    LDY $7D36,x         ; $07E308   |
    BPL CODE_07E335     ; $07E30B   |
    LDA $77C2,x         ; $07E30D   |
    AND #$00FF          ; $07E310   |
    CMP $7400,x         ; $07E313   |
    BEQ CODE_07E335     ; $07E316   |
    STZ $7220,x         ; $07E318   |
    LDA #$0005          ; $07E31B   |
    STA $18,x           ; $07E31E   |
    SEP #$20            ; $07E320   |
    TAY                 ; $07E322   |
    LDA $DFF9,y         ; $07E323   |
    STA $7402,x         ; $07E326   |
    LDA #$05            ; $07E329   |
    STA $7A96,x         ; $07E32B   |
    LDA #$02            ; $07E32E   |
    STA $16,x           ; $07E330   |
    REP #$20            ; $07E332   |
    PLA                 ; $07E334   |

CODE_07E335:
    RTS                 ; $07E335   |

    LDY $7D36,x         ; $07E336   |
    BPL CODE_07E35A     ; $07E339   |
    LDA $60D4           ; $07E33B   |
    BEQ CODE_07E35A     ; $07E33E   |
    LDA $7C18,x         ; $07E340   |
    SEC                 ; $07E343   |
    SBC $6122           ; $07E344   |
    SEC                 ; $07E347   |
    SBC $7BB8,x         ; $07E348   |
    CMP #$FFF8          ; $07E34B   |
    BCC CODE_07E35A     ; $07E34E   |
    JSL $0CFF61         ; $07E350   |
    PLY                 ; $07E354   |
    PLA                 ; $07E355   |
    JMP CODE_0703B2     ; $07E356   |

CODE_07E35A:
    RTL                 ; $07E35A   |

    LDY $7D36,x         ; $07E35B   |
    BPL CODE_07E398     ; $07E35E   |
    LDA $7C18,x         ; $07E360   |
    SEC                 ; $07E363   |
    SBC $6122           ; $07E364   |
    SEC                 ; $07E367   |
    SBC $7BB8,x         ; $07E368   |
    CMP #$FFF8          ; $07E36B   |
    BCC CODE_07E398     ; $07E36E   |
    LDA $60D4           ; $07E370   |
    BEQ CODE_07E37F     ; $07E373   |
    JSL $0CFF61         ; $07E375   |
    PLY                 ; $07E379   |
    PLA                 ; $07E37A   |
    JMP CODE_0703B2     ; $07E37B   |

CODE_07E37F:
    LDA #$001C          ; $07E37F   |\ play sound #$001C
    JSL $0085D2         ; $07E382   |/
    LDA #$000E          ; $07E386   |
    STA $6F00,x         ; $07E389   |
    STZ $7220,x         ; $07E38C   |
    STZ $7222,x         ; $07E38F   |
    PLY                 ; $07E392   |
    PLA                 ; $07E393   |
    JMP CODE_0703B2     ; $07E394   |

CODE_07E398:
    RTL                 ; $07E398   |

CODE_07E399:
    LDA $7040,x         ; $07E399   |
    BIT #$0003          ; $07E39C   |
    BEQ CODE_07E3AC     ; $07E39F   |
    LDX #$08            ; $07E3A1   |
    LDA #$949D          ; $07E3A3   |
    JSL $7EDE44         ; $07E3A6   | GSU init
    LDX $12             ; $07E3AA   |

CODE_07E3AC:
    STZ $7402,x         ; $07E3AC   |
    LDA $7040,x         ; $07E3AF   |
    AND #$07FC          ; $07E3B2   |
    ORA #$0800          ; $07E3B5   |
    STA $7040,x         ; $07E3B8   |
    BRA CODE_07E3C8     ; $07E3BB   |

    LDX #$08            ; $07E3BD   |
    LDA #$949D          ; $07E3BF   |
    JSL $7EDE44         ; $07E3C2   | GSU init
    LDX $12             ; $07E3C6   |

CODE_07E3C8:
    LDA $6FA2,x         ; $07E3C8   |
    AND #$FFE0          ; $07E3CB   |
    STA $6FA2,x         ; $07E3CE   |
    LDA $7042,x         ; $07E3D1   |
    ORA #$00B0          ; $07E3D4   |
    STA $7042,x         ; $07E3D7   |
    RTL                 ; $07E3DA   |

DATA_07E3DB:         dw $0400, $FC00

    LDA $7900,x         ; $07E3DF   |
    BNE CODE_07E399     ; $07E3E2   |
    LDX #$08            ; $07E3E4   |
    LDA #$949D          ; $07E3E6   |
    JSL $7EDE44         ; $07E3E9   | GSU init
    LDX $12             ; $07E3ED   |
    LDA #$0167          ; $07E3EF   |
    STA $00             ; $07E3F2   |
    LDA #$0169          ; $07E3F4   |
    BRA CODE_07E411     ; $07E3F7   |

    LDA $7900,x         ; $07E3F9   |
    BNE CODE_07E399     ; $07E3FC   |
    LDX #$08            ; $07E3FE   |
    LDA #$949D          ; $07E400   |
    JSL $7EDE44         ; $07E403   | GSU init
    LDX $12             ; $07E407   |
    LDA #$0168          ; $07E409   |
    STA $00             ; $07E40C   |
    LDA #$016A          ; $07E40E   |

CODE_07E411:
    TXY                 ; $07E411   |
    JSL $03A377         ; $07E412   |
    LDA $77C2,x         ; $07E416   |
    AND #$00FF          ; $07E419   |
    STA $7400,x         ; $07E41C   |
    TAY                 ; $07E41F   |
    LDA $E3DB,y         ; $07E420   |
    STA $7220,x         ; $07E423   |
    LDA #$0020          ; $07E426   |
    STA $7AF6,x         ; $07E429   |
    LDA #$010A          ; $07E42C   |
    STA $7A36,x         ; $07E42F   |
    LDA $7860,x         ; $07E432   |
    STA $7A38,x         ; $07E435   |
    LDA #$0004          ; $07E438   |
    STA $7976,x         ; $07E43B   |
    LDA #$000C          ; $07E43E   |
    STA $7402,x         ; $07E441   |
    LDA #$0020          ; $07E444   |
    STA $7540,x         ; $07E447   |
    LDA $6FA0,x         ; $07E44A   |
    AND #$FDFF          ; $07E44D   |
    STA $6FA0,x         ; $07E450   |
    LDA $6FA2,x         ; $07E453   |
    AND #$FCFF          ; $07E456   |
    STA $6FA2,x         ; $07E459   |
    LDA #$0010          ; $07E45C   |
    STA $6F00,x         ; $07E45F   |
    LDA $00             ; $07E462   |
    JSL $03A364         ; $07E464   |
    BCC CODE_07E482     ; $07E468   |
    LDA #$0020          ; $07E46A   |
    STA $7A98,y         ; $07E46D   |
    LDA $7400,x         ; $07E470   |
    STA $7400,y         ; $07E473   |
    LDA $70E2,x         ; $07E476   |
    STA $70E2,y         ; $07E479   |
    LDA $7182,x         ; $07E47C   |
    STA $7182,y         ; $07E47F   |

CODE_07E482:
    RTL                 ; $07E482   |

DATA_07E483:         dw $FF80, $0080

.init_green_parakoopa
    LDA #$002A          ; $07E487   |
    STA $7A36,x         ; $07E48A   |
    LDA #$0010          ; $07E48D   |
    STA $7542,x         ; $07E490   |
    LDA #$0100          ; $07E493   |
    STA $75E2,x         ; $07E496   |
    LDY $7400,x         ; $07E499   |
    LDA $E483,y         ; $07E49C   |
    STA $7220,x         ; $07E49F   |
    LDA #$FE00          ; $07E4A2   |
    STA $7222,x         ; $07E4A5   |
    LDA #$0008          ; $07E4A8   |
    STA $7402,x         ; $07E4AB   |
    LDA #$0002          ; $07E4AE   |
    STA $7A96,x         ; $07E4B1   |
    LDA #$0000          ; $07E4B4   |
    STA $16,x           ; $07E4B7   |
    STZ $7900,x         ; $07E4B9   |
    RTL                 ; $07E4BC   |

DATA_07E4BD:         dw $0030, $FFD0

DATA_07E4C1:         dw $0004, $FFFC

DATA_07E4C5:         dw $FEE0, $0120

DATA_07E4C9:         dw $FED0, $0130

DATA_07E4CD:         dw $F800, $0800

.init_red_parakoopa_horizontal
    LDA #$002A          ; $07E4D1   |
    STA $7A36,x         ; $07E4D4   |
    LDA $70E2,x         ; $07E4D7   |
    STA $18,x           ; $07E4DA   |
    AND #$0010          ; $07E4DC   |
    LSR A               ; $07E4DF   |
    LSR A               ; $07E4E0   |
    LSR A               ; $07E4E1   |
    EOR #$0002          ; $07E4E2   |
    STA $7400,x         ; $07E4E5   |
    TAY                 ; $07E4E8   |
    LDA $E4C5,y         ; $07E4E9   |
    STA $7220,x         ; $07E4EC   |
    LDA $E4CD,y         ; $07E4EF   |
    STA $75E0,x         ; $07E4F2   |
    STA $75E2,x         ; $07E4F5   |
    LDA #$0004          ; $07E4F8   |
    STA $7540,x         ; $07E4FB   |
    LDA #$0008          ; $07E4FE   |
    STA $7542,x         ; $07E501   |
    LDA $7182,x         ; $07E504   |
    STA $76,x           ; $07E507   |
    CLC                 ; $07E509   |
    ADC $E4C1,y         ; $07E50A   |
    STA $7182,x         ; $07E50D   |
    LDA #$0008          ; $07E510   |
    STA $7402,x         ; $07E513   |
    LDA #$0003          ; $07E516   |
    STA $7A96,x         ; $07E519   |
    STZ $7900,x         ; $07E51C   |
    RTL                 ; $07E51F   |

.init_red_parakoopa_vertical
    LDA #$002A          ; $07E520   |
    STA $7A36,x         ; $07E523   |
    LDA $70E2,x         ; $07E526   |
    AND #$0010          ; $07E529   |
    LSR A               ; $07E52C   |
    LSR A               ; $07E52D   |
    LSR A               ; $07E52E   |
    EOR #$0002          ; $07E52F   |
    TAY                 ; $07E532   |
    LDA $7182,x         ; $07E533   |
    STA $18,x           ; $07E536   |
    LDA $E4C9,y         ; $07E538   |
    STA $7222,x         ; $07E53B   |
    LDA $E4CD,y         ; $07E53E   |
    STA $75E2,x         ; $07E541   |
    LDA #$0004          ; $07E544   |
    STA $7542,x         ; $07E547   |
    LDA #$0008          ; $07E54A   |
    STA $7402,x         ; $07E54D   |
    LDA $E593,y         ; $07E550   |
    STA $7A96,x         ; $07E553   |
    STZ $7900,x         ; $07E556   |
    RTL                 ; $07E559   |

.main_green_parakoopa
    LDA $6F00,x         ; $07E55A   |
    CMP #$0008          ; $07E55D   |
    BNE CODE_07E56A     ; $07E560   |
    STZ $00             ; $07E562   |
    JSR CODE_07FD34     ; $07E564   |
    JMP CODE_07E234     ; $07E567   |

CODE_07E56A:
    LDX #$08            ; $07E56A   |
    LDA #$949D          ; $07E56C   |
    JSL $7EDE44         ; $07E56F   | GSU init
    LDX $12             ; $07E573   |
    JSL $03AF23         ; $07E575   |
    JSL $07E35B         ; $07E579   |
    JSL $03A5B7         ; $07E57D   |
    JSL $07E6B7         ; $07E581   |
    JSR CODE_07E6E9     ; $07E585   |
    LDA $16,x           ; $07E588   |
    TAX                 ; $07E58A   |
    JSR ($E58F,x)       ; $07E58B   |

    RTL                 ; $07E58E   |

DATA_07E58F:         dw $E597
DATA_07E591:         dw $E5CD

DATA_07E593:         dw $0002, $0004

    LDX $12             ; $07E597   |
    LDA $7860,x         ; $07E599   |
    BIT #$0001          ; $07E59C   |
    BNE CODE_07E5B8     ; $07E59F   |
    LDA $7A96,x         ; $07E5A1   |
    BNE CODE_07E5B7     ; $07E5A4   |
    DEC $7402,x         ; $07E5A6   |
    BPL CODE_07E5B1     ; $07E5A9   |
    LDA #$0008          ; $07E5AB   |
    STA $7402,x         ; $07E5AE   |

CODE_07E5B1:
    LDA #$0002          ; $07E5B1   |
    STA $7A96,x         ; $07E5B4   |

CODE_07E5B7:
    RTS                 ; $07E5B7   |

CODE_07E5B8:
    STZ $7220,x         ; $07E5B8   |
    LDA #$0008          ; $07E5BB   |
    STA $7A96,x         ; $07E5BE   |
    LDA #$0009          ; $07E5C1   |
    STA $7402,x         ; $07E5C4   |
    LDA #$0002          ; $07E5C7   |
    STA $16,x           ; $07E5CA   |
    RTS                 ; $07E5CC   |

    LDX $12             ; $07E5CD   |
    LDA $7A96,x         ; $07E5CF   |
    BNE CODE_07E5D8     ; $07E5D2   |
    JSL $07E499         ; $07E5D4   |

CODE_07E5D8:
    RTS                 ; $07E5D8   |

.main_red_parakoopa_horizontal
    LDA $6F00,x         ; $07E5D9   |
    CMP #$0008          ; $07E5DC   |
    BNE CODE_07E5E9     ; $07E5DF   |
    STZ $00             ; $07E5E1   |
    JSR CODE_07FD34     ; $07E5E3   |
    JMP CODE_07E234     ; $07E5E6   |

CODE_07E5E9:
    LDX #$08            ; $07E5E9   |
    LDA #$949D          ; $07E5EB   |
    JSL $7EDE44         ; $07E5EE   | GSU init
    LDX $12             ; $07E5F2   |
    JSL $03AF23         ; $07E5F4   |
    JSL $07E35B         ; $07E5F8   |
    JSL $03A5B7         ; $07E5FC   |
    JSL $07E6B7         ; $07E600   |
    LDY #$00            ; $07E604   |
    LDA $70E2,x         ; $07E606   |
    CMP $18,x           ; $07E609   |
    BPL CODE_07E60F     ; $07E60B   |
    INY                 ; $07E60D   |
    INY                 ; $07E60E   |

CODE_07E60F:
    LDA $E4CD,y         ; $07E60F   |
    STA $75E0,x         ; $07E612   |
    LDA $7400,x         ; $07E615   |
    DEC A               ; $07E618   |
    EOR $7220,x         ; $07E619   |
    BPL CODE_07E627     ; $07E61C   |
    LDA $7400,x         ; $07E61E   |
    EOR #$0002          ; $07E621   |
    STA $7400,x         ; $07E624   |

CODE_07E627:
    LDY #$00            ; $07E627   |
    LDA $7182,x         ; $07E629   |
    CMP $76,x           ; $07E62C   |
    BPL CODE_07E632     ; $07E62E   |
    INY                 ; $07E630   |
    INY                 ; $07E631   |

CODE_07E632:
    LDA $E4CD,y         ; $07E632   |
    STA $75E2,x         ; $07E635   |
    LDA $7A96,x         ; $07E638   |
    BNE CODE_07E64E     ; $07E63B   |
    DEC $7402,x         ; $07E63D   |
    BPL CODE_07E648     ; $07E640   |
    LDA #$0008          ; $07E642   |
    STA $7402,x         ; $07E645   |

CODE_07E648:
    LDA #$0003          ; $07E648   |
    STA $7A96,x         ; $07E64B   |

CODE_07E64E:
    RTL                 ; $07E64E   |

.main_red_parakoopa_vertical
    LDA $6F00,x         ; $07E64F   |
    CMP #$0008          ; $07E652   |
    BNE CODE_07E65F     ; $07E655   |
    STZ $00             ; $07E657   |
    JSR CODE_07FD34     ; $07E659   |
    JMP CODE_07E234     ; $07E65C   |

CODE_07E65F:
    LDX #$08            ; $07E65F   |
    LDA #$949D          ; $07E661   |
    JSL $7EDE44         ; $07E664   | GSU init
    LDX $12             ; $07E668   |
    JSL $03AF23         ; $07E66A   |
    JSL $07E35B         ; $07E66E   |
    JSL $03A5B7         ; $07E672   |
    JSL $07E6B7         ; $07E676   |
    LDY #$00            ; $07E67A   |
    LDA $7182,x         ; $07E67C   |
    CMP $18,x           ; $07E67F   |
    BPL CODE_07E685     ; $07E681   |
    INY                 ; $07E683   |
    INY                 ; $07E684   |

CODE_07E685:
    LDA $E4CD,y         ; $07E685   |
    STA $75E2,x         ; $07E688   |
    LDA $7A96,x         ; $07E68B   |
    BNE CODE_07E6B6     ; $07E68E   |
    DEC $7402,x         ; $07E690   |
    BPL CODE_07E69B     ; $07E693   |
    LDA #$0008          ; $07E695   |
    STA $7402,x         ; $07E698   |

CODE_07E69B:
    LDY #$00            ; $07E69B   |
    LDA #$0100          ; $07E69D   |
    BIT $75E2,x         ; $07E6A0   |
    BPL CODE_07E6A8     ; $07E6A3   |
    LDA #$FF00          ; $07E6A5   |

CODE_07E6A8:
    CLC                 ; $07E6A8   |
    ADC $7222,x         ; $07E6A9   |
    BMI CODE_07E6B0     ; $07E6AC   |
    INY                 ; $07E6AE   |
    INY                 ; $07E6AF   |

CODE_07E6B0:
    LDA $E593,y         ; $07E6B0   |
    STA $7A96,x         ; $07E6B3   |

CODE_07E6B6:
    RTL                 ; $07E6B6   |

    LDY $7D36,x         ; $07E6B7   |
    DEY                 ; $07E6BA   |
    BMI CODE_07E6E8     ; $07E6BB   |
    BEQ CODE_07E6E8     ; $07E6BD   |
    LDA $6F00,y         ; $07E6BF   |
    CMP #$0010          ; $07E6C2   |
    BNE CODE_07E6E8     ; $07E6C5   |
    LDA $7D38,y         ; $07E6C7   |
    BEQ CODE_07E6E8     ; $07E6CA   |
    LDA $7360,y         ; $07E6CC   |
    CMP #$0167          ; $07E6CF   |
    BCC CODE_07E6D9     ; $07E6D2   |
    CMP #$0169          ; $07E6D4   |
    BCC CODE_07E6E8     ; $07E6D7   |

CODE_07E6D9:
    TYX                 ; $07E6D9   |
    JSL $03B24B         ; $07E6DA   |
    LDX $12             ; $07E6DE   |
    LDA #$000E          ; $07E6E0   |
    STA $6F00,x         ; $07E6E3   |
    PLY                 ; $07E6E6   |
    PLA                 ; $07E6E7   |

CODE_07E6E8:
    RTL                 ; $07E6E8   |

CODE_07E6E9:
    LDY $7D36,x         ; $07E6E9   |
    DEY                 ; $07E6EC   |
    BMI CODE_07E72F     ; $07E6ED   |
    BEQ CODE_07E72F     ; $07E6EF   |
    LDA $6F00,y         ; $07E6F1   |
    CMP #$0010          ; $07E6F4   |
    BNE CODE_07E72F     ; $07E6F7   |
    LDA $7D38,y         ; $07E6F9   |
    BNE CODE_07E72F     ; $07E6FC   |
    LDA $7360,y         ; $07E6FE   |
    CMP #$0169          ; $07E701   |
    BCC CODE_07E72F     ; $07E704   |
    CMP #$016E          ; $07E706   |
    BCS CODE_07E72F     ; $07E709   |
    LDA $7400,x         ; $07E70B   |
    DEC A               ; $07E70E   |
    STA $00             ; $07E70F   |
    LDA $7CD6,x         ; $07E711   |
    SEC                 ; $07E714   |
    SBC $7CD6,y         ; $07E715   |
    EOR $00             ; $07E718   |
    BPL CODE_07E72F     ; $07E71A   |
    LDA $7400,x         ; $07E71C   |
    EOR #$0002          ; $07E71F   |
    STA $7400,x         ; $07E722   |
    LDA $7220,x         ; $07E725   |
    EOR #$FFFF          ; $07E728   |
    INC A               ; $07E72B   |
    STA $7220,x         ; $07E72C   |

CODE_07E72F:
    RTS                 ; $07E72F   |

    LDA $7AF8,x         ; $07E730   |
    BNE CODE_07E740     ; $07E733   |
    STZ $00             ; $07E735   |
    JSR CODE_07FD34     ; $07E737   |
    LDA #$FFFF          ; $07E73A   |
    STA $7AF8,x         ; $07E73D   |

CODE_07E740:
    LDA $7900,x         ; $07E740   |
    BEQ CODE_07E748     ; $07E743   |
    JMP CODE_07E399     ; $07E745   |

CODE_07E748:
    LDA #$016B          ; $07E748   |
    BRA CODE_07E768     ; $07E74B   |

    LDA $7AF8,x         ; $07E74D   |
    BNE CODE_07E75D     ; $07E750   |
    STZ $00             ; $07E752   |
    JSR CODE_07FD34     ; $07E754   |
    LDA #$FFFF          ; $07E757   |
    STA $7AF8,x         ; $07E75A   |

CODE_07E75D:
    LDA $7900,x         ; $07E75D   |
    BEQ CODE_07E765     ; $07E760   |
    JMP CODE_07E399     ; $07E762   |

CODE_07E765:
    LDA #$016C          ; $07E765   |

CODE_07E768:
    PHA                 ; $07E768   |
    LDX #$08            ; $07E769   |
    LDA #$949D          ; $07E76B   |
    JSL $7EDE44         ; $07E76E   | GSU init
    PLA                 ; $07E772   |
    LDX $12             ; $07E773   |
    TXY                 ; $07E775   |
    JSL $03A377         ; $07E776   |
    LDA #$0010          ; $07E77A   |
    STA $6F00,x         ; $07E77D   |
    LDA #$000A          ; $07E780   |
    STA $7A36,x         ; $07E783   |
    LDA $7860,x         ; $07E786   |
    STA $7A38,x         ; $07E789   |
    RTL                 ; $07E78C   |

DATA_07E78D:         dw $0018, $0018, $0018, $0018
DATA_07E795:         dw $0010, $0008, $0004, $0003
DATA_07E79D:         dw $0000, $0000, $0000, $0000
DATA_07E7A5:         dw $0000, $0001, $0000, $0004
DATA_07E7AD:         dw $0008, $000C

DATA_07E7B1:         dw $FF80, $0080

.init_aqua_lakitu
    LDY $7900,x         ; $07E7B5   |
    BNE CODE_07E7CD     ; $07E7B8   |
    LDA $70E2,x         ; $07E7BA   |
    AND #$0010          ; $07E7BD   |
    BEQ CODE_07E7C4     ; $07E7C0   |
    INY                 ; $07E7C2   |
    INY                 ; $07E7C3   |

CODE_07E7C4:
    SEP #$20            ; $07E7C4   |
    TYA                 ; $07E7C6   |
    INC A               ; $07E7C7   |
    STA $7900,x         ; $07E7C8   |
    REP #$20            ; $07E7CB   |

CODE_07E7CD:
    LDA #$0004          ; $07E7CD   |
    STA $16,x           ; $07E7D0   |
    JSR CODE_07E842     ; $07E7D2   |
    RTL                 ; $07E7D5   |

.main_aqua_lakitu
    LDA $6F00,x         ; $07E7D6   |
    CMP #$000C          ; $07E7D9   |
    BEQ CODE_07E7E3     ; $07E7DC   |
    CMP #$0008          ; $07E7DE   |
    BNE CODE_07E7E9     ; $07E7E1   |

CODE_07E7E3:
    LDA #$0012          ; $07E7E3   |
    STA $7402,x         ; $07E7E6   |

CODE_07E7E9:
    LDY $74A2,x         ; $07E7E9   |
    BMI CODE_07E813     ; $07E7EC   |
    LDA $7402,x         ; $07E7EE   |
    CMP #$000B          ; $07E7F1   |
    BNE CODE_07E813     ; $07E7F4   |
    LDA $14             ; $07E7F6   |
    AND #$0006          ; $07E7F8   |
    TAY                 ; $07E7FB   |
    LDA $A9BE,y         ; $07E7FC   |
    STA $00             ; $07E7FF   |
    REP #$10            ; $07E801   |
    LDY $7362,x         ; $07E803   |
    LDA $6014,y         ; $07E806   |
    AND #$F1FF          ; $07E809   |
    ORA $00             ; $07E80C   |
    STA $6014,y         ; $07E80E   |
    SEP #$10            ; $07E811   |

CODE_07E813:
    JSL $03AF23         ; $07E813   |
    JSR CODE_07EADE     ; $07E817   |
    LDY $16,x           ; $07E81A   |
    TYX                 ; $07E81C   |
    JSR ($E825,x)       ; $07E81D   |

    JSL $03A5B7         ; $07E820   |
    RTL                 ; $07E824   |

DATA_07E825:         dw $E873
DATA_07E827:         dw $E915
DATA_07E829:         dw $E82B

    LDX $12             ; $07E82B   |
    LDA $7680,x         ; $07E82D   |
    CMP #$00F0          ; $07E830   |
    BCS CODE_07E872     ; $07E833   |
    LDA $7682,x         ; $07E835   |
    CMP #$00D0          ; $07E838   |
    BCS CODE_07E872     ; $07E83B   |
    LDA #$0002          ; $07E83D   |
    STA $16,x           ; $07E840   |

CODE_07E842:
    LDA $6FA0,x         ; $07E842   |
    AND #$7F9F          ; $07E845   |
    STA $6FA0,x         ; $07E848   |
    LDA $7040,x         ; $07E84B   |
    ORA #$0100          ; $07E84E   |
    STA $7040,x         ; $07E851   |
    LDA #$000C          ; $07E854   |
    STA $18,x           ; $07E857   |
    SEP #$20            ; $07E859   |
    TAY                 ; $07E85B   |
    LDA $E8AE,y         ; $07E85C   |
    STA $7A96,x         ; $07E85F   |
    LDA $E896,y         ; $07E862   |
    STA $7402,x         ; $07E865   |
    ASL A               ; $07E868   |
    TAY                 ; $07E869   |
    REP #$20            ; $07E86A   |
    LDA $E78D,y         ; $07E86C   |
    STA $7B58,x         ; $07E86F   |

CODE_07E872:
    RTS                 ; $07E872   |

    LDX $12             ; $07E873   |
    JSR CODE_07EA77     ; $07E875   |
    LDA $7A96,x         ; $07E878   |
    BNE CODE_07E895     ; $07E87B   |
    LDA #$0008          ; $07E87D   |
    STA $7A96,x         ; $07E880   |
    LDA $7402,x         ; $07E883   |
    INC A               ; $07E886   |
    AND #$0001          ; $07E887   |
    STA $7402,x         ; $07E88A   |
    ASL A               ; $07E88D   |
    TAY                 ; $07E88E   |
    LDA $E78D,y         ; $07E88F   |
    STA $7B58,x         ; $07E892   |

CODE_07E895:
    RTS                 ; $07E895   |

DATA_07E896:         db $01, $02, $03, $11, $10, $0F, $0D, $0E
DATA_07E89E:         db $0D, $0C, $0B, $09, $08, $09, $0A, $09
DATA_07E8A6:         db $08, $07, $06, $05, $04, $03, $02, $01

DATA_07E8AE:         db $04, $04, $38, $02, $02, $02, $02, $04
DATA_07E8B6:         db $02, $20, $40, $20, $04, $02, $02, $02
DATA_07E8BE:         db $02, $02, $02, $02, $02, $20, $02, $02
DATA_07E8C6:         db $00, $FE, $00, $02, $00, $FE, $00, $02
DATA_07E8CE:         db $00, $00, $00, $00, $80, $FF, $80, $FF

DATA_07E8D6:         dw $FFC0, $0040, $FFD0, $0030

DATA_07E8DE:         dw $0010, $0010, $001C, $001C

CODE_07E8E6:
    LDA #$0008          ; $07E8E6   |
    STA $7A96,x         ; $07E8E9   |
    LDA #$0000          ; $07E8EC   |
    STA $7402,x         ; $07E8EF   |
    ASL A               ; $07E8F2   |
    TAY                 ; $07E8F3   |
    LDA $E78D,y         ; $07E8F4   |
    STA $7B58,x         ; $07E8F7   |
    LDA #$0080          ; $07E8FA   |
    STA $7A98,x         ; $07E8FD   |
    LDY $7900,x         ; $07E900   |
    DEY                 ; $07E903   |
    BNE CODE_07E90F     ; $07E904   |
    LDY $7400,x         ; $07E906   |
    LDA $E7B1,y         ; $07E909   |
    STA $7220,x         ; $07E90C   |

CODE_07E90F:
    LDA #$0000          ; $07E90F   |
    STA $16,x           ; $07E912   |
    RTS                 ; $07E914   |

    LDX $12             ; $07E915   |
    LDA $7680,x         ; $07E917   |
    ORA $7682,x         ; $07E91A   |
    AND #$FF00          ; $07E91D   |
    BNE CODE_07E8E6     ; $07E920   |
    LDA $7A96,x         ; $07E922   |
    BEQ CODE_07E92A     ; $07E925   |
    JMP CODE_07E9AA     ; $07E927   |

CODE_07E92A:
    DEC $18,x           ; $07E92A   |
    BMI CODE_07E8E6     ; $07E92C   |
    SEP #$20            ; $07E92E   |
    LDY $18,x           ; $07E930   |
    LDA $E8AE,y         ; $07E932   |
    STA $7A96,x         ; $07E935   |
    LDA $E896,y         ; $07E938   |
    STA $7402,x         ; $07E93B   |
    ASL A               ; $07E93E   |
    TAY                 ; $07E93F   |
    REP #$20            ; $07E940   |
    LDA $E78D,y         ; $07E942   |
    STA $7B58,x         ; $07E945   |
    LDA $18,x           ; $07E948   |
    CMP #$0013          ; $07E94A   |
    BNE CODE_07E97A     ; $07E94D   |
    LDA #$0201          ; $07E94F   |
    JSL $008B21         ; $07E952   |
    LDA $70E2,x         ; $07E956   |
    STA $70A2,y         ; $07E959   |
    LDA $7182,x         ; $07E95C   |
    CLC                 ; $07E95F   |
    ADC #$0008          ; $07E960   |
    STA $7142,y         ; $07E963   |
    LDA #$0002          ; $07E966   |
    STA $7782,y         ; $07E969   |
    LDA #$0005          ; $07E96C   |
    STA $73C2,y         ; $07E96F   |
    LDA #$0003          ; $07E972   |\ play sound #$0003
    JSL $0085D2         ; $07E975   |/
    RTS                 ; $07E979   |

CODE_07E97A:
    CMP #$0002          ; $07E97A   |
    BNE CODE_07E9E3     ; $07E97D   |
    LDA #$01BA          ; $07E97F   |
    JSL $008B21         ; $07E982   |
    LDA $70E2,x         ; $07E986   |
    STA $70A2,y         ; $07E989   |
    LDA $7182,x         ; $07E98C   |
    SEC                 ; $07E98F   |
    SBC #$0008          ; $07E990   |
    STA $7142,y         ; $07E993   |
    LDA #$001A          ; $07E996   |
    STA $7E4C,y         ; $07E999   |
    LDA #$0003          ; $07E99C   |
    STA $7782,y         ; $07E99F   |
    LDA #$0003          ; $07E9A2   |\ play sound #$0003
    JSL $0085D2         ; $07E9A5   |/
    RTS                 ; $07E9A9   |

CODE_07E9AA:
    LDA $18,x           ; $07E9AA   |

CODE_07E9AC:
    CMP #$000A          ; $07E9AC   |
    BNE CODE_07E9E2     ; $07E9AF   |

CODE_07E9B1:
    LDY $7900,x         ; $07E9B1   |
    DEY                 ; $07E9B4   |
    TYA                 ; $07E9B5   |
    ASL A               ; $07E9B6   |
    ORA $7400,x         ; $07E9B7   |
    TAY                 ; $07E9BA   |
    LDA $70E2,x         ; $07E9BB   |
    CLC                 ; $07E9BE   |
    ADC $E8D6,y         ; $07E9BF   |
    STA $00             ; $07E9C2   |
    LDA $7182,x         ; $07E9C4   |
    SEC                 ; $07E9C7   |
    SBC $E8DE,y         ; $07E9C8   |
    STA $02             ; $07E9CB   |
    LDA $7A38,x         ; $07E9CD   |
    STA $04             ; $07E9D0   |
    JSL $07FCB8         ; $07E9D2   |
    LDA $7A38,x         ; $07E9D6   |
    INC A               ; $07E9D9   |
    CMP #$0020          ; $07E9DA   |
    BCS CODE_07E9E2     ; $07E9DD   |
    STA $7A38,x         ; $07E9DF   |

CODE_07E9E2:
    RTS                 ; $07E9E2   |

CODE_07E9E3:
    CMP #$0012          ; $07E9E3   |
    BNE CODE_07E9FB     ; $07E9E6   |
    LDA $6FA0,x         ; $07E9E8   |
    AND #$7F9F          ; $07E9EB   |
    STA $6FA0,x         ; $07E9EE   |
    LDA $7040,x         ; $07E9F1   |
    ORA #$0100          ; $07E9F4   |
    STA $7040,x         ; $07E9F7   |
    RTS                 ; $07E9FA   |

CODE_07E9FB:
    CMP #$0004          ; $07E9FB   |
    BNE CODE_07EA13     ; $07E9FE   |
    LDA $6FA0,x         ; $07EA00   |
    ORA #$C060          ; $07EA03   |
    STA $6FA0,x         ; $07EA06   |
    LDA $7040,x         ; $07EA09   |
    AND #$FEFF          ; $07EA0C   |
    STA $7040,x         ; $07EA0F   |
    RTS                 ; $07EA12   |

CODE_07EA13:
    CMP #$000A          ; $07EA13   |
    BNE CODE_07EA1D     ; $07EA16   |
    STZ $7A38,x         ; $07EA18   |
    BRA CODE_07E9B1     ; $07EA1B   |

CODE_07EA1D:
    CMP #$0009          ; $07EA1D   |
    BNE CODE_07E9AC     ; $07EA20   |
    LDY $7900,x         ; $07EA22   |
    DEY                 ; $07EA25   |
    TYA                 ; $07EA26   |
    ASL A               ; $07EA27   |
    ORA $7400,x         ; $07EA28   |
    TAY                 ; $07EA2B   |
    PHY                 ; $07EA2C   |
    LDA $70E2,x         ; $07EA2D   |
    CLC                 ; $07EA30   |
    ADC $E8D6,y         ; $07EA31   |
    STA $00             ; $07EA34   |
    LDA $7182,x         ; $07EA36   |
    SEC                 ; $07EA39   |
    SBC $E8DE,y         ; $07EA3A   |
    STA $02             ; $07EA3D   |
    LDA $7A38,x         ; $07EA3F   |
    STA $04             ; $07EA42   |
    JSL $07FCB3         ; $07EA44   |
    PLY                 ; $07EA48   |
    LDA $E8C6,y         ; $07EA49   |
    STA $00             ; $07EA4C   |
    LDA $E8CE,y         ; $07EA4E   |
    STA $02             ; $07EA51   |
    LDA #$0099          ; $07EA53   |
    JSL $03A34C         ; $07EA56   |
    BCC CODE_07E9E2     ; $07EA5A   |
    LDA $70E2,x         ; $07EA5C   |
    STA $70E2,y         ; $07EA5F   |
    LDA $7182,x         ; $07EA62   |
    SEC                 ; $07EA65   |
    SBC #$0010          ; $07EA66   |
    STA $7182,y         ; $07EA69   |
    LDA $00             ; $07EA6C   |
    STA $7220,y         ; $07EA6E   |
    LDA $02             ; $07EA71   |
    STA $7222,y         ; $07EA73   |
    RTS                 ; $07EA76   |

CODE_07EA77:
    LDA $7A98,x         ; $07EA77   |
    BNE CODE_07EAD9     ; $07EA7A   |
    LDA $7CD6,x         ; $07EA7C   |
    SEC                 ; $07EA7F   |
    SBC $611C           ; $07EA80   |
    CLC                 ; $07EA83   |
    ADC #$0020          ; $07EA84   |
    CMP #$0040          ; $07EA87   |
    BCC CODE_07EAD9     ; $07EA8A   |
    SEC                 ; $07EA8C   |
    SBC #$0020          ; $07EA8D   |
    CLC                 ; $07EA90   |
    ADC #$0060          ; $07EA91   |
    CMP #$00C0          ; $07EA94   |
    BCS CODE_07EAD9     ; $07EA97   |
    LDA $7CD8,x         ; $07EA99   |
    SEC                 ; $07EA9C   |
    SBC $611E           ; $07EA9D   |
    CLC                 ; $07EAA0   |
    ADC #$0040          ; $07EAA1   |
    CMP #$0080          ; $07EAA4   |
    BCS CODE_07EAD9     ; $07EAA7   |
    LDA $77C2,x         ; $07EAA9   |
    AND #$00FF          ; $07EAAC   |
    STA $7400,x         ; $07EAAF   |
    STZ $7220,x         ; $07EAB2   |
    LDA #$0017          ; $07EAB5   |
    STA $18,x           ; $07EAB8   |
    SEP #$20            ; $07EABA   |
    TAY                 ; $07EABC   |
    LDA $E8AE,y         ; $07EABD   |
    STA $7A96,x         ; $07EAC0   |
    LDA $E896,y         ; $07EAC3   |
    STA $7402,x         ; $07EAC6   |
    ASL A               ; $07EAC9   |
    TAY                 ; $07EACA   |
    REP #$20            ; $07EACB   |
    LDA $E78D,y         ; $07EACD   |
    STA $7B58,x         ; $07EAD0   |
    LDA #$0002          ; $07EAD3   |
    STA $16,x           ; $07EAD6   |
    PLA                 ; $07EAD8   |

CODE_07EAD9:
    RTS                 ; $07EAD9   |

DATA_07EADA:         dw $0000, $0010

CODE_07EADE:
    LDY $7900,x         ; $07EADE   |
    DEY                 ; $07EAE1   |
    BNE CODE_07EB44     ; $07EAE2   |
    LDY $7400,x         ; $07EAE4   |
    LDA $70E2,x         ; $07EAE7   |
    CLC                 ; $07EAEA   |
    ADC $EADA,y         ; $07EAEB   |
    STA $3010           ; $07EAEE   |
    LDA $7182,x         ; $07EAF1   |
    CLC                 ; $07EAF4   |
    ADC #$0008          ; $07EAF5   |
    STA $3000           ; $07EAF8   |
    LDX #$0A            ; $07EAFB   |
    LDA #$CE2F          ; $07EAFD   |
    JSL $7EDE91         ; $07EB00   | GSU init
    LDX $12             ; $07EB04   |
    LDA $300C           ; $07EB06   |
    CMP #$77C2          ; $07EB09   |
    BCC CODE_07EB1D     ; $07EB0C   |
    CMP #$77C6          ; $07EB0E   |
    BCC CODE_07EB44     ; $07EB11   |
    CMP #$77D0          ; $07EB13   |
    BCC CODE_07EB1D     ; $07EB16   |
    CMP #$77D6          ; $07EB18   |
    BCC CODE_07EB44     ; $07EB1B   |

CODE_07EB1D:
    LDA $7400,x         ; $07EB1D   |
    EOR #$0002          ; $07EB20   |
    STA $7400,x         ; $07EB23   |
    LDA $7220,x         ; $07EB26   |
    EOR #$FFFF          ; $07EB29   |
    INC A               ; $07EB2C   |
    STA $7220,x         ; $07EB2D   |
    LDA $70E2,x         ; $07EB30   |
    SEC                 ; $07EB33   |
    SBC $72C0,x         ; $07EB34   |
    STA $70E2,x         ; $07EB37   |
    LDA $7CD6,x         ; $07EB3A   |
    SEC                 ; $07EB3D   |
    SBC $72C0,x         ; $07EB3E   |
    STA $7CD6,x         ; $07EB41   |

CODE_07EB44:
    RTS                 ; $07EB44   |

    LDA #$0012          ; $07EB45   |
    STA $7402,x         ; $07EB48   |
    RTL                 ; $07EB4B   |

.init_thunder_lakitu                         ; spawns one or two
    LDA #$0001          ; $07EB4C   |
    STA $0C68           ; $07EB4F   |
    LDA $0967           ; $07EB52   |
    STA $76,x           ; $07EB55   |
    LDA #$0010          ; $07EB57   |
    STA $7540,x         ; $07EB5A   |
    STA $7542,x         ; $07EB5D   |
    LDA #$0200          ; $07EB60   |
    STA $75E2,x         ; $07EB63   |
    STA $75E0,x         ; $07EB66   |
    LDA $70E2,x         ; $07EB69   |
    AND #$0010          ; $07EB6C   |
    BEQ CODE_07EBAD     ; $07EB6F   |
    LDY $0073           ; $07EB71   |
    LDA $0039           ; $07EB74   |
    CLC                 ; $07EB77   |
    ADC $F0C3,y         ; $07EB78   |
    STA $00             ; $07EB7B   |
    LDA #$0166          ; $07EB7D   |
    JSL $03A364         ; $07EB80   |
    BCC CODE_07EBAD     ; $07EB84   |
    LDA $0967           ; $07EB86   |
    STA $79D6,y         ; $07EB89   |
    LDA $00             ; $07EB8C   |
    STA $70E2,y         ; $07EB8E   |
    LDA $003B           ; $07EB91   |
    SEC                 ; $07EB94   |
    SBC #$0030          ; $07EB95   |
    STA $7182,y         ; $07EB98   |
    LDA #$0010          ; $07EB9B   |
    STA $7540,y         ; $07EB9E   |
    STA $7542,y         ; $07EBA1   |
    LDA #$0200          ; $07EBA4   |
    STA $75E2,y         ; $07EBA7   |
    STA $75E0,y         ; $07EBAA   |

CODE_07EBAD:
    RTL                 ; $07EBAD   |

.main_thunder_lakitu                         ; spawns one or two
    LDA $6F00,x         ; $07EBAE   |
    CMP #$0010          ; $07EBB1   |
    BNE CODE_07EBBB     ; $07EBB4   |
    JSR CODE_07EF4A     ; $07EBB6   |
    BRA CODE_07EC14     ; $07EBB9   |

CODE_07EBBB:
    PHA                 ; $07EBBB   |
    JSR CODE_07EFD2     ; $07EBBC   |
    PLA                 ; $07EBBF   |
    CMP #$0008          ; $07EBC0   |
    BNE CODE_07EC14     ; $07EBC3   |
    LDA #$011C          ; $07EBC5   |
    JSL $03A364         ; $07EBC8   |
    BCC CODE_07EC06     ; $07EBCC   |
    LDA $70E2,x         ; $07EBCE   |
    STA $70E2,y         ; $07EBD1   |
    LDA $7182,x         ; $07EBD4   |
    CLC                 ; $07EBD7   |
    ADC #$0008          ; $07EBD8   |
    STA $7182,y         ; $07EBDB   |
    LDA #$0008          ; $07EBDE   |
    STA $6F00,y         ; $07EBE1   |
    TYA                 ; $07EBE4   |
    AND #$00FF          ; $07EBE5   |
    INC A               ; $07EBE8   |
    STA $6162           ; $07EBE9   |
    LDA $7040,y         ; $07EBEC   |
    AND #$FFF3          ; $07EBEF   |
    STA $7040,y         ; $07EBF2   |
    TXA                 ; $07EBF5   |
    INC A               ; $07EBF6   |
    STA $7976,y         ; $07EBF7   |
    LDA #$000E          ; $07EBFA   |
    STA $6F00,x         ; $07EBFD   |
    JSL $07F06B         ; $07EC00   |
    BRA CODE_07EC0F     ; $07EC04   |

CODE_07EC06:
    LDA #$0010          ; $07EC06   |
    STA $6F00,x         ; $07EC09   |
    STZ $6162           ; $07EC0C   |

CODE_07EC0F:
    STZ $6168           ; $07EC0F   |
    PLA                 ; $07EC12   |
    PLY                 ; $07EC13   |

CODE_07EC14:
    JSL $03AF23         ; $07EC14   |
    JSL $07EF98         ; $07EC18   |
    LDA $77C2,x         ; $07EC1C   |
    AND #$00FF          ; $07EC1F   |
    STA $7400,x         ; $07EC22   |
    LDA $16,x           ; $07EC25   |
    TAX                 ; $07EC27   |
    JSR ($EC8B,x)       ; $07EC28   |

    JSR CODE_07EFE9     ; $07EC2B   |
    LDA $0C68           ; $07EC2E   |
    BNE CODE_07EC4E     ; $07EC31   |
    LDA #$F800          ; $07EC33   |
    STA $75E2,x         ; $07EC36   |
    STA $75E0,x         ; $07EC39   |
    LDA #$0040          ; $07EC3C   |
    STA $7542,x         ; $07EC3F   |
    STA $7540,x         ; $07EC42   |
    LDA $7040,x         ; $07EC45   |
    ORA #$0004          ; $07EC48   |
    STA $7040,x         ; $07EC4B   |

CODE_07EC4E:
    LDA $14             ; $07EC4E   |
    AND #$0007          ; $07EC50   |
    BNE CODE_07EC86     ; $07EC53   |
    LDA #$01F8          ; $07EC55   |
    JSL $008B21         ; $07EC58   |
    LDA #$0002          ; $07EC5C   |
    STA $73C2,y         ; $07EC5F   |
    LDA #$0008          ; $07EC62   |
    STA $7782,y         ; $07EC65   |
    LDA $70E2,x         ; $07EC68   |
    SEC                 ; $07EC6B   |
    SBC $72C0,x         ; $07EC6C   |
    STA $70A2,y         ; $07EC6F   |
    LDA $10             ; $07EC72   |
    AND #$0007          ; $07EC74   |
    CLC                 ; $07EC77   |
    ADC $7182,x         ; $07EC78   |
    CLC                 ; $07EC7B   |
    ADC #$0008          ; $07EC7C   |
    SEC                 ; $07EC7F   |
    SBC $72C2,x         ; $07EC80   |
    STA $7142,y         ; $07EC83   |

CODE_07EC86:
    JSL $03A5B7         ; $07EC86   |
    RTL                 ; $07EC8A   |

DATA_07EC8B:         dw $ECA7
DATA_07EC8D:         dw $ED63
DATA_07EC8F:         dw $EE47
DATA_07EC91:         dw $EEFF

DATA_07EC93:         dw $0030, $FFD0

DATA_07EC97:         dw $0008, $0010

DATA_07EC9B:         dw $0200, $FE00

DATA_07EC9F:         dw $0008, $0010

DATA_07ECA3:         dw $0200, $FE00

    LDX $12             ; $07ECA7   |
    JSR CODE_07ECC4     ; $07ECA9   |
    LDA $7A98,x         ; $07ECAC   |
    BNE CODE_07ECC3     ; $07ECAF   |
    JSR CODE_07F027     ; $07ECB1   |
    BCS CODE_07ECC3     ; $07ECB4   |
    LDA #$0001          ; $07ECB6   |
    STA $7402,x         ; $07ECB9   |
    STA $18,x           ; $07ECBC   |
    LDA #$0002          ; $07ECBE   |
    STA $16,x           ; $07ECC1   |

CODE_07ECC3:
    RTS                 ; $07ECC3   |

CODE_07ECC4:
    LDY #$00            ; $07ECC4   |
    DEC A               ; $07ECC6   |
    EOR $7220,x         ; $07ECC7   |
    BPL CODE_07ECCE     ; $07ECCA   |
    INY                 ; $07ECCC   |
    INY                 ; $07ECCD   |

CODE_07ECCE:
    LDA $EC97,y         ; $07ECCE   |
    STA $7540,x         ; $07ECD1   |
    LDA $7220,x         ; $07ECD4   |
    AND #$8000          ; $07ECD7   |
    ASL A               ; $07ECDA   |
    ROL A               ; $07ECDB   |
    ASL A               ; $07ECDC   |
    TAY                 ; $07ECDD   |
    LDA $608C           ; $07ECDE   |
    CLC                 ; $07ECE1   |
    ADC $EC93,y         ; $07ECE2   |
    LDY #$00            ; $07ECE5   |
    CMP $70E2,x         ; $07ECE7   |
    BPL CODE_07ECEE     ; $07ECEA   |
    INY                 ; $07ECEC   |
    INY                 ; $07ECED   |

CODE_07ECEE:
    LDA $EC9B,y         ; $07ECEE   |
    STA $75E0,x         ; $07ECF1   |
    LDA $7222,x         ; $07ECF4   |
    BPL CODE_07ECFD     ; $07ECF7   |
    EOR #$FFFF          ; $07ECF9   |
    INC A               ; $07ECFC   |

CODE_07ECFD:
    CMP #$0100          ; $07ECFD   |
    BCC CODE_07ED14     ; $07ED00   |
    LDY #$00            ; $07ED02   |
    LDA $7682,x         ; $07ED04   |
    CMP #$0030          ; $07ED07   |
    BMI CODE_07ED0E     ; $07ED0A   |
    INY                 ; $07ED0C   |
    INY                 ; $07ED0D   |

CODE_07ED0E:
    LDA $ECA3,y         ; $07ED0E   |
    STA $75E2,x         ; $07ED11   |

CODE_07ED14:
    LDY #$00            ; $07ED14   |
    LDA $7682,x         ; $07ED16   |
    SEC                 ; $07ED19   |
    SBC #$0030          ; $07ED1A   |
    EOR $7222,x         ; $07ED1D   |
    BMI CODE_07ED24     ; $07ED20   |
    INY                 ; $07ED22   |
    INY                 ; $07ED23   |

CODE_07ED24:
    LDA $EC9F,y         ; $07ED24   |
    STA $7542,x         ; $07ED27   |
    LDA $7682,x         ; $07ED2A   |
    CLC                 ; $07ED2D   |
    ADC #$0080          ; $07ED2E   |
    CMP #$0200          ; $07ED31   |
    BCC CODE_07ED4A     ; $07ED34   |
    LDA $75E2,x         ; $07ED36   |
    CLC                 ; $07ED39   |
    ADC #$0800          ; $07ED3A   |
    CMP #$1000          ; $07ED3D   |
    BCS CODE_07ED4A     ; $07ED40   |
    LDA $75E2,x         ; $07ED42   |
    ASL A               ; $07ED45   |
    ASL A               ; $07ED46   |
    STA $75E2,x         ; $07ED47   |

CODE_07ED4A:
    RTS                 ; $07ED4A   |

DATA_07ED4B:         dw $0004, $000C

DATA_07ED4F:         dw $FFFE, $0002

DATA_07ED53:         dw $0006, $000C

DATA_07ED57:         dw $000F, $000F, $000F, $000F
DATA_07ED5F:         dw $000F, $000F

    LDX $12             ; $07ED63   |
    JSR CODE_07ECC4     ; $07ED65   |
    JSR CODE_07F027     ; $07ED68   |
    BCC CODE_07ED70     ; $07ED6B   |
    JMP CODE_07EF06     ; $07ED6D   |

CODE_07ED70:
    LDA $18,x           ; $07ED70   |
    PHA                 ; $07ED72   |
    AND #$0004          ; $07ED73   |
    LSR A               ; $07ED76   |
    TAY                 ; $07ED77   |
    LDA $ED4B,y         ; $07ED78   |
    STA $00             ; $07ED7B   |
    PLA                 ; $07ED7D   |
    LSR A               ; $07ED7E   |
    LSR A               ; $07ED7F   |
    LSR A               ; $07ED80   |
    CMP #$0005          ; $07ED81   |
    BCC CODE_07ED89     ; $07ED84   |
    LDA #$0005          ; $07ED86   |

CODE_07ED89:
    STA $02             ; $07ED89   |
    ASL A               ; $07ED8B   |
    TAY                 ; $07ED8C   |
    LDA $18,x           ; $07ED8D   |
    AND $ED57,y         ; $07ED8F   |
    BNE CODE_07ED9B     ; $07ED92   |
    LDA #$0051          ; $07ED94   |\ play sound #$0051
    JSL $0085D2         ; $07ED97   |/

CODE_07ED9B:
    LDY $7400,x         ; $07ED9B   |
    LDA $70E2,x         ; $07ED9E   |
    CLC                 ; $07EDA1   |
    ADC $ED4F,y         ; $07EDA2   |
    STA $04             ; $07EDA5   |
    LDA #$020D          ; $07EDA7   |
    JSL $008B21         ; $07EDAA   |
    LDA $02             ; $07EDAE   |
    STA $73C2,y         ; $07EDB0   |
    LDA #$0001          ; $07EDB3   |
    STA $7782,y         ; $07EDB6   |
    LDA $04             ; $07EDB9   |
    STA $70A2,y         ; $07EDBB   |
    LDA $7182,x         ; $07EDBE   |
    SEC                 ; $07EDC1   |
    SBC #$0018          ; $07EDC2   |
    STA $7142,y         ; $07EDC5   |
    LDA $7002,y         ; $07EDC8   |
    AND #$FFF1          ; $07EDCB   |
    ORA $00             ; $07EDCE   |
    STA $7002,y         ; $07EDD0   |
    LDY $7400,x         ; $07EDD3   |
    LDA $70E2,x         ; $07EDD6   |
    CLC                 ; $07EDD9   |
    ADC $ED53,y         ; $07EDDA   |
    STA $00             ; $07EDDD   |
    LDA #$020E          ; $07EDDF   |
    JSL $008B21         ; $07EDE2   |
    LDA $18,x           ; $07EDE6   |
    LSR A               ; $07EDE8   |
    AND #$0007          ; $07EDE9   |
    STA $73C2,y         ; $07EDEC   |
    LDA #$0001          ; $07EDEF   |
    STA $7782,y         ; $07EDF2   |
    LDA $00             ; $07EDF5   |
    STA $70A2,y         ; $07EDF7   |
    LDA $7182,x         ; $07EDFA   |
    SEC                 ; $07EDFD   |
    SBC #$0020          ; $07EDFE   |
    STA $7142,y         ; $07EE01   |
    LDA $18,x           ; $07EE04   |
    INC A               ; $07EE06   |
    CMP #$0040          ; $07EE07   |
    BCS CODE_07EE0F     ; $07EE0A   |
    STA $18,x           ; $07EE0C   |
    RTS                 ; $07EE0E   |

CODE_07EE0F:
    LDA $0967           ; $07EE0F   |
    STA $76,x           ; $07EE12   |
    ORA $0968           ; $07EE14   |
    AND #$000F          ; $07EE17   |
    XBA                 ; $07EE1A   |
    ORA #$0010          ; $07EE1B   |
    STA $0967           ; $07EE1E   |
    LDA #$0002          ; $07EE21   |
    STA $7402,x         ; $07EE24   |
    LDA #$0018          ; $07EE27   |
    STA $7A96,x         ; $07EE2A   |
    LDA #$0004          ; $07EE2D   |
    STA $16,x           ; $07EE30   |
    STZ $7540,x         ; $07EE32   |
    STZ $7220,x         ; $07EE35   |
    STZ $7542,x         ; $07EE38   |
    STZ $7222,x         ; $07EE3B   |
    RTS                 ; $07EE3E   |

DATA_07EE3F:         dw $0000, $7C00, $03E0, $001F

    LDX $12             ; $07EE47   |
    JSR CODE_07F027     ; $07EE49   |
    BCC CODE_07EE54     ; $07EE4C   |
    JSR CODE_07EFD2     ; $07EE4E   |
    JMP CODE_07EF06     ; $07EE51   |

CODE_07EE54:
    LDA $14             ; $07EE54   |
    AND #$0007          ; $07EE56   |
    BNE CODE_07EE62     ; $07EE59   |
    LDA #$0051          ; $07EE5B   |\ play sound #$0051
    JSL $0085D2         ; $07EE5E   |/

CODE_07EE62:
    LDA $7402,x         ; $07EE62   |
    AND #$0001          ; $07EE65   |
    ASL A               ; $07EE68   |
    TAY                 ; $07EE69   |
    LDA $ED4B,y         ; $07EE6A   |
    STA $00             ; $07EE6D   |
    LDA #$020D          ; $07EE6F   |
    JSL $008B21         ; $07EE72   |
    LDA #$0005          ; $07EE76   |
    STA $73C2,y         ; $07EE79   |
    LDA #$0001          ; $07EE7C   |
    STA $7782,y         ; $07EE7F   |
    LDA $70E2,x         ; $07EE82   |
    STA $70A2,y         ; $07EE85   |
    LDA $7182,x         ; $07EE88   |
    SEC                 ; $07EE8B   |
    SBC #$0018          ; $07EE8C   |
    STA $7142,y         ; $07EE8F   |
    LDA $7002,y         ; $07EE92   |
    AND #$FFF1          ; $07EE95   |
    ORA $00             ; $07EE98   |
    STA $7002,y         ; $07EE9A   |
    LDA $7A96,x         ; $07EE9D   |
    BEQ CODE_07EEBF     ; $07EEA0   |
    AND #$0003          ; $07EEA2   |
    BNE CODE_07EEBE     ; $07EEA5   |
    LDA $7402,x         ; $07EEA7   |
    EOR #$0001          ; $07EEAA   |
    STA $7402,x         ; $07EEAD   |
    LDA $14             ; $07EEB0   |
    AND #$000C          ; $07EEB2   |
    LSR A               ; $07EEB5   |
    TAY                 ; $07EEB6   |
    LDA $EE3F,y         ; $07EEB7   |
    STA $702000         ; $07EEBA   |

CODE_07EEBE:
    RTS                 ; $07EEBE   |

CODE_07EEBF:
    JSR CODE_07EFD2     ; $07EEBF   |
    LDA #$0030          ; $07EEC2   |
    STA $7A96,x         ; $07EEC5   |
    LDA #$0004          ; $07EEC8   |
    STA $7402,x         ; $07EECB   |
    LDA #$0006          ; $07EECE   |
    STA $16,x           ; $07EED1   |
    LDA #$00A2          ; $07EED3   |
    JSL $03A364         ; $07EED6   |
    BCC CODE_07EEFA     ; $07EEDA   |
    LDA $70E2,x         ; $07EEDC   |
    STA $70E2,y         ; $07EEDF   |
    LDA $7182,x         ; $07EEE2   |
    STA $7182,y         ; $07EEE5   |
    LDA #$0005          ; $07EEE8   |
    STA $7402,y         ; $07EEEB   |
    LDA #$0200          ; $07EEEE   |
    STA $7222,y         ; $07EEF1   |
    LDA $60A8           ; $07EEF4   |
    STA $7220,y         ; $07EEF7   |

CODE_07EEFA:
    RTS                 ; $07EEFA   |

DATA_07EEFB:         dw $FE00, $0200

    LDX $12             ; $07EEFF   |
    LDA $7A96,x         ; $07EF01   |
    BNE CODE_07EF3F     ; $07EF04   |

CODE_07EF06:
    LDA $10             ; $07EF06   |
    AND #$007F          ; $07EF08   |
    CLC                 ; $07EF0B   |
    ADC #$0080          ; $07EF0C   |
    STA $7A98,x         ; $07EF0F   |
    LDA #$0010          ; $07EF12   |
    STA $7540,x         ; $07EF15   |
    STA $7542,x         ; $07EF18   |
    LDA $10             ; $07EF1B   |
    AND #$0001          ; $07EF1D   |
    ASL A               ; $07EF20   |
    TAY                 ; $07EF21   |
    LDA $EEFB,y         ; $07EF22   |
    STA $75E0,x         ; $07EF25   |
    LDA $10             ; $07EF28   |
    AND #$0002          ; $07EF2A   |
    TAY                 ; $07EF2D   |
    LDA $EEFB,y         ; $07EF2E   |
    STA $75E2,x         ; $07EF31   |
    LDA #$0000          ; $07EF34   |
    STA $7402,x         ; $07EF37   |
    LDA #$0000          ; $07EF3A   |
    STA $16,x           ; $07EF3D   |

CODE_07EF3F:
    RTS                 ; $07EF3F   |

DATA_07EF40:         dw $000A, $000A, $000A, $0022
DATA_07EF48:         dw $000A

CODE_07EF4A:
    LDY $74A2,x         ; $07EF4A   |
    BMI CODE_07EF97     ; $07EF4D   |
    LDA $14             ; $07EF4F   |
    AND #$0008          ; $07EF51   |
    BEQ CODE_07EF97     ; $07EF54   |
    LDA $7402,x         ; $07EF56   |
    CMP #$0005          ; $07EF59   |
    BCS CODE_07EF97     ; $07EF5C   |
    ASL A               ; $07EF5E   |
    TAY                 ; $07EF5F   |
    LDA $7180,x         ; $07EF60   |
    AND #$00FF          ; $07EF63   |
    ASL A               ; $07EF66   |
    ASL A               ; $07EF67   |
    ASL A               ; $07EF68   |
    CLC                 ; $07EF69   |
    ADC $EF40,y         ; $07EF6A   |
    STA $00             ; $07EF6D   |
    REP #$10            ; $07EF6F   |
    LDA $7362,x         ; $07EF71   |
    CLC                 ; $07EF74   |
    ADC #$0008          ; $07EF75   |
    TAY                 ; $07EF78   |
    LDA $6004,y         ; $07EF79   |
    AND #$FE00          ; $07EF7C   |
    ORA $00             ; $07EF7F   |
    STA $6004,y         ; $07EF81   |
    TYA                 ; $07EF84   |
    CLC                 ; $07EF85   |
    ADC #$0008          ; $07EF86   |
    TAY                 ; $07EF89   |
    LDA $6004,y         ; $07EF8A   |
    AND #$FE00          ; $07EF8D   |
    ORA $00             ; $07EF90   |
    STA $6004,y         ; $07EF92   |
    SEP #$10            ; $07EF95   |

CODE_07EF97:
    RTS                 ; $07EF97   |

    LDY $7D36,x         ; $07EF98   |
    DEY                 ; $07EF9B   |
    BEQ CODE_07EFD1     ; $07EF9C   |
    BMI CODE_07EFD1     ; $07EF9E   |
    LDA $6F00,y         ; $07EFA0   |
    CMP #$0010          ; $07EFA3   |
    BNE CODE_07EFD1     ; $07EFA6   |
    LDA $7D38,y         ; $07EFA8   |
    BEQ CODE_07EFD1     ; $07EFAB   |
    TYX                 ; $07EFAD   |
    JSL $03B24B         ; $07EFAE   |
    LDX $12             ; $07EFB2   |
    LDA $7CD6,x         ; $07EFB4   |
    STA $00             ; $07EFB7   |
    LDA $7CD8,x         ; $07EFB9   |
    STA $02             ; $07EFBC   |
    LDA #$01E6          ; $07EFBE   |
    JSL $03B56E         ; $07EFC1   |
    LDA #$000E          ; $07EFC5   |
    STA $6F00,x         ; $07EFC8   |
    JSL $07F06B         ; $07EFCB   |
    PLY                 ; $07EFCF   |
    PLA                 ; $07EFD0   |

CODE_07EFD1:
    RTL                 ; $07EFD1   |

CODE_07EFD2:
    LDA $096C           ; $07EFD2   |
    AND #$FF7F          ; $07EFD5   |
    STA $096C           ; $07EFD8   |
    LDA $702D6C         ; $07EFDB   |
    STA $702000         ; $07EFDF   |
    LDA $76,x           ; $07EFE3   |
    STA $0967           ; $07EFE5   |
    RTS                 ; $07EFE8   |

CODE_07EFE9:
    LDA $7A38,x         ; $07EFE9   |
    BNE CODE_07F009     ; $07EFEC   |
    LDA $0039           ; $07EFEE   |
    CLC                 ; $07EFF1   |
    ADC #$0010          ; $07EFF2   |
    CMP $70E2,x         ; $07EFF5   |
    BPL CODE_07F026     ; $07EFF8   |
    CLC                 ; $07EFFA   |
    ADC #$00D0          ; $07EFFB   |
    CMP $70E2,x         ; $07EFFE   |
    BMI CODE_07F026     ; $07F001   |
    LDA #$0001          ; $07F003   |
    STA $7A38,x         ; $07F006   |

CODE_07F009:
    LDA $0C68           ; $07F009   |
    BEQ CODE_07F026     ; $07F00C   |
    LDA $0039           ; $07F00E   |
    CLC                 ; $07F011   |
    ADC #$0010          ; $07F012   |
    CMP $70E2,x         ; $07F015   |
    BPL CODE_07F023     ; $07F018   |
    CLC                 ; $07F01A   |
    ADC #$00D0          ; $07F01B   |
    CMP $70E2,x         ; $07F01E   |
    BPL CODE_07F026     ; $07F021   |

CODE_07F023:
    STA $70E2,x         ; $07F023   |

CODE_07F026:
    RTS                 ; $07F026   |

CODE_07F027:
    LDA $7680,x         ; $07F027   |
    CLC                 ; $07F02A   |
    ADC #$0030          ; $07F02B   |
    CMP #$0150          ; $07F02E   |
    BCS CODE_07F03D     ; $07F031   |
    LDA $7682,x         ; $07F033   |
    CLC                 ; $07F036   |
    ADC #$0030          ; $07F037   |
    CMP #$0150          ; $07F03A   |

CODE_07F03D:
    RTS                 ; $07F03D   |

    LDA $7A36,x         ; $07F03E   |
    TAX                 ; $07F041   |
    JMP ($F045,x)       ; $07F042   |

DATA_07F045:         dw $F04B
DATA_07F047:         dw $F08D
DATA_07F049:         dw $F0C7

    LDX $12             ; $07F04B   |
    LDA #$011C          ; $07F04D   |
    JSL $03A34C         ; $07F050   |
    BCC CODE_07F06B     ; $07F054   |
    LDA $70E2,x         ; $07F056   |
    STA $70E2,y         ; $07F059   |
    LDA $7182,x         ; $07F05C   |
    CLC                 ; $07F05F   |
    ADC #$0008          ; $07F060   |
    STA $7182,y         ; $07F063   |
    TXA                 ; $07F066   |
    INC A               ; $07F067   |
    STA $7976,y         ; $07F068   |

CODE_07F06B:
    JSR CODE_07EFD2     ; $07F06B   |
    LDA #$0005          ; $07F06E   |
    STA $7402,x         ; $07F071   |
    LDA #$0040          ; $07F074   |
    STA $7542,x         ; $07F077   |
    LDA #$0400          ; $07F07A   |
    STA $75E2,x         ; $07F07D   |
    LDA #$0100          ; $07F080   |
    STA $7222,x         ; $07F083   |
    INC $7A36,x         ; $07F086   |
    INC $7A36,x         ; $07F089   |
    RTL                 ; $07F08C   |

    LDX $12             ; $07F08D   |
    LDA $7680,x         ; $07F08F   |
    CLC                 ; $07F092   |
    ADC #$0050          ; $07F093   |
    CMP #$0190          ; $07F096   |
    BCS CODE_07F0A7     ; $07F099   |
    LDA $7682,x         ; $07F09B   |
    CLC                 ; $07F09E   |
    ADC #$0050          ; $07F09F   |
    CMP #$0190          ; $07F0A2   |
    BCC CODE_07F0C2     ; $07F0A5   |

CODE_07F0A7:
    STZ $7542,x         ; $07F0A7   |
    STZ $7222,x         ; $07F0AA   |
    STZ $7220,x         ; $07F0AD   |
    LDA #$FFFF          ; $07F0B0   |
    STA $74A2,x         ; $07F0B3   |
    LDA #$0280          ; $07F0B6   |
    STA $7A96,x         ; $07F0B9   |
    INC $7A36,x         ; $07F0BC   |
    INC $7A36,x         ; $07F0BF   |

CODE_07F0C2:
    RTL                 ; $07F0C2   |

DATA_07F0C3:         dw $FFD0, $0110

    LDX $12             ; $07F0C7   |
    LDA $7A96,x         ; $07F0C9   |
    BNE CODE_07F10B     ; $07F0CC   |
    LDY $0073           ; $07F0CE   |
    LDA $0039           ; $07F0D1   |
    CLC                 ; $07F0D4   |
    ADC $F0C3,y         ; $07F0D5   |
    STA $70E2,x         ; $07F0D8   |
    LDA $003B           ; $07F0DB   |
    SEC                 ; $07F0DE   |
    SBC #$0030          ; $07F0DF   |
    STA $7182,x         ; $07F0E2   |
    LDA #$0010          ; $07F0E5   |
    STA $7540,x         ; $07F0E8   |
    STA $7542,x         ; $07F0EB   |
    LDA #$0200          ; $07F0EE   |
    STA $75E2,x         ; $07F0F1   |
    STA $75E0,x         ; $07F0F4   |
    LDA #$0005          ; $07F0F7   |
    STA $74A2,x         ; $07F0FA   |
    STZ $16,x           ; $07F0FD   |
    STZ $7402,x         ; $07F0FF   |
    STZ $7A36,x         ; $07F102   |
    LDA #$0010          ; $07F105   |
    STA $6F00,x         ; $07F108   |

CODE_07F10B:
    RTL                 ; $07F10B   |

DATA_07F10C:         dw $0200, $0804

DATA_07F110:         dw $FFC0, $0040

DATA_07F114:         dw $FF80, $0080

.init_baron_von_zeppelin_5_coins
    LDA #$000E          ; $07F118   |
    BRA CODE_07F12B     ; $07F11B   |

.init_baron_von_zeppelin_key
    JSR CODE_07F28B     ; $07F11D   |
    LDA #$000C          ; $07F120   |
    BRA CODE_07F12B     ; $07F123   |

.init_baron_von_zeppelin_1_up
    JSR CODE_07F28B     ; $07F125   |
    LDA #$000A          ; $07F128   |

CODE_07F12B:
    STA $7A36,x         ; $07F12B   |
    LDA $7400,x         ; $07F12E   |
    STA $78,x           ; $07F131   |
    TAY                 ; $07F133   |
    STZ $7400,x         ; $07F134   |
    BRA CODE_07F1AA     ; $07F137   |

.init_baron_von_zeppelin_large_spring_ball
    JSL $03AE60         ; $07F139   |
    LDA #$0100          ; $07F13D   |
    STA $300C           ; $07F140   |
    LDA #$0055          ; $07F143   |
    STA $301A           ; $07F146   |
    LDA #$40E0          ; $07F149   |
    STA $3018           ; $07F14C   |
    LDA #$0010          ; $07F14F   |
    STA $3010           ; $07F152   |
    STA $3012           ; $07F155   |
    LDY $7722,x         ; $07F158   |
    TYX                 ; $07F15B   |
    LDA $03A9CE,x       ; $07F15C   |
    STA $3006           ; $07F160   |
    LDA $03A9EE,x       ; $07F163   |
    STA $3004           ; $07F167   |
    LDX #$08            ; $07F16A   |
    LDA #$8293          ; $07F16C   |
    JSL $7EDE44         ; $07F16F   | GSU init
    LDX $12             ; $07F173   |
    INC $0CF9           ; $07F175   |
    LDA #$0008          ; $07F178   |
    BRA CODE_07F19E     ; $07F17B   |

.init_baron_von_zeppelin_icy_watermelon
    LDA #$0014          ; $07F17D   |
    BRA CODE_07F19E     ; $07F180   |

.init_baron_von_zeppelin_fire_watermelon
    LDA #$0012          ; $07F182   |
    BRA CODE_07F19E     ; $07F185   |

.init_baron_von_zeppelin_watermelon
    LDA #$0010          ; $07F187   |
    BRA CODE_07F19E     ; $07F18A   |

.init_baron_von_zeppelin_bandit
    LDA #$0006          ; $07F18C   |
    BRA CODE_07F19E     ; $07F18F   |

.init_baron_von_zeppelin_bomb
    LDA #$0004          ; $07F191   |
    BRA CODE_07F19E     ; $07F194   |

.init_baron_von_zeppelin_needlenose
    LDA #$0002          ; $07F196   |
    BRA CODE_07F19E     ; $07F199   |

.init_baron_von_zeppelin_red_shy_guy
    LDA #$0000          ; $07F19B   |

CODE_07F19E:
    STA $7A36,x         ; $07F19E   |
    LDA #$FFFF          ; $07F1A1   |
    STA $78,x           ; $07F1A4   |
    LDA $7400,x         ; $07F1A6   |
    TAY                 ; $07F1A9   |

CODE_07F1AA:
    LDA $F110,y         ; $07F1AA   |
    STA $7220,x         ; $07F1AD   |
    SEP #$20            ; $07F1B0   |
    LDA $10             ; $07F1B2   |
    AND #$03            ; $07F1B4   |
    TAY                 ; $07F1B6   |
    LDA $F10C,y         ; $07F1B7   |
    STA $18,x           ; $07F1BA   |
    REP #$20            ; $07F1BC   |
    LDA #$0800          ; $07F1BE   |
    STA $75E2,x         ; $07F1C1   |
    LDA #$0004          ; $07F1C4   |
    STA $7542,x         ; $07F1C7   |
    RTL                 ; $07F1CA   |

.init_baron_von_zeppelin_giant_egg
    LDA #$0018          ; $07F1CB   |
    STA $7A36,x         ; $07F1CE   |
    LDA #$FFFF          ; $07F1D1   |
    STA $78,x           ; $07F1D4   |
    LDA $7400,x         ; $07F1D6   |
    TAY                 ; $07F1D9   |
    LDA $F114,y         ; $07F1DA   |
    STA $7220,x         ; $07F1DD   |
    SEP #$20            ; $07F1E0   |
    LDA $10             ; $07F1E2   |
    AND #$03            ; $07F1E4   |
    TAY                 ; $07F1E6   |
    LDA $F10C,y         ; $07F1E7   |
    STA $18,x           ; $07F1EA   |
    REP #$20            ; $07F1EC   |
    LDA #$0800          ; $07F1EE   |
    STA $75E2,x         ; $07F1F1   |
    LDA #$0004          ; $07F1F4   |
    STA $7542,x         ; $07F1F7   |
    RTL                 ; $07F1FA   |

.init_baron_von_zeppelin_crate_with_6_stars
    JSL $03AE60         ; $07F1FB   |
    LDA #$0100          ; $07F1FF   |
    STA $300C           ; $07F202   |
    LDA #$0055          ; $07F205   |
    STA $301A           ; $07F208   |
    LDA #$2080          ; $07F20B   |
    STA $3018           ; $07F20E   |
    LDA #$0010          ; $07F211   |
    STA $3010           ; $07F214   |
    STA $3012           ; $07F217   |
    LDY $7722,x         ; $07F21A   |
    TYX                 ; $07F21D   |
    LDA $03A9CE,x       ; $07F21E   |
    STA $3006           ; $07F222   |
    LDA $03A9EE,x       ; $07F225   |
    STA $3004           ; $07F229   |
    LDX #$08            ; $07F22C   |
    LDA #$8293          ; $07F22E   |
    JSL $7EDE44         ; $07F231   | GSU init
    LDX $12             ; $07F235   |
    INC $0CF9           ; $07F237   |
    LDA #$0016          ; $07F23A   |
    STA $7A36,x         ; $07F23D   |
    LDA $7400,x         ; $07F240   |
    STA $78,x           ; $07F243   |
    TAY                 ; $07F245   |
    STZ $7400,x         ; $07F246   |
    LDA $F110,y         ; $07F249   |
    STA $7220,x         ; $07F24C   |
    SEP #$20            ; $07F24F   |
    LDA $10             ; $07F251   |
    AND #$03            ; $07F253   |
    TAY                 ; $07F255   |
    LDA $F10C,y         ; $07F256   |
    LSR A               ; $07F259   |
    STA $18,x           ; $07F25A   |
    LDA $10             ; $07F25C   |
    AND #$0C            ; $07F25E   |
    LSR A               ; $07F260   |
    LSR A               ; $07F261   |
    TAY                 ; $07F262   |
    LDA $F10C,y         ; $07F263   |
    LSR A               ; $07F266   |
    STA $19,x           ; $07F267   |
    LDA $10             ; $07F269   |
    AND #$30            ; $07F26B   |
    LSR A               ; $07F26D   |
    LSR A               ; $07F26E   |
    LSR A               ; $07F26F   |
    LSR A               ; $07F270   |
    TAY                 ; $07F271   |
    LDA $F10C,y         ; $07F272   |
    LSR A               ; $07F275   |
    STA $76,x           ; $07F276   |
    LDA #$03            ; $07F278   |
    STA $77,x           ; $07F27A   |
    REP #$20            ; $07F27C   |
    LDA #$0800          ; $07F27E   |
    STA $75E2,x         ; $07F281   |
    LDA #$0004          ; $07F284   |
    STA $7542,x         ; $07F287   |
    RTL                 ; $07F28A   |

CODE_07F28B:
    JSL $03D3F8         ; $07F28B   |
    BEQ CODE_07F296     ; $07F28F   |
    PLA                 ; $07F291   |
    JMP CODE_0703A3     ; $07F292   |

CODE_07F296:
    LDA $70E2,x         ; $07F296   |
    ASL A               ; $07F299   |
    ASL A               ; $07F29A   |
    ASL A               ; $07F29B   |
    ASL A               ; $07F29C   |
    AND #$FF00          ; $07F29D   |
    STA $00             ; $07F2A0   |
    LDA $7182,x         ; $07F2A2   |
    LSR A               ; $07F2A5   |
    LSR A               ; $07F2A6   |
    LSR A               ; $07F2A7   |
    LSR A               ; $07F2A8   |
    AND #$00FF          ; $07F2A9   |
    ORA $00             ; $07F2AC   |
    STA $7A38,x         ; $07F2AE   |
    RTS                 ; $07F2B1   |

.main_baron_von_zeppelin_enemies             ; bandit, bomb, needlenose, and red shy guy
    STZ $3008           ; $07F2B2   |
    LDX #$08            ; $07F2B5   |
    LDA #$95B9          ; $07F2B7   |
    JSL $7EDE44         ; $07F2BA   | GSU init
    LDX $12             ; $07F2BE   |
    JSR CODE_07F9C9     ; $07F2C0   |
    JSL $03AF23         ; $07F2C3   |
    JSR CODE_07F412     ; $07F2C7   |
    JSR CODE_07F746     ; $07F2CA   |
    JSR CODE_07F3DB     ; $07F2CD   |
    RTL                 ; $07F2D0   |

.main_baron_von_zeppelin_large_spring_ball   ;
    JSL $03AA52         ; $07F2D1   |
    STZ $3008           ; $07F2D5   |
    LDX #$08            ; $07F2D8   |
    LDA #$95B9          ; $07F2DA   |
    JSL $7EDE44         ; $07F2DD   | GSU init
    LDX $12             ; $07F2E1   |
    JSL $03AF23         ; $07F2E3   |
    JSR CODE_07F538     ; $07F2E7   |
    JSR CODE_07F497     ; $07F2EA   |
    JSR CODE_07F3DB     ; $07F2ED   |
    RTL                 ; $07F2F0   |

.main_baron_von_zeppelin_melon_and_giant_egg ;regular and fire watermelons, and giant egg
    STZ $3008           ; $07F2F1   |
    LDX #$08            ; $07F2F4   |
    LDA #$95B9          ; $07F2F6   |
    JSL $7EDE44         ; $07F2F9   | GSU init
    LDX $12             ; $07F2FD   |
    JSR CODE_07F9C9     ; $07F2FF   |
    JSL $03AF23         ; $07F302   |
    JSR CODE_07F538     ; $07F306   |
    JSR CODE_07F497     ; $07F309   |
    JSR CODE_07F3DB     ; $07F30C   |
    RTL                 ; $07F30F   |

.main_baron_von_zeppelin_icy_watermelon
    STZ $3008           ; $07F310   |
    LDX #$08            ; $07F313   |
    LDA #$95B9          ; $07F315   |
    JSL $7EDE44         ; $07F318   | GSU init
    LDX $12             ; $07F31C   |
    JSR CODE_07F9C9     ; $07F31E   |
    JSL $03AF23         ; $07F321   |
    JSR CODE_07F538     ; $07F325   |
    JSR CODE_07F497     ; $07F328   |
    JSR CODE_07F3DB     ; $07F32B   |
    JSL $048131         ; $07F32E   |
    RTL                 ; $07F332   |

.main_baron_von_zeppelin_consumables         ; 5 coins, key, and 1-up
    LDA $78,x           ; $07F333   |
    LSR A               ; $07F335   |
    LSR A               ; $07F336   |
    ROR A               ; $07F337   |
    LSR A               ; $07F338   |
    STA $3008           ; $07F339   |
    LDX #$08            ; $07F33C   |
    LDA #$95B9          ; $07F33E   |
    JSL $7EDE44         ; $07F341   | GSU init
    LDX $12             ; $07F345   |
    JSR CODE_07F9C9     ; $07F347   |
    JSL $03AF23         ; $07F34A   |
    LDA $7400,x         ; $07F34E   |
    BEQ CODE_07F35A     ; $07F351   |
    LDA $78,x           ; $07F353   |
    EOR #$0002          ; $07F355   |
    STA $78,x           ; $07F358   |

CODE_07F35A:
    STZ $7400,x         ; $07F35A   |
    JSR CODE_07F538     ; $07F35D   |
    JSR CODE_07F497     ; $07F360   |
    JSR CODE_07F3DB     ; $07F363   |
    RTL                 ; $07F366   |

DATA_07F367:         dw $F704
DATA_07F369:         dw $F304
DATA_07F36B:         dw $E500
DATA_07F36D:         dw $F80B
DATA_07F36F:         dw $F50D
DATA_07F371:         dw $E80C
DATA_07F373:         dw $F9FD
DATA_07F375:         dw $F5FB
DATA_07F377:         dw $E8F4
DATA_07F379:         dw $F808
DATA_07F37B:         dw $F409
DATA_07F37D:         dw $E707
DATA_07F37F:         dw $F800
DATA_07F381:         dw $F4FF
DATA_07F383:         dw $E7F9
DATA_07F385:         dw $F804
DATA_07F387:         dw $F404
DATA_07F389:         dw $E600

; gsu pointer table
DATA_07F38B:         dw $F38A
DATA_07F38D:         dw $F384
DATA_07F38F:         dw $F378

.main_baron_von_zeppelin_crate_with_6_stars
    JSL $03AA52         ; $07F391   |
    LDA #$0007          ; $07F395   |
    STA $3000           ; $07F398   |
    LDA $77,x           ; $07F39B   |
    DEC A               ; $07F39D   |
    ASL A               ; $07F39E   |
    TAY                 ; $07F39F   |
    LDA $F38B,y         ; $07F3A0   |
    STA $300E           ; $07F3A3   |
    LDA $78,x           ; $07F3A6   |
    LSR A               ; $07F3A8   |
    LSR A               ; $07F3A9   |
    ROR A               ; $07F3AA   |
    LSR A               ; $07F3AB   |
    STA $3008           ; $07F3AC   |
    LDX #$08            ; $07F3AF   |
    LDA #$95F4          ; $07F3B1   |
    JSL $7EDE44         ; $07F3B4   | GSU init
    LDX $12             ; $07F3B8   |
    JSL $03AF23         ; $07F3BA   |
    LDA $7400,x         ; $07F3BE   |
    BEQ CODE_07F3CA     ; $07F3C1   |
    LDA $78,x           ; $07F3C3   |
    EOR #$0002          ; $07F3C5   |
    STA $78,x           ; $07F3C8   |

CODE_07F3CA:
    STZ $7400,x         ; $07F3CA   |
    JSR CODE_07F6E7     ; $07F3CD   |
    JSR CODE_07F582     ; $07F3D0   |
    JSR CODE_07F3DB     ; $07F3D3   |
    RTL                 ; $07F3D6   |

DATA_07F3D7:         dw $F800, $0800

CODE_07F3DB:
    LDA $7222,x         ; $07F3DB   |
    CLC                 ; $07F3DE   |
    ADC #$0060          ; $07F3DF   |
    CMP #$00C0          ; $07F3E2   |
    BCC CODE_07F3F7     ; $07F3E5   |
    LDA $7222,x         ; $07F3E7   |
    AND #$8000          ; $07F3EA   |
    ASL A               ; $07F3ED   |
    ROL A               ; $07F3EE   |
    ASL A               ; $07F3EF   |
    TAY                 ; $07F3F0   |
    LDA $F3D7,y         ; $07F3F1   |
    STA $75E2,x         ; $07F3F4   |

CODE_07F3F7:
    RTS                 ; $07F3F7   |

DATA_07F3F8:         dw $FFE8, $FFE8, $FFE8, $FFE0
DATA_07F400:         dw $FFE8, $FFE8, $FFE8, $FFE8
DATA_07F408:         dw $FFE8, $FFE8, $FFE8, $0000
DATA_07F410:         dw $FFE0

CODE_07F412:
    LDY $7D36,x         ; $07F412   |
    DEY                 ; $07F415   |
    BMI CODE_07F497     ; $07F416   |
    BEQ CODE_07F497     ; $07F418   |
    LDA $6F00,y         ; $07F41A   |
    CMP #$0010          ; $07F41D   |
    BNE CODE_07F497     ; $07F420   |
    LDA $7D38,y         ; $07F422   |
    BEQ CODE_07F497     ; $07F425   |
    TYX                 ; $07F427   |
    JSL $03B24B         ; $07F428   |
    LDX $12             ; $07F42C   |
    LDY $7A36,x         ; $07F42E   |
    LDA $F3F8,y         ; $07F431   |
    STA $00             ; $07F434   |
    LDA #$017F          ; $07F436   |
    JSL $03A364         ; $07F439   |
    BCC CODE_07F461     ; $07F43D   |
    LDA $18,x           ; $07F43F   |
    STA $7978,y         ; $07F441   |
    LDA $7220,x         ; $07F444   |
    STA $7220,y         ; $07F447   |
    LDA $7400,x         ; $07F44A   |
    STA $7400,y         ; $07F44D   |
    LDA $70E2,x         ; $07F450   |
    STA $70E2,y         ; $07F453   |
    LDA $7182,x         ; $07F456   |
    CLC                 ; $07F459   |
    ADC $00             ; $07F45A   |
    STA $7182,y         ; $07F45C   |
    BRA CODE_07F487     ; $07F45F   |

CODE_07F461:
    LDA #$01EF          ; $07F461   |
    JSL $008B21         ; $07F464   |
    LDA #$0005          ; $07F468   |
    STA $73C2,y         ; $07F46B   |
    LDA #$0002          ; $07F46E   |
    STA $7782,y         ; $07F471   |
    LDA $7CD6,x         ; $07F474   |
    STA $70A2,y         ; $07F477   |
    LDA $7182,x         ; $07F47A   |
    CLC                 ; $07F47D   |
    ADC $00             ; $07F47E   |
    CLC                 ; $07F480   |
    ADC #$0008          ; $07F481   |
    STA $7142,y         ; $07F484   |

CODE_07F487:
    LDX $12             ; $07F487   |
    SEP #$20            ; $07F489   |
    LDA #$FF            ; $07F48B   |
    STA $74A0,x         ; $07F48D   |
    REP #$20            ; $07F490   |
    PLA                 ; $07F492   |
    JMP CODE_07039F     ; $07F493   |

CODE_07F497:
    LDA $6FA0,x         ; $07F497   |
    AND #$0400          ; $07F49A   |
    BEQ CODE_07F4B3     ; $07F49D   |
    TXA                 ; $07F49F   |
    STA $3002           ; $07F4A0   |
    LDX #$09            ; $07F4A3   |
    LDA #$8F33          ; $07F4A5   |
    JSL $7EDE44         ; $07F4A8   | GSU init
    LDX $12             ; $07F4AC   |
    LDY $3002           ; $07F4AE   |
    BPL CODE_07F4B4     ; $07F4B1   |

CODE_07F4B3:
    RTS                 ; $07F4B3   |

CODE_07F4B4:
    LDA $7BB6,y         ; $07F4B4   |
    CLC                 ; $07F4B7   |
    ADC #$0006          ; $07F4B8   |
    STA $00             ; $07F4BB   |
    LDA $7CD6,x         ; $07F4BD   |
    SEC                 ; $07F4C0   |
    SBC $7CD6,y         ; $07F4C1   |
    BPL CODE_07F4CA     ; $07F4C4   |
    EOR #$FFFF          ; $07F4C6   |
    INC A               ; $07F4C9   |

CODE_07F4CA:
    CMP $00             ; $07F4CA   |
    BCS CODE_07F4B3     ; $07F4CC   |
    LDA $7BB8,y         ; $07F4CE   |
    CLC                 ; $07F4D1   |
    ADC #$0006          ; $07F4D2   |
    STA $00             ; $07F4D5   |
    LDA $7A36,x         ; $07F4D7   |
    TAX                 ; $07F4DA   |
    LDA $F3F8,x         ; $07F4DB   |
    LDX $12             ; $07F4DE   |
    CLC                 ; $07F4E0   |
    ADC $7182,x         ; $07F4E1   |
    CLC                 ; $07F4E4   |
    ADC #$0008          ; $07F4E5   |
    STA $04             ; $07F4E8   |
    SEC                 ; $07F4EA   |
    SBC $7CD8,y         ; $07F4EB   |
    BPL CODE_07F4F4     ; $07F4EE   |
    EOR #$FFFF          ; $07F4F0   |
    INC A               ; $07F4F3   |

CODE_07F4F4:
    CMP $00             ; $07F4F4   |
    BCS CODE_07F4B3     ; $07F4F6   |
    LDA $7542,y         ; $07F4F8   |
    CMP #$0040          ; $07F4FB   |
    BCC CODE_07F507     ; $07F4FE   |
    TYX                 ; $07F500   |
    JSL $03B24B         ; $07F501   |
    LDX $12             ; $07F505   |

CODE_07F507:
    LDA #$003B          ; $07F507   |\ play sound #$003B
    JSL $0085D2         ; $07F50A   |/
    LDA #$01EF          ; $07F50E   |
    JSL $008B21         ; $07F511   |
    LDA #$0005          ; $07F515   |
    STA $73C2,y         ; $07F518   |
    LDA #$0002          ; $07F51B   |
    STA $7782,y         ; $07F51E   |
    LDA $7CD6,x         ; $07F521   |
    STA $70A2,y         ; $07F524   |
    LDA $04             ; $07F527   |
    STA $7142,y         ; $07F529   |
    LDA $7A36,x         ; $07F52C   |
    TAX                 ; $07F52F   |
    LDA $F7A3,x         ; $07F530   |
    JSR ($F7BD,x)       ; $07F533   |

    PLA                 ; $07F536   |
    RTL                 ; $07F537   |

CODE_07F538:
    LDY $7D36,x         ; $07F538   |
    BPL CODE_07F57E     ; $07F53B   |
    LDY $7A36,x         ; $07F53D   |
    LDA $7182,x         ; $07F540   |
    CLC                 ; $07F543   |
    ADC $F3F8,y         ; $07F544   |
    CLC                 ; $07F547   |
    ADC #$0008          ; $07F548   |
    STA $00             ; $07F54B   |
    LDA #$003B          ; $07F54D   |\ play sound #$003B
    JSL $0085D2         ; $07F550   |/
    LDA #$01EF          ; $07F554   |
    JSL $008B21         ; $07F557   |
    LDA #$0005          ; $07F55B   |
    STA $73C2,y         ; $07F55E   |
    LDA #$0002          ; $07F561   |
    STA $7782,y         ; $07F564   |
    LDA $7CD6,x         ; $07F567   |
    STA $70A2,y         ; $07F56A   |
    LDA $00             ; $07F56D   |
    STA $7142,y         ; $07F56F   |
    LDY $7A36,x         ; $07F572   |
    TYX                 ; $07F575   |
    LDA $F7A3,x         ; $07F576   |
    JSR ($F7BD,x)       ; $07F579   |
    PLA                 ; $07F57C   |
    RTL                 ; $07F57D   |

CODE_07F57E:
    RTS                 ; $07F57E   |

DATA_07F57F:         db $38, $50, $68

CODE_07F582:
    SEP #$20            ; $07F582   |
    LDA $76,x           ; $07F584   |
    BPL CODE_07F592     ; $07F586   |
    LDA $19,x           ; $07F588   |
    BPL CODE_07F59C     ; $07F58A   |
    LDA $18,x           ; $07F58C   |
    STA $76,x           ; $07F58E   |
    BRA CODE_07F5A4     ; $07F590   |

CODE_07F592:
    LDA $19,x           ; $07F592   |
    BPL CODE_07F5A8     ; $07F594   |
    LDA $18,x           ; $07F596   |
    STA $19,x           ; $07F598   |
    BRA CODE_07F5A4     ; $07F59A   |

CODE_07F59C:
    LDA $19,x           ; $07F59C   |
    STA $76,x           ; $07F59E   |
    LDA $18,x           ; $07F5A0   |
    STA $19,x           ; $07F5A2   |

CODE_07F5A4:
    LDA #$FF            ; $07F5A4   |
    STA $18,x           ; $07F5A6   |

CODE_07F5A8:
    STZ $03             ; $07F5A8   |
    LDA $77,x           ; $07F5AA   |
    STA $02             ; $07F5AC   |
    DEC A               ; $07F5AE   |
    ASL A               ; $07F5AF   |
    TAY                 ; $07F5B0   |
    REP #$20            ; $07F5B1   |
    LDA $F38B,y         ; $07F5B3   |
    STA $00             ; $07F5B6   |
    TXA                 ; $07F5B8   |
    STA $3002           ; $07F5B9   |
    LDX #$09            ; $07F5BC   |
    LDA #$8F33          ; $07F5BE   |
    JSL $7EDE44         ; $07F5C1   | GSU init
    LDX $12             ; $07F5C5   |
    LDY $3002           ; $07F5C7   |
    BPL CODE_07F5CD     ; $07F5CA   |
    RTS                 ; $07F5CC   |

CODE_07F5CD:
    LDA $7BB6,y         ; $07F5CD   |
    CLC                 ; $07F5D0   |
    ADC #$0003          ; $07F5D1   |
    STA $0C             ; $07F5D4   |
    LDA $7BB8,y         ; $07F5D6   |
    CLC                 ; $07F5D9   |
    ADC #$0003          ; $07F5DA   |
    STA $0E             ; $07F5DD   |

CODE_07F5DF:
    LDA ($00)           ; $07F5DF   |
    AND #$00FF          ; $07F5E1   |
    BIT #$0080          ; $07F5E4   |
    BEQ CODE_07F5EC     ; $07F5E7   |
    ORA #$FF00          ; $07F5E9   |

CODE_07F5EC:
    CLC                 ; $07F5EC   |
    ADC $7182,x         ; $07F5ED   |
    CLC                 ; $07F5F0   |
    ADC #$0008          ; $07F5F1   |
    STA $04             ; $07F5F4   |
    DEC $00             ; $07F5F6   |
    LDA ($00)           ; $07F5F8   |
    AND #$00FF          ; $07F5FA   |
    BIT #$0080          ; $07F5FD   |
    BEQ CODE_07F605     ; $07F600   |
    ORA #$FF00          ; $07F602   |

CODE_07F605:
    CLC                 ; $07F605   |
    ADC $70E2,x         ; $07F606   |
    CLC                 ; $07F609   |
    ADC #$0008          ; $07F60A   |
    STA $06             ; $07F60D   |
    SEC                 ; $07F60F   |
    SBC $7CD6,y         ; $07F610   |
    BPL CODE_07F619     ; $07F613   |
    EOR #$FFFF          ; $07F615   |
    INC A               ; $07F618   |

CODE_07F619:
    CMP $0C             ; $07F619   |
    BCC CODE_07F620     ; $07F61B   |

CODE_07F61D:
    JMP CODE_07F6B3     ; $07F61D   |

CODE_07F620:
    LDA $04             ; $07F620   |
    SEC                 ; $07F622   |
    SBC $7CD8,y         ; $07F623   |
    BPL CODE_07F62C     ; $07F626   |
    EOR #$FFFF          ; $07F628   |
    INC A               ; $07F62B   |

CODE_07F62C:
    CMP $0E             ; $07F62C   |
    BCS CODE_07F61D     ; $07F62E   |
    LDA $7542,y         ; $07F630   |
    CMP #$0040          ; $07F633   |
    BCC CODE_07F63F     ; $07F636   |
    TYX                 ; $07F638   |
    JSL $03B24B         ; $07F639   |
    LDX $12             ; $07F63D   |

CODE_07F63F:
    LDA #$003B          ; $07F63F   |\ play sound #$003B
    JSL $0085D2         ; $07F642   |/
    SEP #$20            ; $07F646   |
    LDA #$FF            ; $07F648   |
    STA $74A0,x         ; $07F64A   |
    REP #$20            ; $07F64D   |
    LDA #$01EF          ; $07F64F   |
    JSL $008B21         ; $07F652   |
    LDA #$0005          ; $07F656   |
    STA $73C2,y         ; $07F659   |
    LDA #$0002          ; $07F65C   |
    STA $7782,y         ; $07F65F   |
    LDA $06             ; $07F662   |
    STA $70A2,y         ; $07F664   |
    LDA $04             ; $07F667   |
    STA $7142,y         ; $07F669   |
    LDA #$00C0          ; $07F66C   |
    STA $7222,x         ; $07F66F   |
    SEP #$20            ; $07F672   |
    DEC $77,x           ; $07F674   |
    REP #$20            ; $07F676   |
    BNE CODE_07F67F     ; $07F678   |
    JSR CODE_07F8C9     ; $07F67A   |
    BRA CODE_07F6B1     ; $07F67D   |

CODE_07F67F:
    SEP #$20            ; $07F67F   |
    LDY $77,x           ; $07F681   |
    DEY                 ; $07F683   |
    LDA $7041,x         ; $07F684   |
    AND #$07            ; $07F687   |
    ORA $F57F,y         ; $07F689   |
    STA $7041,x         ; $07F68C   |
    LDA #$FF            ; $07F68F   |
    LDY $02             ; $07F691   |
    CPY #$03            ; $07F693   |
    BNE CODE_07F6A5     ; $07F695   |
    STA $18,x           ; $07F697   |
    LDA $19,x           ; $07F699   |
    PHA                 ; $07F69B   |
    LDA $76,x           ; $07F69C   |
    STA $19,x           ; $07F69E   |
    PLA                 ; $07F6A0   |
    STA $76,x           ; $07F6A1   |
    BRA CODE_07F6AF     ; $07F6A3   |

CODE_07F6A5:
    CPY #$02            ; $07F6A5   |
    BNE CODE_07F6AD     ; $07F6A7   |
    STA $19,x           ; $07F6A9   |
    BRA CODE_07F6AF     ; $07F6AB   |

CODE_07F6AD:
    STA $76,x           ; $07F6AD   |

CODE_07F6AF:
    REP #$20            ; $07F6AF   |

CODE_07F6B1:
    PLA                 ; $07F6B1   |
    RTL                 ; $07F6B2   |

CODE_07F6B3:
    LDA $00             ; $07F6B3   |
    SEC                 ; $07F6B5   |
    SBC #$0005          ; $07F6B6   |
    STA $00             ; $07F6B9   |
    DEC $02             ; $07F6BB   |
    BEQ CODE_07F6C2     ; $07F6BD   |
    JMP CODE_07F5DF     ; $07F6BF   |

CODE_07F6C2:
    RTS                 ; $07F6C2   |

DATA_07F6C3:         dw $0008

DATA_07F6C5:         dw $0001, $000F

DATA_07F6C9:         dw $FFFC, $0014, $0008

DATA_07F6CF:         dw $FFEE

DATA_07F6D1:         dw $FFEF, $FFEF

DATA_07F6D5:         dw $FFF0, $FFF0, $FFEC

DATA_07F6DB:         dw $F6C3
DATA_07F6DD:         dw $F6C5
DATA_07F6DF:         dw $F6C9
DATA_07F6E1:         dw $F6CF
DATA_07F6E3:         dw $F6D1
DATA_07F6E5:         dw $F6D5

CODE_07F6E7:
    LDY $7D36,x         ; $07F6E7   |
    BPL CODE_07F745     ; $07F6EA   |
    LDY $77,x           ; $07F6EC   |
    DEY                 ; $07F6EE   |
    PHY                 ; $07F6EF   |
    TYA                 ; $07F6F0   |
    ASL A               ; $07F6F1   |
    TAY                 ; $07F6F2   |
    LDA $F6DB,y         ; $07F6F3   |
    STA $0C             ; $07F6F6   |
    LDA $F6E1,y         ; $07F6F8   |
    STA $0E             ; $07F6FB   |
    PLY                 ; $07F6FD   |

CODE_07F6FE:
    PHY                 ; $07F6FE   |
    ASL A               ; $07F6FF   |
    AND #$00FF          ; $07F700   |
    STA $04             ; $07F703   |
    TYA                 ; $07F705   |
    ASL A               ; $07F706   |
    TAY                 ; $07F707   |
    LDA $70E2,x         ; $07F708   |
    CLC                 ; $07F70B   |
    ADC ($0C),y         ; $07F70C   |
    STA $06             ; $07F70E   |
    LDA $7182,x         ; $07F710   |
    CLC                 ; $07F713   |
    ADC ($0E),y         ; $07F714   |
    STA $08             ; $07F716   |
    LDA #$003B          ; $07F718   |\ play sound #$003B
    JSL $0085D2         ; $07F71B   |/
    LDA #$01EF          ; $07F71F   |
    JSL $008B21         ; $07F722   |
    LDA #$0005          ; $07F726   |
    STA $73C2,y         ; $07F729   |
    LDA #$0002          ; $07F72C   |
    STA $7782,y         ; $07F72F   |
    LDA $06             ; $07F732   |
    STA $70A2,y         ; $07F734   |
    LDA $08             ; $07F737   |
    STA $7142,y         ; $07F739   |
    PLY                 ; $07F73C   |
    DEY                 ; $07F73D   |
    BPL CODE_07F6FE     ; $07F73E   |
    JSR CODE_07F8C9     ; $07F740   |
    PLA                 ; $07F743   |
    RTL                 ; $07F744   |

CODE_07F745:
    RTS                 ; $07F745   |

CODE_07F746:
    LDA $7680,x         ; $07F746   |
    CMP #$00F0          ; $07F749   |
    BCS CODE_07F7A2     ; $07F74C   |
    LDA $7CD6,x         ; $07F74E   |
    SEC                 ; $07F751   |
    SBC $611C           ; $07F752   |
    CLC                 ; $07F755   |
    ADC #$0004          ; $07F756   |
    CMP #$0008          ; $07F759   |
    BCS CODE_07F7A2     ; $07F75C   |
    LDA #$000E          ; $07F75E   |\ play sound #$000E
    JSL $0085D2         ; $07F761   |/
    LDY $7A36,x         ; $07F765   |
    LDA $F3F8,y         ; $07F768   |
    STA $00             ; $07F76B   |
    LDA #$017F          ; $07F76D   |
    JSL $03A364         ; $07F770   |
    BCC CODE_07F796     ; $07F774   |
    LDA $18,x           ; $07F776   |
    STA $7978,y         ; $07F778   |
    LDA $7220,x         ; $07F77B   |
    STA $7220,y         ; $07F77E   |
    LDA $7400,x         ; $07F781   |
    STA $7400,y         ; $07F784   |
    LDA $70E2,x         ; $07F787   |
    STA $70E2,y         ; $07F78A   |
    LDA $7182,x         ; $07F78D   |
    CLC                 ; $07F790   |
    ADC $00             ; $07F791   |
    STA $7182,y         ; $07F793   |

CODE_07F796:
    LDA $7A36,x         ; $07F796   |
    TAX                 ; $07F799   |
    LDA $F7A3,x         ; $07F79A   |
    JSR ($F7BD,x)       ; $07F79D   |
    PLA                 ; $07F7A0   |
    RTL                 ; $07F7A1   |

CODE_07F7A2:
    RTS                 ; $07F7A2   |

DATA_07F7A3:         dw $001E, $0163, $0060, $0020
DATA_07F7AB:         dw $0148, $0100, $0027, $0115
DATA_07F7B3:         dw $0007, $0009, $0005, $010E
DATA_07F7BB:         dw $0026

DATA_07F7BD:         dw $F7D7
DATA_07F7BF:         dw $F857
DATA_07F7C1:         dw $F808
DATA_07F7C3:         dw $F82C
DATA_07F7C5:         dw $F982
DATA_07F7C7:         dw $F974
DATA_07F7C9:         dw $F86D
DATA_07F7CB:         dw $F908
DATA_07F7CD:         dw $F8A6
DATA_07F7CF:         dw $F8A6
DATA_07F7D1:         dw $F8A6
DATA_07F7D3:         dw $F8C9
DATA_07F7D5:         dw $F9AD

    LDX $12             ; $07F7D7   |
    TXY                 ; $07F7D9   |
    JSL $03A377         ; $07F7DA   |
    SEP #$20            ; $07F7DE   |
    LDA #$FF            ; $07F7E0   |
    STA $74A0,x         ; $07F7E2   |
    REP #$20            ; $07F7E5   |
    LDA #$0004          ; $07F7E7   |
    STA $16,x           ; $07F7EA   |
    LDA $7042,x         ; $07F7EC   |
    ORA #$0002          ; $07F7EF   |
    STA $7042,x         ; $07F7F2   |
    INC A               ; $07F7F5   |
    STA $7902,x         ; $07F7F6   |
    LDA $6F00,x         ; $07F7F9   |
    CMP #$0010          ; $07F7FC   |
    BEQ CODE_07F807     ; $07F7FF   |
    LDA #$0002          ; $07F801   |
    STA $6F00,x         ; $07F804   |

CODE_07F807:
    RTS                 ; $07F807   |

    LDX $12             ; $07F808   |
    TXY                 ; $07F80A   |
    JSL $03A377         ; $07F80B   |
    SEP #$20            ; $07F80F   |
    LDA #$FF            ; $07F811   |
    STA $74A0,x         ; $07F813   |
    REP #$20            ; $07F816   |
    LDA #$0001          ; $07F818   |
    STA $78,x           ; $07F81B   |
    LDA $6F00,x         ; $07F81D   |
    CMP #$0010          ; $07F820   |
    BEQ CODE_07F82B     ; $07F823   |
    LDA #$0002          ; $07F825   |
    STA $6F00,x         ; $07F828   |

CODE_07F82B:
    RTS                 ; $07F82B   |

    LDX $12             ; $07F82C   |
    TXY                 ; $07F82E   |
    JSL $03A377         ; $07F82F   |
    SEP #$20            ; $07F833   |
    LDA #$FF            ; $07F835   |
    STA $74A0,x         ; $07F837   |
    REP #$20            ; $07F83A   |
    LDA #$000C          ; $07F83C   |
    STA $79D6,y         ; $07F83F   |
    LDA #$0017          ; $07F842   |
    STA $7402,y         ; $07F845   |
    LDA $6F00,x         ; $07F848   |
    CMP #$0010          ; $07F84B   |
    BEQ CODE_07F856     ; $07F84E   |
    LDA #$0002          ; $07F850   |
    STA $6F00,x         ; $07F853   |

CODE_07F856:
    RTS                 ; $07F856   |

    LDX $12             ; $07F857   |
    TXY                 ; $07F859   |
    JSL $03A377         ; $07F85A   |
    LDA $6F00,x         ; $07F85E   |
    CMP #$0010          ; $07F861   |
    BEQ CODE_07F86C     ; $07F864   |
    LDA #$0002          ; $07F866   |
    STA $6F00,x         ; $07F869   |

CODE_07F86C:
    RTS                 ; $07F86C   |

    LDX $12             ; $07F86D   |
    PHA                 ; $07F86F   |
    LDA $7A38,x         ; $07F870   |
    PHA                 ; $07F873   |
    AND #$FF00          ; $07F874   |
    LSR A               ; $07F877   |
    LSR A               ; $07F878   |
    LSR A               ; $07F879   |
    LSR A               ; $07F87A   |
    STA $00             ; $07F87B   |
    PLA                 ; $07F87D   |
    AND #$00FF          ; $07F87E   |
    ASL A               ; $07F881   |
    ASL A               ; $07F882   |
    ASL A               ; $07F883   |
    ASL A               ; $07F884   |
    STA $02             ; $07F885   |
    TXY                 ; $07F887   |
    PLA                 ; $07F888   |
    JSL $03A377         ; $07F889   |
    LDA $00             ; $07F88D   |
    STA $7900,x         ; $07F88F   |
    LDA $02             ; $07F892   |
    STA $7902,x         ; $07F894   |
    LDA $6F00,x         ; $07F897   |
    CMP #$0010          ; $07F89A   |
    BEQ CODE_07F8A5     ; $07F89D   |
    LDA #$0010          ; $07F89F   |
    STA $6F00,x         ; $07F8A2   |

CODE_07F8A5:
    RTS                 ; $07F8A5   |

    LDX $12             ; $07F8A6   |
    TXY                 ; $07F8A8   |
    JSL $03A377         ; $07F8A9   |
    SEP #$20            ; $07F8AD   |
    LDA #$FF            ; $07F8AF   |
    STA $74A0,x         ; $07F8B1   |
    REP #$20            ; $07F8B4   |
    JSL $048066         ; $07F8B6   |
    LDA $6F00,x         ; $07F8BA   |
    CMP #$0010          ; $07F8BD   |
    BEQ CODE_07F8C8     ; $07F8C0   |
    LDA #$0002          ; $07F8C2   |
    STA $6F00,x         ; $07F8C5   |

CODE_07F8C8:
    RTS                 ; $07F8C8   |

CODE_07F8C9:
    LDX $12             ; $07F8C9   |
    JSL $03AEFD         ; $07F8CB   |
    TXY                 ; $07F8CF   |
    LDA #$010E          ; $07F8D0   |
    JSL $03A377         ; $07F8D3   |
    SEP #$20            ; $07F8D7   |
    LDA #$FF            ; $07F8D9   |
    STA $74A0,x         ; $07F8DB   |
    REP #$20            ; $07F8DE   |
    LDA $7182,x         ; $07F8E0   |
    CLC                 ; $07F8E3   |
    ADC #$0008          ; $07F8E4   |
    STA $7182,x         ; $07F8E7   |
    LDA #$0001          ; $07F8EA   |
    STA $16,x           ; $07F8ED   |
    PHB                 ; $07F8EF   |
    LDY #$0D            ; $07F8F0   |
    PHY                 ; $07F8F2   |
    PLB                 ; $07F8F3   |
    JSL $0D8E60         ; $07F8F4   |
    PLB                 ; $07F8F8   |
    LDA #$0010          ; $07F8F9   |
    STA $6F00,x         ; $07F8FC   |
    RTS                 ; $07F8FF   |

DATA_07F900:         dw $0100, $0080, $FF00, $FE80

    LDX $12             ; $07F908   |
    TXY                 ; $07F90A   |
    JSL $03A377         ; $07F90B   |
    JSL $04C968         ; $07F90F   |
    SEP #$20            ; $07F913   |
    LDA #$FF            ; $07F915   |
    STA $74A0,x         ; $07F917   |
    REP #$20            ; $07F91A   |
    LDA #$0018          ; $07F91C   |\ play sound #$0018
    JSL $0085D2         ; $07F91F   |/
    LDA $6F00,x         ; $07F923   |
    CMP #$0010          ; $07F926   |
    BEQ CODE_07F931     ; $07F929   |
    LDA #$0002          ; $07F92B   |
    STA $6F00,x         ; $07F92E   |

CODE_07F931:
    LDA #$0006          ; $07F931   |
    STA $00             ; $07F934   |

CODE_07F936:
    JSL $008408         ; $07F936   |
    LDY $00             ; $07F93A   |
    LDA $F900,y         ; $07F93C   |
    STA $02             ; $07F93F   |
    LDA #$0115          ; $07F941   |
    JSL $03A34C         ; $07F944   |
    BCC CODE_07F973     ; $07F948   |
    LDA $70E2,x         ; $07F94A   |
    STA $70E2,y         ; $07F94D   |
    LDA $7182,x         ; $07F950   |
    STA $7182,y         ; $07F953   |
    LDA $10             ; $07F956   |
    AND #$00FF          ; $07F958   |
    CLC                 ; $07F95B   |
    ADC $02             ; $07F95C   |
    STA $7220,y         ; $07F95E   |
    LDA $10             ; $07F961   |
    AND #$01FF          ; $07F963   |
    EOR #$FFFF          ; $07F966   |
    INC A               ; $07F969   |
    STA $7222,y         ; $07F96A   |
    DEC $00             ; $07F96D   |
    DEC $00             ; $07F96F   |
    BPL CODE_07F936     ; $07F971   |

CODE_07F973:
    RTS                 ; $07F973   |

CODE_07F974:
    LDX $12             ; $07F974   |
    JSL $03A496         ; $07F976   |
    JSR CODE_07FB0A     ; $07F97A   |
    JSL $03A32E         ; $07F97D   |
    RTS                 ; $07F981   |

    LDX $12             ; $07F982   |
    PHA                 ; $07F984   |
    JSL $03AEFD         ; $07F985   |
    PLA                 ; $07F989   |
    TXY                 ; $07F98A   |
    JSL $03A377         ; $07F98B   |
    LDA $7182,x         ; $07F98F   |
    CLC                 ; $07F992   |
    ADC #$0010          ; $07F993   |
    ORA #$0001          ; $07F996   |
    STA $7182,x         ; $07F999   |
    PHB                 ; $07F99C   |
    LDY #$05            ; $07F99D   |
    PHY                 ; $07F99F   |
    PLB                 ; $07F9A0   |
    JSL $0582B5         ; $07F9A1   |
    PLB                 ; $07F9A5   |
    LDA #$0010          ; $07F9A6   |
    STA $6F00,x         ; $07F9A9   |
    RTS                 ; $07F9AC   |

    LDX $12             ; $07F9AD   |
    TXY                 ; $07F9AF   |
    JSL $03A377         ; $07F9B0   |
    LDA #$0040          ; $07F9B4   |
    STA $7542,x         ; $07F9B7   |
    LDA $6F00,x         ; $07F9BA   |
    CMP #$0010          ; $07F9BD   |
    BEQ CODE_07F9C8     ; $07F9C0   |
    LDA #$0002          ; $07F9C2   |
    STA $6F00,x         ; $07F9C5   |

CODE_07F9C8:
    RTS                 ; $07F9C8   |

CODE_07F9C9:
    LDA $6F00,x         ; $07F9C9   |
    CMP #$0008          ; $07F9CC   |
    BEQ CODE_07F9D2     ; $07F9CF   |
    RTS                 ; $07F9D1   |

CODE_07F9D2:
    LDA $7A36,x         ; $07F9D2   |
    TAX                 ; $07F9D5   |
    LDA $F7A3,x         ; $07F9D6   |
    JMP ($F9DC,x)       ; $07F9D9   |

DATA_07F9DC:         dw $F9F9
DATA_07F9DE:         dw $FA2C
DATA_07F9E0:         dw $FA2C
DATA_07F9E2:         dw $F9F6
DATA_07F9E4:         dw $F9F6
DATA_07F9E6:         dw $FABE
DATA_07F9E8:         dw $F9F6
DATA_07F9EA:         dw $FA6F
DATA_07F9EC:         dw $FA2C
DATA_07F9EE:         dw $FA2C
DATA_07F9F0:         dw $FA2C
DATA_07F9F2:         dw $F9F6
DATA_07F9F4:         dw $FA16

    LDX $12             ; $07F9F6   |
    RTS                 ; $07F9F8   |

    PHA                 ; $07F9F9   |
    TXA                 ; $07F9FA   |
    ASL A               ; $07F9FB   |
    TAX                 ; $07F9FC   |
    LDY $12             ; $07F9FD   |
    PLA                 ; $07F9FF   |
    JSL $03A377         ; $07FA00   |
    TXY                 ; $07FA04   |
    LDX $12             ; $07FA05   |
    LDA $7042,x         ; $07FA07   |
    ORA #$0002          ; $07FA0A   |
    STA $7042,x         ; $07FA0D   |
    INC A               ; $07FA10   |
    STA $7902,x         ; $07FA11   |
    BRA CODE_07FA3A     ; $07FA14   |

    PHA                 ; $07FA16   |
    TXA                 ; $07FA17   |
    ASL A               ; $07FA18   |
    TAX                 ; $07FA19   |
    LDY $12             ; $07FA1A   |
    PLA                 ; $07FA1C   |
    JSL $03A377         ; $07FA1D   |
    TXY                 ; $07FA21   |
    LDX $12             ; $07FA22   |
    LDA #$0040          ; $07FA24   |
    STA $7542,x         ; $07FA27   |
    BRA CODE_07FA3A     ; $07FA2A   |

    PHA                 ; $07FA2C   |
    TXA                 ; $07FA2D   |
    ASL A               ; $07FA2E   |
    TAX                 ; $07FA2F   |
    LDY $12             ; $07FA30   |
    PLA                 ; $07FA32   |
    JSL $03A377         ; $07FA33   |
    TXY                 ; $07FA37   |
    LDX $12             ; $07FA38   |

CODE_07FA3A:
    SEP #$20            ; $07FA3A   |
    LDA #$FF            ; $07FA3C   |
    STA $74A0,x         ; $07FA3E   |
    REP #$20            ; $07FA41   |
    LDA $7182,x         ; $07FA43   |
    CLC                 ; $07FA46   |
    ADC $F3F8,y         ; $07FA47   |
    CLC                 ; $07FA4A   |
    ADC #$0008          ; $07FA4B   |
    STA $00             ; $07FA4E   |
    LDA #$01EF          ; $07FA50   |
    JSL $008B21         ; $07FA53   |
    LDA #$0005          ; $07FA57   |
    STA $73C2,y         ; $07FA5A   |
    LDA #$0002          ; $07FA5D   |
    STA $7782,y         ; $07FA60   |
    LDA $7CD6,x         ; $07FA63   |
    STA $70A2,y         ; $07FA66   |
    LDA $00             ; $07FA69   |
    STA $7142,y         ; $07FA6B   |
    RTS                 ; $07FA6E   |

    PHA                 ; $07FA6F   |
    TXA                 ; $07FA70   |
    ASL A               ; $07FA71   |
    TAX                 ; $07FA72   |
    LDY $12             ; $07FA73   |
    PLA                 ; $07FA75   |
    JSL $03A377         ; $07FA76   |
    TXY                 ; $07FA7A   |
    LDX $12             ; $07FA7B   |
    SEP #$20            ; $07FA7D   |
    LDA #$FF            ; $07FA7F   |
    STA $74A0,x         ; $07FA81   |
    REP #$20            ; $07FA84   |
    LDA #$0018          ; $07FA86   |\ play sound #$0018
    JSL $0085D2         ; $07FA89   |/
    STZ $6168           ; $07FA8D   |
    LDA $7182,x         ; $07FA90   |
    CLC                 ; $07FA93   |
    ADC $F3F8,y         ; $07FA94   |
    CLC                 ; $07FA97   |
    ADC #$0008          ; $07FA98   |
    STA $00             ; $07FA9B   |
    LDA #$01EF          ; $07FA9D   |
    JSL $008B21         ; $07FAA0   |
    LDA #$0005          ; $07FAA4   |
    STA $73C2,y         ; $07FAA7   |
    LDA #$0002          ; $07FAAA   |
    STA $7782,y         ; $07FAAD   |
    LDA $7CD6,x         ; $07FAB0   |
    STA $70A2,y         ; $07FAB3   |
    LDA $00             ; $07FAB6   |
    STA $7142,y         ; $07FAB8   |
    JMP CODE_07F931     ; $07FABB   |

    LDA #$0018          ; $07FABE   |\ play sound #$0018
    JSL $0085D2         ; $07FAC1   |/
    TXA                 ; $07FAC5   |
    ASL A               ; $07FAC6   |
    TAY                 ; $07FAC7   |
    LDX $12             ; $07FAC8   |
    SEP #$20            ; $07FACA   |
    LDA #$FF            ; $07FACC   |
    STA $74A0,x         ; $07FACE   |
    REP #$20            ; $07FAD1   |
    STZ $6162           ; $07FAD3   |
    STZ $6168           ; $07FAD6   |
    LDA $7182,x         ; $07FAD9   |
    CLC                 ; $07FADC   |
    ADC $F3F8,y         ; $07FADD   |
    CLC                 ; $07FAE0   |
    ADC #$0008          ; $07FAE1   |
    STA $00             ; $07FAE4   |
    LDA #$01EF          ; $07FAE6   |
    JSL $008B21         ; $07FAE9   |
    LDA #$0005          ; $07FAED   |
    STA $73C2,y         ; $07FAF0   |
    LDA #$0002          ; $07FAF3   |
    STA $7782,y         ; $07FAF6   |
    LDA $7CD6,x         ; $07FAF9   |
    STA $70A2,y         ; $07FAFC   |
    LDA $00             ; $07FAFF   |
    STA $7142,y         ; $07FB01   |
    JSR CODE_07FB0A     ; $07FB04   |
    JMP CODE_07F974     ; $07FB07   |

CODE_07FB0A:
    LDA $7A38,x         ; $07FB0A   |
    PHA                 ; $07FB0D   |
    AND #$FF00          ; $07FB0E   |
    LSR A               ; $07FB11   |
    LSR A               ; $07FB12   |
    LSR A               ; $07FB13   |
    LSR A               ; $07FB14   |
    STA $04             ; $07FB15   |
    PLA                 ; $07FB17   |
    AND #$00FF          ; $07FB18   |
    ASL A               ; $07FB1B   |
    ASL A               ; $07FB1C   |
    ASL A               ; $07FB1D   |
    ASL A               ; $07FB1E   |
    JSL $03D3F3         ; $07FB1F   |
    RTS                 ; $07FB23   |

.init_baron_von_zeppelin
    LDA $7400,x         ; $07FB24   |
    TAY                 ; $07FB27   |
    LDA $F110,y         ; $07FB28   |
    STA $7220,x         ; $07FB2B   |
    SEP #$20            ; $07FB2E   |
    LDA $10             ; $07FB30   |
    AND #$03            ; $07FB32   |
    TAY                 ; $07FB34   |
    LDA $F10C,y         ; $07FB35   |
    STA $18,x           ; $07FB38   |
    REP #$20            ; $07FB3A   |
    RTL                 ; $07FB3C   |

.main_baron_von_zeppelin
    STZ $3008           ; $07FB3D   |
    LDX #$08            ; $07FB40   |
    LDA #$95B9          ; $07FB42   |
    JSL $7EDE44         ; $07FB45   | GSU init
    LDX $12             ; $07FB49   |
    JSL $03AF23         ; $07FB4B   |
    LDA $16,x           ; $07FB4F   |
    TAX                 ; $07FB51   |
    JMP ($FB55,x)       ; $07FB52   |

DATA_07FB55:         dw $FB59
DATA_07FB57:         dw $FB5F

    LDX $12             ; $07FB59   |
    JSR CODE_07FB8B     ; $07FB5B   |
    RTL                 ; $07FB5E   |

    LDX $12             ; $07FB5F   |
    JSR CODE_07F3DB     ; $07FB61   |
    LDA $611C           ; $07FB64   |
    SEC                 ; $07FB67   |
    SBC #$0008          ; $07FB68   |
    STA $70E2,x         ; $07FB6B   |
    LDA $7182,x         ; $07FB6E   |
    CLC                 ; $07FB71   |
    ADC #$0016          ; $07FB72   |
    CLC                 ; $07FB75   |
    ADC $78,x           ; $07FB76   |
    STA $6090           ; $07FB78   |
    LDA $60C4           ; $07FB7B   |
    EOR #$0002          ; $07FB7E   |
    STA $7400,x         ; $07FB81   |
    LDA $78,x           ; $07FB84   |
    BEQ CODE_07FB8A     ; $07FB86   |
    DEC $78,x           ; $07FB88   |

CODE_07FB8A:
    RTL                 ; $07FB8A   |

CODE_07FB8B:
    LDY $7D36,x         ; $07FB8B   |
    DEY                 ; $07FB8E   |
    BEQ CODE_07FBD2     ; $07FB8F   |
    BMI CODE_07FBD2     ; $07FB91   |
    LDA $6F00,y         ; $07FB93   |
    CMP #$0010          ; $07FB96   |
    BNE CODE_07FBD2     ; $07FB99   |
    LDA $7D38,y         ; $07FB9B   |
    BEQ CODE_07FBD2     ; $07FB9E   |
    TYX                 ; $07FBA0   |
    JSL $03B24B         ; $07FBA1   |
    LDX $12             ; $07FBA5   |
    LDA #$003B          ; $07FBA7   |\
    JSL $0085D2         ; $07FBAA   |/ play sound #$003B
    LDA #$01EF          ; $07FBAE   |
    JSL $008B21         ; $07FBB1   |
    LDA #$0005          ; $07FBB5   |
    STA $73C2,y         ; $07FBB8   |
    LDA #$0002          ; $07FBBB   |
    STA $7782,y         ; $07FBBE   |
    LDA $7CD6,x         ; $07FBC1   |
    STA $70A2,y         ; $07FBC4   |
    LDA $7CD8,x         ; $07FBC7   |
    STA $7142,y         ; $07FBCA   |
    PLA                 ; $07FBCD   |
    JMP CODE_0703A3     ; $07FBCE   |

CODE_07FBD2:
    RTS                 ; $07FBD2   |

    LDA $70E2,x         ; $07FBD3   |
    CLC                 ; $07FBD6   |
    ADC #$0008          ; $07FBD7   |
    SEC                 ; $07FBDA   |
    SBC $611C           ; $07FBDB   |
    BNE CODE_07FC0C     ; $07FBDE   |
    LDA $6122           ; $07FBE0   |
    CLC                 ; $07FBE3   |
    ADC #$0004          ; $07FBE4   |
    STA $00             ; $07FBE7   |
    LDA $7182,x         ; $07FBE9   |
    CLC                 ; $07FBEC   |
    ADC #$0016          ; $07FBED   |
    SEC                 ; $07FBF0   |
    SBC $611E           ; $07FBF1   |
    CLC                 ; $07FBF4   |
    ADC $00             ; $07FBF5   |
    CMP $00             ; $07FBF7   |
    BCS CODE_07FC0C     ; $07FBF9   |
    STA $78,x           ; $07FBFB   |
    STZ $7220,x         ; $07FBFD   |
    LDA #$0080          ; $07FC00   |
    STA $7222,x         ; $07FC03   |
    INC $16,x           ; $07FC06   |
    INC $16,x           ; $07FC08   |
    PLA                 ; $07FC0A   |
    RTL                 ; $07FC0B   |

CODE_07FC0C:
    RTS                 ; $07FC0C   |

    LDA $7400,x         ; $07FC0D   |
    LSR A               ; $07FC10   |
    LSR A               ; $07FC11   |
    ROR A               ; $07FC12   |
    STA $00             ; $07FC13   |
    LDA $7CD6,x         ; $07FC15   |
    SEC                 ; $07FC18   |
    SBC $7CD6,y         ; $07FC19   |
    EOR $00             ; $07FC1C   |
    RTL                 ; $07FC1E   |

    LDA $7CD6,x         ; $07FC1F   |
    SEC                 ; $07FC22   |
    SBC $7CD6,y         ; $07FC23   |
    EOR $7220,y         ; $07FC26   |
    RTL                 ; $07FC29   |

    LDY $7D36,x         ; $07FC2A   |
    BPL CODE_07FC49     ; $07FC2D   |

    LDA $7C18,x         ; $07FC2F   |
    SEC                 ; $07FC32   |
    SBC $6122           ; $07FC33   |
    SEC                 ; $07FC36   |
    SBC $7BB8,x         ; $07FC37   |
    CMP #$FFF6          ; $07FC3A   |
    BCC CODE_07FC4A     ; $07FC3D   |
    LDA $60AA           ; $07FC3F   |
    BMI CODE_07FC46     ; $07FC42   |
    SEC                 ; $07FC44   |
    RTL                 ; $07FC45   |

CODE_07FC46:
    LDA #$0000          ; $07FC46   |

CODE_07FC49:
    CLC                 ; $07FC49   |

CODE_07FC4A:
    RTL                 ; $07FC4A   |

CODE_07FC4B:
    LDY $7D36,x         ; $07FC4B   |
    BPL CODE_07FC54     ; $07FC4E   |
    JSL $03A858         ; $07FC50   |

CODE_07FC54:
    RTL                 ; $07FC54   |

    LDA $7182,x         ; $07FC55   |
    CMP #$0800          ; $07FC58   |
    BMI CODE_07FC63     ; $07FC5B   |
    PLY                 ; $07FC5D   |
    PLA                 ; $07FC5E   |
    JMP CODE_0703A3     ; $07FC5F   |

CODE_07FC63:
    RTL                 ; $07FC63   |

    LDA $7680,x         ; $07FC64   |
    CLC                 ; $07FC67   |
    ADC #$0040          ; $07FC68   |
    CMP #$0180          ; $07FC6B   |
    BCS CODE_07FC7A     ; $07FC6E   |
    LDA $7682,x         ; $07FC70   |
    CLC                 ; $07FC73   |
    ADC #$0040          ; $07FC74   |
    CMP #$0180          ; $07FC77   |

CODE_07FC7A:
    RTL                 ; $07FC7A   |

    LDA $7860,x         ; $07FC7B   |
    BIT #$0002          ; $07FC7E   |
    BNE CODE_07FCAA     ; $07FC81   |
    LDA $70E2,x         ; $07FC83   |
    SEC                 ; $07FC86   |
    SBC $72C0,x         ; $07FC87   |
    STA $70E2,x         ; $07FC8A   |
    LDA $7182,x         ; $07FC8D   |
    SEC                 ; $07FC90   |
    SBC $72C2,x         ; $07FC91   |
    STA $7182,x         ; $07FC94   |
    LDA $7220,x         ; $07FC97   |
    EOR #$FFFF          ; $07FC9A   |
    INC A               ; $07FC9D   |
    STA $7220,x         ; $07FC9E   |
    LDA $7400,x         ; $07FCA1   |
    EOR #$0002          ; $07FCA4   |
    STA $7400,x         ; $07FCA7   |

CODE_07FCAA:
    RTL                 ; $07FCAA   |

DATA_07FCAB:         dw $0000, $0002, $0004, $0008

    LDA #$0010          ; $07FCB3   |
    BRA CODE_07FCBB     ; $07FCB6   |
    LDA #$0001          ; $07FCB8   |

CODE_07FCBB:
    STA $08             ; $07FCBB   |
    LDA $14             ; $07FCBD   |
    BIT #$0007          ; $07FCBF   |
    BNE CODE_07FCCD     ; $07FCC2   |
    LDA #$0050          ; $07FCC4   |\ play sound #$0050
    JSL $0085D2         ; $07FCC7   |/
    LDA $14             ; $07FCCB   |

CODE_07FCCD:
    AND #$0003          ; $07FCCD   |
    ASL A               ; $07FCD0   |
    TAY                 ; $07FCD1   |
    LDA $FCAB,y         ; $07FCD2   |
    STA $06             ; $07FCD5   |
    LDA #$01E2          ; $07FCD7   |
    JSL $008B21         ; $07FCDA   |
    LDA $00             ; $07FCDE   |
    STA $70A2,y         ; $07FCE0   |
    LDA $02             ; $07FCE3   |
    STA $7142,y         ; $07FCE5   |
    LDA $08             ; $07FCE8   |
    STA $7782,y         ; $07FCEA   |
    LDA $7002,y         ; $07FCED   |
    ORA $06             ; $07FCF0   |
    STA $7002,y         ; $07FCF2   |
    LDA $04             ; $07FCF5   |
    STA $7E4C,y         ; $07FCF7   |
    RTL                 ; $07FCFA   |

    LDA $7CD6,x         ; $07FCFB   |
    SEC                 ; $07FCFE   |
    SBC $611C           ; $07FCFF   |
    CLC                 ; $07FD02   |
    ADC $00             ; $07FD03   |
    CMP $02             ; $07FD05   |
    BCS CODE_07FD15     ; $07FD07   |
    LDA $7CD8,x         ; $07FD09   |
    SEC                 ; $07FD0C   |
    SBC $611E           ; $07FD0D   |
    CLC                 ; $07FD10   |
    ADC $04             ; $07FD11   |
    CMP $06             ; $07FD13   |

CODE_07FD15:
    RTL                 ; $07FD15   |

CODE_07FD16:
    LDA #$01E9          ; $07FD16   |
    JSL $008B21         ; $07FD19   |
    LDA $00             ; $07FD1D   |
    STA $70A2,y         ; $07FD1F   |
    LDA $02             ; $07FD22   |
    STA $7142,y         ; $07FD24   |
    LDA #$0002          ; $07FD27   |
    STA $7782,y         ; $07FD2A   |
    LDA #$0022          ; $07FD2D   |
    STA $7002,y         ; $07FD30   |
    RTS                 ; $07FD33   |

CODE_07FD34:
    LDA #$0211          ; $07FD34   |
    BRA CODE_07FD3C     ; $07FD37   |

CODE_07FD39:
    LDA #$0210          ; $07FD39   |

CODE_07FD3C:
    JSL $008B21         ; $07FD3C   |
    LDA $7002,y         ; $07FD40   |
    AND #$FFF1          ; $07FD43   |
    ORA $00             ; $07FD46   |
    STA $7002,y         ; $07FD48   |
    LDA $70E2,x         ; $07FD4B   |
    CLC                 ; $07FD4E   |
    ADC #$0008          ; $07FD4F   |
    STA $70A2,y         ; $07FD52   |
    LDA $7182,x         ; $07FD55   |
    STA $7142,y         ; $07FD58   |
    LDA #$0001          ; $07FD5B   |
    STA $7782,y         ; $07FD5E   |
    LDA #$0017          ; $07FD61   |
    STA $73C2,y         ; $07FD64   |
    RTS                 ; $07FD67   |

    JSR CODE_07FD39     ; $07FD68   |
    RTL                 ; $07FD6B   |

    LDA $7CD6,x         ; $07FD6C   |
    SEC                 ; $07FD6F   |
    SBC $611C           ; $07FD70   |
    BPL CODE_07FD79     ; $07FD73   |
    EOR #$FFFF          ; $07FD75   |
    INC A               ; $07FD78   |

CODE_07FD79:
    SEC                 ; $07FD79   |
    SBC $7BB6,x         ; $07FD7A   |
    SEC                 ; $07FD7D   |
    SBC $6120           ; $07FD7E   |
    BPL CODE_07FDB5     ; $07FD81   |
    LDA $7CD8,x         ; $07FD83   |
    SEC                 ; $07FD86   |
    SBC $611E           ; $07FD87   |
    STA $00             ; $07FD8A   |
    BPL CODE_07FD92     ; $07FD8C   |
    EOR #$FFFF          ; $07FD8E   |
    INC A               ; $07FD91   |

CODE_07FD92:
    SEC                 ; $07FD92   |
    SBC $7BB8,x         ; $07FD93   |
    SEC                 ; $07FD96   |
    SBC $6122           ; $07FD97   |
    BPL CODE_07FDB5     ; $07FD9A   |
    LDA $00             ; $07FD9C   |
    SEC                 ; $07FD9E   |
    SBC $7BB8,x         ; $07FD9F   |
    SEC                 ; $07FDA2   |
    SBC $6122           ; $07FDA3   |
    CMP #$FFF8          ; $07FDA6   |
    BCS CODE_07FDB0     ; $07FDA9   |
    LDA #$0001          ; $07FDAB   |
    BRA CODE_07FDB8     ; $07FDAE   |

CODE_07FDB0:
    LDA $60AA           ; $07FDB0   |
    BPL CODE_07FDBA     ; $07FDB3   |

CODE_07FDB5:
    LDA #$0000          ; $07FDB5   |

CODE_07FDB8:
    CLC                 ; $07FDB8   |
    RTL                 ; $07FDB9   |

CODE_07FDBA:
    LDA #$0001          ; $07FDBA   |
    SEC                 ; $07FDBD   |
    RTL                 ; $07FDBE   |

.init_cork
    LDA $70E2,x         ; $07FDBF   |
    CLC                 ; $07FDC2   |
    ADC #$0008          ; $07FDC3   |
    STA $70E2,x         ; $07FDC6   |
    LDA $7182,x         ; $07FDC9   |
    SEC                 ; $07FDCC   |
    SBC #$0007          ; $07FDCD   |
    STA $7182,x         ; $07FDD0   |
    JSL $03D3F8         ; $07FDD3   |
    BEQ CODE_07FDE0     ; $07FDD7   |
    JSR CODE_07FF25     ; $07FDD9   |
    JMP CODE_0703A3     ; $07FDDC   |

CODE_07FDE0:
    RTL                 ; $07FDE0   |

DATA_07FDE1:         db $10, $10, $20

.main_cork
    JSL $03AF23         ; $07FDE4   |
    JSL $03D127         ; $07FDE8   |
    JSL $03D291         ; $07FDEC   |
    LDA $76,x           ; $07FDF0   |
    BEQ CODE_07FE56     ; $07FDF2   |
    LDA $7A96,x         ; $07FDF4   |
    BNE CODE_07FE55     ; $07FDF7   |
    LDA $76,x           ; $07FDF9   |
    CMP #$0003          ; $07FDFB   |
    BEQ CODE_07FE20     ; $07FDFE   |
    BCS CODE_07FE55     ; $07FE00   |
    TAY                 ; $07FE02   |
    LDA $7182,x         ; $07FE03   |
    SEC                 ; $07FE06   |
    SBC #$0002          ; $07FE07   |
    STA $7182,x         ; $07FE0A   |
    LDA $FDE1,y         ; $07FE0D   |
    AND #$00FF          ; $07FE10   |
    STA $7A96,x         ; $07FE13   |
    LDA #$0040          ; $07FE16   |\ play sound #$0040
    JSL $0085D2         ; $07FE19   |/
    INC $76,x           ; $07FE1D   |
    RTL                 ; $07FE1F   |

CODE_07FE20:
    STZ $61AE           ; $07FE20   |
    LDA #$F800          ; $07FE23   |
    STA $7222,x         ; $07FE26   |
    LDA #$021A          ; $07FE29   |
    JSL $008B21         ; $07FE2C   |
    LDA $70E2,x         ; $07FE30   |
    STA $70A2,y         ; $07FE33   |
    LDA $7182,x         ; $07FE36   |
    CLC                 ; $07FE39   |
    ADC #$0010          ; $07FE3A   |
    STA $7142,y         ; $07FE3D   |
    LDA #$0001          ; $07FE40   |
    STA $7782,y         ; $07FE43   |
    LDA #$000B          ; $07FE46   |
    STA $7E4C,y         ; $07FE49   |
    LDA #$003B          ; $07FE4C   |\ play sound #$003B
    JSL $0085D2         ; $07FE4F   |/
    INC $76,x           ; $07FE53   |

CODE_07FE55:
    RTL                 ; $07FE55   |

CODE_07FE56:
    JSR CODE_07FEFF     ; $07FE56   |
    BNE CODE_07FE73     ; $07FE59   |
    LDY $7D36,x         ; $07FE5B   |
    BMI CODE_07FE63     ; $07FE5E   |
    JMP CODE_07FEE5     ; $07FE60   |

CODE_07FE63:
    LDA $7C18,x         ; $07FE63   |
    SEC                 ; $07FE66   |
    SBC $6122           ; $07FE67   |
    SEC                 ; $07FE6A   |
    SBC $7BB8,x         ; $07FE6B   |
    CMP #$FFF6          ; $07FE6E   |
    BCS CODE_07FECF     ; $07FE71   |

CODE_07FE73:
    LDY $7DF6           ; $07FE73   |
    BEQ CODE_07FEE4     ; $07FE76   |
    LDA $7DF6,y         ; $07FE78   |
    TAY                 ; $07FE7B   |
    LDA $7360,y         ; $07FE7C   |
    CMP #$0027          ; $07FE7F   |
    BNE CODE_07FEE4     ; $07FE82   |
    TYX                 ; $07FE84   |
    JSL $03BF87         ; $07FE85   |
    JSL $03A31E         ; $07FE89   |
    LDX $12             ; $07FE8D   |
    JSL $03D3EB         ; $07FE8F   |
    JSR CODE_07FF25     ; $07FE93   |
    LDA $7182,x         ; $07FE96   |
    SEC                 ; $07FE99   |
    SBC #$0002          ; $07FE9A   |
    STA $7182,x         ; $07FE9D   |
    LDA #$0008          ; $07FEA0   |
    STA $7A96,x         ; $07FEA3   |
    LDA #$01CD          ; $07FEA6   |
    JSL $008B21         ; $07FEA9   |
    LDA $70E2,x         ; $07FEAD   |
    STA $70A2,y         ; $07FEB0   |
    LDA $7182,x         ; $07FEB3   |
    STA $7142,y         ; $07FEB6   |
    LDA #$000B          ; $07FEB9   |
    STA $7E4C,y         ; $07FEBC   |
    LDA #$0004          ; $07FEBF   |
    STA $7782,y         ; $07FEC2   |
    LDA #$0040          ; $07FEC5   |\ play sound #$0040
    JSL $0085D2         ; $07FEC8   |/
    INC $76,x           ; $07FECC   |
    RTL                 ; $07FECE   |

CODE_07FECF:
    LDA $18,x           ; $07FECF   |
    BNE CODE_07FEE4     ; $07FED1   |
    LDA $60D4           ; $07FED3   |
    BEQ CODE_07FEE4     ; $07FED6   |
    LDA $7182,x         ; $07FED8   |
    CLC                 ; $07FEDB   |
    ADC #$0004          ; $07FEDC   |
    STA $7182,x         ; $07FEDF   |
    INC $18,x           ; $07FEE2   |

CODE_07FEE4:
    RTL                 ; $07FEE4   |

CODE_07FEE5:
    DEY                 ; $07FEE5   |
    BMI CODE_07FEE4     ; $07FEE6   |
    BEQ CODE_07FEE4     ; $07FEE8   |
    LDA $6F00,x         ; $07FEEA   |
    CMP #$0010          ; $07FEED   |
    BNE CODE_07FEE4     ; $07FEF0   |
    LDA $7D38,x         ; $07FEF2   |
    BEQ CODE_07FEE4     ; $07FEF5   |
    TYX                 ; $07FEF7   |
    JSL $03B25B         ; $07FEF8   |
    LDX $12             ; $07FEFC   |
    RTL                 ; $07FEFE   |

CODE_07FEFF:
    LDA $70E2,x         ; $07FEFF   |
    STA $3010           ; $07FF02   |
    STA $00             ; $07FF05   |
    LDA $7182,x         ; $07FF07   |
    CLC                 ; $07FF0A   |
    ADC #$0010          ; $07FF0B   |
    STA $3000           ; $07FF0E   |
    STA $02             ; $07FF11   |
    LDX #$0A            ; $07FF13   |
    LDA #$CE2F          ; $07FF15   |
    JSL $7EDE91         ; $07FF18   | GSU init
    LDX $12             ; $07FF1C   |
    LDA $300C           ; $07FF1E   |
    CMP #$7D24          ; $07FF21   |
    RTS                 ; $07FF24   |

CODE_07FF25:
    JSR CODE_07FEFF     ; $07FF25   |
    BNE CODE_07FF46     ; $07FF28   |
    LDA #$0001          ; $07FF2A   |
    STA $008F           ; $07FF2D   |
    LDA #$7D22          ; $07FF30   |
    STA $0095           ; $07FF33   |
    LDA $00             ; $07FF36   |
    STA $0091           ; $07FF38   |
    LDA $02             ; $07FF3B   |
    STA $0093           ; $07FF3D   |
    JSL $109295         ; $07FF40   |
    LDX $12             ; $07FF44   |

CODE_07FF46:
    RTS                 ; $07FF46   |

; freespace
DATA_07FF47:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF4F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF57:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF5F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF67:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF6F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF77:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF7F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF87:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF8F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF97:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FF9F:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFA7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFAF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFB7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFBF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFC7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFCF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFD7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFDF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFE7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFEF:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFF7:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_07FFFF:         db $FF
