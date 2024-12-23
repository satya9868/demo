data training;
  input v1 v2 v3;
  datalines;
10 20 30
. 25 35
5 . 25
20 30 .
;
run;


options nocenter;
title;

%macro print(dataset);
	proc print data=&dataset. noobs;
	run;
/*	proc means data=&dataset. mean median;*/
/*	run;*/
%mend;


/*proc stdize data=training out=abc missing=0 reponly;*/
/*run;*/


data sample_dataset;
    input ID Name $ Gender $ City $;
    datalines;
    1 John Male NewYork
    2 Alice Female London
    3 Bob Male Sydney
    4 Carol Female Tokyo
    5 David Male Paris
    6 Emma Female Berlin
    ;
run;

%macro hot_encoding(data,var);
   proc sql noprint;
     select distinct &var 
       into:val1-
     from &data;
 select count(distinct(&var))   into:len from &data;
 quit;
 data encoded_data;
     set &data;
   %do i=1 %to &len;
       if &var="&&&val&i" then %sysfunc(compress(&&&val&i,'$ - /'))=1 ;
       else  %sysfunc(compress(&&&val&i,'$ - /'))=0;
   %end;
   run;
 %mend;

%hot_encoding(sample_dataset,city);