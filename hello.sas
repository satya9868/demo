data new;
    input col1 $ col2 $;
    datalines;
A 100
B 200
C 300
D 400
;
run;

proc print data=new;
run;
