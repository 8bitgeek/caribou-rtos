10 PRINT "What is your name: ";
15 U$ = INPUT$()
20 PRINT "Hello "; U$
30 PRINT "How many stars do you want: ";
35 N = VAL(INPUT$())
40 S$ = ""
50 FOR I = 1 TO N
60 S$ = S$ + "*"
70 NEXT I
80 PRINT S$
90 PRINT "Do you want more stars? ";
95 A$ = INPUT$()
100 IF LEN(A$) = 0 THEN GOTO 90
110 A$ = LEFT$(A$, 1)
120 IF A$ = "Y" || A$ = "y" THEN GOTO 30
130 PRINT "Goodbye "; U$

