/* Creating a sample dataset with numeric and categorical variables */
data sales_data;
   input Product $ Sales Profit Gender $;
   datalines;
Phone   50000 10000 Male
Laptop  70000 15000 Female
Tablet  30000  8000 Male
Watch   20000  5000 Female
Headset 15000  4000 Male
Camera  40000  9000 Female
Speaker 25000  6000 Male
Monitor 55000 13000 Female
Keyboard 12000 3000 Male
Mouse   8000  2000 Female
;
run;


/* View the dataset */
proc print data=sales_data;
run;


proc chart data=readin;
vbar age/discrete;
run;
quit;

proc gchart data=readin;
vbar age/discrete;
run;
quit;

proc chart data=readin;
hbar age/discrete;
run;
quit;

proc gchart data=readin;
hbar age/discrete;
run;
quit;

proc gchart data=readin;
vbar age/discrete type=mean sumvar=dept;
run;
quit;

proc gchart data=readin;
vbar age/discrete type=sum sumvar=dept;
run;
quit;

proc gchart data=readin;
vbar age/discrete type=sum sumvar=dept sum;
run;
quit;

proc gchart data=readin;
vbar age/discrete type=sum sumvar=dept sum group = gender;
run;
quit;


proc gchart data=readin;
vbar age/discrete type=sum sumvar=dept sum subgroup = gender;
run;
quit;

proc sort data=readin out=redin_st; by gender; run;

proc gchart data=redin_st;
vbar age/discrete type=sum sumvar=dept sum;
by gender;
run;
quit;

proc gchart data=redin_st;
vbar age/discrete type=sum sumvar=dept sum;
where gender='M';
run;
quit;

proc gchart data=redin_st;
vbar3d age/discrete type=sum sumvar=dept sum;
where gender='M';
run;
quit;

proc gchart data=redin_st;
vbar3d age/discrete type=sum sumvar=dept sum patternid=midpoint width=10;
where gender='M';
run;
quit;

proc gchart data=redin_st;
pie age/discrete type=sum sumvar=dept;
run;
quit;


proc plot data=sales_data;
plot product*profit="*";
run;
quit;


symbol1 color=green value=diamond;
symbol2 color=red value=circle;
proc gplot data=readin;
plot dept*totalsum=gender;
run;
quit;


proc sgplot data=sales_data;
scatter x=sales y=profit/markerattrs=(symbol=triangle size=20);
run;
quit;


proc sgplot data=sales_data;
series x=sales y=profit/lineattrs=(color=green thickness=9);
run;
quit;


proc sgplot data=sales_data;
step x=sales y=profit/lineattrs=(color=green thickness=5);
run;
quit;


proc sgplot data=sales_data;
vbox sales/category=gender;
run;
quit;

proc sgplot data=sales_data;
hbox sales/category=gender;
run;
quit;
%print(readin);