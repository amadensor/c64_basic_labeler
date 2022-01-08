

 10 d=8: rem disk device
 20 b=10: rem begin numbers
 30 s=10: rem step numbers
 40 dim l(500):dim l$(500)
 50 input"Filename";f$
 60rem pass1setup 
 70 print"{clr}pass 1"
 80 n=b-s: rem start one step back
 90 c=0: rem no labels yet
 100 close 1
 110 open 1,d,2,f$+",s,r"
 120rem pass1
 130 gosub 920
 140 if a$="@" goto 330
 150 n=n+s
 160 if asc(left$(a$,1))<>32 then gosub 190
 170 print"{home}{down}";n
 180 goto 120
 190rem addlabel
 200 b$=a$
 210 gosub 270
 220 a$=b$
 230 c=c+1
 240 l(c)=n
 250 l$(c)=a$
 260 return
 270rem trimlabel
 280rem triml
 290 if left$(b$,1)=chr$(32) then b$=right$(b$,len(b$)-1): goto 280
 300rem trimr
 310 if right$(b$,1)=chr$(32) then b$=left$(b$,len(b$)-1): goto 300
 320 return
 330rem pass2setup
 340 print"{home}{down}{down}pass 2"
 350 n=b-s: rem start one step back
 360 for t=1 to c
 370 ?l$(t);l(t)
 380 next
 390 close 1
 400 open 1,d,2,f$+",s,r"
 410 open 2,d,3,"b-"+f$+",s,w"
 420rem pass2
 430 gosub 920
 440 if a$="@" then goto 850
 450 if asc(a$)<>32 then a$="rem "+a$
 460 n=n+s
 470 a$=str$(n)+a$
 480 print"{home}{down}{down}{down}";n
 490 p=1
 500rem labelloop
 510 q=0:q1=0
 520 for t=p to len(a$)
 530 if mid$(a$,t,1)=chr$(34) and q=0 then q1=1
 540 if mid$(a$,t,1)=chr$(34) and q=1 then q1=0
 550 q=q1
 560 b$=mid$(a$,t,5)
 570 if b$="gosub" and q=0 then t=t+5:goto 680
 580 b$=mid$(a$,t,2)
 590 if b$="gO" and q=0 then t=t+2:goto 680
 600 b$=mid$(a$,t,3)
 610 if b$="goS" and q=0 then t=t+3:goto 680
 620 b$=mid$(a$,t,4)
 630 if b$="goto" and q=0 then t=t+4:goto 680
 640 next
 650 iflen(a$)>80 then print"line too long":stop
 660 gosub 890
 670 goto 420
 680rem processlabel
 690 forz=t to len(a$)
 700 if mid$(a$,z,1)=":" then goto 720
 710 next
 720rem replacelabel
 730 b$=mid$(a$,t,z-t)
 740 gosub 270
 750 rem if val(b$)>0 then GOTO contline
 760 for j=1 to c
 770 if b$=l$(j) then goto 810
 780 next
 790 print"label not found"
 800 stop
 810rem foundlabel
 820 a$=left$(a$,t-1)+str$(l(j))+right$(a$,len(a$)-z+1):p=t
 830 goto 500
 840 
 850rem finish2
 860 close 1
 870 close 2
 880 end
 890rem writeline
 900 pR2,a$
 910 return
 920rem readline
 930 a$=""
 940rem readloop
 950 get #1,c$
 960 if 64 and st then a$="@":goto 1000
 970 if c$=chr$(13) then goto 1000
 980 a$=a$+c$
 990 goto 940
 1000rem retline
 1010 if a$="" goto 940
 1020 return

