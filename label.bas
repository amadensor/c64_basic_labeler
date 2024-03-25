   10 input"device";d: rem disk device
   20 input"begin numbers";b: rem begin numbers
   30 input"step";s: rem step numbers
   40 dim l(500):dim l$(500)
   50 input"filename";f$
   60 rem pass1setup 
   70 print"{clr}pass 1"
   80 n=b-s: rem start one step back
   90 c=0: rem no labels yet
  100 close 1
  110 open 1,d,2,f$+",s,r"
  120 rem pass1
  130 gosub 940
  140 if a$="@" goto 330
  150 n=n+s
  160 if asc(left$(a$,1))<>32 then gosub 190
  170 print"{home}{down}";n
  180 goto 120
  190 rem addlabel
  200 b$=a$
  210 gosub 270
  220 a$=b$
  230 c=c+1
  240 l(c)=n
  250 l$(c)=a$
  260 return
  270 rem trimlabel
  280 rem triml
  290 if left$(b$,1)=chr$(32) then b$=right$(b$,len(b$)-1): goto 280
  300 rem trimr
  310 if right$(b$,1)=chr$(32) then b$=left$(b$,len(b$)-1): goto 300
  320 return
  330 rem pass2setup
  340 print"{home}{down}{down}pass 2"
  350 n=b-s: rem start one step back
  360 print"{down}{down}{down}
  370 for t=1 to c
  380 printl$(t);l(t)
  390 next
  400 close 1
  410 open 1,d,2,f$+",s,r"
  420 open 2,d,3,"b-"+f$+",s,w"
  430 rem pass2
  440 gosub 940
  450 if a$="@" then goto 860
  460 if asc(a$)<>32 then a$="rem "+a$
  470 n=n+s
  480 a$=str$(n)+a$
  490 print"{home}{down}{down}{down}";n
  500 p=1
  510 rem labelloop
  520 q=0:q1=0
  530 for t=p to len(a$)
  540 if mid$(a$,t,1)=chr$(34) and q=0 then q1=1
  550 if mid$(a$,t,1)=chr$(34) and q=1 then q1=0
  560 q=q1
  570 b$=mid$(a$,t,5)
  580 if b$="gosub" and q=0 then t=t+5:goto 690
  590 b$=mid$(a$,t,2)
  600 if b$="gO" and q=0 then t=t+2:goto 690
  610 b$=mid$(a$,t,3)
  620 if b$="goS" and q=0 then t=t+3:goto 690
  630 b$=mid$(a$,t,4)
  640 if b$="goto" and q=0 then t=t+4:goto 690
  650 next
  660 iflen(a$)>80 then print"line too long":stop
  670 gosub 910
  680 goto 430
  690 rem processlabel
  700 forz=t to len(a$)
  710 if mid$(a$,z,1)=":" then goto 730
  720 next
  730 rem replacelabel
  740 b$=mid$(a$,t,z-t)
  750 gosub 270
  760 rem "if val(b$)>0 then goto contline"
  770 for j=1 to c
  780 if b$=l$(j) then goto 820
  790 next
  800 print"label not found"
  810 stop
  820 rem foundlabel
  830 a$=left$(a$,t-1)+str$(l(j))+right$(a$,len(a$)-z+1):p=t
  840 goto 510
  860 rem finish2
  870 print#2,""
  880 close 1
  890 close 2
  900 end
  910 rem writeline
  920 print#2,a$
  930 return
  940 rem readline
  950 a$=""
  960 rem readloop
  970 get #1,c$
  980 if 64 and st then a$="@":goto 1020
  990 if c$=chr$(13) then goto 1020
 1000 a$=a$+c$
 1010 goto 960
 1020 rem retline
 1030 if a$="" goto 960
 1040 return
