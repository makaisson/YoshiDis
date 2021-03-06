org $0E8000

    TYX                 ; $0E8000   |
    RTS                 ; $0E8001   |

.init_cannonball
    LDA $10             ; $0E8002   |
    AND #$001F          ; $0E8004   |
    CLC                 ; $0E8007   |
    ADC #$0030          ; $0E8008   |
    STA $16,x           ; $0E800B   |
    SEP #$20            ; $0E800D   |
    LDA #$7F            ; $0E800F   |
    STA $7863,x         ; $0E8011   |
    REP #$20            ; $0E8014   |
    INC $78,x           ; $0E8016   |
    RTL                 ; $0E8018   |

.main_cannonball
    LDY $7D38,x         ; $0E8019   |
    BEQ CODE_0E8023     ; $0E801C   |
    LDY $7D36,x         ; $0E801E   |
    BMI CODE_0E809E     ; $0E8021   |

CODE_0E8023:
    JSL $03AF23         ; $0E8023   |
    LDY $76,x           ; $0E8027   |
    BEQ CODE_0E802F     ; $0E8029   |
    JSR CODE_0E814D     ; $0E802B   |
    RTL                 ; $0E802E   |

CODE_0E802F:
    LDY $18,x           ; $0E802F   |
    BEQ CODE_0E803E     ; $0E8031   |
    LDA $6F00,y         ; $0E8033   |
    CMP #$0010          ; $0E8036   |
    BNE CODE_0E809E     ; $0E8039   |
    JMP CODE_0E80DD     ; $0E803B   |

CODE_0E803E:
    LDY $7D36,x         ; $0E803E   |
    BMI CODE_0E809E     ; $0E8041   |
    BEQ CODE_0E8055     ; $0E8043   |
    LDA $735F,y         ; $0E8045   |
    CMP #$0015          ; $0E8048   |
    BNE CODE_0E8055     ; $0E804B   |
    TYX                 ; $0E804D   |
    DEX                 ; $0E804E   |
    JSL $03B25B         ; $0E804F   |
    BRA CODE_0E809E     ; $0E8053   |

CODE_0E8055:
    LDA $7A96,x         ; $0E8055   |
    BNE CODE_0E808E     ; $0E8058   |
    LDY $7223,x         ; $0E805A   |
    BMI CODE_0E8082     ; $0E805D   |
    LDA $7360,x         ; $0E805F   |
    CMP #$000B          ; $0E8062   |
    BEQ CODE_0E8082     ; $0E8065   |
    LDA $6FA2,x         ; $0E8067   |
    AND #$001F          ; $0E806A   |
    BEQ CODE_0E808A     ; $0E806D   |
    REP #$10            ; $0E806F   |
    TXY                 ; $0E8071   |
    LDA $7902,x         ; $0E8072   |
    TAX                 ; $0E8075   |
    LDA $700024,x       ; $0E8076   |
    SEP #$10            ; $0E807A   |
    TYX                 ; $0E807C   |
    AND #$0004          ; $0E807D   |
    BNE CODE_0E809A     ; $0E8080   |

CODE_0E8082:
    LDA $7860,x         ; $0E8082   |
    AND #$002F          ; $0E8085   |
    BNE CODE_0E809A     ; $0E8088   |

CODE_0E808A:
    LDY #$01            ; $0E808A   |
    STY $78,x           ; $0E808C   |

CODE_0E808E:
    LDY $7862,x         ; $0E808E   |
    BEQ CODE_0E8097     ; $0E8091   |
    DEC $16,x           ; $0E8093   |
    BMI CODE_0E809A     ; $0E8095   |

CODE_0E8097:
    JMP CODE_0E80D9     ; $0E8097   |

CODE_0E809A:
    LDA $78,x           ; $0E809A   |
    BEQ CODE_0E808E     ; $0E809C   |

CODE_0E809E:
    LDA #$01ED          ; $0E809E   |
    JSL $008B21         ; $0E80A1   |
    LDA $7CD6,x         ; $0E80A5   |
    STA $70A2,y         ; $0E80A8   |
    LDA $7CD8,x         ; $0E80AB   |
    STA $7142,y         ; $0E80AE   |
    LDA #$000D          ; $0E80B1   |
    STA $73C2,y         ; $0E80B4   |
    LDA #$0003          ; $0E80B7   |
    STA $7782,y         ; $0E80BA   |
    LDA #$0047          ; $0E80BD   |\ play sound #$0047
    JSL $0085D2         ; $0E80C0   |/
    STZ $7222,x         ; $0E80C4   |
    STZ $7542,x         ; $0E80C7   |
    STZ $7220,x         ; $0E80CA   |
    STZ $7D38,x         ; $0E80CD   |
    LDA #$68A0          ; $0E80D0   |
    STA $6FA0,x         ; $0E80D3   |
    INC $76,x           ; $0E80D6   |
    RTL                 ; $0E80D8   |


CODE_0E80D9:
    JSL $03A5B7         ; $0E80D9   |

CODE_0E80DD:
    LDA $7360,x         ; $0E80DD   |
    CMP #$000B          ; $0E80E0   |
    BEQ CODE_0E8128     ; $0E80E3   |
    LDA $7362,x         ; $0E80E5   |
    BMI CODE_0E8128     ; $0E80E8   |
    LDA $0030           ; $0E80EA   |
    AND #$0001          ; $0E80ED   |
    BNE CODE_0E8128     ; $0E80F0   |
    LDA $10             ; $0E80F2   |
    PHA                 ; $0E80F4   |
    AND #$0003          ; $0E80F5   |
    SEC                 ; $0E80F8   |
    SBC #$000A          ; $0E80F9   |
    STA $00             ; $0E80FC   |
    PLA                 ; $0E80FE   |
    XBA                 ; $0E80FF   |
    AND #$0003          ; $0E8100   |
    SEC                 ; $0E8103   |
    SBC #$000A          ; $0E8104   |
    STA $02             ; $0E8107   |
    LDA #$01EC          ; $0E8109   |
    JSL $008B21         ; $0E810C   |
    LDA $7CD6,x         ; $0E8110   |
    CLC                 ; $0E8113   |
    ADC $00             ; $0E8114   |
    STA $70A2,y         ; $0E8116   |
    LDA $7182,x         ; $0E8119   |
    CLC                 ; $0E811C   |
    ADC $02             ; $0E811D   |
    STA $7142,y         ; $0E811F   |
    LDA #$0002          ; $0E8122   |
    STA $7782,y         ; $0E8125   |

CODE_0E8128:
    RTL                 ; $0E8128   |

; data
DATA_0E8129:         dw $0000
DATA_0E812B:         dw $FFF0
DATA_0E812D:         dw $0010
DATA_0E812F:         dw $0010
DATA_0E8131:         dw $FFF0
DATA_0E8133:         dw $0000
DATA_0E8135:         dw $0010
DATA_0E8137:         dw $FFF0
DATA_0E8139:         dw $0010
DATA_0E813B:         dw $0000
DATA_0E813D:         dw $FFF0
DATA_0E813F:         dw $0010
DATA_0E8141:         dw $0010
DATA_0E8143:         dw $FFF0
DATA_0E8145:         dw $0000
DATA_0E8147:         dw $FFF0
DATA_0E8149:         dw $FF00
DATA_0E814B:         dw $0100

; cannonball sub

CODE_0E814D:
    LDY $7A36,x         ; $0E814D   |
    PHY                 ; $0E8150   |
    JSR CODE_0E818B     ; $0E8151   |
    PLY                 ; $0E8154   |
    INY                 ; $0E8155   |
    INY                 ; $0E8156   |
    JSR CODE_0E818B     ; $0E8157   |
    LDA $7A36,x         ; $0E815A   |
    CLC                 ; $0E815D   |
    ADC #$0004          ; $0E815E   |
    STA $7A36,x         ; $0E8161   |
    CMP #$0010          ; $0E8164   |
    BMI CODE_0E816E     ; $0E8167   |
    JSL $03A31E         ; $0E8169   |
    RTS                 ; $0E816D   |


CODE_0E816E:
    LDA $7C16,x         ; $0E816E   |
    CLC                 ; $0E8171   |
    ADC #$0018          ; $0E8172   |
    CMP #$0030          ; $0E8175   |
    BCS CODE_0E818A     ; $0E8178   |
    LDA $7C18,x         ; $0E817A   |
    CLC                 ; $0E817D   |
    ADC #$0018          ; $0E817E   |
    CMP #$0030          ; $0E8181   |
    BCS CODE_0E818A     ; $0E8184   |
    JSL $03A858         ; $0E8186   |

CODE_0E818A:
    RTS                 ; $0E818A   |

; cannonball sub

CODE_0E818B:
    LDA $8129,y         ; $0E818B   | table
    CLC                 ; $0E818E   |
    ADC $7CD6,x         ; $0E818F   |
    STA $0091           ; $0E8192   |
    STA $3010           ; $0E8195   |
    LDA $8139,y         ; $0E8198   |
    CLC                 ; $0E819B   |
    ADC $7CD8,x         ; $0E819C   |
    STA $0093           ; $0E819F   |
    STA $3000           ; $0E81A2   |
    LDX #$0A            ; $0E81A5   |
    LDA #$CE2F          ; $0E81A7   |
    JSL $7EDE91         ; $0E81AA   | GSU init
    LDX $12             ; $0E81AE   |
    LDA $300E           ; $0E81B0   |
    AND #$F800          ; $0E81B3   |
    CMP #$4000          ; $0E81B6   |
    BNE CODE_0E81BF     ; $0E81B9   |
    JSL $0DA479         ; $0E81BB   |

CODE_0E81BF:
    RTS                 ; $0E81BF   |

.init_flatbed_ferry_green
    STZ $7900,x         ; $0E81C0   |
    LDA #$C000          ; $0E81C3   |
    STA $7902,x         ; $0E81C6   |
    STZ $7400,x         ; $0E81C9   |
    RTL                 ; $0E81CC   |

DATA_0E81CD:         dw $FFA0, $0060

.main_flatbed_ferry_green
    LDA $7900,x         ; $0E81D1   |
    CMP #$8000          ; $0E81D4   |
    ROR A               ; $0E81D7   |
    CMP #$8000          ; $0E81D8   |
    ROR A               ; $0E81DB   |
    STA $00             ; $0E81DC   |
    LDA $7902,x         ; $0E81DE   |
    CMP #$8000          ; $0E81E1   |
    ROR A               ; $0E81E4   |
    CMP #$8000          ; $0E81E5   |
    ROR A               ; $0E81E8   |
    STA $02             ; $0E81E9   |
    LDA $70E2,x         ; $0E81EB   |
    SEC                 ; $0E81EE   |
    SBC $6094           ; $0E81EF   |
    CLC                 ; $0E81F2   |
    ADC #$0004          ; $0E81F3   |
    STA $04             ; $0E81F6   |
    LDA $7182,x         ; $0E81F8   |
    SEC                 ; $0E81FB   |
    SBC $609C           ; $0E81FC   |
    CLC                 ; $0E81FF   |
    ADC #$0004          ; $0E8200   |
    STA $06             ; $0E8203   |
    STZ $08             ; $0E8205   |
    STZ $0A             ; $0E8207   |
    LDA #$0003          ; $0E8209   |
    STA $0C             ; $0E820C   |
    REP #$10            ; $0E820E   |
    LDY $7362,x         ; $0E8210   |

CODE_0E8213:
    LDA $08             ; $0E8213   |
    CLC                 ; $0E8215   |
    ADC $00             ; $0E8216   |
    STA $08             ; $0E8218   |
    CLC                 ; $0E821A   |
    ADC #$0080          ; $0E821B   |
    XBA                 ; $0E821E   |
    AND #$00FF          ; $0E821F   |
    CMP #$0080          ; $0E8222   |
    BMI CODE_0E822A     ; $0E8225   |
    ORA #$FF00          ; $0E8227   |

CODE_0E822A:
    CLC                 ; $0E822A   |
    ADC $04             ; $0E822B   |
    STA $6008,y         ; $0E822D   |
    LDA $0A             ; $0E8230   |
    CLC                 ; $0E8232   |
    ADC $02             ; $0E8233   |
    STA $0A             ; $0E8235   |
    CLC                 ; $0E8237   |
    ADC #$0080          ; $0E8238   |
    XBA                 ; $0E823B   |
    AND #$00FF          ; $0E823C   |
    CMP #$0080          ; $0E823F   |
    BMI CODE_0E8247     ; $0E8242   |
    ORA #$FF00          ; $0E8244   |

CODE_0E8247:
    CLC                 ; $0E8247   |
    ADC $06             ; $0E8248   |
    STA $600A,y         ; $0E824A   |
    TYA                 ; $0E824D   |
    CLC                 ; $0E824E   |
    ADC #$0008          ; $0E824F   |
    TAY                 ; $0E8252   |
    DEC $0C             ; $0E8253   |
    BNE CODE_0E8213     ; $0E8255   |
    LDA $7900,x         ; $0E8257   |
    CLC                 ; $0E825A   |
    ADC #$0080          ; $0E825B   |
    XBA                 ; $0E825E   |
    AND #$00FF          ; $0E825F   |
    CMP #$0080          ; $0E8262   |
    BMI CODE_0E826A     ; $0E8265   |
    ORA #$FF00          ; $0E8267   |

CODE_0E826A:
    CLC                 ; $0E826A   |
    ADC $04             ; $0E826B   |
    CLC                 ; $0E826D   |
    ADC #$0004          ; $0E826E   |
    STA $6010,y         ; $0E8271   |
    SEC                 ; $0E8274   |
    SBC #$0010          ; $0E8275   |
    STA $6008,y         ; $0E8278   |
    LDA $7902,x         ; $0E827B   |
    CLC                 ; $0E827E   |
    ADC #$0080          ; $0E827F   |
    XBA                 ; $0E8282   |
    AND #$00FF          ; $0E8283   |
    CMP #$0080          ; $0E8286   |
    BMI CODE_0E828E     ; $0E8289   |
    ORA #$FF00          ; $0E828B   |

CODE_0E828E:
    CLC                 ; $0E828E   |
    ADC $06             ; $0E828F   |
    STA $600A,y         ; $0E8291   |
    STA $6012,y         ; $0E8294   |
    SEP #$10            ; $0E8297   |
    JSL $03AF23         ; $0E8299   |
    LDA $7A38,x         ; $0E829D   |
    INC A               ; $0E82A0   |
    INC A               ; $0E82A1   |
    STA $7A38,x         ; $0E82A2   |
    CLC                 ; $0E82A5   |
    ADC #$0080          ; $0E82A6   |
    AND #$01FE          ; $0E82A9   |
    STA $3002           ; $0E82AC   |
    LDA #$5800          ; $0E82AF   |
    STA $300C           ; $0E82B2   |
    LDX #$0B            ; $0E82B5   |
    LDA #$8595          ; $0E82B7   |
    JSL $7EDE44         ; $0E82BA   | GSU init
    LDX $12             ; $0E82BE   |
    LDA $3000           ; $0E82C0   |
    STA $7900,x         ; $0E82C3   |
    CLC                 ; $0E82C6   |
    ADC #$0080          ; $0E82C7   |
    XBA                 ; $0E82CA   |
    AND #$00FF          ; $0E82CB   |
    TAY                 ; $0E82CE   |
    BPL CODE_0E82D4     ; $0E82CF   |
    ORA #$FF00          ; $0E82D1   |

CODE_0E82D4:
    STA $08             ; $0E82D4   |
    LDA $3002           ; $0E82D6   |
    STA $7902,x         ; $0E82D9   |
    CLC                 ; $0E82DC   |
    ADC #$0080          ; $0E82DD   |
    XBA                 ; $0E82E0   |
    AND #$00FF          ; $0E82E1   |
    TAY                 ; $0E82E4   |
    BPL CODE_0E82EA     ; $0E82E5   |
    ORA #$FF00          ; $0E82E7   |

CODE_0E82EA:
    STA $0A             ; $0E82EA   |
    LDY $18,x           ; $0E82EC   |
    BNE CODE_0E8314     ; $0E82EE   |
    LDY $60AB           ; $0E82F0   |
    BMI CODE_0E835B     ; $0E82F3   |
    LDA $0A             ; $0E82F5   |
    CLC                 ; $0E82F7   |
    ADC $7182,x         ; $0E82F8   |
    CLC                 ; $0E82FB   |
    ADC #$0004          ; $0E82FC   |
    SEC                 ; $0E82FF   |
    SBC $611E           ; $0E8300   |
    SEC                 ; $0E8303   |
    SBC $6112           ; $0E8304   |
    BMI CODE_0E835B     ; $0E8307   |
    SEC                 ; $0E8309   |
    SBC $6122           ; $0E830A   |
    CMP #$0004          ; $0E830D   |
    BMI CODE_0E8338     ; $0E8310   |
    BRA CODE_0E835B     ; $0E8312   |

CODE_0E8314:
    LDY $60AB           ; $0E8314   |
    BMI CODE_0E835B     ; $0E8317   |
    LDY $0D94           ; $0E8319   |
    BNE CODE_0E835B     ; $0E831C   |
    CPX $61B6           ; $0E831E   |
    BNE CODE_0E835B     ; $0E8321   |
    LDA $08             ; $0E8323   |
    SEC                 ; $0E8325   |
    SBC $78,x           ; $0E8326   |
    PHA                 ; $0E8328   |
    CLC                 ; $0E8329   |
    ADC $608C           ; $0E832A   |
    STA $608C           ; $0E832D   |
    PLA                 ; $0E8330   |
    CLC                 ; $0E8331   |
    ADC $611C           ; $0E8332   |
    STA $611C           ; $0E8335   |

CODE_0E8338:
    LDA $08             ; $0E8338   |
    CLC                 ; $0E833A   |
    ADC $70E2,x         ; $0E833B   |
    CLC                 ; $0E833E   |
    ADC #$0008          ; $0E833F   |
    SEC                 ; $0E8342   |
    SBC $611C           ; $0E8343   |
    BPL CODE_0E834E     ; $0E8346   |
    CLC                 ; $0E8348   |
    ADC $6120           ; $0E8349   |
    BRA CODE_0E8352     ; $0E834C   |

CODE_0E834E:
    SEC                 ; $0E834E   |
    SBC $6120           ; $0E834F   |

CODE_0E8352:
    CLC                 ; $0E8352   |
    ADC #$000E          ; $0E8353   |
    CMP #$001C          ; $0E8356   |
    BCC CODE_0E8367     ; $0E8359   |

CODE_0E835B:
    CPX $61B6           ; $0E835B   |
    BNE CODE_0E8363     ; $0E835E   |
    STZ $61B6           ; $0E8360   |

CODE_0E8363:
    STZ $18,x           ; $0E8363   |
    BRA CODE_0E838C     ; $0E8365   |

CODE_0E8367:
    CPX $61B6           ; $0E8367   |
    BEQ CODE_0E8374     ; $0E836A   |
    LDY $61B6           ; $0E836C   |
    BNE CODE_0E8363     ; $0E836F   |
    STX $61B6           ; $0E8371   |

CODE_0E8374:
    LDA $0A             ; $0E8374   |
    CLC                 ; $0E8376   |
    ADC $7182,x         ; $0E8377   |
    CLC                 ; $0E837A   |
    ADC #$FFE4          ; $0E837B   |
    SEC                 ; $0E837E   |
    SBC $6112           ; $0E837F   |
    STA $6090           ; $0E8382   |
    INC $61B4           ; $0E8385   |
    LDY #$01            ; $0E8388   |
    STY $18,x           ; $0E838A   |

CODE_0E838C:
    LDA $08             ; $0E838C   |
    STA $78,x           ; $0E838E   |
    JSL $03D127         ; $0E8390   |
    RTL                 ; $0E8394   |

.init_incoming_chomp
    LDY $0073           ; $0E8395   |
    BNE CODE_0E83AF     ; $0E8398   |
    SEP #$20            ; $0E839A   |
    LDA #$40            ; $0E839C   |
    STA $70E0,x         ; $0E839E   |
    REP #$20            ; $0E83A1   |
    BRA CODE_0E83CC     ; $0E83A3   |

.init_incoming_chomp_flock
    LDY $0073           ; $0E83A5   |
    BNE CODE_0E83AF     ; $0E83A8   |
    LDY $0DC2           ; $0E83AA   |
    BEQ CODE_0E83B3     ; $0E83AD   |

CODE_0E83AF:
    JMP CODE_0E03A3     ; $0E83AF   |

CODE_0E83B3:
    INC $0DC2           ; $0E83B3   |
    LDA $70E2,x         ; $0E83B6   |
    AND #$FF00          ; $0E83B9   |
    ORA #$0080          ; $0E83BC   |
    STA $0DC4           ; $0E83BF   |
    LDA $70E2,x         ; $0E83C2   |
    SEC                 ; $0E83C5   |
    SBC #$0020          ; $0E83C6   |
    STA $70E2,x         ; $0E83C9   |

CODE_0E83CC:
    LDA $0039           ; $0E83CC   |
    AND #$FFF0          ; $0E83CF   |
    STA $00             ; $0E83D2   |
    LDA $70E2,x         ; $0E83D4   |
    STA $18,x           ; $0E83D7   |
    SEC                 ; $0E83D9   |
    SBC $00             ; $0E83DA   |
    LSR $00             ; $0E83DC   |
    CLC                 ; $0E83DE   |
    ADC $00             ; $0E83DF   |
    STA $70E2,x         ; $0E83E1   |
    STA $7900,x         ; $0E83E4   |
    LDA $7182,x         ; $0E83E7   |
    SEC                 ; $0E83EA   |
    SBC $003B           ; $0E83EB   |
    CLC                 ; $0E83EE   |
    ADC $003F           ; $0E83EF   |
    AND #$FFF8          ; $0E83F2   |
    CLC                 ; $0E83F5   |
    ADC #$0012          ; $0E83F6   |
    LDY $021A           ; $0E83F9   |
    CPY #$27            ; $0E83FC   |
    BNE CODE_0E8406     ; $0E83FE   |
    SEC                 ; $0E8400   |
    SBC #$0008          ; $0E8401   |
    BRA CODE_0E8415     ; $0E8404   |

CODE_0E8406:
    CPY #$01            ; $0E8406   |
    BNE CODE_0E8415     ; $0E8408   |
    LDY $70E3,x         ; $0E840A   |
    CPY #$06            ; $0E840D   |
    BNE CODE_0E8415     ; $0E840F   |
    SEC                 ; $0E8411   |
    SBC #$000A          ; $0E8412   |

CODE_0E8415:
    STA $7182,x         ; $0E8415   |
    LDA $7360,x         ; $0E8418   |
    CMP #$00A7          ; $0E841B   |
    BNE CODE_0E842A     ; $0E841E   |
    LDA $7182,x         ; $0E8420   |
    CLC                 ; $0E8423   |
    ADC #$0016          ; $0E8424   |
    STA $7182,x         ; $0E8427   |

CODE_0E842A:
    LDA $7182,x         ; $0E842A   |
    STA $7902,x         ; $0E842D   |
    INC $74A1,x         ; $0E8430   |
    INC $74A1,x         ; $0E8433   |

.init_incoming_chomp_falling
    LDA $7042,x         ; $0E8436   |
    AND #$FFDF          ; $0E8439   |
    STA $7042,x         ; $0E843C   |
    RTL                 ; $0E843F   |

DATA_0E8440:         dw $8515
DATA_0E8442:         dw $85B2
DATA_0E8444:         dw $85FE
DATA_0E8446:         dw $866E
DATA_0E8448:         dw $8713
DATA_0E844A:         dw $88D7
DATA_0E844C:         dw $89DE
DATA_0E844E:         dw $C000
DATA_0E8450:         dw $C020
DATA_0E8452:         dw $C040
DATA_0E8454:         dw $C020

.main_incoming_chomp
    LDY $7041,x         ; $0E8456   |
    BPL CODE_0E8464     ; $0E8459   |
    LDA $7722,x         ; $0E845B   |
    BMI CODE_0E8464     ; $0E845E   |
    JSL $03ABFA         ; $0E8460   |

CODE_0E8464:
    JSL $03AF23         ; $0E8464   |
    TXY                 ; $0E8468   |
    LDA $76,x           ; $0E8469   |
    ASL A               ; $0E846B   |
    TAX                 ; $0E846C   |
    JSR ($8440,x)       ; $0E846D   |

    LDY $76,x           ; $0E8470   |
    CPY #$05            ; $0E8472   |
    BMI CODE_0E8492     ; $0E8474   |
    LDY $7D36,x         ; $0E8476   |
    DEY                 ; $0E8479   |
    BMI CODE_0E848E     ; $0E847A   |
    LDA $6F00,y         ; $0E847C   |
    CMP #$0010          ; $0E847F   |
    BNE CODE_0E848E     ; $0E8482   |
    LDA $7D38,y         ; $0E8484   |
    BEQ CODE_0E848E     ; $0E8487   |
    TYX                 ; $0E8489   |
    JSL $03B25B         ; $0E848A   |

CODE_0E848E:
    JSL $03D127         ; $0E848E   |

CODE_0E8492:
    JSR CODE_0E84BA     ; $0E8492   |
    LDA $7360,x         ; $0E8495   |
    SEC                 ; $0E8498   |
    SBC #$00A6          ; $0E8499   |
    ORA $7A38,x         ; $0E849C   |
    BNE CODE_0E84B9     ; $0E849F   |
    LDA $608C           ; $0E84A1   |
    SEC                 ; $0E84A4   |
    SBC $18,x           ; $0E84A5   |
    CLC                 ; $0E84A7   |
    ADC #$0010          ; $0E84A8   |
    CMP #$0020          ; $0E84AB   |
    BCS CODE_0E84B9     ; $0E84AE   |
    LDY $76,x           ; $0E84B0   |
    CPY #$05            ; $0E84B2   |
    BPL CODE_0E84B9     ; $0E84B4   |
    INC $7A38,x         ; $0E84B6   |

CODE_0E84B9:
    RTL                 ; $0E84B9   |

CODE_0E84BA:
    LDY $7041,x         ; $0E84BA   |
    BPL CODE_0E8510     ; $0E84BD   |
    LDA $7722,x         ; $0E84BF   |
    BMI CODE_0E8510     ; $0E84C2   |
    LDA $7722,x         ; $0E84C4   |
    LSR A               ; $0E84C7   |
    LSR A               ; $0E84C8   |
    LSR A               ; $0E84C9   |
    SEC                 ; $0E84CA   |
    SBC $0030           ; $0E84CB   |
    AND #$0001          ; $0E84CE   |
    BNE CODE_0E8510     ; $0E84D1   |

CODE_0E84D3:
    LDY $77,x           ; $0E84D3   |
    LDA $844E,y         ; $0E84D5   |
    LDY #$54            ; $0E84D8   |

CODE_0E84DA:
    STA $3018           ; $0E84DA   |
    TYA                 ; $0E84DD   |
    STA $301A           ; $0E84DE   |
    LDA $7A36,x         ; $0E84E1   |
    STA $300C           ; $0E84E4   |
    LDA #$0010          ; $0E84E7   |
    STA $3010           ; $0E84EA   |
    STA $3012           ; $0E84ED   |
    LDY $7722,x         ; $0E84F0   |
    TYX                 ; $0E84F3   |
    LDA $03A9CE,x       ; $0E84F4   |
    STA $3006           ; $0E84F8   |
    LDA $03A9EE,x       ; $0E84FB   |
    STA $3004           ; $0E84FF   |
    LDX #$08            ; $0E8502   |
    LDA #$8A0F          ; $0E8504   |
    JSL $7EDE44         ; $0E8507   | GSU init
    LDX $12             ; $0E850B   |
    INC $0CF9           ; $0E850D   |

CODE_0E8510:
    RTS                 ; $0E8510   |

DATA_0E8511:         dw $FFC0, $0040

    TYX                 ; $0E8515   |
    STZ $7181,x         ; $0E8516   |
    LDA $7902,x         ; $0E8519   |
    STA $7182,x         ; $0E851C   |
    STZ $7222,x         ; $0E851F   |
    LDA $7360,x         ; $0E8522   |
    CMP #$00A6          ; $0E8525   |
    BEQ CODE_0E857C     ; $0E8528   |
    LDY $0DC0           ; $0E852A   |
    BNE CODE_0E857C     ; $0E852D   |
    LDA #$00A8          ; $0E852F   |
    JSL $03A364         ; $0E8532   |
    BCC CODE_0E857C     ; $0E8536   |
    TYX                 ; $0E8538   |
    JSL $03ADD0         ; $0E8539   |
    BCS CODE_0E8546     ; $0E853D   |
    JSL $03A31E         ; $0E853F   |
    LDX $12             ; $0E8543   |
    RTS                 ; $0E8545   |

CODE_0E8546:
    TXY                 ; $0E8546   |
    LDX $12             ; $0E8547   |
    DEC $0DC0           ; $0E8549   |
    LDA $70E2,x         ; $0E854C   |
    STA $70E2,y         ; $0E854F   |
    LDA $7182,x         ; $0E8552   |
    STA $7182,y         ; $0E8555   |
    LDA $7400,x         ; $0E8558   |
    STA $7400,y         ; $0E855B   |
    SEP #$20            ; $0E855E   |
    LDA #$40            ; $0E8560   |
    STA $70E0,y         ; $0E8562   |
    LDA #$02            ; $0E8565   |
    STA $79D7,y         ; $0E8567   |
    STA $74A1,y         ; $0E856A   |
    REP #$20            ; $0E856D   |
    INC A               ; $0E856F   |
    STA $79D6,y         ; $0E8570   |
    LDA $7042,y         ; $0E8573   |
    AND #$FFDF          ; $0E8576   |
    STA $7042,y         ; $0E8579   |

CODE_0E857C:
    LDA $7AF6,x         ; $0E857C   |
    BNE CODE_0E85A9     ; $0E857F   |
    LDA $10             ; $0E8581   |
    PHA                 ; $0E8583   |
    AND #$0003          ; $0E8584   |
    INC A               ; $0E8587   |
    STA $16,x           ; $0E8588   |
    PLA                 ; $0E858A   |
    XBA                 ; $0E858B   |
    AND #$0002          ; $0E858C   |
    CMP $7400,x         ; $0E858F   |
    BNE CODE_0E85A3     ; $0E8592   |
    TAY                 ; $0E8594   |
    LDA $8511,y         ; $0E8595   |
    STA $7220,x         ; $0E8598   |
    LDA #$FF80          ; $0E859B   |
    STA $7222,x         ; $0E859E   |
    INC $76,x           ; $0E85A1   |

CODE_0E85A3:
    INC $76,x           ; $0E85A3   |
    LDY #$04            ; $0E85A5   |
    STY $77,x           ; $0E85A7   |

CODE_0E85A9:
    RTS                 ; $0E85A9   |

DATA_0E85AA:         dw $0200, $0000

DATA_0E85AE:         dw $0100, $0001

    TYX                 ; $0E85B2   |
    STZ $7181,x         ; $0E85B3   |
    LDA $7902,x         ; $0E85B6   |
    STA $7182,x         ; $0E85B9   |
    STZ $7222,x         ; $0E85BC   |
    LDA $7A98,x         ; $0E85BF   |
    BNE CODE_0E85FD     ; $0E85C2   |
    SEP #$20            ; $0E85C4   |
    DEC $77,x           ; $0E85C6   |
    REP #$20            ; $0E85C8   |
    LDY $77,x           ; $0E85CA   |
    BPL CODE_0E85E0     ; $0E85CC   |
    LDY $7400,x         ; $0E85CE   |
    LDA $8511,y         ; $0E85D1   |
    STA $7220,x         ; $0E85D4   |
    LDA #$FF80          ; $0E85D7   |
    STA $7222,x         ; $0E85DA   |
    INC $76,x           ; $0E85DD   |
    RTS                 ; $0E85DF   |

CODE_0E85E0:
    LDY $77,x           ; $0E85E0   |
    LDA $85AE,y         ; $0E85E2   |
    AND #$00FF          ; $0E85E5   |
    STA $7402,x         ; $0E85E8   |
    LDA $85AA,y         ; $0E85EB   |
    AND #$00FF          ; $0E85EE   |
    EOR $7400,x         ; $0E85F1   |
    STA $7400,x         ; $0E85F4   |
    LDA #$0006          ; $0E85F7   |
    STA $7A98,x         ; $0E85FA   |

CODE_0E85FD:
    RTS                 ; $0E85FD   |

    TYX                 ; $0E85FE   |
    LDA $70E2,x         ; $0E85FF   |
    SEC                 ; $0E8602   |
    SBC $7900,x         ; $0E8603   |
    CLC                 ; $0E8606   |
    ADC #$0010          ; $0E8607   |
    CMP #$0020          ; $0E860A   |
    BCC CODE_0E8617     ; $0E860D   |
    EOR $7220,x         ; $0E860F   |
    BMI CODE_0E8617     ; $0E8612   |
    STZ $7220,x         ; $0E8614   |

CODE_0E8617:
    LDA $7182,x         ; $0E8617   |
    CMP $7902,x         ; $0E861A   |
    BMI CODE_0E866D     ; $0E861D   |
    STZ $7181,x         ; $0E861F   |
    LDA $7902,x         ; $0E8622   |
    STA $7182,x         ; $0E8625   |
    STZ $7222,x         ; $0E8628   |
    LDA $7360,x         ; $0E862B   |
    CMP #$00A6          ; $0E862E   |
    BNE CODE_0E8652     ; $0E8631   |
    LDY $7A38,x         ; $0E8633   |
    BEQ CODE_0E8652     ; $0E8636   |
    LDY $0DC0           ; $0E8638   |
    BNE CODE_0E8652     ; $0E863B   |
    JSL $03ADD0         ; $0E863D   |
    BCC CODE_0E8652     ; $0E8641   |
    DEC $0DC0           ; $0E8643   |
    STZ $7220,x         ; $0E8646   |
    STZ $7542,x         ; $0E8649   |
    LDA #$0203          ; $0E864C   |
    STA $76,x           ; $0E864F   |
    RTS                 ; $0E8651   |

CODE_0E8652:
    LDA $7220,x         ; $0E8652   |
    BEQ CODE_0E865B     ; $0E8655   |
    DEC $16,x           ; $0E8657   |
    BNE CODE_0E8667     ; $0E8659   |

CODE_0E865B:
    LDA #$0020          ; $0E865B   |
    STA $7AF6,x         ; $0E865E   |
    STZ $7220,x         ; $0E8661   |
    STZ $76,x           ; $0E8664   |
    RTS                 ; $0E8666   |

CODE_0E8667:
    LDA #$FF80          ; $0E8667   |
    STA $7222,x         ; $0E866A   |

CODE_0E866D:
    RTS                 ; $0E866D   |

    TYX                 ; $0E866E   |
    LDA $7A98,x         ; $0E866F   |
    BNE CODE_0E86D2     ; $0E8672   |
    SEP #$20            ; $0E8674   |
    DEC $77,x           ; $0E8676   |
    REP #$20            ; $0E8678   |
    LDY $77,x           ; $0E867A   |
    BPL CODE_0E86B5     ; $0E867C   |
    JSL $03AEFD         ; $0E867E   |
    JSL $03ADD0         ; $0E8682   |
    LDA $7360,x         ; $0E8686   |
    CMP #$00A6          ; $0E8689   |
    BEQ CODE_0E8694     ; $0E868C   |
    LDA #$0040          ; $0E868E   |
    STA $7AF6,x         ; $0E8691   |

CODE_0E8694:
    LDA #$0080          ; $0E8694   |
    STA $7A36,x         ; $0E8697   |
    LDA #$8081          ; $0E869A   |
    STA $7040,x         ; $0E869D   |
    LDA #$0001          ; $0E86A0   |
    STA $7402,x         ; $0E86A3   |
    JSR CODE_0E84D3     ; $0E86A6   |
    LDA #$0007          ; $0E86A9   |
    STA $74A2,x         ; $0E86AC   |
    LDA #$0004          ; $0E86AF   |
    STA $76,x           ; $0E86B2   |
    RTS                 ; $0E86B4   |

CODE_0E86B5:
    LDY $77,x           ; $0E86B5   |
    LDA $85B0,y         ; $0E86B7   |
    AND #$00FF          ; $0E86BA   |
    STA $7402,x         ; $0E86BD   |
    LDA $85AC,y         ; $0E86C0   |
    AND #$00FF          ; $0E86C3   |
    EOR $7400,x         ; $0E86C6   |
    STA $7400,x         ; $0E86C9   |
    LDA #$0006          ; $0E86CC   |
    STA $7A98,x         ; $0E86CF   |

CODE_0E86D2:
    RTS                 ; $0E86D2   |

DATA_0E86D3:         dw $FFC0, $0000, $0020, $0010
DATA_0E86DB:         dw $0040, $0060, $0080, $00A0
DATA_0E86E3:         dw $00C0

DATA_0E86E5:         dw $0018, $0068, $00B8, $0038
DATA_0E86ED:         dw $00C8

DATA_0E86EF:         dw $0000, $0000, $0200, $0202
DATA_0E86F7:         dw $0202, $0404, $0404, $0404
DATA_0E86FF:         dw $0608, $0606, $0606, $0606
DATA_0E8707:         dw $0806, $0808, $0808, $0808

DATA_0E870F:         dw $FF00, $0100

    TYX                 ; $0E8713   |
    LDA $7AF6,x         ; $0E8714   |
    BNE CODE_0E86D2     ; $0E8717   |
    LDA $7360,x         ; $0E8719   |
    CMP #$00A6          ; $0E871C   |
    BNE CODE_0E872C     ; $0E871F   |
    LDA #$FC00          ; $0E8721   |
    STA $7222,x         ; $0E8724   |
    LDA #$00C0          ; $0E8727   |
    BRA CODE_0E8757     ; $0E872A   |

CODE_0E872C:
    LDA #$FC00          ; $0E872C   |
    STA $7222,x         ; $0E872F   |
    STA $300C           ; $0E8732   |
    LDA $7680,x         ; $0E8735   |
    SEC                 ; $0E8738   |
    SBC #$0080          ; $0E8739   |
    STA $3000           ; $0E873C   |
    LDA $7682,x         ; $0E873F   |
    CLC                 ; $0E8742   |
    ADC #$0040          ; $0E8743   |
    STA $3004           ; $0E8746   |
    LDX #$0B            ; $0E8749   |
    LDA #$8739          ; $0E874B   |
    JSL $7EDE44         ; $0E874E   | GSU init
    LDX $12             ; $0E8752   |
    LDA $3000           ; $0E8754   |

CODE_0E8757:
    STA $7220,x         ; $0E8757   |
    LDA $7682,x         ; $0E875A   |
    CMP #$FFC0          ; $0E875D   |
    BMI CODE_0E87A8     ; $0E8760   |
    LDA $7A36,x         ; $0E8762   |
    CLC                 ; $0E8765   |
    ADC #$000A          ; $0E8766   |
    STA $7A36,x         ; $0E8769   |
    CMP #$0100          ; $0E876C   |
    BMI CODE_0E878C     ; $0E876F   |
    CMP #$01FF          ; $0E8771   |
    BMI CODE_0E877C     ; $0E8774   |
    LDA #$01FF          ; $0E8776   |
    STA $7A36,x         ; $0E8779   |

CODE_0E877C:
    LDA $7042,x         ; $0E877C   |
    ORA #$0002          ; $0E877F   |
    STA $7042,x         ; $0E8782   |
    SEP #$20            ; $0E8785   |
    STZ $70E0,x         ; $0E8787   |
    REP #$20            ; $0E878A   |

CODE_0E878C:
    LDA $7722,x         ; $0E878C   |
    LSR A               ; $0E878F   |
    LSR A               ; $0E8790   |
    LSR A               ; $0E8791   |
    SEC                 ; $0E8792   |
    SBC $0030           ; $0E8793   |
    AND #$0001          ; $0E8796   |
    BNE CODE_0E87A7     ; $0E8799   |
    SEP #$20            ; $0E879B   |
    LDA $77,x           ; $0E879D   |
    INC A               ; $0E879F   |
    INC A               ; $0E87A0   |
    AND #$07            ; $0E87A1   |
    STA $77,x           ; $0E87A3   |
    REP #$20            ; $0E87A5   |

CODE_0E87A7:
    RTS                 ; $0E87A7   |

CODE_0E87A8:
    STZ $7220,x         ; $0E87A8   |
    STZ $7222,x         ; $0E87AB   |
    STZ $74A2,x         ; $0E87AE   |
    LDA $70E2,x         ; $0E87B1   |
    SEC                 ; $0E87B4   |
    SBC $003D           ; $0E87B5   |
    CLC                 ; $0E87B8   |
    ADC $0039           ; $0E87B9   |
    STA $70E2,x         ; $0E87BC   |
    LDA $7182,x         ; $0E87BF   |
    SEC                 ; $0E87C2   |
    SBC $003F           ; $0E87C3   |
    CLC                 ; $0E87C6   |
    ADC $003B           ; $0E87C7   |
    STA $7182,x         ; $0E87CA   |
    LDA $7360,x         ; $0E87CD   |
    CMP #$00A8          ; $0E87D0   |
    BEQ CODE_0E87D8     ; $0E87D3   |
    JMP CODE_0E885B     ; $0E87D5   |

CODE_0E87D8:
    LDA $60A8           ; $0E87D8   |
    CLC                 ; $0E87DB   |
    ADC #$0400          ; $0E87DC   |
    CMP #$0800          ; $0E87DF   |
    BCC CODE_0E87EE     ; $0E87E2   |
    BPL CODE_0E87EB     ; $0E87E4   |
    LDA #$0000          ; $0E87E6   |
    BRA CODE_0E87EE     ; $0E87E9   |

CODE_0E87EB:
    LDA #$0800          ; $0E87EB   |

CODE_0E87EE:
    AND #$FF00          ; $0E87EE   |
    XBA                 ; $0E87F1   |
    ASL A               ; $0E87F2   |
    TAY                 ; $0E87F3   |
    LDA $608C           ; $0E87F4   |
    CLC                 ; $0E87F7   |
    ADC $86D3,y         ; $0E87F8   |

CODE_0E87FB:
    STA $00             ; $0E87FB   |
    SEC                 ; $0E87FD   |
    SBC $70E2,x         ; $0E87FE   |
    CLC                 ; $0E8801   |
    ADC #$0100          ; $0E8802   |
    CMP #$0200          ; $0E8805   |
    BCC CODE_0E8813     ; $0E8808   |
    SEC                 ; $0E880A   |
    SBC #$0100          ; $0E880B   |
    CLC                 ; $0E880E   |
    ADC $00             ; $0E880F   |
    BRA CODE_0E87FB     ; $0E8811   |

CODE_0E8813:
    LDA $00             ; $0E8813   |
    AND #$00F0          ; $0E8815   |
    LSR A               ; $0E8818   |
    LSR A               ; $0E8819   |
    LSR A               ; $0E881A   |
    LSR A               ; $0E881B   |
    LDY $0218           ; $0E881C   |
    BEQ CODE_0E8825     ; $0E881F   |
    CPY #$0A            ; $0E8821   |
    BNE CODE_0E8829     ; $0E8823   |

CODE_0E8825:
    CLC                 ; $0E8825   |
    ADC #$0010          ; $0E8826   |

CODE_0E8829:
    TAY                 ; $0E8829   |
    LDA $86EF,y         ; $0E882A   |
    TAY                 ; $0E882D   |
    LDA $00             ; $0E882E   |
    AND #$FF00          ; $0E8830   |
    ORA $86E5,y         ; $0E8833   |
    STA $70E2,x         ; $0E8836   |

CODE_0E8839:
    LDY #$00            ; $0E8839   |
    LDA $70E2,x         ; $0E883B   |
    SEC                 ; $0E883E   |
    SBC $0DC4           ; $0E883F   |
    CLC                 ; $0E8842   |
    ADC #$0100          ; $0E8843   |
    CMP #$0380          ; $0E8846   |
    BCC CODE_0E8864     ; $0E8849   |
    BPL CODE_0E884F     ; $0E884B   |
    INY                 ; $0E884D   |
    INY                 ; $0E884E   |

CODE_0E884F:
    LDA $70E2,x         ; $0E884F   |
    CLC                 ; $0E8852   |
    ADC $870F,y         ; $0E8853   |
    STA $70E2,x         ; $0E8856   |
    BRA CODE_0E8839     ; $0E8859   |

CODE_0E885B:
    LDA $18,x           ; $0E885B   |
    CLC                 ; $0E885D   |
    ADC #$00F8          ; $0E885E   |
    STA $70E2,x         ; $0E8861   |

CODE_0E8864:
    JSL $03AEFD         ; $0E8864   |
    STZ $7402,x         ; $0E8868   |
    LDA #$0881          ; $0E886B   |
    STA $7040,x         ; $0E886E   |
    LDA #$0050          ; $0E8871   |
    STA $7AF6,x         ; $0E8874   |
    LDA $7360,x         ; $0E8877   |
    CMP #$00A6          ; $0E887A   |
    BNE CODE_0E8885     ; $0E887D   |
    LDA #$0030          ; $0E887F   |
    STA $7AF6,x         ; $0E8882   |

CODE_0E8885:
    STZ $7542,x         ; $0E8885   |
    STZ $75E2,x         ; $0E8888   |
    JSR CODE_0E8B53     ; $0E888B   |
    LDA $7042,x         ; $0E888E   |
    AND #$FFF3          ; $0E8891   |
    ORA #$0020          ; $0E8894   |
    STA $7042,x         ; $0E8897   |
    SEP #$20            ; $0E889A   |
    LDA #$02            ; $0E889C   |
    STA $74A2,x         ; $0E889E   |
    STZ $74A1,x         ; $0E88A1   |
    REP #$20            ; $0E88A4   |
    LDA #$01FF          ; $0E88A6   |
    STA $7A36,x         ; $0E88A9   |
    STZ $7A38,x         ; $0E88AC   |
    STZ $75E0,x         ; $0E88AF   |
    STZ $16,x           ; $0E88B2   |
    LDA #$0018          ; $0E88B4   |
    STA $7BB6,x         ; $0E88B7   |
    STA $7BB8,x         ; $0E88BA   |
    LDA #$006D          ; $0E88BD   |\ play sound #$006D
    JSL $0085D2         ; $0E88C0   |/
    INC $76,x           ; $0E88C4   |
    RTS                 ; $0E88C6   |

DATA_0E88C7:         dw $FFE8, $FFF8, $0008, $0018

DATA_0E88CF:         dw $FE00, $FF00, $0100, $0200

    TYX                 ; $0E88D7   |
    LDA $7AF6,x         ; $0E88D8   |
    BEQ CODE_0E88E1     ; $0E88DB   |
    JSR CODE_0E8B53     ; $0E88DD   |
    RTS                 ; $0E88E0   |

CODE_0E88E1:
    LDY $75E0,x         ; $0E88E1   |
    BNE CODE_0E8943     ; $0E88E4   |
    LDA $7360,x         ; $0E88E6   |
    CMP #$00A6          ; $0E88E9   |
    BNE CODE_0E8943     ; $0E88EC   |
    LDA $7680,x         ; $0E88EE   |
    CLC                 ; $0E88F1   |
    ADC #$0030          ; $0E88F2   |
    CMP #$0160          ; $0E88F5   |
    BCC CODE_0E8943     ; $0E88F8   |
    LDY $78,x           ; $0E88FA   |
    TYA                 ; $0E88FC   |
    STA $79D8,y         ; $0E88FD   |
    LDA #$000C          ; $0E8900   |
    STA $7042,x         ; $0E8903   |
    STZ $7402,x         ; $0E8906   |
    LDA #$0881          ; $0E8909   |
    STA $7040,x         ; $0E890C   |
    SEP #$20            ; $0E890F   |
    LDA #$40            ; $0E8911   |
    STA $70E0,x         ; $0E8913   |
    LDA #$FF            ; $0E8916   |
    STA $74A2,x         ; $0E8918   |
    LDA #$02            ; $0E891B   |
    STA $74A1,x         ; $0E891D   |
    REP #$20            ; $0E8920   |
    LDA $7900,x         ; $0E8922   |
    STA $70E2,x         ; $0E8925   |
    LDA $7902,x         ; $0E8928   |
    STA $7182,x         ; $0E892B   |
    STZ $7A38,x         ; $0E892E   |
    STZ $7222,x         ; $0E8931   |
    STZ $7542,x         ; $0E8934   |
    STZ $0DC0           ; $0E8937   |
    STZ $78,x           ; $0E893A   |
    INC $76,x           ; $0E893C   |
    JSL $03AEFD         ; $0E893E   |

CODE_0E8942:
    RTS                 ; $0E8942   |

CODE_0E8943:
    LDA #$6C73          ; $0E8943   |
    STA $6FA0,x         ; $0E8946   |
    LDA #$0020          ; $0E8949   |
    STA $7BB6,x         ; $0E894C   |
    STA $7BB8,x         ; $0E894F   |
    LDY $7722,x         ; $0E8952   |
    BPL CODE_0E8975     ; $0E8955   |
    JSL $03ADD0         ; $0E8957   |
    BCC CODE_0E8942     ; $0E895B   |
    JSR CODE_0E84D3     ; $0E895D   |
    INC $7402,x         ; $0E8960   |
    INC $7402,x         ; $0E8963   |
    LDA #$8081          ; $0E8966   |
    STA $7040,x         ; $0E8969   |
    LDA #$0800          ; $0E896C   |
    STA $7222,x         ; $0E896F   |
    STZ $0DC0           ; $0E8972   |

CODE_0E8975:
    LDA $7722,x         ; $0E8975   |
    LSR A               ; $0E8978   |
    LSR A               ; $0E8979   |
    LSR A               ; $0E897A   |
    SEC                 ; $0E897B   |
    SBC $0030           ; $0E897C   |
    AND #$0001          ; $0E897F   |
    BNE CODE_0E8990     ; $0E8982   |
    SEP #$20            ; $0E8984   |
    LDA $77,x           ; $0E8986   |
    INC A               ; $0E8988   |
    INC A               ; $0E8989   |
    AND #$07            ; $0E898A   |
    STA $77,x           ; $0E898C   |
    REP #$20            ; $0E898E   |

CODE_0E8990:
    LDA $7182,x         ; $0E8990   |
    CMP #$07FF          ; $0E8993   |
    BMI CODE_0E899D     ; $0E8996   |
    PLA                 ; $0E8998   |
    JMP CODE_0E03A3     ; $0E8999   |

CODE_0E899D:
    JSR CODE_0E8A3F     ; $0E899D   |
    LDY $75E0,x         ; $0E89A0   |
    BEQ CODE_0E89DD     ; $0E89A3   |
    LDY $78,x           ; $0E89A5   |
    BEQ CODE_0E89AF     ; $0E89A7   |
    TYA                 ; $0E89A9   |
    STA $79D8,y         ; $0E89AA   |
    STZ $78,x           ; $0E89AD   |

CODE_0E89AF:
    LDA $7974           ; $0E89AF   |
    AND #$0001          ; $0E89B2   |
    BNE CODE_0E89DD     ; $0E89B5   |
    LDA $10             ; $0E89B7   |
    AND #$0006          ; $0E89B9   |
    TAY                 ; $0E89BC   |
    LDA $88C7,y         ; $0E89BD   |
    CLC                 ; $0E89C0   |
    ADC $70E2,x         ; $0E89C1   |
    STA $00             ; $0E89C4   |
    LDA $7182,x         ; $0E89C6   |
    STA $02             ; $0E89C9   |
    LDA $88CF,y         ; $0E89CB   |
    STA $04             ; $0E89CE   |
    LDA #$FF00          ; $0E89D0   |
    STA $06             ; $0E89D3   |
    LDA #$0010          ; $0E89D5   |
    STA $08             ; $0E89D8   |
    JSR CODE_0E8B1B     ; $0E89DA   |

CODE_0E89DD:
    RTS                 ; $0E89DD   |

    TYX                 ; $0E89DE   |
    LDA $70E2,x         ; $0E89DF   |
    SEC                 ; $0E89E2   |
    SBC $003D           ; $0E89E3   |
    CLC                 ; $0E89E6   |
    ADC #$0020          ; $0E89E7   |
    CMP #$0140          ; $0E89EA   |
    BCS CODE_0E89FF     ; $0E89ED   |
    LDA $7182,x         ; $0E89EF   |
    SEC                 ; $0E89F2   |
    SBC $003F           ; $0E89F3   |
    CLC                 ; $0E89F6   |
    ADC #$0020          ; $0E89F7   |
    CMP #$0140          ; $0E89FA   |
    BCC CODE_0E8A14     ; $0E89FD   |

CODE_0E89FF:
    SEP #$20            ; $0E89FF   |
    STZ $74A2,x         ; $0E8A01   |
    REP #$20            ; $0E8A04   |
    LDA #$0100          ; $0E8A06   |
    STA $75E2,x         ; $0E8A09   |
    LDA #$0008          ; $0E8A0C   |
    STA $7542,x         ; $0E8A0F   |
    STZ $76,x           ; $0E8A12   |

CODE_0E8A14:
    RTS                 ; $0E8A14   |

DATA_0E8A15:         dw $8A2F, $8A2D, $8A2D, $8A31
DATA_0E8A1D:         dw $1C20, $1C22, $1C22, $1C24
DATA_0E8A25:         dw $1BF8, $1C04, $1C04, $1BFA
DATA_0E8A2D:         dw $0000, $007E, $007F, $FFE8
DATA_0E8A35:         dw $FFF8, $0008, $0018

DATA_0E8A3B:         dw $0018, $FFF8

CODE_0E8A3F:
    LDA $7182,x         ; $0E8A3F   |
    AND #$FFF0          ; $0E8A42   |
    CMP $16,x           ; $0E8A45   |
    BEQ CODE_0E8A9F     ; $0E8A47   |
    LDY $75E0,x         ; $0E8A49   |
    BNE CODE_0E8AA0     ; $0E8A4C   |
    LDA $7182,x         ; $0E8A4E   |
    CLC                 ; $0E8A51   |
    ADC #$0010          ; $0E8A52   |
    STA $3000           ; $0E8A55   |
    LDA $70E2,x         ; $0E8A58   |
    STA $3010           ; $0E8A5B   |
    LDX #$0A            ; $0E8A5E   |
    LDA #$CE2F          ; $0E8A60   |
    JSL $7EDE91         ; $0E8A63   | GSU init
    LDX $12             ; $0E8A67   |
    LDA $300C           ; $0E8A69   |
    CMP $1C22           ; $0E8A6C   |
    BEQ CODE_0E8AA0     ; $0E8A6F   |
    LDA $7182,x         ; $0E8A71   |
    STA $3000           ; $0E8A74   |
    LDA $7CD6,x         ; $0E8A77   |
    STA $3010           ; $0E8A7A   |
    LDX #$0A            ; $0E8A7D   |
    LDA #$CE2F          ; $0E8A7F   |
    JSL $7EDE91         ; $0E8A82   | GSU init
    LDX $12             ; $0E8A86   |
    LDA $300C           ; $0E8A88   |
    CMP #$2A00          ; $0E8A8B   |
    BEQ CODE_0E8AA0     ; $0E8A8E   |
    CMP #$2A01          ; $0E8A90   |
    BEQ CODE_0E8AA0     ; $0E8A93   |
    CMP #$2A2D          ; $0E8A95   |
    BEQ CODE_0E8AA0     ; $0E8A98   |
    CMP #$2A2E          ; $0E8A9A   |
    BEQ CODE_0E8AA0     ; $0E8A9D   |

CODE_0E8A9F:
    RTS                 ; $0E8A9F   |

CODE_0E8AA0:
    LDA $7182,x         ; $0E8AA0   |
    AND #$FFF0          ; $0E8AA3   |
    STA $16,x           ; $0E8AA6   |
    LDA #$0004          ; $0E8AA8   |
    STA $0C             ; $0E8AAB   |
    LDA $7A38,x         ; $0E8AAD   |
    AND #$0007          ; $0E8AB0   |
    LSR A               ; $0E8AB3   |
    TAY                 ; $0E8AB4   |
    LDA $70E2,x         ; $0E8AB5   |
    SEC                 ; $0E8AB8   |
    SBC $8A3B,y         ; $0E8AB9   |
    STA $04             ; $0E8ABC   |
    LDA $7182,x         ; $0E8ABE   |
    STA $02             ; $0E8AC1   |
    LDY $7A38,x         ; $0E8AC3   |
    BNE CODE_0E8AD1     ; $0E8AC6   |
    INC $75E0,x         ; $0E8AC8   |
    LDA #$0050          ; $0E8ACB   |
    STA $61C8           ; $0E8ACE   |

CODE_0E8AD1:
    REP #$10            ; $0E8AD1   |
    TYA                 ; $0E8AD3   |
    AND #$00FF          ; $0E8AD4   |
    TAY                 ; $0E8AD7   |
    PHX                 ; $0E8AD8   |
    LDA $8A15,y         ; $0E8AD9   |
    TAX                 ; $0E8ADC   |
    LDA $0000,x         ; $0E8ADD   |
    STA $0E             ; $0E8AE0   |
    PLX                 ; $0E8AE2   |
    SEP #$10            ; $0E8AE3   |
    INY                 ; $0E8AE5   |
    INY                 ; $0E8AE6   |
    PHY                 ; $0E8AE7   |
    LDA $04             ; $0E8AE8   |
    STA $0091           ; $0E8AEA   |
    LDA $02             ; $0E8AED   |
    STA $0093           ; $0E8AEF   |
    LDA #$0001          ; $0E8AF2   |
    STA $008F           ; $0E8AF5   |
    LDA $0E             ; $0E8AF8   |
    STA $0095           ; $0E8AFA   |
    JSL $109295         ; $0E8AFD   |
    PLY                 ; $0E8B01   |
    LDA $04             ; $0E8B02   |
    CLC                 ; $0E8B04   |
    ADC #$0010          ; $0E8B05   |
    STA $04             ; $0E8B08   |
    DEC $0C             ; $0E8B0A   |
    BNE CODE_0E8AD1     ; $0E8B0C   |
    LDX $12             ; $0E8B0E   |
    CPY #$18            ; $0E8B10   |
    BMI CODE_0E8B16     ; $0E8B12   |
    LDY #$10            ; $0E8B14   |

CODE_0E8B16:
    TYA                 ; $0E8B16   |
    STA $7A38,x         ; $0E8B17   |
    RTS                 ; $0E8B1A   |

CODE_0E8B1B:
    LDA #$01C3          ; $0E8B1B   |
    JSL $008B21         ; $0E8B1E   |
    LDA $00             ; $0E8B22   |
    STA $70A2,y         ; $0E8B24   |
    LDA $02             ; $0E8B27   |
    STA $7142,y         ; $0E8B29   |
    LDA $08             ; $0E8B2C   |
    STA $7782,y         ; $0E8B2E   |
    LDA $04             ; $0E8B31   |
    STA $71E0,y         ; $0E8B33   |
    LDA $06             ; $0E8B36   |
    STA $71E2,y         ; $0E8B38   |
    LDA #$0007          ; $0E8B3B   |
    STA $7E4C,y         ; $0E8B3E   |
    DEC A               ; $0E8B41   |
    STA $7502,y         ; $0E8B42   |
    LDA #$0400          ; $0E8B45   |
    STA $75A2,y         ; $0E8B48   |
    LDA #$000A          ; $0E8B4B   |\ play sound #$000A
    JSL $0085D2         ; $0E8B4E   |/

CODE_0E8B52:
    RTS                 ; $0E8B52   |

CODE_0E8B53:
    LDY $75E2,x         ; $0E8B53   |
    BNE CODE_0E8B52     ; $0E8B56   |
    STZ $02             ; $0E8B58   |
    LDA $7182,x         ; $0E8B5A   |
    STA $00             ; $0E8B5D   |
    LDA $70E2,x         ; $0E8B5F   |
    STA $04             ; $0E8B62   |

CODE_0E8B64:
    LDA $00             ; $0E8B64   |
    CLC                 ; $0E8B66   |
    ADC $02             ; $0E8B67   |
    STA $3000           ; $0E8B69   |
    LDA $04             ; $0E8B6C   |
    STA $3010           ; $0E8B6E   |
    LDX #$0A            ; $0E8B71   |
    LDA #$CE2F          ; $0E8B73   |
    JSL $7EDE91         ; $0E8B76   | GSU init
    LDA $300C           ; $0E8B7A   |
    CMP #$0000          ; $0E8B7D   |
    BNE CODE_0E8B8C     ; $0E8B80   |
    LDA $02             ; $0E8B82   |
    CLC                 ; $0E8B84   |
    ADC #$0010          ; $0E8B85   |
    STA $02             ; $0E8B88   |
    BRA CODE_0E8B64     ; $0E8B8A   |

CODE_0E8B8C:
    LDX $12             ; $0E8B8C   |
    CMP #$2A00          ; $0E8B8E   |
    BEQ CODE_0E8BA2     ; $0E8B91   |
    CMP #$2A01          ; $0E8B93   |
    BEQ CODE_0E8BA2     ; $0E8B96   |
    CMP #$2A2D          ; $0E8B98   |
    BEQ CODE_0E8BA2     ; $0E8B9B   |
    CMP #$2A2E          ; $0E8B9D   |
    BNE CODE_0E8BE0     ; $0E8BA0   |

CODE_0E8BA2:
    LDA #$00A9          ; $0E8BA2   |
    JSL $03A34C         ; $0E8BA5   |
    BCC CODE_0E8BE3     ; $0E8BA9   |
    TYX                 ; $0E8BAB   |
    JSL $03ADD0         ; $0E8BAC   |
    TXY                 ; $0E8BB0   |
    LDX $12             ; $0E8BB1   |
    LDA $70E2,x         ; $0E8BB3   |
    STA $70E2,y         ; $0E8BB6   |
    LDA $7182,x         ; $0E8BB9   |
    CLC                 ; $0E8BBC   |
    ADC $02             ; $0E8BBD   |
    STA $7182,y         ; $0E8BBF   |
    LDA #$0028          ; $0E8BC2   |
    STA $7A98,y         ; $0E8BC5   |
    LDA #$0010          ; $0E8BC8   |
    STA $7AF6,y         ; $0E8BCB   |
    INC A               ; $0E8BCE   |
    STA $7AF6,x         ; $0E8BCF   |
    LDA #$0100          ; $0E8BD2   |
    STA $7A36,y         ; $0E8BD5   |
    LDA $0030           ; $0E8BD8   |
    STA $7978,y         ; $0E8BDB   |
    STY $78,x           ; $0E8BDE   |

CODE_0E8BE0:
    INC $75E2,x         ; $0E8BE0   |

CODE_0E8BE3:
    RTS                 ; $0E8BE3   |

.main_incoming_chomp_flock
    LDY $78,x           ; $0E8BE4   |
    BEQ CODE_0E8BEB     ; $0E8BE6   |
    JSR CODE_0E8C1C     ; $0E8BE8   |

CODE_0E8BEB:
    JSL $03AF23         ; $0E8BEB   |
    LDA $7680,x         ; $0E8BEF   |
    CLC                 ; $0E8BF2   |
    ADC #$00A0          ; $0E8BF3   |
    CMP #$0200          ; $0E8BF6   |
    BCC CODE_0E8C10     ; $0E8BF9   |
    LDA $70E2,x         ; $0E8BFB   |
    SEC                 ; $0E8BFE   |
    SBC $72C0,x         ; $0E8BFF   |
    STA $70E2,x         ; $0E8C02   |
    LDA $7182,x         ; $0E8C05   |
    SEC                 ; $0E8C08   |
    SBC $72C2,x         ; $0E8C09   |
    STA $7182,x         ; $0E8C0C   |
    RTL                 ; $0E8C0F   |

CODE_0E8C10:
    TXY                 ; $0E8C10   |
    LDA $76,x           ; $0E8C11   |
    ASL A               ; $0E8C13   |
    TAX                 ; $0E8C14   |
    JSR ($8440,x)       ; $0E8C15   |

    JSR CODE_0E8C9A     ; $0E8C18   |
    RTL                 ; $0E8C1B   |

CODE_0E8C1C:
    LDY $7363,x         ; $0E8C1C   |
    BPL CODE_0E8C22     ; $0E8C1F   |
    RTS                 ; $0E8C21   |

CODE_0E8C22:
    REP #$10            ; $0E8C22   |
    LDA $7900,x         ; $0E8C24   |
    STA $00             ; $0E8C27   |
    LDA $7902,x         ; $0E8C29   |
    STA $02             ; $0E8C2C   |
    LDY $7362,x         ; $0E8C2E   |
    LDX #$0006          ; $0E8C31   |

CODE_0E8C34:
    LDA $0DC6,x         ; $0E8C34   |
    LSR A               ; $0E8C37   |
    LSR A               ; $0E8C38   |
    LSR A               ; $0E8C39   |
    LSR A               ; $0E8C3A   |
    AND #$00FF          ; $0E8C3B   |
    CMP #$0080          ; $0E8C3E   |
    BMI CODE_0E8C46     ; $0E8C41   |
    ORA #$FF00          ; $0E8C43   |

CODE_0E8C46:
    CLC                 ; $0E8C46   |
    ADC $00             ; $0E8C47   |
    SEC                 ; $0E8C49   |
    SBC $003D           ; $0E8C4A   |
    STA $6008,y         ; $0E8C4D   |
    LDA $0DCE,x         ; $0E8C50   |
    LSR A               ; $0E8C53   |
    LSR A               ; $0E8C54   |
    LSR A               ; $0E8C55   |
    LSR A               ; $0E8C56   |
    AND #$00FF          ; $0E8C57   |
    CMP #$0080          ; $0E8C5A   |
    BMI CODE_0E8C62     ; $0E8C5D   |
    ORA #$FF00          ; $0E8C5F   |

CODE_0E8C62:
    CLC                 ; $0E8C62   |
    ADC $02             ; $0E8C63   |
    SEC                 ; $0E8C65   |
    SBC $003F           ; $0E8C66   |
    STA $600A,y         ; $0E8C69   |
    LDA $0DE7,x         ; $0E8C6C   |
    AND #$00FF          ; $0E8C6F   |
    XBA                 ; $0E8C72   |
    LSR A               ; $0E8C73   |
    LSR A               ; $0E8C74   |
    XBA                 ; $0E8C75   |
    STA $04             ; $0E8C76   |
    LDA $0DE6,x         ; $0E8C78   |
    AND #$00FF          ; $0E8C7B   |
    ASL A               ; $0E8C7E   |
    CLC                 ; $0E8C7F   |
    ADC $600C,y         ; $0E8C80   |
    AND #$3FFF          ; $0E8C83   |
    ORA $04             ; $0E8C86   |
    STA $600C,y         ; $0E8C88   |
    TYA                 ; $0E8C8B   |
    CLC                 ; $0E8C8C   |
    ADC #$0008          ; $0E8C8D   |
    TAY                 ; $0E8C90   |
    DEX                 ; $0E8C91   |
    DEX                 ; $0E8C92   |
    BPL CODE_0E8C34     ; $0E8C93   |
    SEP #$10            ; $0E8C95   |
    LDX $12             ; $0E8C97   |
    RTS                 ; $0E8C99   |

CODE_0E8C9A:
    LDA $78,x           ; $0E8C9A   |
    BNE CODE_0E8CB8     ; $0E8C9C   |
    INC $78,x           ; $0E8C9E   |
    LDX #$06            ; $0E8CA0   |

CODE_0E8CA2:
    STA $0DC6,x         ; $0E8CA2   |
    STA $0DCE,x         ; $0E8CA5   |
    STA $0DD6,x         ; $0E8CA8   |
    STA $0DDE,x         ; $0E8CAB   |
    STA $0DE6,x         ; $0E8CAE   |
    STA $0DEE,x         ; $0E8CB1   |
    DEX                 ; $0E8CB4   |
    DEX                 ; $0E8CB5   |
    BNE CODE_0E8CA2     ; $0E8CB6   |

CODE_0E8CB8:
    SEP #$20            ; $0E8CB8   |
    LDX #$06            ; $0E8CBA   |

CODE_0E8CBC:
    LDY $2137           ; $0E8CBC   |
    LDA $213C           ; $0E8CBF   |
    CLC                 ; $0E8CC2   |
    ADC $7970           ; $0E8CC3   |
    STA $7970           ; $0E8CC6   |
    JSR CODE_0E8CDB     ; $0E8CC9   |
    JSR CODE_0E8CEA     ; $0E8CCC   |
    JSR CODE_0E8D9B     ; $0E8CCF   |
    DEX                 ; $0E8CD2   |
    DEX                 ; $0E8CD3   |
    BPL CODE_0E8CBC     ; $0E8CD4   |
    REP #$20            ; $0E8CD6   |
    LDX $12             ; $0E8CD8   |
    RTS                 ; $0E8CDA   |

CODE_0E8CDB:
    LDA $0DEF,x         ; $0E8CDB   |
    BEQ CODE_0E8CE3     ; $0E8CDE   |
    DEC $0DEF,x         ; $0E8CE0   |

CODE_0E8CE3:
    RTS                 ; $0E8CE3   |

DATA_0E8CE4:         dw $8CF6
DATA_0E8CE6:         dw $8D2F
DATA_0E8CE8:         dw $8D66

CODE_0E8CEA:
    TXY                 ; $0E8CEA   |
    LDA $0DDE,x         ; $0E8CEB   |
    ASL A               ; $0E8CEE   |
    TAX                 ; $0E8CEF   |
    JSR ($8CE4,x)       ; $0E8CF0   |

    RTS                 ; $0E8CF3   |

DATA_0E8CF4:         db $FC, $04

    TYX                 ; $0E8CF6   |
    LDA $0DEF,x         ; $0E8CF7   |
    BNE CODE_0E8D26     ; $0E8CFA   |
    LDA $10             ; $0E8CFC   |
    PHA                 ; $0E8CFE   |
    AND #$03            ; $0E8CFF   |
    INC A               ; $0E8D01   |
    STA $0DEE,x         ; $0E8D02   |
    PLA                 ; $0E8D05   |
    LSR A               ; $0E8D06   |
    LSR A               ; $0E8D07   |
    AND #$01            ; $0E8D08   |
    CMP $0DE7,x         ; $0E8D0A   |
    BNE CODE_0E8D1E     ; $0E8D0D   |
    TAY                 ; $0E8D0F   |
    LDA $8CF4,y         ; $0E8D10   |
    STA $0DD6,x         ; $0E8D13   |
    LDA #$F8            ; $0E8D16   |
    STA $0DD7,x         ; $0E8D18   |
    INC $0DDE,x         ; $0E8D1B   |

CODE_0E8D1E:
    INC $0DDE,x         ; $0E8D1E   |
    LDA #$04            ; $0E8D21   |
    STA $0DDF,x         ; $0E8D23   |

CODE_0E8D26:
    RTS                 ; $0E8D26   |

DATA_0E8D27:         db $00, $01, $00, $00

DATA_0E8D2B:         db $00, $01, $01, $00

    TYX                 ; $0E8D2F   |
    LDA $0DEF,x         ; $0E8D30   |
    BNE CODE_0E8D65     ; $0E8D33   |
    DEC $0DDF,x         ; $0E8D35   |
    BPL CODE_0E8D4C     ; $0E8D38   |
    LDY $0DE7,x         ; $0E8D3A   |
    LDA $8CF4,y         ; $0E8D3D   |
    STA $0DD6,x         ; $0E8D40   |
    LDA #$F0            ; $0E8D43   |
    STA $0DD7,x         ; $0E8D45   |
    INC $0DDE,x         ; $0E8D48   |
    RTS                 ; $0E8D4B   |

CODE_0E8D4C:
    LDY $0DDF,x         ; $0E8D4C   |
    LDA $8D2B,y         ; $0E8D4F   |
    AND #$FF            ; $0E8D52   |
    STA $0DE6,x         ; $0E8D54   |
    LDA $8D27,y         ; $0E8D57   |
    EOR $0DE7,x         ; $0E8D5A   |
    STA $0DE7,x         ; $0E8D5D   |
    LDA #$06            ; $0E8D60   |
    STA $0DEF,x         ; $0E8D62   |

CODE_0E8D65:
    RTS                 ; $0E8D65   |

    TYX                 ; $0E8D66   |
    LDA $0DC7,x         ; $0E8D67   |
    INC A               ; $0E8D6A   |
    CMP #$02            ; $0E8D6B   |
    BCC CODE_0E8D77     ; $0E8D6D   |
    EOR $0DD6,x         ; $0E8D6F   |
    BMI CODE_0E8D77     ; $0E8D72   |
    STZ $0DD6,x         ; $0E8D74   |

CODE_0E8D77:
    LDA $0DCF,x         ; $0E8D77   |
    BMI CODE_0E8D9A     ; $0E8D7A   |
    LDA $0DD6,x         ; $0E8D7C   |
    BEQ CODE_0E8D86     ; $0E8D7F   |
    DEC $0DEE,x         ; $0E8D81   |
    BNE CODE_0E8D95     ; $0E8D84   |

CODE_0E8D86:
    LDA #$20            ; $0E8D86   |
    STA $0DEF,x         ; $0E8D88   |
    STZ $0DD6,x         ; $0E8D8B   |
    STZ $0DDF,x         ; $0E8D8E   |
    STZ $0DDE,x         ; $0E8D91   |
    RTS                 ; $0E8D94   |

CODE_0E8D95:
    LDA #$F0            ; $0E8D95   |
    STA $0DD7,x         ; $0E8D97   |

CODE_0E8D9A:
    RTS                 ; $0E8D9A   |

CODE_0E8D9B:
    LDA $0DD7,x         ; $0E8D9B   |
    CLC                 ; $0E8D9E   |
    ADC #$01            ; $0E8D9F   |
    CMP #$10            ; $0E8DA1   |
    BMI CODE_0E8DA7     ; $0E8DA3   |
    LDA #$10            ; $0E8DA5   |

CODE_0E8DA7:
    STA $0DD7,x         ; $0E8DA7   |
    LDA $0DD6,x         ; $0E8DAA   |
    BPL CODE_0E8DBD     ; $0E8DAD   |
    CLC                 ; $0E8DAF   |
    ADC $0DC6,x         ; $0E8DB0   |
    STA $0DC6,x         ; $0E8DB3   |
    LDA $0DC7,x         ; $0E8DB6   |
    SBC #$00            ; $0E8DB9   |
    BRA CODE_0E8DC9     ; $0E8DBB   |

CODE_0E8DBD:
    CLC                 ; $0E8DBD   |
    ADC $0DC6,x         ; $0E8DBE   |
    STA $0DC6,x         ; $0E8DC1   |
    LDA $0DC7,x         ; $0E8DC4   |
    ADC #$00            ; $0E8DC7   |

CODE_0E8DC9:
    STA $0DC7,x         ; $0E8DC9   |
    LDA $0DD7,x         ; $0E8DCC   |
    BPL CODE_0E8DDF     ; $0E8DCF   |
    CLC                 ; $0E8DD1   |
    ADC $0DCE,x         ; $0E8DD2   |
    STA $0DCE,x         ; $0E8DD5   |
    LDA $0DCF,x         ; $0E8DD8   |
    SBC #$00            ; $0E8DDB   |
    BRA CODE_0E8DEB     ; $0E8DDD   |

CODE_0E8DDF:
    CLC                 ; $0E8DDF   |
    ADC $0DCE,x         ; $0E8DE0   |
    STA $0DCE,x         ; $0E8DE3   |
    LDA $0DCF,x         ; $0E8DE6   |
    ADC #$00            ; $0E8DE9   |

CODE_0E8DEB:
    BMI CODE_0E8DFA     ; $0E8DEB   |
    EOR $0DD7,x         ; $0E8DED   |
    BMI CODE_0E8DFA     ; $0E8DF0   |
    STZ $0DD7,x         ; $0E8DF2   |
    LDA #$00            ; $0E8DF5   |
    STA $0DCE,x         ; $0E8DF7   |

CODE_0E8DFA:
    STA $0DCF,x         ; $0E8DFA   |
    RTS                 ; $0E8DFD   |

.init_incoming_chomp_falling_shadow
    JSR CODE_0E8E6B     ; $0E8DFE   |
    RTL                 ; $0E8E01   |

DATA_0E8E02:         dw $FF05, $0E0C, $0A0A

.main_incoming_chomp_falling_shadow
    LDY $7041,x         ; $0E8E08   |
    BPL CODE_0E8E11     ; $0E8E0B   |
    JSL $03ABFA         ; $0E8E0D   |

CODE_0E8E11:
    JSL $03AF23         ; $0E8E11   |
    LDA $0030           ; $0E8E15   |
    CMP $18,x           ; $0E8E18   |
    BEQ CODE_0E8E22     ; $0E8E1A   |
    LDA #$0004          ; $0E8E1C   |
    STA $74A2,x         ; $0E8E1F   |

CODE_0E8E22:
    LDA $78,x           ; $0E8E22   |
    BEQ CODE_0E8E3B     ; $0E8E24   |
    LDY $7722,x         ; $0E8E26   |
    BMI CODE_0E8E37     ; $0E8E29   |
    LDA #$0004          ; $0E8E2B   |
    STA $7402,x         ; $0E8E2E   |
    LDA #$2081          ; $0E8E31   |
    STA $7040,x         ; $0E8E34   |

CODE_0E8E37:
    JMP CODE_0E03A3     ; $0E8E37   |

CODE_0E8E3B:
    LDA $7AF6,x         ; $0E8E3B   |
    BNE CODE_0E8E55     ; $0E8E3E   |
    LDY $7722,x         ; $0E8E40   |
    BMI CODE_0E8E6A     ; $0E8E43   |
    LDA #$0004          ; $0E8E45   |
    STA $7402,x         ; $0E8E48   |
    LDA #$2081          ; $0E8E4B   |
    STA $7040,x         ; $0E8E4E   |
    JMP CODE_0E03AE     ; $0E8E51   |

CODE_0E8E55:
    LDA $7A36,x         ; $0E8E55   |
    CLC                 ; $0E8E58   |
    ADC #$0010          ; $0E8E59   |
    CMP #$01FF          ; $0E8E5C   |
    BMI CODE_0E8E64     ; $0E8E5F   |
    LDA #$01FF          ; $0E8E61   |

CODE_0E8E64:
    STA $7A36,x         ; $0E8E64   |
    JSR CODE_0E8E6B     ; $0E8E67   |

CODE_0E8E6A:
    RTL                 ; $0E8E6A   |

CODE_0E8E6B:
    LDA $7A36,x         ; $0E8E6B   |
    AND #$00FF          ; $0E8E6E   |
    ASL A               ; $0E8E71   |
    ASL A               ; $0E8E72   |
    XBA                 ; $0E8E73   |
    TAY                 ; $0E8E74   |
    SEP #$20            ; $0E8E75   |
    LDA $7042,x         ; $0E8E77   |
    AND #$F1            ; $0E8E7A   |
    ORA $8E04,y         ; $0E8E7C   |
    STA $7042,x         ; $0E8E7F   |
    REP #$20            ; $0E8E82   |
    LDA #$E0E0          ; $0E8E84   |
    LDY #$54            ; $0E8E87   |
    JSR CODE_0E84DA     ; $0E8E89   |
    RTS                 ; $0E8E8C   |

DATA_0E8E8D:         dw $FF80, $0080

.init_boo_blah
    LDY $7400,x         ; $0E8E91   |
    LDA $8E8D,y         ; $0E8E94   |
    STA $7220,x         ; $0E8E97   |
    LDA $70E2,x         ; $0E8E9A   |
    AND #$0010          ; $0E8E9D   |
    LSR A               ; $0E8EA0   |
    LSR A               ; $0E8EA1   |
    LSR A               ; $0E8EA2   |
    LSR A               ; $0E8EA3   |
    PHP                 ; $0E8EA4   |
    INC A               ; $0E8EA5   |
    STA $00             ; $0E8EA6   |
    PLP                 ; $0E8EA8   |
    BEQ CODE_0E8ED4     ; $0E8EA9   |
    LDA $7042,x         ; $0E8EAB   |
    EOR #$00C0          ; $0E8EAE   |
    STA $7042,x         ; $0E8EB1   |
    LDA $7182,x         ; $0E8EB4   |
    DEC A               ; $0E8EB7   |
    AND #$FFF0          ; $0E8EB8   |
    ORA #$000F          ; $0E8EBB   |
    STA $7182,x         ; $0E8EBE   |
    LDA $75E2,x         ; $0E8EC1   |
    EOR #$FFFF          ; $0E8EC4   |
    INC A               ; $0E8EC7   |
    STA $75E2,x         ; $0E8EC8   |
    LDA $7400,x         ; $0E8ECB   |
    EOR #$0002          ; $0E8ECE   |
    STA $7400,x         ; $0E8ED1   |

CODE_0E8ED4:
    LDA $7360,x         ; $0E8ED4   |
    SEC                 ; $0E8ED7   |
    SBC #$00E2          ; $0E8ED8   |
    ASL A               ; $0E8EDB   |
    ASL A               ; $0E8EDC   |
    PHP                 ; $0E8EDD   |
    CLC                 ; $0E8EDE   |
    ADC $00             ; $0E8EDF   |
    STA $7902,x         ; $0E8EE1   |
    PLP                 ; $0E8EE4   |
    BEQ CODE_0E8F29     ; $0E8EE5   |
    LDA #$0076          ; $0E8EE7   |
    JSL $03A364         ; $0E8EEA   |
    BCS CODE_0E8EF8     ; $0E8EEE   |
    LDA #$00E2          ; $0E8EF0   |
    STA $7360,x         ; $0E8EF3   |
    BRA CODE_0E8F29     ; $0E8EF6   |

CODE_0E8EF8:
    STY $18,x           ; $0E8EF8   |
    LDA $70E2,x         ; $0E8EFA   |
    STA $70E2,y         ; $0E8EFD   |
    LDA $7182,x         ; $0E8F00   |
    SEC                 ; $0E8F03   |
    SBC #$0008          ; $0E8F04   |
    STA $7182,y         ; $0E8F07   |
    LDA #$0000          ; $0E8F0A   |
    STA $7542,y         ; $0E8F0D   |
    INC A               ; $0E8F10   |
    STA $7900,y         ; $0E8F11   |
    LDA $7040,y         ; $0E8F14   |
    AND #$FFF3          ; $0E8F17   |
    STA $7040,y         ; $0E8F1A   |
    LDA #$0100          ; $0E8F1D   |
    STA $7A36,y         ; $0E8F20   |
    LDA #$0005          ; $0E8F23   |
    STA $79D6,y         ; $0E8F26   |

CODE_0E8F29:
    LDY #$03            ; $0E8F29   |
    STY $16,x           ; $0E8F2B   |
    RTL                 ; $0E8F2D   |

DATA_0E8F2E:         dw $90D8, $9138, $9194, $916E
DATA_0E8F36:         dw $9194, $91E0, $9206

DATA_0E8F3D:         db $FF, $04, $00, $FC, $FF, $00, $04, $08
DATA_0E8F45:         db $04, $00, $00, $00, $00, $00, $00, $00
DATA_0E8F4D:         db $00, $00, $00, $00, $00, $00, $02, $00
DATA_0E8F55:         db $02, $00, $0C, $10, $14, $18, $1C, $08
DATA_0E8F5D:         db $1C, $1C, $1C, $00, $00, $00, $00

DATA_0E8F64:         db $04, $04, $04, $04, $06, $07, $08, $09
DATA_0E8F6C:         db $0A, $05, $0B, $0B, $0B, $03, $02, $01
DATA_0E8F74:         db $00, $00, $00, $0F, $00

.main_boo_blah
    LDA $6F00,x         ; $0E8F79   |
    CMP #$0010          ; $0E8F7C   |
    BEQ CODE_0E8FAB     ; $0E8F7F   |
    LDA #$0400          ; $0E8F81   |
    STA $75E2,x         ; $0E8F84   |
    LDA $7360,x         ; $0E8F87   |
    CMP #$00E3          ; $0E8F8A   |
    BNE CODE_0E8FAB     ; $0E8F8D   |
    LDY $18,x           ; $0E8F8F   |
    LDA $79D6,y         ; $0E8F91   |
    CMP #$0005          ; $0E8F94   |
    BMI CODE_0E8FAB     ; $0E8F97   |
    LDA #$0040          ; $0E8F99   |
    STA $7542,y         ; $0E8F9C   |
    LDA #$0004          ; $0E8F9F   |
    STA $79D6,y         ; $0E8FA2   |
    ORA $7040,y         ; $0E8FA5   |
    STA $7040,y         ; $0E8FA8   |

CODE_0E8FAB:
    LDA $7902,x         ; $0E8FAB   |
    AND #$0002          ; $0E8FAE   |
    TAY                 ; $0E8FB1   |
    LDA $7902,x         ; $0E8FB2   |
    AND #$0003          ; $0E8FB5   |
    DEC A               ; $0E8FB8   |
    STA $00             ; $0E8FB9   |
    LDA $7182,x         ; $0E8FBB   |
    SEC                 ; $0E8FBE   |
    SBC $00             ; $0E8FBF   |
    AND #$FFF0          ; $0E8FC1   |
    ORA $8F75,y         ; $0E8FC4   |
    STA $7182,x         ; $0E8FC7   |
    JSL $03AF23         ; $0E8FCA   |
    JSL $03A2F8         ; $0E8FCE   |
    BCC CODE_0E8FE5     ; $0E8FD2   |
    LDY $7360,x         ; $0E8FD4   |
    CPY #$E2            ; $0E8FD7   |
    BEQ CODE_0E8FE4     ; $0E8FD9   |
    LDA $18,x           ; $0E8FDB   |
    TAX                 ; $0E8FDD   |
    JSL $03A31E         ; $0E8FDE   |
    LDX $12             ; $0E8FE2   |

CODE_0E8FE4:
    RTL                 ; $0E8FE4   |

CODE_0E8FE5:
    LDY $7D36,x         ; $0E8FE5   |
    DEY                 ; $0E8FE8   |
    BMI CODE_0E9002     ; $0E8FE9   |
    LDA $6F00,y         ; $0E8FEB   |
    CMP #$0010          ; $0E8FEE   |
    BNE CODE_0E9002     ; $0E8FF1   |
    LDA $7D38,y         ; $0E8FF3   |
    BEQ CODE_0E9002     ; $0E8FF6   |
    LDY #$02            ; $0E8FF8   |
    STY $76,x           ; $0E8FFA   |
    STZ $7A98,x         ; $0E8FFC   |
    STZ $7220,x         ; $0E8FFF   |

CODE_0E9002:
    TXY                 ; $0E9002   |
    LDA $76,x           ; $0E9003   |
    ASL A               ; $0E9005   |
    TAX                 ; $0E9006   |
    JSR ($8F2E,x)       ; $0E9007   |

    LDA $7902,x         ; $0E900A   |
    AND #$0002          ; $0E900D   |
    BEQ CODE_0E903E     ; $0E9010   |
    AND $7860,x         ; $0E9012   |
    BNE CODE_0E903E     ; $0E9015   |
    LDA $7220,x         ; $0E9017   |
    EOR #$FFFF          ; $0E901A   |
    INC A               ; $0E901D   |
    STA $7220,x         ; $0E901E   |
    LDA $7400,x         ; $0E9021   |
    EOR #$0002          ; $0E9024   |
    STA $7400,x         ; $0E9027   |
    LDA $70E2,x         ; $0E902A   |
    SEC                 ; $0E902D   |
    SBC $72C0,x         ; $0E902E   |
    STA $70E2,x         ; $0E9031   |
    LDA $7182,x         ; $0E9034   |
    SEC                 ; $0E9037   |
    SBC $72C2,x         ; $0E9038   |
    STA $7182,x         ; $0E903B   |

CODE_0E903E:
    LDA $7902,x         ; $0E903E   |
    AND #$0004          ; $0E9041   |
    BEQ CODE_0E90C5     ; $0E9044   |
    LDY $7402,x         ; $0E9046   |
    LDA $8F53,y         ; $0E9049   |
    AND #$00FF          ; $0E904C   |
    SEC                 ; $0E904F   |
    SBC #$0004          ; $0E9050   |
    STA $00             ; $0E9053   |
    LDA $8F42,y         ; $0E9055   |
    AND #$00FF          ; $0E9058   |
    EOR #$FFFF          ; $0E905B   |
    INC A               ; $0E905E   |
    LDY $7042,x         ; $0E905F   |
    BPL CODE_0E9071     ; $0E9062   |
    LDY $7400,x         ; $0E9064   |
    BNE CODE_0E906D     ; $0E9067   |
    EOR #$FFFF          ; $0E9069   |
    INC A               ; $0E906C   |

CODE_0E906D:
    INY                 ; $0E906D   |
    INY                 ; $0E906E   |
    BRA CODE_0E907A     ; $0E906F   |

CODE_0E9071:
    LDY $7400,x         ; $0E9071   |
    BEQ CODE_0E907A     ; $0E9074   |
    EOR #$FFFF          ; $0E9076   |
    INC A               ; $0E9079   |

CODE_0E907A:
    CLC                 ; $0E907A   |
    ADC $8F3C,y         ; $0E907B   |
    LDY $18,x           ; $0E907E   |
    CLC                 ; $0E9080   |
    ADC $70E2,x         ; $0E9081   |
    STA $70E2,y         ; $0E9084   |
    LDA $7A36,y         ; $0E9087   |
    STA $300C           ; $0E908A   |
    LDA #$0008          ; $0E908D   |
    STA $3000           ; $0E9090   |
    PHX                 ; $0E9093   |
    PHY                 ; $0E9094   |
    LDX #$0B            ; $0E9095   |
    LDA #$86B6          ; $0E9097   |
    JSL $7EDE44         ; $0E909A   | GSU init
    PLY                 ; $0E909E   |
    PLX                 ; $0E909F   |
    LDA $00             ; $0E90A0   |
    CLC                 ; $0E90A2   |
    ADC $3000           ; $0E90A3   |
    CLC                 ; $0E90A6   |
    ADC #$0008          ; $0E90A7   |
    STA $00             ; $0E90AA   |
    LDA $7902,x         ; $0E90AC   |
    AND #$0002          ; $0E90AF   |
    BEQ CODE_0E90BC     ; $0E90B2   |
    LDA $00             ; $0E90B4   |
    EOR #$FFFF          ; $0E90B6   |
    INC A               ; $0E90B9   |
    STA $00             ; $0E90BA   |

CODE_0E90BC:
    LDA $7182,x         ; $0E90BC   |
    SEC                 ; $0E90BF   |
    SBC $00             ; $0E90C0   |
    STA $7182,y         ; $0E90C2   |

CODE_0E90C5:
    JSR CODE_0E9267     ; $0E90C5   |
    LDY $7402,x         ; $0E90C8   |
    LDA $8F64,y         ; $0E90CB   |
    AND #$00FF          ; $0E90CE   |
    STA $78,x           ; $0E90D1   |
    RTL                 ; $0E90D3   |

DATA_0E90D4:         db $08, $02, $06, $06

    TYX                 ; $0E90D8   |
    LDA $7A98,x         ; $0E90D9   |
    BNE CODE_0E910D     ; $0E90DC   |
    LDA $7402,x         ; $0E90DE   |
    INC A               ; $0E90E1   |
    AND #$0003          ; $0E90E2   |
    STA $7402,x         ; $0E90E5   |
    TAY                 ; $0E90E8   |
    BNE CODE_0E9104     ; $0E90E9   |
    DEC $16,x           ; $0E90EB   |
    BNE CODE_0E9104     ; $0E90ED   |
    LDY #$16            ; $0E90EF   |
    STY $16,x           ; $0E90F1   |
    STZ $7220,x         ; $0E90F3   |
    LDA #$0034          ; $0E90F6   |\ play sound #$0034
    JSL $0085D2         ; $0E90F9   |/
    INC $76,x           ; $0E90FD   |
    LDA #$0002          ; $0E90FF   |
    BRA CODE_0E910A     ; $0E9102   |

CODE_0E9104:
    LDA $90D4,y         ; $0E9104   |
    AND #$00FF          ; $0E9107   |

CODE_0E910A:
    STA $7A98,x         ; $0E910A   |

CODE_0E910D:
    RTS                 ; $0E910D   |

DATA_0E910E:         db $01, $09, $04, $05, $06, $07, $08, $0B
DATA_0E9116:         db $0C, $0B, $0A, $0B, $0C, $0B, $0A, $08
DATA_0E911E:         db $07, $06, $05, $04, $09, $02, $02, $02
DATA_0E9126:         db $02, $02, $02, $08, $04, $04, $04, $04
DATA_0E912E:         db $04, $04, $04, $04, $08, $02, $02, $02
DATA_0E9136:         db $02, $02

    TYX                 ; $0E9138   |
    LDA $7A98,x         ; $0E9139   |
    BNE CODE_0E916D     ; $0E913C   |
    DEC $16,x           ; $0E913E   |
    BNE CODE_0E9159     ; $0E9140   |
    LDY #$04            ; $0E9142   |
    STY $16,x           ; $0E9144   |
    LDA $7902,x         ; $0E9146   |
    AND #$0002          ; $0E9149   |
    EOR $7400,x         ; $0E914C   |
    TAY                 ; $0E914F   |
    LDA $8E8D,y         ; $0E9150   |
    STA $7220,x         ; $0E9153   |
    DEC $76,x           ; $0E9156   |
    RTS                 ; $0E9158   |

CODE_0E9159:
    LDY $16,x           ; $0E9159   |
    LDA $910D,y         ; $0E915B   |
    AND #$00FF          ; $0E915E   |
    STA $7402,x         ; $0E9161   |
    LDA $9122,y         ; $0E9164   |
    AND #$00FF          ; $0E9167   |
    STA $7A98,x         ; $0E916A   |

CODE_0E916D:
    RTS                 ; $0E916D   |

    TYX                 ; $0E916E   |
    LDA $7A98,x         ; $0E916F   |
    BNE CODE_0E916D     ; $0E9172   |
    INC $78,x           ; $0E9174   |
    LDY $78,x           ; $0E9176   |
    CPY #$04            ; $0E9178   |
    BMI CODE_0E91CB     ; $0E917A   |
    BRA CODE_0E91B0     ; $0E917C   |

DATA_0E917E:         db $10, $0F, $0E, $0D, $01, $09, $04, $05
DATA_0E9186:         db $06, $07, $08, $06, $03, $02, $01, $02
DATA_0E918E:         db $02, $02, $02, $02, $02, $02

    TYX                 ; $0E9194   |
    LDA $7A98,x         ; $0E9195   |
    BNE CODE_0E91DF     ; $0E9198   |
    DEC $78,x           ; $0E919A   |
    BPL CODE_0E91CB     ; $0E919C   |
    LDY $76,x           ; $0E919E   |
    CPY #$02            ; $0E91A0   |
    BNE CODE_0E91C0     ; $0E91A2   |
    TYA                 ; $0E91A4   |
    STA $7A98,x         ; $0E91A5   |
    INC $76,x           ; $0E91A8   |
    RTS                 ; $0E91AA   |

CODE_0E91AB:
    LDY $7900,x         ; $0E91AB   |
    BNE CODE_0E91C0     ; $0E91AE   |

CODE_0E91B0:
    LDY #$04            ; $0E91B0   |
    STY $16,x           ; $0E91B2   |
    LDY $7400,x         ; $0E91B4   |
    LDA $8E8D,y         ; $0E91B7   |
    STA $7220,x         ; $0E91BA   |
    STZ $76,x           ; $0E91BD   |
    RTS                 ; $0E91BF   |

CODE_0E91C0:
    LDA #$0002          ; $0E91C0   |
    STA $7A98,x         ; $0E91C3   |
    LDY #$06            ; $0E91C6   |
    STY $76,x           ; $0E91C8   |
    RTS                 ; $0E91CA   |

CODE_0E91CB:
    LDY $78,x           ; $0E91CB   |
    LDA $917E,y         ; $0E91CD   |
    AND #$00FF          ; $0E91D0   |
    STA $7402,x         ; $0E91D3   |
    LDA $9189,y         ; $0E91D6   |
    AND #$00FF          ; $0E91D9   |
    STA $7A98,x         ; $0E91DC   |

CODE_0E91DF:
    RTS                 ; $0E91DF   |

    TYX                 ; $0E91E0   |
    LDA $7A98,x         ; $0E91E1   |
    BNE CODE_0E91DF     ; $0E91E4   |
    DEC $78,x           ; $0E91E6   |
    LDY $78,x           ; $0E91E8   |
    CPY #$04            ; $0E91EA   |
    BPL CODE_0E91CB     ; $0E91EC   |
    BRA CODE_0E91AB     ; $0E91EE   |

DATA_0E91F0:         dw $F900, $F900, $F900, $F900
DATA_0E91F8:         dw $F980, $FA00, $FA80, $FB00
DATA_0E9200:         dw $FC00, $FD00, $FE00

    TYX                 ; $0E9206   |
    LDA $7A98,x         ; $0E9207   |
    BNE CODE_0E91DF     ; $0E920A   |
    INC $78,x           ; $0E920C   |
    LDY $78,x           ; $0E920E   |
    CPY #$04            ; $0E9210   |
    BNE CODE_0E921B     ; $0E9212   |
    LDA $7900,x         ; $0E9214   |
    BNE CODE_0E91CB     ; $0E9217   |
    BRA CODE_0E91B0     ; $0E9219   |

CODE_0E921B:
    CPY #$08            ; $0E921B   |
    BMI CODE_0E91CB     ; $0E921D   |
    LDA $7900,x         ; $0E921F   |
    BEQ CODE_0E9244     ; $0E9222   |
    LDA $7A38,x         ; $0E9224   |
    ASL A               ; $0E9227   |
    TAY                 ; $0E9228   |
    CPY #$15            ; $0E9229   |
    BMI CODE_0E922F     ; $0E922B   |
    LDY #$14            ; $0E922D   |

CODE_0E922F:
    LDA $91F0,y         ; $0E922F   |
    STA $60AA           ; $0E9232   |
    LDA #$0006          ; $0E9235   |
    STA $60C0           ; $0E9238   |
    LDA #$8001          ; $0E923B   |
    STA $60D2           ; $0E923E   |
    STZ $7900,x         ; $0E9241   |

CODE_0E9244:
    CPY #$0B            ; $0E9244   |
    BMI CODE_0E91CB     ; $0E9246   |
    LDY $7900,x         ; $0E9248   |
    BNE CODE_0E9253     ; $0E924B   |
    LDA #$0008          ; $0E924D   |
    STA $7A98,x         ; $0E9250   |

CODE_0E9253:
    DEC $76,x           ; $0E9253   |
    RTS                 ; $0E9255   |

DATA_0E9256:         db $10, $10, $10, $10, $18, $1C, $1E, $1F
DATA_0E925E:         db $20, $10, $20, $20, $20, $08, $08, $04
DATA_0E9266:         db $03

CODE_0E9267:
    LDY $7402,x         ; $0E9267   |
    LDA $9256,y         ; $0E926A   |
    AND #$00FF          ; $0E926D   |
    SEC                 ; $0E9270   |
    SBC #$0010          ; $0E9271   |
    STA $00             ; $0E9274   |
    LDA $6120           ; $0E9276   |
    CLC                 ; $0E9279   |
    ADC $7BB6,x         ; $0E927A   |
    STA $02             ; $0E927D   |
    ASL A               ; $0E927F   |
    STA $04             ; $0E9280   |
    LDA $7902,x         ; $0E9282   |
    AND #$0002          ; $0E9285   |
    BEQ CODE_0E928D     ; $0E9288   |
    JMP CODE_0E9336     ; $0E928A   |

CODE_0E928D:
    LDY $76,x           ; $0E928D   |
    CPY #$02            ; $0E928F   |
    BMI CODE_0E92BB     ; $0E9291   |
    LDY $7900,x         ; $0E9293   |
    BEQ CODE_0E92BB     ; $0E9296   |
    LDA $7C16,x         ; $0E9298   |
    CLC                 ; $0E929B   |
    ADC $02             ; $0E929C   |
    CMP $04             ; $0E929E   |
    BCS CODE_0E92B7     ; $0E92A0   |
    LDY $60C0           ; $0E92A2   |
    BEQ CODE_0E92FD     ; $0E92A5   |
    LDY $60AB           ; $0E92A7   |
    BPL CODE_0E92FD     ; $0E92AA   |
    LDA $78,x           ; $0E92AC   |
    STA $7A38,x         ; $0E92AE   |
    LDY #$06            ; $0E92B1   |
    STY $76,x           ; $0E92B3   |
    BRA CODE_0E92FD     ; $0E92B5   |

CODE_0E92B7:
    STZ $7900,x         ; $0E92B7   |
    RTS                 ; $0E92BA   |

CODE_0E92BB:
    LDA $7C16,x         ; $0E92BB   |
    CLC                 ; $0E92BE   |
    ADC $02             ; $0E92BF   |
    CMP $04             ; $0E92C1   |
    BCS CODE_0E9335     ; $0E92C3   |
    LDA $6122           ; $0E92C5   |
    EOR #$FFFF          ; $0E92C8   |
    INC A               ; $0E92CB   |
    STA $02             ; $0E92CC   |
    CLC                 ; $0E92CE   |
    ADC #$0008          ; $0E92CF   |
    STA $04             ; $0E92D2   |
    LDA $00             ; $0E92D4   |
    SEC                 ; $0E92D6   |
    SBC $7182,x         ; $0E92D7   |
    CLC                 ; $0E92DA   |
    ADC $611E           ; $0E92DB   |
    CMP $02             ; $0E92DE   |
    BMI CODE_0E9335     ; $0E92E0   |
    CMP $04             ; $0E92E2   |
    BPL CODE_0E9324     ; $0E92E4   |
    LDY $60C0           ; $0E92E6   |
    BEQ CODE_0E9335     ; $0E92E9   |
    LDY $60AB           ; $0E92EB   |
    BMI CODE_0E9335     ; $0E92EE   |
    STZ $7A38,x         ; $0E92F0   |
    LDY #$04            ; $0E92F3   |
    STY $76,x           ; $0E92F5   |
    STZ $7A98,x         ; $0E92F7   |
    STZ $7220,x         ; $0E92FA   |

CODE_0E92FD:
    LDA $7182,x         ; $0E92FD   |
    SEC                 ; $0E9300   |
    SBC $00             ; $0E9301   |
    SEC                 ; $0E9303   |
    SBC $6122           ; $0E9304   |
    SEC                 ; $0E9307   |
    SBC $611E           ; $0E9308   |
    CLC                 ; $0E930B   |
    ADC $6090           ; $0E930C   |
    INC A               ; $0E930F   |
    INC A               ; $0E9310   |
    STA $6090           ; $0E9311   |
    LDA #$0001          ; $0E9314   |
    STA $7900,x         ; $0E9317   |
    STZ $60AA           ; $0E931A   |
    STZ $60D4           ; $0E931D   |
    INC $61B4           ; $0E9320   |
    RTS                 ; $0E9323   |

CODE_0E9324:
    SEC                 ; $0E9324   |
    SBC $00             ; $0E9325   |
    SEC                 ; $0E9327   |
    SBC #$0010          ; $0E9328   |
    SEC                 ; $0E932B   |
    SBC $6122           ; $0E932C   |
    BPL CODE_0E9335     ; $0E932F   |
    JSL $03A858         ; $0E9331   |

CODE_0E9335:
    RTS                 ; $0E9335   |

CODE_0E9336:
    LDA $7C16,x         ; $0E9336   |
    CLC                 ; $0E9339   |
    ADC $02             ; $0E933A   |
    CMP $04             ; $0E933C   |
    BCS CODE_0E9363     ; $0E933E   |
    LDA $6122           ; $0E9340   |
    CLC                 ; $0E9343   |
    ADC $7BB8,x         ; $0E9344   |
    STA $02             ; $0E9347   |
    LDA $00             ; $0E9349   |
    PHA                 ; $0E934B   |
    LSR A               ; $0E934C   |
    CLC                 ; $0E934D   |
    ADC $02             ; $0E934E   |
    ASL A               ; $0E9350   |
    STA $04             ; $0E9351   |
    PLA                 ; $0E9353   |
    CLC                 ; $0E9354   |
    ADC $7C18,x         ; $0E9355   |
    CLC                 ; $0E9358   |
    ADC $02             ; $0E9359   |
    CMP $04             ; $0E935B   |
    BCS CODE_0E9363     ; $0E935D   |
    JSL $03A858         ; $0E935F   |

CODE_0E9363:
    RTS                 ; $0E9363   |

DATA_0E9364:         db $40, $FF, $C0
DATA_0E9367:         db $00, $10, $20
DATA_0E936A:         dw $FFE0, $0130

.init_flightless_goonie
    INC $18,x           ; $0E936E   |
    LDA #$000C          ; $0E9370   |
    STA $7402,x         ; $0E9373   |
    LDY #$04            ; $0E9376   |
    STY $76,x           ; $0E9378   |
    LDA $7900,x         ; $0E937A   |
    INC A               ; $0E937D   |
    BEQ CODE_0E93E0     ; $0E937E   |
    LDA #$0002          ; $0E9380   |
    STA $00             ; $0E9383   |
    STA $18,x           ; $0E9385   |
    LDA $7CD6,x         ; $0E9387   |
    SEC                 ; $0E938A   |
    SBC $611C           ; $0E938B   |
    STA $04             ; $0E938E   |
    LDA $7CD8,x         ; $0E9390   |
    SEC                 ; $0E9393   |
    SBC $611E           ; $0E9394   |
    STA $06             ; $0E9397   |

CODE_0E9399:
    LDY $00             ; $0E9399   |
    LDA $9367,y         ; $0E939B   |
    AND #$00FF          ; $0E939E   |
    STA $02             ; $0E93A1   |
    LDA #$00E9          ; $0E93A3   |
    JSL $03A364         ; $0E93A6   |
    BCC CODE_0E93E0     ; $0E93AA   |
    LDA $70E2,x         ; $0E93AC   |
    STA $70E2,y         ; $0E93AF   |
    LDA $7182,x         ; $0E93B2   |
    STA $7182,y         ; $0E93B5   |
    LDA $7400,x         ; $0E93B8   |
    STA $7400,y         ; $0E93BB   |
    LDA $02             ; $0E93BE   |
    STA $7A96,y         ; $0E93C0   |
    LDA #$000C          ; $0E93C3   |
    STA $7402,y         ; $0E93C6   |
    LDA #$0004          ; $0E93C9   |
    STA $79D6,y         ; $0E93CC   |
    STA $7978,y         ; $0E93CF   |
    LDA $04             ; $0E93D2   |
    STA $7C16,y         ; $0E93D4   |
    LDA $06             ; $0E93D7   |
    STA $7C18,y         ; $0E93D9   |
    DEC $00             ; $0E93DC   |
    BNE CODE_0E9399     ; $0E93DE   |

CODE_0E93E0:
    BRA CODE_0E943B     ; $0E93E0   |

.init_goonie
    LDA $7900,x         ; $0E93E2   |
    INC A               ; $0E93E5   |
    BEQ CODE_0E9433     ; $0E93E6   |
    LDA $7182,x         ; $0E93E8   |
    BIT #$0010          ; $0E93EB   |
    BEQ CODE_0E942D     ; $0E93EE   |
    AND #$FFE0          ; $0E93F0   |
    STA $7902,x         ; $0E93F3   |
    LDA $70E2,x         ; $0E93F6   |
    AND #$0010          ; $0E93F9   |
    LSR A               ; $0E93FC   |
    LSR A               ; $0E93FD   |
    LSR A               ; $0E93FE   |
    TAY                 ; $0E93FF   |
    LDA $936A,y         ; $0E9400   |
    STA $7A36,x         ; $0E9403   |
    LDA #$00FF          ; $0E9406   |
    STA $74A2,x         ; $0E9409   |
    LDA #$0060          ; $0E940C   |
    STA $6FA0,x         ; $0E940F   |
    LDA #$4000          ; $0E9412   |
    STA $6FA2,x         ; $0E9415   |
    LDA #$0002          ; $0E9418   |
    STA $7040,x         ; $0E941B   |
    STZ $7542,x         ; $0E941E   |
    INC $7A38,x         ; $0E9421   |
    LDY $0C7C           ; $0E9424   |
    BNE CODE_0E942C     ; $0E9427   |
    INC $0C7C           ; $0E9429   |

CODE_0E942C:
    RTL                 ; $0E942C   |

CODE_0E942D:
    LDA $7900,x         ; $0E942D   |
    INC A               ; $0E9430   |
    BNE CODE_0E9463     ; $0E9431   |

CODE_0E9433:
    INC $18,x           ; $0E9433   |
    LDA #$0040          ; $0E9435   |
    STA $7A96,x         ; $0E9438   |

CODE_0E943B:
    LDA #$000C          ; $0E943B   |
    STA $7402,x         ; $0E943E   |
    LDA #$0003          ; $0E9441   |
    STA $7A98,x         ; $0E9444   |
    INC A               ; $0E9447   |
    STA $76,x           ; $0E9448   |
    LDA #$0040          ; $0E944A   |
    STA $7542,x         ; $0E944D   |
    LDA #$0400          ; $0E9450   |
    STA $75E2,x         ; $0E9453   |
    LDA #$0841          ; $0E9456   |
    STA $6FA2,x         ; $0E9459   |
    LDA #$6C00          ; $0E945C   |
    STA $6FA0,x         ; $0E945F   |
    RTL                 ; $0E9462   |

CODE_0E9463:
    STZ $7900,x         ; $0E9463   |
    LDA $70E2,x         ; $0E9466   |
    PHA                 ; $0E9469   |
    SEC                 ; $0E946A   |
    SBC $6094           ; $0E946B   |
    STA $00             ; $0E946E   |
    PLA                 ; $0E9470   |
    AND #$0010          ; $0E9471   |
    EOR #$0010          ; $0E9474   |
    DEC A               ; $0E9477   |
    EOR $00             ; $0E9478   |
    BMI CODE_0E9496     ; $0E947A   |
    LDA #$00FF          ; $0E947C   |
    STA $74A2,x         ; $0E947F   |
    LDA #$6860          ; $0E9482   |
    STA $6FA0,x         ; $0E9485   |
    LDA #$000E          ; $0E9488   |
    STA $7BB6,x         ; $0E948B   |
    STZ $7542,x         ; $0E948E   |
    LDY #$05            ; $0E9491   |
    STY $76,x           ; $0E9493   |
    RTL                 ; $0E9495   |

CODE_0E9496:
    LDA $10             ; $0E9496   |
    AND #$0001          ; $0E9498   |
    CLC                 ; $0E949B   |
    ADC #$0003          ; $0E949C   |
    STA $16,x           ; $0E949F   |
    LDY $7400,x         ; $0E94A1   |
    LDA $98A5,y         ; $0E94A4   |
    STA $7220,x         ; $0E94A7   |
    INC $76,x           ; $0E94AA   |
    LDA #$0004          ; $0E94AC   |
    STA $7A98,x         ; $0E94AF   |
    LDA #$0020          ; $0E94B2   |
    STA $75E2,x         ; $0E94B5   |
    LDA $7360,x         ; $0E94B8   |
    CMP #$0153          ; $0E94BB   |
    BNE CODE_0E94C3     ; $0E94BE   |
    JSR CODE_0E94C4     ; $0E94C0   |

CODE_0E94C3:
    RTL                 ; $0E94C3   |

CODE_0E94C4:
    TXY                 ; $0E94C4   |
    LDA #$001E          ; $0E94C5   |
    JSL $03A366         ; $0E94C8   |
    BCC CODE_0E9509     ; $0E94CC   |
    LDA $70E2,x         ; $0E94CE   |
    STA $70E2,y         ; $0E94D1   |
    LDA $7182,x         ; $0E94D4   |
    CLC                 ; $0E94D7   |
    ADC #$0010          ; $0E94D8   |
    STA $7182,y         ; $0E94DB   |
    LDA #$0003          ; $0E94DE   |
    STA $79D6,y         ; $0E94E1   |
    ASL A               ; $0E94E4   |
    STA $7402,y         ; $0E94E5   |
    LDA $7400,x         ; $0E94E8   |
    STA $7400,y         ; $0E94EB   |
    LDA #$0001          ; $0E94EE   |
    STA $7902,y         ; $0E94F1   |
    STY $78,x           ; $0E94F4   |
    LDA #$000F          ; $0E94F6   |
    STA $7402,x         ; $0E94F9   |
    LDY $7400,x         ; $0E94FC   |
    LDA $98A5,y         ; $0E94FF   |
    STA $7220,x         ; $0E9502   |
    LDY #$06            ; $0E9505   |
    STY $76,x           ; $0E9507   |

CODE_0E9509:
    LDA #$00E8          ; $0E9509   |
    STA $7360,x         ; $0E950C   |
    RTS                 ; $0E950F   |

DATA_0E9510:         dw $98A9, $98EF, $9939, $995F
DATA_0E9518:         dw $999B, $99D0, $9A2F

.main_goonie
    LDY $7A38,x         ; $0E951E   |
    BNE CODE_0E9561     ; $0E9521   |
    LDA $7D96,x         ; $0E9523   |
    BEQ CODE_0E952B     ; $0E9526   |
    STZ $6FA2,x         ; $0E9528   |

CODE_0E952B:
    LDY $76,x           ; $0E952B   |
    CPY #$05            ; $0E952D   |
    BNE CODE_0E9537     ; $0E952F   |
    JSL $03AF23         ; $0E9531   |
    BRA CODE_0E9541     ; $0E9535   |

CODE_0E9537:
    JSR CODE_0E95AE     ; $0E9537   |
    JSL $03AF23         ; $0E953A   |
    JSR CODE_0E971F     ; $0E953E   |

CODE_0E9541:
    TXY                 ; $0E9541   |
    LDA $76,x           ; $0E9542   |
    ASL A               ; $0E9544   |
    TAX                 ; $0E9545   |
    JSR ($9510,x)       ; $0E9546   |

    LDY $76,x           ; $0E9549   |
    CPY #$04            ; $0E954B   |
    BEQ CODE_0E9557     ; $0E954D   |
    CPY #$05            ; $0E954F   |
    BEQ CODE_0E9560     ; $0E9551   |
    JSR CODE_0E9638     ; $0E9553   |
    RTL                 ; $0E9556   |

CODE_0E9557:
    LDA $7AF8,x         ; $0E9557   |
    BNE CODE_0E9560     ; $0E955A   |
    JSL $0DC0F0         ; $0E955C   |

CODE_0E9560:
    RTL                 ; $0E9560   |

CODE_0E9561:
    JSL $03AF23         ; $0E9561   |
    LDY $0C7C           ; $0E9565   |
    BEQ CODE_0E9576     ; $0E9568   |
    LDA $7682,x         ; $0E956A   |
    CLC                 ; $0E956D   |
    ADC #$0040          ; $0E956E   |
    CMP #$0160          ; $0E9571   |
    BCC CODE_0E957A     ; $0E9574   |

CODE_0E9576:
    JMP CODE_0E03A3     ; $0E9576   |

CODE_0E957A:
    LDA $7A96,x         ; $0E957A   |
    BNE CODE_0E95AD     ; $0E957D   |
    LDA #$00E8          ; $0E957F   |
    JSL $03A34C         ; $0E9582   |
    BCC CODE_0E95AD     ; $0E9586   |
    LDA $6094           ; $0E9588   |
    AND #$FFEF          ; $0E958B   |
    CLC                 ; $0E958E   |
    ADC $7A36,x         ; $0E958F   |
    STA $70E2,y         ; $0E9592   |
    AND #$0010          ; $0E9595   |
    LSR A               ; $0E9598   |
    LSR A               ; $0E9599   |
    LSR A               ; $0E959A   |
    EOR #$0002          ; $0E959B   |
    STA $7400,y         ; $0E959E   |
    LDA $7902,x         ; $0E95A1   |
    STA $7182,y         ; $0E95A4   |
    LDA #$0100          ; $0E95A7   |
    STA $7A96,x         ; $0E95AA   |

CODE_0E95AD:
    RTL                 ; $0E95AD   |

CODE_0E95AE:
    LDY $6F00,x         ; $0E95AE   |
    CPY #$10            ; $0E95B1   |
    BNE CODE_0E95B6     ; $0E95B3   |
    RTS                 ; $0E95B5   |

CODE_0E95B6:
    LDA #$0040          ; $0E95B6   |
    STA $7542,x         ; $0E95B9   |
    LDA #$0400          ; $0E95BC   |
    STA $75E2,x         ; $0E95BF   |
    CPY #$08            ; $0E95C2   |
    BNE CODE_0E9637     ; $0E95C4   |
    LDY $78,x           ; $0E95C6   |
    BEQ CODE_0E95D2     ; $0E95C8   |
    LDA $7220,x         ; $0E95CA   |
    STA $7220,y         ; $0E95CD   |
    STZ $78,x           ; $0E95D0   |

CODE_0E95D2:
    LDY $18,x           ; $0E95D2   |
    BNE CODE_0E95FD     ; $0E95D4   |
    INC $18,x           ; $0E95D6   |
    LDA #$01FF          ; $0E95D8   |
    JSL $008B21         ; $0E95DB   |
    LDA $70E2,x         ; $0E95DF   |
    STA $70A2,y         ; $0E95E2   |
    LDA $7182,x         ; $0E95E5   |
    STA $7142,y         ; $0E95E8   |
    LDA #$FFFF          ; $0E95EB   |
    STA $7782,y         ; $0E95EE   |
    LDA #$00C0          ; $0E95F1   |
    STA $7E8E,y         ; $0E95F4   |
    LDA #$0020          ; $0E95F7   |
    STA $71E0,y         ; $0E95FA   |

CODE_0E95FD:
    LDY $74A2,x         ; $0E95FD   |
    BPL CODE_0E9608     ; $0E9600   |
    LDA #$FFFF          ; $0E9602   |
    STA $7900,x         ; $0E9605   |

CODE_0E9608:
    LDA $7360,x         ; $0E9608   |
    CMP #$0155          ; $0E960B   |
    BEQ CODE_0E9615     ; $0E960E   |
    CMP #$0158          ; $0E9610   |
    BNE CODE_0E9623     ; $0E9613   |

CODE_0E9615:
    JSR CODE_0E9DC0     ; $0E9615   |
    LDA #$74A2          ; $0E9618   |
    PHA                 ; $0E961B   |
    LDY #$01            ; $0E961C   |
    LDA #$0843          ; $0E961E   |
    BRA CODE_0E962C     ; $0E9621   |

CODE_0E9623:
    LDA #$6C00          ; $0E9623   |
    PHA                 ; $0E9626   |
    LDY #$0C            ; $0E9627   |
    LDA #$0841          ; $0E9629   |

CODE_0E962C:
    STA $6FA2,x         ; $0E962C   |
    TYA                 ; $0E962F   |
    STA $7402,x         ; $0E9630   |
    PLA                 ; $0E9633   |
    STA $6FA0,x         ; $0E9634   |

CODE_0E9637:
    RTS                 ; $0E9637   |

CODE_0E9638:
    TXA                 ; $0E9638   |
    STA $3002           ; $0E9639   |
    LDX #$09            ; $0E963C   |
    LDA #$9011          ; $0E963E   |
    JSL $7EDE44         ; $0E9641   | GSU init
    BRA CODE_0E9650     ; $0E9645   |

CODE_0E9647:
    LDX #$09            ; $0E9647   |
    LDA $301E           ; $0E9649   |
    JSL $7EDE44         ; $0E964C   | GSU init

CODE_0E9650:
    LDX $12             ; $0E9650   |
    LDY $301C           ; $0E9652   |
    BMI CODE_0E9637     ; $0E9655   |
    BEQ CODE_0E9637     ; $0E9657   |
    LDA $6F00,y         ; $0E9659   |
    CMP #$0010          ; $0E965C   |
    BNE CODE_0E9647     ; $0E965F   |
    LDA $7D38,y         ; $0E9661   |
    BEQ CODE_0E9647     ; $0E9664   |
    LDA $7360,y         ; $0E9666   |
    CMP #$0022          ; $0E9669   |
    BCC CODE_0E967A     ; $0E966C   |
    CMP #$002C          ; $0E966E   |
    BCS CODE_0E967A     ; $0E9671   |
    LDA $79D8,y         ; $0E9673   |
    BNE CODE_0E9647     ; $0E9676   |
    BRA CODE_0E9687     ; $0E9678   |

CODE_0E967A:
    LDA $6FA2,y         ; $0E967A   |
    AND #$4000          ; $0E967D   |
    BNE CODE_0E9647     ; $0E9680   |
    TYX                 ; $0E9682   |
    JSL $03B25B         ; $0E9683   |

CODE_0E9687:
    JSR CODE_0E9885     ; $0E9687   |
    INC $18,x           ; $0E968A   |
    LDY $78,x           ; $0E968C   |
    BEQ CODE_0E9698     ; $0E968E   |
    LDA $7220,x         ; $0E9690   |
    STA $7220,y         ; $0E9693   |
    STZ $78,x           ; $0E9696   |

CODE_0E9698:
    LDA $7CD6,x         ; $0E9698   |
    STA $00             ; $0E969B   |
    LDA $7CD8,x         ; $0E969D   |
    STA $02             ; $0E96A0   |
    LDA #$01E7          ; $0E96A2   |
    JSL $03B56E         ; $0E96A5   |
    LDA #$000B          ; $0E96A9   |\ play sound #$000B
    JSL $0085D2         ; $0E96AC   |/
    LDA #$0040          ; $0E96B0   |
    STA $7542,x         ; $0E96B3   |
    LDA #$0400          ; $0E96B6   |
    STA $75E2,x         ; $0E96B9   |
    LDA #$FD00          ; $0E96BC   |
    STA $7222,x         ; $0E96BF   |
    STZ $7220,x         ; $0E96C2   |
    LDA $7360,x         ; $0E96C5   |
    CMP #$00E8          ; $0E96C8   |
    BEQ CODE_0E96F8     ; $0E96CB   |
    CMP #$0153          ; $0E96CD   |
    BEQ CODE_0E96F8     ; $0E96D0   |
    LDA #$0001          ; $0E96D2   |
    STA $7402,x         ; $0E96D5   |
    LDY #$0A            ; $0E96D8   |
    STY $76,x           ; $0E96DA   |
    LDA #$0843          ; $0E96DC   |
    STA $6FA2,x         ; $0E96DF   |
    LDA #$7CA2          ; $0E96E2   |
    STA $6FA0,x         ; $0E96E5   |
    LDY $7400,x         ; $0E96E8   |
    LDA $9A97,y         ; $0E96EB   |
    STA $7220,x         ; $0E96EE   |
    LDA #$0100          ; $0E96F1   |
    STA $7A36,x         ; $0E96F4   |
    RTS                 ; $0E96F7   |

CODE_0E96F8:
    LDA #$000C          ; $0E96F8   |
    STA $7402,x         ; $0E96FB   |
    LDA #$0040          ; $0E96FE   |
    STA $7A96,x         ; $0E9701   |
    LDA #$0010          ; $0E9704   |
    STA $7AF8,x         ; $0E9707   |
    LDY #$04            ; $0E970A   |
    STY $76,x           ; $0E970C   |
    LDA #$0841          ; $0E970E   |
    STA $6FA2,x         ; $0E9711   |
    LDA #$6C00          ; $0E9714   |
    STA $6FA0,x         ; $0E9717   |

CODE_0E971A:
    RTS                 ; $0E971A   |

DATA_0E971B:         dw $FF80, $0080

CODE_0E971F:
    LDA #$6C20          ; $0E971F   |
    LDY $76,x           ; $0E9722   |
    CPY #$04            ; $0E9724   |
    BNE CODE_0E972B     ; $0E9726   |
    LDA #$6C00          ; $0E9728   |

CODE_0E972B:
    STA $6FA0,x         ; $0E972B   |
    CPX $61B6           ; $0E972E   |
    BNE CODE_0E9736     ; $0E9731   |
    STZ $61B6           ; $0E9733   |

CODE_0E9736:
    LDA $7AF6,x         ; $0E9736   |
    BNE CODE_0E971A     ; $0E9739   |
    LDY $76,x           ; $0E973B   |
    CPY #$03            ; $0E973D   |
    BNE CODE_0E974A     ; $0E973F   |
    LDA #$6C60          ; $0E9741   |
    STA $6FA0,x         ; $0E9744   |
    JMP CODE_0E97D0     ; $0E9747   |

CODE_0E974A:
    JSR CODE_0E985E     ; $0E974A   |
    BCS CODE_0E97B4     ; $0E974D   |
    LDA $7C18,x         ; $0E974F   |
    SEC                 ; $0E9752   |
    SBC $02             ; $0E9753   |
    CMP #$FFF6          ; $0E9755   |
    BCC CODE_0E97CB     ; $0E9758   |
    STA $00             ; $0E975A   |
    LDY $76,x           ; $0E975C   |
    CPY #$04            ; $0E975E   |
    BEQ CODE_0E97B5     ; $0E9760   |
    LDY $61B6           ; $0E9762   |
    BNE CODE_0E97B4     ; $0E9765   |
    LDA $60AA           ; $0E9767   |
    BMI CODE_0E97B4     ; $0E976A   |
    CMP #$8000          ; $0E976C   |
    ROR A               ; $0E976F   |
    CMP #$0180          ; $0E9770   |
    BMI CODE_0E9778     ; $0E9773   |
    LDA #$0180          ; $0E9775   |

CODE_0E9778:
    STA $7222,x         ; $0E9778   |
    STZ $7402,x         ; $0E977B   |
    LDA #$0008          ; $0E977E   |
    STA $7A98,x         ; $0E9781   |
    ASL A               ; $0E9784   |
    STA $75E2,x         ; $0E9785   |
    LDY $7400,x         ; $0E9788   |
    LDA $971B,y         ; $0E978B   |
    STA $7220,x         ; $0E978E   |
    LDY #$03            ; $0E9791   |
    STY $76,x           ; $0E9793   |
    LDA $6090           ; $0E9795   |
    SEC                 ; $0E9798   |
    ADC $00             ; $0E9799   |
    INC A               ; $0E979B   |
    STA $6090           ; $0E979C   |
    STZ $60AA           ; $0E979F   |
    STZ $60C0           ; $0E97A2   |
    STZ $60D4           ; $0E97A5   |
    INC $61B4           ; $0E97A8   |
    STX $61B6           ; $0E97AB   |
    LDA #$6C60          ; $0E97AE   |
    STA $6FA0,x         ; $0E97B1   |

CODE_0E97B4:
    RTS                 ; $0E97B4   |

CODE_0E97B5:
    LDX $12             ; $0E97B5   |
    STZ $7220,x         ; $0E97B7   |
    STZ $7540,x         ; $0E97BA   |
    STZ $7222,x         ; $0E97BD   |
    LDA #$FC00          ; $0E97C0   |
    STA $60AA           ; $0E97C3   |
    PLA                 ; $0E97C6   |
    JMP CODE_0E03B5     ; $0E97C7   |

CODE_0E97CB:
    JSL $03A858         ; $0E97CB   |
    RTS                 ; $0E97CF   |

CODE_0E97D0:
    LDA $60FC           ; $0E97D0   |
    AND #$001F          ; $0E97D3   |
    BNE CODE_0E97EC     ; $0E97D6   |
    LDA $6090           ; $0E97D8   |
    CLC                 ; $0E97DB   |
    ADC $72C2,x         ; $0E97DC   |
    STA $6090           ; $0E97DF   |
    LDA $7C18,x         ; $0E97E2   |
    SEC                 ; $0E97E5   |
    SBC $72C2,x         ; $0E97E6   |
    STA $7C18,x         ; $0E97E9   |

CODE_0E97EC:
    LDA $60FC           ; $0E97EC   |
    AND #$01E0          ; $0E97EF   |
    BEQ CODE_0E97FD     ; $0E97F2   |
    AND #$0180          ; $0E97F4   |
    DEC A               ; $0E97F7   |
    EOR $7220,x         ; $0E97F8   |
    BPL CODE_0E9811     ; $0E97FB   |

CODE_0E97FD:
    LDA $608C           ; $0E97FD   |
    CLC                 ; $0E9800   |
    ADC $72C0,x         ; $0E9801   |
    STA $608C           ; $0E9804   |
    LDA $7C16,x         ; $0E9807   |
    SEC                 ; $0E980A   |
    SBC $72C0,x         ; $0E980B   |
    STA $7C16,x         ; $0E980E   |

CODE_0E9811:
    JSR CODE_0E985E     ; $0E9811   |
    BCS CODE_0E983D     ; $0E9814   |
    LDY $61B6           ; $0E9816   |
    BNE CODE_0E983D     ; $0E9819   |
    LDA $7C18,x         ; $0E981B   |
    SEC                 ; $0E981E   |
    SBC $02             ; $0E981F   |
    CMP #$FFF6          ; $0E9821   |
    BCC CODE_0E983D     ; $0E9824   |
    LDY $60AB           ; $0E9826   |
    BMI CODE_0E983D     ; $0E9829   |
    SEC                 ; $0E982B   |
    ADC $6090           ; $0E982C   |
    INC A               ; $0E982F   |
    STA $6090           ; $0E9830   |
    STZ $60AA           ; $0E9833   |
    INC $61B4           ; $0E9836   |
    STX $61B6           ; $0E9839   |
    RTS                 ; $0E983C   |

CODE_0E983D:
    LDA $10             ; $0E983D   |
    AND #$0001          ; $0E983F   |
    CLC                 ; $0E9842   |
    ADC #$0005          ; $0E9843   |
    STA $16,x           ; $0E9846   |
    LDY $7400,x         ; $0E9848   |
    LDA $9364,y         ; $0E984B   |
    STA $7220,x         ; $0E984E   |
    LDA #$0008          ; $0E9851   |
    STA $7AF6,x         ; $0E9854   |
    ASL A               ; $0E9857   |
    STA $7542,x         ; $0E9858   |
    STZ $76,x           ; $0E985B   |
    RTS                 ; $0E985D   |

CODE_0E985E:
    LDA $6120           ; $0E985E   |
    CLC                 ; $0E9861   |
    ADC $7BB6,x         ; $0E9862   |
    ASL A               ; $0E9865   |
    STA $00             ; $0E9866   |
    LSR A               ; $0E9868   |
    CLC                 ; $0E9869   |
    ADC $7C16,x         ; $0E986A   |
    CMP $00             ; $0E986D   |
    BCS CODE_0E9884     ; $0E986F   |
    LDA $6122           ; $0E9871   |
    CLC                 ; $0E9874   |
    ADC $7BB8,x         ; $0E9875   |
    STA $02             ; $0E9878   |
    ASL A               ; $0E987A   |
    STA $00             ; $0E987B   |
    LSR A               ; $0E987D   |
    CLC                 ; $0E987E   |
    ADC $7C18,x         ; $0E987F   |
    CMP $00             ; $0E9882   |

CODE_0E9884:
    RTS                 ; $0E9884   |

CODE_0E9885:
    LDA #$0211          ; $0E9885   |
    JSL $008B21         ; $0E9888   |
    LDA $7CD6,x         ; $0E988C   |
    STA $70A2,y         ; $0E988F   |
    LDA $7CD8,x         ; $0E9892   |
    STA $7142,y         ; $0E9895   |
    LDA #$0017          ; $0E9898   |
    STA $73C2,y         ; $0E989B   |
    LDA #$0001          ; $0E989E   |
    STA $7782,y         ; $0E98A1   |
    RTS                 ; $0E98A4   |

DATA_0E98A5:         dw $FF00, $0100

    TYX                 ; $0E98A9   |
    LDA $7A98,x         ; $0E98AA   |
    BNE CODE_0E98EE     ; $0E98AD   |
    LDY $7402,x         ; $0E98AF   |
    INY                 ; $0E98B2   |
    CPY #$09            ; $0E98B3   |
    BMI CODE_0E98D3     ; $0E98B5   |
    DEC $16,x           ; $0E98B7   |
    BNE CODE_0E98D1     ; $0E98B9   |
    LDA $10             ; $0E98BB   |
    AND #$0001          ; $0E98BD   |
    CLC                 ; $0E98C0   |
    ADC #$0003          ; $0E98C1   |
    STA $16,x           ; $0E98C4   |
    LDY $7400,x         ; $0E98C6   |
    LDA $98A5,y         ; $0E98C9   |
    STA $7220,x         ; $0E98CC   |
    INC $76,x           ; $0E98CF   |

CODE_0E98D1:
    LDY #$00            ; $0E98D1   |

CODE_0E98D3:
    TYA                 ; $0E98D3   |
    STA $7402,x         ; $0E98D4   |
    LDA #$0004          ; $0E98D7   |
    STA $7A98,x         ; $0E98DA   |
    LDA #$0020          ; $0E98DD   |
    CPY #$02            ; $0E98E0   |
    BMI CODE_0E98EB     ; $0E98E2   |
    CPY #$06            ; $0E98E4   |
    BPL CODE_0E98EB     ; $0E98E6   |
    LDA #$FD80          ; $0E98E8   |

CODE_0E98EB:
    STA $75E2,x         ; $0E98EB   |

CODE_0E98EE:
    RTS                 ; $0E98EE   |

    TYX                 ; $0E98EF   |
    LDA #$0100          ; $0E98F0   |
    STA $75E2,x         ; $0E98F3   |
    LDA $7A98,x         ; $0E98F6   |
    BNE CODE_0E9938     ; $0E98F9   |
    LDY $7402,x         ; $0E98FB   |
    BNE CODE_0E990A     ; $0E98FE   |
    LDA #$0003          ; $0E9900   |
    STA $7A98,x         ; $0E9903   |
    INC $7402,x         ; $0E9906   |
    RTS                 ; $0E9909   |

CODE_0E990A:
    CPY #$01            ; $0E990A   |
    BNE CODE_0E9910     ; $0E990C   |
    LDY #$08            ; $0E990E   |

CODE_0E9910:
    CPY #$09            ; $0E9910   |
    BNE CODE_0E9927     ; $0E9912   |
    DEC $16,x           ; $0E9914   |
    BNE CODE_0E9927     ; $0E9916   |
    LDA #$0001          ; $0E9918   |
    STA $7402,x         ; $0E991B   |
    LDA #$0003          ; $0E991E   |
    STA $7A98,x         ; $0E9921   |
    INC $76,x           ; $0E9924   |
    RTS                 ; $0E9926   |

CODE_0E9927:
    INY                 ; $0E9927   |
    CPY #$0C            ; $0E9928   |
    BMI CODE_0E992E     ; $0E992A   |
    LDY #$09            ; $0E992C   |

CODE_0E992E:
    TYA                 ; $0E992E   |
    STA $7402,x         ; $0E992F   |
    LDA #$0005          ; $0E9932   |
    STA $7A98,x         ; $0E9935   |

CODE_0E9938:
    RTS                 ; $0E9938   |

    TYX                 ; $0E9939   |
    LDA $7A98,x         ; $0E993A   |
    BNE CODE_0E995E     ; $0E993D   |
    LDA #$0004          ; $0E993F   |
    STA $7A98,x         ; $0E9942   |
    LDA $10             ; $0E9945   |
    AND #$0001          ; $0E9947   |
    CLC                 ; $0E994A   |
    ADC #$0006          ; $0E994B   |
    STA $16,x           ; $0E994E   |
    STZ $7402,x         ; $0E9950   |
    LDY $7400,x         ; $0E9953   |
    LDA $9364,y         ; $0E9956   |
    STA $7220,x         ; $0E9959   |
    STZ $76,x           ; $0E995C   |

CODE_0E995E:
    RTS                 ; $0E995E   |

    TYX                 ; $0E995F   |
    LDA #$0010          ; $0E9960   |
    LDY $7223,x         ; $0E9963   |
    BPL CODE_0E996B     ; $0E9966   |
    LDA #$0040          ; $0E9968   |

CODE_0E996B:
    STA $7542,x         ; $0E996B   |
    LDA $75E2,x         ; $0E996E   |
    DEC A               ; $0E9971   |
    CMP #$FFE0          ; $0E9972   |
    BPL CODE_0E997A     ; $0E9975   |
    LDA #$FFE0          ; $0E9977   |

CODE_0E997A:
    STA $75E2,x         ; $0E997A   |
    LDA $7A98,x         ; $0E997D   |
    BNE CODE_0E9996     ; $0E9980   |
    LDY $7402,x         ; $0E9982   |
    INY                 ; $0E9985   |
    CPY #$09            ; $0E9986   |
    BMI CODE_0E998C     ; $0E9988   |
    LDY #$00            ; $0E998A   |

CODE_0E998C:
    TYA                 ; $0E998C   |
    STA $7402,x         ; $0E998D   |
    LDA #$0001          ; $0E9990   |
    STA $7A98,x         ; $0E9993   |

CODE_0E9996:
    RTS                 ; $0E9996   |

DATA_0E9997:         dw $FE00, $0200

    TYX                 ; $0E999B   |
    LDA $7A96,x         ; $0E999C   |
    BNE CODE_0E99CF     ; $0E999F   |
    LDY $7400,x         ; $0E99A1   |
    LDA $9997,y         ; $0E99A4   |
    STA $7220,x         ; $0E99A7   |
    LDA #$0400          ; $0E99AA   |
    STA $75E2,x         ; $0E99AD   |
    LDA #$0841          ; $0E99B0   |
    STA $6FA2,x         ; $0E99B3   |
    LDA $7A98,x         ; $0E99B6   |
    BNE CODE_0E99CF     ; $0E99B9   |
    LDA #$0002          ; $0E99BB   |
    STA $7A98,x         ; $0E99BE   |
    LDY $7402,x         ; $0E99C1   |
    INY                 ; $0E99C4   |
    CPY #$0F            ; $0E99C5   |
    BMI CODE_0E99CB     ; $0E99C7   |
    LDY #$0C            ; $0E99C9   |

CODE_0E99CB:
    TYA                 ; $0E99CB   |
    STA $7402,x         ; $0E99CC   |

CODE_0E99CF:
    RTS                 ; $0E99CF   |

    TYX                 ; $0E99D0   |
    LDA $7680,x         ; $0E99D1   |
    CLC                 ; $0E99D4   |
    ADC #$0020          ; $0E99D5   |
    CMP #$0140          ; $0E99D8   |
    BCC CODE_0E9A2E     ; $0E99DB   |
    LDA $70E2,x         ; $0E99DD   |
    AND #$0010          ; $0E99E0   |
    DEC A               ; $0E99E3   |
    EOR $7680,x         ; $0E99E4   |
    BPL CODE_0E9A2E     ; $0E99E7   |
    LDA #$0005          ; $0E99E9   |
    STA $74A2,x         ; $0E99EC   |
    LDA #$6800          ; $0E99EF   |
    STA $6FA0,x         ; $0E99F2   |
    LDA #$0010          ; $0E99F5   |
    STA $7542,x         ; $0E99F8   |
    LDA $10             ; $0E99FB   |
    AND #$0001          ; $0E99FD   |
    CLC                 ; $0E9A00   |
    ADC #$0003          ; $0E9A01   |
    STA $16,x           ; $0E9A04   |
    LDY $77C2,x         ; $0E9A06   |
    TYA                 ; $0E9A09   |
    STA $7400,x         ; $0E9A0A   |
    LDA $98A5,y         ; $0E9A0D   |
    STA $7220,x         ; $0E9A10   |
    LDA #$0004          ; $0E9A13   |
    STA $7A98,x         ; $0E9A16   |
    LDA #$0020          ; $0E9A19   |
    STA $75E2,x         ; $0E9A1C   |
    LDY #$01            ; $0E9A1F   |
    STY $76,x           ; $0E9A21   |
    LDA $7360,x         ; $0E9A23   |
    CMP #$0153          ; $0E9A26   |
    BNE CODE_0E9A2E     ; $0E9A29   |
    JSR CODE_0E94C4     ; $0E9A2B   |

CODE_0E9A2E:
    RTS                 ; $0E9A2E   |

    TYX                 ; $0E9A2F   |
    LDY $78,x           ; $0E9A30   |
    LDA $6F00,y         ; $0E9A32   |
    CMP #$0010          ; $0E9A35   |
    BNE CODE_0E9A64     ; $0E9A38   |
    LDA $7D96,y         ; $0E9A3A   |
    BNE CODE_0E9A64     ; $0E9A3D   |
    LDA $79D6,y         ; $0E9A3F   |
    CMP #$0003          ; $0E9A42   |
    BNE CODE_0E9A64     ; $0E9A45   |
    LDA #$0000          ; $0E9A47   |
    STA $7222,y         ; $0E9A4A   |
    LDA $7C16,x         ; $0E9A4D   |
    CLC                 ; $0E9A50   |
    ADC #$0038          ; $0E9A51   |
    CMP #$0070          ; $0E9A54   |
    BCS CODE_0E9A6C     ; $0E9A57   |
    LDA $7C18,x         ; $0E9A59   |
    BPL CODE_0E9A6C     ; $0E9A5C   |
    LDA $7220,x         ; $0E9A5E   |
    STA $7220,y         ; $0E9A61   |

CODE_0E9A64:
    STZ $7402,x         ; $0E9A64   |
    STZ $78,x           ; $0E9A67   |
    STZ $76,x           ; $0E9A69   |
    RTS                 ; $0E9A6B   |

CODE_0E9A6C:
    LDA $70E2,x         ; $0E9A6C   |
    STA $70E2,y         ; $0E9A6F   |
    LDA $7182,x         ; $0E9A72   |
    CLC                 ; $0E9A75   |
    ADC #$0010          ; $0E9A76   |
    STA $7182,y         ; $0E9A79   |
    LDA $7A98,x         ; $0E9A7C   |
    BNE CODE_0E9A96     ; $0E9A7F   |
    LDA #$0005          ; $0E9A81   |
    STA $7A98,x         ; $0E9A84   |
    LDA $7402,x         ; $0E9A87   |
    INC A               ; $0E9A8A   |
    CMP #$0012          ; $0E9A8B   |
    BMI CODE_0E9A93     ; $0E9A8E   |
    LDA #$000F          ; $0E9A90   |

CODE_0E9A93:
    STA $7402,x         ; $0E9A93   |

CODE_0E9A96:
    RTS                 ; $0E9A96   |

DATA_0E9A97:         dw $FF40, $00C0

.init_fat_goonie
    LDA $7900,x         ; $0E9A9B   |
    INC A               ; $0E9A9E   |
    BNE CODE_0E9ACD     ; $0E9A9F   |
    INC $18,x           ; $0E9AA1   |
    INC $7402,x         ; $0E9AA3   |
    LDY #$0A            ; $0E9AA6   |
    STY $76,x           ; $0E9AA8   |
    LDA #$0040          ; $0E9AAA   |
    STA $7542,x         ; $0E9AAD   |
    LDA #$0400          ; $0E9AB0   |
    STA $75E2,x         ; $0E9AB3   |
    LDA #$0843          ; $0E9AB6   |
    STA $6FA2,x         ; $0E9AB9   |
    LDA #$74A2          ; $0E9ABC   |
    STA $6FA0,x         ; $0E9ABF   |
    STZ $7900,x         ; $0E9AC2   |
    LDA $7400,x         ; $0E9AC5   |
    STA $7902,x         ; $0E9AC8   |
    BRA CODE_0E9B01     ; $0E9ACB   |

CODE_0E9ACD:
    STZ $7900,x         ; $0E9ACD   |
    LDA $70E2,x         ; $0E9AD0   |
    PHA                 ; $0E9AD3   |
    SEC                 ; $0E9AD4   |
    SBC $6094           ; $0E9AD5   |
    STA $00             ; $0E9AD8   |
    PLA                 ; $0E9ADA   |
    AND #$0010          ; $0E9ADB   |
    EOR #$0010          ; $0E9ADE   |
    SEC                 ; $0E9AE1   |
    SBC #$0010          ; $0E9AE2   |
    EOR $00             ; $0E9AE5   |
    BPL CODE_0E9AF4     ; $0E9AE7   |
    LDA $00             ; $0E9AE9   |
    CLC                 ; $0E9AEB   |
    ADC #$0010          ; $0E9AEC   |
    CMP #$0120          ; $0E9AEF   |
    BCS CODE_0E9B01     ; $0E9AF2   |

CODE_0E9AF4:
    LDA #$00FF          ; $0E9AF4   |
    STA $74A2,x         ; $0E9AF7   |
    LDA #$0002          ; $0E9AFA   |
    STA $6F00,x         ; $0E9AFD   |
    RTL                 ; $0E9B00   |

CODE_0E9B01:
    JSL $03AE60         ; $0E9B01   |
    LDY $7400,x         ; $0E9B05   |
    LDA $9A97,y         ; $0E9B08   |
    STA $7220,x         ; $0E9B0B   |
    LDA #$0100          ; $0E9B0E   |
    STA $7A36,x         ; $0E9B11   |
    LDA #$0005          ; $0E9B14   |
    STA $74A2,x         ; $0E9B17   |
    JSR CODE_0E9DC0     ; $0E9B1A   |
    RTL                 ; $0E9B1D   |

DATA_0E9B1E:         dw $9FA6
DATA_0E9B20:         dw $9FFE
DATA_0E9B22:         dw $A01A
DATA_0E9B24:         dw $A06E
DATA_0E9B26:         dw $9FFE
DATA_0E9B28:         dw $A01A
DATA_0E9B2A:         dw $A06E
DATA_0E9B2C:         dw $A086
DATA_0E9B2E:         dw $A09C
DATA_0E9B30:         dw $A0DD
DATA_0E9B32:         dw $A0F7

DATA_0E9B34:         dw $74A2, $7442

.main_fat_goonie
    JSR CODE_0E9CED     ; $0E9B38   |
    JSR CODE_0E95AE     ; $0E9B3B   |
    LDA $7D96,x         ; $0E9B3E   |
    BEQ CODE_0E9B46     ; $0E9B41   |
    STZ $6FA2,x         ; $0E9B43   |

CODE_0E9B46:
    JSL $03AF23         ; $0E9B46   |
    TXY                 ; $0E9B4A   |
    LDA $76,x           ; $0E9B4B   |
    ASL A               ; $0E9B4D   |
    TAX                 ; $0E9B4E   |
    JSR ($9B1E,x)       ; $0E9B4F   |

    LDY $7402,x         ; $0E9B52   |
    BNE CODE_0E9B5A     ; $0E9B55   |
    JSR CODE_0E9638     ; $0E9B57   |

CODE_0E9B5A:
    JSR CODE_0E9DC0     ; $0E9B5A   |
    LDA $61B4           ; $0E9B5D   |
    STA $00             ; $0E9B60   |
    LDY $7402,x         ; $0E9B62   |
    BNE CODE_0E9B6E     ; $0E9B65   |
    JSR CODE_0E9E86     ; $0E9B67   |
    JSR CODE_0E9F2D     ; $0E9B6A   |
    RTL                 ; $0E9B6D   |

CODE_0E9B6E:
    JSL $05E379         ; $0E9B6E   |
    JSL $03A5B7         ; $0E9B72   |
    LDY #$00            ; $0E9B76   |
    LDA $61B4           ; $0E9B78   |
    CMP $00             ; $0E9B7B   |
    BEQ CODE_0E9B81     ; $0E9B7D   |
    INY                 ; $0E9B7F   |
    INY                 ; $0E9B80   |

CODE_0E9B81:
    LDA $9B34,y         ; $0E9B81   |
    STA $6FA0,x         ; $0E9B84   |
    LDA #$0008          ; $0E9B87   |
    STA $7B56,x         ; $0E9B8A   |
    STA $7B58,x         ; $0E9B8D   |
    RTL                 ; $0E9B90   |

; gsu table
DATA_0E9B91:         db $A5, $9B, $C3, $9B, $E1, $9B, $FF, $9B
DATA_0E9B99:         db $1D, $9C, $3B, $9C, $59, $9C, $77, $9C
DATA_0E9BA1:         db $95, $9C, $B3, $9C, $0E, $ED, $05, $00
DATA_0E9BA9:         db $02, $0E, $FD, $07, $00, $00, $10, $E6
DATA_0E9BB1:         db $0D, $00, $00, $F4, $ED, $05, $40, $02
DATA_0E9BB9:         db $FC, $FD, $07, $40, $00, $FA, $E6, $0D
DATA_0E9BC1:         db $40, $00, $10, $F5, $08, $00, $02, $15
DATA_0E9BC9:         db $F0, $0D, $00, $00, $15, $F0, $0D, $00
DATA_0E9BD1:         db $00, $F2, $F5, $08, $40, $02, $F5, $F0
DATA_0E9BD9:         db $0D, $40, $00, $F5, $F0, $0D, $40, $00
DATA_0E9BE1:         db $10, $FD, $0A, $00, $02, $10, $FD, $0A
DATA_0E9BE9:         db $00, $00, $10, $05, $1A, $00, $00, $F2
DATA_0E9BF1:         db $FD, $0A, $40, $02, $FA, $FD, $0A, $40
DATA_0E9BF9:         db $00, $FA, $05, $1A, $40, $00, $10, $06
DATA_0E9C01:         db $0C, $00, $02, $10, $06, $0C, $00, $00
DATA_0E9C09:         db $10, $06, $0C, $00, $00, $F2, $06, $0C
DATA_0E9C11:         db $40, $02, $FA, $06, $0C, $40, $00, $FA
DATA_0E9C19:         db $0E, $0C, $40, $00, $10, $08, $17, $00
DATA_0E9C21:         db $00, $10, $08, $17, $00, $00, $10, $10
DATA_0E9C29:         db $0E, $00, $02, $FA, $08, $17, $40, $00
DATA_0E9C31:         db $FA, $08, $17, $40, $00, $F2, $10, $0E
DATA_0E9C39:         db $40, $02, $10, $07, $08, $80, $02, $15
DATA_0E9C41:         db $14, $0D, $80, $00, $15, $14, $0D, $80
DATA_0E9C49:         db $00, $F2, $07, $08, $C0, $02, $F5, $14
DATA_0E9C51:         db $0D, $C0, $00, $F5, $14, $0D, $C0, $00
DATA_0E9C59:         db $10, $FF, $0A, $80, $02, $10, $07, $0A
DATA_0E9C61:         db $80, $00, $10, $FF, $1A, $80, $00, $F2
DATA_0E9C69:         db $FF, $0A, $C0, $02, $FA, $07, $0A, $C0
DATA_0E9C71:         db $00, $FA, $FF, $1A, $C0, $00, $0F, $F6
DATA_0E9C79:         db $0C, $80, $02, $0F, $FE, $0C, $80, $00
DATA_0E9C81:         db $0F, $F6, $1C, $80, $00, $F3, $F6, $0C
DATA_0E9C89:         db $C0, $02, $FB, $FE, $0C, $C0, $00, $FB
DATA_0E9C91:         db $F6, $1C, $C0, $00, $0F, $FE, $17, $80
DATA_0E9C99:         db $00, $0F, $FE, $17, $80, $00, $0F, $EE
DATA_0E9CA1:         db $0E, $80, $02, $FB, $FE, $17, $C0, $00
DATA_0E9CA9:         db $FB, $FE, $17, $C0, $00, $F3, $EE, $0E
DATA_0E9CB1:         db $C0, $02, $10, $F5, $08, $00, $02, $15
DATA_0E9CB9:         db $F0, $0D, $00, $00, $15, $F0, $0D, $00
DATA_0E9CC1:         db $00, $F2, $F5, $08, $40, $02, $F5, $F0
DATA_0E9CC9:         db $0D, $40, $00, $F5, $F0, $0D, $40, $00
DATA_0E9CD1:         db $08, $FD, $FA, $FD, $F8, $FD, $06, $FD
DATA_0E9CD9:         db $00, $00, $00, $00, $00, $00, $10, $00
DATA_0E9CE1:         db $F0, $FF, $00, $00, $10, $00, $F0, $FF
DATA_0E9CE9:         db $00, $00, $00, $00

CODE_0E9CED:
    LDY $74A2,x         ; $0E9CED   |
    BPL CODE_0E9CF3     ; $0E9CF0   |
    RTS                 ; $0E9CF2   |

CODE_0E9CF3:
    LDY $7402,x         ; $0E9CF3   |
    BEQ CODE_0E9CFB     ; $0E9CF6   |
    JMP CODE_0E9D8B     ; $0E9CF8   |

CODE_0E9CFB:
    LDA $7680,x         ; $0E9CFB   |
    STA $3002           ; $0E9CFE   |
    LDA $7682,x         ; $0E9D01   |
    STA $3004           ; $0E9D04   |
    LDA $7A36,x         ; $0E9D07   |
    STA $604C           ; $0E9D0A   |
    CMP #$0100          ; $0E9D0D   |
    BPL CODE_0E9D1C     ; $0E9D10   |
    ASL A               ; $0E9D12   |
    EOR #$FFFF          ; $0E9D13   |
    CLC                 ; $0E9D16   |
    ADC #$0301          ; $0E9D17   |
    BRA CODE_0E9D3E     ; $0E9D1A   |

CODE_0E9D1C:
    AND #$00FF          ; $0E9D1C   |
    STA $3000           ; $0E9D1F   |
    LDA #$0140          ; $0E9D22   |
    STA $300C           ; $0E9D25   |
    LDX #$0B            ; $0E9D28   |
    LDA #$86B6          ; $0E9D2A   |
    JSL $7EDE44         ; $0E9D2D   | GSU init
    LDX $12             ; $0E9D31   |
    LDA $3000           ; $0E9D33   |
    CLC                 ; $0E9D36   |
    ADC #$FF00          ; $0E9D37   |
    EOR #$FFFF          ; $0E9D3A   |
    INC A               ; $0E9D3D   |

CODE_0E9D3E:
    STA $300C           ; $0E9D3E   |
    LDY $79,x           ; $0E9D41   |
    TYA                 ; $0E9D43   |
    STA $300E           ; $0E9D44   |
    LDA $7400,x         ; $0E9D47   |
    STA $3010           ; $0E9D4A   |
    TXA                 ; $0E9D4D   |
    STA $3014           ; $0E9D4E   |
    LDA #$000E          ; $0E9D51   |
    STA $3000           ; $0E9D54   |
    LDA #$9CD1          ; $0E9D57   |
    STA $301C           ; $0E9D5A   |
    LDA #$9B91          ; $0E9D5D   |
    STA $6000           ; $0E9D60   |
    LDY $78,x           ; $0E9D63   |
    LDA $9CD9,y         ; $0E9D65   |
    STA $3018           ; $0E9D68   |
    LDA $9CE3,y         ; $0E9D6B   |
    STA $301A           ; $0E9D6E   |
    LDX #$0B            ; $0E9D71   |
    LDA #$8751          ; $0E9D73   |
    JSL $7EDE44         ; $0E9D76   | GSU init
    LDX $12             ; $0E9D7A   |
    REP #$10            ; $0E9D7C   |
    LDA $7362,x         ; $0E9D7E   |
    CLC                 ; $0E9D81   |
    ADC #$0018          ; $0E9D82   |
    TAY                 ; $0E9D85   |
    JSL $03AA60         ; $0E9D86   |
    RTS                 ; $0E9D8A   |

CODE_0E9D8B:
    JSL $03AA52         ; $0E9D8B   |
    REP #$10            ; $0E9D8F   |
    LDY $7362,x         ; $0E9D91   |
    LDA #$8000          ; $0E9D94   |
    STA $6020,y         ; $0E9D97   |
    STA $6028,y         ; $0E9D9A   |
    STA $6030,y         ; $0E9D9D   |
    STA $6038,y         ; $0E9DA0   |
    STA $6040,y         ; $0E9DA3   |
    STA $6048,y         ; $0E9DA6   |
    SEP #$10            ; $0E9DA9   |
    RTS                 ; $0E9DAB   |

DATA_0E9DAC:         dw $0000, $0010, $0010, $0004
DATA_0E9DB4:         dw $001C

DATA_0E9DB6:         dw $0000, $0004, $001C, $0010
DATA_0E9DBE:         dw $0010

CODE_0E9DC0:
    LDY $7402,x         ; $0E9DC0   |
    BEQ CODE_0E9DC8     ; $0E9DC3   |
    JMP CODE_0E9E4C     ; $0E9DC5   |

CODE_0E9DC8:
    LDA $7A36,x         ; $0E9DC8   |
    STA $3016           ; $0E9DCB   |
    CMP #$0100          ; $0E9DCE   |
    BPL CODE_0E9DDD     ; $0E9DD1   |
    ASL A               ; $0E9DD3   |
    EOR #$FFFF          ; $0E9DD4   |
    CLC                 ; $0E9DD7   |
    ADC #$0301          ; $0E9DD8   |
    BRA CODE_0E9DFF     ; $0E9DDB   |

CODE_0E9DDD:
    AND #$00FF          ; $0E9DDD   |
    STA $3000           ; $0E9DE0   |
    LDA #$0140          ; $0E9DE3   |
    STA $300C           ; $0E9DE6   |
    LDX #$0B            ; $0E9DE9   |
    LDA #$86B6          ; $0E9DEB   |
    JSL $7EDE44         ; $0E9DEE   | GSU init
    LDX $12             ; $0E9DF2   |
    LDA $3000           ; $0E9DF4   |
    CLC                 ; $0E9DF7   |
    ADC #$FF00          ; $0E9DF8   |
    EOR #$FFFF          ; $0E9DFB   |
    INC A               ; $0E9DFE   |

CODE_0E9DFF:
    STA $300C           ; $0E9DFF   |
    LDA #$0054          ; $0E9E02   |
    STA $301A           ; $0E9E05   |
    LDA #$2081          ; $0E9E08   |
    STA $3018           ; $0E9E0B   |
    LDY $78,x           ; $0E9E0E   |
    LDA $9DAC,y         ; $0E9E10   |
    STA $3010           ; $0E9E13   |
    LDA $9DB6,y         ; $0E9E16   |
    STA $3012           ; $0E9E19   |
    LDY $7400,x         ; $0E9E1C   |
    BEQ CODE_0E9E2B     ; $0E9E1F   |
    LDA #$0020          ; $0E9E21   |
    SEC                 ; $0E9E24   |
    SBC $3010           ; $0E9E25   |
    STA $3010           ; $0E9E28   |

CODE_0E9E2B:
    LDY $7722,x         ; $0E9E2B   |
    TYX                 ; $0E9E2E   |
    LDA $03A9CE,x       ; $0E9E2F   |
    STA $3006           ; $0E9E33   |
    LDA $03A9EE,x       ; $0E9E36   |
    STA $3004           ; $0E9E3A   |
    LDX #$08            ; $0E9E3D   |
    LDA #$8295          ; $0E9E3F   |
    JSL $7EDE44         ; $0E9E42   | GSU init
    LDX $12             ; $0E9E46   |
    INC $0CF9           ; $0E9E48   |
    RTS                 ; $0E9E4B   |

CODE_0E9E4C:
    LDA #$0054          ; $0E9E4C   |
    STA $301A           ; $0E9E4F   |
    LDA #$2081          ; $0E9E52   |
    STA $3018           ; $0E9E55   |
    LDY $7A38,x         ; $0E9E58   |
    TYA                 ; $0E9E5B   |
    STA $300A           ; $0E9E5C   |
    LDA #$0100          ; $0E9E5F   |
    STA $300C           ; $0E9E62   |
    LDY $7722,x         ; $0E9E65   |
    TYX                 ; $0E9E68   |
    LDA $03A9CE,x       ; $0E9E69   |
    STA $3006           ; $0E9E6D   |
    LDA $03A9EE,x       ; $0E9E70   |
    STA $3004           ; $0E9E74   |
    LDX #$08            ; $0E9E77   |
    LDA #$8205          ; $0E9E79   |
    JSL $7EDE44         ; $0E9E7C   | GSU init
    LDX $12             ; $0E9E80   |
    INC $0CF9           ; $0E9E82   |
    RTS                 ; $0E9E85   |

CODE_0E9E86:
    LDA $7BB6,x         ; $0E9E86   |
    CLC                 ; $0E9E89   |
    ADC $6120           ; $0E9E8A   |
    STA $00             ; $0E9E8D   |
    ASL A               ; $0E9E8F   |
    STA $02             ; $0E9E90   |
    LDA $7BB8,x         ; $0E9E92   |
    CLC                 ; $0E9E95   |
    ADC $6122           ; $0E9E96   |
    STA $04             ; $0E9E99   |
    ASL A               ; $0E9E9B   |
    STA $06             ; $0E9E9C   |
    LDY $7A38,x         ; $0E9E9E   |
    BEQ CODE_0E9EA6     ; $0E9EA1   |
    JMP CODE_0E9EFA     ; $0E9EA3   |

CODE_0E9EA6:
    LDA $7C16,x         ; $0E9EA6   |
    CLC                 ; $0E9EA9   |
    ADC $00             ; $0E9EAA   |
    CMP $02             ; $0E9EAC   |
    BCS CODE_0E9EF9     ; $0E9EAE   |
    LDA $7C18,x         ; $0E9EB0   |
    CLC                 ; $0E9EB3   |
    ADC $04             ; $0E9EB4   |
    SEC                 ; $0E9EB6   |
    SBC $06             ; $0E9EB7   |
    BCS CODE_0E9EF9     ; $0E9EB9   |
    CMP #$FFF8          ; $0E9EBB   |
    BCC CODE_0E9EF5     ; $0E9EBE   |
    LDY $60C0           ; $0E9EC0   |
    BEQ CODE_0E9ECA     ; $0E9EC3   |
    LDY $60AB           ; $0E9EC5   |
    BMI CODE_0E9EF9     ; $0E9EC8   |

CODE_0E9ECA:
    LDA $7CD8,x         ; $0E9ECA   |
    SEC                 ; $0E9ECD   |
    SBC $04             ; $0E9ECE   |
    SEC                 ; $0E9ED0   |
    SBC $611E           ; $0E9ED1   |
    SEC                 ; $0E9ED4   |
    ADC $6090           ; $0E9ED5   |
    INC A               ; $0E9ED8   |
    STA $6090           ; $0E9ED9   |
    LDA #$0001          ; $0E9EDC   |
    STA $7A38,x         ; $0E9EDF   |
    STZ $60AA           ; $0E9EE2   |
    STZ $60C0           ; $0E9EE5   |
    STZ $60D4           ; $0E9EE8   |
    INC $61B4           ; $0E9EEB   |
    LDA #$7460          ; $0E9EEE   |
    STA $6FA0,x         ; $0E9EF1   |
    RTS                 ; $0E9EF4   |

CODE_0E9EF5:
    JSL $03A858         ; $0E9EF5   |

CODE_0E9EF9:
    RTS                 ; $0E9EF9   |

CODE_0E9EFA:
    STZ $7A38,x         ; $0E9EFA   |
    LDA #$7400          ; $0E9EFD   |
    STA $6FA0,x         ; $0E9F00   |
    LDA $7C16,x         ; $0E9F03   |
    CLC                 ; $0E9F06   |
    ADC $00             ; $0E9F07   |
    CMP $02             ; $0E9F09   |
    BCS CODE_0E9EF9     ; $0E9F0B   |
    LDY $60C0           ; $0E9F0D   |
    BEQ CODE_0E9F17     ; $0E9F10   |
    LDY $60AB           ; $0E9F12   |
    BMI CODE_0E9EF9     ; $0E9F15   |

CODE_0E9F17:
    LDA $608C           ; $0E9F17   |
    CLC                 ; $0E9F1A   |
    ADC $72C0,x         ; $0E9F1B   |
    STA $608C           ; $0E9F1E   |
    LDA $6090           ; $0E9F21   |
    CLC                 ; $0E9F24   |
    ADC $72C2,x         ; $0E9F25   |
    STA $6090           ; $0E9F28   |
    BRA CODE_0E9ECA     ; $0E9F2B   |

CODE_0E9F2D:
    LDA #$000C          ; $0E9F2D   |
    STA $3000           ; $0E9F30   |
    LDA $7A36,x         ; $0E9F33   |
    STA $300C           ; $0E9F36   |
    LDX #$0B            ; $0E9F39   |
    LDA #$86B6          ; $0E9F3B   |
    JSL $7EDE44         ; $0E9F3E   | GSU init
    LDX $12             ; $0E9F42   |
    LDY $78,x           ; $0E9F44   |
    CPY #$06            ; $0E9F46   |
    BPL CODE_0E9F75     ; $0E9F48   |
    CPY #$02            ; $0E9F4A   |
    BNE CODE_0E9F57     ; $0E9F4C   |
    LDA $3000           ; $0E9F4E   |
    SEC                 ; $0E9F51   |
    SBC #$0004          ; $0E9F52   |
    BRA CODE_0E9F5E     ; $0E9F55   |

CODE_0E9F57:
    LDA #$0014          ; $0E9F57   |
    SEC                 ; $0E9F5A   |
    SBC $3000           ; $0E9F5B   |

CODE_0E9F5E:
    STA $00             ; $0E9F5E   |
    LDY $7A38,x         ; $0E9F60   |
    BEQ CODE_0E9F70     ; $0E9F63   |
    SEC                 ; $0E9F65   |
    SBC $7B58,x         ; $0E9F66   |
    CLC                 ; $0E9F69   |
    ADC $6090           ; $0E9F6A   |
    STA $6090           ; $0E9F6D   |

CODE_0E9F70:
    LDA $00             ; $0E9F70   |
    STA $7B58,x         ; $0E9F72   |

CODE_0E9F75:
    LDY $7A38,x         ; $0E9F75   |
    BEQ CODE_0E9F88     ; $0E9F78   |
    LDA $3000           ; $0E9F7A   |
    SEC                 ; $0E9F7D   |
    SBC $7BB8,x         ; $0E9F7E   |
    CLC                 ; $0E9F81   |
    ADC $6090           ; $0E9F82   |
    STA $6090           ; $0E9F85   |

CODE_0E9F88:
    LDA $3000           ; $0E9F88   |
    STA $7BB8,x         ; $0E9F8B   |
    RTS                 ; $0E9F8E   |

DATA_0E9F8F:         db $04, $02, $04, $08, $04, $02, $04, $06
DATA_0E9F97:         db $04, $02, $04, $02, $04

DATA_0E9F9C:         dw $0402, $0004, $0001, $0007
DATA_0E9FA4:         dw $0007

    TYX                 ; $0E9FA6   |
    LDA $7860,x         ; $0E9FA7   |
    AND #$000F          ; $0E9FAA   |
    BEQ CODE_0E9FC9     ; $0E9FAD   |
    TAY                 ; $0E9FAF   |
    LDA $9F8E,y         ; $0E9FB0   |
    TAY                 ; $0E9FB3   |
    STY $78,x           ; $0E9FB4   |
    LDA $9F9C,y         ; $0E9FB6   |
    STA $76,x           ; $0E9FB9   |
    STZ $7220,x         ; $0E9FBB   |
    STZ $7222,x         ; $0E9FBE   |
    STZ $7542,x         ; $0E9FC1   |
    LDY #$09            ; $0E9FC4   |
    STY $79,x           ; $0E9FC6   |
    RTS                 ; $0E9FC8   |

CODE_0E9FC9:
    LDA $7222,x         ; $0E9FC9   |
    CMP #$0100          ; $0E9FCC   |
    BMI CODE_0E9FE1     ; $0E9FCF   |
    LDA #$0040          ; $0E9FD1   |
    STA $7542,x         ; $0E9FD4   |
    LDA #$0400          ; $0E9FD7   |
    STA $75E2,x         ; $0E9FDA   |
    STZ $79,x           ; $0E9FDD   |
    BRA CODE_0E9FF8     ; $0E9FDF   |

CODE_0E9FE1:
    JSR CODE_0EA11D     ; $0E9FE1   |
    LDA $7222,x         ; $0E9FE4   |
    CMP #$FF00          ; $0E9FE7   |
    BMI CODE_0E9FF8     ; $0E9FEA   |
    LDA #$0008          ; $0E9FEC   |
    STA $7542,x         ; $0E9FEF   |
    LDA #$0100          ; $0E9FF2   |
    STA $75E2,x         ; $0E9FF5   |

CODE_0E9FF8:
    LDA $7222,x         ; $0E9FF8   |
    STA $16,x           ; $0E9FFB   |
    RTS                 ; $0E9FFD   |

    TYX                 ; $0E9FFE   |
    LDA $7A36,x         ; $0E9FFF   |
    SEC                 ; $0EA002   |
    SBC #$0004          ; $0EA003   |
    CMP #$00D0          ; $0EA006   |
    BPL CODE_0EA016     ; $0EA009   |
    LDA #$0008          ; $0EA00B   |
    STA $7900,x         ; $0EA00E   |
    INC $76,x           ; $0EA011   |
    LDA #$00D0          ; $0EA013   |

CODE_0EA016:
    STA $7A36,x         ; $0EA016   |
    RTS                 ; $0EA019   |

    TYX                 ; $0EA01A   |
    LDA $7A36,x         ; $0EA01B   |
    CLC                 ; $0EA01E   |
    ADC $7900,x         ; $0EA01F   |
    CMP #$0100          ; $0EA022   |
    BMI CODE_0EA06A     ; $0EA025   |
    PHA                 ; $0EA027   |
    LDA #$0003          ; $0EA028   |\ play sound #$0003
    JSL $0085D2         ; $0EA02B   |/
    LDY $76,x           ; $0EA02F   |
    CPY #$02            ; $0EA031   |
    BNE CODE_0EA053     ; $0EA033   |
    LDY $7223,x         ; $0EA035   |
    BMI CODE_0EA050     ; $0EA038   |
    LDA #$FC00          ; $0EA03A   |
    STA $7222,x         ; $0EA03D   |
    LDA #$0200          ; $0EA040   |
    STA $75E2,x         ; $0EA043   |
    LDA #$0020          ; $0EA046   |
    STA $7542,x         ; $0EA049   |
    LSR A               ; $0EA04C   |
    STA $7900,x         ; $0EA04D   |

CODE_0EA050:
    JSR CODE_0EA11D     ; $0EA050   |

CODE_0EA053:
    LDA #$0020          ; $0EA053   |
    STA $7542,x         ; $0EA056   |
    LDY $7400,x         ; $0EA059   |
    LDA $9A97,y         ; $0EA05C   |
    STA $7220,x         ; $0EA05F   |
    PLA                 ; $0EA062   |
    CMP #$0140          ; $0EA063   |
    BMI CODE_0EA06A     ; $0EA066   |
    INC $76,x           ; $0EA068   |

CODE_0EA06A:
    STA $7A36,x         ; $0EA06A   |
    RTS                 ; $0EA06D   |

    TYX                 ; $0EA06E   |
    LDA $7A36,x         ; $0EA06F   |
    SEC                 ; $0EA072   |
    SBC #$0008          ; $0EA073   |
    CMP #$0100          ; $0EA076   |
    BPL CODE_0EA080     ; $0EA079   |
    STZ $76,x           ; $0EA07B   |
    LDA #$0100          ; $0EA07D   |

CODE_0EA080:
    STA $7A36,x         ; $0EA080   |
    JMP CODE_0EA11D     ; $0EA083   |

    TYX                 ; $0EA086   |
    LDA $7A36,x         ; $0EA087   |
    CLC                 ; $0EA08A   |
    ADC #$0008          ; $0EA08B   |
    CMP #$0140          ; $0EA08E   |
    BMI CODE_0EA098     ; $0EA091   |
    INC $76,x           ; $0EA093   |
    LDA #$0140          ; $0EA095   |

CODE_0EA098:
    STA $7A36,x         ; $0EA098   |
    RTS                 ; $0EA09B   |

    TYX                 ; $0EA09C   |
    LDA $7A36,x         ; $0EA09D   |
    SEC                 ; $0EA0A0   |
    SBC #$0004          ; $0EA0A1   |
    CMP #$0100          ; $0EA0A4   |
    BPL CODE_0EA0D2     ; $0EA0A7   |
    LDY $7220,x         ; $0EA0A9   |
    BNE CODE_0EA0D2     ; $0EA0AC   |
    PHA                 ; $0EA0AE   |
    LDA $7400,x         ; $0EA0AF   |
    EOR #$0002          ; $0EA0B2   |
    STA $7400,x         ; $0EA0B5   |
    TAY                 ; $0EA0B8   |
    LDA $9A97,y         ; $0EA0B9   |
    STA $7220,x         ; $0EA0BC   |
    LDA $16,x           ; $0EA0BF   |
    STA $7222,x         ; $0EA0C1   |
    LDA #$0020          ; $0EA0C4   |
    STA $7542,x         ; $0EA0C7   |
    LDA #$0003          ; $0EA0CA   |\ play sound #$0003
    JSL $0085D2         ; $0EA0CD   |/
    PLA                 ; $0EA0D1   |

CODE_0EA0D2:
    CMP #$00E8          ; $0EA0D2   |
    BPL CODE_0EA0D9     ; $0EA0D5   |
    INC $76,x           ; $0EA0D7   |

CODE_0EA0D9:
    STA $7A36,x         ; $0EA0D9   |
    RTS                 ; $0EA0DC   |

    TYX                 ; $0EA0DD   |
    LDA $7A36,x         ; $0EA0DE   |
    CLC                 ; $0EA0E1   |
    ADC #$0004          ; $0EA0E2   |
    CMP #$0100          ; $0EA0E5   |
    BMI CODE_0EA0EF     ; $0EA0E8   |
    STZ $76,x           ; $0EA0EA   |
    LDA #$0100          ; $0EA0EC   |

CODE_0EA0EF:
    STA $7A36,x         ; $0EA0EF   |
    RTS                 ; $0EA0F2   |

DATA_0EA0F3:         dw $0004, $FFFC

    TYX                 ; $0EA0F7   |
    LDY $19,x           ; $0EA0F8   |
    LDA $7A38,x         ; $0EA0FA   |
    CLC                 ; $0EA0FD   |
    ADC $A0F3,y         ; $0EA0FE   |
    AND #$01FE          ; $0EA101   |
    STA $7A38,x         ; $0EA104   |
    LDA $7860,x         ; $0EA107   |
    AND #$000C          ; $0EA10A   |
    BEQ CODE_0EA11C     ; $0EA10D   |
    LDA $19,x           ; $0EA10F   |
    EOR #$0002          ; $0EA111   |
    STA $19,x           ; $0EA114   |
    LDA $7902,x         ; $0EA116   |
    STA $7400,x         ; $0EA119   |

CODE_0EA11C:
    RTS                 ; $0EA11C   |

CODE_0EA11D:
    LDA $7A98,x         ; $0EA11D   |
    BNE CODE_0EA130     ; $0EA120   |
    INC $7A98,x         ; $0EA122   |
    LDY $79,x           ; $0EA125   |
    INY                 ; $0EA127   |
    CPY #$09            ; $0EA128   |
    BMI CODE_0EA12E     ; $0EA12A   |
    LDY #$00            ; $0EA12C   |

CODE_0EA12E:
    STY $79,x           ; $0EA12E   |

CODE_0EA130:
    RTS                 ; $0EA130   |

.init_barney_bubble
    LDA #$0100          ; $0EA131   |
    STA $7A36,x         ; $0EA134   |
    RTL                 ; $0EA137   |

DATA_0EA138:         dw $A2FA, $A335, $A36B, $A433

.main_barney_bubble
    LDY $7722,x         ; $0EA140   |
    BMI CODE_0EA1B9     ; $0EA143   |
    LDY $74A2,x         ; $0EA145   |
    BMI CODE_0EA1B9     ; $0EA148   |
    REP #$10            ; $0EA14A   |
    LDA $7362,x         ; $0EA14C   |
    CLC                 ; $0EA14F   |
    ADC #$0008          ; $0EA150   |
    TAY                 ; $0EA153   |
    JSL $03AA60         ; $0EA154   |
    LDA #$0004          ; $0EA158   |
    STA $3000           ; $0EA15B   |
    LDA #$0200          ; $0EA15E   |
    SEC                 ; $0EA161   |
    SBC $7A36,x         ; $0EA162   |
    STA $300C           ; $0EA165   |
    LDX #$A90B          ; $0EA168   |
    LDX $86,y           ; $0EA16B   |
    JSL $7EDE44         ; $0EA16D   | GSU init
    LDX $12             ; $0EA171   |
    LDA $7CD6,x         ; $0EA173   |
    SEC                 ; $0EA176   |
    SBC $6094           ; $0EA177   |
    STA $00             ; $0EA17A   |
    REP #$10            ; $0EA17C   |
    LDA $3000           ; $0EA17E   |
    LDY $7400,x         ; $0EA181   |
    BEQ CODE_0EA19E     ; $0EA184   |
    LDY $7362,x         ; $0EA186   |
    LDA $00             ; $0EA189   |
    SEC                 ; $0EA18B   |
    SBC $3000           ; $0EA18C   |
    SEC                 ; $0EA18F   |
    SBC #$0008          ; $0EA190   |
    STA $6000,y         ; $0EA193   |
    LDA $00             ; $0EA196   |
    CLC                 ; $0EA198   |
    ADC $3000           ; $0EA199   |
    BRA CODE_0EA1B4     ; $0EA19C   |

CODE_0EA19E:
    LDY $7362,x         ; $0EA19E   |
    LDA $00             ; $0EA1A1   |
    CLC                 ; $0EA1A3   |
    ADC $3000           ; $0EA1A4   |
    STA $6000,y         ; $0EA1A7   |
    LDA $00             ; $0EA1AA   |
    SEC                 ; $0EA1AC   |
    SBC $3000           ; $0EA1AD   |
    SEC                 ; $0EA1B0   |
    SBC #$0008          ; $0EA1B1   |

CODE_0EA1B4:
    STA $6028,y         ; $0EA1B4   |
    SEP #$10            ; $0EA1B7   |

CODE_0EA1B9:
    JSL $03AF23         ; $0EA1B9   |
    JSR CODE_0EA1CF     ; $0EA1BD   |
    TXY                 ; $0EA1C0   |
    LDA $76,x           ; $0EA1C1   |
    ASL A               ; $0EA1C3   |
    TAX                 ; $0EA1C4   |
    JSR ($A138,x)       ; $0EA1C5   |

    JSR CODE_0EA29F     ; $0EA1C8   |
    JMP CODE_0E0DC1     ; $0EA1CB   |

CODE_0EA1CF:
    LDA $7860,x         ; $0EA1CF   |
    AND #$0001          ; $0EA1D2   |
    BEQ CODE_0EA1E4     ; $0EA1D5   |
    LDY $60AB           ; $0EA1D7   |
    BMI CODE_0EA1E1     ; $0EA1DA   |
    LDY $0D94           ; $0EA1DC   |
    BEQ CODE_0EA1E4     ; $0EA1DF   |

CODE_0EA1E1:
    JMP CODE_0EA290     ; $0EA1E1   |

CODE_0EA1E4:
    LDA #$0006          ; $0EA1E4   |
    STA $3000           ; $0EA1E7   |
    LDA #$0200          ; $0EA1EA   |
    SEC                 ; $0EA1ED   |
    SBC $7A36,x         ; $0EA1EE   |
    STA $300C           ; $0EA1F1   |
    LDX #$0B            ; $0EA1F4   |
    LDA #$86B6          ; $0EA1F6   |
    JSL $7EDE44         ; $0EA1F9   | GSU init
    LDX $12             ; $0EA1FD   |
    LDA $3000           ; $0EA1FF   |
    CLC                 ; $0EA202   |
    ADC $6120           ; $0EA203   |
    STA $00             ; $0EA206   |
    ASL A               ; $0EA208   |
    STA $02             ; $0EA209   |
    LDA $7C16,x         ; $0EA20B   |
    CLC                 ; $0EA20E   |
    ADC $00             ; $0EA20F   |
    CMP $02             ; $0EA211   |
    BCS CODE_0EA1E1     ; $0EA213   |
    LDA #$000C          ; $0EA215   |
    STA $3000           ; $0EA218   |
    LDA $7A36,x         ; $0EA21B   |
    STA $300C           ; $0EA21E   |
    LDX #$0B            ; $0EA221   |
    LDA #$86B6          ; $0EA223   |
    JSL $7EDE44         ; $0EA226   | GSU init
    LDX $12             ; $0EA22A   |
    LDA $7182,x         ; $0EA22C   |
    CLC                 ; $0EA22F   |
    ADC #$000F          ; $0EA230   |
    SEC                 ; $0EA233   |
    SBC $3000           ; $0EA234   |
    SEC                 ; $0EA237   |
    SBC $611E           ; $0EA238   |
    SEC                 ; $0EA23B   |
    SBC $6122           ; $0EA23C   |
    STA $00             ; $0EA23F   |
    CMP #$FFF8          ; $0EA241   |
    BCC CODE_0EA285     ; $0EA244   |
    CPX $61B6           ; $0EA246   |
    BEQ CODE_0EA26B     ; $0EA249   |
    LDY $61B6           ; $0EA24B   |
    BNE CODE_0EA290     ; $0EA24E   |
    STX $61B6           ; $0EA250   |
    LDY $7722,x         ; $0EA253   |
    BPL CODE_0EA264     ; $0EA256   |
    JSL $03AD74         ; $0EA258   |
    BCC CODE_0EA264     ; $0EA25C   |
    LDA #$0004          ; $0EA25E   |
    STA $7402,x         ; $0EA261   |

CODE_0EA264:
    LDY #$02            ; $0EA264   |
    STY $76,x           ; $0EA266   |
    STZ $7220,x         ; $0EA268   |

CODE_0EA26B:
    LDA $6090           ; $0EA26B   |
    SEC                 ; $0EA26E   |
    ADC $00             ; $0EA26F   |
    INC A               ; $0EA271   |
    STA $6090           ; $0EA272   |
    STZ $60D4           ; $0EA275   |
    STZ $60AA           ; $0EA278   |
    INC $61B4           ; $0EA27B   |
    LDA #$7440          ; $0EA27E   |
    STA $6FA0,x         ; $0EA281   |
    RTS                 ; $0EA284   |

CODE_0EA285:
    BPL CODE_0EA290     ; $0EA285   |
    LDY $7D36,x         ; $0EA287   |
    BPL CODE_0EA295     ; $0EA28A   |
    JSL $03A858         ; $0EA28C   |

CODE_0EA290:
    CPX $61B6           ; $0EA290   |
    BNE CODE_0EA298     ; $0EA293   |

CODE_0EA295:
    STZ $61B6           ; $0EA295   |

CODE_0EA298:
    LDA #$7480          ; $0EA298   |
    STA $6FA0,x         ; $0EA29B   |
    RTS                 ; $0EA29E   |

CODE_0EA29F:
    LDY $7722,x         ; $0EA29F   |
    BMI CODE_0EA2F5     ; $0EA2A2   |
    LDA $7A36,x         ; $0EA2A4   |
    STA $3016           ; $0EA2A7   |
    LDA #$0200          ; $0EA2AA   |
    SEC                 ; $0EA2AD   |
    SBC $7A36,x         ; $0EA2AE   |
    STA $300C           ; $0EA2B1   |
    LDA #$0054          ; $0EA2B4   |
    STA $301A           ; $0EA2B7   |
    LDA #$3050          ; $0EA2BA   |
    STA $3018           ; $0EA2BD   |
    LDA #$0008          ; $0EA2C0   |
    STA $3010           ; $0EA2C3   |
    ASL A               ; $0EA2C6   |
    STA $3012           ; $0EA2C7   |
    LDY $7722,x         ; $0EA2CA   |
    TYX                 ; $0EA2CD   |
    LDA $03A9CE,x       ; $0EA2CE   |
    STA $3006           ; $0EA2D2   |
    LDA $03A9EE,x       ; $0EA2D5   |
    STA $3004           ; $0EA2D9   |
    LDX #$08            ; $0EA2DC   |
    LDA #$82FA          ; $0EA2DE   |
    JSL $7EDE44         ; $0EA2E1   | GSU init
    LDX $12             ; $0EA2E5   |
    INC $0CF9           ; $0EA2E7   |
    LDY $7402,x         ; $0EA2EA   |
    CPY #$03            ; $0EA2ED   |
    BNE CODE_0EA2F5     ; $0EA2EF   |
    JSL $03AEFD         ; $0EA2F1   |

CODE_0EA2F5:
    RTS                 ; $0EA2F5   |

DATA_0EA2F6:         dw $FF00, $0100

    TYX                 ; $0EA2FA   |
    LDA $7860,x         ; $0EA2FB   |
    AND #$0001          ; $0EA2FE   |
    BEQ CODE_0EA30B     ; $0EA301   |
    LDA #$0841          ; $0EA303   |
    STA $6FA2,x         ; $0EA306   |
    BRA CODE_0EA30E     ; $0EA309   |

CODE_0EA30B:
    INC $7A96,x         ; $0EA30B   |

CODE_0EA30E:
    LDA $7A96,x         ; $0EA30E   |
    BNE CODE_0EA330     ; $0EA311   |
    LDA $10             ; $0EA313   |
    PHA                 ; $0EA315   |
    AND #$0002          ; $0EA316   |
    STA $7400,x         ; $0EA319   |
    TAY                 ; $0EA31C   |
    LDA $A2F6,y         ; $0EA31D   |
    STA $7220,x         ; $0EA320   |
    PLA                 ; $0EA323   |
    AND #$001F          ; $0EA324   |
    CLC                 ; $0EA327   |
    ADC #$0020          ; $0EA328   |
    STA $7A96,x         ; $0EA32B   |
    INC $76,x           ; $0EA32E   |

CODE_0EA330:
    RTS                 ; $0EA330   |

DATA_0EA331:         dw $0100, $0102

    TYX                 ; $0EA335   |
    LDA $7A96,x         ; $0EA336   |
    BNE CODE_0EA353     ; $0EA339   |
    LDA #$0003          ; $0EA33B   |
    STA $7402,x         ; $0EA33E   |
    LDA $10             ; $0EA341   |
    AND #$000F          ; $0EA343   |
    CLC                 ; $0EA346   |
    ADC #$0008          ; $0EA347   |
    STA $7A96,x         ; $0EA34A   |
    STZ $7220,x         ; $0EA34D   |
    STZ $76,x           ; $0EA350   |
    RTS                 ; $0EA352   |

CODE_0EA353:
    LDA $78,x           ; $0EA353   |
    INC A               ; $0EA355   |
    AND #$0003          ; $0EA356   |
    STA $78,x           ; $0EA359   |
    LDY $78,x           ; $0EA35B   |
    LDA $A331,y         ; $0EA35D   |
    AND #$00FF          ; $0EA360   |
    STA $7402,x         ; $0EA363   |
    RTS                 ; $0EA366   |

DATA_0EA367:         dw $FD00, $0300

    TYX                 ; $0EA36B   |
    LDA $7860,x         ; $0EA36C   |
    LSR A               ; $0EA36F   |
    BCC CODE_0EA37E     ; $0EA370   |
    CPX $61B6           ; $0EA372   |
    BEQ CODE_0EA37F     ; $0EA375   |
    LDA #$0002          ; $0EA377   |
    STA $16,x           ; $0EA37A   |
    INC $76,x           ; $0EA37C   |

CODE_0EA37E:
    RTS                 ; $0EA37E   |

CODE_0EA37F:
    LDA $7A36,x         ; $0EA37F   |
    SEC                 ; $0EA382   |
    SBC #$0010          ; $0EA383   |
    CMP #$0040          ; $0EA386   |
    BPL CODE_0EA392     ; $0EA389   |
    LDA #$0040          ; $0EA38B   |
    STA $7A36,x         ; $0EA38E   |
    RTS                 ; $0EA391   |

CODE_0EA392:
    STA $7A36,x         ; $0EA392   |
    LDA $7A98,x         ; $0EA395   |
    BNE CODE_0EA37E     ; $0EA398   |
    LDA #$0006          ; $0EA39A   |
    STA $3000           ; $0EA39D   |
    LDA #$0200          ; $0EA3A0   |
    SEC                 ; $0EA3A3   |
    SBC $7A36,x         ; $0EA3A4   |
    STA $300C           ; $0EA3A7   |
    LDX #$0B            ; $0EA3AA   |
    LDA #$86B6          ; $0EA3AC   |
    JSL $7EDE44         ; $0EA3AF   | GSU init
    LDX $12             ; $0EA3B3   |
    LDY $7400,x         ; $0EA3B5   |
    LDA $A367,y         ; $0EA3B8   |
    STA $00             ; $0EA3BB   |
    LDA $3000           ; $0EA3BD   |
    CPY #$00            ; $0EA3C0   |
    BNE CODE_0EA3CC     ; $0EA3C2   |
    EOR #$FFFF          ; $0EA3C4   |
    INC A               ; $0EA3C7   |
    SEC                 ; $0EA3C8   |
    SBC #$0010          ; $0EA3C9   |

CODE_0EA3CC:
    STA $02             ; $0EA3CC   |
    LDA #$0006          ; $0EA3CE   |
    STA $3000           ; $0EA3D1   |
    LDA $7A36,x         ; $0EA3D4   |
    STA $300C           ; $0EA3D7   |
    LDX #$0B            ; $0EA3DA   |
    LDA #$86B6          ; $0EA3DC   |
    JSL $7EDE44         ; $0EA3DF   | GSU init
    LDX $12             ; $0EA3E3   |
    LDA #$0019          ; $0EA3E5   |
    JSL $03A364         ; $0EA3E8   |
    BCC CODE_0EA42A     ; $0EA3EC   |
    LDA $7CD6,x         ; $0EA3EE   |
    CLC                 ; $0EA3F1   |
    ADC $02             ; $0EA3F2   |
    STA $70E2,y         ; $0EA3F4   |
    LDA $7182,x         ; $0EA3F7   |
    CLC                 ; $0EA3FA   |
    ADC #$0008          ; $0EA3FB   |
    SEC                 ; $0EA3FE   |
    SBC $3000           ; $0EA3FF   |
    STA $7182,y         ; $0EA402   |
    LDA $00             ; $0EA405   |
    STA $7220,y         ; $0EA407   |
    LDA #$000A          ; $0EA40A   |
    STA $7A98,y         ; $0EA40D   |
    LDA #$0004          ; $0EA410   |
    STA $7402,y         ; $0EA413   |
    DEC A               ; $0EA416   |
    STA $7A98,x         ; $0EA417   |
    LDA $6FA0,y         ; $0EA41A   |
    AND #$F9FF          ; $0EA41D   |
    STA $6FA0,y         ; $0EA420   |
    LDA #$0061          ; $0EA423   |\ play sound #$0061
    JSL $0085D2         ; $0EA426   |/

CODE_0EA42A:
    RTS                 ; $0EA42A   |

DATA_0EA42B:         dw $FFF0, $0020

DATA_0EA42F:         dw $0100, $01C0

    TYX                 ; $0EA433   |
    LDY $16,x           ; $0EA434   |
    LDA $7A36,x         ; $0EA436   |
    CLC                 ; $0EA439   |
    ADC $A42B,y         ; $0EA43A   |
    CMP $A42F,y         ; $0EA43D   |
    PHP                 ; $0EA440   |
    CPY #$00            ; $0EA441   |
    BEQ CODE_0EA458     ; $0EA443   |
    PLP                 ; $0EA445   |
    BMI CODE_0EA46E     ; $0EA446   |
    STZ $16,x           ; $0EA448   |
    LDA #$FC00          ; $0EA44A   |
    STA $7222,x         ; $0EA44D   |
    LDA #$0841          ; $0EA450   |
    STA $6FA2,x         ; $0EA453   |
    BRA CODE_0EA46B     ; $0EA456   |

CODE_0EA458:
    PLP                 ; $0EA458   |
    BPL CODE_0EA46E     ; $0EA459   |
    LDA #$0010          ; $0EA45B   |
    STA $7A96,x         ; $0EA45E   |
    LDA #$0003          ; $0EA461   |
    STA $7402,x         ; $0EA464   |
    STZ $78,x           ; $0EA467   |
    STZ $76,x           ; $0EA469   |

CODE_0EA46B:
    LDA $A42F,y         ; $0EA46B   |

CODE_0EA46E:
    STA $7A36,x         ; $0EA46E   |
    RTS                 ; $0EA471   |

.init_parent_huffin_puffin
    LDA #$0100          ; $0EA472   |
    STA $7A36,x         ; $0EA475   |
    JSL $03AE60         ; $0EA478   |
    LDX #$09            ; $0EA47C   |
    LDA #$91D5          ; $0EA47E   |
    JSL $7EDE44         ; $0EA481   | GSU init
    LDX $12             ; $0EA485   |
    LDA $300C           ; $0EA487   |
    SEC                 ; $0EA48A   |
    SBC #$0006          ; $0EA48B   |
    BPL CODE_0EA4E3     ; $0EA48E   |
    CMP #$FFFE          ; $0EA490   |
    BPL CODE_0EA498     ; $0EA493   |
    LDA #$FFFE          ; $0EA495   |

CODE_0EA498:
    EOR #$FFFF          ; $0EA498   |
    INC A               ; $0EA49B   |
    STA $00             ; $0EA49C   |
    LDA #$0010          ; $0EA49E   |
    STA $02             ; $0EA4A1   |
    TXY                 ; $0EA4A3   |

CODE_0EA4A4:
    STY $04             ; $0EA4A4   |
    LDA #$0028          ; $0EA4A6   |
    JSL $03A364         ; $0EA4A9   |
    BCC CODE_0EA4E3     ; $0EA4AD   |
    LDA $70E2,x         ; $0EA4AF   |
    STA $70E2,y         ; $0EA4B2   |
    LDA $7182,x         ; $0EA4B5   |
    STA $7182,y         ; $0EA4B8   |
    LDA $7400,x         ; $0EA4BB   |
    STA $7400,y         ; $0EA4BE   |
    LDA $02             ; $0EA4C1   |
    STA $7A96,y         ; $0EA4C3   |
    CLC                 ; $0EA4C6   |
    ADC #$0008          ; $0EA4C7   |
    STA $02             ; $0EA4CA   |
    LDA $7974           ; $0EA4CC   |
    STA $7A38,y         ; $0EA4CF   |
    SEP #$20            ; $0EA4D2   |
    TXA                 ; $0EA4D4   |
    STA $7978,y         ; $0EA4D5   |
    LDA $04             ; $0EA4D8   |
    STA $7979,y         ; $0EA4DA   |
    REP #$20            ; $0EA4DD   |
    DEC $00             ; $0EA4DF   |
    BNE CODE_0EA4A4     ; $0EA4E1   |

CODE_0EA4E3:
    JSR CODE_0EA57E     ; $0EA4E3   |
    LDA $7974           ; $0EA4E6   |
    STA $7A38,x         ; $0EA4E9   |
    RTL                 ; $0EA4EC   |

DATA_0EA4ED:         dw $A675
DATA_0EA4EF:         dw $A70E
DATA_0EA4F1:         dw $A745
DATA_0EA4F3:         dw $A768

.main_parent_huffin_puffin
    JSR CODE_0EA519     ; $0EA4F5   |
    JSL $03AF23         ; $0EA4F8   |
    JSR CODE_0EA533     ; $0EA4FC   |
    STZ $0E             ; $0EA4FF   |
    TXY                 ; $0EA501   |
    LDA $76,x           ; $0EA502   |
    ASL A               ; $0EA504   |
    TAX                 ; $0EA505   |
    JSR ($A4ED,x)       ; $0EA506   |

    JSR CODE_0EA57E     ; $0EA509   |
    JSR CODE_0EA5D5     ; $0EA50C   |
    RTL                 ; $0EA50F   |

DATA_0EA510:         db $00, $10, $08, $10, $10, $10, $10, $10
DATA_0EA518:         db $00

CODE_0EA519:
    LDY $7722,x         ; $0EA519   |
    BMI CODE_0EA532     ; $0EA51C   |
    REP #$10            ; $0EA51E   |
    LDY $7402,x         ; $0EA520   |
    LDA $A510,y         ; $0EA523   |
    AND #$00FF          ; $0EA526   |
    CLC                 ; $0EA529   |
    ADC $7362,x         ; $0EA52A   |
    TAY                 ; $0EA52D   |
    JSL $03AA60         ; $0EA52E   |

CODE_0EA532:
    RTS                 ; $0EA532   |

CODE_0EA533:
    LDA #$0010          ; $0EA533   |
    STA $3000           ; $0EA536   |
    LDA $7A36,x         ; $0EA539   |
    STA $300C           ; $0EA53C   |
    LDX #$A90B          ; $0EA53F   |
    LDX $86,y           ; $0EA542   |
    JSL $7EDE44         ; $0EA544   | GSU init
    LDX $12             ; $0EA548   |
    LDA $7182,x         ; $0EA54A   |
    CLC                 ; $0EA54D   |
    ADC #$0010          ; $0EA54E   |
    SEC                 ; $0EA551   |
    SBC $3000           ; $0EA552   |
    SEC                 ; $0EA555   |
    SBC $7CD8,x         ; $0EA556   |
    CLC                 ; $0EA559   |
    ADC $7B58,x         ; $0EA55A   |
    STA $7B58,x         ; $0EA55D   |
    LDA #$000A          ; $0EA560   |
    STA $3000           ; $0EA563   |
    LDA $7A36,x         ; $0EA566   |
    STA $300C           ; $0EA569   |
    LDX #$A90B          ; $0EA56C   |
    LDX $86,y           ; $0EA56F   |
    JSL $7EDE44         ; $0EA571   | GSU init
    LDX $12             ; $0EA575   |
    LDA $3000           ; $0EA577   |
    STA $7BB8,x         ; $0EA57A   |
    RTS                 ; $0EA57D   |

CODE_0EA57E:
    LDY $7722,x         ; $0EA57E   |
    BMI CODE_0EA5D0     ; $0EA581   |
    LDA $7A36,x         ; $0EA583   |
    STA $3016           ; $0EA586   |
    LDA #$0100          ; $0EA589   |
    STA $300C           ; $0EA58C   |
    LDA $0E             ; $0EA58F   |
    BEQ CODE_0EA59D     ; $0EA591   |
    LDA #$0200          ; $0EA593   |
    SEC                 ; $0EA596   |
    SBC $7A36,x         ; $0EA597   |
    STA $300C           ; $0EA59A   |

CODE_0EA59D:
    LDA #$0055          ; $0EA59D   |
    STA $301A           ; $0EA5A0   |
    LDA #$2000          ; $0EA5A3   |
    STA $3018           ; $0EA5A6   |
    LDA #$0010          ; $0EA5A9   |
    STA $3010           ; $0EA5AC   |
    ASL A               ; $0EA5AF   |
    STA $3012           ; $0EA5B0   |
    TYX                 ; $0EA5B3   |
    LDA $03A9CE,x       ; $0EA5B4   |
    STA $3006           ; $0EA5B8   |
    LDA $03A9EE,x       ; $0EA5BB   |
    STA $3004           ; $0EA5BF   |
    LDX #$A908          ; $0EA5C2   |
    STA $82,x           ; $0EA5C5   |
    JSL $7EDE44         ; $0EA5C7   | GSU init
    LDX $12             ; $0EA5CB   |
    INC $0CF9           ; $0EA5CD   |

CODE_0EA5D0:
    RTS                 ; $0EA5D0   |

DATA_0EA5D1:         dw $FE00, $0200

CODE_0EA5D5:
    LDY $7D36,x         ; $0EA5D5   |
    BMI CODE_0EA5F2     ; $0EA5D8   |
    BEQ CODE_0EA5F1     ; $0EA5DA   |
    LDA $6EFF,y         ; $0EA5DC   |
    CMP #$0010          ; $0EA5DF   |
    BNE CODE_0EA5F1     ; $0EA5E2   |
    LDA $7D37,y         ; $0EA5E4   |
    BEQ CODE_0EA5F1     ; $0EA5E7   |
    DEY                 ; $0EA5E9   |
    TYX                 ; $0EA5EA   |
    JSL $03B25B         ; $0EA5EB   |
    BRA CODE_0EA62D     ; $0EA5EF   |

CODE_0EA5F1:
    RTS                 ; $0EA5F1   |

CODE_0EA5F2:
    LDA $60FC           ; $0EA5F2   |
    AND #$0018          ; $0EA5F5   |
    BNE CODE_0EA660     ; $0EA5F8   |
    LDY $60AB           ; $0EA5FA   |
    BMI CODE_0EA64B     ; $0EA5FD   |
    LDY $60C0           ; $0EA5FF   |
    BEQ CODE_0EA64B     ; $0EA602   |
    LDA $7C18,x         ; $0EA604   |
    SEC                 ; $0EA607   |
    SBC $7BB8,x         ; $0EA608   |
    SEC                 ; $0EA60B   |
    SBC $6122           ; $0EA60C   |
    CMP #$FFF8          ; $0EA60F   |
    BCC CODE_0EA64B     ; $0EA612   |
    LDA #$FA00          ; $0EA614   |
    STA $60AA           ; $0EA617   |
    LDA #$0006          ; $0EA61A   |
    STA $60C0           ; $0EA61D   |
    STZ $60D2           ; $0EA620   |
    STZ $60D4           ; $0EA623   |
    LDA #$001C          ; $0EA626   |\ play sound #$001C
    JSL $0085D2         ; $0EA629   |/

CODE_0EA62D:
    LDA #$0006          ; $0EA62D   |
    STA $7402,x         ; $0EA630   |
    STA $16,x           ; $0EA633   |
    STZ $7220,x         ; $0EA635   |
    LDY #$9401          ; $0EA638   |
    ROR $94,x           ; $0EA63B   |
    CLC                 ; $0EA63D   |
    LDA $6FA2,x         ; $0EA63E   |
    AND #$F83F          ; $0EA641   |
    ORA #$0480          ; $0EA644   |
    STA $6FA2,x         ; $0EA647   |
    RTS                 ; $0EA64A   |

CODE_0EA64B:
    LDA #$FC00          ; $0EA64B   |
    STA $60AA           ; $0EA64E   |
    LDA #$0006          ; $0EA651   |
    STA $60C0           ; $0EA654   |
    LDA #$8001          ; $0EA657   |
    STA $60D2           ; $0EA65A   |
    STZ $60D4           ; $0EA65D   |

CODE_0EA660:
    LDY $77C2,x         ; $0EA660   |
    LDA $A5D1,y         ; $0EA663   |
    STA $60A8           ; $0EA666   |
    STA $60B4           ; $0EA669   |
    RTS                 ; $0EA66C   |

DATA_0EA66D:         dw $FF40, $00C0

DATA_0EA671:         dw $FFFE, $0002

    TYX                 ; $0EA675   |
    LDY $18,x           ; $0EA676   |
    BEQ CODE_0EA684     ; $0EA678   |
    LDY $77C2,x         ; $0EA67A   |
    TYA                 ; $0EA67D   |
    EOR #$0002          ; $0EA67E   |
    STA $7400,x         ; $0EA681   |

CODE_0EA684:
    LDY $7400,x         ; $0EA684   |
    LDA $A66D,y         ; $0EA687   |
    LDY $18,x           ; $0EA68A   |
    BEQ CODE_0EA68F     ; $0EA68C   |
    ASL A               ; $0EA68E   |

CODE_0EA68F:
    STA $7220,x         ; $0EA68F   |
    JSR CODE_0EA6E1     ; $0EA692   |
    LDA $7A98,x         ; $0EA695   |
    BNE CODE_0EA6B5     ; $0EA698   |
    LDA #$0008          ; $0EA69A   |
    LDY $18,x           ; $0EA69D   |
    BEQ CODE_0EA6A3     ; $0EA69F   |
    LSR A               ; $0EA6A1   |
    LSR A               ; $0EA6A2   |

CODE_0EA6A3:
    STA $7A98,x         ; $0EA6A3   |
    LDA $7402,x         ; $0EA6A6   |
    INC A               ; $0EA6A9   |
    CMP #$0006          ; $0EA6AA   |
    BNE CODE_0EA6B2     ; $0EA6AD   |
    LDA #$0000          ; $0EA6AF   |

CODE_0EA6B2:
    STA $7402,x         ; $0EA6B2   |

CODE_0EA6B5:
    LDA $7402,x         ; $0EA6B5   |
    INC A               ; $0EA6B8   |
    AND #$0004          ; $0EA6B9   |
    LSR A               ; $0EA6BC   |
    TAY                 ; $0EA6BD   |
    LDA $A671,y         ; $0EA6BE   |
    LDY $18,x           ; $0EA6C1   |
    BEQ CODE_0EA6C7     ; $0EA6C3   |
    ASL A               ; $0EA6C5   |
    ASL A               ; $0EA6C6   |

CODE_0EA6C7:
    CLC                 ; $0EA6C7   |
    ADC $7A36,x         ; $0EA6C8   |
    CMP #$010C          ; $0EA6CB   |
    BMI CODE_0EA6D3     ; $0EA6CE   |
    LDA #$010C          ; $0EA6D0   |

CODE_0EA6D3:
    CMP #$00F0          ; $0EA6D3   |
    BPL CODE_0EA6DB     ; $0EA6D6   |
    LDA #$00F0          ; $0EA6D8   |

CODE_0EA6DB:
    STA $7A36,x         ; $0EA6DB   |
    INC $0E             ; $0EA6DE   |
    RTS                 ; $0EA6E0   |

; huffin running sub

CODE_0EA6E1:
    LDA $7860,x         ; $0EA6E1   |
    AND #$000C          ; $0EA6E4   |
    BEQ CODE_0EA6F5     ; $0EA6E7   |
    AND #$0008          ; $0EA6E9   |
    DEC A               ; $0EA6EC   |
    EOR $7220,x         ; $0EA6ED   |
    BPL CODE_0EA6F5     ; $0EA6F0   |
    STZ $7220,x         ; $0EA6F2   |

CODE_0EA6F5:
    RTS                 ; $0EA6F5   |

DATA_0EA6F6:         dw $0100, $00C0, $0120, $0080

DATA_0EA6FE:         dw $0018, $FFE8, $0010, $FFF0
DATA_0EA706:         dw $FFFF, $0000, $FFFF, $0000

    TYX                 ; $0EA70E   |
    LDA $7860,x         ; $0EA70F   |
    AND #$0001          ; $0EA712   |
    BEQ CODE_0EA744     ; $0EA715   |
    LDY $16,x           ; $0EA717   |
    LDA $7A36,x         ; $0EA719   |
    SEC                 ; $0EA71C   |
    SBC $A6F6,y         ; $0EA71D   |
    EOR $A706,y         ; $0EA720   |
    BPL CODE_0EA73A     ; $0EA723   |
    LDA $A6F6,y         ; $0EA725   |
    STA $7A36,x         ; $0EA728   |
    DEC $16,x           ; $0EA72B   |
    DEC $16,x           ; $0EA72D   |
    BPL CODE_0EA739     ; $0EA72F   |
    LDA #$0020          ; $0EA731   |
    STA $7A98,x         ; $0EA734   |
    INC $76,x           ; $0EA737   |

CODE_0EA739:
    RTS                 ; $0EA739   |

CODE_0EA73A:
    LDA $7A36,x         ; $0EA73A   |
    CLC                 ; $0EA73D   |
    ADC $A6FE,y         ; $0EA73E   |
    STA $7A36,x         ; $0EA741   |

CODE_0EA744:
    RTS                 ; $0EA744   |

    TYX                 ; $0EA745   |
    LDA $7A98,x         ; $0EA746   |
    BNE CODE_0EA767     ; $0EA749   |
    INC $7402,x         ; $0EA74B   |
    LDY $7402,x         ; $0EA74E   |
    CPY #$08            ; $0EA751   |
    BNE CODE_0EA761     ; $0EA753   |
    LDA #$FC00          ; $0EA755   |
    STA $7222,x         ; $0EA758   |
    STZ $7860,x         ; $0EA75B   |
    INC $76,x           ; $0EA75E   |
    RTS                 ; $0EA760   |

CODE_0EA761:
    LDA #$0004          ; $0EA761   |
    STA $7A98,x         ; $0EA764   |

CODE_0EA767:
    RTS                 ; $0EA767   |

    TYX                 ; $0EA768   |
    LDY $7223,x         ; $0EA769   |
    BMI CODE_0EA77E     ; $0EA76C   |
    LDA #$0005          ; $0EA76E   |
    STA $7402,x         ; $0EA771   |
    LDA $7860,x         ; $0EA774   |
    AND #$0001          ; $0EA777   |
    BEQ CODE_0EA77E     ; $0EA77A   |
    STZ $76,x           ; $0EA77C   |

CODE_0EA77E:
    RTS                 ; $0EA77E   |

.init_huffin_puffin_running
    RTL                 ; $0EA77F   |

huffin_running_state_ptr:
DATA_0EA780:         dw $A8FC                ; state 00
DATA_0EA782:         dw $A96A                ; state 01
DATA_0EA784:         dw $A9EF                ; state 02

DATA_0EA786:         dw $0006
DATA_0EA788:         dw $FFFA
DATA_0EA78A:         dw $FFB0
DATA_0EA78C:         dw $0050
DATA_0EA78E:         dw $FC00
DATA_0EA790:         dw $0400

.main_huffin_puffin_running
    LDA $7D38,x         ; $0EA792   |
    BEQ CODE_0EA7B1     ; $0EA795   |
    STA $7902,x         ; $0EA797   |
    LSR A               ; $0EA79A   |
    BNE CODE_0EA7B4     ; $0EA79B   |
    LDY $7D36,x         ; $0EA79D   |
    BPL CODE_0EA7B4     ; $0EA7A0   |
    LDA $60AE           ; $0EA7A2   |
    ORA $7A36,x         ; $0EA7A5   |
    BNE CODE_0EA7B4     ; $0EA7A8   |
    STZ $7D38,x         ; $0EA7AA   |
    JSL $03BEB9         ; $0EA7AD   |

CODE_0EA7B1:
    JMP CODE_0EA898     ; $0EA7B1   |

CODE_0EA7B4:
    LDA $7542,x         ; $0EA7B4   |
    CMP #$0040          ; $0EA7B7   |
    BCC CODE_0EA7BF     ; $0EA7BA   |
    JMP CODE_0EA898     ; $0EA7BC   |

CODE_0EA7BF:
    LDA $7C16,x         ; $0EA7BF   |
    STA $3002           ; $0EA7C2   |
    LDA $7C18,x         ; $0EA7C5   |
    STA $3004           ; $0EA7C8   |

    LDX #$0B            ; $0EA7CB   |
    LDA #$BCF8          ; $0EA7CD   |
    JSL $7EDE44         ; $0EA7D0   | GSU init
    LDX $12             ; $0EA7D4   |
    LDA $3000           ; $0EA7D6   |
    LDY $0B57           ; $0EA7D9   |
    BEQ CODE_0EA7E1     ; $0EA7DC   |
    EOR #$0100          ; $0EA7DE   |

CODE_0EA7E1:
    BIT $7900,x         ; $0EA7E1   |
    BMI CODE_0EA7ED     ; $0EA7E4   |
    EOR #$00FF          ; $0EA7E6   |
    INC A               ; $0EA7E9   |
    AND #$01FE          ; $0EA7EA   |

CODE_0EA7ED:
    SEC                 ; $0EA7ED   |
    SBC $7900,x         ; $0EA7EE   |
    AND #$01FE          ; $0EA7F1   |
    STA $00             ; $0EA7F4   |
    BIT #$0100          ; $0EA7F6   |
    BEQ CODE_0EA7FF     ; $0EA7F9   |
    EOR #$01FF          ; $0EA7FB   |
    INC A               ; $0EA7FE   |

CODE_0EA7FF:
    LDY #$00            ; $0EA7FF   |
    CMP #$0080          ; $0EA801   |
    BCS CODE_0EA80F     ; $0EA804   |
    LDA $00             ; $0EA806   |
    AND #$0100          ; $0EA808   |
    BEQ CODE_0EA80F     ; $0EA80B   |
    LDY #$02            ; $0EA80D   |

CODE_0EA80F:
    LDA $7900,x         ; $0EA80F   |
    CLC                 ; $0EA812   |
    ADC $A786,y         ; $0EA813   |
    AND #$01FE          ; $0EA816   |
    REP #$10            ; $0EA819   |
    TAY                 ; $0EA81B   |
    BIT $7900,x         ; $0EA81C   |
    BPL CODE_0EA824     ; $0EA81F   |
    ORA #$8000          ; $0EA821   |

CODE_0EA824:
    STA $7900,x         ; $0EA824   |
    TYX                 ; $0EA827   |
    LDY #$0000          ; $0EA828   |
    LDA $00E9D4,x       ; $0EA82B   |
    ASL A               ; $0EA82F   |
    ASL A               ; $0EA830   |
    BMI CODE_0EA836     ; $0EA831   |
    LDY #$0002          ; $0EA833   |

CODE_0EA836:
    STA $02             ; $0EA836   |
    STY $04             ; $0EA838   |
    LDA $00E954,x       ; $0EA83A   |
    ASL A               ; $0EA83E   |
    ASL A               ; $0EA83F   |
    SEP #$10            ; $0EA840   |
    LDX $12             ; $0EA842   |
    BIT $7900,x         ; $0EA844   |
    BMI CODE_0EA84D     ; $0EA847   |
    EOR #$FFFF          ; $0EA849   |
    INC A               ; $0EA84C   |

CODE_0EA84D:
    LDY #$00            ; $0EA84D   |
    CMP #$0000          ; $0EA84F   |
    BMI CODE_0EA856     ; $0EA852   |
    LDY #$02            ; $0EA854   |

CODE_0EA856:
    STA $00             ; $0EA856   |
    SEC                 ; $0EA858   |
    SBC $7220,x         ; $0EA859   |
    EOR $00             ; $0EA85C   |
    BPL CODE_0EA865     ; $0EA85E   |
    TYA                 ; $0EA860   |
    EOR #$0002          ; $0EA861   |
    TAY                 ; $0EA864   |

CODE_0EA865:
    LDA $7220,x         ; $0EA865   |
    CLC                 ; $0EA868   |
    ADC $A78A,y         ; $0EA869   |
    STA $7220,x         ; $0EA86C   |
    AND #$8000          ; $0EA86F   |
    BEQ CODE_0EA877     ; $0EA872   |
    LDA #$0002          ; $0EA874   |

CODE_0EA877:
    EOR #$0002          ; $0EA877   |
    STA $7400,x         ; $0EA87A   |
    LDY $04             ; $0EA87D   |
    LDA $7222,x         ; $0EA87F   |
    SEC                 ; $0EA882   |
    SBC $02             ; $0EA883   |
    EOR $02             ; $0EA885   |
    BMI CODE_0EA88E     ; $0EA887   |
    TYA                 ; $0EA889   |
    EOR #$0002          ; $0EA88A   |
    TAY                 ; $0EA88D   |

CODE_0EA88E:
    LDA $7222,x         ; $0EA88E   |
    CLC                 ; $0EA891   |
    ADC $A78A,y         ; $0EA892   |
    STA $7222,x         ; $0EA895   |

CODE_0EA898:
    JSL $03B9DD         ; $0EA898   |
    LDA $78,x           ; $0EA89C   |
    BEQ CODE_0EA8A3     ; $0EA89E   |
    JMP CODE_0EAA25     ; $0EA8A0   |

CODE_0EA8A3:
    LDA $7A36,x         ; $0EA8A3   |
    BMI CODE_0EA8F7     ; $0EA8A6   |
    LSR A               ; $0EA8A8   |
    BNE CODE_0EA8B3     ; $0EA8A9   |
    TXY                 ; $0EA8AB   |
    LDA $76,x           ; $0EA8AC   |
    ASL A               ; $0EA8AE   |
    TAX                 ; $0EA8AF   |
    JSR ($A780,x)       ; $0EA8B0   |

CODE_0EA8B3:
    LDY $7D36,x         ; $0EA8B3   |
    BPL CODE_0EA8E0     ; $0EA8B6   |
    LDA $7AF6,x         ; $0EA8B8   |
    BNE CODE_0EA8E0     ; $0EA8BB   |
    LDY $18,x           ; $0EA8BD   |
    BMI CODE_0EA8C6     ; $0EA8BF   |
    LDA $7978,y         ; $0EA8C1   |
    BEQ CODE_0EA8E0     ; $0EA8C4   |

CODE_0EA8C6:
    LDA $60AE           ; $0EA8C6   |
    BNE CODE_0EA8E0     ; $0EA8C9   |
    LDA $7860,x         ; $0EA8CB   |
    AND #$0001          ; $0EA8CE   |
    BNE CODE_0EA8D8     ; $0EA8D1   |
    LDA $7222,x         ; $0EA8D3   |
    BMI CODE_0EA8E0     ; $0EA8D6   |

CODE_0EA8D8:
    LDY #$FF            ; $0EA8D8   |
    STY $19,x           ; $0EA8DA   |
    JSL $03BEB9         ; $0EA8DC   |

CODE_0EA8E0:
    LDY $19,x           ; $0EA8E0   |
    STY $02             ; $0EA8E2   |
    LDY $18,x           ; $0EA8E4   |
    BMI CODE_0EA8F7     ; $0EA8E6   |
    CPY $02             ; $0EA8E8   |
    BEQ CODE_0EA8F7     ; $0EA8EA   |
    LDY $02             ; $0EA8EC   |
    LDA $79D8,y         ; $0EA8EE   |
    BEQ CODE_0EA8F7     ; $0EA8F1   |
    LDY $18,x           ; $0EA8F3   |
    STY $19,x           ; $0EA8F5   |

CODE_0EA8F7:
    RTL                 ; $0EA8F7   |

DATA_0EA8F8:         dw $FFC0
DATA_0EA8FA:         dw $0040

; huffin running state 00
    TYX                 ; $0EA8FC   |
    JSR CODE_0EA9C2     ; $0EA8FD   |
    LDA $7A96,x         ; $0EA900   |
    BNE CODE_0EA965     ; $0EA903   |
    LDY $19,x           ; $0EA905   |
    BPL CODE_0EA912     ; $0EA907   |
    LDA $77C2,x         ; $0EA909   |
    EOR #$0002          ; $0EA90C   |
    TAY                 ; $0EA90F   |
    BRA CODE_0EA92B     ; $0EA910   |

CODE_0EA912:
    LDA $7CD6,y         ; $0EA912   |
    SEC                 ; $0EA915   |
    SBC $7CD6,x         ; $0EA916   |
    CLC                 ; $0EA919   |
    ADC #$0020          ; $0EA91A   |
    CMP #$0040          ; $0EA91D   |
    BCC CODE_0EA938     ; $0EA920   |
    LDY #$00            ; $0EA922   |
    CMP #$0000          ; $0EA924   |
    BMI CODE_0EA92B     ; $0EA927   |
    INY                 ; $0EA929   |
    INY                 ; $0EA92A   |

CODE_0EA92B:
    TYA                 ; $0EA92B   |
    STA $7400,x         ; $0EA92C   |
    LDA #$0004          ; $0EA92F   |
    STA $7402,x         ; $0EA932   |
    INC $76,x           ; $0EA935   |
    RTS                 ; $0EA937   |

CODE_0EA938:
    LDY $18,x           ; $0EA938   |
    BMI CODE_0EA93F     ; $0EA93A   |
    LDA $7978,y         ; $0EA93C   |

CODE_0EA93F:
    PHP                 ; $0EA93F   |
    LDY $7400,x         ; $0EA940   |
    LDA $A8F8,y         ; $0EA943   |
    PLP                 ; $0EA946   |
    BEQ CODE_0EA94A     ; $0EA947   |
    ASL A               ; $0EA949   |

CODE_0EA94A:
    STA $7220,x         ; $0EA94A   |
    JSR CODE_0EA6E1     ; $0EA94D   |
    LDA $7A98,x         ; $0EA950   |
    BNE CODE_0EA965     ; $0EA953   |
    LDA #$0004          ; $0EA955   |
    STA $7A98,x         ; $0EA958   |
    LDA $7402,x         ; $0EA95B   |
    INC A               ; $0EA95E   |
    AND #$0003          ; $0EA95F   |
    STA $7402,x         ; $0EA962   |

CODE_0EA965:
    RTS                 ; $0EA965   |

DATA_0EA966:         dw $FF00
DATA_0EA968:         dw $0100

; huffin running state 01
    TYX                 ; $0EA96A   |
    JSR CODE_0EA9C2     ; $0EA96B   |
    LDY $19,x           ; $0EA96E   |
    BPL CODE_0EA97E     ; $0EA970   |
    LDA $77C2,x         ; $0EA972   |
    EOR #$0002          ; $0EA975   |
    STA $7400,x         ; $0EA978   |
    TAY                 ; $0EA97B   |
    BRA CODE_0EA997     ; $0EA97C   |

CODE_0EA97E:
    LDA $7CD6,y         ; $0EA97E   |
    SEC                 ; $0EA981   |
    SBC $7CD6,x         ; $0EA982   |
    CLC                 ; $0EA985   |
    ADC #$0018          ; $0EA986   |
    CMP #$0030          ; $0EA989   |
    BCS CODE_0EA997     ; $0EA98C   |
    LDA #$0002          ; $0EA98E   |
    STA $7402,x         ; $0EA991   |
    DEC $76,x           ; $0EA994   |
    RTS                 ; $0EA996   |

CODE_0EA997:
    LDY $18,x           ; $0EA997   |
    BMI CODE_0EA99E     ; $0EA999   |
    LDA $7978,y         ; $0EA99B   |

CODE_0EA99E:
    PHP                 ; $0EA99E   |
    LDY $7400,x         ; $0EA99F   |
    LDA $A966,y         ; $0EA9A2   |
    PLP                 ; $0EA9A5   |
    BEQ CODE_0EA9A9     ; $0EA9A6   |
    ASL A               ; $0EA9A8   |

CODE_0EA9A9:
    STA $7220,x         ; $0EA9A9   |
    JSR CODE_0EA6E1     ; $0EA9AC   |

CODE_0EA9AF:
    LDA $7A98,x         ; $0EA9AF   |
    BNE CODE_0EA9C1     ; $0EA9B2   |
    LDA #$0002          ; $0EA9B4   |
    STA $7A98,x         ; $0EA9B7   |
    DEC A               ; $0EA9BA   |
    EOR $7402,x         ; $0EA9BB   |
    STA $7402,x         ; $0EA9BE   |

CODE_0EA9C1:
    RTS                 ; $0EA9C1   |

; huffin running sub

CODE_0EA9C2:
    LDY $18,x           ; $0EA9C2   |
    BMI CODE_0EA9EA     ; $0EA9C4   |
    LDA $6F00,y         ; $0EA9C6   |
    CMP #$0010          ; $0EA9C9   |
    BNE CODE_0EA9DE     ; $0EA9CC   |
    LDA $7360,y         ; $0EA9CE   |
    CMP #$00F6          ; $0EA9D1   |
    BNE CODE_0EA9DE     ; $0EA9D4   |
    LDA $7A38,y         ; $0EA9D6   |
    CMP $7A38,x         ; $0EA9D9   |
    BEQ CODE_0EA9EA     ; $0EA9DC   |

CODE_0EA9DE:
    STZ $7220,x         ; $0EA9DE   |
    LDA #$0002          ; $0EA9E1   |
    STA $7402,x         ; $0EA9E4   |
    STA $76,x           ; $0EA9E7   |
    PLA                 ; $0EA9E9   |

CODE_0EA9EA:
    RTS                 ; $0EA9EA   |

DATA_0EA9EB:         dw $0280
DATA_0EA9ED:         dw $FD80

; huffin running state 02
    TYX                 ; $0EA9EF   |
    LDY $77C2,x         ; $0EA9F0   |
    TYA                 ; $0EA9F3   |
    EOR #$0002          ; $0EA9F4   |
    STA $7400,x         ; $0EA9F7   |
    LDA $A9EB,y         ; $0EA9FA   |
    STA $7220,x         ; $0EA9FD   |
    JSR CODE_0EA6E1     ; $0EAA00   |
    BRA CODE_0EA9AF     ; $0EAA03   |

DATA_0EAA05:         dw $0000, $0000, $FFFF, $FFFE
DATA_0EAA0D:         dw $FFFE, $FFFD, $FFFD, $FFFD
DATA_0EAA15:         dw $FFFD, $FFFE, $FFFE, $FFFF
DATA_0EAA1D:         dw $FFFF, $0000, $0000, $0000

; huffin running sub

CODE_0EAA25:
    JSL $03BB1D         ; $0EAA25   |
    LDA $70E2,x         ; $0EAA29   |
    SEC                 ; $0EAA2C   |
    SBC $6EBC           ; $0EAA2D   |
    STA $00             ; $0EAA30   |
    BNE CODE_0EAA45     ; $0EAA32   |
    LDA $60A8           ; $0EAA34   |
    BEQ CODE_0EAA51     ; $0EAA37   |
    PHP                 ; $0EAA39   |
    LDA #$0001          ; $0EAA3A   |
    PLP                 ; $0EAA3D   |
    BPL CODE_0EAA43     ; $0EAA3E   |
    LDA #$FFFF          ; $0EAA40   |

CODE_0EAA43:
    STA $00             ; $0EAA43   |

CODE_0EAA45:
    ASL A               ; $0EAA45   |
    ROL A               ; $0EAA46   |
    ASL A               ; $0EAA47   |
    AND #$0002          ; $0EAA48   |
    EOR #$0002          ; $0EAA4B   |
    STA $7400,x         ; $0EAA4E   |

CODE_0EAA51:
    LDA #$0006          ; $0EAA51   |
    STA $7402,x         ; $0EAA54   |
    LDA $0812,y         ; $0EAA57   |
    AND #$FF00          ; $0EAA5A   |
    BEQ CODE_0EAA66     ; $0EAA5D   |
    BMI CODE_0EAAA0     ; $0EAA5F   |
    STZ $7402,x         ; $0EAA61   |
    BRA CODE_0EAAA0     ; $0EAA64   |

CODE_0EAA66:
    LDA $00             ; $0EAA66   |
    BNE CODE_0EAA7E     ; $0EAA68   |
    LDA $16,x           ; $0EAA6A   |
    AND #$000F          ; $0EAA6C   |
    ASL A               ; $0EAA6F   |
    TAY                 ; $0EAA70   |
    LDA $AA05,y         ; $0EAA71   |
    BNE CODE_0EAAA7     ; $0EAA74   |
    LDA #$0002          ; $0EAA76   |
    STA $7402,x         ; $0EAA79   |
    BRA CODE_0EAAA7     ; $0EAA7C   |

CODE_0EAA7E:
    LDA $00             ; $0EAA7E   |
    BPL CODE_0EAA86     ; $0EAA80   |
    EOR #$FFFF          ; $0EAA82   |
    INC A               ; $0EAA85   |

CODE_0EAA86:
    TAY                 ; $0EAA86   |
    XBA                 ; $0EAA87   |
    CLC                 ; $0EAA88   |
    ADC $16,x           ; $0EAA89   |
    STA $16,x           ; $0EAA8B   |
    XBA                 ; $0EAA8D   |
    LSR A               ; $0EAA8E   |
    LSR A               ; $0EAA8F   |
    AND #$0003          ; $0EAA90   |
    CPY #$02            ; $0EAA93   |
    BCC CODE_0EAA9D     ; $0EAA95   |
    AND #$0001          ; $0EAA97   |
    ORA #$0004          ; $0EAA9A   |

CODE_0EAA9D:
    STA $7402,x         ; $0EAA9D   |

CODE_0EAAA0:
    LDA $16,x           ; $0EAAA0   |
    AND #$000F          ; $0EAAA2   |
    BEQ CODE_0EAAAA     ; $0EAAA5   |

CODE_0EAAA7:
    LDA #$0001          ; $0EAAA7   |

CODE_0EAAAA:
    SEP #$10            ; $0EAAAA   |
    CLC                 ; $0EAAAC   |
    ADC $16,x           ; $0EAAAD   |
    STA $16,x           ; $0EAAAF   |
    AND #$000F          ; $0EAAB1   |
    ASL A               ; $0EAAB4   |
    TAY                 ; $0EAAB5   |
    LDA $7182,x         ; $0EAAB6   |
    CLC                 ; $0EAAB9   |
    ADC $AA05,y         ; $0EAABA   |
    STA $7182,x         ; $0EAABD   |
    RTL                 ; $0EAAC0   |

DATA_0EAAC1:         dw $0040
DATA_0EAAC3:         dw $01C0

.init_blow_hard
    LDY $7400,x         ; $0EAAC5   |
    LDA $AAC1,y         ; $0EAAC8   |
    STA $78,x           ; $0EAACB   |
    LDA #$0100          ; $0EAACD   |
    STA $7A36,x         ; $0EAAD0   |
    LDA #$FFFF          ; $0EAAD3   |
    STA $7900,x         ; $0EAAD6   |
    RTL                 ; $0EAAD9   |

blow_hard_state_ptr:
DATA_0EAADA:         dw $AD45, $AD5A, $AD8F, $AE14
DATA_0EAAE2:         dw $AE31, $AEEF, $AF36, $AF70
DATA_0EAAEA:         dw $B032, $B05A, $B08C

.main_blow_hard
    JSR CODE_0EAB30     ; $0EAAF0   |
    LDA $7D96,x         ; $0EAAF3   |
    BEQ CODE_0EAB03     ; $0EAAF6   |
    LDA $7360,x         ; $0EAAF8   |
    CMP #$004C          ; $0EAAFB   |
    BNE CODE_0EAB03     ; $0EAAFE   |
    STZ $6FA2,x         ; $0EAB00   |

CODE_0EAB03:
    JSL $03AF23         ; $0EAB03   |
    JSR CODE_0EABC0     ; $0EAB07   |
    JSR CODE_0EABAC     ; $0EAB0A   |
    LDY $76,x           ; $0EAB0D   |
    TYA                 ; $0EAB0F   |
    ASL A               ; $0EAB10   |
    TXY                 ; $0EAB11   |
    TAX                 ; $0EAB12   |
    JSR ($AADA,x)       ; $0EAB13   |

    JSR CODE_0EAC07     ; $0EAB16   |
    JSR CODE_0EACB4     ; $0EAB19   |
    LDA #$3155          ; $0EAB1C   |
    LDY $76,x           ; $0EAB1F   |
    CPY #$07            ; $0EAB21   |
    BMI CODE_0EAB28     ; $0EAB23   |
    LDA #$3055          ; $0EAB25   |

CODE_0EAB28:
    STA $7040,x         ; $0EAB28   |
    RTL                 ; $0EAB2B   |

DATA_0EAB2C:         dw $FFFC, $0004

CODE_0EAB30:
    LDY $7402,x         ; $0EAB30   |
    BNE CODE_0EAB36     ; $0EAB33   |
    RTS                 ; $0EAB35   |

CODE_0EAB36:
    JSL $03AA52         ; $0EAB36   |
    LDA $7CD6,x         ; $0EAB3A   |
    SEC                 ; $0EAB3D   |
    SBC $6094           ; $0EAB3E   |
    STA $00             ; $0EAB41   |
    SEC                 ; $0EAB43   |
    SBC #$0010          ; $0EAB44   |
    STA $02             ; $0EAB47   |
    LDA $7042,x         ; $0EAB49   |
    AND #$0080          ; $0EAB4C   |
    ASL A               ; $0EAB4F   |
    ASL A               ; $0EAB50   |
    XBA                 ; $0EAB51   |
    TAY                 ; $0EAB52   |
    LDA $7CD8,x         ; $0EAB53   |
    CLC                 ; $0EAB56   |
    ADC $AB2C,y         ; $0EAB57   |
    SEC                 ; $0EAB5A   |
    SBC $609C           ; $0EAB5B   |
    STA $04             ; $0EAB5E   |
    SEC                 ; $0EAB60   |
    SBC #$0010          ; $0EAB61   |
    STA $06             ; $0EAB64   |
    LDY $7400,x         ; $0EAB66   |
    BEQ CODE_0EAB75     ; $0EAB69   |
    LDA $00             ; $0EAB6B   |
    PHA                 ; $0EAB6D   |
    LDA $02             ; $0EAB6E   |
    STA $00             ; $0EAB70   |
    PLA                 ; $0EAB72   |
    STA $02             ; $0EAB73   |

CODE_0EAB75:
    LDY $7042,x         ; $0EAB75   |
    BPL CODE_0EAB84     ; $0EAB78   |
    LDA $04             ; $0EAB7A   |
    PHA                 ; $0EAB7C   |
    LDA $06             ; $0EAB7D   |
    STA $04             ; $0EAB7F   |
    PLA                 ; $0EAB81   |
    STA $06             ; $0EAB82   |

CODE_0EAB84:
    REP #$10            ; $0EAB84   |
    LDY $7362,x         ; $0EAB86   |
    LDA $02             ; $0EAB89   |
    STA $6000,y         ; $0EAB8B   |
    STA $6010,y         ; $0EAB8E   |
    LDA $00             ; $0EAB91   |
    STA $6008,y         ; $0EAB93   |
    STA $6018,y         ; $0EAB96   |
    LDA $04             ; $0EAB99   |
    STA $6012,y         ; $0EAB9B   |
    STA $601A,y         ; $0EAB9E   |
    LDA $06             ; $0EABA1   |
    STA $6002,y         ; $0EABA3   |
    STA $600A,y         ; $0EABA6   |
    SEP #$10            ; $0EABA9   |
    RTS                 ; $0EABAB   |

CODE_0EABAC:
    LDY $7D36,x         ; $0EABAC   |
    BPL CODE_0EABBB     ; $0EABAF   |
    LDY $76,x           ; $0EABB1   |
    CPY #$09            ; $0EABB3   |
    BPL CODE_0EABBB     ; $0EABB5   |
    CPY #$06            ; $0EABB7   |
    BPL CODE_0EABBF     ; $0EABB9   |

CODE_0EABBB:
    JSL $03B22F         ; $0EABBB   |

CODE_0EABBF:
    RTS                 ; $0EABBF   |

CODE_0EABC0:
    LDY $76,x           ; $0EABC0   |
    CPY #$06            ; $0EABC2   |
    BPL CODE_0EABDE     ; $0EABC4   |
    LDA $61C6           ; $0EABC6   |
    BNE CODE_0EABDF     ; $0EABC9   |
    LDY $7D36,x         ; $0EABCB   |
    DEY                 ; $0EABCE   |
    BMI CODE_0EABDE     ; $0EABCF   |
    LDA $6F00,y         ; $0EABD1   |
    CMP #$0010          ; $0EABD4   |
    BNE CODE_0EABDE     ; $0EABD7   |
    LDA $7D38,y         ; $0EABD9   |
    BNE CODE_0EABDF     ; $0EABDC   |

CODE_0EABDE:
    RTS                 ; $0EABDE   |

CODE_0EABDF:
    LDA #$0006          ; $0EABDF   |
    STA $76,x           ; $0EABE2   |
    LDA #$0100          ; $0EABE4   |
    STA $7A36,x         ; $0EABE7   |
    LDA #$FFFF          ; $0EABEA   |
    STA $7900,x         ; $0EABED   |
    LDA #$000A          ; $0EABF0   |
    STA $16,x           ; $0EABF3   |
    LDA $7042,x         ; $0EABF5   |
    AND #$FFF1          ; $0EABF8   |
    STA $7042,x         ; $0EABFB   |
    RTS                 ; $0EABFE   |

DATA_0EABFF:         dw $2020, $2040, $0008, $FFF8

CODE_0EAC07:
    LDY $76,x           ; $0EAC07   |
    CPY #$06            ; $0EAC09   |
    BMI CODE_0EAC33     ; $0EAC0B   |
    LDY #$00            ; $0EAC0D   |
    LDA $7A38,x         ; $0EAC0F   |
    BEQ CODE_0EAC5B     ; $0EAC12   |
    CMP #$0100          ; $0EAC14   |
    BPL CODE_0EAC1B     ; $0EAC17   |
    INY                 ; $0EAC19   |
    INY                 ; $0EAC1A   |

CODE_0EAC1B:
    CLC                 ; $0EAC1B   |
    ADC $AC03,y         ; $0EAC1C   |
    AND #$01FE          ; $0EAC1F   |
    STA $7A38,x         ; $0EAC22   |
    CLC                 ; $0EAC25   |
    ADC #$0008          ; $0EAC26   |
    CMP #$0010          ; $0EAC29   |
    BCS CODE_0EAC5B     ; $0EAC2C   |
    STZ $7A38,x         ; $0EAC2E   |
    BRA CODE_0EAC5B     ; $0EAC31   |

CODE_0EAC33:
    LDA $78,x           ; $0EAC33   |
    SEC                 ; $0EAC35   |
    SBC #$0080          ; $0EAC36   |
    CMP #$0100          ; $0EAC39   |
    BCC CODE_0EAC45     ; $0EAC3C   |
    STZ $7400,x         ; $0EAC3E   |
    LDA $78,x           ; $0EAC41   |
    BRA CODE_0EAC55     ; $0EAC43   |

CODE_0EAC45:
    LDA #$0002          ; $0EAC45   |
    STA $7400,x         ; $0EAC48   |
    LDA $78,x           ; $0EAC4B   |
    CLC                 ; $0EAC4D   |
    ADC #$0100          ; $0EAC4E   |
    EOR #$FFFF          ; $0EAC51   |
    INC A               ; $0EAC54   |

CODE_0EAC55:
    AND #$01FE          ; $0EAC55   |
    STA $7A38,x         ; $0EAC58   |

CODE_0EAC5B:
    LDY $7402,x         ; $0EAC5B   |
    BNE CODE_0EAC61     ; $0EAC5E   |
    RTS                 ; $0EAC60   |

CODE_0EAC61:
    LDA $7A36,x         ; $0EAC61   |
    STA $3016           ; $0EAC64   |
    LDA $7900,x         ; $0EAC67   |
    BPL CODE_0EAC73     ; $0EAC6A   |
    LDA #$0200          ; $0EAC6C   |
    SEC                 ; $0EAC6F   |
    SBC $7A36,x         ; $0EAC70   |

CODE_0EAC73:
    STA $300C           ; $0EAC73   |
    LDA $7A38,x         ; $0EAC76   |
    LSR A               ; $0EAC79   |
    STA $300A           ; $0EAC7A   |
    LDY $77,x           ; $0EAC7D   |
    LDA $ABFF,y         ; $0EAC7F   |
    STA $3018           ; $0EAC82   |
    LDA #$0055          ; $0EAC85   |
    STA $301A           ; $0EAC88   |
    LDY $7722,x         ; $0EAC8B   |
    TYX                 ; $0EAC8E   |
    LDA $03A9CE,x       ; $0EAC8F   |
    STA $3006           ; $0EAC93   |
    LDA $03A9EE,x       ; $0EAC96   |
    STA $3004           ; $0EAC9A   |
    LDX #$08            ; $0EAC9D   |
    LDA #$84A5          ; $0EAC9F   |
    JSL $7EDE44         ; $0EACA2   | GSU init
    LDX $12             ; $0EACA6   |
    INC $0CF9           ; $0EACA8   |
    RTS                 ; $0EACAB   |

DATA_0EACAC:         dw $0008, $000A

DATA_0EACB0:		   dw $0000, $FFF0

CODE_0EACB4:
    LDA $78,x           ; $0EACB4   |
    STA $3002           ; $0EACB6   |
    LDY $7042,x         ; $0EACB9   |
    BPL CODE_0EACCB     ; $0EACBC   |
    LDA $3002           ; $0EACBE   |
    EOR #$FFFF          ; $0EACC1   |
    INC A               ; $0EACC4   |
    AND #$01FE          ; $0EACC5   |
    STA $3002           ; $0EACC8   |

CODE_0EACCB:
    LDA $7900,x         ; $0EACCB   |
    BPL CODE_0EACD7     ; $0EACCE   |
    LDA #$0200          ; $0EACD0   |
    SEC                 ; $0EACD3   |
    SBC $7A36,x         ; $0EACD4   |

CODE_0EACD7:
    STA $3004           ; $0EACD7   |
    LDA $7A36,x         ; $0EACDA   |
    STA $3006           ; $0EACDD   |
    LDY $77,x           ; $0EACE0   |
    LDA $ACAC,y         ; $0EACE2   |
    CLC                 ; $0EACE5   |
    ADC $18,x           ; $0EACE6   |
    STA $300A           ; $0EACE8   |
    LDX #$0B            ; $0EACEB   |
    LDA #$86FA          ; $0EACED   |
    JSL $7EDE44         ; $0EACF0   | GSU init
    LDX $12             ; $0EACF4   |
    LDA $70E2,x         ; $0EACF6   |
    CLC                 ; $0EACF9   |
    ADC #$0008          ; $0EACFA   |
    SEC                 ; $0EACFD   |
    SBC $3000           ; $0EACFE   |
    SEC                 ; $0EAD01   |
    SBC $7CD6,x         ; $0EAD02   |
    CLC                 ; $0EAD05   |
    ADC $7B56,x         ; $0EAD06   |
    STA $7B56,x         ; $0EAD09   |
    LDA $7042,x         ; $0EAD0C   |
    AND #$0080          ; $0EAD0F   |
    ASL A               ; $0EAD12   |
    ASL A               ; $0EAD13   |
    XBA                 ; $0EAD14   |
    TAY                 ; $0EAD15   |
    LDA $7182,x         ; $0EAD16   |
    SEC                 ; $0EAD19   |
    SBC $ACB0,y         ; $0EAD1A   |
    SEC                 ; $0EAD1D   |
    SBC $3002           ; $0EAD1E   |
    SEC                 ; $0EAD21   |
    SBC $7CD8,x         ; $0EAD22   |
    CLC                 ; $0EAD25   |
    ADC $7B58,x         ; $0EAD26   |
    STA $7B58,x         ; $0EAD29   |
    LDA #$0008          ; $0EAD2C   |
    STA $7BB6,x         ; $0EAD2F   |
    LDA #$000C          ; $0EAD32   |
    STA $7BB8,x         ; $0EAD35   |
    LDY $76,x           ; $0EAD38   |
    CPY #$06            ; $0EAD3A   |
    BPL CODE_0EAD44     ; $0EAD3C   |
    LDA $18,x           ; $0EAD3E   |
    BEQ CODE_0EAD44     ; $0EAD40   |
    DEC $18,x           ; $0EAD42   |

CODE_0EAD44:
    RTS                 ; $0EAD44   |

    TYX                 ; $0EAD45   |
    LDA $7A96,x         ; $0EAD46   |
    BNE CODE_0EAD59     ; $0EAD49   |
    JSL $03AD74         ; $0EAD4B   |
    BCC CODE_0EAD59     ; $0EAD4F   |
    STZ $7902,x         ; $0EAD51   |
    INC $7402,x         ; $0EAD54   |
    INC $76,x           ; $0EAD57   |

CODE_0EAD59:
    RTS                 ; $0EAD59   |

    TYX                 ; $0EAD5A   |
    LDA $7A96,x         ; $0EAD5B   |
    BNE CODE_0EAD8B     ; $0EAD5E   |
    LDA $7A98,x         ; $0EAD60   |
    BNE CODE_0EAD88     ; $0EAD63   |
    LDA $7680,x         ; $0EAD65   |
    SEC                 ; $0EAD68   |
    SBC #$0018          ; $0EAD69   |
    CMP #$00D0          ; $0EAD6C   |
    BCS CODE_0EAD88     ; $0EAD6F   |
    LDY #$02            ; $0EAD71   |
    STY $77,x           ; $0EAD73   |
    LDA #$00D0          ; $0EAD75   |
    STA $7A36,x         ; $0EAD78   |
    STA $7900,x         ; $0EAD7B   |
    LDA #$0030          ; $0EAD7E   |
    STA $7A96,x         ; $0EAD81   |
    STZ $16,x           ; $0EAD84   |
    INC $76,x           ; $0EAD86   |

CODE_0EAD88:
    JSR CODE_0EB0E4     ; $0EAD88   |

CODE_0EAD8B:
    RTS                 ; $0EAD8B   |

DATA_0EAD8C:         db $00, $04, $02

    TYX                 ; $0EAD8F   |
    LDA $7680,x         ; $0EAD90   |
    CLC                 ; $0EAD93   |
    ADC #$0010          ; $0EAD94   |
    CMP #$1020          ; $0EAD97   |
    BCC CODE_0EADB8     ; $0EAD9A   |
    LDY #$00            ; $0EAD9C   |
    STY $77,x           ; $0EAD9E   |
    LDA $7042,x         ; $0EADA0   |
    AND #$FFF1          ; $0EADA3   |
    STA $7042,x         ; $0EADA6   |
    LDA #$0100          ; $0EADA9   |
    STA $7A36,x         ; $0EADAC   |
    LDA #$FFFF          ; $0EADAF   |
    STA $7900,x         ; $0EADB2   |
    DEC $76,x           ; $0EADB5   |
    RTS                 ; $0EADB7   |

CODE_0EADB8:
    LDA $7A36,x         ; $0EADB8   |
    CLC                 ; $0EADBB   |
    ADC #$0004          ; $0EADBC   |
    CMP #$0100          ; $0EADBF   |
    BMI CODE_0EAE0C     ; $0EADC2   |
    LDA $7A96,x         ; $0EADC4   |
    BNE CODE_0EADEB     ; $0EADC7   |
    LDA $7042,x         ; $0EADC9   |
    AND #$FFF1          ; $0EADCC   |
    STA $7042,x         ; $0EADCF   |
    LDA #$0100          ; $0EADD2   |
    STA $7A36,x         ; $0EADD5   |
    LDA #$00D0          ; $0EADD8   |
    STA $7900,x         ; $0EADDB   |
    LDA #$0004          ; $0EADDE   |
    STA $7A96,x         ; $0EADE1   |
    JSL $0EB14D         ; $0EADE4   |
    INC $76,x           ; $0EADE8   |
    RTS                 ; $0EADEA   |

CODE_0EADEB:
    LDY $16,x           ; $0EADEB   |
    INY                 ; $0EADED   |
    CPY #$03            ; $0EADEE   |
    BNE CODE_0EADF4     ; $0EADF0   |
    LDY #$00            ; $0EADF2   |

CODE_0EADF4:
    STY $16,x           ; $0EADF4   |
    LDA $AD8C,y         ; $0EADF6   |
    AND #$00FF          ; $0EADF9   |
    STA $00             ; $0EADFC   |
    LDA $7042,x         ; $0EADFE   |
    AND #$FFF1          ; $0EAE01   |
    ORA $00             ; $0EAE04   |
    STA $7042,x         ; $0EAE06   |
    LDA #$0100          ; $0EAE09   |

CODE_0EAE0C:
    STA $7A36,x         ; $0EAE0C   |
    STA $7900,x         ; $0EAE0F   |
    BRA CODE_0EAE29     ; $0EAE12   |

    TYX                 ; $0EAE14   |
    LDA $7A96,x         ; $0EAE15   |
    BNE CODE_0EAE29     ; $0EAE18   |
    TAY                 ; $0EAE1A   |
    STY $77,x           ; $0EAE1B   |
    DEC A               ; $0EAE1D   |
    STA $7900,x         ; $0EAE1E   |
    INC $76,x           ; $0EAE21   |
    LDA #$0130          ; $0EAE23   |

CODE_0EAE26:
    STA $7A36,x         ; $0EAE26   |

CODE_0EAE29:
    JSR CODE_0EB0E4     ; $0EAE29   |
    JSL $0EB14D         ; $0EAE2C   |
    RTS                 ; $0EAE30   |

    TYX                 ; $0EAE31   |
    LDA $7A36,x         ; $0EAE32   |
    SEC                 ; $0EAE35   |
    SBC #$0010          ; $0EAE36   |
    CMP #$00E0          ; $0EAE39   |
    BPL CODE_0EAE26     ; $0EAE3C   |
    LDA $78,x           ; $0EAE3E   |
    STA $3002           ; $0EAE40   |
    LDY $7042,x         ; $0EAE43   |
    BPL CODE_0EAE55     ; $0EAE46   |
    LDA $3002           ; $0EAE48   |
    EOR #$FFFF          ; $0EAE4B   |
    INC A               ; $0EAE4E   |
    AND #$01FE          ; $0EAE4F   |
    STA $3002           ; $0EAE52   |

CODE_0EAE55:
    PHA                 ; $0EAE55   |
    LDA #$0008          ; $0EAE56   |
    STA $300C           ; $0EAE59   |
    LDX #$0B            ; $0EAE5C   |
    LDA #$8595          ; $0EAE5E   |
    JSL $7EDE44         ; $0EAE61   | GSU init
    LDX $12             ; $0EAE65   |
    LDA #$01E9          ; $0EAE67   |
    JSL $008B21         ; $0EAE6A   |
    LDA $7CD6,x         ; $0EAE6E   |
    SEC                 ; $0EAE71   |
    SBC $3000           ; $0EAE72   |
    STA $00             ; $0EAE75   |
    STA $70A2,y         ; $0EAE77   |
    LDA $7CD8,x         ; $0EAE7A   |
    SEC                 ; $0EAE7D   |
    SBC $3002           ; $0EAE7E   |
    STA $02             ; $0EAE81   |
    STA $7142,y         ; $0EAE83   |
    LDA #$0002          ; $0EAE86   |
    STA $7782,y         ; $0EAE89   |
    LDA #$0006          ; $0EAE8C   |
    STA $7462,y         ; $0EAE8F   |
    PLA                 ; $0EAE92   |
    STA $3002           ; $0EAE93   |
    LDA #$FC00          ; $0EAE96   |
    STA $300C           ; $0EAE99   |
    LDX #$0B            ; $0EAE9C   |
    LDA #$8595          ; $0EAE9E   |
    JSL $7EDE44         ; $0EAEA1   | GSU init
    LDX $12             ; $0EAEA5   |
    LDA #$00F9          ; $0EAEA7   |
    JSL $03A34C         ; $0EAEAA   |
    BCC CODE_0EAED8     ; $0EAEAE   |
    LDA $00             ; $0EAEB0   |
    SEC                 ; $0EAEB2   |
    SBC #$0008          ; $0EAEB3   |
    STA $70E2,y         ; $0EAEB6   |
    LDA $02             ; $0EAEB9   |
    SEC                 ; $0EAEBB   |
    SBC #$0008          ; $0EAEBC   |
    STA $7182,y         ; $0EAEBF   |
    LDA $3000           ; $0EAEC2   |
    STA $7220,y         ; $0EAEC5   |
    LDA $3002           ; $0EAEC8   |
    STA $7222,y         ; $0EAECB   |
    LDY #$08            ; $0EAECE   |
    STY $16,x           ; $0EAED0   |
    JSL $0EB148         ; $0EAED2   |
    INC $76,x           ; $0EAED6   |

CODE_0EAED8:
    LDA #$00E0          ; $0EAED8   |
    STA $7A36,x         ; $0EAEDB   |
    RTS                 ; $0EAEDE   |

DATA_0EAEDF:         dw $000A, $FFF4, $0010

DATA_0EAEE5:         dw $FFF0, $0100, $00C0, $00F0, $00A0

    TYX                 ; $0EAEEF   |
    LDY $16,x           ; $0EAEF0   |
    LDA $7A36,x         ; $0EAEF2   |
    CLC                 ; $0EAEF5   |
    ADC $AEDD,y         ; $0EAEF6   |
    CMP $AEE5,y         ; $0EAEF9   |
    PHP                 ; $0EAEFC   |
    CPY #$00            ; $0EAEFD   |
    BNE CODE_0EAF06     ; $0EAEFF   |
    PLP                 ; $0EAF01   |
    BMI CODE_0EAF22     ; $0EAF02   |
    BRA CODE_0EAF09     ; $0EAF04   |

CODE_0EAF06:
    PLP                 ; $0EAF06   |
    BPL CODE_0EAF22     ; $0EAF07   |

CODE_0EAF09:
    DEC $16,x           ; $0EAF09   |
    DEC $16,x           ; $0EAF0B   |
    BNE CODE_0EAF1F     ; $0EAF0D   |
    LDA #$0020          ; $0EAF0F   |
    STA $7A96,x         ; $0EAF12   |
    LDA #$0140          ; $0EAF15   |
    STA $7A98,x         ; $0EAF18   |
    LDY #$01            ; $0EAF1B   |
    STY $76,x           ; $0EAF1D   |

CODE_0EAF1F:
    LDA $AEE5,y         ; $0EAF1F   |

CODE_0EAF22:
    STA $7A36,x         ; $0EAF22   |
    RTS                 ; $0EAF25   |

DATA_0EAF26:         dw $0018, $FFE8

DATA_0EAF2A:         dw $0100, $00A0, $0140
DATA_0EAF30:         dw $00A0, $0140, $00A0

    TYX                 ; $0EAEEF   |
    LDY $16,x           ; $0EAEF0   |
    AND #$0002          ; $0EAF39   |
    PHP                 ; $0EAF3C   |
    TAY                 ; $0EAF3D   |
    LDA $7A36,x         ; $0EAF3E   |
    CLC                 ; $0EAF41   |
    ADC $AF26,y         ; $0EAF42   |
    STA $7A36,x         ; $0EAF45   |
    LDY $16,x           ; $0EAF48   |
    PLP                 ; $0EAF4A   |
    BNE CODE_0EAF54     ; $0EAF4B   |
    CMP $AF2A,y         ; $0EAF4D   |
    BMI CODE_0EAF67     ; $0EAF50   |
    BRA CODE_0EAF59     ; $0EAF52   |

CODE_0EAF54:
    CMP $AF2A,y         ; $0EAF54   |
    BPL CODE_0EAF67     ; $0EAF57   |

CODE_0EAF59:
    DEC $16,x           ; $0EAF59   |
    DEC $16,x           ; $0EAF5B   |
    BPL CODE_0EAF67     ; $0EAF5D   |
    LDA #$0100          ; $0EAF5F   |
    STA $7A36,x         ; $0EAF62   |
    INC $76,x           ; $0EAF65   |

CODE_0EAF67:
    RTS                 ; $0EAF67   |

DATA_0EAF68:         dw $FFFC, $0004

DATA_0EAF6C:         dw $0058, $00A8

    TYX                 ; $0EAF70   |
    LDY $7400,x         ; $0EAF71   |
    LDA $78,x           ; $0EAF74   |
    SEC                 ; $0EAF76   |
    SBC $AF6C,y         ; $0EAF77   |
    CLC                 ; $0EAF7A   |
    ADC #$0010          ; $0EAF7B   |
    CMP #$0020          ; $0EAF7E   |
    BCS CODE_0EAF8A     ; $0EAF81   |
    LDA $AF6C,y         ; $0EAF83   |
    STA $78,x           ; $0EAF86   |
    BRA CODE_0EAFA0     ; $0EAF88   |

CODE_0EAF8A:
    PHP                 ; $0EAF8A   |
    LDY #$00            ; $0EAF8B   |
    CLC                 ; $0EAF8D   |
    ADC #$00F0          ; $0EAF8E   |
    CMP #$0200          ; $0EAF91   |
    BCS CODE_0EAF9B     ; $0EAF94   |
    PLP                 ; $0EAF96   |
    BPL CODE_0EAFA0     ; $0EAF97   |
    BRA CODE_0EAF9E     ; $0EAF99   |

CODE_0EAF9B:
    PLP                 ; $0EAF9B   |
    BMI CODE_0EAFA0     ; $0EAF9C   |

CODE_0EAF9E:
    INY                 ; $0EAF9E   |
    INY                 ; $0EAF9F   |

CODE_0EAFA0:
    LDA $78,x           ; $0EAFA0   |
    CLC                 ; $0EAFA2   |
    ADC $AF68,y         ; $0EAFA3   |
    AND #$01FE          ; $0EAFA6   |
    STA $78,x           ; $0EAFA9   |
    LDY $7400,x         ; $0EAFAB   |
    SEC                 ; $0EAFAE   |
    SBC $AF6C,y         ; $0EAFAF   |
    CLC                 ; $0EAFB2   |
    ADC #$0020          ; $0EAFB3   |
    CMP #$0040          ; $0EAFB6   |
    BCS CODE_0EB01E     ; $0EAFB9   |
    LDA $7A36,x         ; $0EAFBB   |
    SEC                 ; $0EAFBE   |
    SBC #$000C          ; $0EAFBF   |
    CMP #$00A0          ; $0EAFC2   |
    BPL CODE_0EB01B     ; $0EAFC5   |
    JSL $03AEFD         ; $0EAFC7   |
    STZ $7402,x         ; $0EAFCB   |
    LDA #$0140          ; $0EAFCE   |
    STA $7A96,x         ; $0EAFD1   |
    INC $76,x           ; $0EAFD4   |
    LDA #$FFF8          ; $0EAFD6   |
    LDY $7042,x         ; $0EAFD9   |
    BPL CODE_0EAFE1     ; $0EAFDC   |
    LDA #$0008          ; $0EAFDE   |

CODE_0EAFE1:
    STA $00             ; $0EAFE1   |
    LDA $E2,x           ; $0EAFE3   |
    AND #$0080          ; $0EAFE5   |
    STA $02             ; $0EAFE8   |
    LDA #$0209          ; $0EAFEA   |
    JSL $008B21         ; $0EAFED   |
    LDA $7CD6,x         ; $0EAFF1   |
    STA $70A2,y         ; $0EAFF4   |
    LDA $7CD8,x         ; $0EAFF7   |
    CLC                 ; $0EAFFA   |
    ADC $00             ; $0EAFFB   |
    STA $7142,y         ; $0EAFFD   |
    LDA #$0005          ; $0EB000   |
    STA $73C2,y         ; $0EB003   |
    DEC A               ; $0EB006   |
    STA $7E8E,y         ; $0EB007   |
    LDA #$0140          ; $0EB00A   |
    STA $7782,y         ; $0EB00D   |
    LDA $7002,y         ; $0EB010   |
    ORA $02             ; $0EB013   |
    STA $7002,y         ; $0EB015   |
    LDA #$00A0          ; $0EB018   |

CODE_0EB01B:
    STA $7A36,x         ; $0EB01B   |

CODE_0EB01E:
    LDA $7974           ; $0EB01E   |
    AND #$0001          ; $0EB021   |
    CLC                 ; $0EB024   |
    ADC $18,x           ; $0EB025   |
    CMP #$0008          ; $0EB027   |
    BMI CODE_0EB02F     ; $0EB02A   |
    LDA #$0008          ; $0EB02C   |

CODE_0EB02F:
    STA $18,x           ; $0EB02F   |
    RTS                 ; $0EB031   |

    TYX                 ; $0EB032   |
    LDA $7A96,x         ; $0EB033   |
    BNE CODE_0EB051     ; $0EB036   |
    JSL $03AD74         ; $0EB038   |
    BCC CODE_0EB051     ; $0EB03C   |
    INC $7402,x         ; $0EB03E   |
    LDA #$0020          ; $0EB041   |
    STA $7A96,x         ; $0EB044   |
    STZ $7902,x         ; $0EB047   |
    LDA #$0002          ; $0EB04A   |
    STA $16,x           ; $0EB04D   |
    INC $76,x           ; $0EB04F   |

CODE_0EB051:
    RTS                 ; $0EB051   |

DATA_0EB052:         dw $FFF0, $000A, $0100, $0120

    TYX                 ; $0EB05A   |
    LDY $16,x           ; $0EB05B   |
    LDA $7A36,x         ; $0EB05D   |
    CLC                 ; $0EB060   |
    ADC $B052,y         ; $0EB061   |
    STA $7A36,x         ; $0EB064   |
    CPY #$00            ; $0EB067   |
    BNE CODE_0EB072     ; $0EB069   |
    CMP #$0100          ; $0EB06B   |
    BPL CODE_0EB08B     ; $0EB06E   |
    BRA CODE_0EB077     ; $0EB070   |

CODE_0EB072:
    CMP #$0120          ; $0EB072   |
    BMI CODE_0EB08B     ; $0EB075   |

CODE_0EB077:
    DEC $16,x           ; $0EB077   |
    DEC $16,x           ; $0EB079   |
    BPL CODE_0EB08B     ; $0EB07B   |
    LDA #$0100          ; $0EB07D   |
    STA $7A36,x         ; $0EB080   |
    INC $76,x           ; $0EB083   |
    LDA #$0040          ; $0EB085   |
    STA $7A96,x         ; $0EB088   |

CODE_0EB08B:
    RTS                 ; $0EB08B   |

    TYX                 ; $0EB08C   |
    LDA $7A96,x         ; $0EB08D   |
    BNE CODE_0EB096     ; $0EB090   |
    LDY #$01            ; $0EB092   |
    STY $76,x           ; $0EB094   |

CODE_0EB096:
    RTS                 ; $0EB096   |

DATA_0EB097:         dw $FFFC, $0004

    STA $08             ; $0EB09B   |
    LDA $7A36,x         ; $0EB09D   |
    STA $02             ; $0EB0A0   |
    LDA $7900,x         ; $0EB0A2   |
    STA $04             ; $0EB0A5   |
    STZ $00             ; $0EB0A7   |
    LDX #$02            ; $0EB0A9   |

CODE_0EB0AB:
    LDA $02,x           ; $0EB0AB   |
    SEC                 ; $0EB0AD   |
    SBC $08             ; $0EB0AE   |
    CLC                 ; $0EB0B0   |
    ADC #$0008          ; $0EB0B1   |
    CMP #$0010          ; $0EB0B4   |
    BCS CODE_0EB0BF     ; $0EB0B7   |
    INC $00             ; $0EB0B9   |
    LDA $08             ; $0EB0BB   |
    BRA CODE_0EB0CD     ; $0EB0BD   |

CODE_0EB0BF:
    PHP                 ; $0EB0BF   |
    LDY #$00            ; $0EB0C0   |
    PLP                 ; $0EB0C2   |
    BPL CODE_0EB0C7     ; $0EB0C3   |
    INY                 ; $0EB0C5   |
    INY                 ; $0EB0C6   |

CODE_0EB0C7:
    LDA $02,x           ; $0EB0C7   |
    CLC                 ; $0EB0C9   |
    ADC $B097,y         ; $0EB0CA   |

CODE_0EB0CD:
    STA $02,x           ; $0EB0CD   |
    DEX                 ; $0EB0CF   |
    DEX                 ; $0EB0D0   |
    BPL CODE_0EB0AB     ; $0EB0D1   |
    LDX $12             ; $0EB0D3   |
    LDA $02             ; $0EB0D5   |
    STA $7A36,x         ; $0EB0D7   |
    LDA $04             ; $0EB0DA   |
    STA $7900,x         ; $0EB0DC   |
    RTS                 ; $0EB0DF   |

DATA_0EB0E0:         dw $0004, $FFFC

CODE_0EB0E4:
    LDA $7C16,x         ; $0EB0E4   |
    STA $3002           ; $0EB0E7   |
    LDA $7C18,x         ; $0EB0EA   |
    CLC                 ; $0EB0ED   |
    ADC #$000C          ; $0EB0EE   |
    STA $3004           ; $0EB0F1   |
    LDX #$0B            ; $0EB0F4   |
    LDA #$BCF8          ; $0EB0F6   |
    JSL $7EDE44         ; $0EB0F9   | GSU init
    LDX $12             ; $0EB0FD   |
    LDY $7042,x         ; $0EB0FF   |
    BPL CODE_0EB10E     ; $0EB102   |
    LDA $3000           ; $0EB104   |
    EOR #$FFFF          ; $0EB107   |
    INC A               ; $0EB10A   |
    STA $3000           ; $0EB10B   |

CODE_0EB10E:
    LDY #$00            ; $0EB10E   |
    LDA $3000           ; $0EB110   |
    CLC                 ; $0EB113   |
    ADC #$0100          ; $0EB114   |
    AND #$01FE          ; $0EB117   |
    SEC                 ; $0EB11A   |
    SBC $78,x           ; $0EB11B   |
    PHP                 ; $0EB11D   |
    CLC                 ; $0EB11E   |
    ADC #$0100          ; $0EB11F   |
    CMP #$0200          ; $0EB122   |
    BCS CODE_0EB137     ; $0EB125   |
    SEC                 ; $0EB127   |
    SBC #$00FC          ; $0EB128   |
    CMP #$0008          ; $0EB12B   |
    BCS CODE_0EB132     ; $0EB12E   |
    PLP                 ; $0EB130   |
    RTS                 ; $0EB131   |

CODE_0EB132:
    PLP                 ; $0EB132   |
    BMI CODE_0EB13A     ; $0EB133   |
    BRA CODE_0EB13C     ; $0EB135   |

CODE_0EB137:
    PLP                 ; $0EB137   |
    BMI CODE_0EB13C     ; $0EB138   |

CODE_0EB13A:
    INY                 ; $0EB13A   |
    INY                 ; $0EB13B   |

CODE_0EB13C:
    LDA $78,x           ; $0EB13C   |
    CLC                 ; $0EB13E   |
    ADC $B0E0,y         ; $0EB13F   |
    AND #$01FE          ; $0EB142   |
    STA $78,x           ; $0EB145   |
    RTS                 ; $0EB147   |

    LDA #$0010          ; $0EB148   |
    BRA CODE_0EB150     ; $0EB14B   |

    LDA #$0000          ; $0EB14D   |

CODE_0EB150:
    STA $02             ; $0EB150   |
    STZ $00             ; $0EB152   |
    LDA $7902,x         ; $0EB154   |
    CLC                 ; $0EB157   |
    ADC #$0002          ; $0EB158   |
    CMP #$0020          ; $0EB15B   |
    BCS CODE_0EB165     ; $0EB15E   |
    STA $7902,x         ; $0EB160   |
    BRA CODE_0EB178     ; $0EB163   |

CODE_0EB165:
    LDY #$04            ; $0EB165   |
    STY $00             ; $0EB167   |
    LDA $7974           ; $0EB169   |
    AND #$0007          ; $0EB16C   |
    BNE CODE_0EB178     ; $0EB16F   |
    LDA #$0063          ; $0EB171   |\ play sound #$0063
    JSL $0085D2         ; $0EB174   |/

CODE_0EB178:
    LDA #$01E2          ; $0EB178   |
    JSL $008B21         ; $0EB17B   |
    LDA $611C           ; $0EB17F   |
    SEC                 ; $0EB182   |
    SBC #$0008          ; $0EB183   |
    STA $70A2,y         ; $0EB186   |
    LDA $611E           ; $0EB189   |
    SEC                 ; $0EB18C   |
    SBC #$0008          ; $0EB18D   |
    STA $7142,y         ; $0EB190   |
    LDA $02             ; $0EB193   |
    STA $7782,y         ; $0EB195   |
    LDA $7902,x         ; $0EB198   |
    STA $7E4C,y         ; $0EB19B   |
    LDA $7974           ; $0EB19E   |
    AND $00             ; $0EB1A1   |
    LSR A               ; $0EB1A3   |
    CLC                 ; $0EB1A4   |
    ADC #$0004          ; $0EB1A5   |
    STA $78C2,x         ; $0EB1A8   |
    ORA $7002,y         ; $0EB1AB   |
    STA $7002,y         ; $0EB1AE   |
    RTL                 ; $0EB1B1   |

.init_green_needlenose
    RTL                 ; $0EB1B2   |

.main_green_needlenose
    LDA $6F00,x         ; $0EB1B3   |
    CMP #$0010          ; $0EB1B6   |
    BNE CODE_0EB1BE     ; $0EB1B9   |
    JSR CODE_0EB27C     ; $0EB1BB   |

CODE_0EB1BE:
    JSL $03AF23         ; $0EB1BE   |
    LDA $7360,x         ; $0EB1C2   |
    CMP #$00A2          ; $0EB1C5   |
    BNE CODE_0EB1CD     ; $0EB1C8   |
    JSR CODE_0EB27C     ; $0EB1CA   |

CODE_0EB1CD:
    JSR CODE_0EB1D4     ; $0EB1CD   |
    JSR CODE_0EB23F     ; $0EB1D0   |
    RTL                 ; $0EB1D3   |

CODE_0EB1D4:
    LDA $7A38,x         ; $0EB1D4   |
    ORA $7A98,x         ; $0EB1D7   |
    BNE CODE_0EB23E     ; $0EB1DA   |
    LDA #$0004          ; $0EB1DC   |
    STA $7A98,x         ; $0EB1DF   |
    LDA $7360,x         ; $0EB1E2   |
    CMP #$00A2          ; $0EB1E5   |
    BNE CODE_0EB20A     ; $0EB1E8   |
    LDA #$020F          ; $0EB1EA   |
    JSL $008B21         ; $0EB1ED   |
    LDA $70E2,x         ; $0EB1F1   |
    STA $70A2,y         ; $0EB1F4   |
    LDA $7182,x         ; $0EB1F7   |
    STA $7142,y         ; $0EB1FA   |
    LDA #$0005          ; $0EB1FD   |
    STA $73C2,y         ; $0EB200   |
    LDA #$0001          ; $0EB203   |
    STA $7782,y         ; $0EB206   |
    RTS                 ; $0EB209   |

CODE_0EB20A:
    CMP #$00F9          ; $0EB20A   |
    BEQ CODE_0EB21A     ; $0EB20D   |
    CMP #$00E5          ; $0EB20F   |
    BEQ CODE_0EB23E     ; $0EB212   |
    LDA #$0008          ; $0EB214   |
    STA $7A98,x         ; $0EB217   |

CODE_0EB21A:
    LDA #$01DF          ; $0EB21A   |
    JSL $008B21         ; $0EB21D   |
    LDA $70E2,x         ; $0EB221   |
    STA $70A2,y         ; $0EB224   |
    LDA $7182,x         ; $0EB227   |
    STA $7142,y         ; $0EB22A   |
    LDA #$0004          ; $0EB22D   |
    STA $7782,y         ; $0EB230   |
    INC A               ; $0EB233   |
    STA $73C2,y         ; $0EB234   |
    STA $7E4C,y         ; $0EB237   |
    INC A               ; $0EB23A   |
    STA $7462,y         ; $0EB23B   |

CODE_0EB23E:
    RTS                 ; $0EB23E   |

CODE_0EB23F:
    LDY $7D36,x         ; $0EB23F   |
    DEY                 ; $0EB242   |
    BMI CODE_0EB25C     ; $0EB243   |
    LDA $6F00,y         ; $0EB245   |
    CMP #$0010          ; $0EB248   |
    BNE CODE_0EB26F     ; $0EB24B   |
    LDA $7D38,y         ; $0EB24D   |
    BEQ CODE_0EB26F     ; $0EB250   |
    TYX                 ; $0EB252   |
    JSL $03B25B         ; $0EB253   |

CODE_0EB257:
    PLA                 ; $0EB257   |
    JMP CODE_0E03B2     ; $0EB258   |

CODE_0EB25C:
    INY                 ; $0EB25C   |
    BEQ CODE_0EB26F     ; $0EB25D   |
    LDY $18,x           ; $0EB25F   |
    BEQ CODE_0EB26B     ; $0EB261   |
    LDA $6F00,y         ; $0EB263   |
    CMP #$0010          ; $0EB266   |
    BEQ CODE_0EB26F     ; $0EB269   |

CODE_0EB26B:
    JSL $03A858         ; $0EB26B   |

CODE_0EB26F:
    RTS                 ; $0EB26F   |

DATA_0EB270:         dw $0018, $0010, $0008, $0000
DATA_0EB278:         dw $0200, $FE00

CODE_0EB27C:
    LDY $18,x           ; $0EB27C   |
    BNE CODE_0EB26F     ; $0EB27E   |
    LDA $7860,x         ; $0EB280   |
    AND #$000F          ; $0EB283   |
    BEQ CODE_0EB2DD     ; $0EB286   |
    LDY #$00            ; $0EB288   |
    LDA $7860,x         ; $0EB28A   |
    BIT #$0001          ; $0EB28D   |
    BNE CODE_0EB2A2     ; $0EB290   |
    INY                 ; $0EB292   |
    INY                 ; $0EB293   |
    BIT #$0002          ; $0EB294   |
    BNE CODE_0EB2A2     ; $0EB297   |
    INY                 ; $0EB299   |
    INY                 ; $0EB29A   |
    BIT #$0004          ; $0EB29B   |
    BNE CODE_0EB2A2     ; $0EB29E   |
    INY                 ; $0EB2A0   |
    INY                 ; $0EB2A1   |

CODE_0EB2A2:
    LDA $B270,y         ; $0EB2A2   |
    CLC                 ; $0EB2A5   |
    ADC $7902,x         ; $0EB2A6   |
    REP #$10            ; $0EB2A9   |
    TAX                 ; $0EB2AB   |
    LDA $70000C,x       ; $0EB2AC   |
    AND #$F800          ; $0EB2B0   |
    CMP #$4000          ; $0EB2B3   |
    BNE CODE_0EB2CE     ; $0EB2B6   |
    LDA $700008,x       ; $0EB2B8   |
    STA $0091           ; $0EB2BC   |
    LDA $70000A,x       ; $0EB2BF   |
    STA $0093           ; $0EB2C3   |
    SEP #$10            ; $0EB2C6   |
    LDX $12             ; $0EB2C8   |
    JSL $0DA479         ; $0EB2CA   |

CODE_0EB2CE:
    SEP #$10            ; $0EB2CE   |
    LDX $12             ; $0EB2D0   |
    LDA $7360,x         ; $0EB2D2   |
    CMP #$00A2          ; $0EB2D5   |
    BEQ CODE_0EB302     ; $0EB2D8   |
    JMP CODE_0EB257     ; $0EB2DA   |

CODE_0EB2DD:
    LDY $7223,x         ; $0EB2DD   |
    BPL CODE_0EB301     ; $0EB2E0   |
    LDA $6F00,x         ; $0EB2E2   |
    CMP #$0010          ; $0EB2E5   |
    BNE CODE_0EB301     ; $0EB2E8   |
    LDA $B270           ; $0EB2EA   |
    CLC                 ; $0EB2ED   |
    ADC $7902,x         ; $0EB2EE   |
    REP #$10            ; $0EB2F1   |
    TAX                 ; $0EB2F3   |
    LDA $70000C,x       ; $0EB2F4   |
    AND #$0004          ; $0EB2F8   |
    BNE CODE_0EB2CE     ; $0EB2FB   |
    SEP #$10            ; $0EB2FD   |
    LDX $12             ; $0EB2FF   |

CODE_0EB301:
    RTS                 ; $0EB301   |

CODE_0EB302:
    LDA #$004A          ; $0EB302   |
    JSL $03A364         ; $0EB305   |
    BCC CODE_0EB358     ; $0EB309   |
    LDA $70E2,x         ; $0EB30B   |
    STA $70E2,y         ; $0EB30E   |
    LDA $7182,x         ; $0EB311   |
    STA $7182,y         ; $0EB314   |
    LDA #$000B          ; $0EB317   |
    STA $7978,y         ; $0EB31A   |
    INC A               ; $0EB31D   |
    STA $7B58,y         ; $0EB31E   |
    LDA #$0003          ; $0EB321   |
    STA $7A98,y         ; $0EB324   |
    INC A               ; $0EB327   |
    STA $7BB8,y         ; $0EB328   |
    LDY #$02            ; $0EB32B   |

CODE_0EB32D:
    PHY                 ; $0EB32D   |
    LDA $B278,y         ; $0EB32E   |
    STA $00             ; $0EB331   |
    LDA #$0049          ; $0EB333   |
    JSL $03A34C         ; $0EB336   |
    BCC CODE_0EB357     ; $0EB33A   |
    LDA $70E2,x         ; $0EB33C   |
    STA $70E2,y         ; $0EB33F   |
    STA $7902,y         ; $0EB342   |
    LDA $7182,x         ; $0EB345   |
    STA $7182,y         ; $0EB348   |
    LDA $00             ; $0EB34B   |
    STA $7220,y         ; $0EB34D   |
    PLY                 ; $0EB350   |
    DEY                 ; $0EB351   |
    DEY                 ; $0EB352   |
    BPL CODE_0EB32D     ; $0EB353   |
    BRA CODE_0EB358     ; $0EB355   |

CODE_0EB357:
    PLY                 ; $0EB357   |

CODE_0EB358:
    LDA #$0020          ; $0EB358   |
    STA $61C6           ; $0EB35B   |
    LDA #$003E          ; $0EB35E   |\ play sound #$003E
    JSL $0085D2         ; $0EB361   |/
    PLA                 ; $0EB365   |
    JMP CODE_0E03A3     ; $0EB366   |

.init_flower
    LDA $7900,x         ; $0EB36A   |
    BNE CODE_0EB374     ; $0EB36D   |
    CMP $7902,x         ; $0EB36F   |
    BEQ CODE_0EB37F     ; $0EB372   |

CODE_0EB374:
    STA $04             ; $0EB374   |
    LDA $7902,x         ; $0EB376   |
    JSL $03D40E         ; $0EB379   |
    BRA CODE_0EB383     ; $0EB37D   |

CODE_0EB37F:
    JSL $03D406         ; $0EB37F   |

CODE_0EB383:
    LDA $7722,x         ; $0EB383   |
    BPL CODE_0EB397     ; $0EB386   |
    JSL $03AE60         ; $0EB388   |
    LDA #$0100          ; $0EB38C   |
    STA $7A36,x         ; $0EB38F   |
    JSR CODE_0EB3CF     ; $0EB392   |
    BRA CODE_0EB39B     ; $0EB395   |

CODE_0EB397:
    JSL $03AA52         ; $0EB397   |

CODE_0EB39B:
    JSL $02A007         ; $0EB39B   |
    RTL                 ; $0EB39F   |

DATA_0EB3A0:         dw $B41A, $B42A, $B457, $B525

DATA_0EB3A8:         dw $4010, $4020

.main_flower
    JSL $03AA52         ; $0EB3AC   |
    JSL $03AF23         ; $0EB3B0   |
    TXY                 ; $0EB3B4   |
    LDA $76,x           ; $0EB3B5   |
    ASL A               ; $0EB3B7   |
    TAX                 ; $0EB3B8   |
    JSR ($B3A0,x)       ; $0EB3B9   |

    JSR CODE_0EB3C0     ; $0EB3BC   |
    RTL                 ; $0EB3BF   |

CODE_0EB3C0:
    LDA $7722,x         ; $0EB3C0   |
    LSR A               ; $0EB3C3   |
    LSR A               ; $0EB3C4   |
    LSR A               ; $0EB3C5   |
    SEC                 ; $0EB3C6   |
    SBC $0030           ; $0EB3C7   |
    AND #$0003          ; $0EB3CA   |
    BNE CODE_0EB419     ; $0EB3CD   |

CODE_0EB3CF:
    LDA $7A36,x         ; $0EB3CF   |
    STA $300C           ; $0EB3D2   |
    LDA $7A38,x         ; $0EB3D5   |
    LSR A               ; $0EB3D8   |
    STA $300A           ; $0EB3D9   |
    LDY $78,x           ; $0EB3DC   |
    PHP                 ; $0EB3DE   |
    LDA $B3A8,y         ; $0EB3DF   |
    STA $3018           ; $0EB3E2   |
    LDA #$0054          ; $0EB3E5   |
    STA $301A           ; $0EB3E8   |
    LDY $7722,x         ; $0EB3EB   |
    TYX                 ; $0EB3EE   |
    LDA $03A9CE,x       ; $0EB3EF   |
    STA $3006           ; $0EB3F3   |
    LDA $03A9EE,x       ; $0EB3F6   |
    STA $3004           ; $0EB3FA   |
    PLP                 ; $0EB3FD   |
    BEQ CODE_0EB40B     ; $0EB3FE   |
    LDX #$08            ; $0EB400   |
    LDA #$8205          ; $0EB402   |
    JSL $7EDE44         ; $0EB405   | GSU init
    BRA CODE_0EB414     ; $0EB409   |

CODE_0EB40B:
    LDX #$08            ; $0EB40B   |
    LDA #$835F          ; $0EB40D   |
    JSL $7EDE44         ; $0EB410   | GSU init

CODE_0EB414:
    LDX $12             ; $0EB414   |
    INC $0CF9           ; $0EB416   |

CODE_0EB419:
    RTS                 ; $0EB419   |

    TYX                 ; $0EB41A   |
    LDY #$04            ; $0EB41B   |
    STY $16,x           ; $0EB41D   |
    INC $76,x           ; $0EB41F   |
    RTS                 ; $0EB421   |

DATA_0EB422:         db $00, $01

DATA_0EB424:         dw $0150, $0100, $00B0

    TYX                 ; $0EB42A   |
    LDY $16,x           ; $0EB42B   |
    LDA $7A36,x         ; $0EB42D   |
    CLC                 ; $0EB430   |
    ADC #$0010          ; $0EB431   |
    CMP $B420,y         ; $0EB434   |
    BMI CODE_0EB44F     ; $0EB437   |
    LDA #$0002          ; $0EB439   |
    STA $78,x           ; $0EB43C   |
    DEC $16,x           ; $0EB43E   |
    DEC $16,x           ; $0EB440   |
    BNE CODE_0EB44C     ; $0EB442   |
    LDA #$000C          ; $0EB444   |
    STA $7A98,x         ; $0EB447   |
    INC $76,x           ; $0EB44A   |

CODE_0EB44C:
    LDA $B424,y         ; $0EB44C   |

CODE_0EB44F:
    STA $7A36,x         ; $0EB44F   |
    RTS                 ; $0EB452   |

DATA_0EB453:         dw $0002, $FFFE

    TYX                 ; $0EB457   |
    LDA $7A98,x         ; $0EB458   |
    BNE CODE_0EB46A     ; $0EB45B   |
    LDA #$0018          ; $0EB45D   |
    STA $7A98,x         ; $0EB460   |
    LDA $16,x           ; $0EB463   |
    EOR #$0002          ; $0EB465   |
    STA $16,x           ; $0EB468   |

CODE_0EB46A:
    LDY $16,x           ; $0EB46A   |
    LDA $7A38,x         ; $0EB46C   |
    CLC                 ; $0EB46F   |
    ADC $B453,y         ; $0EB470   |
    AND #$01FE          ; $0EB473   |
    STA $7A38,x         ; $0EB476   |

CODE_0EB479:
    LDY $7D36,x         ; $0EB479   |
    BNE CODE_0EB47F     ; $0EB47C   |

CODE_0EB47E:
    RTS                 ; $0EB47E   |

CODE_0EB47F:
    BMI CODE_0EB494     ; $0EB47F   |
    LDA $6EFF,y         ; $0EB481   |
    CMP #$0010          ; $0EB484   |
    BNE CODE_0EB47E     ; $0EB487   |
    LDA $7D37,y         ; $0EB489   |
    BEQ CODE_0EB47E     ; $0EB48C   |
    DEY                 ; $0EB48E   |
    TYX                 ; $0EB48F   |
    JSL $03B25B         ; $0EB490   |

CODE_0EB494:
    JSL $0EB4AE         ; $0EB494   |
    RTS                 ; $0EB498   |

    PHB                 ; $0EB499   |
    PHK                 ; $0EB49A   |
    PLB                 ; $0EB49B   |
    PHD                 ; $0EB49C   |
    LDA #$7960          ; $0EB49D   |
    TCD                 ; $0EB4A0   |
    LDY $76,x           ; $0EB4A1   |
    CPY #$02            ; $0EB4A3   |
    BNE CODE_0EB4AB     ; $0EB4A5   |
    JSL $0EB4AE         ; $0EB4A7   |

CODE_0EB4AB:
    PLD                 ; $0EB4AB   |
    PLB                 ; $0EB4AC   |
    RTL                 ; $0EB4AD   |

    LDA #$0020          ; $0EB4AE   |
    STA $7AF6,x         ; $0EB4B1   |
    LDA #$00FF          ; $0EB4B4   |
    STA $74A2,x         ; $0EB4B7   |
    INC $76,x           ; $0EB4BA   |
    INC $03B8           ; $0EB4BC   |
    LDY $03B8           ; $0EB4BF   |
    CPY #$05            ; $0EB4C2   |
    BCC CODE_0EB4E8     ; $0EB4C4   |
    LDY #$05            ; $0EB4C6   |
    STY $03B8           ; $0EB4C8   |
    LDA $7CD6,x         ; $0EB4CB   |
    SEC                 ; $0EB4CE   |
    SBC #$0008          ; $0EB4CF   |
    STA $0000           ; $0EB4D2   |
    LDA $7CD8,x         ; $0EB4D5   |
    SEC                 ; $0EB4D8   |
    SBC #$0008          ; $0EB4D9   |
    STA $0002           ; $0EB4DC   |
    JSL $03A4A2         ; $0EB4DF   |
    LDA #$0008          ; $0EB4E3   |
    BRA CODE_0EB4EB     ; $0EB4E6   |

CODE_0EB4E8:
    LDA #$0036          ; $0EB4E8   |\ play sound #$0036

CODE_0EB4EB:
    JSL $0085D2         ; $0EB4EB   |/
    LDA #$01CD          ; $0EB4EF   |
    JSL $008B21         ; $0EB4F2   |
    LDA $70E2,x         ; $0EB4F6   |
    STA $70A2,y         ; $0EB4F9   |
    LDA $7182,x         ; $0EB4FC   |
    STA $7142,y         ; $0EB4FF   |
    LDA #$000B          ; $0EB502   |
    STA $7E4C,y         ; $0EB505   |
    LDA #$0004          ; $0EB508   |
    STA $7782,y         ; $0EB50B   |
    LDA $7900,x         ; $0EB50E   |
    BNE CODE_0EB518     ; $0EB511   |
    CMP $7902,x         ; $0EB513   |
    BEQ CODE_0EB521     ; $0EB516   |

CODE_0EB518:
    STA $04             ; $0EB518   |
    LDA $7902,x         ; $0EB51A   |
    JMP CODE_0E03D3     ; $0EB51D   |

CODE_0EB521:
    JMP CODE_0E03D3     ; $0EB521   |

    TYX                 ; $0EB525   |
    LDA $7AF6,x         ; $0EB526   |
    BNE CODE_0EB54D     ; $0EB529   |
    LDA $0372           ; $0EB52B   |
    AND #$0040          ; $0EB52E   |
    ORA $021A           ; $0EB531   |
    BNE CODE_0EB549     ; $0EB534   |
    LDA $0372           ; $0EB536   |
    ORA #$0040          ; $0EB539   |
    STA $0372           ; $0EB53C   |
    LDA #$002D          ; $0EB53F   |
    STA $704070         ; $0EB542   |
    INC $0D0F           ; $0EB546   |

CODE_0EB549:
    JSL $03A32E         ; $0EB549   |

CODE_0EB54D:
    RTS                 ; $0EB54D   |

.init_flower_2 								   ; this flower is spriteset-specific
    JSL $03D406         ; $0EB54E   |
    JSL $02A007         ; $0EB552   |
    RTL                 ; $0EB556   |

DATA_0EB557:         dw $B56C
DATA_0EB559:         dw $B586
DATA_0EB55B:         dw $B5A5
DATA_0EB55D:         dw $B525

.main_flower_2 								 ; this flower is spriteset-specific
    JSL $03AF23         ; $0EB55F   |
    TXY                 ; $0EB563   |
    LDA $76,x           ; $0EB564   |
    ASL A               ; $0EB566   |
    TAX                 ; $0EB567   |
    JSR ($B557,x)       ; $0EB568   |

    RTL                 ; $0EB56B   |

    TYX                 ; $0EB56C   |
    LDA $7680,x         ; $0EB56D   |
    AND #$FF00          ; $0EB570   |
    STA $00             ; $0EB573   |
    LDA $7682,x         ; $0EB575   |
    AND #$FF00          ; $0EB578   |
    ORA $00             ; $0EB57B   |
    BNE CODE_0EB585     ; $0EB57D   |
    LDY #$09            ; $0EB57F   |
    STY $16,x           ; $0EB581   |
    INC $76,x           ; $0EB583   |

CODE_0EB585:
    RTS                 ; $0EB585   |

    TYX                 ; $0EB586   |
    LDA $7A98,x         ; $0EB587   |
    BNE CODE_0EB5A4     ; $0EB58A   |
    LDA #$0002          ; $0EB58C   |
    STA $7A98,x         ; $0EB58F   |
    INC $7402,x         ; $0EB592   |
    LDY $7402,x         ; $0EB595   |
    CPY #$04            ; $0EB598   |
    BMI CODE_0EB5A4     ; $0EB59A   |
    LDA #$0008          ; $0EB59C   |
    STA $7A98,x         ; $0EB59F   |
    INC $76,x           ; $0EB5A2   |

CODE_0EB5A4:
    RTS                 ; $0EB5A4   |

    TYX                 ; $0EB5A5   |
    LDA $7A98,x         ; $0EB5A6   |
    BNE CODE_0EB5D8     ; $0EB5A9   |
    LDA #$0004          ; $0EB5AB   |
    STA $7A98,x         ; $0EB5AE   |
    LDA $16,x           ; $0EB5B1   |
    CMP $7402,x         ; $0EB5B3   |
    BMI CODE_0EB5BD     ; $0EB5B6   |
    INC $7402,x         ; $0EB5B8   |
    BRA CODE_0EB5C0     ; $0EB5BB   |

CODE_0EB5BD:
    DEC $7402,x         ; $0EB5BD   |

CODE_0EB5C0:
    LDA $16,x           ; $0EB5C0   |
    CMP $7402,x         ; $0EB5C2   |
    BNE CODE_0EB5D8     ; $0EB5C5   |
    TAY                 ; $0EB5C7   |
    LDA #$0008          ; $0EB5C8   |
    STA $7A98,x         ; $0EB5CB   |
    LSR A               ; $0EB5CE   |
    CPY #$04            ; $0EB5CF   |
    BNE CODE_0EB5D6     ; $0EB5D1   |
    LDA #$0009          ; $0EB5D3   |

CODE_0EB5D6:
    STA $16,x           ; $0EB5D6   |

CODE_0EB5D8:
    JSR CODE_0EB479     ; $0EB5D8   |
    RTS                 ; $0EB5DB   |

.init_red_pow_switch
    JSL $03AE60         ; $0EB5DC   |
    LDA #$0100          ; $0EB5E0   |
    STA $7A36,x         ; $0EB5E3   |
    STA $7A38,x         ; $0EB5E6   |
    JSR CODE_0EB6A1     ; $0EB5E9   |
    LDA #$000C          ; $0EB5EC   |
    STA $7BB6,x         ; $0EB5EF   |
    LDA #$0012          ; $0EB5F2   |
    STA $7BB8,x         ; $0EB5F5   |
    RTL                 ; $0EB5F8   |

DATA_0EB5F9:         dw $8000
DATA_0EB5FB:         dw $B6FF
DATA_0EB5FD:         dw $B76D
DATA_0EB5FF:         dw $B807

.main_red_pow_switch
    LDY $76,x           ; $0EB601   |
    CPY #$03            ; $0EB603   |
    BEQ CODE_0EB60E     ; $0EB605   |
    JSL $03AA52         ; $0EB607   |
    JSR CODE_0EB61A     ; $0EB60B   |

CODE_0EB60E:
    TXY                 ; $0EB60E   |
    LDA $76,x           ; $0EB60F   |
    ASL A               ; $0EB611   |
    TAX                 ; $0EB612   |
    JSR ($B5F9,x)       ; $0EB613   |

    JSR CODE_0EB698     ; $0EB616   |
    RTL                 ; $0EB619   |

CODE_0EB61A:
    LDY $74A2,x         ; $0EB61A   |
    BMI CODE_0EB697     ; $0EB61D   |
    LDY $60AB           ; $0EB61F   |
    BMI CODE_0EB697     ; $0EB622   |
    LDA $7BB6,x         ; $0EB624   |
    CLC                 ; $0EB627   |
    ADC $6120           ; $0EB628   |
    ASL A               ; $0EB62B   |
    STA $00             ; $0EB62C   |
    LSR A               ; $0EB62E   |
    CLC                 ; $0EB62F   |
    ADC $7C16,x         ; $0EB630   |
    CMP $00             ; $0EB633   |
    BCS CODE_0EB697     ; $0EB635   |
    LDA $7182,x         ; $0EB637   |
    CLC                 ; $0EB63A   |
    ADC #$0010          ; $0EB63B   |
    SEC                 ; $0EB63E   |
    SBC $7BB8,x         ; $0EB63F   |
    SEC                 ; $0EB642   |
    SBC $611E           ; $0EB643   |
    SEC                 ; $0EB646   |
    SBC $6122           ; $0EB647   |
    LDY $76,x           ; $0EB64A   |
    CPY #$01            ; $0EB64C   |
    BEQ CODE_0EB65C     ; $0EB64E   |
    CPY #$02            ; $0EB650   |
    BEQ CODE_0EB65C     ; $0EB652   |
    CMP #$FFF8          ; $0EB654   |
    BCC CODE_0EB697     ; $0EB657   |
    STX $1011           ; $0EB659   |

CODE_0EB65C:
    INC A               ; $0EB65C   |
    SEC                 ; $0EB65D   |
    ADC $6090           ; $0EB65E   |
    STA $6090           ; $0EB661   |
    STZ $60AA           ; $0EB664   |
    INC $61B4           ; $0EB667   |
    LDA $7860,x         ; $0EB66A   |
    AND #$0001          ; $0EB66D   |
    BEQ CODE_0EB697     ; $0EB670   |
    LDY $76,x           ; $0EB672   |
    BNE CODE_0EB697     ; $0EB674   |
    LDA $60A8           ; $0EB676   |
    STA $7900,x         ; $0EB679   |
    STZ $60A8           ; $0EB67C   |
    STZ $60B4           ; $0EB67F   |
    LDA #$0002          ; $0EB682   |
    STA $60AC           ; $0EB685   |
    INC $61B0           ; $0EB688   |
    INC $61AE           ; $0EB68B   |
    INC $76,x           ; $0EB68E   |
    LDA #$0033          ; $0EB690   |\ play sound #$0033
    JSL $0085D2         ; $0EB693   |/

CODE_0EB697:
    RTS                 ; $0EB697   |

CODE_0EB698:
    LDY $79D6,x         ; $0EB698   |
    BEQ CODE_0EB6FE     ; $0EB69B   |
    CPY #$03            ; $0EB69D   |
    BPL CODE_0EB6FE     ; $0EB69F   |

CODE_0EB6A1:
    LDA #$0C00          ; $0EB6A1   |
    STA $3000           ; $0EB6A4   |
    LDA #$1200          ; $0EB6A7   |
    STA $3002           ; $0EB6AA   |
    LDA $7A38,x         ; $0EB6AD   |
    STA $3016           ; $0EB6B0   |
    LDA $7A36,x         ; $0EB6B3   |
    STA $3008           ; $0EB6B6   |
    STA $300C           ; $0EB6B9   |
    LDA #$0054          ; $0EB6BC   |
    STA $301A           ; $0EB6BF   |
    LDA #$00C1          ; $0EB6C2   |
    STA $3018           ; $0EB6C5   |
    LDA #$0010          ; $0EB6C8   |
    STA $3010           ; $0EB6CB   |
    ASL A               ; $0EB6CE   |
    STA $3012           ; $0EB6CF   |
    LDY $7722,x         ; $0EB6D2   |
    TYX                 ; $0EB6D5   |
    LDA $03A9CE,x       ; $0EB6D6   |
    STA $3006           ; $0EB6DA   |
    LDA $03A9EE,x       ; $0EB6DD   |
    STA $3004           ; $0EB6E1   |
    LDX #$08            ; $0EB6E4   |
    LDA #$D984          ; $0EB6E6   |
    JSL $7EDE44         ; $0EB6E9   | GSU init
    LDX $12             ; $0EB6ED   |
    LDA $6020           ; $0EB6EF   |
    STA $7BB6,x         ; $0EB6F2   |
    LDA $6022           ; $0EB6F5   |
    STA $7BB8,x         ; $0EB6F8   |
    INC $0CF9           ; $0EB6FB   |

CODE_0EB6FE:
    RTS                 ; $0EB6FE   |

    TYX                 ; $0EB6FF   |
    LDA $7860,x         ; $0EB700   |
    AND #$0001          ; $0EB703   |
    BEQ CODE_0EB6FE     ; $0EB706   |
    LDA $7A38,x         ; $0EB708   |
    SEC                 ; $0EB70B   |
    SBC #$0040          ; $0EB70C   |
    AND #$FFF8          ; $0EB70F   |
    LSR A               ; $0EB712   |
    LSR A               ; $0EB713   |
    INC A               ; $0EB714   |
    INC A               ; $0EB715   |
    STA $02             ; $0EB716   |
    LSR A               ; $0EB718   |
    CLC                 ; $0EB719   |
    ADC #$0004          ; $0EB71A   |
    STA $04             ; $0EB71D   |
    LDA #$0002          ; $0EB71F   |
    STA $00             ; $0EB722   |
    LDA $7A36,x         ; $0EB724   |
    CLC                 ; $0EB727   |
    ADC $04             ; $0EB728   |
    CMP #$0180          ; $0EB72A   |
    BMI CODE_0EB734     ; $0EB72D   |
    DEC $00             ; $0EB72F   |
    LDA #$0180          ; $0EB731   |

CODE_0EB734:
    STA $7A36,x         ; $0EB734   |
    LDA $7A38,x         ; $0EB737   |
    SEC                 ; $0EB73A   |
    SBC $02             ; $0EB73B   |
    CMP #$0040          ; $0EB73D   |
    BPL CODE_0EB747     ; $0EB740   |
    DEC $00             ; $0EB742   |
    LDA #$0040          ; $0EB744   |

CODE_0EB747:
    STA $7A38,x         ; $0EB747   |
    LDY $00             ; $0EB74A   |
    BNE CODE_0EB76C     ; $0EB74C   |
    LDA $7042,x         ; $0EB74E   |
    AND #$0020          ; $0EB751   |
    ORA #$0004          ; $0EB754   |
    STA $7042,x         ; $0EB757   |
    STZ $039E           ; $0EB75A   |
    LDA #$0008          ; $0EB75D   |
    TSB $7E08           ; $0EB760   |
    LDA #$0032          ; $0EB763   |\ play sound #$0032
    JSL $0085D2         ; $0EB766   |/
    INC $76,x           ; $0EB76A   |

CODE_0EB76C:
    RTS                 ; $0EB76C   |

    TYX                 ; $0EB76D   |
    LDA $7A38,x         ; $0EB76E   |
    SEC                 ; $0EB771   |
    SBC #$0040          ; $0EB772   |
    AND #$FFF4          ; $0EB775   |
    INC A               ; $0EB778   |
    INC A               ; $0EB779   |
    STA $02             ; $0EB77A   |
    LSR A               ; $0EB77C   |
    CLC                 ; $0EB77D   |
    ADC #$0004          ; $0EB77E   |
    STA $04             ; $0EB781   |
    LDY #$02            ; $0EB783   |
    STY $00             ; $0EB785   |
    LDA $7A36,x         ; $0EB787   |
    SEC                 ; $0EB78A   |
    SBC $04             ; $0EB78B   |
    CMP #$0100          ; $0EB78D   |
    BPL CODE_0EB797     ; $0EB790   |
    DEC $00             ; $0EB792   |
    LDA #$0100          ; $0EB794   |

CODE_0EB797:
    STA $7A36,x         ; $0EB797   |
    LDA $7A38,x         ; $0EB79A   |
    CLC                 ; $0EB79D   |
    ADC $02             ; $0EB79E   |
    CMP #$0100          ; $0EB7A0   |
    BMI CODE_0EB7AA     ; $0EB7A3   |
    DEC $00             ; $0EB7A5   |
    LDA #$0100          ; $0EB7A7   |

CODE_0EB7AA:
    STA $7A38,x         ; $0EB7AA   |
    LDY $00             ; $0EB7AD   |
    BNE CODE_0EB806     ; $0EB7AF   |
    LDA $7CD6,x         ; $0EB7B1   |
    STA $00             ; $0EB7B4   |
    LDA $7CD8,x         ; $0EB7B6   |
    STA $02             ; $0EB7B9   |
    LDA #$01E7          ; $0EB7BB   |
    JSL $03B56E         ; $0EB7BE   |
    LDA #$0280          ; $0EB7C2   |
    STA $0CEC           ; $0EB7C5   |
    LDA #$00FF          ; $0EB7C8   |
    STA $74A2,x         ; $0EB7CB   |
    LDA #$0000          ; $0EB7CE   |
    STA $60AC           ; $0EB7D1   |
    LDA #$0006          ; $0EB7D4   |
    STA $60C0           ; $0EB7D7   |
    LDA #$FA00          ; $0EB7DA   |
    STA $60AA           ; $0EB7DD   |
    LDA #$0100          ; $0EB7E0   |
    LDY $7901,x         ; $0EB7E3   |
    BPL CODE_0EB7EB     ; $0EB7E6   |
    LDA #$FF00          ; $0EB7E8   |

CODE_0EB7EB:
    STA $60A8           ; $0EB7EB   |
    STA $60B4           ; $0EB7EE   |
    STZ $61B0           ; $0EB7F1   |
    STZ $61AE           ; $0EB7F4   |
    STZ $61B4           ; $0EB7F7   |
    LDA #$2001          ; $0EB7FA   |
    STA $7040,x         ; $0EB7FD   |
    JSL $03AEFD         ; $0EB800   |
    INC $76,x           ; $0EB804   |

CODE_0EB806:
    RTS                 ; $0EB806   |

    TYX                 ; $0EB807   |
    CPX $1011           ; $0EB808   |
    BNE CODE_0EB818     ; $0EB80B   |
    LDA $0CEC           ; $0EB80D   |
    BNE CODE_0EB81D     ; $0EB810   |
    LDA #$0008          ; $0EB812   |
    TRB $7E08           ; $0EB815   |

CODE_0EB818:
    PLA                 ; $0EB818   |
    JMP CODE_0E03A3     ; $0EB819   |

CODE_0EB81D:
    LDA $7A98,x         ; $0EB81D   |
    BNE CODE_0EB838     ; $0EB820   |
    LDA #$0040          ; $0EB822   |
    STA $7A98,x         ; $0EB825   |
    LDY #$7E            ; $0EB828   |
    LDA $0CEC           ; $0EB82A   |
    CMP #$00C0          ; $0EB82D   |
    BPL CODE_0EB833     ; $0EB830   |
    INY                 ; $0EB832   |

CODE_0EB833:
    TYA                 ; $0EB833   |
    JSL $0085D2         ; $0EB834   |

CODE_0EB838:
    RTS                 ; $0EB838   |

.init_cactus_jack
    JSL $03AE60         ; $0EB839   |
    LDA #$0100          ; $0EB83D   |
    STA $78,x           ; $0EB840   |
    DEC $18,x           ; $0EB842   |
    LDA #$0006          ; $0EB844   |
    STA $7BB6,x         ; $0EB847   |
    STA $7BB8,x         ; $0EB84A   |
    STZ $7400,x         ; $0EB84D   |
    LDA $7974           ; $0EB850   |
    STA $75E0,x         ; $0EB853   |
    JSL $0EB8AE         ; $0EB856   |
    BNE CODE_0EB88C     ; $0EB85A   |
    LDA $7042,x         ; $0EB85C   |
    EOR #$0030          ; $0EB85F   |
    STA $7042,x         ; $0EB862   |
    LDA $7182,x         ; $0EB865   |
    CLC                 ; $0EB868   |
    ADC #$0010          ; $0EB869   |
    STA $7182,x         ; $0EB86C   |
    SEC                 ; $0EB86F   |
    SBC #$0020          ; $0EB870   |
    STA $7902,x         ; $0EB873   |
    LDA $70E2,x         ; $0EB876   |
    CLC                 ; $0EB879   |
    ADC #$0008          ; $0EB87A   |
    STA $70E2,x         ; $0EB87D   |
    BIT #$0010          ; $0EB880   |
    BEQ CODE_0EB888     ; $0EB883   |
    STA $7900,x         ; $0EB885   |

CODE_0EB888:
    INC $7900,x         ; $0EB888   |
    RTL                 ; $0EB88B   |

CODE_0EB88C:
    JSR CODE_0EB8DC     ; $0EB88C   |
    LDA $02             ; $0EB88F   |
    SEC                 ; $0EB891   |
    SBC #$0010          ; $0EB892   |
    STA $7902,x         ; $0EB895   |
    LDA #$00FF          ; $0EB898   |
    STA $74A2,x         ; $0EB89B   |
    LDA $70E2,x         ; $0EB89E   |
    BIT #$0010          ; $0EB8A1   |
    BEQ CODE_0EB8A9     ; $0EB8A4   |
    STA $7900,x         ; $0EB8A6   |

CODE_0EB8A9:
    LDY #$02            ; $0EB8A9   |
    STY $76,x           ; $0EB8AB   |
    RTL                 ; $0EB8AD   |

    LDA $70E2,x         ; $0EB8AE   |
    STA $3010           ; $0EB8B1   |
    LDA $7182,x         ; $0EB8B4   |
    STA $3000           ; $0EB8B7   |
    LDX #$0A            ; $0EB8BA   |
    LDA #$CE2F          ; $0EB8BC   |
    JSL $7EDE91         ; $0EB8BF   | GSU init
    LDX $12             ; $0EB8C3   |
    LDA $300C           ; $0EB8C5   |
    CMP #$79F1          ; $0EB8C8   |
    BEQ CODE_0EB8DB     ; $0EB8CB   |
    CMP #$79F2          ; $0EB8CD   |
    BEQ CODE_0EB8DB     ; $0EB8D0   |
    LDA $300E           ; $0EB8D2   |
    AND #$F800          ; $0EB8D5   |
    CMP #$A000          ; $0EB8D8   |

CODE_0EB8DB:
    RTL                 ; $0EB8DB   |

CODE_0EB8DC:
    LDA $70E2,x         ; $0EB8DC   |
    STA $00             ; $0EB8DF   |
    LDA #$0010          ; $0EB8E1   |
    STA $04             ; $0EB8E4   |
    CLC                 ; $0EB8E6   |
    ADC $7182,x         ; $0EB8E7   |
    STA $02             ; $0EB8EA   |
    STA $06             ; $0EB8EC   |

CODE_0EB8EE:
    LDA $00             ; $0EB8EE   |
    STA $3010           ; $0EB8F0   |
    LDA $02             ; $0EB8F3   |
    STA $3000           ; $0EB8F5   |
    LDX #$0A            ; $0EB8F8   |
    LDA #$CE2F          ; $0EB8FA   |
    JSL $7EDE91         ; $0EB8FD   | GSU init
    LDA $300E           ; $0EB901   |
    AND #$0003          ; $0EB904   |
    BNE CODE_0EB91B     ; $0EB907   |
    DEC $04             ; $0EB909   |
    BMI CODE_0EB917     ; $0EB90B   |
    LDA $02             ; $0EB90D   |
    CLC                 ; $0EB90F   |
    ADC #$0010          ; $0EB910   |
    STA $02             ; $0EB913   |
    BRA CODE_0EB8EE     ; $0EB915   |

CODE_0EB917:
    LDA $06             ; $0EB917   |
    STA $02             ; $0EB919   |

CODE_0EB91B:
    LDX $12             ; $0EB91B   |
    RTS                 ; $0EB91D   |

DATA_0EB91E:         dw $BD1E
DATA_0EB920:         dw $BD67
DATA_0EB922:         dw $BD87
DATA_0EB924:         dw $BDA9
DATA_0EB926:         dw $BE5E
DATA_0EB928:         dw $BE6A
DATA_0EB92A:         dw $8000
DATA_0EB92C:         dw $8000

.main_cactus_jack
    STZ $7400,x         ; $0EB92E   |
    JSL $03AA52         ; $0EB931   |
    LDA $6F00,x         ; $0EB935   |
    CMP #$0010          ; $0EB938   |
    BEQ CODE_0EB958     ; $0EB93B   |
    CMP #$0008          ; $0EB93D   |
    BNE CODE_0EB955     ; $0EB940   |
    LDY $74A2,x         ; $0EB942   |
    BPL CODE_0EB958     ; $0EB945   |
    LDA $18,x           ; $0EB947   |
    INC A               ; $0EB949   |
    BEQ CODE_0EB955     ; $0EB94A   |
    INC A               ; $0EB94C   |
    BEQ CODE_0EB955     ; $0EB94D   |
    LDA #$FFFF          ; $0EB94F   |
    STA $7722,x         ; $0EB952   |

CODE_0EB955:
    JSR CODE_0EBBD2     ; $0EB955   |

CODE_0EB958:
    LDY $76,x           ; $0EB958   |
    CPY #$04            ; $0EB95A   |
    BEQ CODE_0EB962     ; $0EB95C   |
    CPY #$05            ; $0EB95E   |
    BNE CODE_0EB975     ; $0EB960   |

CODE_0EB962:
    LDA $61B0           ; $0EB962   |
    ORA $0B55           ; $0EB965   |
    ORA $0398           ; $0EB968   |
    BNE CODE_0EB997     ; $0EB96B   |
    LDA $6F00,x         ; $0EB96D   |
    CMP #$0010          ; $0EB970   |
    BEQ CODE_0EB979     ; $0EB973   |

CODE_0EB975:
    JSL $03AF23         ; $0EB975   |

CODE_0EB979:
    JSR CODE_0EB998     ; $0EB979   |
    LDY $74A2,x         ; $0EB97C   |
    BMI CODE_0EB987     ; $0EB97F   |
    JSR CODE_0EB99F     ; $0EB981   |
    JSR CODE_0EB9DB     ; $0EB984   |

CODE_0EB987:
    TXY                 ; $0EB987   |
    LDA $76,x           ; $0EB988   |
    ASL A               ; $0EB98A   |
    TAX                 ; $0EB98B   |
    JSR ($B91E,x)       ; $0EB98C   |

    LDY $74A2,x         ; $0EB98F   |
    BMI CODE_0EB997     ; $0EB992   |
    JSR CODE_0EBC3B     ; $0EB994   |

CODE_0EB997:
    RTL                 ; $0EB997   |

CODE_0EB998:
    JSL $03A2C7         ; $0EB998   |
    BCS CODE_0EB9CB     ; $0EB99C   |

CODE_0EB99E:
    RTS                 ; $0EB99E   |

CODE_0EB99F:
    LDY $76,x           ; $0EB99F   |
    CPY #$04            ; $0EB9A1   |
    BNE CODE_0EB99E     ; $0EB9A3   |
    LDA $7860,x         ; $0EB9A5   |
    AND #$000C          ; $0EB9A8   |
    BEQ CODE_0EB99E     ; $0EB9AB   |
    LDA $7CD6,x         ; $0EB9AD   |
    STA $00             ; $0EB9B0   |
    LDA $7CD8,x         ; $0EB9B2   |
    STA $02             ; $0EB9B5   |
    LDA #$01E6          ; $0EB9B7   |
    JSL $03B56E         ; $0EB9BA   |
    JSL $05AE0B         ; $0EB9BE   |
    SEP #$20            ; $0EB9C2   |
    LDA #$FF            ; $0EB9C4   |
    STA $74A0,x         ; $0EB9C6   |
    REP #$20            ; $0EB9C9   |

CODE_0EB9CB:
    JSR CODE_0EBB67     ; $0EB9CB   |
    PLA                 ; $0EB9CE   |
    RTL                 ; $0EB9CF   |

DATA_0EB9D0:         dw $0200, $FE00

DATA_0EB9D4:         db $0C, $0D, $0E, $0F, $10, $11, $12

CODE_0EB9DB:
    LDA $6FA0,x         ; $0EB9DB   |
    AND #$0600          ; $0EB9DE   |
    BEQ CODE_0EB99E     ; $0EB9E1   |
    LDY $7D36,x         ; $0EB9E3   |
    BPL CODE_0EB9F1     ; $0EB9E6   |
    LDA $7AF8,x         ; $0EB9E8   |
    BNE CODE_0EB9F1     ; $0EB9EB   |
    JSL $03A858         ; $0EB9ED   |

CODE_0EB9F1:
    TXA                 ; $0EB9F1   |
    STA $3002           ; $0EB9F2   |
    LDX #$09            ; $0EB9F5   |
    LDA #$9011          ; $0EB9F7   |
    JSL $7EDE44         ; $0EB9FA   | GSU init
    LDX $12             ; $0EB9FE   |
    LDY $76,x           ; $0EBA00   |
    CPY #$04            ; $0EBA02   |
    BNE CODE_0EBA12     ; $0EBA04   |
    JMP CODE_0EBAB7     ; $0EBA06   |

CODE_0EBA09:
    LDX #$09            ; $0EBA09   |
    LDA $301E           ; $0EBA0B   |
    JSL $7EDE44         ; $0EBA0E   | GSU init

CODE_0EBA12:
    LDX $12             ; $0EBA12   |
    LDY $301C           ; $0EBA14   |
    DEY                 ; $0EBA17   |
    BMI CODE_0EB99E     ; $0EBA18   |
    LDA $6F01,y         ; $0EBA1A   |
    CMP #$0010          ; $0EBA1D   |
    BNE CODE_0EBA09     ; $0EBA20   |
    LDA $7D39,y         ; $0EBA22   |
    BEQ CODE_0EBA09     ; $0EBA25   |
    LDA $6FA3,y         ; $0EBA27   |
    AND #$4000          ; $0EBA2A   |
    BNE CODE_0EBA09     ; $0EBA2D   |
    LDA $7361,y         ; $0EBA2F   |
    CMP #$0156          ; $0EBA32   |
    BNE CODE_0EBA54     ; $0EBA35   |
    LDA $79D7,y         ; $0EBA37   |
    CMP #$0004          ; $0EBA3A   |
    BNE CODE_0EBA54     ; $0EBA3D   |
    LDA $6FA1,y         ; $0EBA3F   |
    AND #$0200          ; $0EBA42   |
    BEQ CODE_0EBA09     ; $0EBA45   |
    LDA $75E0,x         ; $0EBA47   |
    CMP $75E1,y         ; $0EBA4A   |
    BEQ CODE_0EBA09     ; $0EBA4D   |
    LDX $12             ; $0EBA4F   |
    JMP CODE_0EBB38     ; $0EBA51   |

CODE_0EBA54:
    LDA $7543,y         ; $0EBA54   |
    CMP #$0040          ; $0EBA57   |
    PHP                 ; $0EBA5A   |
    STZ $16,x           ; $0EBA5B   |
    LDA $7221,y         ; $0EBA5D   |
    BPL CODE_0EBA67     ; $0EBA60   |
    LDA #$0002          ; $0EBA62   |
    STA $16,x           ; $0EBA65   |

CODE_0EBA67:
    INY                 ; $0EBA67   |
    TYX                 ; $0EBA68   |
    JSL $03B24B         ; $0EBA69   |
    STZ $6FA2,x         ; $0EBA6D   |
    PLP                 ; $0EBA70   |
    BMI CODE_0EBA76     ; $0EBA71   |
    JMP CODE_0EBB38     ; $0EBA73   |

CODE_0EBA76:
    LDA #$0003          ; $0EBA76   |
    STA $6FA2,x         ; $0EBA79   |
    LDY $16,x           ; $0EBA7C   |
    LDA $B9D0,y         ; $0EBA7E   |
    STA $7220,x         ; $0EBA81   |
    LDA $18,x           ; $0EBA84   |
    INC A               ; $0EBA86   |
    BEQ CODE_0EBA8D     ; $0EBA87   |
    JSL $03AD74         ; $0EBA89   |

CODE_0EBA8D:
    LDY #$04            ; $0EBA8D   |
    STY $76,x           ; $0EBA8F   |
    LDA #$0067          ; $0EBA91   |\ play sound #$0067
    JSL $0085D2         ; $0EBA94   |/
    LDA #$FC00          ; $0EBA98   |
    STA $7222,x         ; $0EBA9B   |
    LDA #$0060          ; $0EBA9E   |
    STA $7542,x         ; $0EBAA1   |
    LDA #$0001          ; $0EBAA4   |
    STA $7D38,x         ; $0EBAA7   |
    JSR CODE_0EBBD2     ; $0EBAAA   |

CODE_0EBAAD:
    RTS                 ; $0EBAAD   |

CODE_0EBAAE:
    LDX #$09            ; $0EBAAE   |
    LDA $301E           ; $0EBAB0   |
    JSL $7EDE44         ; $0EBAB3   | GSU init

CODE_0EBAB7:
    LDX $12             ; $0EBAB7   |
    LDY $301C           ; $0EBAB9   |
    DEY                 ; $0EBABC   |
    BMI CODE_0EBAAD     ; $0EBABD   |
    INY                 ; $0EBABF   |
    LDA $6FA2,y         ; $0EBAC0   |
    AND #$4000          ; $0EBAC3   |
    BNE CODE_0EBAAE     ; $0EBAC6   |
    LDA $6F00,y         ; $0EBAC8   |
    CMP #$0010          ; $0EBACB   |
    BNE CODE_0EBAAE     ; $0EBACE   |
    LDA $7360,y         ; $0EBAD0   |
    CMP #$0156          ; $0EBAD3   |
    BNE CODE_0EBAF9     ; $0EBAD6   |
    LDA $6FA0,y         ; $0EBAD8   |
    AND #$0200          ; $0EBADB   |
    BEQ CODE_0EBAF8     ; $0EBADE   |
    LDA $75E0,x         ; $0EBAE0   |
    CMP $75E0,y         ; $0EBAE3   |
    BEQ CODE_0EBAAE     ; $0EBAE6   |
    LDA $79D6,y         ; $0EBAE8   |
    CMP #$0004          ; $0EBAEB   |
    PHP                 ; $0EBAEE   |
    TYX                 ; $0EBAEF   |
    JSR CODE_0EBB38     ; $0EBAF0   |
    LDX $12             ; $0EBAF3   |
    PLP                 ; $0EBAF5   |
    BEQ CODE_0EBB38     ; $0EBAF6   |

CODE_0EBAF8:
    RTS                 ; $0EBAF8   |

CODE_0EBAF9:
    LDA $6FA2,y         ; $0EBAF9   |
    AND #$6000          ; $0EBAFC   |
    BNE CODE_0EBAAE     ; $0EBAFF   |
    LDA $6FA0,y         ; $0EBB01   |
    AND #$0020          ; $0EBB04   |
    BNE CODE_0EBAAE     ; $0EBB07   |
    INC $7A36,x         ; $0EBB09   |
    LDA $7A36,x         ; $0EBB0C   |
    CMP #$0008          ; $0EBB0F   |
    BCC CODE_0EBB1D     ; $0EBB12   |
    LDA $7040,y         ; $0EBB14   |
    ORA #$0600          ; $0EBB17   |
    STA $7040,y         ; $0EBB1A   |

CODE_0EBB1D:
    JSR CODE_0EC413     ; $0EBB1D   |
    LDX $12             ; $0EBB20   |
    LDA $7A36,x         ; $0EBB22   |
    CMP #$0008          ; $0EBB25   |
    BCS CODE_0EBAAE     ; $0EBB28   |
    TAY                 ; $0EBB2A   |
    LDA $B9D3,y         ; $0EBB2B   |
    AND #$00FF          ; $0EBB2E   |
    JSL $0085D2         ; $0EBB31   |
    JMP CODE_0EBAAE     ; $0EBB35   |

CODE_0EBB38:
    LDA #$6862          ; $0EBB38   |
    STA $6FA0,x         ; $0EBB3B   |
    STZ $6FA2,x         ; $0EBB3E   |
    LDA $18,x           ; $0EBB41   |
    INC A               ; $0EBB43   |
    BEQ CODE_0EBB4A     ; $0EBB44   |
    JSL $03AD74         ; $0EBB46   |

CODE_0EBB4A:
    LDY #$04            ; $0EBB4A   |
    STY $76,x           ; $0EBB4C   |
    LDA #$FC00          ; $0EBB4E   |
    STA $7222,x         ; $0EBB51   |
    LDA #$0060          ; $0EBB54   |
    STA $7542,x         ; $0EBB57   |
    SEP #$20            ; $0EBB5A   |
    LDA #$FF            ; $0EBB5C   |
    STA $74A0,x         ; $0EBB5E   |
    REP #$20            ; $0EBB61   |
    JSR CODE_0EBBD2     ; $0EBB63   |
    RTS                 ; $0EBB66   |

CODE_0EBB67:
    LDA $7900,x         ; $0EBB67   |
    BEQ CODE_0EBB74     ; $0EBB6A   |
    BIT #$0001          ; $0EBB6C   |
    BNE CODE_0EBB85     ; $0EBB6F   |
    JSR CODE_0EBBD2     ; $0EBB71   |

CODE_0EBB74:
    LDA $18,x           ; $0EBB74   |
    INC A               ; $0EBB76   |
    BEQ CODE_0EBB7F     ; $0EBB77   |
    LDA #$FFFF          ; $0EBB79   |
    STA $7722,x         ; $0EBB7C   |

CODE_0EBB7F:
    PLA                 ; $0EBB7F   |
    PLA                 ; $0EBB80   |
    JMP CODE_0E03A3     ; $0EBB81   |

CODE_0EBB85:
    SEC                 ; $0EBB85   |
    SBC $6094           ; $0EBB86   |
    CLC                 ; $0EBB89   |
    ADC #$0040          ; $0EBB8A   |
    CMP #$0180          ; $0EBB8D   |
    BCS CODE_0EBB74     ; $0EBB90   |
    LDA $7902,x         ; $0EBB92   |
    SEC                 ; $0EBB95   |
    SBC $609C           ; $0EBB96   |
    CLC                 ; $0EBB99   |
    ADC #$0040          ; $0EBB9A   |
    CMP #$0180          ; $0EBB9D   |
    BCS CODE_0EBB74     ; $0EBBA0   |
    LDA $7900,x         ; $0EBBA2   |
    STA $70E2,x         ; $0EBBA5   |
    LDA $7902,x         ; $0EBBA8   |
    CLC                 ; $0EBBAB   |
    ADC #$0020          ; $0EBBAC   |
    STA $7182,x         ; $0EBBAF   |
    STZ $7542,x         ; $0EBBB2   |
    LDA $7042,x         ; $0EBBB5   |
    EOR #$0030          ; $0EBBB8   |
    STA $7042,x         ; $0EBBBB   |
    STZ $76,x           ; $0EBBBE   |
    STZ $7220,x         ; $0EBBC0   |
    STZ $7222,x         ; $0EBBC3   |
    LDA #$0100          ; $0EBBC6   |
    STA $78,x           ; $0EBBC9   |
    STZ $7A38,x         ; $0EBBCB   |
    STZ $6FA2,x         ; $0EBBCE   |
    RTS                 ; $0EBBD1   |

CODE_0EBBD2:
    LDY $18,x           ; $0EBBD2   |
    BMI CODE_0EBC14     ; $0EBBD4   |
    STY $00             ; $0EBBD6   |
    LDY $19,x           ; $0EBBD8   |
    BMI CODE_0EBBF7     ; $0EBBDA   |
    SEP #$20            ; $0EBBDC   |
    LDX $00             ; $0EBBDE   |
    TXA                 ; $0EBBE0   |
    STA $7978,y         ; $0EBBE1   |
    STY $19,x           ; $0EBBE4   |
    REP #$20            ; $0EBBE6   |
    LDA #$0060          ; $0EBBE8   |
    STA $7542,x         ; $0EBBEB   |
    LDA #$0006          ; $0EBBEE   |
    STA $76,x           ; $0EBBF1   |
    LDX $12             ; $0EBBF3   |
    BRA CODE_0EBC21     ; $0EBBF5   |

CODE_0EBBF7:
    SEP #$20            ; $0EBBF7   |
    TYA                 ; $0EBBF9   |
    LDY $00             ; $0EBBFA   |
    STA $7979,y         ; $0EBBFC   |
    REP #$20            ; $0EBBFF   |
    LDA #$0060          ; $0EBC01   |
    STA $7542,y         ; $0EBC04   |
    LDA $78,x           ; $0EBC07   |
    STA $79D8,y         ; $0EBC09   |
    LDA #$0003          ; $0EBC0C   |
    STA $79D6,y         ; $0EBC0F   |
    BRA CODE_0EBC27     ; $0EBC12   |

CODE_0EBC14:
    LDY $19,x           ; $0EBC14   |
    BMI CODE_0EBC35     ; $0EBC16   |
    SEP #$20            ; $0EBC18   |
    LDA #$FF            ; $0EBC1A   |
    STA $7978,y         ; $0EBC1C   |
    REP #$20            ; $0EBC1F   |

CODE_0EBC21:
    LDA #$0080          ; $0EBC21   |
    STA $7A96,y         ; $0EBC24   |

CODE_0EBC27:
    SEP #$20            ; $0EBC27   |
    LDA #$FF            ; $0EBC29   |
    STA $74A0,x         ; $0EBC2B   |
    REP #$20            ; $0EBC2E   |
    LDA #$FFFE          ; $0EBC30   |
    BRA CODE_0EBC38     ; $0EBC33   |

CODE_0EBC35:
    LDA #$FFFF          ; $0EBC35   |

CODE_0EBC38:
    STA $18,x           ; $0EBC38   |

CODE_0EBC3A:
    RTS                 ; $0EBC3A   |

CODE_0EBC3B:
    LDA #$0055          ; $0EBC3B   |
    STA $301A           ; $0EBC3E   |
    LDA #$6060          ; $0EBC41   |
    STA $3018           ; $0EBC44   |
    LDY $76,x           ; $0EBC47   |
    CPY #$04            ; $0EBC49   |
    BNE CODE_0EBC50     ; $0EBC4B   |
    JMP CODE_0EBCED     ; $0EBC4D   |

CODE_0EBC50:
    LDY $19,x           ; $0EBC50   |
    BPL CODE_0EBC3A     ; $0EBC52   |
    LDA $78,x           ; $0EBC54   |
    STA $3016           ; $0EBC56   |
    PHA                 ; $0EBC59   |
    CMP #$0100          ; $0EBC5A   |
    BPL CODE_0EBC69     ; $0EBC5D   |
    ASL A               ; $0EBC5F   |
    EOR #$FFFF          ; $0EBC60   |
    CLC                 ; $0EBC63   |
    ADC #$0301          ; $0EBC64   |
    BRA CODE_0EBC70     ; $0EBC67   |

CODE_0EBC69:
    EOR #$FFFF          ; $0EBC69   |
    CLC                 ; $0EBC6C   |
    ADC #$01C1          ; $0EBC6D   |

CODE_0EBC70:
    STA $300C           ; $0EBC70   |
    LDA #$0010          ; $0EBC73   |
    STA $3010           ; $0EBC76   |
    ASL A               ; $0EBC79   |
    STA $3012           ; $0EBC7A   |
    LDY $7722,x         ; $0EBC7D   |
    TYX                 ; $0EBC80   |
    LDA $03A9CE,x       ; $0EBC81   |
    STA $3006           ; $0EBC85   |
    LDA $03A9EE,x       ; $0EBC88   |
    STA $3004           ; $0EBC8C   |
    LDX #$08            ; $0EBC8F   |
    LDA #$8295          ; $0EBC91   |
    JSL $7EDE44         ; $0EBC94   | GSU init
    INC $0CF9           ; $0EBC98   |
    PLA                 ; $0EBC9B   |
    STA $300C           ; $0EBC9C   |
    LDA #$0014          ; $0EBC9F   |
    STA $3000           ; $0EBCA2   |
    LDX #$0B            ; $0EBCA5   |
    LDA #$86B6          ; $0EBCA7   |
    JSL $7EDE44         ; $0EBCAA   | GSU init
    LDX $12             ; $0EBCAE   |
    LDY $18,x           ; $0EBCB0   |
    BMI CODE_0EBCEC     ; $0EBCB2   |
    LDA $7182,x         ; $0EBCB4   |
    SEC                 ; $0EBCB7   |
    SBC $3000           ; $0EBCB8   |
    STA $00             ; $0EBCBB   |

CODE_0EBCBD:
    LDA $79D6,y         ; $0EBCBD   |
    CMP #$0006          ; $0EBCC0   |
    BNE CODE_0EBCDB     ; $0EBCC3   |
    LDA $00             ; $0EBCC5   |
    CMP $7182,y         ; $0EBCC7   |
    BPL CODE_0EBCEC     ; $0EBCCA   |
    LDA #$0000          ; $0EBCCC   |
    STA $7222,y         ; $0EBCCF   |
    STA $7542,y         ; $0EBCD2   |
    LDA #$0007          ; $0EBCD5   |
    STA $79D6,y         ; $0EBCD8   |

CODE_0EBCDB:
    LDA $00             ; $0EBCDB   |
    STA $7182,y         ; $0EBCDD   |
    SEC                 ; $0EBCE0   |
    SBC $3000           ; $0EBCE1   |
    STA $00             ; $0EBCE4   |
    LDA $7978,y         ; $0EBCE6   |
    TAY                 ; $0EBCE9   |
    BPL CODE_0EBCBD     ; $0EBCEA   |

CODE_0EBCEC:
    RTS                 ; $0EBCEC   |

CODE_0EBCED:
    LDA $7A38,x         ; $0EBCED   |
    AND #$01FE          ; $0EBCF0   |
    LSR A               ; $0EBCF3   |
    STA $300A           ; $0EBCF4   |
    LDA #$0100          ; $0EBCF7   |
    STA $300C           ; $0EBCFA   |
    LDY $7722,x         ; $0EBCFD   |
    TYX                 ; $0EBD00   |
    LDA $03A9CE,x       ; $0EBD01   |
    STA $3006           ; $0EBD05   |
    LDA $03A9EE,x       ; $0EBD08   |
    STA $3004           ; $0EBD0C   |
    LDX #$08            ; $0EBD0F   |
    LDA #$8205          ; $0EBD11   |
    JSL $7EDE44         ; $0EBD14   | GSU init
    LDX $12             ; $0EBD18   |
    INC $0CF9           ; $0EBD1A   |
    RTS                 ; $0EBD1D   |

    TYX                 ; $0EBD1E   |
    LDY $7542,x         ; $0EBD1F   |
    BEQ CODE_0EBD46     ; $0EBD22   |
    LDY $7223,x         ; $0EBD24   |
    BMI CODE_0EBD5E     ; $0EBD27   |
    LDA $7902,x         ; $0EBD29   |
    CMP $7182,x         ; $0EBD2C   |
    BPL CODE_0EBD5E     ; $0EBD2F   |
    STA $7182,x         ; $0EBD31   |
    STZ $7222,x         ; $0EBD34   |
    STZ $7542,x         ; $0EBD37   |
    LDA $7042,x         ; $0EBD3A   |
    EOR #$0030          ; $0EBD3D   |
    STA $7042,x         ; $0EBD40   |
    INC $76,x           ; $0EBD43   |
    RTS                 ; $0EBD45   |

CODE_0EBD46:
    LDA $7C16,x         ; $0EBD46   |
    CLC                 ; $0EBD49   |
    ADC #$0050          ; $0EBD4A   |
    CMP #$00A0          ; $0EBD4D   |
    BCS CODE_0EBD5E     ; $0EBD50   |
    LDA #$0060          ; $0EBD52   |
    STA $7542,x         ; $0EBD55   |
    LDA #$FA00          ; $0EBD58   |
    STA $7222,x         ; $0EBD5B   |

CODE_0EBD5E:
    RTS                 ; $0EBD5E   |

DATA_0EBD5F:         dw $FFFC, $0008

DATA_0EBD63:         dw $00E0, $0140

CODE_0EBD67:
    TYX                 ; $0EBD67   |
    LDY $16,x           ; $0EBD68   |
    LDA $78,x           ; $0EBD6A   |
    CLC                 ; $0EBD6C   |
    ADC $BD5F,y         ; $0EBD6D   |
    CMP #$00E0          ; $0EBD70   |
    BMI CODE_0EBD7A     ; $0EBD73   |
    CMP #$0140          ; $0EBD75   |
    BMI CODE_0EBD84     ; $0EBD78   |

CODE_0EBD7A:
    LDA $16,x           ; $0EBD7A   |
    EOR #$0002          ; $0EBD7C   |
    STA $16,x           ; $0EBD7F   |
    LDA $BD63,y         ; $0EBD81   |

CODE_0EBD84:
    STA $78,x           ; $0EBD84   |
    RTS                 ; $0EBD86   |

    TYX                 ; $0EBD87   |
    LDY $7681,x         ; $0EBD88   |
    BNE CODE_0EBDA8     ; $0EBD8B   |
    LDA $609C           ; $0EBD8D   |
    SEC                 ; $0EBD90   |
    SBC #$0020          ; $0EBD91   |
    STA $7182,x         ; $0EBD94   |
    LDA #$0060          ; $0EBD97   |
    STA $7542,x         ; $0EBD9A   |
    LDA #$0005          ; $0EBD9D   |
    STA $74A2,x         ; $0EBDA0   |
    STZ $6FA2,x         ; $0EBDA3   |
    INC $76,x           ; $0EBDA6   |

CODE_0EBDA8:
    RTS                 ; $0EBDA8   |

    TYX                 ; $0EBDA9   |
    LDA $7542,x         ; $0EBDAA   |
    BEQ CODE_0EBDCC     ; $0EBDAD   |
    LDA $7902,x         ; $0EBDAF   |
    CMP $7182,x         ; $0EBDB2   |
    BPL CODE_0EBDCB     ; $0EBDB5   |
    STA $7182,x         ; $0EBDB7   |
    STZ $7222,x         ; $0EBDBA   |
    STZ $7542,x         ; $0EBDBD   |
    LDA $7A96,x         ; $0EBDC0   |
    BNE CODE_0EBDCB     ; $0EBDC3   |
    LDA #$0040          ; $0EBDC5   |
    STA $7A96,x         ; $0EBDC8   |

CODE_0EBDCB:
    RTS                 ; $0EBDCB   |

CODE_0EBDCC:
    JSR CODE_0EBD67     ; $0EBDCC   |
    JSR CODE_0EB8DC     ; $0EBDCF   |
    LDA $02             ; $0EBDD2   |
    SEC                 ; $0EBDD4   |
    SBC #$0010          ; $0EBDD5   |
    CMP $7902,x         ; $0EBDD8   |
    BEQ CODE_0EBDE7     ; $0EBDDB   |
    STA $7902,x         ; $0EBDDD   |
    LDA #$0060          ; $0EBDE0   |
    STA $7542,x         ; $0EBDE3   |
    RTS                 ; $0EBDE6   |

CODE_0EBDE7:
    LDA $7900,x         ; $0EBDE7   |
    BEQ CODE_0EBDCB     ; $0EBDEA   |
    LDY $18,x           ; $0EBDEC   |
    BMI CODE_0EBDF6     ; $0EBDEE   |
    LDA $7978,y         ; $0EBDF0   |
    TAY                 ; $0EBDF3   |
    BPL CODE_0EBDCB     ; $0EBDF4   |

CODE_0EBDF6:
    LDA $7A96,x         ; $0EBDF6   |
    BNE CODE_0EBE5D     ; $0EBDF9   |
    LDA #$0156          ; $0EBDFB   |
    JSL $03A364         ; $0EBDFE   |
    BCC CODE_0EBE5D     ; $0EBE02   |
    LDA $7900,x         ; $0EBE04   |
    STA $70E2,y         ; $0EBE07   |
    LDA $609C           ; $0EBE0A   |
    SEC                 ; $0EBE0D   |
    SBC #$0020          ; $0EBE0E   |
    STA $7182,y         ; $0EBE11   |
    LDA #$0060          ; $0EBE14   |
    STA $7542,y         ; $0EBE17   |
    LDA $7722,x         ; $0EBE1A   |
    STA $7722,y         ; $0EBE1D   |
    LDA $7900,x         ; $0EBE20   |
    STA $7900,y         ; $0EBE23   |
    LDA $7902,x         ; $0EBE26   |
    STA $7902,y         ; $0EBE29   |
    LDA #$0006          ; $0EBE2C   |
    STA $79D6,y         ; $0EBE2F   |
    LDA $75E0,x         ; $0EBE32   |
    STA $75E0,y         ; $0EBE35   |
    SEP #$20            ; $0EBE38   |
    LDA $74A0,x         ; $0EBE3A   |
    STA $74A0,y         ; $0EBE3D   |
    LDA #$FF            ; $0EBE40   |
    STA $7978,y         ; $0EBE42   |
    LDA $7978,x         ; $0EBE45   |
    BMI CODE_0EBE4B     ; $0EBE48   |
    TAX                 ; $0EBE4A   |

CODE_0EBE4B:
    TXA                 ; $0EBE4B   |
    STA $7979,y         ; $0EBE4C   |
    TYA                 ; $0EBE4F   |
    STA $7978,x         ; $0EBE50   |
    LDX $12             ; $0EBE53   |
    REP #$20            ; $0EBE55   |
    LDA #$0040          ; $0EBE57   |
    STA $7A96,x         ; $0EBE5A   |

CODE_0EBE5D:
    RTS                 ; $0EBE5D   |

    TYX                 ; $0EBE5E   |
    LDA $7220,x         ; $0EBE5F   |
    BNE CODE_0EBE67     ; $0EBE62   |
    INC $76,x           ; $0EBE64   |
    RTS                 ; $0EBE66   |

CODE_0EBE67:
    JMP CODE_0EC858     ; $0EBE67   |

    TYX                 ; $0EBE6A   |
    LDA $7860,x         ; $0EBE6B   |
    AND #$0001          ; $0EBE6E   |
    BEQ CODE_0EBE8C     ; $0EBE71   |
    LDA $6FA2,x         ; $0EBE73   |
    AND #$FFE0          ; $0EBE76   |
    STA $6FA2,x         ; $0EBE79   |
    STZ $7900,x         ; $0EBE7C   |
    STZ $7222,x         ; $0EBE7F   |
    STZ $7542,x         ; $0EBE82   |
    STZ $7D38,x         ; $0EBE85   |
    LDY #$03            ; $0EBE88   |
    STY $76,x           ; $0EBE8A   |

CODE_0EBE8C:
    RTS                 ; $0EBE8C   |

    LDA $7360,x         ; $0EBE8D   |
    CMP #$0156          ; $0EBE90   |
    RTL                 ; $0EBE93   |

.init_chomp_rock
    JSL $03AE60         ; $0EBE94   |
    LDY $021A           ; $0EBE98   | \
    BNE CODE_0EBEA6     ; $0EBE9B   |  | level # $00
    LDY $0150           ; $0EBE9D   |  | and item memory $01
    CPY #$01            ; $0EBEA0   |  | turns chomp rock brown
    BEQ CODE_0EBEB3     ; $0EBEA2   | /
    BRA CODE_0EBEC8     ; $0EBEA4   |

CODE_0EBEA6:
    CPY #$28            ; $0EBEA6   | \  level $28 (4-5)
    BNE CODE_0EBEC8     ; $0EBEA8   | /  also turns him brown
    LDY $0E29           ; $0EBEAA   |
    BEQ CODE_0EBEB3     ; $0EBEAD   |
    JMP CODE_0E03A3     ; $0EBEAF   | kill chomp rock if there's already one

CODE_0EBEB3:
    INC $0E29           ; $0EBEB3   |
    LDA #$2001          ; $0EBEB6   |
    STA $7040,x         ; $0EBEB9   |
    LDA $7042,x         ; $0EBEBC   | \
    AND #$FFF0          ; $0EBEBF   |  | change palette to
    ORA #$0008          ; $0EBEC2   |  | %100 (brown)
    STA $7042,x         ; $0EBEC5   | /

CODE_0EBEC8:
    JSR CODE_0EC869     ; $0EBEC8   |
    LDA #$000C          ; $0EBECB   |
    STA $7BB6,x         ; $0EBECE   |
    STA $7BB8,x         ; $0EBED1   |
    RTL                 ; $0EBED4   |

.main_chomp_rock
    JSL $03A2C7         ; $0EBED5   |
    BCC CODE_0EBEE8     ; $0EBED9   |
    JSR CODE_0EBF49     ; $0EBEDB   |
    JSR CODE_0EC54A     ; $0EBEDE   |
    JSR CODE_0EC71A     ; $0EBEE1   |
    JSR CODE_0EC858     ; $0EBEE4   |
    RTL                 ; $0EBEE7   |

CODE_0EBEE8:
    JSL $03AA52         ; $0EBEE8   |
    JSL $03AF23         ; $0EBEEC   |
    STZ $7400,x         ; $0EBEF0   |
    JSR CODE_0EBF49     ; $0EBEF3   |
    JSL $0EC365         ; $0EBEF6   |
    JSR CODE_0EBFBB     ; $0EBEFA   |
    JSR CODE_0EC54A     ; $0EBEFD   |
    JSR CODE_0EC71A     ; $0EBF00   |
    JSR CODE_0EC858     ; $0EBF03   |
    JSR CODE_0EC869     ; $0EBF06   |
    JSR CODE_0EC8A3     ; $0EBF09   |
    STZ $7542,x         ; $0EBF0C   |
    LDA $7A98,x         ; $0EBF0F   |
    BNE CODE_0EBF1A     ; $0EBF12   |
    LDA #$0040          ; $0EBF14   |
    STA $7542,x         ; $0EBF17   |

CODE_0EBF1A:
    JSR CODE_0EC8C4     ; $0EBF1A   |
    LDA #$400E          ; $0EBF1D   |
    STA $6FA2,x         ; $0EBF20   |
    LDA $6F02,x         ; $0EBF23   |
    AND #$00FF          ; $0EBF26   |
    TAY                 ; $0EBF29   |
    BEQ CODE_0EBF3C     ; $0EBF2A   |
    BPL CODE_0EBF31     ; $0EBF2C   |
    ORA #$FF00          ; $0EBF2E   |

CODE_0EBF31:
    EOR $7220,x         ; $0EBF31   |
    BMI CODE_0EBF3C     ; $0EBF34   |
    LDA #$4010          ; $0EBF36   |
    STA $6FA2,x         ; $0EBF39   |

CODE_0EBF3C:
    RTL                 ; $0EBF3C   |

DATA_0EBF3D:         dw $FFFA, $0016

DATA_0EBF41:         dw $0008, $0004

DATA_0EBF45:         dw $0000, $0008

CODE_0EBF49:
    LDY #$00            ; $0EBF49   |
    LDA $7220,x         ; $0EBF4B   |
    BMI CODE_0EBF52     ; $0EBF4E   |
    INY                 ; $0EBF50   |
    INY                 ; $0EBF51   |

CODE_0EBF52:
    LDA $BF45,y         ; $0EBF52   |
    STA $02             ; $0EBF55   |
    LDA $BF41,y         ; $0EBF57   |
    STA $00             ; $0EBF5A   |
    AND $7860,x         ; $0EBF5C   |
    BNE CODE_0EBFB6     ; $0EBF5F   |
    LDA $BF3D,y         ; $0EBF61   |
    CLC                 ; $0EBF64   |
    ADC $70E2,x         ; $0EBF65   |
    STA $3010           ; $0EBF68   |
    LDA $7182,x         ; $0EBF6B   |
    SEC                 ; $0EBF6E   |
    SBC #$0004          ; $0EBF6F   |
    STA $3000           ; $0EBF72   |
    LDX #$0A            ; $0EBF75   |
    LDA #$CE2F          ; $0EBF77   |
    JSL $7EDE91         ; $0EBF7A   | GSU init
    LDX $12             ; $0EBF7E   |
    LDY $300A           ; $0EBF80   |
    BEQ CODE_0EBFB6     ; $0EBF83   |
    LDA $7860,x         ; $0EBF85   |
    ORA $00             ; $0EBF88   |
    STA $7860,x         ; $0EBF8A   |
    REP #$10            ; $0EBF8D   |
    LDA $7902,x         ; $0EBF8F   |
    CLC                 ; $0EBF92   |
    ADC $02             ; $0EBF93   |
    TAX                 ; $0EBF95   |
    LDA $6000           ; $0EBF96   |
    STA $700008,x       ; $0EBF99   |
    LDA $6002           ; $0EBF9D   |
    STA $70000A,x       ; $0EBFA0   |
    LDA $300E           ; $0EBFA4   |
    STA $70000C,x       ; $0EBFA7   |
    LDA $300C           ; $0EBFAB   |
    STA $70000E,x       ; $0EBFAE   |
    SEP #$10            ; $0EBFB2   |
    LDX $12             ; $0EBFB4   |

CODE_0EBFB6:
    RTS                 ; $0EBFB6   |

DATA_0EBFB7:         dw $FF00, $0100

CODE_0EBFBB:
    LDA $61D6           ; $0EBFBB   |
    BNE CODE_0EBFF6     ; $0EBFBE   |
    LDY $0D94           ; $0EBFC0   |
    BNE CODE_0EBFF6     ; $0EBFC3   |
    LDA $7BB6,x         ; $0EBFC5   |
    CLC                 ; $0EBFC8   |
    ADC $6120           ; $0EBFC9   |
    ASL A               ; $0EBFCC   |
    STA $02             ; $0EBFCD   |
    LSR A               ; $0EBFCF   |
    CLC                 ; $0EBFD0   |
    ADC $7C16,x         ; $0EBFD1   |
    CMP $02             ; $0EBFD4   |
    BCS CODE_0EBFF6     ; $0EBFD6   |
    LDA #$0000          ; $0EBFD8   |
    LDY $19,x           ; $0EBFDB   |
    BEQ CODE_0EBFE2     ; $0EBFDD   |
    LDA #$0008          ; $0EBFDF   |

CODE_0EBFE2:
    CLC                 ; $0EBFE2   |
    ADC $7BB8,x         ; $0EBFE3   |
    CLC                 ; $0EBFE6   |
    ADC $6122           ; $0EBFE7   |
    ASL A               ; $0EBFEA   |
    STA $02             ; $0EBFEB   |
    LSR A               ; $0EBFED   |
    CLC                 ; $0EBFEE   |
    ADC $7C18,x         ; $0EBFEF   |
    CMP $02             ; $0EBFF2   |
    BCC CODE_0EC01A     ; $0EBFF4   |

CODE_0EBFF6:
    STZ $18,x           ; $0EBFF6   |
    CPX $61B6           ; $0EBFF8   |
    BNE CODE_0EC000     ; $0EBFFB   |
    STZ $61B6           ; $0EBFFD   |

CODE_0EC000:
    LDA $7360,x         ; $0EC000   |
    CMP #$009E          ; $0EC003   |
    BEQ CODE_0EC011     ; $0EC006   |
    CPX $0E2B           ; $0EC008   |
    BNE CODE_0EC019     ; $0EC00B   |
    STZ $0E2B           ; $0EC00D   |
    RTS                 ; $0EC010   |

CODE_0EC011:
    CPX $0E27           ; $0EC011   |
    BNE CODE_0EC019     ; $0EC014   |
    STZ $0E27           ; $0EC016   |

CODE_0EC019:
    RTS                 ; $0EC019   |

CODE_0EC01A:
    LDA $7C16,x         ; $0EC01A   |
    BPL CODE_0EC029     ; $0EC01D   |
    CLC                 ; $0EC01F   |
    ADC $6120           ; $0EC020   |
    CLC                 ; $0EC023   |
    ADC $7BB6,x         ; $0EC024   |
    BRA CODE_0EC031     ; $0EC027   |

CODE_0EC029:
    SEC                 ; $0EC029   |
    SBC $6120           ; $0EC02A   |
    SEC                 ; $0EC02D   |
    SBC $7BB6,x         ; $0EC02E   |

CODE_0EC031:
    STA $06             ; $0EC031   |
    LDA $7C18,x         ; $0EC033   |
    BPL CODE_0EC042     ; $0EC036   |
    CLC                 ; $0EC038   |
    ADC $6122           ; $0EC039   |
    CLC                 ; $0EC03C   |
    ADC $7BB8,x         ; $0EC03D   |
    BRA CODE_0EC04A     ; $0EC040   |

CODE_0EC042:
    SEC                 ; $0EC042   |
    SBC $6122           ; $0EC043   |
    SEC                 ; $0EC046   |
    SBC $7BB8,x         ; $0EC047   |

CODE_0EC04A:
    STA $08             ; $0EC04A   |
    LDA $608C           ; $0EC04C   |
    STA $603E           ; $0EC04F   |
    LDY $18,x           ; $0EC052   |
    BEQ CODE_0EC05B     ; $0EC054   |
    JSR CODE_0EC230     ; $0EC056   |
    BRA CODE_0EC067     ; $0EC059   |

CODE_0EC05B:
    LDY $19,x           ; $0EC05B   |
    BEQ CODE_0EC064     ; $0EC05D   |
    JSR CODE_0EC2AA     ; $0EC05F   |
    BRA CODE_0EC067     ; $0EC062   |

CODE_0EC064:
    JSR CODE_0EC06C     ; $0EC064   |

CODE_0EC067:
    RTS                 ; $0EC067   |

DATA_0EC068:         dw $FC00, $0400

CODE_0EC06C:
    LDA $08             ; $0EC06C   |
    BMI CODE_0EC080     ; $0EC06E   |
    CMP #$0008          ; $0EC070   |
    BCS CODE_0EC080     ; $0EC073   |
    LDA $7860,x         ; $0EC075   |
    AND #$0001          ; $0EC078   |
    BNE CODE_0EC085     ; $0EC07B   |
    JMP CODE_0EC112     ; $0EC07D   |

CODE_0EC080:
    CMP #$FFF6          ; $0EC080   |
    BCS CODE_0EC088     ; $0EC083   |

CODE_0EC085:
    JMP CODE_0EC154     ; $0EC085   |

CODE_0EC088:
    LDA $7360,x         ; $0EC088   |
    CMP #$009E          ; $0EC08B   |
    BEQ CODE_0EC09A     ; $0EC08E   |
    CPX $0E2B           ; $0EC090   |
    BNE CODE_0EC0A2     ; $0EC093   |
    STZ $0E2B           ; $0EC095   |
    BRA CODE_0EC0A2     ; $0EC098   |

CODE_0EC09A:
    CPX $0E27           ; $0EC09A   |
    BNE CODE_0EC0A2     ; $0EC09D   |
    STZ $0E27           ; $0EC09F   |

CODE_0EC0A2:
    LDY $60AB           ; $0EC0A2   |
    BMI CODE_0EC0B4     ; $0EC0A5   |
    LDA $60FC           ; $0EC0A7   |
    AND #$0018          ; $0EC0AA   |
    BNE CODE_0EC0B4     ; $0EC0AD   |
    LDY $61B6           ; $0EC0AF   |
    BEQ CODE_0EC0B5     ; $0EC0B2   |

CODE_0EC0B4:
    RTS                 ; $0EC0B4   |

CODE_0EC0B5:
    JSR CODE_0EC1E2     ; $0EC0B5   |
    STX $61B6           ; $0EC0B8   |
    STZ $60AA           ; $0EC0BB   |
    INC $61B4           ; $0EC0BE   |
    INC $18,x           ; $0EC0C1   |
    LDA $608B           ; $0EC0C3   |
    AND #$FF00          ; $0EC0C6   |
    STA $76,x           ; $0EC0C9   |
    LDA $7C16,x         ; $0EC0CB   |
    STA $300C           ; $0EC0CE   |
    LDA #$FFE0          ; $0EC0D1   |
    STA $3000           ; $0EC0D4   |
    LDX #$0B            ; $0EC0D7   |
    LDA #$86B6          ; $0EC0D9   |
    JSL $7EDE44         ; $0EC0DC   | GSU init
    LDX $12             ; $0EC0E0   |
    LDA $3000           ; $0EC0E2   |
    CLC                 ; $0EC0E5   |
    ADC $7220,x         ; $0EC0E6   |
    STA $7220,x         ; $0EC0E9   |
    LDY #$00            ; $0EC0EC   |
    LDA $60A8           ; $0EC0EE   |
    CLC                 ; $0EC0F1   |
    ADC $7220,x         ; $0EC0F2   |
    STA $60A8           ; $0EC0F5   |
    CLC                 ; $0EC0F8   |
    ADC #$0400          ; $0EC0F9   |
    CMP #$0800          ; $0EC0FC   |
    BCC CODE_0EC10B     ; $0EC0FF   |
    BMI CODE_0EC105     ; $0EC101   |
    INY                 ; $0EC103   |
    INY                 ; $0EC104   |

CODE_0EC105:
    LDA $C068,y         ; $0EC105   |
    STA $60A8           ; $0EC108   |

CODE_0EC10B:
    LDA $60A8           ; $0EC10B   |
    STA $60B4           ; $0EC10E   |
    RTS                 ; $0EC111   |

CODE_0EC112:
    LDA $60FC           ; $0EC112   |
    AND #$0007          ; $0EC115   |
    BNE CODE_0EC130     ; $0EC118   |
    LDA $6090           ; $0EC11A   |
    CLC                 ; $0EC11D   |
    ADC #$0002          ; $0EC11E   |
    STA $6090           ; $0EC121   |
    LDA #$0006          ; $0EC124   |
    STA $60C0           ; $0EC127   |
    LDA $7222,x         ; $0EC12A   |
    STA $60AA           ; $0EC12D   |

CODE_0EC130:
    LDA $60FC           ; $0EC130   |
    AND #$01E0          ; $0EC133   |
    BEQ CODE_0EC149     ; $0EC136   |
    LDA $60A8           ; $0EC138   |
    BEQ CODE_0EC153     ; $0EC13B   |
    LDA $60FC           ; $0EC13D   |
    AND #$0180          ; $0EC140   |
    DEC A               ; $0EC143   |
    EOR $60A8           ; $0EC144   |
    BMI CODE_0EC153     ; $0EC147   |

CODE_0EC149:
    LDA $7220,x         ; $0EC149   |
    ASL A               ; $0EC14C   |
    STA $60A8           ; $0EC14D   |
    STA $60B4           ; $0EC150   |

CODE_0EC153:
    RTS                 ; $0EC153   |

CODE_0EC154:
    LDA $7360,x         ; $0EC154   |
    CMP #$009E          ; $0EC157   |
    BEQ CODE_0EC1AF     ; $0EC15A   |
    CPX $0E2B           ; $0EC15C   |
    BEQ CODE_0EC1DD     ; $0EC15F   |
    LDY $0E2B           ; $0EC161   |
    BNE CODE_0EC1B9     ; $0EC164   |
    LDA $7220,x         ; $0EC166   |
    BEQ CODE_0EC173     ; $0EC169   |
    EOR $60A8           ; $0EC16B   |
    BPL CODE_0EC1D5     ; $0EC16E   |
    LDA $7220,x         ; $0EC170   |

CODE_0EC173:
    CLC                 ; $0EC173   |
    ADC #$0080          ; $0EC174   |
    CMP #$0100          ; $0EC177   |
    BCC CODE_0EC1D5     ; $0EC17A   |
    LDA $7220,x         ; $0EC17C   |
    CMP #$8000          ; $0EC17F   |
    ROR A               ; $0EC182   |
    STA $02             ; $0EC183   |
    CLC                 ; $0EC185   |
    ADC $7220,x         ; $0EC186   |
    STA $60A8           ; $0EC189   |
    STA $60B4           ; $0EC18C   |
    LDA $02             ; $0EC18F   |
    STA $7220,x         ; $0EC191   |
    LDA #$0006          ; $0EC194   |
    STA $60C0           ; $0EC197   |
    LDA #$8001          ; $0EC19A   |
    STA $60D2           ; $0EC19D   |
    LDA $60FC           ; $0EC1A0   |
    AND #$0007          ; $0EC1A3   |
    BEQ CODE_0EC1AE     ; $0EC1A6   |
    LDA #$FC00          ; $0EC1A8   |
    STA $60AA           ; $0EC1AB   |

CODE_0EC1AE:
    RTS                 ; $0EC1AE   |

CODE_0EC1AF:
    LDY $0E27           ; $0EC1AF   |
    BEQ CODE_0EC1DA     ; $0EC1B2   |
    CPX $0E27           ; $0EC1B4   |
    BEQ CODE_0EC1DD     ; $0EC1B7   |

CODE_0EC1B9:
    LDA $7220,x         ; $0EC1B9   |
    PHA                 ; $0EC1BC   |
    LDA $7220,y         ; $0EC1BD   |
    STA $7220,x         ; $0EC1C0   |
    PLA                 ; $0EC1C3   |
    STA $7220,y         ; $0EC1C4   |
    LDA $70E2,x         ; $0EC1C7   |
    SEC                 ; $0EC1CA   |
    SBC $06             ; $0EC1CB   |
    STA $70E2,x         ; $0EC1CD   |
    JSL $03A858         ; $0EC1D0   |
    RTS                 ; $0EC1D4   |

CODE_0EC1D5:
    STX $0E2B           ; $0EC1D5   |
    BRA CODE_0EC1DD     ; $0EC1D8   |

CODE_0EC1DA:
    STX $0E27           ; $0EC1DA   |

CODE_0EC1DD:
    JSL $05CDF9         ; $0EC1DD   |
    RTS                 ; $0EC1E1   |

CODE_0EC1E2:
    LDA $08             ; $0EC1E2   |
    INC A               ; $0EC1E4   |
    INC A               ; $0EC1E5   |
    STA $3018           ; $0EC1E6   |
    LDA $611C           ; $0EC1E9   |
    SEC                 ; $0EC1EC   |
    SBC #$0004          ; $0EC1ED   |
    STA $6020           ; $0EC1F0   |
    CLC                 ; $0EC1F3   |
    ADC #$0008          ; $0EC1F4   |
    STA $6024           ; $0EC1F7   |
    LDA $611E           ; $0EC1FA   |
    SEC                 ; $0EC1FD   |
    SBC $6122           ; $0EC1FE   |
    STA $00             ; $0EC201   |
    STA $6022           ; $0EC203   |
    STA $6026           ; $0EC206   |
    LDA #$0001          ; $0EC209   |
    STA $3012           ; $0EC20C   |
    LDX #$0A            ; $0EC20F   |
    LDA #$EA19          ; $0EC211   |
    JSL $7EDE91         ; $0EC214   | GSU init
    LDX $12             ; $0EC218   |
    LDA $3018           ; $0EC21A   |
    BEQ CODE_0EC222     ; $0EC21D   |
    INC $6022           ; $0EC21F   |

CODE_0EC222:
    LDA $6022           ; $0EC222   |
    SEC                 ; $0EC225   |
    SBC $00             ; $0EC226   |
    CLC                 ; $0EC228   |
    ADC $6090           ; $0EC229   |
    STA $6090           ; $0EC22C   |
    RTS                 ; $0EC22F   |

CODE_0EC230:
    LDY $60AB           ; $0EC230   |
    BMI CODE_0EC2A3     ; $0EC233   |
    LDA $08             ; $0EC235   |
    CMP #$FFF6          ; $0EC237   |
    BCC CODE_0EC2A3     ; $0EC23A   |
    JSR CODE_0EC1E2     ; $0EC23C   |
    LDA $7AF6,x         ; $0EC23F   |
    BNE CODE_0EC26B     ; $0EC242   |
    LDA #$0004          ; $0EC244   |
    STA $7AF6,x         ; $0EC247   |
    LDA $7C16,x         ; $0EC24A   |
    STA $300C           ; $0EC24D   |
    LDA #$FFE0          ; $0EC250   |
    STA $3000           ; $0EC253   |
    LDX #$0B            ; $0EC256   |
    LDA #$86B6          ; $0EC258   |
    JSL $7EDE44         ; $0EC25B   | GSU init
    LDX $12             ; $0EC25F   |
    LDA $3000           ; $0EC261   |
    CLC                 ; $0EC264   |
    ADC $7220,x         ; $0EC265   |
    STA $7220,x         ; $0EC268   |

CODE_0EC26B:
    STZ $60AA           ; $0EC26B   |
    INC $61B4           ; $0EC26E   |
    LDA $60A8           ; $0EC271   |
    PHA                 ; $0EC274   |
    LDA $7220,x         ; $0EC275   |
    PHA                 ; $0EC278   |
    LDA $608C           ; $0EC279   |
    PHA                 ; $0EC27C   |
    LDA #$0180          ; $0EC27D   |
    JSL $04AB6F         ; $0EC280   |
    PLA                 ; $0EC284   |
    PHA                 ; $0EC285   |
    SEC                 ; $0EC286   |
    SBC $608C           ; $0EC287   |
    EOR #$FFFF          ; $0EC28A   |
    INC A               ; $0EC28D   |
    STA $06             ; $0EC28E   |
    PLA                 ; $0EC290   |
    STA $608C           ; $0EC291   |
    LDA $06             ; $0EC294   |
    JSL $05CEAB         ; $0EC296   |
    PLA                 ; $0EC29A   |
    STA $7220,x         ; $0EC29B   |
    PLA                 ; $0EC29E   |
    STA $60A8           ; $0EC29F   |
    RTS                 ; $0EC2A2   |

CODE_0EC2A3:
    JMP CODE_0EBFF6     ; $0EC2A3   |

DATA_0EC2A6:         dw $0400, $FC00

CODE_0EC2AA:
    LDA $7A36,x         ; $0EC2AA   |
    LDY $7360,x         ; $0EC2AD   |
    CPY #$9E            ; $0EC2B0   |
    BEQ CODE_0EC2B7     ; $0EC2B2   |
    LDA $7902,x         ; $0EC2B4   |

CODE_0EC2B7:
    STA $02             ; $0EC2B7   |
    LDA $0035           ; $0EC2B9   |
    BIT $02             ; $0EC2BC   |
    BEQ CODE_0EC2D0     ; $0EC2BE   |
    AND $6084           ; $0EC2C0   |
    BEQ CODE_0EC2E3     ; $0EC2C3   |
    LDA $7220,x         ; $0EC2C5   |
    STA $60A8           ; $0EC2C8   |
    STA $60B4           ; $0EC2CB   |
    BRA CODE_0EC2E0     ; $0EC2CE   |

CODE_0EC2D0:
    LDA $608C           ; $0EC2D0   |
    CLC                 ; $0EC2D3   |
    ADC $72C0,x         ; $0EC2D4   |
    STA $608C           ; $0EC2D7   |
    LDA #$0160          ; $0EC2DA   |
    STA $093A           ; $0EC2DD   |

CODE_0EC2E0:
    JMP CODE_0EBFF6     ; $0EC2E0   |

CODE_0EC2E3:
    LDA $7220,x         ; $0EC2E3   |
    BEQ CODE_0EC2F9     ; $0EC2E6   |
    LDA $60FC           ; $0EC2E8   |
    AND #$01E0          ; $0EC2EB   |
    BEQ CODE_0EC2F9     ; $0EC2EE   |
    AND #$0180          ; $0EC2F0   |
    DEC A               ; $0EC2F3   |
    EOR $7220,x         ; $0EC2F4   |
    BPL CODE_0EC2D0     ; $0EC2F7   |

CODE_0EC2F9:
    JSL $05CE9F         ; $0EC2F9   |
    LDA $60DE           ; $0EC2FD   |
    ORA $6150           ; $0EC300   |
    BNE CODE_0EC35C     ; $0EC303   |
    LDA $60A8           ; $0EC305   |
    BPL CODE_0EC30E     ; $0EC308   |
    EOR #$FFFF          ; $0EC30A   |
    INC A               ; $0EC30D   |

CODE_0EC30E:
    AND #$FF00          ; $0EC30E   |
    XBA                 ; $0EC311   |
    SEC                 ; $0EC312   |
    ADC $7540,x         ; $0EC313   |
    LDY $77C2,x         ; $0EC316   |
    BEQ CODE_0EC31F     ; $0EC319   |
    EOR #$FFFF          ; $0EC31B   |
    INC A               ; $0EC31E   |

CODE_0EC31F:
    CLC                 ; $0EC31F   |
    ADC $7220,x         ; $0EC320   |
    STA $0E             ; $0EC323   |
    CLC                 ; $0EC325   |
    ADC #$0400          ; $0EC326   |
    LDY #$00            ; $0EC329   |
    CMP #$0800          ; $0EC32B   |
    BCC CODE_0EC339     ; $0EC32E   |
    BPL CODE_0EC334     ; $0EC330   |
    INY                 ; $0EC332   |
    INY                 ; $0EC333   |

CODE_0EC334:
    LDA $C2A6,y         ; $0EC334   |
    STA $0E             ; $0EC337   |

CODE_0EC339:
    LDA $0E             ; $0EC339   |
    STA $7220,x         ; $0EC33B   |
    INC $61C2           ; $0EC33E   |
    LDA $60A8           ; $0EC341   |
    BPL CODE_0EC34A     ; $0EC344   |
    EOR #$FFFF          ; $0EC346   |
    INC A               ; $0EC349   |

CODE_0EC34A:
    CLC                 ; $0EC34A   |
    ADC $7900,x         ; $0EC34B   |
    CMP #$0040          ; $0EC34E   |
    BMI CODE_0EC359     ; $0EC351   |
    INC $60DC           ; $0EC353   |
    AND #$003F          ; $0EC356   |

CODE_0EC359:
    STA $7900,x         ; $0EC359   |

CODE_0EC35C:
    RTS                 ; $0EC35C   |

DATA_0EC35D:         dw $0200, $FE00
DATA_0EC361:         dw $FFFF, $0001

    PHB                 ; $0EC365   |
    PHK                 ; $0EC366   |
    PLB                 ; $0EC367   |
    TXA                 ; $0EC368   |
    STA $3002           ; $0EC369   |
    LDX #$09            ; $0EC36C   |
    LDA #$9011          ; $0EC36E   |
    JSL $7EDE44         ; $0EC371   | GSU init
    BRA CODE_0EC380     ; $0EC375   |

CODE_0EC377:
    LDX #$09            ; $0EC377   |
    LDA $301E           ; $0EC379   |
    JSL $7EDE44         ; $0EC37C   | GSU init

CODE_0EC380:
    LDX $12             ; $0EC380   |
    LDY $301C           ; $0EC382   |
    DEY                 ; $0EC385   |
    BPL CODE_0EC38A     ; $0EC386   |
    PLB                 ; $0EC388   |
    RTL                 ; $0EC389   |

CODE_0EC38A:
    INY                 ; $0EC38A   |
    LDA $7360,y         ; $0EC38B   |
    CMP #$009E          ; $0EC38E   |
    BNE CODE_0EC398     ; $0EC391   |
    JSR CODE_0EC43B     ; $0EC393   |
    BRA CODE_0EC377     ; $0EC396   |

CODE_0EC398:
    CMP #$00F5          ; $0EC398   |
    BEQ CODE_0EC377     ; $0EC39B   |
    LDA $6FA2,y         ; $0EC39D   |
    AND #$0800          ; $0EC3A0   |
    BEQ CODE_0EC377     ; $0EC3A3   |
    LDA $7220,x         ; $0EC3A5   |
    CLC                 ; $0EC3A8   |
    ADC #$0010          ; $0EC3A9   |
    CMP #$0020          ; $0EC3AC   |
    BCS CODE_0EC406     ; $0EC3AF   |
    LDA $7CD6,y         ; $0EC3B1   |
    SEC                 ; $0EC3B4   |
    SBC $7CD6,x         ; $0EC3B5   |
    STA $0A             ; $0EC3B8   |
    LDA $7220,y         ; $0EC3BA   |
    BEQ CODE_0EC3EF     ; $0EC3BD   |
    EOR $0A             ; $0EC3BF   |
    BPL CODE_0EC377     ; $0EC3C1   |
    LDA $70E2,y         ; $0EC3C3   |
    SEC                 ; $0EC3C6   |
    SBC $72C0,y         ; $0EC3C7   |
    STA $70E2,y         ; $0EC3CA   |
    LDA $7400,y         ; $0EC3CD   |
    EOR #$0002          ; $0EC3D0   |
    STA $7400,y         ; $0EC3D3   |
    LDA $7220,y         ; $0EC3D6   |
    EOR #$FFFF          ; $0EC3D9   |
    INC A               ; $0EC3DC   |
    STA $7220,y         ; $0EC3DD   |
    EOR $75E0,y         ; $0EC3E0   |
    BPL CODE_0EC3EF     ; $0EC3E3   |
    LDA $75E0,y         ; $0EC3E5   |
    EOR #$FFFF          ; $0EC3E8   |
    INC A               ; $0EC3EB   |
    STA $75E0,y         ; $0EC3EC   |

CODE_0EC3EF:
    LDX #$00            ; $0EC3EF   |
    LDA $0A             ; $0EC3F1   |
    BMI CODE_0EC3F7     ; $0EC3F3   |
    INX                 ; $0EC3F5   |
    INX                 ; $0EC3F6   |

CODE_0EC3F7:
    LDA $70E2,y         ; $0EC3F7   |
    CLC                 ; $0EC3FA   |
    ADC $C361,x         ; $0EC3FB   |
    STA $70E2,y         ; $0EC3FE   |
    LDX $12             ; $0EC401   |

CODE_0EC403:
    JMP CODE_0EC377     ; $0EC403   |

CODE_0EC406:
    LDA $6FA2,y         ; $0EC406   |
    AND #$6000          ; $0EC409   |
    BNE CODE_0EC403     ; $0EC40C   |
    JSR CODE_0EC413     ; $0EC40E   |
    BRA CODE_0EC403     ; $0EC411   |

CODE_0EC413:
    LDA $7040,y         ; $0EC413   |
    ORA #$0004          ; $0EC416   |
    STA $7040,y         ; $0EC419   |
    PHY                 ; $0EC41C   |
    TYX                 ; $0EC41D   |
    JSL $03B25B         ; $0EC41E   |
    PLX                 ; $0EC422   |
    LDA $6F00,x         ; $0EC423   |
    CMP #$000C          ; $0EC426   |
    BNE CODE_0EC43A     ; $0EC429   |
    LDY #$00            ; $0EC42B   |
    LDA $6000           ; $0EC42D   |
    BPL CODE_0EC434     ; $0EC430   |
    INY                 ; $0EC432   |
    INY                 ; $0EC433   |

CODE_0EC434:
    LDA $C35D,y         ; $0EC434   |
    STA $7220,x         ; $0EC437   |

CODE_0EC43A:
    RTS                 ; $0EC43A   |

CODE_0EC43B:
    LDA $7BB8,x         ; $0EC43B   |
    ASL A               ; $0EC43E   |
    STA $00             ; $0EC43F   |
    LDA $7CD8,x         ; $0EC441   |
    SEC                 ; $0EC444   |
    SBC $7CD8,y         ; $0EC445   |
    BPL CODE_0EC453     ; $0EC448   |
    CLC                 ; $0EC44A   |
    ADC $00             ; $0EC44B   |
    CMP #$0008          ; $0EC44D   |
    BCS CODE_0EC4BA     ; $0EC450   |
    RTS                 ; $0EC452   |

CODE_0EC453:
    SEC                 ; $0EC453   |
    SBC $00             ; $0EC454   |
    DEC A               ; $0EC456   |
    CMP #$FFF7          ; $0EC457   |
    BCC CODE_0EC4BA     ; $0EC45A   |
    LDA $7860,x         ; $0EC45C   |
    AND #$0001          ; $0EC45F   |
    BEQ CODE_0EC475     ; $0EC462   |
    LDA $7222,y         ; $0EC464   |
    CMP #$8000          ; $0EC467   |
    ROR A               ; $0EC46A   |
    CMP #$8000          ; $0EC46B   |
    ROR A               ; $0EC46E   |
    EOR #$FFFF          ; $0EC46F   |
    INC A               ; $0EC472   |
    BRA CODE_0EC480     ; $0EC473   |

CODE_0EC475:
    LDA $7222,x         ; $0EC475   |
    PHA                 ; $0EC478   |
    LDA $7222,y         ; $0EC479   |
    STA $7222,x         ; $0EC47C   |
    PLA                 ; $0EC47F   |

CODE_0EC480:
    STA $7222,y         ; $0EC480   |
    LDA $7182,x         ; $0EC483   |
    SEC                 ; $0EC486   |
    SBC $72C2,x         ; $0EC487   |
    STA $7182,x         ; $0EC48A   |
    LDA $7182,y         ; $0EC48D   |
    SEC                 ; $0EC490   |
    SBC $72C2,y         ; $0EC491   |
    STA $7182,y         ; $0EC494   |
    LDA $7CD6,x         ; $0EC497   |
    SEC                 ; $0EC49A   |
    SBC $7CD6,y         ; $0EC49B   |
    PHP                 ; $0EC49E   |
    LDA $7220,y         ; $0EC49F   |
    BPL CODE_0EC4A8     ; $0EC4A2   |
    EOR #$FFFF          ; $0EC4A4   |
    INC A               ; $0EC4A7   |

CODE_0EC4A8:
    LSR A               ; $0EC4A8   |
    LSR A               ; $0EC4A9   |
    LSR A               ; $0EC4AA   |
    PLP                 ; $0EC4AB   |
    BPL CODE_0EC4B2     ; $0EC4AC   |
    EOR #$FFFF          ; $0EC4AE   |
    INC A               ; $0EC4B1   |

CODE_0EC4B2:
    CLC                 ; $0EC4B2   |
    ADC $7220,x         ; $0EC4B3   |
    STA $7220,x         ; $0EC4B6   |
    RTS                 ; $0EC4B9   |

CODE_0EC4BA:
    LDA $72C0,x         ; $0EC4BA   |
    ORA $72C0,y         ; $0EC4BD   |
    BNE CODE_0EC513     ; $0EC4C0   |
    LDA $7CD6,y         ; $0EC4C2   |
    SEC                 ; $0EC4C5   |
    SBC $7CD6,x         ; $0EC4C6   |
    STA $00             ; $0EC4C9   |
    CPX $0E27           ; $0EC4CB   |
    BNE CODE_0EC4EF     ; $0EC4CE   |
    LDA $00             ; $0EC4D0   |
    PHP                 ; $0EC4D2   |
    LDA $7BB6,x         ; $0EC4D3   |
    ASL A               ; $0EC4D6   |
    INC A               ; $0EC4D7   |
    PLP                 ; $0EC4D8   |
    BPL CODE_0EC4DF     ; $0EC4D9   |
    EOR #$FFFF          ; $0EC4DB   |
    INC A               ; $0EC4DE   |

CODE_0EC4DF:
    CLC                 ; $0EC4DF   |
    ADC $70E2,x         ; $0EC4E0   |
    STA $70E2,y         ; $0EC4E3   |
    CLC                 ; $0EC4E6   |
    ADC $7B56,y         ; $0EC4E7   |
    STA $7CD6,y         ; $0EC4EA   |
    BRA CODE_0EC53B     ; $0EC4ED   |

CODE_0EC4EF:
    CPY $0E27           ; $0EC4EF   |
    BNE CODE_0EC513     ; $0EC4F2   |
    LDA $00             ; $0EC4F4   |
    PHP                 ; $0EC4F6   |
    LDA $7BB6,x         ; $0EC4F7   |
    ASL A               ; $0EC4FA   |
    INC A               ; $0EC4FB   |
    PLP                 ; $0EC4FC   |
    BMI CODE_0EC503     ; $0EC4FD   |
    EOR #$FFFF          ; $0EC4FF   |
    INC A               ; $0EC502   |

CODE_0EC503:
    CLC                 ; $0EC503   |
    ADC $70E2,y         ; $0EC504   |
    STA $70E2,x         ; $0EC507   |
    CLC                 ; $0EC50A   |
    ADC $7B56,x         ; $0EC50B   |
    STA $7CD6,x         ; $0EC50E   |
    BRA CODE_0EC53B     ; $0EC511   |

CODE_0EC513:
    LDA $70E2,x         ; $0EC513   |
    SEC                 ; $0EC516   |
    SBC $72C0,x         ; $0EC517   |
    STA $70E2,x         ; $0EC51A   |
    LDA $7CD6,x         ; $0EC51D   |
    SEC                 ; $0EC520   |
    SBC $72C0,x         ; $0EC521   |
    STA $7CD6,x         ; $0EC524   |
    LDA $70E2,y         ; $0EC527   |
    SEC                 ; $0EC52A   |
    SBC $72C0,y         ; $0EC52B   |
    STA $70E2,y         ; $0EC52E   |
    LDA $7CD6,y         ; $0EC531   |
    SEC                 ; $0EC534   |
    SBC $72C0,y         ; $0EC535   |
    STA $7CD6,y         ; $0EC538   |

CODE_0EC53B:
    LDA $7220,x         ; $0EC53B   |
    PHA                 ; $0EC53E   |
    LDA $7220,y         ; $0EC53F   |
    STA $7220,x         ; $0EC542   |
    PLA                 ; $0EC545   |
    STA $7220,y         ; $0EC546   |
    RTS                 ; $0EC549   |

CODE_0EC54A:
    LDA $7220,x         ; $0EC54A   |
    CLC                 ; $0EC54D   |
    ADC #$0080          ; $0EC54E   |
    CMP #$0100          ; $0EC551   |
    BCS CODE_0EC561     ; $0EC554   |
    LDA $16,x           ; $0EC556   |
    CLC                 ; $0EC558   |
    ADC #$0110          ; $0EC559   |
    CMP #$0220          ; $0EC55C   |
    BCC CODE_0EC5A9     ; $0EC55F   |

CODE_0EC561:
    LDA $7902,x         ; $0EC561   |
    STA $02             ; $0EC564   |
    STZ $04             ; $0EC566   |
    LDA $70E2,x         ; $0EC568   |
    STA $06             ; $0EC56B   |
    LDA $7182,x         ; $0EC56D   |
    STA $08             ; $0EC570   |
    STZ $0E             ; $0EC572   |
    JSR CODE_0EC5BA     ; $0EC574   |
    LDY #$08            ; $0EC577   |
    STY $04             ; $0EC579   |
    JSR CODE_0EC5BA     ; $0EC57B   |
    LDY #$10            ; $0EC57E   |
    STY $04             ; $0EC580   |
    JSR CODE_0EC5BA     ; $0EC582   |
    LDY #$18            ; $0EC585   |
    STY $04             ; $0EC587   |
    JSR CODE_0EC5BA     ; $0EC589   |
    LDX $12             ; $0EC58C   |
    LDY $0E             ; $0EC58E   |
    BEQ CODE_0EC59C     ; $0EC590   |
    LDA $7220,x         ; $0EC592   |
    CMP #$8000          ; $0EC595   |
    ROR A               ; $0EC598   |
    STA $7220,x         ; $0EC599   |

CODE_0EC59C:
    LDY $0F             ; $0EC59C   |
    BEQ CODE_0EC5A9     ; $0EC59E   |
    LDA $16,x           ; $0EC5A0   |
    CMP #$8000          ; $0EC5A2   |
    ROR A               ; $0EC5A5   |
    STA $7222,x         ; $0EC5A6   |

CODE_0EC5A9:
    RTS                 ; $0EC5A9   |

DATA_0EC5AA:         dw $FFF9, $0008, $0017, $0008
DATA_0EC5B2:         dw $0008, $FFF9, $0008, $0017

CODE_0EC5BA:
    REP #$10            ; $0EC5BA   |
    LDA $02             ; $0EC5BC   |
    CLC                 ; $0EC5BE   |
    ADC $04             ; $0EC5BF   |
    TAX                 ; $0EC5C1   |
    LDA $700008,x       ; $0EC5C2   |
    STA $0091           ; $0EC5C6   |
    LDA $70000A,x       ; $0EC5C9   |
    STA $0093           ; $0EC5CD   |
    LDA $70000C,x       ; $0EC5D0   |
    AND #$F800          ; $0EC5D4   |
    CMP #$4000          ; $0EC5D7   |
    BNE CODE_0EC5E4     ; $0EC5DA   |
    SEP #$10            ; $0EC5DC   |
    JSL $0DA479         ; $0EC5DE   |
    BRA CODE_0EC603     ; $0EC5E2   |

CODE_0EC5E4:
    LDA $70000F,x       ; $0EC5E4   |
    AND #$00FF          ; $0EC5E8   |
    CMP #$007B          ; $0EC5EB   |
    BNE CODE_0EC5F8     ; $0EC5EE   |
    SEP #$10            ; $0EC5F0   |
    JSL $0EC61E         ; $0EC5F2   |
    BRA CODE_0EC603     ; $0EC5F6   |

CODE_0EC5F8:
    CMP #$007C          ; $0EC5F8   |
    BNE CODE_0EC61A     ; $0EC5FB   |
    SEP #$10            ; $0EC5FD   |
    JSL $0EC68D         ; $0EC5FF   |

CODE_0EC603:
    LDY $04             ; $0EC603   |
    CPY #$0018          ; $0EC605   |
    BPL CODE_0EC60E     ; $0EC608   |
    INC $0E             ; $0EC60A   |
    BRA CODE_0EC610     ; $0EC60C   |

CODE_0EC60E:
    INC $0F             ; $0EC60E   |

CODE_0EC610:
    SEP #$10            ; $0EC610   |
    LDA #$0010          ; $0EC612   |
    STA $7A98,x         ; $0EC615   |
    SEC                 ; $0EC618   |
    RTS                 ; $0EC619   |

CODE_0EC61A:
    SEP #$10            ; $0EC61A   |
    CLC                 ; $0EC61C   |
    RTS                 ; $0EC61D   |

    LDA $0093           ; $0EC61E   |
    PHA                 ; $0EC621   |
    LDA $0091           ; $0EC622   |
    PHA                 ; $0EC625   |
    LDA #$0000          ; $0EC626   |
    STA $0095           ; $0EC629   |
    LDA #$0001          ; $0EC62C   |
    STA $008F           ; $0EC62F   |
    JSL $109295         ; $0EC632   |
    LDA $0091           ; $0EC636   |
    CLC                 ; $0EC639   |
    ADC #$0010          ; $0EC63A   |
    STA $0091           ; $0EC63D   |
    JSL $109295         ; $0EC640   |
    LDA $0093           ; $0EC644   |
    CLC                 ; $0EC647   |
    ADC #$0010          ; $0EC648   |
    STA $0093           ; $0EC64B   |
    JSL $109295         ; $0EC64E   |
    PLA                 ; $0EC652   |
    STA $0091           ; $0EC653   |
    JSL $109295         ; $0EC656   |
    PLA                 ; $0EC65A   |
    STA $0093           ; $0EC65B   |
    LDX $12             ; $0EC65E   |
    LDA #$020C          ; $0EC660   |
    JSL $008B21         ; $0EC663   |
    LDA $0091           ; $0EC667   |
    AND #$FFF0          ; $0EC66A   |
    STA $70A2,y         ; $0EC66D   |
    LDA $0093           ; $0EC670   |
    AND #$FFF0          ; $0EC673   |
    STA $7142,y         ; $0EC676   |
    LDA #$000D          ; $0EC679   |
    STA $73C2,y         ; $0EC67C   |
    LDA #$0002          ; $0EC67F   |
    STA $7782,y         ; $0EC682   |
    LDA #$0048          ; $0EC685   |\ play sound #$0048
    JSL $0085D2         ; $0EC688   |/
    RTL                 ; $0EC68C   |

    LDA #$0006          ; $0EC68D   |
    STA $008F           ; $0EC690   |
    JSL $109295         ; $0EC693   |
    LDX $12             ; $0EC697   |
    LDA #$020B          ; $0EC699   |
    JSL $008B21         ; $0EC69C   |
    LDA $0091           ; $0EC6A0   |
    AND #$FFF0          ; $0EC6A3   |
    STA $70A2,y         ; $0EC6A6   |
    LDA $0093           ; $0EC6A9   |
    AND #$FFF0          ; $0EC6AC   |
    STA $7142,y         ; $0EC6AF   |
    LDA #$000C          ; $0EC6B2   |
    STA $73C2,y         ; $0EC6B5   |
    LDA #$0002          ; $0EC6B8   |
    STA $7782,y         ; $0EC6BB   |
    LDA #$000A          ; $0EC6BE   |\ play sound #$000A
    JSL $0085D2         ; $0EC6C1   |/
    RTL                 ; $0EC6C5   |

DATA_0EC6C6:         dw $0004, $0006, $0008, $0008
DATA_0EC6CE:         dw $0006, $0004

DATA_0EC6D2:         dw $0001, $0002, $0003, $0003
DATA_0EC6DA:         dw $0002, $0001, $0020, $0040
DATA_0EC6E2:         dw $0060, $0060, $0040, $0020

DATA_0EC6EA:         dw $0380, $0224, $01C0, $FE40
DATA_0EC6F2:         dw $FDDC, $FC80

DATA_0EC6F6:         dw $0180, $00D2, $00A0, $FF60
DATA_0EC6FE:         dw $FF2E, $FE80, $FFB0, $FF97
DATA_0EC706:         dw $FF40, $FF60, $FF2E, $FE80
DATA_0EC70E:         dw $0180, $00D2, $00A0, $0050
DATA_0EC716:         dw $0069, $00C0

CODE_0EC71A:
    STZ $7540,x         ; $0EC71A   |
    LDA $6F02,x         ; $0EC71D   |
    AND #$00FF          ; $0EC720   |
    BEQ CODE_0EC79D     ; $0EC723   |
    LDY #$00            ; $0EC725   |
    CMP #$0080          ; $0EC727   |
    BMI CODE_0EC737     ; $0EC72A   |
    ORA #$FF00          ; $0EC72C   |
    LDY #$02            ; $0EC72F   |
    CLC                 ; $0EC731   |
    ADC #$0020          ; $0EC732   |
    BRA CODE_0EC73D     ; $0EC735   |

CODE_0EC737:
    LDY #$08            ; $0EC737   |
    SEC                 ; $0EC739   |
    SBC #$0020          ; $0EC73A   |

CODE_0EC73D:
    BEQ CODE_0EC747     ; $0EC73D   |
    BMI CODE_0EC745     ; $0EC73F   |
    DEY                 ; $0EC741   |
    DEY                 ; $0EC742   |
    BRA CODE_0EC747     ; $0EC743   |

CODE_0EC745:
    INY                 ; $0EC745   |
    INY                 ; $0EC746   |

CODE_0EC747:
    LDA $7360,x         ; $0EC747   |
    CMP #$009E          ; $0EC74A   |
    BEQ CODE_0EC78F     ; $0EC74D   |
    PHY                 ; $0EC74F   |
    LDA $19,x           ; $0EC750   |
    AND #$00FF          ; $0EC752   |
    BEQ CODE_0EC768     ; $0EC755   |
    TYA                 ; $0EC757   |
    CLC                 ; $0EC758   |
    ADC #$000C          ; $0EC759   |
    TAY                 ; $0EC75C   |
    LDA $7220,x         ; $0EC75D   |
    BMI CODE_0EC768     ; $0EC760   |
    TYA                 ; $0EC762   |
    CLC                 ; $0EC763   |
    ADC #$000C          ; $0EC764   |
    TAY                 ; $0EC767   |

CODE_0EC768:
    LDA $C6F6,y         ; $0EC768   |
    STA $75E0,x         ; $0EC76B   |
    PLY                 ; $0EC76E   |
    LDA $75E0,x         ; $0EC76F   |
    BPL CODE_0EC778     ; $0EC772   |
    EOR #$FFFF          ; $0EC774   |
    INC A               ; $0EC777   |

CODE_0EC778:
    ASL A               ; $0EC778   |
    STA $00             ; $0EC779   |
    LSR A               ; $0EC77B   |
    CLC                 ; $0EC77C   |
    ADC $7220,x         ; $0EC77D   |
    CMP $00             ; $0EC780   |
    BCC CODE_0EC78A     ; $0EC782   |
    TYA                 ; $0EC784   |
    CLC                 ; $0EC785   |
    ADC #$000C          ; $0EC786   |
    TAY                 ; $0EC789   |

CODE_0EC78A:
    LDA $C6D2,y         ; $0EC78A   |
    BRA CODE_0EC798     ; $0EC78D   |

CODE_0EC78F:
    LDA $C6EA,y         ; $0EC78F   |
    STA $75E0,x         ; $0EC792   |
    LDA $C6C6,y         ; $0EC795   |

CODE_0EC798:
    STA $7540,x         ; $0EC798   |
    BRA CODE_0EC7D3     ; $0EC79B   |

CODE_0EC79D:
    LDA $7860,x         ; $0EC79D   |
    AND #$000F          ; $0EC7A0   |
    BEQ CODE_0EC810     ; $0EC7A3   |
    BIT #$0001          ; $0EC7A5   |
    BEQ CODE_0EC7D3     ; $0EC7A8   |
    LDA $18,x           ; $0EC7AA   |
    BNE CODE_0EC7D3     ; $0EC7AC   |
    LDA $7220,x         ; $0EC7AE   |
    CLC                 ; $0EC7B1   |
    ADC #$0004          ; $0EC7B2   |
    CMP #$0008          ; $0EC7B5   |
    BCS CODE_0EC7BF     ; $0EC7B8   |
    STZ $7220,x         ; $0EC7BA   |
    BRA CODE_0EC7D3     ; $0EC7BD   |

CODE_0EC7BF:
    LDA $7220,x         ; $0EC7BF   |
    BPL CODE_0EC7C8     ; $0EC7C2   |
    EOR #$FFFF          ; $0EC7C4   |
    INC A               ; $0EC7C7   |

CODE_0EC7C8:
    XBA                 ; $0EC7C8   |
    AND #$00FF          ; $0EC7C9   |
    INC A               ; $0EC7CC   |
    STA $7540,x         ; $0EC7CD   |
    STZ $75E0,x         ; $0EC7D0   |

CODE_0EC7D3:
    LDA $7860,x         ; $0EC7D3   |
    AND #$000C          ; $0EC7D6   |
    BEQ CODE_0EC810     ; $0EC7D9   |
    SEC                 ; $0EC7DB   |
    SBC #$0008          ; $0EC7DC   |
    EOR $7220,x         ; $0EC7DF   |
    BPL CODE_0EC810     ; $0EC7E2   |
    LDA $6F02,x         ; $0EC7E4   |
    BEQ CODE_0EC7F4     ; $0EC7E7   |
    LDA $6FA2,x         ; $0EC7E9   |
    AND #$001F          ; $0EC7EC   |
    CMP #$000E          ; $0EC7EF   |
    BEQ CODE_0EC810     ; $0EC7F2   |

CODE_0EC7F4:
    LDA $70E2,x         ; $0EC7F4   |
    SEC                 ; $0EC7F7   |
    SBC $72C0,x         ; $0EC7F8   |
    STA $70E2,x         ; $0EC7FB   |
    LDA $7220,x         ; $0EC7FE   |
    CMP #$8000          ; $0EC801   |
    ROR A               ; $0EC804   |
    CMP #$8000          ; $0EC805   |
    ROR A               ; $0EC808   |
    EOR #$FFFF          ; $0EC809   |
    INC A               ; $0EC80C   |
    STA $7220,x         ; $0EC80D   |

CODE_0EC810:
    RTS                 ; $0EC810   |

    LDA $7860,x         ; $0EC811   |
    AND #$000C          ; $0EC814   |
    BEQ CODE_0EC857     ; $0EC817   |
    LDA $7220,x         ; $0EC819   |
    CLC                 ; $0EC81C   |
    ADC #$0180          ; $0EC81D   |
    CMP #$0300          ; $0EC820   |
    BCC CODE_0EC857     ; $0EC823   |
    LDA #$01CC          ; $0EC825   |
    JSL $008B21         ; $0EC828   |
    LDA #$0008          ; $0EC82C   |
    STA $7E4C,y         ; $0EC82F   |
    LDA #$0001          ; $0EC832   |
    STA $7782,y         ; $0EC835   |
    LDA $70E2,x         ; $0EC838   |
    STA $70A2,y         ; $0EC83B   |
    LDA $7182,x         ; $0EC83E   |
    STA $7142,y         ; $0EC841   |
    LDA $7220,x         ; $0EC844   |
    STA $71E0,y         ; $0EC847   |
    LDA $7222,x         ; $0EC84A   |
    STA $71E2,y         ; $0EC84D   |
    LDA #$0037          ; $0EC850   |\ play sound #$0037
    JSL $0085D2         ; $0EC853   |/

CODE_0EC857:
    RTS                 ; $0EC857   |

CODE_0EC858:
    LDA $72C0,x         ; $0EC858   |
    ASL A               ; $0EC85B   |
    ASL A               ; $0EC85C   |
    ASL A               ; $0EC85D   |
    EOR #$FFFF          ; $0EC85E   |
    SEC                 ; $0EC861   |
    ADC $7A38,x         ; $0EC862   |
    STA $7A38,x         ; $0EC865   |
    RTS                 ; $0EC868   |

CODE_0EC869:
    LDA #$0055          ; $0EC869   |
    STA $301A           ; $0EC86C   |
    LDA #$6020          ; $0EC86F   |
    STA $3018           ; $0EC872   |
    LDY $7A38,x         ; $0EC875   |
    TYA                 ; $0EC878   |
    STA $300A           ; $0EC879   |
    LDA #$0100          ; $0EC87C   |
    STA $300C           ; $0EC87F   |
    LDY $7722,x         ; $0EC882   |
    TYX                 ; $0EC885   |
    LDA $03A9CE,x       ; $0EC886   |
    STA $3006           ; $0EC88A   |
    LDA $03A9EE,x       ; $0EC88D   |
    STA $3004           ; $0EC891   |
    LDX #$08            ; $0EC894   |
    LDA #$8205          ; $0EC896   |
    JSL $7EDE44         ; $0EC899   | GSU init
    LDX $12             ; $0EC89D   |
    INC $0CF9           ; $0EC89F   |
    RTS                 ; $0EC8A2   |

CODE_0EC8A3:
    LDA $72C0,x         ; $0EC8A3   |
    BPL CODE_0EC8AC     ; $0EC8A6   |
    EOR #$FFFF          ; $0EC8A8   |
    INC A               ; $0EC8AB   |

CODE_0EC8AC:
    CLC                 ; $0EC8AC   |
    ADC $78,x           ; $0EC8AD   |
    CMP #$0010          ; $0EC8AF   |
    BMI CODE_0EC8C1     ; $0EC8B2   |
    SEC                 ; $0EC8B4   |
    SBC #$0010          ; $0EC8B5   |
    PHA                 ; $0EC8B8   |
    LDA #$0059          ; $0EC8B9   |\ play sound #$0059
    JSL $0085D2         ; $0EC8BC   |/
    PLA                 ; $0EC8C0   |

CODE_0EC8C1:
    STA $78,x           ; $0EC8C1   |
    RTS                 ; $0EC8C3   |

CODE_0EC8C4:
    LDA $7222,x         ; $0EC8C4   |
    STA $16,x           ; $0EC8C7   |
    LDA #$04A2          ; $0EC8C9   |
    LDY $18,x           ; $0EC8CC   |
    BEQ CODE_0EC8D3     ; $0EC8CE   |
    LDA #$04E2          ; $0EC8D0   |

CODE_0EC8D3:
    STA $6FA0,x         ; $0EC8D3   |
    RTS                 ; $0EC8D6   |

    JSL $03AEEB         ; $0EC8D7   |
    LDY $021A           ; $0EC8DB   |
    CPY #$31            ; $0EC8DE   |
    BNE CODE_0EC8E8     ; $0EC8E0   |
    LDA #$8001          ; $0EC8E2   |
    STA $7040,x         ; $0EC8E5   |

CODE_0EC8E8:
    JSR CODE_0EC924     ; $0EC8E8   |
    LDA #$0598          ; $0EC8EB   |
    STA $7A36,x         ; $0EC8EE   |
    RTL                 ; $0EC8F1   |

    JSL $03AB1C         ; $0EC8F2   |
    JSL $03AF23         ; $0EC8F6   |
    STZ $7400,x         ; $0EC8FA   |
    JSL $0EC365         ; $0EC8FD   |
    JSR CODE_0EBFBB     ; $0EC901   |
    JSR CODE_0EC71A     ; $0EC904   |
    JSR CODE_0EC914     ; $0EC907   |
    JSR CODE_0EC924     ; $0EC90A   |
    JSR CODE_0EC8A3     ; $0EC90D   |
    JSR CODE_0EC8C4     ; $0EC910   |
    RTL                 ; $0EC913   |

CODE_0EC914:
    TXA                 ; $0EC914   |
    STA $3014           ; $0EC915   |
    LDX #$0B            ; $0EC918   |
    LDA #$9567          ; $0EC91A   |
    JSL $7EDE44         ; $0EC91D   | GSU init
    LDX $12             ; $0EC921   |
    RTS                 ; $0EC923   |

CODE_0EC924:
    LDA #$0054          ; $0EC924   |
    STA $301A           ; $0EC927   |
    LDA #$E080          ; $0EC92A   |
    STA $3018           ; $0EC92D   |
    LDY $7A39,x         ; $0EC930   |
    TYA                 ; $0EC933   |
    STA $300A           ; $0EC934   |
    LDA $7A36,x         ; $0EC937   |
    LSR A               ; $0EC93A   |
    LSR A               ; $0EC93B   |
    LSR A               ; $0EC93C   |
    STA $300C           ; $0EC93D   |
    LDY $7722,x         ; $0EC940   |
    TYX                 ; $0EC943   |
    LDA $03A9CE,x       ; $0EC944   |
    STA $3006           ; $0EC948   |
    LDA $03A9EE,x       ; $0EC94B   |
    STA $3004           ; $0EC94F   |
    LDX #$08            ; $0EC952   |
    LDA #$877E          ; $0EC954   |
    JSL $7EDE44         ; $0EC957   | GSU init
    LDX $12             ; $0EC95B   |
    INC $0CF9           ; $0EC95D   |
    RTS                 ; $0EC960   |

    TYX                 ; $0EC961   |
    RTS                 ; $0EC962   |

DATA_0EC963:         dw $FFFC, $0004

.init_bandit_under_cover
    LDA #$001E          ; $0EC967   |
    STA $7402,x         ; $0EC96A   |
    LDA $7360,x         ; $0EC96D   |
    SEC                 ; $0EC970   |
    SBC #$00A3          ; $0EC971   |
    ASL A               ; $0EC974   |
    STA $7400,x         ; $0EC975   |
    TAY                 ; $0EC978   |
    LDA $C963,y         ; $0EC979   |
    CLC                 ; $0EC97C   |
    ADC $70E2,x         ; $0EC97D   |
    STA $70E2,x         ; $0EC980   |
    LDY #$16            ; $0EC983   |
    STY $76,x           ; $0EC985   |

.init_bandit
    LDA #$0001          ; $0EC987   |
    STA $16,x           ; $0EC98A   |
    STZ $7900,x         ; $0EC98C   |
    STZ $7902,x         ; $0EC98F   |
    RTL                 ; $0EC992   |

bandit_state_ptr:
DATA_0EC993:         dw $CD8A                ; state 00
DATA_0EC995:         dw $CE01                ; state 02
DATA_0EC997:         dw $CEB1                ; state 04
DATA_0EC999:         dw $CF19                ; state 06
DATA_0EC99B:         dw $CFEE                ; state 08
DATA_0EC99D:         dw $D032                ; state 0A
DATA_0EC99F:         dw $D08F                ; state 0C
DATA_0EC9A1:         dw $D0E9                ; state 0E
DATA_0EC9A3:         dw $D183                ; state 10
DATA_0EC9A5:         dw $D1D0                ; state 12
DATA_0EC9A7:         dw $D1D0                ; state 14
DATA_0EC9A9:         dw $D264                ; state 16
DATA_0EC9AB:         dw $D0E9                ; state 18

.main_bandit
    LDA #$FC20          ; $0EC9AD   |
    LDY $76,x           ; $0EC9B0   |
    CPY #$16            ; $0EC9B2   |
    BPL CODE_0EC9C3     ; $0EC9B4   |
    LDY $61B3           ; $0EC9B6   |
    BMI CODE_0EC9C3     ; $0EC9B9   |
    LDY $7902,x         ; $0EC9BB   |
    BNE CODE_0EC9C3     ; $0EC9BE   |
    LDA #$7C20          ; $0EC9C0   |

CODE_0EC9C3:
    STA $6FA0,x         ; $0EC9C3   |
    LDA #$0040          ; $0EC9C6   |
    STA $7542,x         ; $0EC9C9   |
    JSR CODE_0EC9DA     ; $0EC9CC   |
    TXY                 ; $0EC9CF   |
    LDA $76,x           ; $0EC9D0   |
    AND #$00FF          ; $0EC9D2   |
    TAX                 ; $0EC9D5   |
    JSR ($C993,x)       ; $0EC9D6   | state table
    RTL                 ; $0EC9D9   |

; bandit sub

CODE_0EC9DA:
    LDA $6F00,x         ; $0EC9DA   |
    CMP #$0010          ; $0EC9DD   |
    BEQ CODE_0EC9ED     ; $0EC9E0   |
    CMP #$0008          ; $0EC9E2   |
    BEQ CODE_0EC9EA     ; $0EC9E5   |
    JMP CODE_0ECA77     ; $0EC9E7   |

CODE_0EC9EA:
    JMP CODE_0ECBAB     ; $0EC9EA   |

CODE_0EC9ED:
    LDA $7D38,x         ; $0EC9ED   |
    BNE CODE_0ECA3A     ; $0EC9F0   |
    LDY $76,x           ; $0EC9F2   |
    CPY #$16            ; $0EC9F4   |
    BEQ CODE_0ECA06     ; $0EC9F6   |
    LDA $61B0           ; $0EC9F8   |
    ORA $0B55           ; $0EC9FB   |
    ORA $0398           ; $0EC9FE   |
    BNE CODE_0ECA06     ; $0ECA01   |
    JSR CODE_0ECAA8     ; $0ECA03   |

CODE_0ECA06:
    LDA $70E2,x         ; $0ECA06   |
    LDY $7400,x         ; $0ECA09   |
    BNE CODE_0ECA15     ; $0ECA0C   |
    CMP #$0014          ; $0ECA0E   |
    BMI CODE_0ECA1E     ; $0ECA11   |
    BRA CODE_0ECA2C     ; $0ECA13   |

CODE_0ECA15:
    SEC                 ; $0ECA15   |
    SBC #$00F0          ; $0ECA16   |
    CMP $7E1A           ; $0ECA19   |
    BMI CODE_0ECA2C     ; $0ECA1C   |

CODE_0ECA1E:
    LDY $7902,x         ; $0ECA1E   |
    BEQ CODE_0ECA2C     ; $0ECA21   |
    LDY $76,x           ; $0ECA23   |
    CPY #$18            ; $0ECA25   |
    BEQ CODE_0ECA2C     ; $0ECA27   |
    JSR CODE_0ECAF8     ; $0ECA29   |

CODE_0ECA2C:
    JSL $03A2C7         ; $0ECA2C   |
    BCS CODE_0ECA35     ; $0ECA30   |
    JMP CODE_0ECA8D     ; $0ECA32   |

CODE_0ECA35:
    JSR CODE_0ECC9F     ; $0ECA35   |
    PLA                 ; $0ECA38   |
    RTL                 ; $0ECA39   |


CODE_0ECA3A:
    JSR CODE_0ECCC7     ; $0ECA3A   |
    JSL $03A2C7         ; $0ECA3D   |
    BCC CODE_0ECA47     ; $0ECA41   |
    JSL $03A31E         ; $0ECA43   |

CODE_0ECA47:
    PLA                 ; $0ECA47   |
    JSL $03AF23         ; $0ECA48   |
    LDA $7360,x         ; $0ECA4C   |
    CMP #$0020          ; $0ECA4F   |
    BEQ CODE_0ECA66     ; $0ECA52   |
    LDA #$FC20          ; $0ECA54   |
    STA $6FA0,x         ; $0ECA57   |
    LDA #$0801          ; $0ECA5A   |
    STA $6FA2,x         ; $0ECA5D   |
    LDA #$0002          ; $0ECA60   |
    STA $74A2,x         ; $0ECA63   |

CODE_0ECA66:
    LDY #$12            ; $0ECA66   |
    STY $76,x           ; $0ECA68   |
    LDA #$000A          ; $0ECA6A   |
    STA $7A36,x         ; $0ECA6D   |
    LDA #$0012          ; $0ECA70   |
    STA $7402,x         ; $0ECA73   |
    RTL                 ; $0ECA76   |


CODE_0ECA77:
    JSR CODE_0ECCC7     ; $0ECA77   |
    PLA                 ; $0ECA7A   |
    LDA $6F00,x         ; $0ECA7B   |
    CMP #$000C          ; $0ECA7E   |
    BEQ CODE_0ECA88     ; $0ECA81   |
    CMP #$0008          ; $0ECA83   |
    BNE CODE_0ECA8C     ; $0ECA86   |

CODE_0ECA88:
    JSL $03AF23         ; $0ECA88   |

CODE_0ECA8C:
    RTL                 ; $0ECA8C   |


CODE_0ECA8D:
    PLA                 ; $0ECA8D   |
    STA $00             ; $0ECA8E   |
    JSL $03AF23         ; $0ECA90   |
    LDA $00             ; $0ECA94   |
    PHA                 ; $0ECA96   |
    RTS                 ; $0ECA97   |

DATA_0ECA98:         dw $0000
DATA_0ECA9A:         dw $0100
DATA_0ECA9C:         dw $FF00

DATA_0ECA9E:         dw $FD80
DATA_0ECAA0:         dw $FE00
DATA_0ECAA2:         dw $FE00

DATA_0ECAA4:         dw $FF00
DATA_0ECAA6:         dw $0100

; bandit sub

CODE_0ECAA8:
    LDY $7D36,x         ; $0ECAA8   |
    BEQ CODE_0ECAD2     ; $0ECAAB   |
    BMI CODE_0ECAD3     ; $0ECAAD   |
    LDY $7D36,x         ; $0ECAAF   |
    LDA $6EFF,y         ; $0ECAB2   |
    CMP #$0010          ; $0ECAB5   |
    BNE CODE_0ECAC2     ; $0ECAB8   |
    LDA $7D37,y         ; $0ECABA   |
    BEQ CODE_0ECAC2     ; $0ECABD   |
    JMP CODE_0ECBFE     ; $0ECABF   |

CODE_0ECAC2:
    PLA                 ; $0ECAC2   |
    STA $00             ; $0ECAC3   |
    PLA                 ; $0ECAC5   |
    STA $02             ; $0ECAC6   |
    JSL $03A5B7         ; $0ECAC8   |
    LDA $02             ; $0ECACC   |
    PHA                 ; $0ECACE   |
    LDA $00             ; $0ECACF   |
    PHA                 ; $0ECAD1   |

CODE_0ECAD2:
    RTS                 ; $0ECAD2   |


CODE_0ECAD3:
    LDA $7E04           ; $0ECAD3   |
    BNE CODE_0ECB47     ; $0ECAD6   |
    LDY $60AB           ; $0ECAD8   |
    BMI CODE_0ECAD2     ; $0ECADB   |
    LDA $7C18,x         ; $0ECADD   |
    SEC                 ; $0ECAE0   |
    SBC $6122           ; $0ECAE1   |
    SEC                 ; $0ECAE4   |
    SBC $7BB8,x         ; $0ECAE5   |
    CMP #$FFF8          ; $0ECAE8   |
    BCC CODE_0ECAD2     ; $0ECAEB   |
    LDY $7902,x         ; $0ECAED   |
    DEY                 ; $0ECAF0   |
    BMI CODE_0ECB1B     ; $0ECAF1   |
    LDA $7AF8           ; $0ECAF3   |
    BEQ CODE_0ECB17     ; $0ECAF6   |

CODE_0ECAF8:
    LDY #$18            ; $0ECAF8   |
    STY $76,x           ; $0ECAFA   |
    LDA #$0007          ; $0ECAFC   |
    STA $7A36,x         ; $0ECAFF   |
    LDA #$0017          ; $0ECB02   |
    STA $7402,x         ; $0ECB05   |
    LDA #$FC00          ; $0ECB08   |
    STA $7222,x         ; $0ECB0B   |
    STZ $16,x           ; $0ECB0E   |
    LDA #$0020          ; $0ECB10   |
    STA $7AF8           ; $0ECB13   |
    RTS                 ; $0ECB16   |


CODE_0ECB17:
    JSL $06BF12         ; $0ECB17   |

CODE_0ECB1B:
    LDA $60FC           ; $0ECB1B   |
    AND #$0018          ; $0ECB1E   |
    BNE CODE_0ECAD2     ; $0ECB21   |
    LDA #$FA00          ; $0ECB23   |
    STA $60AA           ; $0ECB26   |
    LDA #$0006          ; $0ECB29   |
    STA $60C0           ; $0ECB2C   |
    LDY $77C2,x         ; $0ECB2F   |
    LDA $CAA4,y         ; $0ECB32   |
    STA $60A8           ; $0ECB35   |
    STA $60B4           ; $0ECB38   |
    LDY $60D4           ; $0ECB3B   |
    BNE CODE_0ECB47     ; $0ECB3E   |
    LDY $79,x           ; $0ECB40   |
    INY                 ; $0ECB42   |
    CPY #$03            ; $0ECB43   |
    BMI CODE_0ECB4D     ; $0ECB45   |

CODE_0ECB47:
    JSR CODE_0ECB73     ; $0ECB47   |
    JMP CODE_0ECC0C     ; $0ECB4A   |

CODE_0ECB4D:
    STY $79,x           ; $0ECB4D   |
    LDA #$001C          ; $0ECB4F   |\ play sound #$001C
    JSL $0085D2         ; $0ECB52   |/
    STZ $7540,x         ; $0ECB56   |
    STZ $7220,x         ; $0ECB59   |

CODE_0ECB5C:
    LDA #$0007          ; $0ECB5C   |
    STA $7A36,x         ; $0ECB5F   |
    LDA #$0015          ; $0ECB62   |
    STA $7402,x         ; $0ECB65   |
    LDA #$0001          ; $0ECB68   |
    STA $7A98,x         ; $0ECB6B   |
    LDY #$14            ; $0ECB6E   |
    STY $76,x           ; $0ECB70   |
    RTS                 ; $0ECB72   |

; bandit sub

CODE_0ECB73:
    LDY #$04            ; $0ECB73   |

CODE_0ECB75:
    LDA $CA98,y         ; $0ECB75   |
    STA $00             ; $0ECB78   |
    LDA $CA9E,y         ; $0ECB7A   |
    STA $02             ; $0ECB7D   |
    PHY                 ; $0ECB7F   |
    LDA #$0115          ; $0ECB80   |
    JSL $03A34C         ; $0ECB83   |
    BCC CODE_0ECBA5     ; $0ECB87   |
    LDA $70E2,x         ; $0ECB89   |
    STA $70E2,y         ; $0ECB8C   |
    LDA $7182,x         ; $0ECB8F   |
    STA $7182,y         ; $0ECB92   |
    LDA $00             ; $0ECB95   |
    STA $7220,y         ; $0ECB97   |
    LDA $02             ; $0ECB9A   |
    STA $7222,y         ; $0ECB9C   |
    PLY                 ; $0ECB9F   |
    DEY                 ; $0ECBA0   |
    DEY                 ; $0ECBA1   |
    BPL CODE_0ECB75     ; $0ECBA2   |
    RTS                 ; $0ECBA4   |

CODE_0ECBA5:
    PLY                 ; $0ECBA5   |
    RTS                 ; $0ECBA6   |

DATA_0ECBA7:         dw $0100
DATA_0ECBA9:         dw $FF00

; bandit sub

CODE_0ECBAB:
    JSR CODE_0ECCC7     ; $0ECBAB   |

CODE_0ECBAE:
    LDA #$0010          ; $0ECBAE   |
    STA $6F00,x         ; $0ECBB1   |
    STZ $6168           ; $0ECBB4   |
    LDA #$003C          ; $0ECBB7   |\ play sound #$003C
    JSL $0085D2         ; $0ECBBA   |/
    LDY #$02            ; $0ECBBE   |
    LDA $6150           ; $0ECBC0   |
    CMP #$0003          ; $0ECBC3   |
    BMI CODE_0ECBCA     ; $0ECBC6   |
    INY                 ; $0ECBC8   |
    INY                 ; $0ECBC9   |

CODE_0ECBCA:
    STY $6150           ; $0ECBCA   |
    CPY #$02            ; $0ECBCD   |
    BEQ CODE_0ECBDB     ; $0ECBCF   |
    LDY $77C3,x         ; $0ECBD1   |
    BEQ CODE_0ECBDB     ; $0ECBD4   |
    LDA #$FD00          ; $0ECBD6   |
    BRA CODE_0ECBE7     ; $0ECBD9   |

CODE_0ECBDB:
    LDY $77C2,x         ; $0ECBDB   |

CODE_0ECBDE:
    LDA $CBA7,y         ; $0ECBDE   |
    STA $7220,x         ; $0ECBE1   |
    LDA #$FF00          ; $0ECBE4   |

CODE_0ECBE7:
    STA $7222,x         ; $0ECBE7   |
    LDA #$0010          ; $0ECBEA   |
    STA $7540,x         ; $0ECBED   |
    STZ $75E0,x         ; $0ECBF0   |
    JSR CODE_0ECB5C     ; $0ECBF3   |
    RTS                 ; $0ECBF6   |

DATA_0ECBF7:         db $0C, $0D, $0E, $0F, $10, $11, $12

; bandit sub

CODE_0ECBFE:
    LDY $7D36,x         ; $0ECBFE   |
    DEY                 ; $0ECC01   |
    TYX                 ; $0ECC02   |
    JSL $03B25B         ; $0ECC03   |
    JSR CODE_0ECC34     ; $0ECC07   |
    BCC CODE_0ECC12     ; $0ECC0A   |

CODE_0ECC0C:
    PLA                 ; $0ECC0C   |
    PLA                 ; $0ECC0D   |
    JMP CODE_0E03B2     ; $0ECC0E   |

CODE_0ECC12:
    LDA #$001C          ; $0ECC12   |\ play sound #$001C
    JSL $0085D2         ; $0ECC15   |/
    INC $78,x           ; $0ECC19   |
    JSR CODE_0ECCC7     ; $0ECC1B   |
    LDY $7D36,x         ; $0ECC1E   |
    LDA $7CD5,y         ; $0ECC21   |
    LDY #$00            ; $0ECC24   |
    SEC                 ; $0ECC26   |
    SBC $7CD6,x         ; $0ECC27   |
    BMI CODE_0ECBDE     ; $0ECC2A   |
    INY                 ; $0ECC2C   |
    INY                 ; $0ECC2D   |
    BRA CODE_0ECBDE     ; $0ECC2E   |

DATA_0ECC30:         dw $0100
DATA_0ECC32:         dw $FF00

; bandit sub

CODE_0ECC34:
    LDY $78,x           ; $0ECC34   |
    INY                 ; $0ECC36   |
    CPY #$04            ; $0ECC37   |
    BMI CODE_0ECC53     ; $0ECC39   |
    PHY                 ; $0ECC3B   |
    LDA $70E2,x         ; $0ECC3C   |
    STA $0000           ; $0ECC3F   |
    LDA $7182,x         ; $0ECC42   |
    STA $0002           ; $0ECC45   |
    JSL $03A4A2         ; $0ECC48   |
    PLY                 ; $0ECC4C   |
    CPY #$06            ; $0ECC4D   |
    BMI CODE_0ECC9D     ; $0ECC4F   |
    SEC                 ; $0ECC51   |
    RTS                 ; $0ECC52   |


CODE_0ECC53:
    LDY $7400,x         ; $0ECC53   |
    LDA $CC30,y         ; $0ECC56   |
    CLC                 ; $0ECC59   |
    ADC $7220,x         ; $0ECC5A   |
    STA $02             ; $0ECC5D   |
    LDA #$0115          ; $0ECC5F   |
    JSL $03A364         ; $0ECC62   |
    BCC CODE_0ECC9D     ; $0ECC66   |
    LDA $70E2,x         ; $0ECC68   |
    STA $70E2,y         ; $0ECC6B   |
    LDA $7182,x         ; $0ECC6E   |
    STA $7182,y         ; $0ECC71   |
    LDA $02             ; $0ECC74   |
    STA $7220,y         ; $0ECC76   |
    LDA #$FC00          ; $0ECC79   |
    STA $7222,y         ; $0ECC7C   |
    LDA #$0100          ; $0ECC7F   |
    STA $7A96,y         ; $0ECC82   |
    LDA #$0140          ; $0ECC85   |
    STA $7A98,y         ; $0ECC88   |
    LDA #$0020          ; $0ECC8B   |
    STA $7AF6,y         ; $0ECC8E   |
    LDY $78,x           ; $0ECC91   |
    LDA $CBF7,y         ; $0ECC93   |
    AND #$00FF          ; $0ECC96   |
    JSL $0085D2         ; $0ECC99   |

CODE_0ECC9D:
    CLC                 ; $0ECC9D   |
    RTS                 ; $0ECC9E   |

; bandit sub

CODE_0ECC9F:
    LDA $7860,x         ; $0ECC9F   |
    AND #$0001          ; $0ECCA2   |
    BEQ CODE_0ECCB1     ; $0ECCA5   |
    LDA $70E2,x         ; $0ECCA7   |
    SEC                 ; $0ECCAA   |
    SBC $72C0,x         ; $0ECCAB   |
    STA $70E2,x         ; $0ECCAE   |

CODE_0ECCB1:
    LDY $7902,x         ; $0ECCB1   |
    BEQ CODE_0ECCF3     ; $0ECCB4   |
    LDA $6F00           ; $0ECCB6   |
    CMP #$0010          ; $0ECCB9   |
    BEQ CODE_0ECCDC     ; $0ECCBC   |
    LDY $7902           ; $0ECCBE   |
    BEQ CODE_0ECCC7     ; $0ECCC1   |
    CPX $18             ; $0ECCC3   |
    BEQ CODE_0ECCDC     ; $0ECCC5   |

CODE_0ECCC7:
    LDY $7902,x         ; $0ECCC7   |
    DEY                 ; $0ECCCA   |
    BMI CODE_0ECCDB     ; $0ECCCB   |
    LDY $76             ; $0ECCCD   |
    CPY #$08            ; $0ECCCF   |
    BEQ CODE_0ECCD7     ; $0ECCD1   |
    CPY #$09            ; $0ECCD3   |
    BNE CODE_0ECCDB     ; $0ECCD5   |

CODE_0ECCD7:
    JSL $06C114         ; $0ECCD7   |

CODE_0ECCDB:
    RTS                 ; $0ECCDB   |

CODE_0ECCDC:
    LDA $70E2,x         ; $0ECCDC   |
    STA $70E2,y         ; $0ECCDF   |
    LDA $7182,x         ; $0ECCE2   |
    SEC                 ; $0ECCE5   |
    SBC #$000E          ; $0ECCE6   |
    STA $7182,y         ; $0ECCE9   |
    LDA #$0000          ; $0ECCEC   |
    STA $7222,y         ; $0ECCEF   |
    RTS                 ; $0ECCF2   |


CODE_0ECCF3:
    PLA                 ; $0ECCF3   |
    PLA                 ; $0ECCF4   |
    JMP CODE_0E03A3     ; $0ECCF5   |

CODE_0ECCF9:
    LDY $7902,x         ; $0ECCF9   |
    BEQ CODE_0ECD12     ; $0ECCFC   |
    JSL $03A2C7         ; $0ECCFE   |
    BCC CODE_0ECD30     ; $0ECD02   |
    STZ $7220,x         ; $0ECD04   |
    STZ $7540,x         ; $0ECD07   |
    STZ $7222,x         ; $0ECD0A   |
    STZ $7542,x         ; $0ECD0D   |
    BRA CODE_0ECD30     ; $0ECD10   |

CODE_0ECD12:
    JSL $03A2C7         ; $0ECD12   |
    BCS CODE_0ECD4F     ; $0ECD16   |
    RTS                 ; $0ECD18   |

    LDA $7860,x         ; $0ECD19   |
    AND #$0001          ; $0ECD1C   |
    BEQ CODE_0ECD2B     ; $0ECD1F   |
    LDA $70E2,x         ; $0ECD21   |
    SEC                 ; $0ECD24   |
    SBC $72C0,x         ; $0ECD25   |
    STA $70E2,x         ; $0ECD28   |

CODE_0ECD2B:
    LDY $7902,x         ; $0ECD2B   |
    BEQ CODE_0ECD4F     ; $0ECD2E   |

CODE_0ECD30:
    LDA $6F00           ; $0ECD30   |
    CMP #$0010          ; $0ECD33   |
    BEQ CODE_0ECD3B     ; $0ECD36   |
    JMP CODE_0ECCC7     ; $0ECD38   |--

CODE_0ECD3B:
    LDA $70E2,x         ; $0ECD3B   |
    STA $70E2           ; $0ECD3E   |
    LDA $7182,x         ; $0ECD41   |
    SEC                 ; $0ECD44   |
    SBC #$000E          ; $0ECD45   |
    STA $7182           ; $0ECD48   |
    STZ $7222           ; $0ECD4B   |
    RTS                 ; $0ECD4E   |


CODE_0ECD4F:
    PLA                 ; $0ECD4F   |
    JMP CODE_0E03A3     ; $0ECD50   |

    LDY $7902,x         ; $0ECD54   |
    BEQ CODE_0ECD67     ; $0ECD57   |
    JSL $03A2C7         ; $0ECD59   |
    BCC CODE_0ECD30     ; $0ECD5D   |
    STZ $7220,x         ; $0ECD5F   |
    STZ $7540,x         ; $0ECD62   |
    BRA CODE_0ECD30     ; $0ECD65   |

CODE_0ECD67:
    JSL $03A2C7         ; $0ECD67   |
    BCS CODE_0ECD4F     ; $0ECD6B   |
    RTS                 ; $0ECD6D   |

DATA_0ECD6E:         dw $FFA7
DATA_0ECD70:         dw $0059
DATA_0ECD72:         dw $FE40
DATA_0ECD74:         dw $01C0
DATA_0ECD76:         dw $FDE0
DATA_0ECD78:         dw $0220
DATA_0ECD7A:         dw $FD80
DATA_0ECD7C:         dw $0280

DATA_0ECD7E:         dw $FE80
DATA_0ECD80:         dw $0180
DATA_0ECD82:         dw $FE40
DATA_0ECD84:         dw $01C0
DATA_0ECD86:         dw $FE00
DATA_0ECD88:         dw $0200

; bandit state 00
    TYX                 ; $0ECD8A   |
    LDA $7A98,x         ; $0ECD8B   |
    BNE CODE_0ECDAA     ; $0ECD8E   |
    LDA $16,x           ; $0ECD90   |
    BEQ CODE_0ECDB8     ; $0ECD92   |
    DEC $16,x           ; $0ECD94   |
    BEQ CODE_0ECDB8     ; $0ECD96   |
    LDA #$0010          ; $0ECD98   |
    STA $7A98,x         ; $0ECD9B   |
    LDA $7402,x         ; $0ECD9E   |
    EOR #$0003          ; $0ECDA1   |
    AND #$000B          ; $0ECDA4   |
    STA $7402,x         ; $0ECDA7   |

CODE_0ECDAA:
    LDA $7360,x         ; $0ECDAA   |
    CMP #$005B          ; $0ECDAD   |
    BEQ CODE_0ECDB5     ; $0ECDB0   |
    JMP CODE_0ED436     ; $0ECDB2   |

CODE_0ECDB5:
    JMP CODE_0ECE65     ; $0ECDB5   |

CODE_0ECDB8:
    LDA $10             ; $0ECDB8   |
    BIT #$0003          ; $0ECDBA   |
    BNE CODE_0ECDC7     ; $0ECDBD   |
    LDA $77C2,x         ; $0ECDBF   |
    AND #$00FF          ; $0ECDC2   |
    BRA CODE_0ECDCB     ; $0ECDC5   |

CODE_0ECDC7:
    XBA                 ; $0ECDC7   |
    AND #$0002          ; $0ECDC8   |

CODE_0ECDCB:
    STA $7400,x         ; $0ECDCB   |
    TAY                 ; $0ECDCE   |
    LDA $10             ; $0ECDCF   |
    AND #$001F          ; $0ECDD1   |
    CLC                 ; $0ECDD4   |
    ADC #$0020          ; $0ECDD5   |
    CPY #$02            ; $0ECDD8   |
    BEQ CODE_0ECDE0     ; $0ECDDA   |
    EOR #$FFFF          ; $0ECDDC   |
    INC A               ; $0ECDDF   |

CODE_0ECDE0:
    CLC                 ; $0ECDE0   |
    ADC $70E2,x         ; $0ECDE1   |
    STA $7900,x         ; $0ECDE4   |
    LDA $CD6E,y         ; $0ECDE7   |
    STA $75E0,x         ; $0ECDEA   |
    LDA #$0002          ; $0ECDED   |
    STA $7402,x         ; $0ECDF0   |
    STZ $7A36,x         ; $0ECDF3   |
    LDY #$02            ; $0ECDF6   |
    STY $76,x           ; $0ECDF8   |
    RTS                 ; $0ECDFA   |

DATA_0ECDFB:         db $07, $06, $05, $04, $03, $02

; bandit state 02
    TYX                 ; $0ECE01   |
    JSR CODE_0ED55C     ; $0ECE02   |
    LDA $7A98,x         ; $0ECE05   |
    BNE CODE_0ECE29     ; $0ECE08   |
    DEC $7A36,x         ; $0ECE0A   |
    BPL CODE_0ECE17     ; $0ECE0D   |
    LDY #$02            ; $0ECE0F   |
    LDA #$0005          ; $0ECE11   |
    STA $7A36,x         ; $0ECE14   |

CODE_0ECE17:
    LDA #$0003          ; $0ECE17   |
    STA $7A98,x         ; $0ECE1A   |
    LDY $7A36,x         ; $0ECE1D   |
    LDA $CDFB,y         ; $0ECE20   |
    AND #$00FF          ; $0ECE23   |
    STA $7402,x         ; $0ECE26   |

CODE_0ECE29:
    LDA #$000B          ; $0ECE29   |
    STA $7540,x         ; $0ECE2C   |
    LDA $70E2,x         ; $0ECE2F   |
    SEC                 ; $0ECE32   |
    SBC $7900,x         ; $0ECE33   |
    CLC                 ; $0ECE36   |
    ADC #$0002          ; $0ECE37   |
    CMP #$0004          ; $0ECE3A   |
    BCS CODE_0ECE5A     ; $0ECE3D   |
    LDA $10             ; $0ECE3F   |
    AND #$0001          ; $0ECE41   |
    CLC                 ; $0ECE44   |
    ADC #$0003          ; $0ECE45   |
    STA $16,x           ; $0ECE48   |
    STZ $7220,x         ; $0ECE4A   |
    STZ $7540,x         ; $0ECE4D   |
    LDA #$0009          ; $0ECE50   |
    STA $7402,x         ; $0ECE53   |
    LDY #$00            ; $0ECE56   |
    STY $76,x           ; $0ECE58   |

CODE_0ECE5A:
    LDA $7360,x         ; $0ECE5A   |
    CMP #$005B          ; $0ECE5D   |
    BEQ CODE_0ECE65     ; $0ECE60   |
    JMP CODE_0ED436     ; $0ECE62   |

CODE_0ECE65:
    LDY $77C2,x         ; $0ECE65   |
    TYA                 ; $0ECE68   |
    CMP $7400,x         ; $0ECE69   |
    BNE CODE_0ECEA2     ; $0ECE6C   |
    LDA $7C16,x         ; $0ECE6E   |
    CLC                 ; $0ECE71   |
    ADC #$0050          ; $0ECE72   |
    CMP #$00A0          ; $0ECE75   |
    BCS CODE_0ECEA2     ; $0ECE78   |
    LDA $7C18,x         ; $0ECE7A   |
    CLC                 ; $0ECE7D   |
    ADC #$0030          ; $0ECE7E   |
    CMP #$0060          ; $0ECE81   |
    BCS CODE_0ECEA2     ; $0ECE84   |
    LDA #$FE00          ; $0ECE86   |
    STA $7222,x         ; $0ECE89   |
    STZ $7220,x         ; $0ECE8C   |
    STZ $7540,x         ; $0ECE8F   |
    LDA #$0007          ; $0ECE92   |
    STA $7A36,x         ; $0ECE95   |
    LDA #$0017          ; $0ECE98   |
    STA $7402,x         ; $0ECE9B   |
    LDY #$04            ; $0ECE9E   |
    STY $76,x           ; $0ECEA0   |

CODE_0ECEA2:
    RTS                 ; $0ECEA2   |

DATA_0ECEA3:         db $01, $01, $01, $01, $04, $02, $02

DATA_0ECEAA:         db $09, $0C, $1D, $1C, $1B, $1A, $19

; bandit state 04
    TYX                 ; $0ECEB1   |
    LDA $7860,x         ; $0ECEB2   |
    BIT #$000C          ; $0ECEB5   |
    BEQ CODE_0ECEC9     ; $0ECEB8   |
    PHA                 ; $0ECEBA   |
    LDA $70E2,x         ; $0ECEBB   |
    SEC                 ; $0ECEBE   |
    SBC $72C0,x         ; $0ECEBF   |
    STA $70E2,x         ; $0ECEC2   |
    STZ $7220,x         ; $0ECEC5   |
    PLA                 ; $0ECEC8   |

CODE_0ECEC9:
    LDA $7222,x         ; $0ECEC9   |
    BMI CODE_0ECF18     ; $0ECECC   |
    LDA $7860,x         ; $0ECECE   |
    AND #$0001          ; $0ECED1   |
    BNE CODE_0ECEDD     ; $0ECED4   |
    LDA #$0018          ; $0ECED6   |
    STA $7402,x         ; $0ECED9   |
    RTS                 ; $0ECEDC   |

CODE_0ECEDD:
    LDA $7A98,x         ; $0ECEDD   |
    BNE CODE_0ECF18     ; $0ECEE0   |
    DEC $7A36,x         ; $0ECEE2   |
    BPL CODE_0ECF03     ; $0ECEE5   |
    STZ $7402,x         ; $0ECEE7   |
    LDY #$06            ; $0ECEEA   |
    LDA $7360,x         ; $0ECEEC   |
    CMP #$005B          ; $0ECEEF   |
    BNE CODE_0ECF00     ; $0ECEF2   |
    LDY $77C2,x         ; $0ECEF4   |
    TYA                 ; $0ECEF7   |
    EOR #$0002          ; $0ECEF8   |
    STA $7400,x         ; $0ECEFB   |
    LDY #$08            ; $0ECEFE   |

CODE_0ECF00:
    STY $76,x           ; $0ECF00   |
    RTS                 ; $0ECF02   |


CODE_0ECF03:
    LDY $7A36,x         ; $0ECF03   |
    LDA $CEA3,y         ; $0ECF06   |
    AND #$00FF          ; $0ECF09   |
    STA $7A98,x         ; $0ECF0C   |
    LDA $CEAA,y         ; $0ECF0F   |
    AND #$00FF          ; $0ECF12   |
    STA $7402,x         ; $0ECF15   |

CODE_0ECF18:
    RTS                 ; $0ECF18   |

; bandit state 06
    TYX                 ; $0ECF19   |
    LDA $16,x           ; $0ECF1A   |
    BPL CODE_0ECF25     ; $0ECF1C   |
    JSR CODE_0ED7F7     ; $0ECF1E   |
    STZ $16,x           ; $0ECF21   |
    BRA CODE_0ECF28     ; $0ECF23   |

CODE_0ECF25:
    JSR CODE_0ED640     ; $0ECF25   |

CODE_0ECF28:
    LDA #$000B          ; $0ECF28   |
    STA $7540,x         ; $0ECF2B   |
    LDA $70E2           ; $0ECF2E   |
    LDY #$00            ; $0ECF31   |
    SEC                 ; $0ECF33   |
    SBC $70E2,x         ; $0ECF34   |
    PHA                 ; $0ECF37   |
    BMI CODE_0ECF3C     ; $0ECF38   |
    INY                 ; $0ECF3A   |
    INY                 ; $0ECF3B   |

CODE_0ECF3C:
    TYA                 ; $0ECF3C   |
    STA $7400,x         ; $0ECF3D   |
    LDY $79,x           ; $0ECF40   |
    TYA                 ; $0ECF42   |
    ASL A               ; $0ECF43   |
    ASL A               ; $0ECF44   |
    CLC                 ; $0ECF45   |
    ADC $7400,x         ; $0ECF46   |
    TAY                 ; $0ECF49   |
    LDA $CD72,y         ; $0ECF4A   |
    STA $75E0,x         ; $0ECF4D   |
    LDA $7A98,x         ; $0ECF50   |
    BNE CODE_0ECF67     ; $0ECF53   |
    LDA #$0002          ; $0ECF55   |
    STA $7A98,x         ; $0ECF58   |
    LDA $7402,x         ; $0ECF5B   |
    EOR #$0001          ; $0ECF5E   |
    AND #$0001          ; $0ECF61   |
    STA $7402,x         ; $0ECF64   |

CODE_0ECF67:
    PLA                 ; $0ECF67   |
    CLC                 ; $0ECF68   |
    ADC #$0020          ; $0ECF69   |
    CMP #$0040          ; $0ECF6C   |
    BCS CODE_0ECFCC     ; $0ECF6F   |
    LDA $7182           ; $0ECF71   |
    SEC                 ; $0ECF74   |
    SBC $7182,x         ; $0ECF75   |
    BPL CODE_0ECFCC     ; $0ECF78   |
    CMP #$FFA0          ; $0ECF7A   |
    BMI CODE_0ECFCC     ; $0ECF7D   |
    CMP #$FFE8          ; $0ECF7F   |
    BPL CODE_0ECFCC     ; $0ECF82   |
    LDY $61B3           ; $0ECF84   |
    BMI CODE_0ECFCC     ; $0ECF87   |
    EOR #$FFFF          ; $0ECF89   |
    INC A               ; $0ECF8C   |
    AND #$00F0          ; $0ECF8D   |
    LSR A               ; $0ECF90   |
    LSR A               ; $0ECF91   |
    LSR A               ; $0ECF92   |
    TAY                 ; $0ECF93   |
    LDA $D5AE,y         ; $0ECF94   |
    STA $7222,x         ; $0ECF97   |
    LDA $7220,x         ; $0ECF9A   |
    CMP #$8000          ; $0ECF9D   |
    ROR A               ; $0ECFA0   |
    CMP #$8000          ; $0ECFA1   |
    ROR A               ; $0ECFA4   |
    STA $7220,x         ; $0ECFA5   |
    LDA #$0002          ; $0ECFA8   |
    STA $7900,x         ; $0ECFAB   |
    LDA $7540,x         ; $0ECFAE   |
    STA $7A36,x         ; $0ECFB1   |
    STZ $7540,x         ; $0ECFB4   |
    STZ $7542,x         ; $0ECFB7   |
    LDY #$0C            ; $0ECFBA   |
    STY $76,x           ; $0ECFBC   |
    LDA #$0004          ; $0ECFBE   |
    STA $7402,x         ; $0ECFC1   |
    LDA #$0004          ; $0ECFC4   |
    STA $7A98,x         ; $0ECFC7   |
    PLA                 ; $0ECFCA   |   \
    RTL                 ; $0ECFCB   | / back out of sprite


CODE_0ECFCC:
    JSR CODE_0ED488     ; $0ECFCC   |
    JSR CODE_0ED39D     ; $0ECFCF   |
    BCS CODE_0ECFED     ; $0ECFD2   |
    SEP #$20            ; $0ECFD4   |
    LDA $00             ; $0ECFD6   |
    STA $18,x           ; $0ECFD8   |
    LDA $02             ; $0ECFDA   |
    CLC                 ; $0ECFDC   |
    ADC #$0E            ; $0ECFDD   |
    STA $19,x           ; $0ECFDF   |
    REP #$20            ; $0ECFE1   |
    LDY #$0A            ; $0ECFE3   |
    STY $76,x           ; $0ECFE5   |
    LDA #$0000          ; $0ECFE7   |
    STA $7402,x         ; $0ECFEA   |

CODE_0ECFED:
    RTS                 ; $0ECFED   |

; bandit state 08
    TYX                 ; $0ECFEE   |
    JSR CODE_0ED80D     ; $0ECFEF   |
    LDA $7A98,x         ; $0ECFF2   |
    BNE CODE_0ED02F     ; $0ECFF5   |
    LDA $16,x           ; $0ECFF7   |
    BEQ CODE_0ED013     ; $0ECFF9   |
    DEC $16,x           ; $0ECFFB   |
    BEQ CODE_0ED013     ; $0ECFFD   |
    LDA #$0008          ; $0ECFFF   |
    STA $7A98,x         ; $0ED002   |
    LDA $7402,x         ; $0ED005   |
    EOR #$0003          ; $0ED008   |
    AND #$000B          ; $0ED00B   |
    STA $7402,x         ; $0ED00E   |
    BRA CODE_0ED02F     ; $0ED011   |

CODE_0ED013:
    LDY $7A36,x         ; $0ED013   |
    LDA $D5AE,y         ; $0ED016   |
    STA $7222,x         ; $0ED019   |
    STZ $7542,x         ; $0ED01C   |
    LDA #$0004          ; $0ED01F   |
    STA $7402,x         ; $0ED022   |
    LDA #$0004          ; $0ED025   |
    STA $7A98,x         ; $0ED028   |
    LDY #$0C            ; $0ED02B   |
    STY $76,x           ; $0ED02D   |

CODE_0ED02F:
    JMP CODE_0ED089     ; $0ED02F   |

; bandit state 0A
    TYX                 ; $0ED032   |
    LDA $16,x           ; $0ED033   |
    BPL CODE_0ED03E     ; $0ED035   |
    JSR CODE_0ED7F7     ; $0ED037   |
    STZ $16,x           ; $0ED03A   |
    BRA CODE_0ED041     ; $0ED03C   |

CODE_0ED03E:
    JSR CODE_0ED640     ; $0ED03E   |

CODE_0ED041:
    LDA $77C2,x         ; $0ED041   |
    AND #$00FF          ; $0ED044   |
    STA $7400,x         ; $0ED047   |
    EOR #$0002          ; $0ED04A   |
    TAY                 ; $0ED04D   |
    LDA $7A98,x         ; $0ED04E   |
    BNE CODE_0ED062     ; $0ED051   |
    LDA #$0002          ; $0ED053   |
    STA $7A98,x         ; $0ED056   |
    LDA $7402,x         ; $0ED059   |
    EOR #$0001          ; $0ED05C   |
    STA $7402,x         ; $0ED05F   |

CODE_0ED062:
    LDA $7400,x         ; $0ED062   |
    EOR #$0002          ; $0ED065   |
    STA $7400,x         ; $0ED068   |
    LDY $79,x           ; $0ED06B   |
    TYA                 ; $0ED06D   |
    ASL A               ; $0ED06E   |
    ASL A               ; $0ED06F   |
    CLC                 ; $0ED070   |
    ADC $7400,x         ; $0ED071   |
    TAY                 ; $0ED074   |
    LDA $CD7E,y         ; $0ED075   |
    STA $75E0,x         ; $0ED078   |
    LDA #$000B          ; $0ED07B   |
    STA $7540,x         ; $0ED07E   |
    LDA $7A96,x         ; $0ED081   |
    BNE CODE_0ED089     ; $0ED084   |
    JSR CODE_0ED34B     ; $0ED086   |

CODE_0ED089:
    JSR CODE_0ED488     ; $0ED089   |
    JMP CODE_0ED2EC     ; $0ED08C   |

; bandit state 0C
    TYX                 ; $0ED08F   |
    STZ $7542,x         ; $0ED090   |
    LDA $7A98,x         ; $0ED093   |
    BNE CODE_0ED0A8     ; $0ED096   |
    LDY #$0E            ; $0ED098   |
    STY $76,x           ; $0ED09A   |
    LDA #$0017          ; $0ED09C   |
    STA $7402,x         ; $0ED09F   |
    LDA #$0007          ; $0ED0A2   |
    STA $7A36,x         ; $0ED0A5   |

CODE_0ED0A8:
    LDA $70E2,x         ; $0ED0A8   |
    SEC                 ; $0ED0AB   |
    SBC $72C0,x         ; $0ED0AC   |
    STA $70E2,x         ; $0ED0AF   |
    LDA $7182,x         ; $0ED0B2   |
    SEC                 ; $0ED0B5   |
    SBC $72C2,x         ; $0ED0B6   |
    STA $7182,x         ; $0ED0B9   |

CODE_0ED0BC:
    JSR CODE_0ED488     ; $0ED0BC   |
    LDA $7902,x         ; $0ED0BF   |
    BEQ CODE_0ED0C7     ; $0ED0C2   |
    JSR CODE_0ED2EC     ; $0ED0C4   |

CODE_0ED0C7:
    LDA $7902,x         ; $0ED0C7   |
    BNE CODE_0ED0E0     ; $0ED0CA   |
    JSR CODE_0ED39D     ; $0ED0CC   |
    BCS CODE_0ED0E0     ; $0ED0CF   |
    SEP #$20            ; $0ED0D1   |
    LDA $00             ; $0ED0D3   |
    STA $18,x           ; $0ED0D5   |
    LDA $02             ; $0ED0D7   |
    CLC                 ; $0ED0D9   |
    ADC #$0E            ; $0ED0DA   |
    STA $19,x           ; $0ED0DC   |
    REP #$20            ; $0ED0DE   |

CODE_0ED0E0:
    RTS                 ; $0ED0E0   |

DATA_0ED0E1:         dw $0006
DATA_0ED0E3:         dw $000A

DATA_0ED0E5:         dw $0200
DATA_0ED0E7:         dw $FE00

; bandit states 0E & 18
    TYX                 ; $0ED0E9   |
    JSR CODE_0ED7F7     ; $0ED0EA   |
    LDA $7222,x         ; $0ED0ED   |
    BMI CODE_0ED171     ; $0ED0F0   |
    LDY $76,x           ; $0ED0F2   |
    CPY #$0E            ; $0ED0F4   |
    BEQ CODE_0ED125     ; $0ED0F6   |
    LDY $7902,x         ; $0ED0F8   |
    BEQ CODE_0ED125     ; $0ED0FB   |
    JSL $06C0BB         ; $0ED0FD   |
    LDA #$0040          ; $0ED101   |
    STA $7AF8           ; $0ED104   |
    LDY $77C2,x         ; $0ED107   |
    LDA $D0E5,y         ; $0ED10A   |
    STA $7220           ; $0ED10D   |
    LDA $70E2,x         ; $0ED110   |
    STA $70E2           ; $0ED113   |
    LDA $7182,x         ; $0ED116   |
    STA $7182           ; $0ED119   |
    STZ $7A38,x         ; $0ED11C   |
    STZ $7902,x         ; $0ED11F   |
    STZ $7540,x         ; $0ED122   |

CODE_0ED125:
    LDA $7860,x         ; $0ED125   |
    AND #$0001          ; $0ED128   |
    BNE CODE_0ED135     ; $0ED12B   |
    LDA #$0018          ; $0ED12D   |
    STA $7402,x         ; $0ED130   |
    BRA CODE_0ED171     ; $0ED133   |

CODE_0ED135:
    LDA $72C2,x         ; $0ED135   |
    CMP #$0003          ; $0ED138   |
    BMI CODE_0ED14A     ; $0ED13B   |
    STZ $7220,x         ; $0ED13D   |
    LDA $7A98,x         ; $0ED140   |
    BNE CODE_0ED171     ; $0ED143   |
    DEC $7A36,x         ; $0ED145   |
    BPL CODE_0ED15C     ; $0ED148   |

CODE_0ED14A:
    STZ $7402,x         ; $0ED14A   |
    LDY $7902,x         ; $0ED14D   |
    LDA $D0E1,y         ; $0ED150   |
    TAY                 ; $0ED153   |
    STY $76,x           ; $0ED154   |
    LDA #$FFFF          ; $0ED156   |
    STA $16,x           ; $0ED159   |
    RTS                 ; $0ED15B   |


CODE_0ED15C:
    LDY $7A36,x         ; $0ED15C   |
    LDA $CEA3,y         ; $0ED15F   |
    AND #$00FF          ; $0ED162   |
    STA $7A98,x         ; $0ED165   |
    LDA $CEAA,y         ; $0ED168   |
    AND #$00FF          ; $0ED16B   |
    STA $7402,x         ; $0ED16E   |

CODE_0ED171:
    LDY $76,x           ; $0ED171   |
    CPY #$0E            ; $0ED173   |
    BEQ CODE_0ED180     ; $0ED175   |
    LDY $7902,x         ; $0ED177   |
    BEQ CODE_0ED17F     ; $0ED17A   |
    JSR CODE_0ED2EC     ; $0ED17C   |

CODE_0ED17F:
    RTS                 ; $0ED17F   |


CODE_0ED180:
    JMP CODE_0ED0BC     ; $0ED180   |

; bandit state 10
    TYX                 ; $0ED183   |
    LDA $7A98,x         ; $0ED184   |
    BNE CODE_0ED198     ; $0ED187   |
    LDA #$0002          ; $0ED189   |
    STA $7A98,x         ; $0ED18C   |
    LDA $7402,x         ; $0ED18F   |
    EOR #$0001          ; $0ED192   |
    STA $7402,x         ; $0ED195   |

CODE_0ED198:
    LDA $7AF6,x         ; $0ED198   |
    BNE CODE_0ED1A7     ; $0ED19B   |
    LDA #$0012          ; $0ED19D   |
    STA $7A36,x         ; $0ED1A0   |
    LDY #$0A            ; $0ED1A3   |
    STY $76,x           ; $0ED1A5   |

CODE_0ED1A7:
    JSR CODE_0ED640     ; $0ED1A7   |
    LDA $7A96,x         ; $0ED1AA   |
    BNE CODE_0ED1B2     ; $0ED1AD   |
    JSR CODE_0ED34B     ; $0ED1AF   |

CODE_0ED1B2:
    JMP CODE_0ED089     ; $0ED1B2   |

DATA_0ED1B5:         db $14, $02, $02, $02
DATA_0ED1B9:         db $02, $02, $14, $02
DATA_0ED1BD:         db $02, $02

DATA_0ED1BF:         db $15, $16, $15, $16
DATA_0ED1C3:         db $15, $16, $15, $14
DATA_0ED1C7:         db $13, $12

DATA_0ED1C9:         db $15, $14, $13, $12
DATA_0ED1CD:         db $13, $14, $15

; bandit states 12 & 14
    TYX                 ; $0ED1D0   |
    LDA $7540,x         ; $0ED1D1   |
    BEQ CODE_0ED1E8     ; $0ED1D4   |
    ASL A               ; $0ED1D6   |
    STA $00             ; $0ED1D7   |
    LSR A               ; $0ED1D9   |
    CLC                 ; $0ED1DA   |
    ADC $7220,x         ; $0ED1DB   |
    CMP $00             ; $0ED1DE   |
    BCS CODE_0ED1E8     ; $0ED1E0   |
    STZ $7220,x         ; $0ED1E2   |
    STZ $7540,x         ; $0ED1E5   |

CODE_0ED1E8:
    LDA $7A98,x         ; $0ED1E8   |
    BNE CODE_0ED25F     ; $0ED1EB   |
    DEC $7A36,x         ; $0ED1ED   |
    BPL CODE_0ED231     ; $0ED1F0   |
    LDA $7540,x         ; $0ED1F2   |
    ASL A               ; $0ED1F5   |
    STA $00             ; $0ED1F6   |
    LSR A               ; $0ED1F8   |
    CLC                 ; $0ED1F9   |
    ADC $7220,x         ; $0ED1FA   |
    CMP $00             ; $0ED1FD   |
    BCS CODE_0ED207     ; $0ED1FF   |
    STZ $7540,x         ; $0ED201   |
    STZ $7220,x         ; $0ED204   |

CODE_0ED207:
    LDA $7360,x         ; $0ED207   |
    CMP #$005B          ; $0ED20A   |
    BEQ CODE_0ED214     ; $0ED20D   |
    LDY #$00            ; $0ED20F   |
    STY $76,x           ; $0ED211   |
    RTS                 ; $0ED213   |


CODE_0ED214:
    LDA #$0801          ; $0ED214   |
    STA $6FA2,x         ; $0ED217   |
    STZ $7402,x         ; $0ED21A   |
    STZ $7A36,x         ; $0ED21D   |
    LDA $77C2,x         ; $0ED220   |
    AND #$00FF          ; $0ED223   |
    EOR #$0002          ; $0ED226   |
    STA $7400,x         ; $0ED229   |
    LDY #$08            ; $0ED22C   |
    STY $76,x           ; $0ED22E   |
    RTS                 ; $0ED230   |


CODE_0ED231:
    LDY $76,x           ; $0ED231   |
    LDA $7360,x         ; $0ED233   |
    CMP #$005B          ; $0ED236   |
    BEQ CODE_0ED24A     ; $0ED239   |
    CPY #$14            ; $0ED23B   |
    BNE CODE_0ED24A     ; $0ED23D   |
    LDY $7A36,x         ; $0ED23F   |
    INC $7A98,x         ; $0ED242   |
    LDA $D1C9,y         ; $0ED245   |
    BRA CODE_0ED259     ; $0ED248   |

CODE_0ED24A:
    LDY $7A36,x         ; $0ED24A   |
    LDA $D1B5,y         ; $0ED24D   |
    AND #$00FF          ; $0ED250   |
    STA $7A98,x         ; $0ED253   |
    LDA $D1BF,y         ; $0ED256   |

CODE_0ED259:
    AND #$00FF          ; $0ED259   |
    STA $7402,x         ; $0ED25C   |

CODE_0ED25F:
    RTS                 ; $0ED25F   |

DATA_0ED260:         dw $FE9A
DATA_0ED262:         dw $0166

; bandit state 16
    TYX                 ; $0ED264   |
    LDA $70E2           ; $0ED265   |
    SEC                 ; $0ED268   |
    SBC $70E2,x         ; $0ED269   |
    STA $00             ; $0ED26C   |
    CLC                 ; $0ED26E   |
    ADC #$0070          ; $0ED26F   |
    CMP #$00E0          ; $0ED272   |
    BCS CODE_0ED2B4     ; $0ED275   |
    LDA $61B2           ; $0ED277   |
    BNE CODE_0ED2B4     ; $0ED27A   |
    LDY #$00            ; $0ED27C   |
    LDA $00             ; $0ED27E   |
    BMI CODE_0ED284     ; $0ED280   |
    INY                 ; $0ED282   |
    INY                 ; $0ED283   |

CODE_0ED284:
    TYA                 ; $0ED284   |
    STA $7400,x         ; $0ED285   |
    LDA $7360,x         ; $0ED288   |
    SEC                 ; $0ED28B   |
    SBC #$00A3          ; $0ED28C   |
    ASL A               ; $0ED28F   |
    TAY                 ; $0ED290   |
    LDA $D260,y         ; $0ED291   |
    STA $7220,x         ; $0ED294   |
    LDA #$0002          ; $0ED297   |
    STA $74A2,x         ; $0ED29A   |
    LDA #$FC20          ; $0ED29D   |
    STA $6FA0,x         ; $0ED2A0   |
    LDA #$0801          ; $0ED2A3   |
    STA $6FA2,x         ; $0ED2A6   |
    INC $7A38,x         ; $0ED2A9   |
    STZ $7402,x         ; $0ED2AC   |
    LDY #$06            ; $0ED2AF   |
    STY $76,x           ; $0ED2B1   |
    RTS                 ; $0ED2B3   |


CODE_0ED2B4:
    LDA $60C4           ; $0ED2B4   |
    DEC A               ; $0ED2B7   |
    EOR $7C16,x         ; $0ED2B8   |
    BPL CODE_0ED2C4     ; $0ED2BB   |
    LDA #$0020          ; $0ED2BD   |
    STA $7402,x         ; $0ED2C0   |
    RTS                 ; $0ED2C3   |

CODE_0ED2C4:
    LDY $7402,x         ; $0ED2C4   |
    CPY #$20            ; $0ED2C7   |
    BNE CODE_0ED2D1     ; $0ED2C9   |
    LDA #$001E          ; $0ED2CB   |
    STA $7402,x         ; $0ED2CE   |

CODE_0ED2D1:
    LDA $7A98,x         ; $0ED2D1   |
    BNE CODE_0ED2EB     ; $0ED2D4   |
    LDA $10             ; $0ED2D6   |
    AND #$001F          ; $0ED2D8   |
    CLC                 ; $0ED2DB   |
    ADC #$0010          ; $0ED2DC   |
    STA $7A98,x         ; $0ED2DF   |
    LDA $7402,x         ; $0ED2E2   |
    EOR #$0001          ; $0ED2E5   |
    STA $7402,x         ; $0ED2E8   |

CODE_0ED2EB:
    RTS                 ; $0ED2EB   |

; bandit sub

CODE_0ED2EC:
    LDA #$000E          ; $0ED2EC   |

CODE_0ED2EF:
    STA $04             ; $0ED2EF   |
    LDA $7902,x         ; $0ED2F1   |
    BEQ CODE_0ED346     ; $0ED2F4   |
    LDA $18,x           ; $0ED2F6   |
    AND #$00FF          ; $0ED2F8   |
    BEQ CODE_0ED309     ; $0ED2FB   |
    CMP #$0080          ; $0ED2FD   |
    BMI CODE_0ED308     ; $0ED300   |
    ORA #$FF00          ; $0ED302   |
    INC A               ; $0ED305   |
    BRA CODE_0ED309     ; $0ED306   |

CODE_0ED308:
    DEC A               ; $0ED308   |

CODE_0ED309:
    STA $00             ; $0ED309   |
    LDA $19,x           ; $0ED30B   |
    AND #$00FF          ; $0ED30D   |
    BEQ CODE_0ED31E     ; $0ED310   |
    CMP #$0080          ; $0ED312   |
    BMI CODE_0ED31D     ; $0ED315   |
    ORA #$FF00          ; $0ED317   |
    INC A               ; $0ED31A   |
    BRA CODE_0ED31E     ; $0ED31B   |

CODE_0ED31D:
    DEC A               ; $0ED31D   |

CODE_0ED31E:
    STA $02             ; $0ED31E   |
    LDY $7400,x         ; $0ED320   |
    STY $7400           ; $0ED323   |
    LDA $70E2,x         ; $0ED326   |
    CLC                 ; $0ED329   |
    ADC $00             ; $0ED32A   |
    STA $70E2           ; $0ED32C   |
    LDA $7182,x         ; $0ED32F   |
    SEC                 ; $0ED332   |
    SBC $04             ; $0ED333   |
    CLC                 ; $0ED335   |
    ADC $02             ; $0ED336   |
    STA $7182           ; $0ED338   |
    STZ $7222           ; $0ED33B   |
    LDY $00             ; $0ED33E   |
    STY $18,x           ; $0ED340   |
    LDY $02             ; $0ED342   |
    STY $19,x           ; $0ED344   |

CODE_0ED346:
    RTS                 ; $0ED346   |

DATA_0ED347:         dw $000C
DATA_0ED349:         dw $FFF4

; bandit sub

CODE_0ED34B:
    LDA #$0010          ; $0ED34B   |
    STA $7A96,x         ; $0ED34E   |
    LDY $7400,x         ; $0ED351   |
    LDA $D347,y         ; $0ED354   |
    STA $04             ; $0ED357   |
    LDA #$01D7          ; $0ED359   |
    JSL $008B21         ; $0ED35C   |
    LDA $7860,x         ; $0ED360   |
    AND #$000C          ; $0ED363   |
    BEQ CODE_0ED36D     ; $0ED366   |
    LDA #$0000          ; $0ED368   |
    BRA CODE_0ED370     ; $0ED36B   |

CODE_0ED36D:
    LDA $7220,x         ; $0ED36D   |

CODE_0ED370:
    STA $71E0,y         ; $0ED370   |
    LDA #$FF40          ; $0ED373   |
    CLC                 ; $0ED376   |
    ADC $7222,x         ; $0ED377   |
    STA $71E2,y         ; $0ED37A   |
    LDA #$0010          ; $0ED37D   |
    STA $7782,y         ; $0ED380   |
    LDA $70E2,x         ; $0ED383   |
    CLC                 ; $0ED386   |
    ADC $04             ; $0ED387   |
    STA $70A2,y         ; $0ED389   |
    LDA $7182,x         ; $0ED38C   |
    SEC                 ; $0ED38F   |
    SBC #$000E          ; $0ED390   |
    STA $7142,y         ; $0ED393   |
    LDA $7400,x         ; $0ED396   |
    STA $73C0,y         ; $0ED399   |
    RTS                 ; $0ED39C   |

; bandit sub

CODE_0ED39D:
    LDY $61CC           ; $0ED39D   |
    BNE CODE_0ED3C2     ; $0ED3A0   |
    LDA $70E2           ; $0ED3A2   |
    SEC                 ; $0ED3A5   |
    SBC $70E2,x         ; $0ED3A6   |
    CLC                 ; $0ED3A9   |
    ADC #$0010          ; $0ED3AA   |
    CMP #$0020          ; $0ED3AD   |
    BCS CODE_0ED3C2     ; $0ED3B0   |
    LDA $7182           ; $0ED3B2   |
    SEC                 ; $0ED3B5   |
    SBC $7182,x         ; $0ED3B6   |
    CLC                 ; $0ED3B9   |
    ADC #$0014          ; $0ED3BA   |
    CMP #$0020          ; $0ED3BD   |
    BCC CODE_0ED3C4     ; $0ED3C0   |

CODE_0ED3C2:
    SEC                 ; $0ED3C2   |
    RTS                 ; $0ED3C3   |


CODE_0ED3C4:
    LDA $76             ; $0ED3C4   |
    CMP #$0001          ; $0ED3C6   |
    BEQ CODE_0ED3C2     ; $0ED3C9   |

CODE_0ED3CB:
    LDY $61CC           ; $0ED3CB   |
    BNE CODE_0ED3C2     ; $0ED3CE   |
    LDY $18             ; $0ED3D0   |
    BNE CODE_0ED3C2     ; $0ED3D2   |
    LDA $6F00           ; $0ED3D4   |
    CMP #$0008          ; $0ED3D7   |
    BNE CODE_0ED3E2     ; $0ED3DA   |
    STZ $6162           ; $0ED3DC   |
    STZ $6168           ; $0ED3DF   |

CODE_0ED3E2:
    LDA $61B2           ; $0ED3E2   |
    BPL CODE_0ED3F9     ; $0ED3E5   |
    LDA #$000B          ; $0ED3E7   |\ play sound #$000B
    JSL $0085D2         ; $0ED3EA   |/
    LDA #$0020          ; $0ED3EE   |
    CMP $61D6           ; $0ED3F1   |
    BMI CODE_0ED3F9     ; $0ED3F4   |
    STA $61D6           ; $0ED3F6   |

CODE_0ED3F9:
    LDA $7400,x         ; $0ED3F9   |
    STA $7400           ; $0ED3FC   |
    JSL $06BE72         ; $0ED3FF   |
    LDA $70E2           ; $0ED403   |
    SEC                 ; $0ED406   |
    SBC $70E2,x         ; $0ED407   |
    STA $00             ; $0ED40A   |
    LDA $7182           ; $0ED40C   |
    SEC                 ; $0ED40F   |
    SBC $7182,x         ; $0ED410   |
    STA $02             ; $0ED413   |
    CLC                 ; $0ED415   |
    RTS                 ; $0ED416   |

; bandit sub

CODE_0ED417:
    LDA $7CD6           ; $0ED417   |
    SEC                 ; $0ED41A   |
    SBC $7CD6,x         ; $0ED41B   |
    CLC                 ; $0ED41E   |
    ADC #$0050          ; $0ED41F   |
    CMP #$00A0          ; $0ED422   |
    BCS CODE_0ED435     ; $0ED425   |
    LDA $7CD8           ; $0ED427   |
    SEC                 ; $0ED42A   |
    SBC $7CD8,x         ; $0ED42B   |
    CLC                 ; $0ED42E   |
    ADC #$0040          ; $0ED42F   |
    CMP #$0080          ; $0ED432   |

CODE_0ED435:
    RTS                 ; $0ED435   |

; bandit sub

CODE_0ED436:
    LDA $7860,x         ; $0ED436   |
    AND #$0001          ; $0ED439   |
    BEQ CODE_0ED435     ; $0ED43C   |
    LDA $7A38,x         ; $0ED43E   |
    BNE CODE_0ED457     ; $0ED441   |
    JSR CODE_0ED417     ; $0ED443   |
    BCS CODE_0ED435     ; $0ED446   |
    LDA $7902           ; $0ED448   |
    BEQ CODE_0ED451     ; $0ED44B   |
    LDA $18             ; $0ED44D   |
    BNE CODE_0ED487     ; $0ED44F   |

CODE_0ED451:
    LDA #$0001          ; $0ED451   |
    STA $7A38,x         ; $0ED454   |

CODE_0ED457:
    STZ $7402,x         ; $0ED457   |
    STZ $7400,x         ; $0ED45A   |
    LDA $70E2           ; $0ED45D   |
    CMP $70E2,x         ; $0ED460   |
    BMI CODE_0ED46B     ; $0ED463   |
    LDA #$0002          ; $0ED465   |
    STA $7400,x         ; $0ED468   |

CODE_0ED46B:
    LDA #$FE00          ; $0ED46B   |
    STA $7222,x         ; $0ED46E   |
    STZ $7220,x         ; $0ED471   |
    STZ $7540,x         ; $0ED474   |
    LDY #$04            ; $0ED477   |
    STY $76,x           ; $0ED479   |
    LDA #$0007          ; $0ED47B   |
    STA $7A36,x         ; $0ED47E   |
    LDA #$0017          ; $0ED481   |
    STA $7402,x         ; $0ED484   |

CODE_0ED487:
    RTS                 ; $0ED487   |

; bandit sub

CODE_0ED488:
    LDY $76,x           ; $0ED488   |
    CPY #$0E            ; $0ED48A   |
    BEQ CODE_0ED49A     ; $0ED48C   |
    CPY #$0C            ; $0ED48E   |
    BEQ CODE_0ED49A     ; $0ED490   |
    LDA $7860,x         ; $0ED492   |
    AND #$0001          ; $0ED495   |
    BEQ CODE_0ED487     ; $0ED498   |

CODE_0ED49A:
    LDA $6F00           ; $0ED49A   |
    STA $00             ; $0ED49D   |
    BNE CODE_0ED4A4     ; $0ED49F   |
    JMP CODE_0ED51C     ; $0ED4A1   |--

CODE_0ED4A4:
    LDA $76,x           ; $0ED4A4   |
    AND #$00FF          ; $0ED4A6   |
    CMP #$0008          ; $0ED4A9   |
    BEQ CODE_0ED4C2     ; $0ED4AC   |
    CMP #$000A          ; $0ED4AE   |
    BEQ CODE_0ED4C2     ; $0ED4B1   |
    CMP #$000E          ; $0ED4B3   |
    BEQ CODE_0ED4BD     ; $0ED4B6   |
    CMP #$000C          ; $0ED4B8   |
    BNE CODE_0ED4C9     ; $0ED4BB   |

CODE_0ED4BD:
    LDA $7902,x         ; $0ED4BD   |
    BEQ CODE_0ED4C9     ; $0ED4C0   |

CODE_0ED4C2:
    LDA $00             ; $0ED4C2   |
    CMP #$0008          ; $0ED4C4   |
    BEQ CODE_0ED4E6     ; $0ED4C7   |

CODE_0ED4C9:
    LDA $7902           ; $0ED4C9   |
    BEQ CODE_0ED51B     ; $0ED4CC   |
    CPX $18             ; $0ED4CE   |
    BEQ CODE_0ED4DB     ; $0ED4D0   |
    LDY $18             ; $0ED4D2   |
    BNE CODE_0ED4DC     ; $0ED4D4   |
    LDA $7902,x         ; $0ED4D6   |
    BNE CODE_0ED51C     ; $0ED4D9   |

CODE_0ED4DB:
    RTS                 ; $0ED4DB   |


CODE_0ED4DC:
    LDA $7360,x         ; $0ED4DC   |
    CMP #$005B          ; $0ED4DF   |
    BEQ CODE_0ED54A     ; $0ED4E2   |
    BRA CODE_0ED51C     ; $0ED4E4   |

CODE_0ED4E6:
    STZ $7978           ; $0ED4E6   |
    STZ $7902           ; $0ED4E9   |
    LDA $61B2           ; $0ED4EC   |
    AND #$BFFF          ; $0ED4EF   |
    STA $61B2           ; $0ED4F2   |
    LDA $7360,x         ; $0ED4F5   |
    CMP #$005B          ; $0ED4F8   |
    BEQ CODE_0ED51C     ; $0ED4FB   |
    STZ $7A38,x         ; $0ED4FD   |
    STZ $7902,x         ; $0ED500   |
    LDA #$001C          ; $0ED503   |\ play sound #$001C
    JSL $0085D2         ; $0ED506   |/
    STZ $7540,x         ; $0ED50A   |
    STZ $7220,x         ; $0ED50D   |
    LDA #$0040          ; $0ED510   |
    STA $7A98,x         ; $0ED513   |
    JSL $0ECA66         ; $0ED516   |
    PLA                 ; $0ED51A   |

CODE_0ED51B:
    RTS                 ; $0ED51B   |


CODE_0ED51C:
    LDY #$00            ; $0ED51C   |
    STY $76,x           ; $0ED51E   |
    LDA #$0080          ; $0ED520   |
    STA $7AF8,x         ; $0ED523   |
    LDA #$0018          ; $0ED526   |
    STA $7A98,x         ; $0ED529   |
    LDA $10             ; $0ED52C   |
    AND #$0001          ; $0ED52E   |
    CLC                 ; $0ED531   |
    ADC #$0003          ; $0ED532   |
    STA $16,x           ; $0ED535   |
    STZ $7A38,x         ; $0ED537   |
    STZ $7902,x         ; $0ED53A   |
    STZ $7220,x         ; $0ED53D   |
    STZ $7540,x         ; $0ED540   |
    LDA #$0009          ; $0ED543   |
    STA $7402,x         ; $0ED546   |
    PLA                 ; $0ED549   |

CODE_0ED54A:
    RTS                 ; $0ED54A   |

; (unused?) bandit sub
    LDA $7860,x         ; $0ED54B   |
    AND #$0001          ; $0ED54E   |
    BEQ CODE_0ED55B     ; $0ED551   |
    LDA $61B2           ; $0ED553   |
    AND #$6000          ; $0ED556   |
    BEQ CODE_0ED51C     ; $0ED559   |

CODE_0ED55B:
    RTS                 ; $0ED55B   |

; bandit sub

CODE_0ED55C:
    LDA $7860,x         ; $0ED55C   |
    BIT #$000C          ; $0ED55F   |
    BEQ CODE_0ED578     ; $0ED562   |
    LDA $7860,x         ; $0ED564   |
    AND #$0008          ; $0ED567   |
    DEC A               ; $0ED56A   |
    EOR $7220,x         ; $0ED56B   |
    BPL CODE_0ED575     ; $0ED56E   |
    JSR CODE_0ED80D     ; $0ED570   |
    BRA CODE_0ED591     ; $0ED573   |

CODE_0ED575:
    LDA $7860,x         ; $0ED575   |

CODE_0ED578:
    AND #$0001          ; $0ED578   |
    STA $00             ; $0ED57B   |
    LDA $6F02,x         ; $0ED57D   |
    AND #$00FF          ; $0ED580   |
    ORA $00             ; $0ED583   |
    BNE CODE_0ED5AD     ; $0ED585   |
    LDA $70E2,x         ; $0ED587   |
    SEC                 ; $0ED58A   |
    SBC $72C0,x         ; $0ED58B   |
    STA $70E2,x         ; $0ED58E   |

CODE_0ED591:
    LDA #$0001          ; $0ED591   |
    STA $16,x           ; $0ED594   |
    LDA #$0040          ; $0ED596   |
    STA $7542,x         ; $0ED599   |
    LDA #$0009          ; $0ED59C   |
    STA $7402,x         ; $0ED59F   |
    STZ $7220,x         ; $0ED5A2   |
    STZ $7540,x         ; $0ED5A5   |
    LDY #$00            ; $0ED5A8   |
    STY $76,x           ; $0ED5AA   |
    PLA                 ; $0ED5AC   |

CODE_0ED5AD:
    RTS                 ; $0ED5AD   |

DATA_0ED5AE:         dw $FCC0
DATA_0ED5B0:         dw $FBC0
DATA_0ED5B2:         dw $FAC0
DATA_0ED5B4:         dw $F9C0
DATA_0ED5B6:         dw $F940
DATA_0ED5B8:         dw $F8C0
DATA_0ED5BA:         dw $F7C0

DATA_0ED5BC:         dw $FFF0
DATA_0ED5BE:         dw $0010

DATA_0ED5C0:         dw $00E0
DATA_0ED5C2:         dw $0160
DATA_0ED5C4:         dw $01A0
DATA_0ED5C6:         dw $01F0
DATA_0ED5C8:         dw $00F0
DATA_0ED5CA:         dw $0160
DATA_0ED5CC:         dw $01C0
DATA_0ED5CE:         dw $0200
DATA_0ED5D0:         dw $0100
DATA_0ED5D2:         dw $0160
DATA_0ED5D4:         dw $01D0
DATA_0ED5D6:         dw $0220
DATA_0ED5D8:         dw $0100
DATA_0ED5DA:         dw $0170
DATA_0ED5DC:         dw $01F0
DATA_0ED5DE:         dw $0240
DATA_0ED5E0:         dw $0100
DATA_0ED5E2:         dw $0180
DATA_0ED5E4:         dw $0200
DATA_0ED5E6:         dw $0240
DATA_0ED5E8:         dw $0100
DATA_0ED5EA:         dw $0190
DATA_0ED5EC:         dw $0210
DATA_0ED5EE:         dw $0260
DATA_0ED5F0:         dw $00E0
DATA_0ED5F2:         dw $01A0
DATA_0ED5F4:         dw $0220
DATA_0ED5F6:         dw $0260
DATA_0ED5F8:         dw $00E0
DATA_0ED5FA:         dw $01A0
DATA_0ED5FC:         dw $0220
DATA_0ED5FE:         dw $0260

DATA_0ED600:         dw $FF00
DATA_0ED602:         dw $FE80
DATA_0ED604:         dw $FD80
DATA_0ED606:         dw $FD00
DATA_0ED608:         dw $FE80
DATA_0ED60A:         dw $FDA0
DATA_0ED60C:         dw $FD00
DATA_0ED60E:         dw $FCA0
DATA_0ED610:         dw $FE00
DATA_0ED612:         dw $FD00
DATA_0ED614:         dw $FD00
DATA_0ED616:         dw $FC60
DATA_0ED618:         dw $FD20
DATA_0ED61A:         dw $FCA0
DATA_0ED61C:         dw $FC80
DATA_0ED61E:         dw $FC20
DATA_0ED620:         dw $FC80
DATA_0ED622:         dw $FC40
DATA_0ED624:         dw $FC00
DATA_0ED626:         dw $FB80
DATA_0ED628:         dw $FBD0
DATA_0ED62A:         dw $FBD0
DATA_0ED62C:         dw $FBA0
DATA_0ED62E:         dw $FB40
DATA_0ED630:         dw $FB00
DATA_0ED632:         dw $FB10
DATA_0ED634:         dw $FB00
DATA_0ED636:         dw $FAD0
DATA_0ED638:         dw $FA80
DATA_0ED63A:         dw $FA20
DATA_0ED63C:         dw $FA80
DATA_0ED63E:         dw $F980

; bandit sub

CODE_0ED640:
    LDA $6F02,x         ; $0ED640   |
    AND #$00FF          ; $0ED643   |
    BNE CODE_0ED650     ; $0ED646   |
    LDA $7860,x         ; $0ED648   |
    BIT #$0001          ; $0ED64B   |
    BEQ CODE_0ED653     ; $0ED64E   |

CODE_0ED650:
    JMP CODE_0ED747     ; $0ED650   |--

CODE_0ED653:
    BIT #$000C          ; $0ED653   |
    BEQ CODE_0ED65B     ; $0ED656   |
    JMP CODE_0ED752     ; $0ED658   |--

CODE_0ED65B:
    LDY $7400,x         ; $0ED65B   |
    LDA $7CD6,x         ; $0ED65E   |
    CLC                 ; $0ED661   |
    ADC $D5BC,y         ; $0ED662   |
    STA $3012           ; $0ED665   |
    STA $3004           ; $0ED668   |
    LDA $7CD8,x         ; $0ED66B   |
    CLC                 ; $0ED66E   |
    ADC #$0040          ; $0ED66F   |
    STA $3014           ; $0ED672   |
    STA $3006           ; $0ED675   |
    LDA $D5BC,y         ; $0ED678   |
    STA $3008           ; $0ED67B   |
    LDA #$0004          ; $0ED67E   |
    STA $6020           ; $0ED681   |
    STZ $301C           ; $0ED684   |
    LDX #$0A            ; $0ED687   |
    LDA #$CE3F          ; $0ED689   |
    JSL $7EDE91         ; $0ED68C   | GSU init
    LDX $12             ; $0ED690   |
    LDA $301C           ; $0ED692   |
    BPL CODE_0ED6DC     ; $0ED695   |

CODE_0ED697:
    LDY $7902,x         ; $0ED697   |
    BNE CODE_0ED6A4     ; $0ED69A   |
    LDA $10             ; $0ED69C   |
    AND #$0001          ; $0ED69E   |
    JMP CODE_0ED7AF     ; $0ED6A1   |

CODE_0ED6A4:
    JSR CODE_0ED80D     ; $0ED6A4   |
    LDA $75E0,x         ; $0ED6A7   |
    EOR #$FFFF          ; $0ED6AA   |
    INC A               ; $0ED6AD   |
    STA $75E0,x         ; $0ED6AE   |
    LDA $7400,x         ; $0ED6B1   |
    EOR #$0002          ; $0ED6B4   |
    STA $7400,x         ; $0ED6B7   |
    LDA $7220,x         ; $0ED6BA   |
    EOR #$FFFF          ; $0ED6BD   |
    INC A               ; $0ED6C0   |
    STA $7220,x         ; $0ED6C1   |
    LDA #$0010          ; $0ED6C4   |
    STA $7AF6,x         ; $0ED6C7   |
    LDA #$000C          ; $0ED6CA   |
    LDY $7360,x         ; $0ED6CD   |
    CPY #$5B            ; $0ED6D0   |
    BEQ CODE_0ED6D7     ; $0ED6D2   |
    LDA #$0010          ; $0ED6D4   |

CODE_0ED6D7:
    TAY                 ; $0ED6D7   |
    STY $76,x           ; $0ED6D8   |
    PLA                 ; $0ED6DA   |
    RTS                 ; $0ED6DB   |


CODE_0ED6DC:
    AND #$000F          ; $0ED6DC   |
    ASL A               ; $0ED6DF   |
    STA $00             ; $0ED6E0   |
    LDA $301C           ; $0ED6E2   |
    AND #$00F0          ; $0ED6E5   |
    LSR A               ; $0ED6E8   |
    CLC                 ; $0ED6E9   |
    ADC $00             ; $0ED6EA   |
    TAY                 ; $0ED6EC   |
    LDA $D5C0,y         ; $0ED6ED   |
    STA $7220,x         ; $0ED6F0   |
    LDA $D600,y         ; $0ED6F3   |
    STA $7222,x         ; $0ED6F6   |
    LDY $7400,x         ; $0ED6F9   |
    BNE CODE_0ED708     ; $0ED6FC   |
    LDA $7220,x         ; $0ED6FE   |
    EOR #$FFFF          ; $0ED701   |
    INC A               ; $0ED704   |
    STA $7220,x         ; $0ED705   |

CODE_0ED708:
    STZ $7900,x         ; $0ED708   |
    LDA $7540,x         ; $0ED70B   |
    STA $7A36,x         ; $0ED70E   |
    STZ $7540,x         ; $0ED711   |
    LDA #$0004          ; $0ED714   |
    STA $7402,x         ; $0ED717   |
    LDA #$0004          ; $0ED71A   |
    STA $7A98,x         ; $0ED71D   |
    STZ $7542,x         ; $0ED720   |
    LDA $7360,x         ; $0ED723   |
    CMP #$005B          ; $0ED726   |
    BEQ CODE_0ED730     ; $0ED729   |
    LDA #$000C          ; $0ED72B   |
    BRA CODE_0ED742     ; $0ED72E   |

CODE_0ED730:
    LDA #$0017          ; $0ED730   |
    STA $7402,x         ; $0ED733   |
    LDA #$0007          ; $0ED736   |
    STA $7A36,x         ; $0ED739   |
    STZ $7A98,x         ; $0ED73C   |
    LDA #$000A          ; $0ED73F   |

CODE_0ED742:
    TAY                 ; $0ED742   |
    STY $76,x           ; $0ED743   |
    PLA                 ; $0ED745   |
    RTS                 ; $0ED746   |

; bandit sub

CODE_0ED747:
    LDA $7860,x         ; $0ED747   |
    BIT #$000C          ; $0ED74A   |
    BNE CODE_0ED752     ; $0ED74D   |

CODE_0ED74F:
    JMP CODE_0ED7F6     ; $0ED74F   |--

CODE_0ED752:
    LDA $7860,x         ; $0ED752   |
    AND #$0008          ; $0ED755   |
    DEC A               ; $0ED758   |
    EOR $7220,x         ; $0ED759   |
    BPL CODE_0ED74F     ; $0ED75C   |
    JSR CODE_0ED80D     ; $0ED75E   |
    LDY $7400,x         ; $0ED761   |
    LDA $7CD6,x         ; $0ED764   |
    STA $3012           ; $0ED767   |
    CLC                 ; $0ED76A   |
    ADC $D5BC,y         ; $0ED76B   |
    STA $3004           ; $0ED76E   |
    LDA $7CD8,x         ; $0ED771   |
    SEC                 ; $0ED774   |
    SBC #$0010          ; $0ED775   |
    STA $3006           ; $0ED778   |
    STA $3014           ; $0ED77B   |
    LDA #$FFF0          ; $0ED77E   |
    STA $3008           ; $0ED781   |
    LDA #$0005          ; $0ED784   |
    STA $3018           ; $0ED787   |
    STA $6058           ; $0ED78A   |
    STZ $301C           ; $0ED78D   |
    LDX #$0A            ; $0ED790   |
    LDA #$CE92          ; $0ED792   |
    JSL $7EDE91         ; $0ED795   | GSU init
    LDX $12             ; $0ED799   |
    LDA $301C           ; $0ED79B   |
    BPL CODE_0ED7A3     ; $0ED79E   |
    JMP CODE_0ED697     ; $0ED7A0   |

CODE_0ED7A3:
    STZ $7900,x         ; $0ED7A3   |
    CMP #$0010          ; $0ED7A6   |
    BMI CODE_0ED7AF     ; $0ED7A9   |
    SEC                 ; $0ED7AB   |
    SBC #$000F          ; $0ED7AC   |

CODE_0ED7AF:
    ASL A               ; $0ED7AF   |
    STA $7A36,x         ; $0ED7B0   |
    LDY #$0A            ; $0ED7B3   |
    LDA $7360,x         ; $0ED7B5   |
    CMP #$005B          ; $0ED7B8   |
    BEQ CODE_0ED7D5     ; $0ED7BB   |
    LDA $7902,x         ; $0ED7BD   |
    BEQ CODE_0ED7D3     ; $0ED7C0   |
    LDY #$08            ; $0ED7C2   |
    STY $76,x           ; $0ED7C4   |
    LDA #$0009          ; $0ED7C6   |
    STA $7402,x         ; $0ED7C9   |
    LDA #$0002          ; $0ED7CC   |
    STA $16,x           ; $0ED7CF   |
    PLA                 ; $0ED7D1   |
    RTS                 ; $0ED7D2   |


CODE_0ED7D3:
    LDY #$0C            ; $0ED7D3   |

CODE_0ED7D5:
    STY $76,x           ; $0ED7D5   |
    LDA #$0004          ; $0ED7D7   |
    STA $7402,x         ; $0ED7DA   |
    LDA #$0004          ; $0ED7DD   |
    STA $7A98,x         ; $0ED7E0   |
    LDY $7A36,x         ; $0ED7E3   |
    LDA $D5AE,y         ; $0ED7E6   |
    STA $7222,x         ; $0ED7E9   |
    LDA #$0007          ; $0ED7EC   |
    STA $7A36,x         ; $0ED7EF   |
    STZ $7542,x         ; $0ED7F2   |
    PLA                 ; $0ED7F5   |

CODE_0ED7F6:
    RTS                 ; $0ED7F6   |

; bandit sub

CODE_0ED7F7:
    LDA $7860,x         ; $0ED7F7   |
    BIT #$000C          ; $0ED7FA   |
    BEQ CODE_0ED808     ; $0ED7FD   |
    AND #$0008          ; $0ED7FF   |
    DEC A               ; $0ED802   |
    EOR $7220,x         ; $0ED803   |
    BMI CODE_0ED80D     ; $0ED806   |

CODE_0ED808:
    RTS                 ; $0ED808   |

DATA_0ED809:         dw $000E
DATA_0ED80B:         dw $0002

CODE_0ED80D:
    LDA #$000E          ; $0ED80D   |
    CMP $70E2,x         ; $0ED810   |
    BMI CODE_0ED819     ; $0ED813   |
    STA $70E2,x         ; $0ED815   |
    RTS                 ; $0ED818   |

CODE_0ED819:
    LDY #$00            ; $0ED819   |
    LDA $7220,x         ; $0ED81B   |
    BNE CODE_0ED82C     ; $0ED81E   |
    LDA $7860,x         ; $0ED820   |
    BEQ CODE_0ED83C     ; $0ED823   |
    AND #$0008          ; $0ED825   |
    BNE CODE_0ED830     ; $0ED828   |
    BRA CODE_0ED82E     ; $0ED82A   |

CODE_0ED82C:
    BMI CODE_0ED830     ; $0ED82C   |

CODE_0ED82E:
    INY                 ; $0ED82E   |
    INY                 ; $0ED82F   |

CODE_0ED830:
    LDA $70E2,x         ; $0ED830   |
    AND #$FFF0          ; $0ED833   |
    ORA $D809,y         ; $0ED836   |
    STA $70E2,x         ; $0ED839   |

CODE_0ED83C:
    RTS                 ; $0ED83C   |

.headbop_bandit
    JSR CODE_0ECCC7     ; $0ED83D   |
    JMP CODE_0E039F     ; $0ED840   |

    TXY                 ; $0ED844   |
    BRA CODE_0ED88C     ; $0ED845   |

.init_coin_bandit
    JSL $03D406         ; $0ED847   |
    LDX $12             ; $0ED84B   |
    LDA #$0115          ; $0ED84D   |
    JSL $03A364         ; $0ED850   |
    BCS CODE_0ED85A     ; $0ED854   |
    JMP CODE_0E03A3     ; $0ED856   |

CODE_0ED85A:
    LDA $70E2,x         ; $0ED85A   |
    STA $70E2,y         ; $0ED85D   |
    LDA $7182,x         ; $0ED860   |
    SEC                 ; $0ED863   |
    SBC #$0010          ; $0ED864   |
    STA $7182,y         ; $0ED867   |
    LDA #$FFFF          ; $0ED86A   |
    STA $7A96,y         ; $0ED86D   |
    STA $7A98,y         ; $0ED870   |
    STA $7AF6,y         ; $0ED873   |
    INC A               ; $0ED876   |
    STA $7542,y         ; $0ED877   |
    LDA #$0022          ; $0ED87A   |
    STA $7042,y         ; $0ED87D   |
    LDA #$0800          ; $0ED880   |
    STA $7040,y         ; $0ED883   |
    STY $18,x           ; $0ED886   |
    TXA                 ; $0ED888   |
    STA $7900,y         ; $0ED889   |

CODE_0ED88C:
    LDA $7182,x         ; $0ED88C   |
    ASL A               ; $0ED88F   |
    ASL A               ; $0ED890   |
    ASL A               ; $0ED891   |
    ASL A               ; $0ED892   |
    AND #$FF00          ; $0ED893   |
    ORA #$8000          ; $0ED896   |
    STA $00             ; $0ED899   |
    LDA $70E2,x         ; $0ED89B   |
    LSR A               ; $0ED89E   |
    LSR A               ; $0ED89F   |
    LSR A               ; $0ED8A0   |
    LSR A               ; $0ED8A1   |
    AND #$00FF          ; $0ED8A2   |
    ORA $00             ; $0ED8A5   |
    STA $7902,y         ; $0ED8A7   |
    RTL                 ; $0ED8AA   |

DATA_0ED8AB:         dw $CD8A
DATA_0ED8AD:         dw $CE01
DATA_0ED8AF:         dw $CEB1
DATA_0ED8B1:         dw $D1D0
DATA_0ED8B3:         dw $DA32
DATA_0ED8B5:         dw $DA7C
DATA_0ED8B7:         dw $DACD

.main_coin_bandit
    LDA $6F00,x         ; $0ED8B9   |
    CMP #$0010          ; $0ED8BC   |
    BNE CODE_0ED8D9     ; $0ED8BF   |
    JSR CODE_0ED956     ; $0ED8C1   |
    JSL $03A2C7         ; $0ED8C4   |
    BCC CODE_0ED8E8     ; $0ED8C8   |
    LDY $18,x           ; $0ED8CA   |
    BMI CODE_0ED8D3     ; $0ED8CC   |
    TYX                 ; $0ED8CE   |
    JSL $03A31E         ; $0ED8CF   |

CODE_0ED8D3:
    LDX $12             ; $0ED8D3   |
    JMP CODE_0E03A3     ; $0ED8D5   |

CODE_0ED8D9:
    CMP #$0008          ; $0ED8D9   |
    BNE CODE_0ED8E5     ; $0ED8DC   |
    JSR CODE_0ED9C2     ; $0ED8DE   |
    JSR CODE_0ECBAE     ; $0ED8E1   |
    RTL                 ; $0ED8E4   |

CODE_0ED8E5:
    JSR CODE_0ED9C2     ; $0ED8E5   |

CODE_0ED8E8:
    JSL $03AF23         ; $0ED8E8   |
    LDA #$0040          ; $0ED8EC   |
    STA $7542,x         ; $0ED8EF   |
    TXY                 ; $0ED8F2   |
    LDA $76,x           ; $0ED8F3   |
    TAX                 ; $0ED8F5   |
    JSR ($D8AB,x)       ; $0ED8F6   |

    LDY $18,x           ; $0ED8F9   |
    BMI CODE_0ED934     ; $0ED8FB   |
    LDA $6F00,y         ; $0ED8FD   |
    CMP #$0010          ; $0ED900   |
    BNE CODE_0ED913     ; $0ED903   |
    LDA $7360,y         ; $0ED905   |
    CMP #$0115          ; $0ED908   |
    BNE CODE_0ED913     ; $0ED90B   |
    TXA                 ; $0ED90D   |
    CMP $7900,y         ; $0ED90E   |
    BEQ CODE_0ED919     ; $0ED911   |

CODE_0ED913:
    LDA #$FFFF          ; $0ED913   |
    STA $18,x           ; $0ED916   |
    RTL                 ; $0ED918   |

CODE_0ED919:
    LDA $70E2,x         ; $0ED919   |
    STA $70E2,y         ; $0ED91C   |
    LDY $7402,x         ; $0ED91F   |
    LDA $D935,y         ; $0ED922   |
    AND #$00FF          ; $0ED925   |
    ORA #$FF00          ; $0ED928   |
    CLC                 ; $0ED92B   |
    ADC $7182,x         ; $0ED92C   |
    LDY $18,x           ; $0ED92F   |
    STA $7182,y         ; $0ED931   |

CODE_0ED934:
    RTL                 ; $0ED934   |

DATA_0ED935:         db $E5, $E6, $E8, $E9, $EA, $E9, $E8, $E7
DATA_0ED93D:         db $E5, $E6, $E6, $E6, $E7, $E7, $E7, $E7
DATA_0ED945:         db $E7, $E7, $ED, $EC, $EB, $EA, $EA, $E2
DATA_0ED94D:         db $E3, $EC, $EC, $EC, $EC, $EA, $E6, $E6
DATA_0ED955:         db $E6

CODE_0ED956:
    LDY $7D36,x         ; $0ED956   |
    BMI CODE_0ED979     ; $0ED959   |
    LDY $7D36,x         ; $0ED95B   |
    LDA $6EFF,y         ; $0ED95E   |
    CMP #$0010          ; $0ED961   |
    BNE CODE_0ED96E     ; $0ED964   |
    LDA $7D37,y         ; $0ED966   |
    BEQ CODE_0ED96E     ; $0ED969   |
    JMP CODE_0EDA0F     ; $0ED96B   |

CODE_0ED96E:
    PLA                 ; $0ED96E   |
    STA $00             ; $0ED96F   |
    JSL $03A5B7         ; $0ED971   |
    LDA $00             ; $0ED975   |
    PHA                 ; $0ED977   |

CODE_0ED978:
    RTS                 ; $0ED978   |

CODE_0ED979:
    LDA $7E04           ; $0ED979   |
    BNE CODE_0ED9B6     ; $0ED97C   |
    LDY $60AB           ; $0ED97E   |
    BMI CODE_0ED978     ; $0ED981   |
    LDA $7C18,x         ; $0ED983   |
    SEC                 ; $0ED986   |
    SBC $6122           ; $0ED987   |
    SEC                 ; $0ED98A   |
    SBC $7BB8,x         ; $0ED98B   |
    CMP #$FFF8          ; $0ED98E   |
    BCC CODE_0ED978     ; $0ED991   |
    LDA $60FC           ; $0ED993   |
    AND #$0018          ; $0ED996   |
    BNE CODE_0ED978     ; $0ED999   |
    LDA #$FA00          ; $0ED99B   |
    STA $60AA           ; $0ED99E   |
    LDA #$0006          ; $0ED9A1   |
    STA $60C0           ; $0ED9A4   |
    LDY $60D4           ; $0ED9A7   |
    BNE CODE_0ED9B6     ; $0ED9AA   |
    JSR CODE_0ED9C2     ; $0ED9AC   |
    INC $79,x           ; $0ED9AF   |
    JSR CODE_0ECBDB     ; $0ED9B1   |
    PLA                 ; $0ED9B4   |
    RTL                 ; $0ED9B5   |

CODE_0ED9B6:
    JSR CODE_0ECB73     ; $0ED9B6   |
    PLA                 ; $0ED9B9   |
    JMP CODE_0E03B2     ; $0ED9BA   |

DATA_0ED9BE:         dw $FE00, $0200

CODE_0ED9C2:
    LDY $7400,x         ; $0ED9C2   |
    LDA $D9BE,y         ; $0ED9C5   |
    LDY $18,x           ; $0ED9C8   |
    BMI CODE_0ED9F5     ; $0ED9CA   |
    STA $7220,y         ; $0ED9CC   |
    LDA #$FD00          ; $0ED9CF   |
    STA $7222,y         ; $0ED9D2   |
    LDA #$0100          ; $0ED9D5   |
    STA $7A96,y         ; $0ED9D8   |
    LDA #$0140          ; $0ED9DB   |
    STA $7A98,y         ; $0ED9DE   |
    LDA #$0020          ; $0ED9E1   |
    STA $7AF6,y         ; $0ED9E4   |
    ASL A               ; $0ED9E7   |
    STA $7542,y         ; $0ED9E8   |
    SEP #$20            ; $0ED9EB   |
    LDA $74A0,x         ; $0ED9ED   |
    STA $74A0,y         ; $0ED9F0   |
    REP #$20            ; $0ED9F3   |

CODE_0ED9F5:
    LDA $7042,x         ; $0ED9F5   |
    PHA                 ; $0ED9F8   |
    LDA #$0020          ; $0ED9F9   |
    TXY                 ; $0ED9FC   |
    JSL $03A377         ; $0ED9FD   |
    PLA                 ; $0EDA01   |
    STA $7042,x         ; $0EDA02   |
    SEP #$20            ; $0EDA05   |
    LDA #$FF            ; $0EDA07   |
    STA $74A0,x         ; $0EDA09   |
    REP #$20            ; $0EDA0C   |
    RTS                 ; $0EDA0E   |

CODE_0EDA0F:
    LDY $7D36,x         ; $0EDA0F   |
    DEY                 ; $0EDA12   |
    TYX                 ; $0EDA13   |
    JSL $03B24B         ; $0EDA14   |
    JSR CODE_0ED9C2     ; $0EDA18   |
    INC $78,x           ; $0EDA1B   |
    LDY $7D36,x         ; $0EDA1D   |
    LDA $7CD5,y         ; $0EDA20   |
    LDY #$00            ; $0EDA23   |
    SEC                 ; $0EDA25   |
    SBC $7CD6,x         ; $0EDA26   |
    BMI CODE_0EDA2D     ; $0EDA29   |
    INY                 ; $0EDA2B   |
    INY                 ; $0EDA2C   |

CODE_0EDA2D:
    JSR CODE_0ECBDE     ; $0EDA2D   |
    PLA                 ; $0EDA30   |
    RTL                 ; $0EDA31   |

    TYX                 ; $0EDA32   |
    LDA $16,x           ; $0EDA33   |
    BPL CODE_0EDA3E     ; $0EDA35   |
    JSR CODE_0ED7F7     ; $0EDA37   |
    STZ $16,x           ; $0EDA3A   |
    BRA CODE_0EDA41     ; $0EDA3C   |

CODE_0EDA3E:
    JSR CODE_0ED640     ; $0EDA3E   |

CODE_0EDA41:
    LDA #$000B          ; $0EDA41   |
    STA $7540,x         ; $0EDA44   |
    LDY $79,x           ; $0EDA47   |
    TYA                 ; $0EDA49   |
    ASL A               ; $0EDA4A   |
    ASL A               ; $0EDA4B   |
    CLC                 ; $0EDA4C   |
    ADC $7400,x         ; $0EDA4D   |
    TAY                 ; $0EDA50   |
    LDA $CD7E,y         ; $0EDA51   |
    STA $75E0,x         ; $0EDA54   |
    LDA $7402,x         ; $0EDA57   |
    EOR #$0001          ; $0EDA5A   |
    STA $7402,x         ; $0EDA5D   |
    LDA $7860,x         ; $0EDA60   |
    AND #$000C          ; $0EDA63   |
    BEQ CODE_0EDA7B     ; $0EDA66   |
    LDA #$0017          ; $0EDA68   |
    STA $7402,x         ; $0EDA6B   |
    LDA #$0007          ; $0EDA6E   |
    STA $7A36,x         ; $0EDA71   |
    STZ $7A98,x         ; $0EDA74   |
    LDY #$0A            ; $0EDA77   |
    STY $76,x           ; $0EDA79   |

CODE_0EDA7B:
    RTS                 ; $0EDA7B   |

    TYX                 ; $0EDA7C   |
    JSR CODE_0ED7F7     ; $0EDA7D   |
    LDA $7222,x         ; $0EDA80   |
    BMI CODE_0EDACC     ; $0EDA83   |
    LDA $7860,x         ; $0EDA85   |
    AND #$0001          ; $0EDA88   |
    BNE CODE_0EDA95     ; $0EDA8B   |
    LDA #$0018          ; $0EDA8D   |
    STA $7402,x         ; $0EDA90   |
    BRA CODE_0EDACC     ; $0EDA93   |

CODE_0EDA95:
    LDA $72C2,x         ; $0EDA95   |
    CMP #$0003          ; $0EDA98   |
    BMI CODE_0EDAAA     ; $0EDA9B   |
    STZ $7220,x         ; $0EDA9D   |
    LDA $7A98,x         ; $0EDAA0   |
    BNE CODE_0EDACC     ; $0EDAA3   |
    DEC $7A36,x         ; $0EDAA5   |
    BPL CODE_0EDAB7     ; $0EDAA8   |

CODE_0EDAAA:
    STZ $7402,x         ; $0EDAAA   |
    LDY #$08            ; $0EDAAD   |
    STY $76,x           ; $0EDAAF   |
    LDA #$FFFF          ; $0EDAB1   |
    STA $16,x           ; $0EDAB4   |
    RTS                 ; $0EDAB6   |

CODE_0EDAB7:
    LDY $7A36,x         ; $0EDAB7   |
    LDA $CEA3,y         ; $0EDABA   |
    AND #$00FF          ; $0EDABD   |
    STA $7A98,x         ; $0EDAC0   |
    LDA $CEAA,y         ; $0EDAC3   |
    AND #$00FF          ; $0EDAC6   |
    STA $7402,x         ; $0EDAC9   |

CODE_0EDACC:
    RTS                 ; $0EDACC   |

    TYX                 ; $0EDACD   |
    LDA $7A98,x         ; $0EDACE   |
    BNE CODE_0EDAE2     ; $0EDAD1   |
    LDA #$0002          ; $0EDAD3   |
    STA $7A98,x         ; $0EDAD6   |
    LDA $7402,x         ; $0EDAD9   |
    EOR #$0001          ; $0EDADC   |
    STA $7402,x         ; $0EDADF   |

CODE_0EDAE2:
    LDA $7AF6,x         ; $0EDAE2   |
    BNE CODE_0EDAF1     ; $0EDAE5   |
    STZ $7402,x         ; $0EDAE7   |
    STZ $7A36,x         ; $0EDAEA   |
    LDY #$08            ; $0EDAED   |
    STY $76,x           ; $0EDAEF   |

CODE_0EDAF1:
    JSR CODE_0ED640     ; $0EDAF1   |
    LDA $7A96,x         ; $0EDAF4   |
    BNE CODE_0EDACC     ; $0EDAF7   |
    JMP CODE_0ED34B     ; $0EDAF9   |

.init_toadie 								 ; both pink and green toadies
    LDA #$0000          ; $0EDAFC   |
    STA $78,x           ; $0EDAFF   |
    STZ $7902,x         ; $0EDB01   |
    LDA $7360,x         ; $0EDB04   |
    CMP #$0058          ; $0EDB07   |
    BEQ CODE_0EDB33     ; $0EDB0A   |
    LDA $7900,x         ; $0EDB0C   |
    BEQ CODE_0EDB19     ; $0EDB0F   |
    JSR CODE_0EDE60     ; $0EDB11   |
    LDY #$05            ; $0EDB14   |
    STY $76,x           ; $0EDB16   |
    RTL                 ; $0EDB18   |

CODE_0EDB19:
    LDA $7182,x         ; $0EDB19   |
    LSR A               ; $0EDB1C   |
    LSR A               ; $0EDB1D   |
    LSR A               ; $0EDB1E   |
    LSR A               ; $0EDB1F   |
    XBA                 ; $0EDB20   |
    STA $00             ; $0EDB21   |
    LDA $70E2,x         ; $0EDB23   |
    LSR A               ; $0EDB26   |
    LSR A               ; $0EDB27   |
    LSR A               ; $0EDB28   |
    LSR A               ; $0EDB29   |
    ORA $00             ; $0EDB2A   |
    STA $7900,x         ; $0EDB2C   |
    LDY #$02            ; $0EDB2F   |
    STY $76,x           ; $0EDB31   |

CODE_0EDB33:
    RTL                 ; $0EDB33   |

DATA_0EDB34:         dw $DC86
DATA_0EDB36:         dw $DD6F
DATA_0EDB38:         dw $DE44
DATA_0EDB3A:         dw $DE79
DATA_0EDB3C:         dw $DF03
DATA_0EDB3E:         dw $DFBD

.main_toadies 								 ; both pink and green toadies
    LDA $6F00,x         ; $0EDB40   |
    CMP #$0010          ; $0EDB43   |
    BNE CODE_0EDBBB     ; $0EDB46   |
    LDA $7D38,x         ; $0EDB48   |
    BEQ CODE_0EDB5B     ; $0EDB4B   |
    LDA $7360,x         ; $0EDB4D   |
    CMP #$0058          ; $0EDB50   |
    BEQ CODE_0EDB5B     ; $0EDB53   |
    LDA #$0002          ; $0EDB55   |
    STA $74A2,x         ; $0EDB58   |

CODE_0EDB5B:
    LDA $70E2,x         ; $0EDB5B   |
    SEC                 ; $0EDB5E   |
    SBC #$0008          ; $0EDB5F   |
    CMP #$0FF0          ; $0EDB62   |
    BCC CODE_0EDB76     ; $0EDB65   |
    LDA $70E2,x         ; $0EDB67   |
    SEC                 ; $0EDB6A   |
    SBC $72C0,x         ; $0EDB6B   |
    STA $70E2,x         ; $0EDB6E   |
    JSR CODE_0ECCF9     ; $0EDB71   |
    BRA CODE_0EDBBE     ; $0EDB74   |

CODE_0EDB76:
    JSL $03A2C7         ; $0EDB76   |
    BCC CODE_0EDBBE     ; $0EDB7A   |
    LDY $76,x           ; $0EDB7C   |
    CPY #$F001          ; $0EDB7E   |
    BIT $04C0,x         ; $0EDB81   |
    BEQ CODE_0EDBBE     ; $0EDB84   |
    STZ $7220,x         ; $0EDB86   |
    STZ $7540,x         ; $0EDB89   |
    STZ $7222,x         ; $0EDB8C   |
    STZ $7542,x         ; $0EDB8F   |
    LDY $7902,x         ; $0EDB92   |
    BEQ CODE_0EDBB7     ; $0EDB95   |
    LDA $6F00           ; $0EDB97   |
    CMP #$0010          ; $0EDB9A   |
    BEQ CODE_0EDBA3     ; $0EDB9D   |
    STZ $7902,x         ; $0EDB9F   |
    RTL                 ; $0EDBA2   |

CODE_0EDBA3:
    LDA $70E2,x         ; $0EDBA3   |
    STA $70E2           ; $0EDBA6   |
    LDA $7182,x         ; $0EDBA9   |
    SEC                 ; $0EDBAC   |
    SBC #$000E          ; $0EDBAD   |
    STA $7182           ; $0EDBB0   |
    STZ $7222           ; $0EDBB3   |
    RTL                 ; $0EDBB6   |

CODE_0EDBB7:
    JMP CODE_0E03A3     ; $0EDBB7   |

CODE_0EDBBB:
    JSR CODE_0EDC67     ; $0EDBBB   |

CODE_0EDBBE:
    LDY $76,x           ; $0EDBBE   |
    CPY #$02            ; $0EDBC0   |
    BEQ CODE_0EDC32     ; $0EDBC2   |
    LDY $7D36,x         ; $0EDBC4   |
    BPL CODE_0EDC32     ; $0EDBC7   |
    LDA $7C18,x         ; $0EDBC9   |
    SEC                 ; $0EDBCC   |
    SBC $6122           ; $0EDBCD   |
    SEC                 ; $0EDBD0   |
    SBC $7BB8,x         ; $0EDBD1   |
    CMP #$FFF6          ; $0EDBD4   |
    BCC CODE_0EDC32     ; $0EDBD7   |
    LDY $60AB           ; $0EDBD9   |
    BMI CODE_0EDC32     ; $0EDBDC   |
    LDY $60C0           ; $0EDBDE   |
    BEQ CODE_0EDC32     ; $0EDBE1   |
    LDA #$0020          ; $0EDBE3   |
    STA $7542,x         ; $0EDBE6   |
    LDA #$0200          ; $0EDBE9   |
    STA $75E2,x         ; $0EDBEC   |
    LDA $7042,x         ; $0EDBEF   |
    ORA #$0080          ; $0EDBF2   |
    STA $7042,x         ; $0EDBF5   |
    LDA #$EE60          ; $0EDBF8   |
    STA $6FA0,x         ; $0EDBFB   |
    LDA #$1000          ; $0EDBFE   |
    STA $6FA2,x         ; $0EDC01   |
    LDA #$2805          ; $0EDC04   |
    STA $7040,x         ; $0EDC07   |
    LDY #$3A            ; $0EDC0A   |
    JSL $03A0E7         ; $0EDC0C   |
    LDA #$000E          ; $0EDC10   |
    STA $6F00,x         ; $0EDC13   |
    LDA #$FC00          ; $0EDC16   |
    STA $60AA           ; $0EDC19   |
    LDA #$0006          ; $0EDC1C   |
    STA $60C0           ; $0EDC1F   |
    LDA #$8001          ; $0EDC22   |
    STA $60D2           ; $0EDC25   |
    STZ $7220,x         ; $0EDC28   |
    STZ $7222,x         ; $0EDC2B   |
    JSR CODE_0EDC67     ; $0EDC2E   |
    RTL                 ; $0EDC31   |

CODE_0EDC32:
    JSL $03AF23         ; $0EDC32   |
    TXY                 ; $0EDC36   |
    LDA $76,x           ; $0EDC37   |
    ASL A               ; $0EDC39   |
    TAX                 ; $0EDC3A   |
    JSR ($DB34,x)       ; $0EDC3B   |

    LDA $7A98,x         ; $0EDC3E   |
    BNE CODE_0EDC53     ; $0EDC41   |
    LDA #$0006          ; $0EDC43   |
    STA $7A98,x         ; $0EDC46   |
    LDA $7402,x         ; $0EDC49   |
    INC A               ; $0EDC4C   |
    AND #$0003          ; $0EDC4D   |
    STA $7402,x         ; $0EDC50   |

CODE_0EDC53:
    LDY $75E3,x         ; $0EDC53   |
    BPL CODE_0EDC66     ; $0EDC56   |
    LDA $7860,x         ; $0EDC58   |
    AND #$0001          ; $0EDC5B   |
    BEQ CODE_0EDC66     ; $0EDC5E   |
    LDA #$FFFF          ; $0EDC60   |
    STA $7222,x         ; $0EDC63   |

CODE_0EDC66:
    RTL                 ; $0EDC66   |

CODE_0EDC67:
    LDY $7902,x         ; $0EDC67   |
    BEQ CODE_0EDC73     ; $0EDC6A   |
    STZ $7902,x         ; $0EDC6C   |
    JSL $06C114         ; $0EDC6F   |

CODE_0EDC73:
    RTS                 ; $0EDC73   |

DATA_0EDC74:         dw $FF4D, $00B3, $FEF4, $010C
DATA_0EDC7C:         dw $FDE7, $0219

DATA_0EDC80:         dw $0016, $002C, $0043

    TYX                 ; $0EDC86   |
    LDA #$0005          ; $0EDC87   |
    STA $7540,x         ; $0EDC8A   |
    STA $7542,x         ; $0EDC8D   |
    LDA $7AF8,x         ; $0EDC90   |
    BEQ CODE_0EDCBE     ; $0EDC93   |

CODE_0EDC95:
    LDA $7A96,x         ; $0EDC95   |
    BNE CODE_0EDCBD     ; $0EDC98   |
    LDA #$0030          ; $0EDC9A   |
    STA $7A96,x         ; $0EDC9D   |
    LDA $10             ; $0EDCA0   |
    AND #$0002          ; $0EDCA2   |
    TAY                 ; $0EDCA5   |
    LDA $DC74,y         ; $0EDCA6   |
    STA $75E0,x         ; $0EDCA9   |
    TYA                 ; $0EDCAC   |
    STA $7400,x         ; $0EDCAD   |
    LDA $10             ; $0EDCB0   |
    XBA                 ; $0EDCB2   |
    AND #$0002          ; $0EDCB3   |
    TAY                 ; $0EDCB6   |
    LDA $DC74,y         ; $0EDCB7   |
    STA $75E2,x         ; $0EDCBA   |

CODE_0EDCBD:
    RTS                 ; $0EDCBD   |

CODE_0EDCBE:
    LDY $7D36,x         ; $0EDCBE   |
    BPL CODE_0EDCD0     ; $0EDCC1   |
    LDY $61B3           ; $0EDCC3   |
    BPL CODE_0EDCF2     ; $0EDCC6   |
    JSR CODE_0EDD2E     ; $0EDCC8   |
    JSR CODE_0ED3CB     ; $0EDCCB   |
    BRA CODE_0EDCE0     ; $0EDCCE   |

CODE_0EDCD0:
    DEY                 ; $0EDCD0   |
    BNE CODE_0EDCF2     ; $0EDCD1   |
    LDA $61B2           ; $0EDCD3   |
    AND #$6000          ; $0EDCD6   |
    BNE CODE_0EDC95     ; $0EDCD9   |
    JSR CODE_0ED39D     ; $0EDCDB   |
    BCS CODE_0EDCF2     ; $0EDCDE   |

CODE_0EDCE0:
    INC $76,x           ; $0EDCE0   |
    SEP #$20            ; $0EDCE2   |
    LDA $00             ; $0EDCE4   |
    STA $18,x           ; $0EDCE6   |
    LDA $02             ; $0EDCE8   |
    SEC                 ; $0EDCEA   |
    SBC #$0E            ; $0EDCEB   |
    STA $19,x           ; $0EDCED   |
    REP #$20            ; $0EDCEF   |
    RTS                 ; $0EDCF1   |

CODE_0EDCF2:
    LDA $7A96,x         ; $0EDCF2   |
    BNE CODE_0EDD25     ; $0EDCF5   |
    LDA #$0030          ; $0EDCF7   |
    STA $7A96,x         ; $0EDCFA   |
    LDY #$AD00          ; $0EDCFD   |
    SEP #$70            ; $0EDD00   |
    CMP $70E2,x         ; $0EDD02   |
    BMI CODE_0EDD09     ; $0EDD05   |
    INY                 ; $0EDD07   |
    INY                 ; $0EDD08   |

CODE_0EDD09:
    LDA $DC74,y         ; $0EDD09   |
    STA $75E0,x         ; $0EDD0C   |
    TYA                 ; $0EDD0F   |
    STA $7400,x         ; $0EDD10   |
    LDY #$00            ; $0EDD13   |
    LDA $7182           ; $0EDD15   |
    CMP $7182,x         ; $0EDD18   |
    BMI CODE_0EDD1F     ; $0EDD1B   |
    INY                 ; $0EDD1D   |
    INY                 ; $0EDD1E   |

CODE_0EDD1F:
    LDA $DC74,y         ; $0EDD1F   |
    STA $75E2,x         ; $0EDD22   |

CODE_0EDD25:
    RTS                 ; $0EDD25   |

DATA_0EDD26:         dw $000F, $FFF1

DATA_0EDD2A:         dw $0017, $FFE9

CODE_0EDD2E:
    LDY #$00            ; $0EDD2E   |
    LDA $70E2           ; $0EDD30   |
    SEC                 ; $0EDD33   |
    SBC $70E2,x         ; $0EDD34   |
    CLC                 ; $0EDD37   |
    ADC #$0010          ; $0EDD38   |
    CMP #$0020          ; $0EDD3B   |
    BCC CODE_0EDD4E     ; $0EDD3E   |
    BPL CODE_0EDD44     ; $0EDD40   |
    INY                 ; $0EDD42   |
    INY                 ; $0EDD43   |

CODE_0EDD44:
    LDA $DD26,y         ; $0EDD44   |
    CLC                 ; $0EDD47   |
    ADC $70E2,x         ; $0EDD48   |
    STA $70E2           ; $0EDD4B   |

CODE_0EDD4E:
    LDY #$00            ; $0EDD4E   |
    LDA $7182           ; $0EDD50   |
    SEC                 ; $0EDD53   |
    SBC $7182,x         ; $0EDD54   |
    CLC                 ; $0EDD57   |
    ADC #$0018          ; $0EDD58   |
    CMP #$0030          ; $0EDD5B   |
    BCC CODE_0EDD6E     ; $0EDD5E   |
    BPL CODE_0EDD64     ; $0EDD60   |
    INY                 ; $0EDD62   |
    INY                 ; $0EDD63   |

CODE_0EDD64:
    LDA $DD2A,y         ; $0EDD64   |
    CLC                 ; $0EDD67   |
    ADC $7182,x         ; $0EDD68   |
    STA $7182           ; $0EDD6B   |

CODE_0EDD6E:
    RTS                 ; $0EDD6E   |

    TYX                 ; $0EDD6F   |
    LDA $60A8           ; $0EDD70   |
    BPL CODE_0EDD79     ; $0EDD73   |
    EOR #$FFFF          ; $0EDD75   |
    INC A               ; $0EDD78   |

CODE_0EDD79:
    CLC                 ; $0EDD79   |
    ADC #$0080          ; $0EDD7A   |
    AND #$0200          ; $0EDD7D   |
    ASL A               ; $0EDD80   |
    XBA                 ; $0EDD81   |
    STA $00             ; $0EDD82   |
    LDY $77C2,x         ; $0EDD84   |
    TYA                 ; $0EDD87   |
    CLC                 ; $0EDD88   |
    ADC $00             ; $0EDD89   |
    EOR #$0002          ; $0EDD8B   |
    TAY                 ; $0EDD8E   |
    LDA $DC74,y         ; $0EDD8F   |
    ASL A               ; $0EDD92   |
    STA $75E0,x         ; $0EDD93   |
    PHY                 ; $0EDD96   |
    TYA                 ; $0EDD97   |
    AND #$0004          ; $0EDD98   |
    LSR A               ; $0EDD9B   |
    TAY                 ; $0EDD9C   |
    LDA $DC80,y         ; $0EDD9D   |
    ASL A               ; $0EDDA0   |
    STA $7540,x         ; $0EDDA1   |
    PLY                 ; $0EDDA4   |
    TYA                 ; $0EDDA5   |
    EOR #$0002          ; $0EDDA6   |
    AND #$0002          ; $0EDDA9   |
    STA $7400,x         ; $0EDDAC   |
    STZ $00             ; $0EDDAF   |
    LDA $7C18,x         ; $0EDDB1   |
    SEC                 ; $0EDDB4   |
    SBC #$0010          ; $0EDDB5   |
    BPL CODE_0EDDBE     ; $0EDDB8   |
    INC $00             ; $0EDDBA   |
    INC $00             ; $0EDDBC   |

CODE_0EDDBE:
    LDA $60AA           ; $0EDDBE   |
    BPL CODE_0EDDC7     ; $0EDDC1   |
    EOR #$FFFF          ; $0EDDC3   |
    INC A               ; $0EDDC6   |

CODE_0EDDC7:
    CLC                 ; $0EDDC7   |
    ADC #$0080          ; $0EDDC8   |
    AND #$0200          ; $0EDDCB   |
    ASL A               ; $0EDDCE   |
    XBA                 ; $0EDDCF   |
    CLC                 ; $0EDDD0   |
    ADC $00             ; $0EDDD1   |
    EOR #$0002          ; $0EDDD3   |
    TAY                 ; $0EDDD6   |
    LDA $DC74,y         ; $0EDDD7   |
    ASL A               ; $0EDDDA   |
    STA $75E2,x         ; $0EDDDB   |
    TYA                 ; $0EDDDE   |
    AND #$0004          ; $0EDDDF   |
    LSR A               ; $0EDDE2   |
    TAY                 ; $0EDDE3   |
    LDA $DC80,y         ; $0EDDE4   |
    ASL A               ; $0EDDE7   |
    STA $7542,x         ; $0EDDE8   |
    LDA $7680,x         ; $0EDDEB   |
    SEC                 ; $0EDDEE   |
    SBC #$0020          ; $0EDDEF   |
    CMP #$00C0          ; $0EDDF2   |
    BCC CODE_0EDE06     ; $0EDDF5   |
    EOR $75E0,x         ; $0EDDF7   |
    BMI CODE_0EDE06     ; $0EDDFA   |
    LDA $75E0,x         ; $0EDDFC   |
    EOR #$FFFF          ; $0EDDFF   |
    INC A               ; $0EDE02   |
    STA $75E0,x         ; $0EDE03   |

CODE_0EDE06:
    LDA $7C18,x         ; $0EDE06   |
    BPL CODE_0EDE17     ; $0EDE09   |
    LDA $7682,x         ; $0EDE0B   |
    SEC                 ; $0EDE0E   |
    SBC #$0030          ; $0EDE0F   |
    CMP #$00A0          ; $0EDE12   |
    BCC CODE_0EDE26     ; $0EDE15   |

CODE_0EDE17:
    EOR $75E2,x         ; $0EDE17   |
    BMI CODE_0EDE26     ; $0EDE1A   |
    LDA $75E2,x         ; $0EDE1C   |
    EOR #$FFFF          ; $0EDE1F   |
    INC A               ; $0EDE22   |
    STA $75E2,x         ; $0EDE23   |

CODE_0EDE26:
    JSR CODE_0EDE2F     ; $0EDE26   |
    LDA #$FFF2          ; $0EDE29   |
    JMP CODE_0ED2EF     ; $0EDE2C   |

CODE_0EDE2F:
    LDA $6F00           ; $0EDE2F   |
    BEQ CODE_0EDE3E     ; $0EDE32   |
    CMP #$0008          ; $0EDE34   |
    BEQ CODE_0EDE3E     ; $0EDE37   |
    LDA $7902,x         ; $0EDE39   |
    BNE CODE_0EDE43     ; $0EDE3C   |

CODE_0EDE3E:
    JSL $06C114         ; $0EDE3E   |
    PLA                 ; $0EDE42   |

CODE_0EDE43:
    RTS                 ; $0EDE43   |

    TYX                 ; $0EDE44   |
    LDA $61B2           ; $0EDE45   |
    BNE CODE_0EDE78     ; $0EDE48   |
    LDA $6094           ; $0EDE4A   |
    CLC                 ; $0EDE4D   |
    ADC #$0080          ; $0EDE4E   |
    STA $70E2,x         ; $0EDE51   |
    LDA $609C           ; $0EDE54   |
    SEC                 ; $0EDE57   |
    SBC #$0018          ; $0EDE58   |
    STA $7182,x         ; $0EDE5B   |
    INC $76,x           ; $0EDE5E   |

CODE_0EDE60:
    LDA #$EE00          ; $0EDE60   |
    STA $6FA0,x         ; $0EDE63   |
    LDA #$0881          ; $0EDE66   |
    STA $6FA2,x         ; $0EDE69   |
    LDA #$2801          ; $0EDE6C   |
    STA $7040,x         ; $0EDE6F   |
    LDA #$0002          ; $0EDE72   |
    STA $74A2,x         ; $0EDE75   |

CODE_0EDE78:
    RTS                 ; $0EDE78   |

    TYX                 ; $0EDE79   |
    LDA $61B2           ; $0EDE7A   |
    BEQ CODE_0EDE84     ; $0EDE7D   |
    LDY #$05            ; $0EDE7F   |
    STY $76,x           ; $0EDE81   |
    RTS                 ; $0EDE83   |

CODE_0EDE84:
    LDA #$0002          ; $0EDE84   |
    STA $7400,x         ; $0EDE87   |
    LDA $7CD6           ; $0EDE8A   |
    SEC                 ; $0EDE8D   |
    SBC $7CD6,x         ; $0EDE8E   |
    PHP                 ; $0EDE91   |
    BPL CODE_0EDE98     ; $0EDE92   |
    EOR #$FFFF          ; $0EDE94   |
    INC A               ; $0EDE97   |

CODE_0EDE98:
    LSR A               ; $0EDE98   |
    CMP #$0018          ; $0EDE99   |
    BMI CODE_0EDEA1     ; $0EDE9C   |
    LDA #$0018          ; $0EDE9E   |

CODE_0EDEA1:
    CLC                 ; $0EDEA1   |
    ADC #$0018          ; $0EDEA2   |
    STA $7540,x         ; $0EDEA5   |
    ASL A               ; $0EDEA8   |
    ASL A               ; $0EDEA9   |
    ASL A               ; $0EDEAA   |
    ASL A               ; $0EDEAB   |
    PLP                 ; $0EDEAC   |
    BPL CODE_0EDEB6     ; $0EDEAD   |
    EOR #$FFFF          ; $0EDEAF   |
    INC A               ; $0EDEB2   |
    STZ $7400,x         ; $0EDEB3   |

CODE_0EDEB6:
    STA $75E0,x         ; $0EDEB6   |
    LDA $7CD8           ; $0EDEB9   |
    SEC                 ; $0EDEBC   |
    SBC $7CD8,x         ; $0EDEBD   |
    PHP                 ; $0EDEC0   |
    BPL CODE_0EDEC7     ; $0EDEC1   |
    EOR #$FFFF          ; $0EDEC3   |
    INC A               ; $0EDEC6   |

CODE_0EDEC7:
    LSR A               ; $0EDEC7   |
    CMP #$0018          ; $0EDEC8   |
    BMI CODE_0EDED0     ; $0EDECB   |
    LDA #$0018          ; $0EDECD   |

CODE_0EDED0:
    CLC                 ; $0EDED0   |
    ADC #$0018          ; $0EDED1   |
    STA $7542,x         ; $0EDED4   |
    ASL A               ; $0EDED7   |
    ASL A               ; $0EDED8   |
    ASL A               ; $0EDED9   |
    ASL A               ; $0EDEDA   |
    PLP                 ; $0EDEDB   |
    BPL CODE_0EDEE2     ; $0EDEDC   |
    EOR #$FFFF          ; $0EDEDE   |
    INC A               ; $0EDEE1   |

CODE_0EDEE2:
    STA $75E2,x         ; $0EDEE2   |
    JSR CODE_0ED39D     ; $0EDEE5   |
    BCS CODE_0EDEFE     ; $0EDEE8   |
    STZ $7A36,x         ; $0EDEEA   |
    INC $76,x           ; $0EDEED   |
    SEP #$20            ; $0EDEEF   |
    LDA $00             ; $0EDEF1   |
    STA $18,x           ; $0EDEF3   |
    LDA $02             ; $0EDEF5   |
    SEC                 ; $0EDEF7   |
    SBC #$0E            ; $0EDEF8   |
    STA $19,x           ; $0EDEFA   |
    REP #$20            ; $0EDEFC   |

CODE_0EDEFE:
    RTS                 ; $0EDEFE   |

DATA_0EDEFF:         dw $FF00, $0100

    TYX                 ; $0EDF03   |
    LDY $7900,x         ; $0EDF04   |
    TYA                 ; $0EDF07   |
    ASL A               ; $0EDF08   |
    INC A               ; $0EDF09   |
    ASL A               ; $0EDF0A   |
    ASL A               ; $0EDF0B   |
    ASL A               ; $0EDF0C   |
    STA $00             ; $0EDF0D   |
    LDY $7901,x         ; $0EDF0F   |
    TYA                 ; $0EDF12   |
    ASL A               ; $0EDF13   |
    INC A               ; $0EDF14   |
    ASL A               ; $0EDF15   |
    ASL A               ; $0EDF16   |
    ASL A               ; $0EDF17   |
    STA $02             ; $0EDF18   |
    LDA $00             ; $0EDF1A   |
    SEC                 ; $0EDF1C   |
    SBC $7CD6,x         ; $0EDF1D   |
    STA $00             ; $0EDF20   |
    CLC                 ; $0EDF22   |
    ADC #$0010          ; $0EDF23   |
    CMP #$0020          ; $0EDF26   |
    BCC CODE_0EDF3A     ; $0EDF29   |
    EOR $75E0,x         ; $0EDF2B   |
    BPL CODE_0EDF3A     ; $0EDF2E   |
    LDA $75E0,x         ; $0EDF30   |
    EOR #$FFFF          ; $0EDF33   |
    INC A               ; $0EDF36   |
    STA $75E0,x         ; $0EDF37   |

CODE_0EDF3A:
    LDY $77C2,x         ; $0EDF3A   |
    TYA                 ; $0EDF3D   |
    STA $7400,x         ; $0EDF3E   |
    LDY $7A36,x         ; $0EDF41   |
    BEQ CODE_0EDF5E     ; $0EDF44   |
    LDA $7A96,x         ; $0EDF46   |
    BNE CODE_0EDF5B     ; $0EDF49   |
    LDA #$0020          ; $0EDF4B   |
    STA $7A96,x         ; $0EDF4E   |
    LDA $75E2,x         ; $0EDF51   |
    EOR #$FFFF          ; $0EDF54   |
    INC A               ; $0EDF57   |
    STA $75E2,x         ; $0EDF58   |

CODE_0EDF5B:
    JMP CODE_0EDE26     ; $0EDF5B   |

CODE_0EDF5E:
    LDA $02             ; $0EDF5E   |
    SEC                 ; $0EDF60   |
    SBC $7CD8,x         ; $0EDF61   |
    STA $02             ; $0EDF64   |
    CLC                 ; $0EDF66   |
    ADC #$0004          ; $0EDF67   |
    CMP #$0008          ; $0EDF6A   |
    BCS CODE_0EDF93     ; $0EDF6D   |
    LDA #$0020          ; $0EDF6F   |
    STA $7A96,x         ; $0EDF72   |
    LDY #$00            ; $0EDF75   |
    LDA $7222,x         ; $0EDF77   |
    BMI CODE_0EDF7E     ; $0EDF7A   |
    INY                 ; $0EDF7C   |
    INY                 ; $0EDF7D   |

CODE_0EDF7E:
    LDA #$0020          ; $0EDF7E   |
    STA $7542,x         ; $0EDF81   |
    INC $7A36,x         ; $0EDF84   |
    LDA $DEFF,y         ; $0EDF87   |
    STA $7222,x         ; $0EDF8A   |
    EOR #$FFFF          ; $0EDF8D   |
    INC A               ; $0EDF90   |
    BRA CODE_0EDFB7     ; $0EDF91   |

CODE_0EDF93:
    LDA $02             ; $0EDF93   |
    PHP                 ; $0EDF95   |
    BPL CODE_0EDF9C     ; $0EDF96   |
    EOR #$FFFF          ; $0EDF98   |
    INC A               ; $0EDF9B   |

CODE_0EDF9C:
    LSR A               ; $0EDF9C   |
    CMP #$0018          ; $0EDF9D   |
    BMI CODE_0EDFA5     ; $0EDFA0   |
    LDA #$0018          ; $0EDFA2   |

CODE_0EDFA5:
    CLC                 ; $0EDFA5   |
    ADC #$0018          ; $0EDFA6   |
    STA $7542,x         ; $0EDFA9   |
    ASL A               ; $0EDFAC   |
    ASL A               ; $0EDFAD   |
    ASL A               ; $0EDFAE   |
    ASL A               ; $0EDFAF   |
    PLP                 ; $0EDFB0   |
    BPL CODE_0EDFB7     ; $0EDFB1   |
    EOR #$FFFF          ; $0EDFB3   |
    INC A               ; $0EDFB6   |

CODE_0EDFB7:
    STA $75E2,x         ; $0EDFB7   |
    JMP CODE_0EDE26     ; $0EDFBA   |

    TYX                 ; $0EDFBD   |
    LDA $61B2           ; $0EDFBE   |
    BNE CODE_0EDFC8     ; $0EDFC1   |
    LDY #$03            ; $0EDFC3   |
    STY $76,x           ; $0EDFC5   |
    RTS                 ; $0EDFC7   |

CODE_0EDFC8:
    STZ $75E0,x         ; $0EDFC8   |
    LDA #$0004          ; $0EDFCB   |
    STA $7540,x         ; $0EDFCE   |
    LDA #$FE00          ; $0EDFD1   |
    STA $75E2,x         ; $0EDFD4   |
    LDA #$0020          ; $0EDFD7   |
    STA $7542,x         ; $0EDFDA   |
    RTS                 ; $0EDFDD   |

.init_frog_pirate
    STZ $7900,x         ; $0EDFDE   |
    SEP #$20            ; $0EDFE1   |
    LDA #$FF            ; $0EDFE3   |
    STA $7863,x         ; $0EDFE5   |
    REP #$20            ; $0EDFE8   |
    LDA $70E2,x         ; $0EDFEA   |
    AND #$0010          ; $0EDFED   |
    LSR A               ; $0EDFF0   |
    LSR A               ; $0EDFF1   |
    LSR A               ; $0EDFF2   |
    INC A               ; $0EDFF3   |
    INC A               ; $0EDFF4   |
    TAY                 ; $0EDFF5   |
    STY $77,x           ; $0EDFF6   |
    RTL                 ; $0EDFF8   |

frog_ptr:
; regular sequence
DATA_0EDFF9:         dw $E540        ; 00: close eyes, pause
DATA_0EDFFB:         dw $E65A        ; 01: opening & closing mouth
DATA_0EDFFD:         dw $E699        ; 02: one hop

; tongue sequence
DATA_0EDFFF:         dw $E774        ; 03: preparing to tongue
DATA_0EE001:         dw $E7B1        ; 04: tongue in/out
DATA_0EE003:         dw $E871        ; 05: tongue shaking/extending a bit

; baby mario
DATA_0EE005:         dw $E8A6        ; 06: steal baby mario upon tonguing
DATA_0EE007:         dw $E699        ; 07: hop one direction forever

; headbopped
DATA_0EE009:         dw $E91F        ; 08: headbopped/stunned for a bit

; water sequence
DATA_0EE00B:         dw $E986        ; 09: landed in water
DATA_0EE00D:         dw $E9A7        ; 0A: floating up
DATA_0EE00F:         dw $E9DB        ; 0B: ducking down
DATA_0EE011:         dw $EA0B        ; 0C: submerging completely

; Prince Froggy intro sequence
DATA_0EE013:         dw $EA97        ; 0D: floating in water waiting for yoshi to be in range to begin intro
DATA_0EE015:         dw $E699        ; 0E: hops up out of water
DATA_0EE017:         dw $EAEB        ; 0F: waiting on Kamek
DATA_0EE019:         dw $E774        ; 10: preparing to tongue
DATA_0EE01B:         dw $E7B1        ; 11: tongue in & out
DATA_0EE01D:         dw $EB90        ; 12: yoshi's eggs disappear
DATA_0EE01F:         dw $EBAC        ; 13: burp
DATA_0EE021:         dw $EC2C        ; 14: intro over

.main_frog_pirate
    JSR CODE_0EE112     ; $0EE023   |
    LDY $76,x           ; $0EE026   |
    CPY #$0D            ; $0EE028   |
    BPL CODE_0EE094     ; $0EE02A   |
    LDA $7900,x         ; $0EE02C   |
    BEQ CODE_0EE046     ; $0EE02F   |
    LDA $61B0           ; $0EE031   |
    ORA $0B55           ; $0EE034   |
    ORA $0398           ; $0EE037   |
    BEQ CODE_0EE04D     ; $0EE03A   |
    JSL $03B69D         ; $0EE03C   |
    JSL $03B716         ; $0EE040   |
    BRA CODE_0EE04D     ; $0EE044   |

CODE_0EE046:
    JSR CODE_0EE1B3     ; $0EE046   |
    JSL $03AF23         ; $0EE049   |

CODE_0EE04D:
    JSR CODE_0EE1D9     ; $0EE04D   |
    JSR CODE_0EE231     ; $0EE050   |
    LDY $76,x           ; $0EE053   |
    TYA                 ; $0EE055   |
    ASL A               ; $0EE056   |
    TXY                 ; $0EE057   |
    TAX                 ; $0EE058   |
    JSR ($DFF9,x)       ; $0EE059   | state table
    LDA $61B0           ; $0EE05C   |
    ORA $0B55           ; $0EE05F   |
    ORA $0398           ; $0EE062   |
    BNE CODE_0EE06D     ; $0EE065   |
    JSR CODE_0EE2C6     ; $0EE067   |
    JSR CODE_0EE4DD     ; $0EE06A   |

CODE_0EE06D:
    JSR CODE_0EE519     ; $0EE06D   |
    STZ $7540,x         ; $0EE070   |
    LDA $7860,x         ; $0EE073   |
    AND #$0001          ; $0EE076   |
    BEQ CODE_0EE093     ; $0EE079   |
    LDA #$0040          ; $0EE07B   |
    STA $7540,x         ; $0EE07E   |
    LDA $7220,x         ; $0EE081   |
    CLC                 ; $0EE084   |
    ADC #$0010          ; $0EE085   |
    CMP #$0020          ; $0EE088   |
    BCS CODE_0EE093     ; $0EE08B   |
    STZ $7220,x         ; $0EE08D   |
    STZ $7540,x         ; $0EE090   |

CODE_0EE093:
    RTL                 ; $0EE093   |

CODE_0EE094:
    CPY #$15            ; $0EE094   |
    BPL CODE_0EE0D3     ; $0EE096   |
    LDA $7900,x         ; $0EE098   |
    BEQ CODE_0EE0B0     ; $0EE09B   |
    LDA $61B0           ; $0EE09D   |
    ORA $0B55           ; $0EE0A0   |
    ORA $0398           ; $0EE0A3   |
    BEQ CODE_0EE0B0     ; $0EE0A6   |
    JSL $03B69D         ; $0EE0A8   |
    JSL $03B716         ; $0EE0AC   |

CODE_0EE0B0:
    LDY $76,x           ; $0EE0B0   |
    TYA                 ; $0EE0B2   |
    ASL A               ; $0EE0B3   |
    TXY                 ; $0EE0B4   |
    TAX                 ; $0EE0B5   |
    JSR ($DFF9,x)       ; $0EE0B6   | state table
    JSR CODE_0EEDF2     ; $0EE0B9   |
    JSR CODE_0EE519     ; $0EE0BC   |
    LDA $60BE           ; $0EE0BF   |
    CMP #$0166          ; $0EE0C2   |
    BNE CODE_0EE0D2     ; $0EE0C5   |
    LDA $7A96,x         ; $0EE0C7   |
    BNE CODE_0EE0D2     ; $0EE0CA   |
    LDA #$000C          ; $0EE0CC   |
    STA $6124           ; $0EE0CF   |

CODE_0EE0D2:
    RTL                 ; $0EE0D2   |

CODE_0EE0D3:
    JSL $03AF23         ; $0EE0D3   |
    JSR CODE_0EE1D9     ; $0EE0D7   |
    JSR CODE_0EE519     ; $0EE0DA   |
    RTL                 ; $0EE0DD   |

; sub
    LDA #$0400          ; $0EE0DE   |
    STA $75E2,x         ; $0EE0E1   |
    LDA #$0040          ; $0EE0E4   |
    STA $7542,x         ; $0EE0E7   |
    LDA #$000C          ; $0EE0EA   |
    STA $7402,x         ; $0EE0ED   |
    LDA $7042,x         ; $0EE0F0   |
    ORA #$0080          ; $0EE0F3   |
    STA $7042,x         ; $0EE0F6   |
    LDA #$4060          ; $0EE0F9   |
    STA $6FA0,x         ; $0EE0FC   |
    LDA #$8840          ; $0EE0FF   |
    STA $6FA2,x         ; $0EE102   |
    LDY #$15            ; $0EE105   |
    STY $76,x           ; $0EE107   |
    RTL                 ; $0EE109   |

DATA_0EE10A:         db $FE, $0A, $03, $05

DATA_0EE10E:         db $05, $05, $01, $01

; frog routine

CODE_0EE112:
    LDA $7362,x         ; $0EE112   |
    STA $3008           ; $0EE115   |
    BMI CODE_0EE11F     ; $0EE118   |
    LDY $74A2,x         ; $0EE11A   |
    BPL CODE_0EE120     ; $0EE11D   |

CODE_0EE11F:
    RTS                 ; $0EE11F   |

CODE_0EE120:
    LDY $79,x           ; $0EE120   |
    TYA                 ; $0EE122   |
    STA $602A           ; $0EE123   |
    STA $602C           ; $0EE126   |
    LDY $18,x           ; $0EE129   |
    BEQ CODE_0EE132     ; $0EE12B   |
    STZ $602A           ; $0EE12D   |
    BRA CODE_0EE135     ; $0EE130   |

CODE_0EE132:
    STZ $602C           ; $0EE132   |

CODE_0EE135:
    LDA $7400,x         ; $0EE135   |
    STA $3010           ; $0EE138   |
    BEQ CODE_0EE148     ; $0EE13B   |
    INY                 ; $0EE13D   |
    LDA $602A           ; $0EE13E   |
    EOR #$FFFF          ; $0EE141   |
    INC A               ; $0EE144   |
    STA $602A           ; $0EE145   |

CODE_0EE148:
    LDA $E10A,y         ; $0EE148   | table
    AND #$00FF          ; $0EE14B   |
    STA $6038           ; $0EE14E   |
    LDA $E10E,y         ; $0EE151   | table
    AND #$00FF          ; $0EE154   |
    STA $603A           ; $0EE157   |
    LDY $78,x           ; $0EE15A   |
    LDA $F2E0,y         ; $0EE15C   | table
    AND #$00FF          ; $0EE15F   |
    STA $6024           ; $0EE162   |
    TYA                 ; $0EE165   |
    BEQ CODE_0EE16D     ; $0EE166   |
    ASL A               ; $0EE168   |
    TAY                 ; $0EE169   |
    LDA $F2FD,y         ; $0EE16A   |

CODE_0EE16D:
    STA $6026           ; $0EE16D   |
    LDY $7402,x         ; $0EE170   |
    LDA $EEB7,y         ; $0EE173   | table
    AND #$00FF          ; $0EE176   |
    STA $3018           ; $0EE179   |
    TYA                 ; $0EE17C   |
    ASL A               ; $0EE17D   |
    TAY                 ; $0EE17E   |
    LDA $EEC8,y         ; $0EE17F   | table
    STA $301C           ; $0EE182   |
    LDA $F798,y         ; $0EE185   | table
    STA $6028           ; $0EE188   |
    LDA #$000E          ; $0EE18B   |
    STA $3000           ; $0EE18E   |
    LDA $7680,x         ; $0EE191   |
    STA $3002           ; $0EE194   |
    LDA $7682,x         ; $0EE197   |
    STA $3004           ; $0EE19A   |
    LDA $7400,x         ; $0EE19D   |
    STA $3010           ; $0EE1A0   |
    TXA                 ; $0EE1A3   |
    STA $3014           ; $0EE1A4   |
    LDX #$08            ; $0EE1A7   |
    LDA #$A2C6          ; $0EE1A9   |
    JSL $7EDE44         ; $0EE1AC   | GSU init
    LDX $12             ; $0EE1B0   |
    RTS                 ; $0EE1B2   |

; frog routine

CODE_0EE1B3:
    LDA $6F00,x         ; $0EE1B3   |
    CMP #$0008          ; $0EE1B6   |
    BNE CODE_0EE1C8     ; $0EE1B9   |
    LDY $74A2,x         ; $0EE1BB   |
    BPL CODE_0EE1C8     ; $0EE1BE   |
    STZ $7402,x         ; $0EE1C0   |
    STZ $78,x           ; $0EE1C3   |
    JMP CODE_0EE519     ; $0EE1C5   |

CODE_0EE1C8:
    LDY $7D38,x         ; $0EE1C8   |
    BEQ CODE_0EE1D8     ; $0EE1CB   |
    LDY $7862,x         ; $0EE1CD   |
    BEQ CODE_0EE1D8     ; $0EE1D0   |
    LDA #$0001          ; $0EE1D2   |
    STA $7860,x         ; $0EE1D5   |

CODE_0EE1D8:
    RTS                 ; $0EE1D8   |

; frog routine

CODE_0EE1D9:
    LDA #$07E0          ; $0EE1D9   |
    CMP $7182,x         ; $0EE1DC   |
    BPL CODE_0EE1E4     ; $0EE1DF   |
    STA $7182,x         ; $0EE1E1   |

CODE_0EE1E4:
    LDA $70E2,x         ; $0EE1E4   |
    SEC                 ; $0EE1E7   |
    SBC #$0010          ; $0EE1E8   |
    BPL CODE_0EE20C     ; $0EE1EB   |
    EOR $7220,x         ; $0EE1ED   |
    BMI CODE_0EE20C     ; $0EE1F0   |
    LDA #$0010          ; $0EE1F2   |
    STA $70E2,x         ; $0EE1F5   |
    LDA $7220,x         ; $0EE1F8   |
    EOR #$FFFF          ; $0EE1FB   |
    INC A               ; $0EE1FE   |
    STA $7220,x         ; $0EE1FF   |
    LDA $7400,x         ; $0EE202   |
    EOR #$0002          ; $0EE205   |
    STA $7400,x         ; $0EE208   |
    RTS                 ; $0EE20B   |

CODE_0EE20C:
    JSL $03A2C7         ; $0EE20C   |
    BCC CODE_0EE230     ; $0EE210   |
    LDY $7902,x         ; $0EE212   |
    BNE CODE_0EE21C     ; $0EE215   |
    PLA                 ; $0EE217   |
    JMP CODE_0E03A3     ; $0EE218   |

CODE_0EE21C:
    LDA $70E2,x         ; $0EE21C   |
    SEC                 ; $0EE21F   |
    SBC $72C0,x         ; $0EE220   |
    STA $70E2,x         ; $0EE223   |
    LDA $7182,x         ; $0EE226   |
    SEC                 ; $0EE229   |
    SBC $72C2,x         ; $0EE22A   |
    STA $7182,x         ; $0EE22D   |

CODE_0EE230:
    RTS                 ; $0EE230   |

; frog routine

CODE_0EE231:
    LDY $76,x           ; $0EE231   |
    CPY #$06            ; $0EE233   |
    BEQ CODE_0EE275     ; $0EE235   |
    LDA $7860,x         ; $0EE237   |
    AND #$0001          ; $0EE23A   |
    BNE CODE_0EE276     ; $0EE23D   |
    LDY $7862,x         ; $0EE23F   |
    BEQ CODE_0EE275     ; $0EE242   |
    LDA $7A38,x         ; $0EE244   |
    BNE CODE_0EE275     ; $0EE247   |
    LDA $70E2,x         ; $0EE249   |
    STA $7A38,x         ; $0EE24C   |
    STZ $7220,x         ; $0EE24F   |
    LDA #$0006          ; $0EE252   |
    LDY $0136           ; $0EE255   |
    CPY #$01            ; $0EE258   |
    BNE CODE_0EE25F     ; $0EE25A   |
    LDA #$FFFD          ; $0EE25C   |

CODE_0EE25F:
    STA $7720,x         ; $0EE25F   |
    LDA $6FA2,x         ; $0EE262   |
    AND #$F7FF          ; $0EE265   |
    STA $6FA2,x         ; $0EE268   |
    LDY $76,x           ; $0EE26B   |
    CPY #$08            ; $0EE26D   |
    BEQ CODE_0EE275     ; $0EE26F   |
    LDY #$09            ; $0EE271   |
    STY $76,x           ; $0EE273   |

CODE_0EE275:
    RTS                 ; $0EE275   |

CODE_0EE276:
    LDY $76,x           ; $0EE276   |
    CPY #$08            ; $0EE278   |
    BEQ CODE_0EE28C     ; $0EE27A   |
    CPY #$09            ; $0EE27C   |
    BEQ CODE_0EE28C     ; $0EE27E   |
    CPY #$0A            ; $0EE280   |
    BEQ CODE_0EE28C     ; $0EE282   |
    CPY #$0B            ; $0EE284   |
    BEQ CODE_0EE28C     ; $0EE286   |
    CPY #$0C            ; $0EE288   |
    BNE CODE_0EE275     ; $0EE28A   |

CODE_0EE28C:
    LDA $7A38,x         ; $0EE28C   |
    BEQ CODE_0EE275     ; $0EE28F   |
    STZ $7A38,x         ; $0EE291   |
    STZ $7720,x         ; $0EE294   |
    LDA $6FA2,x         ; $0EE297   |
    ORA #$0800          ; $0EE29A   |
    STA $6FA2,x         ; $0EE29D   |
    LDA #$0080          ; $0EE2A0   |
    STA $7542,x         ; $0EE2A3   |
    LDA #$0800          ; $0EE2A6   |
    STA $75E2,x         ; $0EE2A9   |
    STZ $7A96,x         ; $0EE2AC   |
    LDY $76,x           ; $0EE2AF   |
    CPY #$08            ; $0EE2B1   |
    BEQ CODE_0EE275     ; $0EE2B3   |
    LDY #$00            ; $0EE2B5   |
    STY $76,x           ; $0EE2B7   |
    RTS                 ; $0EE2B9   |

DATA_0EE2BA:         dw $0180
DATA_0EE2BC:         dw $FE80

DATA_0EE2BE:         dw $0040
DATA_0EE2C0:         dw $FFC0

DATA_0EE2C2:         dw $FC80
DATA_0EE2C4:         dw $0380

; frog routine

CODE_0EE2C6:
    LDY $7D36,x         ; $0EE2C6   |
    BMI CODE_0EE308     ; $0EE2C9   |
    DEY                 ; $0EE2CB   |
    BNE CODE_0EE305     ; $0EE2CC   |
    LDA $61B2           ; $0EE2CE   |
    AND #$6000          ; $0EE2D1   |
    BNE CODE_0EE304     ; $0EE2D4   |
    LDA $6F00           ; $0EE2D6   |
    SEC                 ; $0EE2D9   |
    SBC #$0010          ; $0EE2DA   |
    ORA $7AF8,x         ; $0EE2DD   |
    ORA $0D9C           ; $0EE2E0   |
    ORA $61CC           ; $0EE2E3   |
    BNE CODE_0EE304     ; $0EE2E6   |
    LDY $76             ; $0EE2E8   |
    CPY #$04            ; $0EE2EA   |
    BEQ CODE_0EE304     ; $0EE2EC   |
    CPY #$01            ; $0EE2EE   |
    BEQ CODE_0EE304     ; $0EE2F0   |
    LDY $76,x           ; $0EE2F2   |
    CPY #$08            ; $0EE2F4   |
    BEQ CODE_0EE304     ; $0EE2F6   |
    CPY #$09            ; $0EE2F8   |
    BEQ CODE_0EE304     ; $0EE2FA   |
    CPY #$0B            ; $0EE2FC   |
    BEQ CODE_0EE304     ; $0EE2FE   |
    CPY #$0C            ; $0EE300   |
    BNE CODE_0EE36E     ; $0EE302   |

CODE_0EE304:
    RTS                 ; $0EE304   |

CODE_0EE305:
    JMP CODE_0EE411     ; $0EE305   |--

CODE_0EE308:
    LDA $7C18,x         ; $0EE308   |
    SEC                 ; $0EE30B   |
    SBC $6122           ; $0EE30C   |
    SEC                 ; $0EE30F   |
    SBC $7BB8,x         ; $0EE310   |
    CMP #$FFF8          ; $0EE313   |
    BCC CODE_0EE352     ; $0EE316   |
    LDY $60AB           ; $0EE318   |
    BMI CODE_0EE304     ; $0EE31B   |
    LDY $7402,x         ; $0EE31D   |
    CPY #$08            ; $0EE320   |
    BEQ CODE_0EE328     ; $0EE322   |
    CPY #$09            ; $0EE324   |
    BNE CODE_0EE333     ; $0EE326   |

CODE_0EE328:
    LDY $76,x           ; $0EE328   |
    CPY #$08            ; $0EE32A   |
    BEQ CODE_0EE39C     ; $0EE32C   |
    JSL $03A858         ; $0EE32E   |
    RTS                 ; $0EE332   |

CODE_0EE333:
    LDA $7AF6,x         ; $0EE333   |
    BNE CODE_0EE304     ; $0EE336   |
    LDA $60FC           ; $0EE338   |
    AND #$0018          ; $0EE33B   |
    BNE CODE_0EE304     ; $0EE33E   |
    LDA #$FA00          ; $0EE340   |
    STA $60AA           ; $0EE343   |
    LDA #$0006          ; $0EE346   |
    STA $60C0           ; $0EE349   |
    STZ $60D4           ; $0EE34C   |
    JMP CODE_0EE458     ; $0EE34F   |--

CODE_0EE352:
    LDY $76,x           ; $0EE352   |
    CPY #$08            ; $0EE354   |
    BEQ CODE_0EE39C     ; $0EE356   |
    CPY #$09            ; $0EE358   |
    BEQ CODE_0EE39C     ; $0EE35A   |
    CPY #$0B            ; $0EE35C   |
    BEQ CODE_0EE39C     ; $0EE35E   |
    CPY #$0C            ; $0EE360   |
    BEQ CODE_0EE39C     ; $0EE362   |
    LDA $7AF6,x         ; $0EE364   |
    BNE CODE_0EE39C     ; $0EE367   |
    LDY $61B3           ; $0EE369   |
    BPL CODE_0EE39C     ; $0EE36C   |

CODE_0EE36E:
    LDA $7AF8,x         ; $0EE36E   |
    BNE CODE_0EE304     ; $0EE371   |
    JSR CODE_0EED35     ; $0EE373   |
    JSR CODE_0EEE29     ; $0EE376   |
    LDA #$0101          ; $0EE379   |
    STA $7900,x         ; $0EE37C   |
    LDY #$06            ; $0EE37F   |
    STY $76,x           ; $0EE381   |
    LDA #$0040          ; $0EE383   |
    TSB $6FA0           ; $0EE386   |
    LDY $79,x           ; $0EE389   |
    CPY #$58            ; $0EE38B   |
    BNE CODE_0EE39B     ; $0EE38D   |
    LDA #$580B          ; $0EE38F   |
    LDY $18,x           ; $0EE392   |
    BEQ CODE_0EE399     ; $0EE394   |
    LDA #$5816          ; $0EE396   |

CODE_0EE399:
    STA $78,x           ; $0EE399   |

CODE_0EE39B:
    RTS                 ; $0EE39B   |

CODE_0EE39C:
    LDA $61D6           ; $0EE39C   |
    BNE CODE_0EE39B     ; $0EE39F   |
    LDY #$00            ; $0EE3A1   |
    LDA $60A8           ; $0EE3A3   |
    BNE CODE_0EE3AF     ; $0EE3A6   |
    LDA $60C4           ; $0EE3A8   |
    EOR #$0002          ; $0EE3AB   |
    DEC A               ; $0EE3AE   |

CODE_0EE3AF:
    BPL CODE_0EE3B3     ; $0EE3AF   |
    INY                 ; $0EE3B1   |
    INY                 ; $0EE3B2   |

CODE_0EE3B3:
    LDA $E2BE,y         ; $0EE3B3   | table
    LDY $7A38,x         ; $0EE3B6   |
    BNE CODE_0EE3D9     ; $0EE3B9   |
    ASL A               ; $0EE3BB   |
    ASL A               ; $0EE3BC   |
    PHA                 ; $0EE3BD   |
    LDA $7860,x         ; $0EE3BE   |
    AND #$0002          ; $0EE3C1   |
    BNE CODE_0EE3CC     ; $0EE3C4   |
    LDA #$FC00          ; $0EE3C6   |
    STA $7222,x         ; $0EE3C9   |

CODE_0EE3CC:
    LDA #$0040          ; $0EE3CC   |
    STA $7542,x         ; $0EE3CF   |
    LDA #$0400          ; $0EE3D2   |
    STA $75E2,x         ; $0EE3D5   |
    PLA                 ; $0EE3D8   |

CODE_0EE3D9:
    CLC                 ; $0EE3D9   |
    ADC $60A8           ; $0EE3DA   |
    STA $7220,x         ; $0EE3DD   |
    LDY #$00            ; $0EE3E0   |
    CLC                 ; $0EE3E2   |
    ADC #$0380          ; $0EE3E3   |
    CMP #$0700          ; $0EE3E6   |
    BCC CODE_0EE3F5     ; $0EE3E9   |
    BMI CODE_0EE3EF     ; $0EE3EB   |
    INY                 ; $0EE3ED   |
    INY                 ; $0EE3EE   |

CODE_0EE3EF:
    LDA $E2C2,y         ; $0EE3EF   | table
    STA $7220,x         ; $0EE3F2   |

CODE_0EE3F5:
    LDA $7860,x         ; $0EE3F5   |
    AND #$000C          ; $0EE3F8   |
    BEQ CODE_0EE409     ; $0EE3FB   |
    SEC                 ; $0EE3FD   |
    SBC #$0008          ; $0EE3FE   |
    EOR $7220,x         ; $0EE401   |
    BPL CODE_0EE409     ; $0EE404   |
    STZ $7220,x         ; $0EE406   |

CODE_0EE409:
    LDA #$0065          ; $0EE409   |\ play sound #$0065
    JSL $0085D2         ; $0EE40C   |/

CODE_0EE410:
    RTS                 ; $0EE410   |

CODE_0EE411:
    TXA                 ; $0EE411   |
    STA $3002           ; $0EE412   |
    LDX #$09            ; $0EE415   |
    LDA #$8F33          ; $0EE417   |
    JSL $7EDE44         ; $0EE41A   | GSU init
    LDX $12             ; $0EE41E   |
    LDY $3002           ; $0EE420   |
    BMI CODE_0EE410     ; $0EE423   |
    LDA $7BB6,x         ; $0EE425   |
    CLC                 ; $0EE428   |
    ADC $7BB6,y         ; $0EE429   |
    ASL A               ; $0EE42C   |
    STA $00             ; $0EE42D   |
    LSR A               ; $0EE42F   |
    CLC                 ; $0EE430   |
    ADC $7CD6,x         ; $0EE431   |
    SEC                 ; $0EE434   |
    SBC $7CD6,y         ; $0EE435   |
    CMP $00             ; $0EE438   |
    BCS CODE_0EE410     ; $0EE43A   |
    LDA $7BB8,x         ; $0EE43C   |
    CLC                 ; $0EE43F   |
    ADC $7BB8,y         ; $0EE440   |
    ASL A               ; $0EE443   |
    STA $00             ; $0EE444   |
    LSR A               ; $0EE446   |
    CLC                 ; $0EE447   |
    ADC $7CD8,x         ; $0EE448   |
    SEC                 ; $0EE44B   |
    SBC $7CD8,y         ; $0EE44C   |
    CMP $00             ; $0EE44F   |
    BCS CODE_0EE410     ; $0EE451   |
    TYX                 ; $0EE453   |
    JSL $03B24B         ; $0EE454   |

CODE_0EE458:
    LDA #$0065          ; $0EE458   |\ play sound #$0065
    JSL $0085D2         ; $0EE45B   |/
    STZ $7220,x         ; $0EE45F   |
    STZ $7222,x         ; $0EE462   |
    LDA #$0800          ; $0EE465   |
    STA $75E2,x         ; $0EE468   |
    LDA #$0080          ; $0EE46B   |
    STA $7542,x         ; $0EE46E   |
    LDA $7A38,x         ; $0EE471   |
    BEQ CODE_0EE482     ; $0EE474   |
    STZ $7542,x         ; $0EE476   |
    STZ $75E2,x         ; $0EE479   |
    LDA #$0080          ; $0EE47C   |
    STA $7222,x         ; $0EE47F   |

CODE_0EE482:
    LDA #$000B          ; $0EE482   |
    LDY $7402,x         ; $0EE485   |
    CPY #$08            ; $0EE488   |
    BEQ CODE_0EE498     ; $0EE48A   |
    CPY #$09            ; $0EE48C   |
    BEQ CODE_0EE498     ; $0EE48E   |
    CPY #$0D            ; $0EE490   |
    BEQ CODE_0EE498     ; $0EE492   |
    CPY #$0E            ; $0EE494   |
    BNE CODE_0EE49B     ; $0EE496   |

CODE_0EE498:
    LDA #$000D          ; $0EE498   |

CODE_0EE49B:
    STA $7402,x         ; $0EE49B   |
    LDA #$0004          ; $0EE49E   |
    STA $7A98,x         ; $0EE4A1   |
    LDY $76,x           ; $0EE4A4   |
    CPY #$08            ; $0EE4A6   |
    BEQ CODE_0EE4C9     ; $0EE4A8   |
    LDY #$08            ; $0EE4AA   |
    STY $76,x           ; $0EE4AC   |
    LDA $6FA2,x         ; $0EE4AE   |
    ORA #$0480          ; $0EE4B1   |
    STA $6FA2,x         ; $0EE4B4   |
    LDY $79,x           ; $0EE4B7   |
    CPY #$58            ; $0EE4B9   |
    BNE CODE_0EE4C9     ; $0EE4BB   |
    LDA #$580A          ; $0EE4BD   |
    LDY $18,x           ; $0EE4C0   |
    BEQ CODE_0EE4C7     ; $0EE4C2   |
    LDA #$5816          ; $0EE4C4   |

CODE_0EE4C7:
    STA $78,x           ; $0EE4C7   |

CODE_0EE4C9:
    LDA #$0040          ; $0EE4C9   |
    STA $7A96,x         ; $0EE4CC   |
    LDY $7902,x         ; $0EE4CF   |
    BEQ CODE_0EE4D8     ; $0EE4D2   |
    JSL $06C114         ; $0EE4D4   |

CODE_0EE4D8:
    RTS                 ; $0EE4D8   |

DATA_0EE4D9:         dw $FFFC
DATA_0EE4DB:         dw $0004

; frog routine

CODE_0EE4DD:
    LDY $7902,x         ; $0EE4DD   |
    BEQ CODE_0EE518     ; $0EE4E0   |
    LDA $6F00           ; $0EE4E2   |
    CMP #$0010          ; $0EE4E5   |
    BEQ CODE_0EE4FA     ; $0EE4E8   |
    SEP #$20            ; $0EE4EA   |
    LDA #$00            ; $0EE4EC   |
    STA $7902,x         ; $0EE4EE   |
    REP #$20            ; $0EE4F1   |
    LDA #$0080          ; $0EE4F3   |
    STA $7AF8,x         ; $0EE4F6   |
    RTS                 ; $0EE4F9   |

CODE_0EE4FA:
    LDA $7400,x         ; $0EE4FA   |
    EOR #$0002          ; $0EE4FD   |
    STA $7400           ; $0EE500   |
    TAY                 ; $0EE503   |
    LDA $70E2,x         ; $0EE504   |
    CLC                 ; $0EE507   |
    ADC $E4D9,y         ; $0EE508   |
    STA $70E2           ; $0EE50B   |
    LDA $7182,x         ; $0EE50E   |
    SEC                 ; $0EE511   |
    SBC #$0008          ; $0EE512   |
    STA $7182           ; $0EE515   |

CODE_0EE518:
    RTS                 ; $0EE518   |

; frog routine

CODE_0EE519:
    SEP #$20            ; $0EE519   |
    LDA #$00            ; $0EE51B   |
    LDY $78,x           ; $0EE51D   |
    BEQ CODE_0EE524     ; $0EE51F   |
    LDA $F2E0,y         ; $0EE521   |

CODE_0EE524:
    LDY $7402,x         ; $0EE524   |
    CLC                 ; $0EE527   |
    ADC $EEB7,y         ; $0EE528   |
    CLC                 ; $0EE52B   |
    ADC $F787,y         ; $0EE52C   |
    ASL A               ; $0EE52F   |
    ASL A               ; $0EE530   |
    ASL A               ; $0EE531   |
    STA $7041,x         ; $0EE532   |
    REP #$20            ; $0EE535   |
    RTS                 ; $0EE537   |

DATA_0EE538:         dw $0001
DATA_0EE53A:         dw $0000

DATA_0EE53C:         dw $0003
DATA_0EE53E:         dw $0001

; state 00
frog_pause:
    TYX                 ; $0EE540   |
    LDA $7860,x         ; $0EE541   |
    AND #$0001          ; $0EE544   |
    BEQ CODE_0EE5AB     ; $0EE547   |
    STZ $7220,x         ; $0EE549   |
    LDA $7A96,x         ; $0EE54C   |
    BNE CODE_0EE5B8     ; $0EE54F   |
    LDY $7862,x         ; $0EE551   |
    BNE CODE_0EE571     ; $0EE554   |
    LDA $11             ; $0EE556   |
    AND #$0001          ; $0EE558   |
    BNE CODE_0EE571     ; $0EE55B   |
    LDA #$0002          ; $0EE55D   |
    STA $7402,x         ; $0EE560   |
    ASL A               ; $0EE563   |
    STA $16,x           ; $0EE564   |
    LDA #$0010          ; $0EE566   |
    STA $7A98,x         ; $0EE569   |
    LDY #$01            ; $0EE56C   |
    STY $76,x           ; $0EE56E   |
    RTS                 ; $0EE570   |

CODE_0EE571:
    LDA $10             ; $0EE571   |
    AND #$0002          ; $0EE573   |
    STA $7400,x         ; $0EE576   |
    DEC A               ; $0EE579   |
    STA $00             ; $0EE57A   |
    LDY $77,x           ; $0EE57C   |
    LDA $7A36,x         ; $0EE57E   |
    CLC                 ; $0EE581   |
    ADC $E536,y         ; $0EE582   |
    CMP $E53A,y         ; $0EE585   | tables
    BCC CODE_0EE597     ; $0EE588   |
    EOR $00             ; $0EE58A   |
    BPL CODE_0EE597     ; $0EE58C   |
    LDA $7400,x         ; $0EE58E   |
    EOR #$0002          ; $0EE591   |
    STA $7400,x         ; $0EE594   |

CODE_0EE597:
    LDY #$02            ; $0EE597   |
    STY $76,x           ; $0EE599   |

CODE_0EE59B:
    LDA #$0002          ; $0EE59B   |
    STA $16,x           ; $0EE59E   |
    LDA $7400,x         ; $0EE5A0   |
    DEC A               ; $0EE5A3   |
    CLC                 ; $0EE5A4   |
    ADC $7A36,x         ; $0EE5A5   |
    STA $7A36,x         ; $0EE5A8   |

CODE_0EE5AB:
    RTS                 ; $0EE5AB   |

DATA_0EE5AC:         dw $0001
DATA_0EE5AE:         dw $0005

DATA_0EE5B0:         dw $0004
DATA_0EE5B2:         dw $0008
DATA_0EE5B4:         dw $0003
DATA_0EE5B6:         dw $0004

; frog routine

CODE_0EE5B8:
    LDY $7902,x         ; $0EE5B8   |
    TYA                 ; $0EE5BB   |
    ORA $7AF6,x         ; $0EE5BC   |
    BNE CODE_0EE5F0     ; $0EE5BF   |
    LDY $61B3           ; $0EE5C1   |
    BPL CODE_0EE5F1     ; $0EE5C4   |
    LDA $7C16,x         ; $0EE5C6   |
    STA $00             ; $0EE5C9   |
    LDA $7C18,x         ; $0EE5CB   |
    JSR CODE_0EE607     ; $0EE5CE   |
    BCS CODE_0EE5F0     ; $0EE5D1   |

CODE_0EE5D3:
    LDA $E5AC,y         ; $0EE5D3   | table
    STA $7402,x         ; $0EE5D6   |
    LDA $E5B4,y         ; $0EE5D9   |
    STA $16,x           ; $0EE5DC   |
    LDA $E5B0,y         ; $0EE5DE   | table
    STA $7A98,x         ; $0EE5E1   |
    STY $18,x           ; $0EE5E4   |
    STZ $7900,x         ; $0EE5E6   |
    STZ $7222,x         ; $0EE5E9   |
    LDY #$03            ; $0EE5EC   |
    STY $76,x           ; $0EE5EE   |

CODE_0EE5F0:
    RTS                 ; $0EE5F0   |

CODE_0EE5F1:
    LDA $7CD6,x         ; $0EE5F1   |
    SEC                 ; $0EE5F4   |
    SBC $7CD6           ; $0EE5F5   |
    STA $00             ; $0EE5F8   |
    LDA $7CD8,x         ; $0EE5FA   |
    SEC                 ; $0EE5FD   |
    SBC $7CD8           ; $0EE5FE   |
    JSR CODE_0EE607     ; $0EE601   |
    BCC CODE_0EE5D3     ; $0EE604   |
    RTS                 ; $0EE606   |

; frog routine

CODE_0EE607:
    STA $02             ; $0EE607   |
    LDY #$02            ; $0EE609   |
    LDA $00             ; $0EE60B   |
    CLC                 ; $0EE60D   |
    ADC #$0030          ; $0EE60E   |
    CMP #$0060          ; $0EE611   |
    BCS CODE_0EE622     ; $0EE614   |
    LDA $02             ; $0EE616   |
    CMP #$0040          ; $0EE618   |
    BCS CODE_0EE622     ; $0EE61B   |
    CMP #$0018          ; $0EE61D   |
    BCS CODE_0EE652     ; $0EE620   |

CODE_0EE622:
    LDA $7A38,x         ; $0EE622   |
    BEQ CODE_0EE629     ; $0EE625   |
    SEC                 ; $0EE627   |
    RTS                 ; $0EE628   |

CODE_0EE629:
    LDA $7400,x         ; $0EE629   |
    DEC A               ; $0EE62C   |
    EOR $00             ; $0EE62D   |
    BMI CODE_0EE63A     ; $0EE62F   |
    LDA $7400,x         ; $0EE631   |
    EOR #$0002          ; $0EE634   |
    STA $7400,x         ; $0EE637   |

CODE_0EE63A:
    LDA $00             ; $0EE63A   |
    CLC                 ; $0EE63C   |
    ADC #$0050          ; $0EE63D   |
    CMP #$00A0          ; $0EE640   |
    BCS CODE_0EE653     ; $0EE643   |
    LDA $02             ; $0EE645   |
    CLC                 ; $0EE647   |
    ADC #$0018          ; $0EE648   |
    CMP #$0030          ; $0EE64B   |
    BCS CODE_0EE653     ; $0EE64E   |
    DEY                 ; $0EE650   |
    DEY                 ; $0EE651   |

CODE_0EE652:
    CLC                 ; $0EE652   |

CODE_0EE653:
    RTS                 ; $0EE653   |

DATA_0EE654:         db $03, $02, $03

DATA_0EE657:         db $10, $10, $10

; state 01
frog_laugh:
    TYX                 ; $0EE65A   |
    LDA $7A98,x         ; $0EE65B   |
    BNE CODE_0EE687     ; $0EE65E   |
    DEC $16,x           ; $0EE660   |
    BNE CODE_0EE667     ; $0EE662   |
    JMP CODE_0EE94B     ; $0EE664   |

CODE_0EE667:
    LDY $16,x           ; $0EE667   |
    LDA $E656,y         ; $0EE669   | table
    AND #$00FF          ; $0EE66C   |
    STA $7A98,x         ; $0EE66F   |
    LDA $E653,y         ; $0EE672   | table
    AND #$00FF          ; $0EE675   |
    STA $7402,x         ; $0EE678   |
    CMP #$0002          ; $0EE67B   |
    BNE CODE_0EE687     ; $0EE67E   |
    LDA #$005E          ; $0EE680   |\ play sound #$005E
    JSL $0085D2         ; $0EE683   |/

CODE_0EE687:
    RTS                 ; $0EE687   |

DATA_0EE688:         db $0A, $02, $01

DATA_0EE68B:         db $00, $10, $04
DATA_0EE68E:         db $00, $06, $02

DATA_0EE691:         dw $FE60
DATA_0EE693:         dw $01A0
DATA_0EE695:         dw $FE00
DATA_0EE697:         dw $0200

; states 02, 07, 0E
frog_hop:
    TYX                 ; $0EE699   |
    LDY $16,x           ; $0EE69A   |
    BMI CODE_0EE706     ; $0EE69C   |
    LDA $7A98,x         ; $0EE69E   |
    BNE CODE_0EE705     ; $0EE6A1   |
    LDA $E688,y         ; $0EE6A3   | table
    AND #$00FF          ; $0EE6A6   |
    STA $7402,x         ; $0EE6A9   |
    LDA $7902,x         ; $0EE6AC   |
    AND #$00FF          ; $0EE6AF   |
    BNE CODE_0EE6BD     ; $0EE6B2   |
    LDA $E68B,y         ; $0EE6B4   | table
    AND #$00FF          ; $0EE6B7   |
    STA $7A98,x         ; $0EE6BA   |

CODE_0EE6BD:
    DEY                 ; $0EE6BD   |
    STY $16,x           ; $0EE6BE   |
    BPL CODE_0EE705     ; $0EE6C0   |
    LDA #$0035          ; $0EE6C2   |\ play sound #$0035
    JSL $0085D2         ; $0EE6C5   |/
    LDA #$F980          ; $0EE6C9   |
    LDY $76,x           ; $0EE6CC   |
    CPY #$0E            ; $0EE6CE   |
    BNE CODE_0EE6D5     ; $0EE6D0   |
    LDA #$F680          ; $0EE6D2   |

CODE_0EE6D5:
    STA $7222,x         ; $0EE6D5   |
    LDA #$0080          ; $0EE6D8   |
    STA $7542,x         ; $0EE6DB   |
    LDA #$0800          ; $0EE6DE   |
    STA $75E2,x         ; $0EE6E1   |
    LDY $7400,x         ; $0EE6E4   |
    LDA $7902,x         ; $0EE6E7   |
    AND #$00FF          ; $0EE6EA   |
    BEQ CODE_0EE6FB     ; $0EE6ED   |
    TYA                 ; $0EE6EF   |
    CLC                 ; $0EE6F0   |
    ADC #$0004          ; $0EE6F1   |
    TAY                 ; $0EE6F4   |
    LDA #$F800          ; $0EE6F5   |
    STA $7222,x         ; $0EE6F8   |

CODE_0EE6FB:
    LDA $E691,y         ; $0EE6FB   | table
    STA $7220,x         ; $0EE6FE   |
    LDY #$00            ; $0EE701   |
    STY $19,x           ; $0EE703   |

CODE_0EE705:
    RTS                 ; $0EE705   |

CODE_0EE706:
    LDA $7860,x         ; $0EE706   |
    AND #$0001          ; $0EE709   |
    BEQ CODE_0EE761     ; $0EE70C   |
    STZ $7220,x         ; $0EE70E   |
    LDY $7402,x         ; $0EE711   |
    CPY #$0B            ; $0EE714   |
    BEQ CODE_0EE729     ; $0EE716   |
    INC $7402,x         ; $0EE718   |
    LDA #$0004          ; $0EE71B   |
    LDY $7902,x         ; $0EE71E   |
    BNE CODE_0EE726     ; $0EE721   |
    LDA #$000A          ; $0EE723   |

CODE_0EE726:
    STA $7A98,x         ; $0EE726   |

CODE_0EE729:
    LDA $7A98,x         ; $0EE729   |
    BNE CODE_0EE761     ; $0EE72C   |
    LDY $7902,x         ; $0EE72E   |
    BNE CODE_0EE753     ; $0EE731   |
    LDY $76,x           ; $0EE733   |
    CPY #$0E            ; $0EE735   |
    BEQ CODE_0EE73C     ; $0EE737   |
    JMP CODE_0EE94B     ; $0EE739   |

CODE_0EE73C:
    STZ $7402,x         ; $0EE73C   |
    INC $1015           ; $0EE73F   |
    LDA #$0000          ; $0EE742   |
    LDY $03AE           ; $0EE745   |
    BNE CODE_0EE74D     ; $0EE748   |
    LDA #$0180          ; $0EE74A   |

CODE_0EE74D:
    STA $7A96,x         ; $0EE74D   |
    INC $76,x           ; $0EE750   |
    RTS                 ; $0EE752   |

CODE_0EE753:
    STZ $7402,x         ; $0EE753   |
    LDA #$0002          ; $0EE756   |
    STA $16,x           ; $0EE759   |
    STA $7400,x         ; $0EE75B   |
    STZ $7A98,x         ; $0EE75E   |

CODE_0EE761:
    RTS                 ; $0EE761   |

DATA_0EE762:         db $04, $03, $02, $09, $08, $07, $06

DATA_0EE769:         db $00, $02, $08, $00, $02, $08, $02

DATA_0EE770:         dw $0801
DATA_0EE772:         dw $080C

; states 03 & 10
frog_prepare_tongue:
    TYX                 ; $0EE774   |
    LDA $7A98,x         ; $0EE775   |
    BNE CODE_0EE7AE     ; $0EE778   |
    DEC $16,x           ; $0EE77A   |
    LDA $16,x           ; $0EE77C   |
    BNE CODE_0EE793     ; $0EE77E   |
    LDY $18,x           ; $0EE780   |
    LDA $E770,y         ; $0EE782   | table
    STA $78,x           ; $0EE785   |
    LDA #$003E          ; $0EE787   |\ play sound #$003E
    JSL $0085D2         ; $0EE78A   |/
    INC $76,x           ; $0EE78E   |
    LDA #$0000          ; $0EE790   |

CODE_0EE793:
    LDY $18,x           ; $0EE793   |
    BEQ CODE_0EE79B     ; $0EE795   |
    CLC                 ; $0EE797   |
    ADC #$0003          ; $0EE798   |

CODE_0EE79B:
    TAY                 ; $0EE79B   |
    LDA $E762,y         ; $0EE79C   | table
    AND #$00FF          ; $0EE79F   |
    STA $7402,x         ; $0EE7A2   |
    LDA $E769,y         ; $0EE7A5   | table
    AND #$00FF          ; $0EE7A8   |
    STA $7A98,x         ; $0EE7AB   |

CODE_0EE7AE:
    JMP CODE_0EEE8A     ; $0EE7AE   |

; states 04 & 11
frog_tongue:
    TYX                 ; $0EE7B1   |
    LDA $7A98,x         ; $0EE7B2   |
    BEQ CODE_0EE7BA     ; $0EE7B5   |
    JMP CODE_0EE855     ; $0EE7B7   |

CODE_0EE7BA:
    LDY $19,x           ; $0EE7BA   |
    BNE CODE_0EE815     ; $0EE7BC   |
    LDA $78,x           ; $0EE7BE   |
    CLC                 ; $0EE7C0   |
    ADC #$0801          ; $0EE7C1   |
    STA $78,x           ; $0EE7C4   |
    XBA                 ; $0EE7C6   |
    TAY                 ; $0EE7C7   |
    CPY #$60            ; $0EE7C8   |
    BEQ CODE_0EE7CF     ; $0EE7CA   |
    JMP CODE_0EE855     ; $0EE7CC   |

CODE_0EE7CF:
    LDY $76,x           ; $0EE7CF   |
    CPY #$11            ; $0EE7D1   |
    BNE CODE_0EE7FA     ; $0EE7D3   |
    LDA #$580B          ; $0EE7D5   |
    STA $78,x           ; $0EE7D8   |
    LDA #$0006          ; $0EE7DA   |
    STA $7A98,x         ; $0EE7DD   |
    LDY #$02            ; $0EE7E0   |
    STY $19,x           ; $0EE7E2   |
    LDA $608C           ; $0EE7E4   |
    SEC                 ; $0EE7E7   |
    SBC $70E2,x         ; $0EE7E8   |
    SEC                 ; $0EE7EB   |
    SBC $6038           ; $0EE7EC   |
    AND #$00FF          ; $0EE7EF   |
    XBA                 ; $0EE7F2   |
    ORA #$0058          ; $0EE7F3   |
    STA $7900,x         ; $0EE7F6   |
    RTS                 ; $0EE7F9   |

CODE_0EE7FA:
    LDA #$5817          ; $0EE7FA   |
    LDY $18,x           ; $0EE7FD   |
    BEQ CODE_0EE804     ; $0EE7FF   |
    LDA #$581B          ; $0EE801   |

CODE_0EE804:
    STA $78,x           ; $0EE804   |
    LDA #$0008          ; $0EE806   |
    STA $16,x           ; $0EE809   |
    LDA #$0035          ; $0EE80B   |\ play sound #$0035
    JSL $0085D2         ; $0EE80E   |/
    INC $76,x           ; $0EE812   |
    RTS                 ; $0EE814   |

CODE_0EE815:
    LDA $78,x           ; $0EE815   |
    SEC                 ; $0EE817   |
    SBC #$0801          ; $0EE818   |
    STA $78,x           ; $0EE81B   |
    XBA                 ; $0EE81D   |
    TAY                 ; $0EE81E   |
    CPY #$00            ; $0EE81F   |
    BNE CODE_0EE855     ; $0EE821   |
    STZ $7402,x         ; $0EE823   |
    STZ $78,x           ; $0EE826   |
    LDY #$00            ; $0EE828   |
    STY $19,x           ; $0EE82A   |
    LDY $76,x           ; $0EE82C   |
    CPY #$11            ; $0EE82E   |
    BNE CODE_0EE842     ; $0EE830   |
    LDA #$0014          ; $0EE832   |\ play sound #$0014
    JSL $0085D2         ; $0EE835   |/
    LDA #$0040          ; $0EE839   |
    STA $7A98,x         ; $0EE83C   |
    INC $76,x           ; $0EE83F   |
    RTS                 ; $0EE841   |

CODE_0EE842:
    LDA $7A38,x         ; $0EE842   |
    BEQ CODE_0EE852     ; $0EE845   |
    LDA #$0006          ; $0EE847   |
    STA $7A96,x         ; $0EE84A   |
    LDY #$0B            ; $0EE84D   |
    STY $76,x           ; $0EE84F   |

CODE_0EE851:
    RTS                 ; $0EE851   |

CODE_0EE852:
    JMP CODE_0EE571     ; $0EE852   |

CODE_0EE855:
    LDY $76,x           ; $0EE855   |
    CPY #$11            ; $0EE857   |
    BEQ CODE_0EE851     ; $0EE859   |
    JSR CODE_0EEC41     ; $0EE85B   |
    JMP CODE_0EEE8A     ; $0EE85E   |

DATA_0EE861:         db $0B, $19, $1A, $19
DATA_0EE865:         db $1A, $17, $18, $17
DATA_0EE869:         db $16, $1D, $1E, $1D
DATA_0EE86D:         db $1E, $1C, $1B, $1C

; state 05
frog_tongue_shake:
    TYX                 ; $0EE871   |
    STX $00             ; $0EE872   |
    DEC $16,x           ; $0EE874   |
    BNE CODE_0EE884     ; $0EE876   |
    LDA #$0006          ; $0EE878   |
    STA $7A98,x         ; $0EE87B   |
    LDY #$02            ; $0EE87E   |
    STY $19,x           ; $0EE880   |
    DEC $76,x           ; $0EE882   |

CODE_0EE884:
    LDA $16,x           ; $0EE884   |
    LDY $18,x           ; $0EE886   |
    BEQ CODE_0EE88E     ; $0EE888   |
    CLC                 ; $0EE88A   |
    ADC #$0008          ; $0EE88B   |

CODE_0EE88E:
    TAY                 ; $0EE88E   |
    LDA $E861,y         ; $0EE88F   | state
    AND #$00FF          ; $0EE892   |
    ORA #$5800          ; $0EE895   |
    STA $78,x           ; $0EE898   |
    LDY $76,x           ; $0EE89A   |
    CPY $00             ; $0EE89C   |
    BNE CODE_0EE851     ; $0EE89E   |
    JSR CODE_0EEC41     ; $0EE8A0   |
    JMP CODE_0EEE8A     ; $0EE8A3   |

; state 06
frog_steal_mario:
    TYX                 ; $0EE8A6   |
    LDA $78,x           ; $0EE8A7   |
    SEC                 ; $0EE8A9   |
    SBC #$0801          ; $0EE8AA   |
    STA $78,x           ; $0EE8AD   |
    XBA                 ; $0EE8AF   |
    TAY                 ; $0EE8B0   |
    CPY #$00            ; $0EE8B1   |
    BEQ CODE_0EE8B7     ; $0EE8B3   |
    BPL CODE_0EE8BC     ; $0EE8B5   |

CODE_0EE8B7:
    STZ $7402,x         ; $0EE8B7   |
    STZ $78,x           ; $0EE8BA   |

CODE_0EE8BC:
    LDA $0D9A           ; $0EE8BC   |
    BNE CODE_0EE8C4     ; $0EE8BF   |
    JMP CODE_0EED91     ; $0EE8C1   |

CODE_0EE8C4:
    LDY $7223           ; $0EE8C4   |
    BMI CODE_0EE91E     ; $0EE8C7   |
    LDA $7CD8           ; $0EE8C9   |
    SEC                 ; $0EE8CC   |
    SBC $7CD8,x         ; $0EE8CD   |
    CMP #$0008          ; $0EE8D0   |
    BCS CODE_0EE91E     ; $0EE8D3   |
    INC $7902,x         ; $0EE8D5   |
    STZ $7900,x         ; $0EE8D8   |
    LDA #$0020          ; $0EE8DB   |
    STA $7AF6,x         ; $0EE8DE   |
    LDA #$0040          ; $0EE8E1   |
    TRB $6FA0           ; $0EE8E4   |
    JSL $06BE72         ; $0EE8E7   |
    LDA #$0020          ; $0EE8EB   |
    STA $7AF8           ; $0EE8EE   |
    STZ $0D9A           ; $0EE8F1   |
    STZ $61AE           ; $0EE8F4   |
    STZ $61B0           ; $0EE8F7   |
    LDA $7A38,x         ; $0EE8FA   |
    BNE CODE_0EE914     ; $0EE8FD   |
    LDA #$0002          ; $0EE8FF   |
    STA $16,x           ; $0EE902   |
    STA $7400,x         ; $0EE904   |
    STZ $7A98,x         ; $0EE907   |
    LDY #$07            ; $0EE90A   |
    LDA $7902,x         ; $0EE90C   |
    BNE CODE_0EE91C     ; $0EE90F   |
    JMP CODE_0EE94B     ; $0EE911   |

CODE_0EE914:
    LDA #$0006          ; $0EE914   |
    STA $7A96,x         ; $0EE917   |
    LDY #$0B            ; $0EE91A   |

CODE_0EE91C:
    STY $76,x           ; $0EE91C   |

CODE_0EE91E:
    RTS                 ; $0EE91E   |

; state 08
frog_headbopped:
    TYX                 ; $0EE91F   |
    LDA $7A96,x         ; $0EE920   |
    BNE CODE_0EE975     ; $0EE923   |
    LDA $78,x           ; $0EE925   |
    SEC                 ; $0EE927   |
    SBC #$0801          ; $0EE928   |
    STA $78,x           ; $0EE92B   |
    XBA                 ; $0EE92D   |
    TAY                 ; $0EE92E   |
    CPY #$01            ; $0EE92F   |
    BPL CODE_0EE985     ; $0EE931   |
    LDA $6FA2,x         ; $0EE933   |
    AND #$FB7F          ; $0EE936   |
    STA $6FA2,x         ; $0EE939   |
    STZ $7402,x         ; $0EE93C   |
    STZ $78,x           ; $0EE93F   |
    LDY #$00            ; $0EE941   |
    STY $19,x           ; $0EE943   |
    LDA #$0020          ; $0EE945   |
    STA $7AF6,x         ; $0EE948   |

CODE_0EE94B:
    LDA $10             ; $0EE94B   |
    AND #$001F          ; $0EE94D   |
    CLC                 ; $0EE950   |
    ADC #$0020          ; $0EE951   |
    STA $7A96,x         ; $0EE954   |
    STZ $76,x           ; $0EE957   |
    LDA #$0040          ; $0EE959   |
    STA $7542,x         ; $0EE95C   |
    LDA #$0400          ; $0EE95F   |
    STA $75E2,x         ; $0EE962   |
    LDA $7A38,x         ; $0EE965   |
    BEQ CODE_0EE974     ; $0EE968   |
    LDA #$0006          ; $0EE96A   |
    STA $7A96,x         ; $0EE96D   |
    LDY #$0B            ; $0EE970   |
    STY $76,x           ; $0EE972   |

CODE_0EE974:
    RTS                 ; $0EE974   |

CODE_0EE975:
    LDA $7A98,x         ; $0EE975   |
    BNE CODE_0EE985     ; $0EE978   |
    LDA $7402,x         ; $0EE97A   |
    BIT #$0001          ; $0EE97D   |
    BEQ CODE_0EE985     ; $0EE980   |
    INC $7402,x         ; $0EE982   |

CODE_0EE985:
    RTS                 ; $0EE985   |

; state 09
frog_water_init:
    TYX                 ; $0EE986   |
    LDA #$FC00          ; $0EE987   |
    STA $7222,x         ; $0EE98A   |
    STZ $7542,x         ; $0EE98D   |
    LDY $7862,x         ; $0EE990   |
    BNE CODE_0EE9A6     ; $0EE993   |
    LDA #$0060          ; $0EE995   |
    STA $7222,x         ; $0EE998   |
    STA $75E2,x         ; $0EE99B   |
    LDA #$0004          ; $0EE99E   |
    STA $7542,x         ; $0EE9A1   |
    INC $76,x           ; $0EE9A4   |

CODE_0EE9A6:
    RTS                 ; $0EE9A6   |

; state 0A
frog_water_floating:
    TYX                 ; $0EE9A7   |
    LDY $7862,x         ; $0EE9A8   |
    BEQ CODE_0EE9B5     ; $0EE9AB   |
    LDA #$FFA0          ; $0EE9AD   |
    STA $75E2,x         ; $0EE9B0   |
    BRA CODE_0EE9CC     ; $0EE9B3   |

CODE_0EE9B5:
    LDY $75E3,x         ; $0EE9B5   |
    BPL CODE_0EE9CC     ; $0EE9B8   |
    LDA #$0006          ; $0EE9BA   |
    STA $7A96,x         ; $0EE9BD   |
    LDA #$FFFF          ; $0EE9C0   |
    STA $7AF6,x         ; $0EE9C3   |
    STA $7AF8,x         ; $0EE9C6   |
    INC $76,x           ; $0EE9C9   |
    RTS                 ; $0EE9CB   |

CODE_0EE9CC:
    SEP #$20            ; $0EE9CC   |
    LDA #$FF            ; $0EE9CE   |
    STA $7862,x         ; $0EE9D0   |
    REP #$20            ; $0EE9D3   |
    JSR CODE_0EEE6C     ; $0EE9D5   |
    JMP CODE_0EE5B8     ; $0EE9D8   |

; state 0B
frog_water_ducking:
    TYX                 ; $0EE9DB   |
    LDA #$0600          ; $0EE9DC   |
    STA $7222,x         ; $0EE9DF   |
    STZ $7542,x         ; $0EE9E2   |
    LDA $7A96,x         ; $0EE9E5   |
    BNE CODE_0EE9FE     ; $0EE9E8   |
    STZ $7220,x         ; $0EE9EA   |
    STZ $7222,x         ; $0EE9ED   |
    LDA $10             ; $0EE9F0   |
    AND #$0007          ; $0EE9F2   |
    CLC                 ; $0EE9F5   |
    ADC #$0020          ; $0EE9F6   |
    STA $7A96,x         ; $0EE9F9   |
    INC $76,x           ; $0EE9FC   |

CODE_0EE9FE:
    RTS                 ; $0EE9FE   |

DATA_0EE9FF:         dw $0020
DATA_0EEA01:         dw $FFE0
DATA_0EEA03:         dw $0040
DATA_0EEA05:         dw $FFC0

DATA_0EEA07:         dw $FFF0
DATA_0EEA09:         dw $0010

; state 0C
frog_submerging:
    TYX                 ; $0EEA0B   |
    LDA $7A96,x         ; $0EEA0C   |
    BNE CODE_0EE9FE     ; $0EEA0F   |
    STZ $7AF6,x         ; $0EEA11   |
    STZ $7AF8,x         ; $0EEA14   |
    LDY $7902,x         ; $0EEA17   |
    BEQ CODE_0EEA1F     ; $0EEA1A   |
    STZ $7AF8           ; $0EEA1C   |

CODE_0EEA1F:
    LDA #$0003          ; $0EEA1F   |
    STA $00             ; $0EEA22   |
    LDA $70E2,x         ; $0EEA24   |
    STA $02             ; $0EEA27   |
    LDA $10             ; $0EEA29   |
    AND #$0002          ; $0EEA2B   |
    TAY                 ; $0EEA2E   |
    LDA $EA07,y         ; $0EEA2F   | table
    STA $0E             ; $0EEA32   |
    TYA                 ; $0EEA34   |
    LDY $7902,x         ; $0EEA35   |
    BEQ CODE_0EEA3E     ; $0EEA38   |
    CLC                 ; $0EEA3A   |
    ADC #$0004          ; $0EEA3B   |

CODE_0EEA3E:
    TAY                 ; $0EEA3E   |
    LDA $608C           ; $0EEA3F   |
    CLC                 ; $0EEA42   |
    ADC $E9FF,y         ; $0EEA43   | table

CODE_0EEA46:
    STA $70E2,x         ; $0EEA46   |
    SEC                 ; $0EEA49   |
    SBC $7A38,x         ; $0EEA4A   |
    CLC                 ; $0EEA4D   |
    ADC #$0050          ; $0EEA4E   |
    CMP #$00A0          ; $0EEA51   |
    BCS CODE_0EEA72     ; $0EEA54   |
    LDA $70E2,x         ; $0EEA56   |
    STA $3010           ; $0EEA59   |
    LDA $7182,x         ; $0EEA5C   |
    STA $3000           ; $0EEA5F   |
    LDX #$0A            ; $0EEA62   |
    LDA #$CE2F          ; $0EEA64   |
    JSL $7EDE91         ; $0EEA67   | GSU init
    LDX $12             ; $0EEA6B   |
    LDA $300A           ; $0EEA6D   |
    BEQ CODE_0EEA85     ; $0EEA70   |

CODE_0EEA72:
    DEC $00             ; $0EEA72   |
    BNE CODE_0EEA7D     ; $0EEA74   |
    LDA $02             ; $0EEA76   |
    STA $70E2,x         ; $0EEA78   |
    BRA CODE_0EEA85     ; $0EEA7B   |

CODE_0EEA7D:
    LDA $70E2,x         ; $0EEA7D   |
    CLC                 ; $0EEA80   |
    ADC $0E             ; $0EEA81   |
    BRA CODE_0EEA46     ; $0EEA83   |

CODE_0EEA85:
    LDA $70E2,x         ; $0EEA85   |
    CLC                 ; $0EEA88   |
    ADC #$0008          ; $0EEA89   |
    STA $7CD6,x         ; $0EEA8C   |
    JSR CODE_0EEE6C     ; $0EEA8F   |
    LDY #$09            ; $0EEA92   |
    STY $76,x           ; $0EEA94   |
    RTS                 ; $0EEA96   |

; state 0D
frog_intro_begin_wait:
    TYX                 ; $0EEA97   |
    LDA $70E2,x         ; $0EEA98   | \
    SEC                 ; $0EEA9B   |  | if yoshi is > $90
    SBC $608C           ; $0EEA9C   |  | pixels away from frog
    CMP #$0090          ; $0EEA9F   |  | skip intro sequence
    BPL CODE_0EEAC6     ; $0EEAA2   | /
    LDA #$0048          ; $0EEAA4   | \
    JSL $03A34C         ; $0EEAA7   | / spawn kamek
    LDA #$0000          ; $0EEAAB   |
    STA $70E2,y         ; $0EEAAE   |
    JSR CODE_0EE59B     ; $0EEAB1   |
    STZ $7542,x         ; $0EEAB4   |
    STZ $7222,x         ; $0EEAB7   |
    SEP #$20            ; $0EEABA   |
    LDA #$FF            ; $0EEABC   |
    STA $7863,x         ; $0EEABE   |
    REP #$20            ; $0EEAC1   |
    INC $76,x           ; $0EEAC3   |
    RTS                 ; $0EEAC5   |

CODE_0EEAC6:
    LDA #$0004          ; $0EEAC6   |
    STA $7542,x         ; $0EEAC9   |
    LDA #$0040          ; $0EEACC   |
    LDY $7862,x         ; $0EEACF   |
    BEQ CODE_0EEAD7     ; $0EEAD2   |
    LDA #$FFA0          ; $0EEAD4   |

CODE_0EEAD7:
    PHA                 ; $0EEAD7   |
    EOR $75E2,x         ; $0EEAD8   |
    BPL CODE_0EEAE6     ; $0EEADB   |
    SEP #$20            ; $0EEADD   |
    LDA #$FF            ; $0EEADF   |
    STA $7862,x         ; $0EEAE1   |
    REP #$20            ; $0EEAE4   |

CODE_0EEAE6:
    PLA                 ; $0EEAE6   |
    STA $75E2,x         ; $0EEAE7   |
    RTS                 ; $0EEAEA   |

; state 0F
frog_intro_kamek:
    TYX                 ; $0EEAEB   |
    LDA $7A96,x         ; $0EEAEC   |
    BNE CODE_0EEB52     ; $0EEAEF   |
    LDA $1015           ; $0EEAF1   |
    BNE CODE_0EEB2F     ; $0EEAF4   |
    LDA $105C           ; $0EEAF6   |
    DEC A               ; $0EEAF9   |
    CMP #$0060          ; $0EEAFA   |
    BPL CODE_0EEB02     ; $0EEAFD   |
    LDA #$0060          ; $0EEAFF   |

CODE_0EEB02:
    STA $105C           ; $0EEB02   |
    JSR CODE_0EEB53     ; $0EEB05   |
    LDA $105C           ; $0EEB08   |
    CMP #$0060          ; $0EEB0B   |
    BNE CODE_0EEB52     ; $0EEB0E   |
    LDY #$00            ; $0EEB10   |
    STY $18,x           ; $0EEB12   |
    LDA #$0001          ; $0EEB14   |
    STA $7402,x         ; $0EEB17   |
    LDA #$0003          ; $0EEB1A   |
    STA $16,x           ; $0EEB1D   |
    INC A               ; $0EEB1F   |
    STA $7A98,x         ; $0EEB20   |
    STZ $7900,x         ; $0EEB23   |
    LDA #$0060          ; $0EEB26   |
    STA $7A98,x         ; $0EEB29   |
    INC $76,x           ; $0EEB2C   |
    RTS                 ; $0EEB2E   |

CODE_0EEB2F:
    BPL CODE_0EEB35     ; $0EEB2F   |
    STZ $1015           ; $0EEB31   |
    RTS                 ; $0EEB34   |

CODE_0EEB35:
    CMP #$0002          ; $0EEB35   |
    BNE CODE_0EEB52     ; $0EEB38   |
    LDA #$0100          ; $0EEB3A   |
    CMP $105C           ; $0EEB3D   |
    BEQ CODE_0EEB52     ; $0EEB40   |
    STA $105C           ; $0EEB42   |
    LDA #$0030          ; $0EEB45   |
    STA $7A96,x         ; $0EEB48   |
    JSR CODE_0EEB53     ; $0EEB4B   |
    JSL $03BFF7         ; $0EEB4E   |

CODE_0EEB52:
    RTS                 ; $0EEB52   |

; frog routine

CODE_0EEB53:
    LDA #$001A          ; $0EEB53   |
    STA $60AC           ; $0EEB56   |
    LDA #$0166          ; $0EEB59   |
    STA $60BE           ; $0EEB5C   |
    LDA $105C           ; $0EEB5F   |
    STA $300C           ; $0EEB62   |
    LDA #$0020          ; $0EEB65   |
    STA $3004           ; $0EEB68   |
    STZ $3006           ; $0EEB6B   |
    LSR A               ; $0EEB6E   |
    STA $3010           ; $0EEB6F   |
    LDA #$001F          ; $0EEB72   |
    STA $3012           ; $0EEB75   |
    LDA #$0040          ; $0EEB78   |
    STA $3018           ; $0EEB7B   |
    LDA #$0054          ; $0EEB7E   |
    STA $301A           ; $0EEB81   |
    LDX #$08            ; $0EEB84   |
    LDA #$8293          ; $0EEB86   |
    JSL $7EDE44         ; $0EEB89   | GSU init
    LDX $12             ; $0EEB8D   |
    RTS                 ; $0EEB8F   |

; state 12
frog_intro_eggs_disappearing:
    TYX                 ; $0EEB90   |
    LDA $7A98,x         ; $0EEB91   |
    BNE CODE_0EEBA7     ; $0EEB94   |
    LDA #$0002          ; $0EEB96   |
    STA $7402,x         ; $0EEB99   |
    INC A               ; $0EEB9C   |
    STA $16,x           ; $0EEB9D   |
    LDA #$0010          ; $0EEB9F   |
    STA $7A98,x         ; $0EEBA2   |
    INC $76,x           ; $0EEBA5   |

CODE_0EEBA7:
    RTS                 ; $0EEBA7   |

DATA_0EEBA8:         db $02, $03

DATA_0EEBAA:         db $10, $20

; state 13
frog_intro_burping:
    TYX                 ; $0EEBAC   |
    LDA $7A98,x         ; $0EEBAD   |
    BNE CODE_0EEBF9     ; $0EEBB0   |
    DEC $16,x           ; $0EEBB2   |
    BNE CODE_0EEBC5     ; $0EEBB4   |
    LDA #$0040          ; $0EEBB6   |
    STA $7A98,x         ; $0EEBB9   |
    LDA #$0002          ; $0EEBBC   |
    STA $7402,x         ; $0EEBBF   |
    INC $76,x           ; $0EEBC2   |
    RTS                 ; $0EEBC4   |

CODE_0EEBC5:
    SEP #$20            ; $0EEBC5   |
    LDY $16,x           ; $0EEBC7   |
    LDA $EBA9,y         ; $0EEBC9   | table
    STA $7A98,x         ; $0EEBCC   |
    LDA $EBA7,y         ; $0EEBCF   | table
    STA $7402,x         ; $0EEBD2   |
    REP #$20            ; $0EEBD5   |
    DEY                 ; $0EEBD7   |
    BEQ CODE_0EEBF9     ; $0EEBD8   |
    LDA #$0065          ; $0EEBDA   |\ play sound #$0065
    JSL $0085D2         ; $0EEBDD   |/
    LDA #$FE00          ; $0EEBE1   |
    STA $00             ; $0EEBE4   |
    LDA #$FF80          ; $0EEBE6   |
    STA $02             ; $0EEBE9   |
    LDA $70E2,x         ; $0EEBEB   |
    STA $0A             ; $0EEBEE   |
    LDA $7182,x         ; $0EEBF0   |
    STA $0C             ; $0EEBF3   |
    JSL $0EEBFA         ; $0EEBF5   |

CODE_0EEBF9:
    RTS                 ; $0EEBF9   |

; frog routine
    LDA #$01D9          ; $0EEBFA   |
    JSL $008B21         ; $0EEBFD   |
    LDA $0A             ; $0EEC01   |
    STA $70A2,y         ; $0EEC03   |
    LDA $0C             ; $0EEC06   |
    STA $7142,y         ; $0EEC08   |
    LDA #$000C          ; $0EEC0B   |
    STA $7782,y         ; $0EEC0E   |
    LDA #$0002          ; $0EEC11   |
    STA $7E4C,y         ; $0EEC14   |
    ASL A               ; $0EEC17   |
    STA $7500,y         ; $0EEC18   |
    STA $7502,y         ; $0EEC1B   |
    STA $7462,y         ; $0EEC1E   |
    LDA $00             ; $0EEC21   |
    STA $71E0,y         ; $0EEC23   |
    LDA $02             ; $0EEC26   |
    STA $75A2,y         ; $0EEC28   |
    RTL                 ; $0EEC2B   |

; state 14
frog_intro_end:
    TYX                 ; $0EEC2C   |
    LDA $7A98,x         ; $0EEC2D   |
    BNE CODE_0EEC36     ; $0EEC30   |
    JSL $02A4B5         ; $0EEC32   |

CODE_0EEC36:
    RTS                 ; $0EEC36   |

DATA_0EEC37:         dw $FF00
DATA_0EEC39:         dw $00FF

DATA_0EEC3B:         dw $FF00
DATA_0EEC3D:         dw $0100
DATA_0EEC3F:         dw $0001

; frog routine

CODE_0EEC41:
    LDY $79,x           ; $0EEC41   |
    CPY #$01            ; $0EEC43   |
    BMI CODE_0EECBB     ; $0EEC45   |
    TYA                 ; $0EEC47   |
    LSR A               ; $0EEC48   |
    LDY $18,x           ; $0EEC49   |
    BNE CODE_0EEC68     ; $0EEC4B   |
    STA $6004           ; $0EEC4D   |
    LDA #$0004          ; $0EEC50   |
    STA $6006           ; $0EEC53   |
    LDA $7400,x         ; $0EEC56   |
    DEC A               ; $0EEC59   |
    STA $00             ; $0EEC5A   |
    LDA $7CD6           ; $0EEC5C   |
    SEC                 ; $0EEC5F   |
    SBC $7CD6,x         ; $0EEC60   |
    EOR $00             ; $0EEC63   |
    BPL CODE_0EEC79     ; $0EEC65   |
    RTS                 ; $0EEC67   |

CODE_0EEC68:
    STA $6006           ; $0EEC68   |
    LDA #$0004          ; $0EEC6B   |
    STA $6004           ; $0EEC6E   |
    LDA $7CD8           ; $0EEC71   |
    CMP $7CD8,x         ; $0EEC74   |
    BPL CODE_0EECBB     ; $0EEC77   |

CODE_0EEC79:
    LDA $70E2,x         ; $0EEC79   |
    CLC                 ; $0EEC7C   |
    ADC $603C           ; $0EEC7D   |
    STA $6000           ; $0EEC80   |
    LDA $7182,x         ; $0EEC83   |
    CLC                 ; $0EEC86   |
    ADC $603E           ; $0EEC87   |
    STA $6002           ; $0EEC8A   |
    LDA $6004           ; $0EEC8D   |
    CLC                 ; $0EEC90   |
    ADC $7BB6           ; $0EEC91   |
    ASL A               ; $0EEC94   |
    STA $04             ; $0EEC95   |
    LSR A               ; $0EEC97   |
    CLC                 ; $0EEC98   |
    ADC $6000           ; $0EEC99   |
    SEC                 ; $0EEC9C   |
    SBC $7CD6           ; $0EEC9D   |
    CMP $04             ; $0EECA0   |
    BCS CODE_0EECBB     ; $0EECA2   |
    LDA $6006           ; $0EECA4   |
    CLC                 ; $0EECA7   |
    ADC $7BB8           ; $0EECA8   |
    ASL A               ; $0EECAB   |
    STA $04             ; $0EECAC   |
    LSR A               ; $0EECAE   |
    CLC                 ; $0EECAF   |
    ADC $6002           ; $0EECB0   |
    SEC                 ; $0EECB3   |
    SBC $7CD8           ; $0EECB4   |
    CMP $04             ; $0EECB7   |
    BCC CODE_0EECBC     ; $0EECB9   |

CODE_0EECBB:
    RTS                 ; $0EECBB   |

CODE_0EECBC:
    LDA $61B2           ; $0EECBC   |
    AND #$6000          ; $0EECBF   |
    BNE CODE_0EECBB     ; $0EECC2   |
    LDA $7AF8,x         ; $0EECC4   |
    ORA $0D9C           ; $0EECC7   |
    ORA $61CC           ; $0EECCA   |
    BNE CODE_0EECBB     ; $0EECCD   |
    LDY $76             ; $0EECCF   |
    CPY #$04            ; $0EECD1   |
    BEQ CODE_0EECBB     ; $0EECD3   |
    JSL $06C114         ; $0EECD5   |
    JSR CODE_0EED35     ; $0EECD9   |
    LDA $70E2           ; $0EECDC   |
    SEC                 ; $0EECDF   |
    SBC $70E2,x         ; $0EECE0   |
    SEC                 ; $0EECE3   |
    SBC $6038           ; $0EECE4   |
    AND #$00FF          ; $0EECE7   |
    XBA                 ; $0EECEA   |
    STA $06             ; $0EECEB   |
    LDA $7182           ; $0EECED   |
    SEC                 ; $0EECF0   |
    SBC $7182,x         ; $0EECF1   |
    SEC                 ; $0EECF4   |
    SBC $603A           ; $0EECF5   |
    AND #$00FF          ; $0EECF8   |
    ORA $06             ; $0EECFB   |
    STA $06             ; $0EECFD   |
    LDY $18,x           ; $0EECFF   |
    LDA $EC37,y         ; $0EED01   | table
    AND $06             ; $0EED04   |
    STA $7900,x         ; $0EED06   |
    BNE CODE_0EED1A     ; $0EED09   |
    LDA $18,x           ; $0EED0B   |
    ASL A               ; $0EED0D   |
    TAY                 ; $0EED0E   |
    BNE CODE_0EED14     ; $0EED0F   |
    LDY $7400,x         ; $0EED11   |

CODE_0EED14:
    LDA $EC3B,y         ; $0EED14   | table
    STA $7900,x         ; $0EED17   |

CODE_0EED1A:
    LDY #$02            ; $0EED1A   |
    STY $19,x           ; $0EED1C   |
    LDY #$06            ; $0EED1E   |
    STY $76,x           ; $0EED20   |
    LDY $79,x           ; $0EED22   |
    CPY #$58            ; $0EED24   |
    BNE CODE_0EED34     ; $0EED26   |
    LDA #$580B          ; $0EED28   |
    LDY $18,x           ; $0EED2B   |
    BEQ CODE_0EED32     ; $0EED2D   |
    LDA #$5816          ; $0EED2F   |

CODE_0EED32:
    STA $78,x           ; $0EED32   |

CODE_0EED34:
    RTS                 ; $0EED34   |

; frog routine

CODE_0EED35:
    LDA $61B2           ; $0EED35   |
    BPL CODE_0EED51     ; $0EED38   |
    LDA #$0100          ; $0EED3A   |
    STA $614A           ; $0EED3D   |
    LSR A               ; $0EED40   |
    STA $61D6           ; $0EED41   |
    STZ $60A8           ; $0EED44   |
    STZ $60B4           ; $0EED47   |
    JSL $04F74A         ; $0EED4A   |
    LDA $61B2           ; $0EED4E   |

CODE_0EED51:
    AND #$7FFF          ; $0EED51   |
    STA $61B2           ; $0EED54   |
    LDA #$0010          ; $0EED57   |
    STA $6F00           ; $0EED5A   |
    LDY #$00            ; $0EED5D   |
    STY $7862           ; $0EED5F   |
    LDY #$04            ; $0EED62   |
    STY $76             ; $0EED64   |
    LDA #$6040          ; $0EED66   |
    STA $6FA2           ; $0EED69   |
    STZ $16             ; $0EED6C   |
    STZ $7902           ; $0EED6E   |
    LDA #$FFFF          ; $0EED71   |
    STA $7E48           ; $0EED74   |
    STA $7AF8           ; $0EED77   |
    STZ $7220,x         ; $0EED7A   |
    STZ $7222,x         ; $0EED7D   |
    STZ $7540,x         ; $0EED80   |
    STZ $7542,x         ; $0EED83   |
    INC $61AE           ; $0EED86   |
    INC $61B0           ; $0EED89   |

CODE_0EED8C:
    RTS                 ; $0EED8C   |

DATA_0EED8D:         dw $0100
DATA_0EED8F:         dw $FF00

; frog routine

CODE_0EED91:
    LDA $7900,x         ; $0EED91   |
    BEQ CODE_0EED8C     ; $0EED94   |
    SEP #$20            ; $0EED96   |
    LDY $18,x           ; $0EED98   |
    BEQ CODE_0EEDAD     ; $0EED9A   |
    LDA $7900,x         ; $0EED9C   |
    CLC                 ; $0EED9F   |
    ADC #$08            ; $0EEDA0   |
    ORA #$01            ; $0EEDA2   |
    STA $7900,x         ; $0EEDA4   |
    CMP #$F0            ; $0EEDA7   |
    BPL CODE_0EEDC6     ; $0EEDA9   |
    BRA CODE_0EEDCB     ; $0EEDAB   |

CODE_0EEDAD:
    LDA #$08            ; $0EEDAD   |
    LDY $7400,x         ; $0EEDAF   |
    BEQ CODE_0EEDB6     ; $0EEDB2   |
    LDA #$F8            ; $0EEDB4   |

CODE_0EEDB6:
    CLC                 ; $0EEDB6   |
    ADC $7901,x         ; $0EEDB7   |
    ORA #$01            ; $0EEDBA   |
    STA $7901,x         ; $0EEDBC   |
    CLC                 ; $0EEDBF   |
    ADC #$10            ; $0EEDC0   |
    CMP #$20            ; $0EEDC2   |
    BCS CODE_0EEDCB     ; $0EEDC4   |

CODE_0EEDC6:
    REP #$20            ; $0EEDC6   |
    JMP CODE_0EEE29     ; $0EEDC8   |

CODE_0EEDCB:
    REP #$20            ; $0EEDCB   |
    LDY $7901,x         ; $0EEDCD   |
    TYA                 ; $0EEDD0   |
    CPY #$00            ; $0EEDD1   |
    BPL CODE_0EEDD8     ; $0EEDD3   |
    ORA #$FF00          ; $0EEDD5   |

CODE_0EEDD8:
    CLC                 ; $0EEDD8   |
    ADC $70E2,x         ; $0EEDD9   |
    STA $70E2           ; $0EEDDC   |
    LDY $7900,x         ; $0EEDDF   |
    TYA                 ; $0EEDE2   |
    CPY #$00            ; $0EEDE3   |
    BPL CODE_0EEDEA     ; $0EEDE5   |
    ORA #$FF00          ; $0EEDE7   |

CODE_0EEDEA:
    CLC                 ; $0EEDEA   |
    ADC $7182,x         ; $0EEDEB   |
    STA $7182           ; $0EEDEE   |
    RTS                 ; $0EEDF1   |

; frog routine

CODE_0EEDF2:
    LDY $7901,x         ; $0EEDF2   |
    BEQ CODE_0EEE28     ; $0EEDF5   |
    SEP #$20            ; $0EEDF7   |
    LDA $7900,x         ; $0EEDF9   |
    SEC                 ; $0EEDFC   |
    SBC $79,x           ; $0EEDFD   |
    BEQ CODE_0EEE08     ; $0EEDFF   |
    PHA                 ; $0EEE01   |
    LDA $79,x           ; $0EEE02   |
    STA $7900,x         ; $0EEE04   |
    PLA                 ; $0EEE07   |

CODE_0EEE08:
    CLC                 ; $0EEE08   |
    ADC $7901,x         ; $0EEE09   |
    STA $7901,x         ; $0EEE0C   |
    BMI CODE_0EEE14     ; $0EEE0F   |
    STZ $7901,x         ; $0EEE11   |

CODE_0EEE14:
    REP #$20            ; $0EEE14   |
    LDY $7901,x         ; $0EEE16   |
    TYA                 ; $0EEE19   |
    CPY #$00            ; $0EEE1A   |
    BPL CODE_0EEE21     ; $0EEE1C   |
    ORA #$FF00          ; $0EEE1E   |

CODE_0EEE21:
    CLC                 ; $0EEE21   |
    ADC $70E2,x         ; $0EEE22   |
    STA $608C           ; $0EEE25   |

CODE_0EEE28:
    RTS                 ; $0EEE28   |

; frog routine

CODE_0EEE29:
    LDY #$00            ; $0EEE29   |
    LDA $7CD6           ; $0EEE2B   |
    SEC                 ; $0EEE2E   |
    SBC $70E2,x         ; $0EEE2F   |
    SEC                 ; $0EEE32   |
    SBC $6038           ; $0EEE33   |
    ASL A               ; $0EEE36   |
    ASL A               ; $0EEE37   |
    ASL A               ; $0EEE38   |
    EOR #$FFFF          ; $0EEE39   |
    INC A               ; $0EEE3C   |
    STA $00             ; $0EEE3D   |
    CLC                 ; $0EEE3F   |
    ADC #$0100          ; $0EEE40   |
    CMP #$0200          ; $0EEE43   |
    BCC CODE_0EEE51     ; $0EEE46   |
    BPL CODE_0EEE4C     ; $0EEE48   |
    INY                 ; $0EEE4A   |
    INY                 ; $0EEE4B   |

CODE_0EEE4C:
    LDA $ED8D,y         ; $0EEE4C   | table
    STA $00             ; $0EEE4F   |

CODE_0EEE51:
    LDA $00             ; $0EEE51   |
    STA $7220           ; $0EEE53   |
    LDA #$FC00          ; $0EEE56   |
    STA $7222           ; $0EEE59   |
    LDA #$0040          ; $0EEE5C   |
    STA $7542           ; $0EEE5F   |
    STA $0D9A           ; $0EEE62   |
    LDA #$0400          ; $0EEE65   |
    STA $75E2           ; $0EEE68   |
    RTS                 ; $0EEE6B   |

; frog routine

CODE_0EEE6C:
    LDA $611C           ; $0EEE6C   |
    LDY $61B3           ; $0EEE6F   |
    BMI CODE_0EEE7C     ; $0EEE72   |
    LDY $7902,x         ; $0EEE74   |
    BNE CODE_0EEE7C     ; $0EEE77   |
    LDA $7CD6           ; $0EEE79   |

CODE_0EEE7C:
    LDY #$00            ; $0EEE7C   |
    CMP $7CD6,x         ; $0EEE7E   |
    BMI CODE_0EEE85     ; $0EEE81   |
    INY                 ; $0EEE83   |
    INY                 ; $0EEE84   |

CODE_0EEE85:
    TYA                 ; $0EEE85   |
    STA $7400,x         ; $0EEE86   |
    RTS                 ; $0EEE89   |

; frog routine

CODE_0EEE8A:
    LDA $7A38,x         ; $0EEE8A   |
    BEQ CODE_0EEEB6     ; $0EEE8D   |
    LDA #$0004          ; $0EEE8F   |
    STA $7542,x         ; $0EEE92   |
    LDA #$0040          ; $0EEE95   |
    LDY $7862,x         ; $0EEE98   |
    BEQ CODE_0EEEA0     ; $0EEE9B   |
    LDA #$FFA0          ; $0EEE9D   |

CODE_0EEEA0:
    PHA                 ; $0EEEA0   |
    EOR $75E2,x         ; $0EEEA1   |
    BPL CODE_0EEEAF     ; $0EEEA4   |
    SEP #$20            ; $0EEEA6   |
    LDA #$FF            ; $0EEEA8   |
    STA $7862,x         ; $0EEEAA   |
    REP #$20            ; $0EEEAD   |

CODE_0EEEAF:
    PLA                 ; $0EEEAF   |
    STA $75E2,x         ; $0EEEB0   |
    STZ $7220,x         ; $0EEEB3   |

CODE_0EEEB6:
    RTS                 ; $0EEEB6   |

; frog table: sizes of the tables below
; these sizes are not in bytes but chunks of 5 bytes
; so table_value * 5 = size im bytes of the table
DATA_0EEEB7:         db $0A, $0A, $0A, $0B
DATA_0EEEBB:         db $0B, $0A, $0A, $0A
DATA_0EEEBF:         db $0F, $0F, $0A, $0A
DATA_0EEEC3:         db $0B, $0F, $0F, $0F
DATA_0EEEC7:         db $0F

; frog pointer table: pointers to tables (sizes above)
DATA_0EEEC8:         dw $EEEA
DATA_0EEECA:         dw $EF1C
DATA_0EEECC:         dw $EF4E
DATA_0EEECE:         dw $EF80
DATA_0EEED0:         dw $EFB7
DATA_0EEED2:         dw $EFEE
DATA_0EEED4:         dw $F020
DATA_0EEED6:         dw $F052
DATA_0EEED8:         dw $F084
DATA_0EEEDA:         dw $F0CF
DATA_0EEEDC:         dw $F11A
DATA_0EEEDE:         dw $F14C
DATA_0EEEE0:         dw $F17E
DATA_0EEEE2:         dw $F1B5
DATA_0EEEE4:         dw $F200
DATA_0EEEE6:         dw $F24B
DATA_0EEEE8:         dw $F296

; frog table 00
DATA_0EEEEA:         db $FC, $0A, $06, $02, $00
DATA_0EEEEF:         db $05, $0A, $06, $02, $00
DATA_0EEEF4:         db $0E, $0A, $18, $02, $00
DATA_0EEEF9:         db $0E, $02, $08, $02, $00
DATA_0EEEFE:         db $04, $FB, $0C, $02, $00
DATA_0EEF03:         db $FD, $FB, $0C, $02, $00
DATA_0EEF08:         db $00, $00, $01, $02, $02
DATA_0EEF0D:         db $F8, $00, $00, $02, $02
DATA_0EEF12:         db $FE, $0A, $18, $42, $00
DATA_0EEF17:         db $FE, $02, $08, $42, $00

; frog table 01
DATA_0EEF1C:         db $FC, $0A, $06, $02, $00
DATA_0EEF21:         db $05, $0A, $06, $02, $00
DATA_0EEF26:         db $0E, $0A, $18, $02, $00
DATA_0EEF2B:         db $0E, $02, $08, $02, $00
DATA_0EEF30:         db $05, $FB, $0C, $02, $00
DATA_0EEF35:         db $FE, $FB, $0C, $02, $00
DATA_0EEF3A:         db $01, $00, $01, $02, $02
DATA_0EEF3F:         db $F9, $00, $00, $02, $02
DATA_0EEF44:         db $FE, $0A, $18, $42, $00
DATA_0EEF49:         db $FE, $02, $08, $42, $00

; frog table 02
DATA_0EEF4E:         db $FF, $FC, $0B, $42, $00
DATA_0EEF53:         db $06, $FC, $0B, $02, $00
DATA_0EEF58:         db $FC, $0A, $06, $02, $00
DATA_0EEF5D:         db $05, $0A, $06, $02, $00
DATA_0EEF62:         db $0E, $0A, $18, $02, $00
DATA_0EEF67:         db $0E, $02, $08, $02, $00
DATA_0EEF6C:         db $02, $01, $01, $02, $02
DATA_0EEF71:         db $FA, $01, $00, $02, $02
DATA_0EEF76:         db $FE, $0A, $18, $42, $00
DATA_0EEF7B:         db $FE, $02, $08, $42, $00

; frog table 03
DATA_0EEF80:         db $FD, $FB, $0B, $42, $00
DATA_0EEF85:         db $04, $FB, $0B, $02, $00
DATA_0EEF8A:         db $0E, $0A, $18, $02, $00
DATA_0EEF8F:         db $0E, $02, $08, $02, $00
DATA_0EEF94:         db $05, $0A, $06, $02, $00
DATA_0EEF99:         db $08, $08, $12, $02, $00
DATA_0EEF9E:         db $00, $08, $14, $02, $00
DATA_0EEFA3:         db $08, $00, $05, $02, $00
DATA_0EEFA8:         db $00, $00, $04, $02, $00
DATA_0EEFAD:         db $F8, $00, $03, $02, $00
DATA_0EEFB2:         db $FC, $0A, $06, $02, $00

; frog table 04
DATA_0EEFB7:         db $FB, $FB, $0B, $42, $00
DATA_0EEFBC:         db $02, $FB, $0B, $02, $00
DATA_0EEFC1:         db $0E, $0A, $18, $02, $00
DATA_0EEFC6:         db $0E, $02, $08, $02, $00
DATA_0EEFCB:         db $05, $0A, $06, $02, $00
DATA_0EEFD0:         db $06, $08, $12, $02, $00
DATA_0EEFD5:         db $FE, $08, $14, $02, $00
DATA_0EEFDA:         db $06, $00, $05, $02, $00
DATA_0EEFDF:         db $FE, $00, $04, $02, $00
DATA_0EEFE4:         db $F6, $00, $03, $02, $00
DATA_0EEFE9:         db $FC, $0A, $06, $02, $00

; frog table 05
DATA_0EEFEE:         db $04, $FB, $1A, $02, $00
DATA_0EEFF3:         db $FD, $FB, $1A, $02, $00
DATA_0EEFF8:         db $FC, $0A, $06, $02, $00
DATA_0EEFFD:         db $05, $0A, $06, $02, $00
DATA_0EF002:         db $0E, $0A, $18, $02, $00
DATA_0EF007:         db $0E, $02, $08, $02, $00
DATA_0EF00C:         db $00, $00, $01, $02, $02
DATA_0EF011:         db $F8, $00, $00, $02, $02
DATA_0EF016:         db $FE, $0A, $18, $42, $00
DATA_0EF01B:         db $FE, $02, $08, $42, $00

; frog table 06
DATA_0EF020:         db $05, $FB, $1A, $02, $00
DATA_0EF025:         db $FE, $FB, $1A, $02, $00
DATA_0EF02A:         db $FC, $0A, $06, $02, $00
DATA_0EF02F:         db $05, $0A, $06, $02, $00
DATA_0EF034:         db $0E, $0A, $18, $02, $00
DATA_0EF039:         db $0E, $02, $08, $02, $00
DATA_0EF03E:         db $01, $00, $01, $02, $02
DATA_0EF043:         db $F9, $00, $00, $02, $02
DATA_0EF048:         db $FE, $0A, $18, $42, $00
DATA_0EF04D:         db $FE, $02, $08, $42, $00

; frog table 07
DATA_0EF052:         db $06, $FC, $1A, $02, $00
DATA_0EF057:         db $FF, $FC, $1A, $02, $00
DATA_0EF05C:         db $FC, $0A, $06, $02, $00
DATA_0EF061:         db $05, $0A, $06, $02, $00
DATA_0EF066:         db $0E, $0A, $18, $02, $00
DATA_0EF06B:         db $0E, $02, $08, $02, $00
DATA_0EF070:         db $02, $01, $01, $02, $02
DATA_0EF075:         db $FA, $01, $00, $02, $02
DATA_0EF07A:         db $FE, $0A, $18, $42, $00
DATA_0EF07F:         db $FE, $02, $08, $42, $00

; frog table 08
DATA_0EF084:         db $FC, $0A, $06, $02, $00
DATA_0EF089:         db $FD, $00, $15, $02, $00
DATA_0EF08E:         db $05, $0A, $06, $02, $00
DATA_0EF093:         db $0E, $0A, $18, $02, $00
DATA_0EF098:         db $0E, $02, $08, $02, $00
DATA_0EF09D:         db $0D, $02, $1B, $02, $00
DATA_0EF0A2:         db $0E, $FB, $1B, $02, $00
DATA_0EF0A7:         db $09, $08, $13, $02, $00
DATA_0EF0AC:         db $01, $08, $11, $02, $00
DATA_0EF0B1:         db $F9, $08, $10, $02, $00
DATA_0EF0B6:         db $09, $00, $17, $02, $00
DATA_0EF0BB:         db $09, $F8, $07, $02, $00
DATA_0EF0C0:         db $04, $02, $06, $02, $00
DATA_0EF0C5:         db $FE, $0A, $18, $42, $00
DATA_0EF0CA:         db $FE, $02, $08, $42, $00

; frog table 09
DATA_0EF0CF:         db $FC, $FE, $15, $02, $00
DATA_0EF0D4:         db $FC, $0A, $06, $02, $00
DATA_0EF0D9:         db $05, $0A, $06, $02, $00
DATA_0EF0DE:         db $0E, $0A, $18, $02, $00
DATA_0EF0E3:         db $0E, $02, $08, $02, $00
DATA_0EF0E8:         db $0C, $00, $1B, $02, $00
DATA_0EF0ED:         db $0D, $F9, $1B, $02, $00
DATA_0EF0F2:         db $08, $06, $13, $02, $00
DATA_0EF0F7:         db $00, $06, $11, $02, $00
DATA_0EF0FC:         db $F8, $06, $10, $02, $00
DATA_0EF101:         db $08, $FE, $17, $02, $00
DATA_0EF106:         db $08, $F6, $07, $02, $00
DATA_0EF10B:         db $03, $00, $06, $02, $00
DATA_0EF110:         db $FE, $0A, $18, $42, $00
DATA_0EF115:         db $FE, $02, $08, $42, $00

; frog table 0A
DATA_0EF11A:         db $0A, $0D, $19, $02, $00
DATA_0EF11F:         db $01, $0D, $19, $02, $00
DATA_0EF124:         db $04, $FB, $0C, $02, $00
DATA_0EF129:         db $FD, $FB, $0C, $02, $00
DATA_0EF12E:         db $00, $00, $01, $02, $02
DATA_0EF133:         db $F8, $00, $00, $02, $02
DATA_0EF138:         db $04, $0B, $09, $02, $00
DATA_0EF13D:         db $0E, $0B, $09, $02, $00
DATA_0EF142:         db $13, $10, $19, $02, $00
DATA_0EF147:         db $0A, $10, $19, $02, $00

; frog table 0B
DATA_0EF14C:         db $FD, $FE, $0B, $42, $00
DATA_0EF151:         db $04, $FE, $0B, $02, $00
DATA_0EF156:         db $FC, $0B, $06, $02, $00
DATA_0EF15B:         db $05, $0B, $06, $02, $00
DATA_0EF160:         db $0E, $09, $18, $02, $00
DATA_0EF165:         db $0E, $01, $08, $02, $00
DATA_0EF16A:         db $00, $03, $01, $02, $02
DATA_0EF16F:         db $F8, $03, $00, $02, $02
DATA_0EF174:         db $FE, $07, $18, $42, $00
DATA_0EF179:         db $FE, $FF, $08, $42, $00

; frog table 0C
DATA_0EF17E:         db $05, $0B, $06, $02, $00
DATA_0EF183:         db $0E, $09, $18, $02, $00
DATA_0EF188:         db $0E, $01, $08, $02, $00
DATA_0EF18D:         db $04, $FD, $1A, $02, $00
DATA_0EF192:         db $FD, $FD, $1A, $02, $00
DATA_0EF197:         db $08, $0B, $12, $02, $00
DATA_0EF19C:         db $00, $0B, $14, $02, $00
DATA_0EF1A1:         db $08, $03, $05, $02, $00
DATA_0EF1A6:         db $00, $03, $04, $02, $00
DATA_0EF1AB:         db $F8, $03, $03, $02, $00
DATA_0EF1B0:         db $FC, $0B, $06, $02, $00

; frog table 0D
DATA_0EF1B5:         db $FA, $0A, $06, $02, $00
DATA_0EF1BA:         db $03, $0A, $06, $02, $00
DATA_0EF1BF:         db $0E, $01, $08, $02, $00
DATA_0EF1C4:         db $0E, $09, $18, $02, $00
DATA_0EF1C9:         db $0F, $FB, $1A, $02, $00
DATA_0EF1CE:         db $0E, $02, $1A, $02, $00
DATA_0EF1D3:         db $08, $08, $13, $02, $00
DATA_0EF1D8:         db $00, $08, $11, $02, $00
DATA_0EF1DD:         db $F8, $08, $10, $02, $00
DATA_0EF1E2:         db $08, $00, $17, $02, $00
DATA_0EF1E7:         db $08, $F8, $07, $02, $00
DATA_0EF1EC:         db $FC, $00, $15, $02, $00
DATA_0EF1F1:         db $03, $02, $06, $02, $00
DATA_0EF1F6:         db $FE, $0A, $18, $42, $00
DATA_0EF1FB:         db $FE, $02, $08, $42, $00

; frog table 0E
DATA_0EF200:         db $FD, $02, $15, $02, $00
DATA_0EF205:         db $03, $0A, $06, $02, $00
DATA_0EF20A:         db $0E, $08, $18, $02, $00
DATA_0EF20F:         db $0E, $00, $08, $02, $00
DATA_0EF214:         db $11, $06, $1A, $02, $00
DATA_0EF219:         db $12, $FD, $1A, $02, $00
DATA_0EF21E:         db $09, $0A, $13, $02, $00
DATA_0EF223:         db $01, $0A, $11, $02, $00
DATA_0EF228:         db $F9, $0A, $10, $02, $00
DATA_0EF22D:         db $09, $02, $17, $02, $00
DATA_0EF232:         db $09, $FA, $07, $02, $00
DATA_0EF237:         db $04, $04, $06, $02, $00
DATA_0EF23C:         db $FA, $0A, $06, $02, $00
DATA_0EF241:         db $FE, $0A, $18, $42, $00
DATA_0EF246:         db $FE, $02, $08, $42, $00

; frog table 0F
DATA_0EF24B:         db $24, $1C, $0C, $02, $00
DATA_0EF250:         db $1E, $0D, $19, $C2, $00
DATA_0EF255:         db $20, $10, $12, $C2, $00
DATA_0EF25A:         db $28, $0F, $14, $C2, $00
DATA_0EF25F:         db $28, $18, $04, $C2, $00
DATA_0EF264:         db $29, $13, $16, $82, $00
DATA_0EF269:         db $1A, $0E, $09, $02, $00
DATA_0EF26E:         db $20, $18, $05, $C2, $00
DATA_0EF273:         db $22, $0D, $09, $02, $00
DATA_0EF278:         db $2A, $0C, $19, $82, $00
DATA_0EF27D:         db $31, $13, $0D, $02, $00
DATA_0EF282:         db $30, $18, $03, $C2, $00
DATA_0EF287:         db $1D, $08, $19, $C2, $00
DATA_0EF28C:         db $15, $09, $19, $C2, $00
DATA_0EF291:         db $2B, $1C, $0C, $42, $00

; frog table 10
DATA_0EF296:         db $2E, $10, $0D, $02, $00
DATA_0EF29B:         db $1F, $0E, $19, $C2, $00
DATA_0EF2A0:         db $24, $1B, $0C, $02, $00
DATA_0EF2A5:         db $1A, $0D, $09, $02, $00
DATA_0EF2AA:         db $28, $10, $14, $C2, $00
DATA_0EF2AF:         db $29, $12, $16, $02, $00
DATA_0EF2B4:         db $20, $0F, $12, $C2, $00
DATA_0EF2B9:         db $20, $16, $05, $C2, $00
DATA_0EF2BE:         db $28, $19, $04, $C2, $00
DATA_0EF2C3:         db $24, $0C, $09, $02, $00
DATA_0EF2C8:         db $29, $0C, $19, $82, $00
DATA_0EF2CD:         db $30, $1A, $03, $42, $00
DATA_0EF2D2:         db $1F, $07, $19, $C2, $00
DATA_0EF2D7:         db $16, $09, $19, $C2, $00
DATA_0EF2DC:         db $2B, $1D, $0C, $42, $00

DATA_0EF2E1:         db $01, $02, $03, $04, $05, $06, $07, $08
DATA_0EF2E9:         db $09, $0A, $0B, $01, $02, $03, $04, $05
DATA_0EF2F1:         db $06, $07, $08, $09, $0A, $0B, $0B, $0B
DATA_0EF2F9:         db $0B, $0B, $0B, $0B, $0B, $0B, $3B, $F3
DATA_0EF301:         db $40, $F3, $4A, $F3, $59, $F3, $6D, $F3
DATA_0EF309:         db $86, $F3, $A4, $F3, $C7, $F3, $EF, $F3
DATA_0EF311:         db $1C, $F4, $4E, $F4, $85, $F4, $8A, $F4
DATA_0EF319:         db $94, $F4, $A3, $F4, $B7, $F4, $D0, $F4
DATA_0EF321:         db $EE, $F4, $11, $F5, $39, $F5, $66, $F5
DATA_0EF329:         db $98, $F5, $CF, $F5, $06, $F6, $3D, $F6
DATA_0EF331:         db $74, $F6, $AB, $F6, $E2, $F6, $19, $F7
DATA_0EF339:         db $50, $F7, $FC, $04, $0D, $02, $00, $FC
DATA_0EF341:         db $05, $16, $02, $00, $F5, $04, $0D, $02
DATA_0EF349:         db $00, $FC, $03, $16, $82, $00, $F4, $05
DATA_0EF351:         db $16, $02, $00, $ED, $04, $0D, $02, $00
DATA_0EF359:         db $FC, $05, $16, $02, $00, $F4, $03, $16
DATA_0EF361:         db $82, $00, $EC, $05, $16, $02, $00, $E5
DATA_0EF369:         db $04, $0D, $02, $00, $FC, $05, $16, $82
DATA_0EF371:         db $00, $F4, $07, $16, $02, $00, $EC, $05
DATA_0EF379:         db $16, $82, $00, $E4, $07, $16, $02, $00
DATA_0EF381:         db $DD, $06, $0D, $02, $00, $FC, $07, $16
DATA_0EF389:         db $02, $00, $F4, $06, $16, $82, $00, $EC
DATA_0EF391:         db $07, $16, $02, $00, $E4, $06, $16, $82
DATA_0EF399:         db $00, $DC, $07, $16, $02, $00, $D5, $06
DATA_0EF3A1:         db $0D, $02, $00, $FC, $06, $16, $82, $00
DATA_0EF3A9:         db $F4, $07, $16, $02, $00, $EC, $06, $16
DATA_0EF3B1:         db $82, $00, $E4, $07, $16, $02, $00, $DC
DATA_0EF3B9:         db $06, $16, $82, $00, $D4, $07, $16, $02
DATA_0EF3C1:         db $00, $CD, $06, $0D, $02, $00, $FC, $06
DATA_0EF3C9:         db $1C, $02, $00, $F4, $05, $1C, $02, $00
DATA_0EF3D1:         db $EC, $06, $1C, $02, $00, $E4, $05, $1C
DATA_0EF3D9:         db $02, $00, $DC, $06, $1C, $02, $00, $D4
DATA_0EF3E1:         db $05, $1C, $02, $00, $CC, $06, $1C, $02
DATA_0EF3E9:         db $00, $C5, $06, $0D, $02, $00, $FC, $05
DATA_0EF3F1:         db $1C, $02, $00, $F4, $06, $1C, $02, $00
DATA_0EF3F9:         db $EC, $05, $1C, $02, $00, $E4, $06, $1C
DATA_0EF401:         db $02, $00, $DC, $05, $1C, $02, $00, $D4
DATA_0EF409:         db $06, $1C, $02, $00, $CC, $05, $1C, $02
DATA_0EF411:         db $00, $C4, $06, $1C, $02, $00, $BD, $06
DATA_0EF419:         db $0D, $02, $00, $FC, $06, $1C, $02, $00
DATA_0EF421:         db $F4, $06, $1C, $02, $00, $EC, $06, $1C
DATA_0EF429:         db $02, $00, $E4, $06, $1C, $02, $00, $DC
DATA_0EF431:         db $06, $1C, $02, $00, $D4, $06, $1C, $02
DATA_0EF439:         db $00, $CC, $06, $1C, $02, $00, $C4, $06
DATA_0EF441:         db $1C, $02, $00, $BC, $06, $1C, $02, $00
DATA_0EF449:         db $B5, $06, $0D, $02, $00, $B4, $06, $1C
DATA_0EF451:         db $02, $00, $AD, $06, $0D, $02, $00, $FC
DATA_0EF459:         db $06, $1C, $02, $00, $F4, $06, $1C, $02
DATA_0EF461:         db $00, $EC, $06, $1C, $02, $00, $E4, $06
DATA_0EF469:         db $1C, $02, $00, $DC, $06, $1C, $02, $00
DATA_0EF471:         db $D4, $06, $1C, $02, $00, $CC, $06, $1C
DATA_0EF479:         db $02, $00, $C4, $06, $1C, $02, $00, $BC
DATA_0EF481:         db $06, $1C, $02, $00, $02, $FD, $0D, $02
DATA_0EF489:         db $00, $02, $FD, $0A, $02, $00, $03, $F6
DATA_0EF491:         db $0D, $02, $00, $02, $FD, $0A, $42, $00
DATA_0EF499:         db $00, $F5, $0A, $02, $00, $01, $EE, $0D
DATA_0EF4A1:         db $02, $00, $00, $ED, $0A, $02, $00, $00
DATA_0EF4A9:         db $FD, $0A, $02, $00, $02, $F5, $0A, $42
DATA_0EF4B1:         db $00, $01, $E6, $0D, $02, $00, $00, $E5
DATA_0EF4B9:         db $0A, $02, $00, $01, $DE, $0D, $02, $00
DATA_0EF4C1:         db $02, $ED, $0A, $42, $00, $02, $FD, $0A
DATA_0EF4C9:         db $42, $00, $00, $F5, $0A, $02, $00, $00
DATA_0EF4D1:         db $DD, $0A, $02, $00, $01, $E5, $0A, $42
DATA_0EF4D9:         db $00, $00, $ED, $0A, $02, $00, $00, $FD
DATA_0EF4E1:         db $0A, $02, $00, $01, $F5, $0A, $42, $00
DATA_0EF4E9:         db $01, $D6, $0D, $02, $00, $00, $D5, $0A
DATA_0EF4F1:         db $02, $00, $01, $CE, $0D, $02, $00, $01
DATA_0EF4F9:         db $DD, $0A, $42, $00, $00, $E5, $0A, $02
DATA_0EF501:         db $00, $01, $ED, $0A, $42, $00, $01, $FD
DATA_0EF509:         db $0A, $42, $00, $00, $F5, $0A, $02, $00
DATA_0EF511:         db $02, $FD, $1D, $02, $00, $03, $F5, $1D
DATA_0EF519:         db $02, $00, $02, $ED, $1D, $02, $00, $03
DATA_0EF521:         db $E5, $1D, $02, $00, $02, $DD, $1D, $02
DATA_0EF529:         db $00, $03, $D5, $1D, $02, $00, $02, $CD
DATA_0EF531:         db $1D, $02, $00, $02, $C6, $0D, $02, $00
DATA_0EF539:         db $00, $FD, $1D, $42, $00, $01, $F5, $1D
DATA_0EF541:         db $42, $00, $00, $ED, $1D, $42, $00, $01
DATA_0EF549:         db $E5, $1D, $42, $00, $00, $DD, $1D, $42
DATA_0EF551:         db $00, $01, $D5, $1D, $42, $00, $00, $CD
DATA_0EF559:         db $1D, $42, $00, $01, $C5, $1D, $42, $00
DATA_0EF561:         db $01, $BE, $0D, $02, $00, $01, $FD, $1D
DATA_0EF569:         db $42, $00, $01, $F5, $1D, $42, $00, $01
DATA_0EF571:         db $ED, $1D, $42, $00, $01, $E5, $1D, $42
DATA_0EF579:         db $00, $01, $DD, $1D, $42, $00, $01, $D5
DATA_0EF581:         db $1D, $42, $00, $01, $CD, $1D, $42, $00
DATA_0EF589:         db $01, $C5, $1D, $42, $00, $01, $BD, $1D
DATA_0EF591:         db $42, $00, $01, $B6, $0D, $02, $00, $01
DATA_0EF599:         db $FD, $1D, $42, $00, $01, $F5, $1D, $42
DATA_0EF5A1:         db $00, $01, $ED, $1D, $42, $00, $01, $E5
DATA_0EF5A9:         db $1D, $42, $00, $01, $DD, $1D, $42, $00
DATA_0EF5B1:         db $01, $D5, $1D, $42, $00, $01, $CD, $1D
DATA_0EF5B9:         db $42, $00, $01, $C5, $1D, $42, $00, $01
DATA_0EF5C1:         db $BD, $1D, $42, $00, $01, $B5, $1D, $42
DATA_0EF5C9:         db $00, $01, $AE, $0D, $02, $00, $B4, $06
DATA_0EF5D1:         db $1C, $02, $00, $AD, $06, $0D, $02, $00
DATA_0EF5D9:         db $FC, $06, $1C, $02, $00, $F4, $07, $1C
DATA_0EF5E1:         db $02, $00, $EC, $07, $1C, $02, $00, $E4
DATA_0EF5E9:         db $08, $1C, $02, $00, $DC, $08, $1C, $02
DATA_0EF5F1:         db $00, $D4, $08, $1C, $02, $00, $CC, $08
DATA_0EF5F9:         db $1C, $02, $00, $C4, $07, $1C, $02, $00
DATA_0EF601:         db $BC, $07, $1C, $02, $00, $B4, $06, $1C
DATA_0EF609:         db $02, $00, $AD, $06, $0D, $02, $00, $FC
DATA_0EF611:         db $06, $1C, $02, $00, $F4, $05, $1C, $02
DATA_0EF619:         db $00, $EC, $05, $1C, $02, $00, $E4, $04
DATA_0EF621:         db $1C, $02, $00, $DC, $04, $1C, $02, $00
DATA_0EF629:         db $D4, $04, $1C, $02, $00, $CC, $04, $1C
DATA_0EF631:         db $02, $00, $C4, $05, $1C, $02, $00, $BC
DATA_0EF639:         db $05, $1C, $02, $00, $B4, $06, $1C, $02
DATA_0EF641:         db $00, $AD, $06, $0D, $02, $00, $FC, $06
DATA_0EF649:         db $1C, $02, $00, $F4, $06, $1C, $02, $00
DATA_0EF651:         db $EC, $07, $1C, $02, $00, $E4, $07, $1C
DATA_0EF659:         db $02, $00, $DC, $08, $1C, $02, $00, $D4
DATA_0EF661:         db $08, $1C, $02, $00, $CC, $07, $1C, $02
DATA_0EF669:         db $00, $C4, $07, $1C, $02, $00, $BC, $06
DATA_0EF671:         db $1C, $02, $00, $B4, $06, $1C, $02, $00
DATA_0EF679:         db $AD, $06, $0D, $02, $00, $FC, $06, $1C
DATA_0EF681:         db $02, $00, $F4, $06, $1C, $02, $00, $EC
DATA_0EF689:         db $05, $1C, $02, $00, $E4, $05, $1C, $02
DATA_0EF691:         db $00, $DC, $04, $1C, $02, $00, $D4, $04
DATA_0EF699:         db $1C, $02, $00, $CC, $05, $1C, $02, $00
DATA_0EF6A1:         db $C4, $05, $1C, $02, $00, $BC, $06, $1C
DATA_0EF6A9:         db $02, $00, $01, $FD, $1D, $42, $00, $02
DATA_0EF6B1:         db $F5, $1D, $42, $00, $02, $ED, $1D, $42
DATA_0EF6B9:         db $00, $03, $E5, $1D, $42, $00, $03, $DD
DATA_0EF6C1:         db $1D, $42, $00, $03, $D5, $1D, $42, $00
DATA_0EF6C9:         db $03, $CD, $1D, $42, $00, $02, $C5, $1D
DATA_0EF6D1:         db $42, $00, $02, $BD, $1D, $42, $00, $01
DATA_0EF6D9:         db $B5, $1D, $42, $00, $01, $AE, $0D, $02
DATA_0EF6E1:         db $00, $01, $FD, $1D, $42, $00, $00, $F5
DATA_0EF6E9:         db $1D, $42, $00, $00, $ED, $1D, $42, $00
DATA_0EF6F1:         db $FF, $E5, $1D, $42, $00, $FF, $DD, $1D
DATA_0EF6F9:         db $42, $00, $FF, $D5, $1D, $42, $00, $FF
DATA_0EF701:         db $CD, $1D, $42, $00, $00, $C5, $1D, $42
DATA_0EF709:         db $00, $00, $BD, $1D, $42, $00, $01, $B5
DATA_0EF711:         db $1D, $42, $00, $01, $AE, $0D, $02, $00
DATA_0EF719:         db $01, $FD, $1D, $42, $00, $01, $F5, $1D
DATA_0EF721:         db $42, $00, $00, $ED, $1D, $42, $00, $00
DATA_0EF729:         db $E5, $1D, $42, $00, $FF, $DD, $1D, $42
DATA_0EF731:         db $00, $FF, $D5, $1D, $42, $00, $00, $CD
DATA_0EF739:         db $1D, $42, $00, $00, $C5, $1D, $42, $00
DATA_0EF741:         db $01, $BD, $1D, $42, $00, $01, $B5, $1D
DATA_0EF749:         db $42, $00, $01, $AE, $0D, $02, $00, $01
DATA_0EF751:         db $FD, $1D, $42, $00, $01, $F5, $1D, $42
DATA_0EF759:         db $00, $02, $ED, $1D, $42, $00, $02, $E5
DATA_0EF761:         db $1D, $42, $00, $03, $DD, $1D, $42, $00
DATA_0EF769:         db $03, $D5, $1D, $42, $00, $02, $CD, $1D
DATA_0EF771:         db $42, $00, $02, $C5, $1D, $42, $00, $01
DATA_0EF779:         db $BD, $1D, $42, $00, $01, $B5, $1D, $42
DATA_0EF781:         db $00, $01, $AE, $0D, $02, $00, $00, $00
DATA_0EF789:         db $00, $02, $02, $00, $00, $00, $00, $00
DATA_0EF791:         db $00, $00, $02, $00, $00, $00, $00, $00
DATA_0EF799:         db $00, $00, $00, $00, $00, $BA, $F7, $BA
DATA_0EF7A1:         db $F7, $00, $00, $00, $00, $00, $00, $00
DATA_0EF7A9:         db $00, $00, $00, $00, $00, $00, $00, $C4
DATA_0EF7B1:         db $F7, $00, $00, $00, $00, $00, $00, $00
DATA_0EF7B9:         db $00, $FE, $0A, $18, $42, $00, $FE, $02
DATA_0EF7C1:         db $08, $42, $00, $FE, $09, $18, $42, $00
DATA_0EF7C9:         db $FE, $01, $08, $42, $00

.headbop_frog
    LDA $60AC           ; $0EF7CE   |
    CMP #$0002          ; $0EF7D1   |
    BEQ CODE_0EF7DF     ; $0EF7D4   |
    LDA #$000C          ; $0EF7D6   |
    STA $6124           ; $0EF7D9   |
    JSR CODE_0EEB53     ; $0EF7DC   |

CODE_0EF7DF:
    JSL $0EE023         ; $0EF7DF   |
    LDA $7A96,x         ; $0EF7E3   |
    BNE CODE_0EF7FC     ; $0EF7E6   |
    LDA $105C           ; $0EF7E8   |
    CMP #$0100          ; $0EF7EB   |
    BCC CODE_0EF7F5     ; $0EF7EE   |
    JSL $028925         ; $0EF7F0   |
    RTL                 ; $0EF7F4   |


CODE_0EF7F5:
    ADC #$0002          ; $0EF7F5   |
    STA $105C           ; $0EF7F8   |
    RTL                 ; $0EF7FB   |

CODE_0EF7FC:
    CMP #$0040          ; $0EF7FC   |
    BNE CODE_0EF81A     ; $0EF7FF   |
    LDA $608C           ; $0EF801   |
    STA $00             ; $0EF804   |
    LDA $6090           ; $0EF806   |
    CLC                 ; $0EF809   |
    ADC #$0008          ; $0EF80A   |
    STA $02             ; $0EF80D   |
    JSL $02E19C         ; $0EF80F   |
    LDA #$001A          ; $0EF813   |
    STA $60AC           ; $0EF816   |
    RTL                 ; $0EF819   |

CODE_0EF81A:
    BCC CODE_0EF837     ; $0EF81A   |
    LDY #$0F            ; $0EF81C   |
    LDA $14             ; $0EF81E   |
    BIT #$0004          ; $0EF820   |
    BEQ CODE_0EF833     ; $0EF823   |
    AND #$0003          ; $0EF825   |
    BNE CODE_0EF831     ; $0EF828   |
    LDA #$005E          ; $0EF82A   |\ play sound #$005E
    JSL $0085D2         ; $0EF82D   |/

CODE_0EF831:
    LDY #$10            ; $0EF831   |

CODE_0EF833:
    TYA                 ; $0EF833   |
    STA $7402,x         ; $0EF834   |

CODE_0EF837:
    RTL                 ; $0EF837   |

DATA_0EF838:         dw $FF00, $0100

.init_fishin_lakitu
    LDY $021A           ; $0EF83C   |
    CPY #$26            ; $0EF83F   |
    BNE CODE_0EF847     ; $0EF841   |
    LDY #$02            ; $0EF843   |
    STY $78,x           ; $0EF845   |

CODE_0EF847:
    LDA #$0100          ; $0EF847   |
    STA $7222,x         ; $0EF84A   |
    LDY $7400,x         ; $0EF84D   |
    LDA $F838,y         ; $0EF850   |
    STA $7220,x         ; $0EF853   |
    STZ $7400,x         ; $0EF856   |
    STZ $100D           ; $0EF859   |
    STZ $100B           ; $0EF85C   |
    STZ $100F           ; $0EF85F   |
    RTL                 ; $0EF862   |

DATA_0EF863:         dw $FD11
DATA_0EF865:         dw $FD37
DATA_0EF867:         dw $FDC7
DATA_0EF869:         dw $FE57
DATA_0EF86B:         dw $FE7B
DATA_0EF86D:         dw $FE7F

.main_fishin_lakitu
    JSR CODE_0EF9FE     ; $0EF86F   |
    JSR CODE_0EF98E     ; $0EF872   |
    JSL $03AF23         ; $0EF875   |
    JSR CODE_0EFBC0     ; $0EF879   |
    TXY                 ; $0EF87C   |
    LDA $76,x           ; $0EF87D   |
    ASL A               ; $0EF87F   |
    TAX                 ; $0EF880   |
    JSR ($F863,x)       ; $0EF881   |

    JSR CODE_0EFC6F     ; $0EF884   |
    JSR CODE_0EFCD5     ; $0EF887   |
    LDA $7220,x         ; $0EF88A   |
    CLC                 ; $0EF88D   |
    ADC #$0300          ; $0EF88E   |
    CMP #$0600          ; $0EF891   |
    BCC CODE_0EF8A4     ; $0EF894   |
    LDA #$0300          ; $0EF896   |
    LDY $7221,x         ; $0EF899   |
    BPL CODE_0EF8A1     ; $0EF89C   |
    LDA #$FD00          ; $0EF89E   |

CODE_0EF8A1:
    STA $7220,x         ; $0EF8A1   |

CODE_0EF8A4:
    LDA $7222,x         ; $0EF8A4   |
    CLC                 ; $0EF8A7   |
    ADC #$0300          ; $0EF8A8   |
    CMP #$0600          ; $0EF8AB   |
    BCC CODE_0EF8BE     ; $0EF8AE   |
    LDA #$0300          ; $0EF8B0   |
    LDY $7223,x         ; $0EF8B3   |
    BPL CODE_0EF8BB     ; $0EF8B6   |
    LDA #$FD00          ; $0EF8B8   |

CODE_0EF8BB:
    STA $7222,x         ; $0EF8BB   |

CODE_0EF8BE:
    JSR CODE_0EFAF6     ; $0EF8BE   |
    JSR CODE_0EFB1F     ; $0EF8C1   |
    JSR CODE_0EFA93     ; $0EF8C4   |
    RTL                 ; $0EF8C7   |

; gsu table
DATA_0EF8C8:         db $FD, $FA, $04, $02, $02, $03, $F3, $0D
DATA_0EF8D0:         db $02, $00, $FC, $04, $08, $04, $02, $04
DATA_0EF8D8:         db $04, $08, $44, $02, $09, $FD, $1D, $00
DATA_0EF8E0:         db $00, $FD, $FA, $04, $02, $02, $04, $F3
DATA_0EF8E8:         db $0D, $02, $00, $FC, $04, $08, $04, $02
DATA_0EF8F0:         db $04, $04, $08, $44, $02, $09, $FD, $1D
DATA_0EF8F8:         db $00, $00, $01, $F5, $02, $02, $02, $08
DATA_0EF900:         db $F0, $0D, $02, $00, $FC, $04, $08, $04
DATA_0EF908:         db $02, $04, $04, $08, $44, $02, $0A, $FD
DATA_0EF910:         db $1D, $00, $00, $FD, $FA, $04, $02, $02
DATA_0EF918:         db $FC, $04, $08, $04, $02, $04, $04, $08
DATA_0EF920:         db $44, $02, $04, $F3, $0D, $02, $00, $09
DATA_0EF928:         db $FE, $1D, $00, $00, $FE, $F5, $02, $02
DATA_0EF930:         db $02, $05, $F0, $0D, $02, $00, $FC, $04
DATA_0EF938:         db $08, $04, $02, $04, $04, $08, $44, $02
DATA_0EF940:         db $0A, $FD, $1D, $00, $00, $FE, $F7, $02
DATA_0EF948:         db $02, $02, $05, $F2, $0D, $02, $00, $FC
DATA_0EF950:         db $04, $08, $04, $02, $04, $04, $08, $44
DATA_0EF958:         db $02, $0A, $FD, $1D, $00, $00, $FF, $FB
DATA_0EF960:         db $02, $02, $02, $02, $F5, $0D, $42, $00
DATA_0EF968:         db $02, $F5, $0D, $42, $00, $02, $F5, $0D
DATA_0EF970:         db $42, $00, $01, $00, $06, $02, $02

DATA_0EF977:         dw $FF00, $0100

CODE_0EF97B:
    LDA $7CD6,x         ; $0EF97B   |
    STA $00             ; $0EF97E   |
    LDA $7CD8,x         ; $0EF980   |
    STA $02             ; $0EF983   |
    LDA #$01E6          ; $0EF985   |
    JSL $03B56E         ; $0EF988   |
    BRA CODE_0EF9C6     ; $0EF98C   |

CODE_0EF98E:
    LDA $6F00,x         ; $0EF98E   |
    CMP #$0008          ; $0EF991   |
    BNE CODE_0EF9F9     ; $0EF994   |
    LDA #$011C          ; $0EF996   |
    JSL $03A364         ; $0EF999   |
    BCC CODE_0EF9F9     ; $0EF99D   |
    LDA $70E2,x         ; $0EF99F   |
    STA $70E2,y         ; $0EF9A2   |
    LDA $7182,x         ; $0EF9A5   |
    STA $7182,y         ; $0EF9A8   |
    LDA #$0008          ; $0EF9AB   |
    STA $6F00,y         ; $0EF9AE   |
    TYA                 ; $0EF9B1   |
    INC A               ; $0EF9B2   |
    STA $6162           ; $0EF9B3   |
    LDA $7040,x         ; $0EF9B6   |
    AND #$FFF3          ; $0EF9B9   |
    STA $7040,x         ; $0EF9BC   |
    TXA                 ; $0EF9BF   |
    INC A               ; $0EF9C0   |
    STA $7976,y         ; $0EF9C1   |
    STY $18,x           ; $0EF9C4   |

CODE_0EF9C6:
    JSR CODE_0ECCC7     ; $0EF9C6   |
    LDA #$000E          ; $0EF9C9   |
    STA $6F00,x         ; $0EF9CC   |
    LDA #$0040          ; $0EF9CF   |
    STA $7542,x         ; $0EF9D2   |
    LDA #$0400          ; $0EF9D5   |
    STA $75E2,x         ; $0EF9D8   |
    LDA #$0006          ; $0EF9DB   |
    STA $7402,x         ; $0EF9DE   |
    LDA #$FFFF          ; $0EF9E1   |
    STA $7AF8,x         ; $0EF9E4   |
    LDY #$00            ; $0EF9E7   |
    LDA $7220,x         ; $0EF9E9   |
    BMI CODE_0EF9F0     ; $0EF9EC   |
    INY                 ; $0EF9EE   |
    INY                 ; $0EF9EF   |

CODE_0EF9F0:
    LDA $F977,y         ; $0EF9F0   |
    STA $7220,x         ; $0EF9F3   |
    STZ $7540,x         ; $0EF9F6   |

CODE_0EF9F9:
    RTS                 ; $0EF9F9   |

DATA_0EF9FA:         dw $0003, $0002

CODE_0EF9FE:
    STZ $0C             ; $0EF9FE   |
    STZ $0E             ; $0EFA00   |
    LDA $7362,x         ; $0EFA02   |
    STA $3008           ; $0EFA05   |
    BMI CODE_0EF9F9     ; $0EFA08   |
    LDY $74A2,x         ; $0EFA0A   |
    BMI CODE_0EF9F9     ; $0EFA0D   |
    LDY $7402,x         ; $0EFA0F   |
    CPY #$03            ; $0EFA12   |
    BPL CODE_0EFA59     ; $0EFA14   |
    TXA                 ; $0EFA16   |
    STA $3014           ; $0EFA17   |
    LDA $100B           ; $0EFA1A   |
    STA $3010           ; $0EFA1D   |
    LDY $7902,x         ; $0EFA20   |
    LDA $F9FA,y         ; $0EFA23   |
    STA $300C           ; $0EFA26   |
    LDY $1010           ; $0EFA29   |
    TYA                 ; $0EFA2C   |
    STA $3016           ; $0EFA2D   |
    LDX #$0B            ; $0EFA30   |
    LDA #$95E6          ; $0EFA32   |
    JSL $7EDE44         ; $0EFA35   | GSU init
    LDX $12             ; $0EFA39   |
    LDA $3002           ; $0EFA3B   |
    SEC                 ; $0EFA3E   |
    SBC $7680,x         ; $0EFA3F   |
    STA $0C             ; $0EFA42   |
    CLC                 ; $0EFA44   |
    ADC $3012           ; $0EFA45   |
    STA $08             ; $0EFA48   |
    LDA $3004           ; $0EFA4A   |
    SEC                 ; $0EFA4D   |
    SBC $7682,x         ; $0EFA4E   |
    STA $0E             ; $0EFA51   |
    CLC                 ; $0EFA53   |
    ADC #$0008          ; $0EFA54   |
    STA $0A             ; $0EFA57   |

CODE_0EFA59:
    TXA                 ; $0EFA59   |
    STA $3014           ; $0EFA5A   |
    LDA #$000E          ; $0EFA5D   |
    STA $3000           ; $0EFA60   |
    LDA #$F8C8          ; $0EFA63   |
    STA $301C           ; $0EFA66   |
    LDA $7680,x         ; $0EFA69   |
    STA $3002           ; $0EFA6C   |
    LDA $7682,x         ; $0EFA6F   |
    STA $3004           ; $0EFA72   |
    LDA $7400,x         ; $0EFA75   |
    STA $3010           ; $0EFA78   |
    LDA #$0005          ; $0EFA7B   |
    STA $3018           ; $0EFA7E   |
    LDA $7402,x         ; $0EFA81   |
    STA $3006           ; $0EFA84   |
    LDX #$08            ; $0EFA87   |
    LDA #$A16C          ; $0EFA89   |
    JSL $7EDE44         ; $0EFA8C   | GSU init
    LDX $12             ; $0EFA90   |
    RTS                 ; $0EFA92   |

CODE_0EFA93:
    LDY $7D36,x         ; $0EFA93   |
    BPL CODE_0EFAF5     ; $0EFA96   |
    LDA $7C18,x         ; $0EFA98   |
    SEC                 ; $0EFA9B   |
    SBC $7BB8,x         ; $0EFA9C   |
    SEC                 ; $0EFA9F   |
    SBC $6122           ; $0EFAA0   |
    CMP #$FFF8          ; $0EFAA3   |
    BCC CODE_0EFAEB     ; $0EFAA6   |
    LDY $60AB           ; $0EFAA8   |
    BMI CODE_0EFAF5     ; $0EFAAB   |
    LDY $60C0           ; $0EFAAD   |
    BEQ CODE_0EFAF5     ; $0EFAB0   |
    LDA $60FC           ; $0EFAB2   |
    AND #$0018          ; $0EFAB5   |
    BNE CODE_0EFAC6     ; $0EFAB8   |
    LDA #$FC00          ; $0EFABA   |
    STA $60AA           ; $0EFABD   |
    LDA #$0006          ; $0EFAC0   |
    STA $60C0           ; $0EFAC3   |

CODE_0EFAC6:
    LDA #$011C          ; $0EFAC6   |
    JSL $03A34C         ; $0EFAC9   |
    BCC CODE_0EFAF5     ; $0EFACD   |
    LDA $70E2,x         ; $0EFACF   |
    STA $70E2,y         ; $0EFAD2   |
    LDA $7182,x         ; $0EFAD5   |
    CLC                 ; $0EFAD8   |
    ADC #$0004          ; $0EFAD9   |
    STA $7182,y         ; $0EFADC   |
    TXA                 ; $0EFADF   |
    INC A               ; $0EFAE0   |
    STA $7976,y         ; $0EFAE1   |
    STY $18,x           ; $0EFAE4   |
    JSR CODE_0EF9C6     ; $0EFAE6   |
    PLA                 ; $0EFAE9   |
    RTL                 ; $0EFAEA   |

CODE_0EFAEB:
    PLA                 ; $0EFAEB   |
    STA $00             ; $0EFAEC   |
    JSL $03A5B7         ; $0EFAEE   |
    LDA $00             ; $0EFAF2   |
    PHA                 ; $0EFAF4   |

CODE_0EFAF5:
    RTS                 ; $0EFAF5   |

CODE_0EFAF6:
    LDY $7D36,x         ; $0EFAF6   |
    DEY                 ; $0EFAF9   |
    BMI CODE_0EFAF5     ; $0EFAFA   |
    LDA $6F00,y         ; $0EFAFC   |
    CMP #$0010          ; $0EFAFF   |
    BNE CODE_0EFAF5     ; $0EFB02   |
    LDA $7D38,y         ; $0EFB04   |
    BEQ CODE_0EFAF5     ; $0EFB07   |
    TYX                 ; $0EFB09   |
    JSL $03B24B         ; $0EFB0A   |
    JSR CODE_0EF97B     ; $0EFB0E   |
    PLA                 ; $0EFB11   |
    RTL                 ; $0EFB12   |

DATA_0EFB13:         dw $FFF4, $FFFA, $FFFD

DATA_0EFB19:         dw $FFF0, $FFEA, $FFE8

CODE_0EFB1F:
    LDA $7AF8,x         ; $0EFB1F   |
    BNE CODE_0EFAF5     ; $0EFB22   |
    LDY $7902,x         ; $0EFB24   |
    BNE CODE_0EFB65     ; $0EFB27   |
    LDA $7CD6           ; $0EFB29   |
    SEC                 ; $0EFB2C   |
    SBC $7CD6,x         ; $0EFB2D   |
    SEC                 ; $0EFB30   |
    SBC $0C             ; $0EFB31   |
    CLC                 ; $0EFB33   |
    ADC #$0008          ; $0EFB34   |
    CMP #$0010          ; $0EFB37   |
    BCS CODE_0EFB64     ; $0EFB3A   |
    LDA $7CD8           ; $0EFB3C   |
    SEC                 ; $0EFB3F   |
    SBC $7CD8,x         ; $0EFB40   |
    SEC                 ; $0EFB43   |
    SBC $0E             ; $0EFB44   |
    CLC                 ; $0EFB46   |
    ADC #$0008          ; $0EFB47   |
    CMP #$0010          ; $0EFB4A   |
    BCS CODE_0EFB64     ; $0EFB4D   |
    JSR CODE_0ED3C4     ; $0EFB4F   |
    BCS CODE_0EFB64     ; $0EFB52   |
    LDA #$FEC0          ; $0EFB54   |
    STA $7900,x         ; $0EFB57   |
    LDA #$0002          ; $0EFB5A   |
    STA $7402,x         ; $0EFB5D   |
    LDY #$02            ; $0EFB60   |
    STY $76,x           ; $0EFB62   |

CODE_0EFB64:
    RTS                 ; $0EFB64   |

CODE_0EFB65:
    LDA $6F00           ; $0EFB65   |
    CMP #$0010          ; $0EFB68   |
    BEQ CODE_0EFB79     ; $0EFB6B   |
    LDY $7902           ; $0EFB6D   |
    BEQ CODE_0EFB76     ; $0EFB70   |
    CPX $18             ; $0EFB72   |
    BEQ CODE_0EFB79     ; $0EFB74   |

CODE_0EFB76:
    JMP CODE_0ECCC7     ; $0EFB76   |

CODE_0EFB79:
    STZ $7222           ; $0EFB79   |
    LDA $0C             ; $0EFB7C   |
    ORA $0E             ; $0EFB7E   |
    BNE CODE_0EFBA7     ; $0EFB80   |
    LDA $7402,x         ; $0EFB82   |
    SEC                 ; $0EFB85   |
    SBC #$0003          ; $0EFB86   |
    ASL A               ; $0EFB89   |
    TAY                 ; $0EFB8A   |
    LDA $FB19,y         ; $0EFB8B   |
    CLC                 ; $0EFB8E   |
    ADC $7182,x         ; $0EFB8F   |
    STA $7182           ; $0EFB92   |
    LDA $FB13,y         ; $0EFB95   |
    LDY $7400,x         ; $0EFB98   |
    BEQ CODE_0EFBA1     ; $0EFB9B   |
    EOR #$FFFF          ; $0EFB9D   |
    INC A               ; $0EFBA0   |

CODE_0EFBA1:
    CLC                 ; $0EFBA1   |
    ADC $70E2,x         ; $0EFBA2   |
    BRA CODE_0EFBB6     ; $0EFBA5   |

CODE_0EFBA7:
    LDA $7182,x         ; $0EFBA7   |
    CLC                 ; $0EFBAA   |
    ADC $0A             ; $0EFBAB   |
    STA $7182           ; $0EFBAD   |
    LDA $70E2,x         ; $0EFBB0   |
    CLC                 ; $0EFBB3   |
    ADC $08             ; $0EFBB4   |

CODE_0EFBB6:
    STA $70E2           ; $0EFBB6   |
    LDY $7400,x         ; $0EFBB9   |
    STY $7400           ; $0EFBBC   |
    RTS                 ; $0EFBBF   |

CODE_0EFBC0:
    LDA $70E2,x         ; $0EFBC0   |
    SEC                 ; $0EFBC3   |
    SBC $7E18           ; $0EFBC4   |
    BMI CODE_0EFBD6     ; $0EFBC7   |
    LDA $70E2,x         ; $0EFBC9   |
    SEC                 ; $0EFBCC   |
    SBC #$0100          ; $0EFBCD   |
    SEC                 ; $0EFBD0   |
    SBC $7E1A           ; $0EFBD1   |
    BMI CODE_0EFBDD     ; $0EFBD4   |

CODE_0EFBD6:
    EOR $7220,x         ; $0EFBD6   |
    BMI CODE_0EFC0C     ; $0EFBD9   |
    BRA CODE_0EFBEE     ; $0EFBDB   |

CODE_0EFBDD:
    LDA $7860,x         ; $0EFBDD   |
    BIT #$000C          ; $0EFBE0   |
    BEQ CODE_0EFC0C     ; $0EFBE3   |
    AND #$0008          ; $0EFBE5   |
    DEC A               ; $0EFBE8   |
    EOR $7220,x         ; $0EFBE9   |
    BPL CODE_0EFC0C     ; $0EFBEC   |

CODE_0EFBEE:
    LDA $75E0,x         ; $0EFBEE   |
    EOR #$FFFF          ; $0EFBF1   |
    INC A               ; $0EFBF4   |
    STA $75E0,x         ; $0EFBF5   |
    LDA $7220,x         ; $0EFBF8   |
    EOR #$FFFF          ; $0EFBFB   |
    INC A               ; $0EFBFE   |
    STA $7220,x         ; $0EFBFF   |
    LDA $70E2,x         ; $0EFC02   |
    SEC                 ; $0EFC05   |
    SBC $72C0,x         ; $0EFC06   |
    STA $70E2,x         ; $0EFC09   |

CODE_0EFC0C:
    LDA $7182,x         ; $0EFC0C   |
    SEC                 ; $0EFC0F   |
    SBC $7E1C           ; $0EFC10   |
    BMI CODE_0EFC22     ; $0EFC13   |
    LDA $7182,x         ; $0EFC15   |
    SEC                 ; $0EFC18   |
    SBC #$0100          ; $0EFC19   |
    SEC                 ; $0EFC1C   |
    SBC $7E1E           ; $0EFC1D   |
    BMI CODE_0EFC27     ; $0EFC20   |

CODE_0EFC22:
    EOR $7222,x         ; $0EFC22   |
    BPL CODE_0EFC56     ; $0EFC25   |

CODE_0EFC27:
    LDA $70E2,x         ; $0EFC27   |
    CLC                 ; $0EFC2A   |
    ADC #$0008          ; $0EFC2B   |
    STA $3010           ; $0EFC2E   |
    LDA $7182,x         ; $0EFC31   |
    CLC                 ; $0EFC34   |
    ADC #$0014          ; $0EFC35   |
    STA $3000           ; $0EFC38   |
    LDX #$0A            ; $0EFC3B   |
    LDA #$CE2F          ; $0EFC3D   |
    JSL $7EDE91         ; $0EFC40   | GSU init
    LDX $12             ; $0EFC44   |
    LDA $300E           ; $0EFC46   |
    AND #$0002          ; $0EFC49   |
    BNE CODE_0EFC56     ; $0EFC4C   |
    LDA $7860,x         ; $0EFC4E   |
    AND #$0002          ; $0EFC51   |
    BEQ CODE_0EFC6A     ; $0EFC54   |

CODE_0EFC56:
    LDA $7222,x         ; $0EFC56   |
    EOR #$FFFF          ; $0EFC59   |
    INC A               ; $0EFC5C   |
    STA $7222,x         ; $0EFC5D   |
    LDA $7182,x         ; $0EFC60   |
    SEC                 ; $0EFC63   |
    SBC $72C2,x         ; $0EFC64   |
    STA $7182,x         ; $0EFC67   |

CODE_0EFC6A:
    RTS                 ; $0EFC6A   |

DATA_0EFC6B:         dw $0010, $0014

CODE_0EFC6F:
    LDA $100F           ; $0EFC6F   |
    CLC                 ; $0EFC72   |
    ADC $7900,x         ; $0EFC73   |
    BPL CODE_0EFC7B     ; $0EFC76   |
    LDA #$0000          ; $0EFC78   |

CODE_0EFC7B:
    CMP #$4001          ; $0EFC7B   |
    BPL CODE_0EFC83     ; $0EFC7E   |
    STA $100F           ; $0EFC80   |

CODE_0EFC83:
    LDA $100F           ; $0EFC83   |
    CLC                 ; $0EFC86   |
    ADC #$0700          ; $0EFC87   |
    AND #$F800          ; $0EFC8A   |
    CLC                 ; $0EFC8D   |
    ADC #$3802          ; $0EFC8E   |
    STA $7040,x         ; $0EFC91   |
    LDA $7220,x         ; $0EFC94   |
    EOR $100B           ; $0EFC97   |
    BPL CODE_0EFCC6     ; $0EFC9A   |
    LDA $7220,x         ; $0EFC9C   |
    SEC                 ; $0EFC9F   |
    SBC $100D           ; $0EFCA0   |
    BEQ CODE_0EFCD4     ; $0EFCA3   |
    STA $3000           ; $0EFCA5   |
    LDY $7902,x         ; $0EFCA8   |
    LDA $FC6B,y         ; $0EFCAB   |
    STA $300C           ; $0EFCAE   |
    LDX #$0B            ; $0EFCB1   |
    LDA #$86B6          ; $0EFCB3   |
    JSL $7EDE44         ; $0EFCB6   | GSU init
    LDX $12             ; $0EFCBA   |
    LDA $3000           ; $0EFCBC   |
    CLC                 ; $0EFCBF   |
    ADC $100D           ; $0EFCC0   |
    STA $100D           ; $0EFCC3   |

CODE_0EFCC6:
    LDA $100D           ; $0EFCC6   |
    SEC                 ; $0EFCC9   |
    SBC $7220,x         ; $0EFCCA   |
    CLC                 ; $0EFCCD   |
    ADC $100B           ; $0EFCCE   |
    STA $100B           ; $0EFCD1   |

CODE_0EFCD4:
    RTS                 ; $0EFCD4   |

CODE_0EFCD5:
    LDA $0CEE           ; $0EFCD5   |
    BNE CODE_0EFD10     ; $0EFCD8   |
    LDA #$01F8          ; $0EFCDA   |
    JSL $008B21         ; $0EFCDD   |
    LDA #$0002          ; $0EFCE1   |
    STA $73C2,y         ; $0EFCE4   |
    LDA $10             ; $0EFCE7   |
    AND #$0003          ; $0EFCE9   |
    SEC                 ; $0EFCEC   |
    SBC #$000A          ; $0EFCED   |
    CLC                 ; $0EFCF0   |
    ADC $7CD6,x         ; $0EFCF1   |
    STA $70A2,y         ; $0EFCF4   |
    LDA $10             ; $0EFCF7   |
    AND #$0007          ; $0EFCF9   |
    SEC                 ; $0EFCFC   |
    SBC #$000C          ; $0EFCFD   |
    CLC                 ; $0EFD00   |
    ADC $7CD8,x         ; $0EFD01   |
    STA $7142,y         ; $0EFD04   |
    LDA #$0008          ; $0EFD07   |
    STA $7782,y         ; $0EFD0A   |
    STA $0CEE           ; $0EFD0D   |

CODE_0EFD10:
    RTS                 ; $0EFD10   |

    TYX                 ; $0EFD11   |
    LDA $7CD6,x         ; $0EFD12   |
    SEC                 ; $0EFD15   |
    SBC $7CD6           ; $0EFD16   |
    CLC                 ; $0EFD19   |
    ADC #$0040          ; $0EFD1A   |
    CMP #$0080          ; $0EFD1D   |
    BCS CODE_0EFD2A     ; $0EFD20   |
    LDA #$0200          ; $0EFD22   |
    STA $7900,x         ; $0EFD25   |
    INC $76,x           ; $0EFD28   |

CODE_0EFD2A:
    RTS                 ; $0EFD2A   |

DATA_0EFD2B:         dw $0040, $0080, $0020, $0040
DATA_0EFD33:         dw $FFE0, $FFD0

    TYX                 ; $0EFD37   |
    LDY $77C2,x         ; $0EFD38   |
    TYA                 ; $0EFD3B   |
    STA $7400,x         ; $0EFD3C   |
    LDA $7CD6           ; $0EFD3F   |
    SEC                 ; $0EFD42   |
    SBC $7CD6,x         ; $0EFD43   |
    SEC                 ; $0EFD46   |
    SBC $0C             ; $0EFD47   |
    PHP                 ; $0EFD49   |
    BPL CODE_0EFD50     ; $0EFD4A   |
    EOR #$FFFF          ; $0EFD4C   |
    INC A               ; $0EFD4F   |

CODE_0EFD50:
    LSR A               ; $0EFD50   |
    CMP #$0018          ; $0EFD51   |
    BMI CODE_0EFD59     ; $0EFD54   |
    LDA #$0018          ; $0EFD56   |

CODE_0EFD59:
    CLC                 ; $0EFD59   |
    ADC #$0018          ; $0EFD5A   |
    STA $7540,x         ; $0EFD5D   |
    ASL A               ; $0EFD60   |
    ASL A               ; $0EFD61   |
    ASL A               ; $0EFD62   |
    PLP                 ; $0EFD63   |
    BPL CODE_0EFD6A     ; $0EFD64   |
    EOR #$FFFF          ; $0EFD66   |
    INC A               ; $0EFD69   |

CODE_0EFD6A:
    STA $75E0,x         ; $0EFD6A   |
    LDA $7CD8           ; $0EFD6D   |
    SEC                 ; $0EFD70   |
    SBC $7CD8,x         ; $0EFD71   |
    SEC                 ; $0EFD74   |
    SBC $0E             ; $0EFD75   |
    SEC                 ; $0EFD77   |
    SBC #$0010          ; $0EFD78   |
    PHP                 ; $0EFD7B   |
    BPL CODE_0EFD82     ; $0EFD7C   |
    EOR #$FFFF          ; $0EFD7E   |
    INC A               ; $0EFD81   |

CODE_0EFD82:
    LSR A               ; $0EFD82   |
    CMP #$0018          ; $0EFD83   |
    BMI CODE_0EFD8B     ; $0EFD86   |
    LDA #$0018          ; $0EFD88   |

CODE_0EFD8B:
    CLC                 ; $0EFD8B   |
    ADC #$0018          ; $0EFD8C   |
    PLP                 ; $0EFD8F   |
    BPL CODE_0EFD96     ; $0EFD90   |
    EOR #$FFFF          ; $0EFD92   |
    INC A               ; $0EFD95   |

CODE_0EFD96:
    CLC                 ; $0EFD96   |
    ADC $7222,x         ; $0EFD97   |
    STA $7222,x         ; $0EFD9A   |
    LDA $7A98,x         ; $0EFD9D   |
    BNE CODE_0EFDB1     ; $0EFDA0   |
    LDA #$0004          ; $0EFDA2   |
    STA $7A98,x         ; $0EFDA5   |
    LDA $7402,x         ; $0EFDA8   |
    EOR #$0001          ; $0EFDAB   |
    STA $7402,x         ; $0EFDAE   |

CODE_0EFDB1:
    LDA $7AF6,x         ; $0EFDB1   |
    BNE CODE_0EFDC6     ; $0EFDB4   |
    LDA #$0050          ; $0EFDB6   |
    STA $7AF6,x         ; $0EFDB9   |
    LDA $75E2,x         ; $0EFDBC   |
    EOR #$FFFF          ; $0EFDBF   |
    INC A               ; $0EFDC2   |
    STA $75E2,x         ; $0EFDC3   |

CODE_0EFDC6:
    RTS                 ; $0EFDC6   |

    TYX                 ; $0EFDC7   |
    LDA $100F           ; $0EFDC8   |
    BNE CODE_0EFDDD     ; $0EFDCB   |
    INC $7402,x         ; $0EFDCD   |
    LDA #$0002          ; $0EFDD0   |
    STA $16,x           ; $0EFDD3   |
    LDA #$0008          ; $0EFDD5   |
    STA $7A98,x         ; $0EFDD8   |
    INC $76,x           ; $0EFDDB   |

CODE_0EFDDD:
    JSR CODE_0EFDE8     ; $0EFDDD   |
    INX                 ; $0EFDE0   |
    INX                 ; $0EFDE1   |
    JSR CODE_0EFDE8     ; $0EFDE2   |
    LDX $12             ; $0EFDE5   |
    RTS                 ; $0EFDE7   |

CODE_0EFDE8:
    LDA $7C16,x         ; $0EFDE8   |
    STA $3000           ; $0EFDEB   |
    CLC                 ; $0EFDEE   |
    ADC #$0030          ; $0EFDEF   |
    CMP #$0060          ; $0EFDF2   |
    BCS CODE_0EFE27     ; $0EFDF5   |
    PHX                 ; $0EFDF7   |
    LDA $3000           ; $0EFDF8   |
    PHP                 ; $0EFDFB   |
    BPL CODE_0EFE02     ; $0EFDFC   |
    EOR #$FFFF          ; $0EFDFE   |
    INC A               ; $0EFE01   |

CODE_0EFE02:
    REP #$10            ; $0EFE02   |
    ASL A               ; $0EFE04   |
    TAX                 ; $0EFE05   |
    LDA $702200,x       ; $0EFE06   |
    PLP                 ; $0EFE0A   |
    BPL CODE_0EFE11     ; $0EFE0B   |
    EOR #$FFFF          ; $0EFE0D   |
    INC A               ; $0EFE10   |

CODE_0EFE11:
    STA $3000           ; $0EFE11   |
    SEP #$10            ; $0EFE14   |
    LDA #$0050          ; $0EFE16   |
    STA $300C           ; $0EFE19   |
    LDX #$0B            ; $0EFE1C   |
    LDA #$86B6          ; $0EFE1E   |
    JSL $7EDE44         ; $0EFE21   | GSU init
    BRA CODE_0EFE40     ; $0EFE25   |

CODE_0EFE27:
    CLC                 ; $0EFE27   |
    ADC #$0020          ; $0EFE28   |
    CMP #$00A0          ; $0EFE2B   |
    BCC CODE_0EFE54     ; $0EFE2E   |
    LDA #$FD00          ; $0EFE30   |
    STA $300C           ; $0EFE33   |
    PHX                 ; $0EFE36   |
    LDX #$0B            ; $0EFE37   |
    LDA #$86B6          ; $0EFE39   |
    JSL $7EDE44         ; $0EFE3C   | GSU init

CODE_0EFE40:
    PLX                 ; $0EFE40   |
    LDA $3000           ; $0EFE41   |
    STA $75E0,x         ; $0EFE44   |
    BPL CODE_0EFE4D     ; $0EFE47   |
    EOR #$FFFF          ; $0EFE49   |
    INC A               ; $0EFE4C   |

CODE_0EFE4D:
    LSR A               ; $0EFE4D   |
    LSR A               ; $0EFE4E   |
    LSR A               ; $0EFE4F   |
    LSR A               ; $0EFE50   |
    STA $7540,x         ; $0EFE51   |

CODE_0EFE54:
    RTS                 ; $0EFE54   |

    BPL CODE_0EFE77     ; $0EFE55   |
    TYX                 ; $0EFE57   |
    LDA $7A98,x         ; $0EFE58   |
    BNE CODE_0EFE78     ; $0EFE5B   |
    DEC $16,x           ; $0EFE5D   |
    BPL CODE_0EFE6A     ; $0EFE5F   |
    LDY $78,x           ; $0EFE61   |
    BEQ CODE_0EFE67     ; $0EFE63   |
    INC $76,x           ; $0EFE65   |

CODE_0EFE67:
    INC $76,x           ; $0EFE67   |

CODE_0EFE69:
    RTS                 ; $0EFE69   |

CODE_0EFE6A:
    LDY $16,x           ; $0EFE6A   |
    LDA $FE55,y         ; $0EFE6C   |
    AND #$00FF          ; $0EFE6F   |
    STA $7A98,x         ; $0EFE72   |
    INC $7402,x         ; $0EFE75   |

CODE_0EFE78:
    JMP CODE_0EFDDD     ; $0EFE78   |

    TYX                 ; $0EFE7B   |
    JMP CODE_0EFDDD     ; $0EFE7C   |

    TYX                 ; $0EFE7F   |
    LDA $7AF8,x         ; $0EFE80   |
    BNE CODE_0EFE69     ; $0EFE83   |
    LDA $6094           ; $0EFE85   |
    CLC                 ; $0EFE88   |
    ADC #$00A0          ; $0EFE89   |
    STA $70E2,x         ; $0EFE8C   |
    CLC                 ; $0EFE8F   |
    ADC #$0008          ; $0EFE90   |
    STA $00             ; $0EFE93   |
    LDA $609C           ; $0EFE95   |
    SEC                 ; $0EFE98   |
    SBC #$0020          ; $0EFE99   |
    STA $7182,x         ; $0EFE9C   |
    CLC                 ; $0EFE9F   |
    ADC #$0008          ; $0EFEA0   |
    STA $02             ; $0EFEA3   |
    JSL $0EFF63         ; $0EFEA5   |
    BMI CODE_0EFF1F     ; $0EFEA9   |
    LDA $00             ; $0EFEAB   |
    STA $3010           ; $0EFEAD   |
    LDA $02             ; $0EFEB0   |
    CLC                 ; $0EFEB2   |
    ADC #$0008          ; $0EFEB3   |
    STA $3000           ; $0EFEB6   |
    LDX #$0A            ; $0EFEB9   |
    LDA #$CE2F          ; $0EFEBB   |
    JSL $7EDE91         ; $0EFEBE   | GSU init
    LDX $12             ; $0EFEC2   |
    LDY $300A           ; $0EFEC4   |
    BNE CODE_0EFF1F     ; $0EFEC7   |
    LDA $00             ; $0EFEC9   |
    STA $3010           ; $0EFECB   |
    LDA $02             ; $0EFECE   |
    SEC                 ; $0EFED0   |
    SBC #$0010          ; $0EFED1   |
    STA $3000           ; $0EFED4   |
    LDX #$0A            ; $0EFED7   |
    LDA #$CE2F          ; $0EFED9   |
    JSL $7EDE91         ; $0EFEDC   | GSU init
    LDX $12             ; $0EFEE0   |
    LDY $300A           ; $0EFEE2   |
    BNE CODE_0EFF1F     ; $0EFEE5   |
    LDA #$0005          ; $0EFEE7   |
    STA $74A2,x         ; $0EFEEA   |
    LDA #$3802          ; $0EFEED   |
    STA $7040,x         ; $0EFEF0   |
    LDA #$0100          ; $0EFEF3   |
    STA $75E2,x         ; $0EFEF6   |
    LDA #$0008          ; $0EFEF9   |
    STA $7542,x         ; $0EFEFC   |
    LDA $F838           ; $0EFEFF   |
    STA $7220,x         ; $0EFF02   |
    STZ $7540,x         ; $0EFF05   |
    LDA #$0100          ; $0EFF08   |
    STA $7222,x         ; $0EFF0B   |
    STZ $7400,x         ; $0EFF0E   |
    STZ $7402,x         ; $0EFF11   |
    STZ $100D           ; $0EFF14   |
    STZ $100B           ; $0EFF17   |
    STZ $100F           ; $0EFF1A   |
    STZ $76,x           ; $0EFF1D   |

CODE_0EFF1F:
    RTS                 ; $0EFF1F   |

    JSR CODE_0EF9FE     ; $0EFF20   |
    JSL $03A2C7         ; $0EFF23   |
    BCC CODE_0EFF62     ; $0EFF27   |
    LDY $18,x           ; $0EFF29   |
    BEQ CODE_0EFF3D     ; $0EFF2B   |
    LDA $6F00,y         ; $0EFF2D   |
    CMP #$0010          ; $0EFF30   |
    BNE CODE_0EFF3D     ; $0EFF33   |
    LDA $7360,y         ; $0EFF35   |
    CMP #$011C          ; $0EFF38   |
    BEQ CODE_0EFF62     ; $0EFF3B   |

CODE_0EFF3D:
    LDA $7AF8,x         ; $0EFF3D   |
    CMP #$FF00          ; $0EFF40   |
    BCS CODE_0EFF62     ; $0EFF43   |
    AND #$FF00          ; $0EFF45   |
    BEQ CODE_0EFF50     ; $0EFF48   |
    LDA #$0040          ; $0EFF4A   |
    STA $7AF8,x         ; $0EFF4D   |

CODE_0EFF50:
    STZ $18,x           ; $0EFF50   |
    LDA #$0010          ; $0EFF52   |
    STA $6F00,x         ; $0EFF55   |
    LDA #$00FF          ; $0EFF58   |
    STA $74A2,x         ; $0EFF5B   |
    LDY #$05            ; $0EFF5E   |
    STY $76,x           ; $0EFF60   |

CODE_0EFF62:
    RTL                 ; $0EFF62   |

    PHX                 ; $0EFF63   |
    REP #$10            ; $0EFF64   |
    LDA $02             ; $0EFF66   |
    AND #$FF00          ; $0EFF68   |
    LSR A               ; $0EFF6B   |
    LSR A               ; $0EFF6C   |
    LSR A               ; $0EFF6D   |
    LSR A               ; $0EFF6E   |
    STA $04             ; $0EFF6F   |
    LDA $00             ; $0EFF71   |
    AND #$FF00          ; $0EFF73   |
    XBA                 ; $0EFF76   |
    ORA $04             ; $0EFF77   |
    TAX                 ; $0EFF79   |
    LDA $6CAA,x         ; $0EFF7A   |
    SEP #$10            ; $0EFF7D   |
    PLX                 ; $0EFF7F   |
    TAY                 ; $0EFF80   |
    RTL                 ; $0EFF81   |

; freespace
DATA_0EFF82:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFF8A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFF92:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFF9A:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFA2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFAA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFB2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFBA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFC2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFCA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFD2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFDA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFE2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFEA:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFF2:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_0EFFFA:         db $FF, $FF, $FF, $FF, $FF, $FF
