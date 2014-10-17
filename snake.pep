; Author: Marc-Antoine Sauvé - SAUM13119008
; Remise à Jean Privat - INF2170
; Version 2014-10-10
;
; Programme utilisé pour convertir les chaines de caractères fournis par l'entrée standard en snake_case.
;
; Auto-évaluation: Les tests des règles 0 à 5 fonctionnent.

         LDA 0, i
         LDX 0, i            ; Nettoyer les registres
         CHARI curr, d       ; Charger le premier caractère dans curr
         CHARI next, d       ; Charger le second caractère dans next
         LDBYTEA curr, d         
         STBYTEA out, d          ; out = curr;

         CPA 0, i

loop:    BREQ end            ; if (curr != 0)
                             ; {
; Règle 0

         CPA 'A', i 
         BRLT output
         CPA 'Z', i
         BRGT output         ;    if (curr >= 'A' && curr <= 'Z')
                             ;    {

; Règle 1
         SUBA 'A', i
         ADDA 'a', i
         STBYTEA out, d          ;        out += 'a' - 'A';

; Règle 2
         LDBYTEA prev, d
         CPA 'a', i
         BRLT rule3
         CPA 'z', i
         BRGT rule3          ;        if (prev >= 'a' && prev <= 'z')
                             ;        {
         CHARO '_', i        ;            Pep8.charo('_');
                             ;        }

; Règle 3
rule3:   CPA 'A', i
         BRLT output
         CPA 'Z', i
         BRGT output         ;        if (prev >= 'A' && prev <= 'Z' &&
         LDBYTEA next, d
         CPA 'a', i
         BRLT output
         CPA 'z', i
         BRGT output         ;          next >= 'a' && next <= 'z')
                             ;        {
         CHARO '_',i         ;            Pep8.charo('_');
                             ;        }
                             ;    }

output:  CHARO out, d        ;    Pep8.charo(out);

         LDBYTEA curr, d
         STBYTEA prev, d         ;    prev = curr;
         LDBYTEA next, d         
         STBYTEA curr, d         ;    curr = next;
         STBYTEA out, d          ;    out = curr;

         CHARI next, d       ;    next = Pep8.chari();

         BR loop
                             ; }
end:     STOP                ; End of program

prev:    .BLOCK 1            ; #1d Contains the previous character 
curr:    .BLOCK 1            ; #1d Contains the current character 
next:    .BLOCK 1            ; #1d Contains the next character 

out:     .BLOCK 1            ; Variable used to print to standart output

         .END