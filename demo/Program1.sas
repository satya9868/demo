data survey;
input Gender $ AgeGroup $ Smoking $;
datalines;
Male 18-24 Yes
Female 25-34 No
Male 35-44 Yes
Female 18-24 Yes
Male 25-34 No
Female 35-44 No
Male 18-24 Yes
Female 25-34 Yes
;
run;
 
proc freq data=survey;
    tables Smoking / all;   
run;

proc freq data=survey;
    tables Gender / all;   
run;