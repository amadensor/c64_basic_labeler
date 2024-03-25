petcat -w2 -o label.prg -- label.bas
petcat -w2 -o load.prg -- load.bas
petcat -text -c -w2 -o ascii_convert.pet ascii_convert.txt
petcat -text -c -w2 -o reader3.pet reader3.txt
petcat -text -c -w2 -o ml_loader.pet ml_loader.txt
petcat -text -c -w2 -o label.pet label.txt
c1541 -format test,t1 d64 test.d64
c1541 -attach test.d64 -write label.prg label
c1541 -attach test.d64 -write load.prg load
c1541 -attach test.d64 -write reader3.pet reader3,s
c1541 -attach test.d64 -write ascii_convert.pet ascii-convert,s
c1541 -attach test.d64 -write ml_loader.pet ml-loader,s
c1541 -attach test.d64 -write label.pet labelsource,s
