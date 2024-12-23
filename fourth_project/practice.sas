proc import datafile="C:\Users\satyav\Desktop\dataset.txt" dbms=DLM out=abc replace;
DELIMITER='|';
run;

PROC IMPORT DATAFILE='C:\Users\satyav\Desktop\dataset.txt'
	DBMS=DLM
	OUT=WORK.READIN REPLACE;
	DELIMITER='|';
	GETNAMES=YES;
RUN;

title;
options nocenter;

DATA new_dataset;
   INPUT variable1 :$20. variable2 variable3;
   DATALINES;
   Sam 10 20
   MarkSpencers 15 25
   RandyHortonia 8 18
   ;
RUN;

proc print data=new_dataset;
run;

data ex2;
input ID Name:$30. Score fee comma5. ;
cards;
1 DeepanshuBhalla 22 1,000
2 AttaPat 21 2,000
3 XonxiangnamSamnuelnarayan 33 3,000
;
run;

data example2;
length Name $30.;
input ID Name $ Score;
cards;
1 DeepanshuBhalla 22
2 AttaPat 21
3 XonxiangnamSamnuelnarayan 33
;
proc print noobs;
run;

data example1;
input ID Name & $30. Score;
cards;
1 DeepanshuBhalla  22
2 AttaPat  21
3 Xon xi a ng na a n ar ay an  33
;
proc print noobs;
run;