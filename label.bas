
    3 ifaz=1thennew
    5 open15,8,15,"i":close15
   10 diml$(500),l(500):a=10:l=1
   15 input"filename";z$
   20 print"{clr}pass 1"
   30 open2,8,2,z$+",s,r"
   50 gosub400:ifa$="@"then130
   60 ifasc(left$(a$,1))=32then110
   70 l$(l)=a$:l(l)=a:l=l+1
  110 print"{home}{down}"a:a=a+10:goto50
  130 close2
  140 a=10:print"{home}{down}{down}pass 2"
  150 open2,8,2,z$+",s,r"
  160 open3,8,3,"b/"+z$+",s,w"
  170 gosub400:ifa$="@"then350
  173 ifasc(a$)<>32thena$="rem"+a$
  174 a$=str$(a)+a$
  175 print"{home}{down}{down}{down}"a:n=1:a=a+10
  180 fort=ntolen(a$)
  190 b$=mid$(a$,t,5)
  200 ifb$="gosub"thent=t+5:goto250
  201 b$=mid$(a$,t,2)
  202 ifb$="gO"thent=t+2:goto250
  203 b$=mid$(a$,t,3)
  204 ifb$="goS"thent=t+3:goto250
  210 b$=mid$(a$,t,4)
  220 ifb$="goto"thent=t+4:goto250
  230 next:iflen(a$)>80thenprint"line too long":stop
  240 gosub450:goto170
  250 forz=ttolen(a$)
  260 ifmid$(a$,z,1)=":"then280
  270 next
  280 b$=mid$(a$,t,z-t)
  290 ifleft$(b$,1)=chr$(32)thenb$=right$(b$,len(b$)-1):goto290
  300 ifright$(b$,1)=chr$(32)thenb$=left$(b$,len(b$)-1):goto300
  310 ifval(b$)>0then270
  320 forj=1tol:ifb$=l$(j)then340
  330 next:print"label not found":stop
  340 a$=left$(a$,t-1)+str$(l(j))+right$(a$,len(a$)-z+1):n=t
  345 forz=1to1:next:goto180
  350 close2:print#3,"@":close3:open15,8,15
  360 input#15,en,e$,t,s:printen;e$;t;s:ifen>20thenstop
  370 goto470
  400 a$=""
  405 get#2,b$:ifb$=chr$(13)then420
  410 a$=a$+b$:goto405
  420 ifa$<>""thenreturn
  430 goto405
  450 forg=1tolen(a$)
  460 print#3,mid$(a$,g,1);:next:print#3:return
  470 rem

