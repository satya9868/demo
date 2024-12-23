/* PROC IMPORT - Importing a CSV File */
proc import datafile = 'C:\Users\satyav\Desktop\osa_raw_data.csv' dbms=csv
out=csv_dataset replace;
run;

proc print data=csv_dataset; run;

/* Formats and Informats */
/* FORMAT Statement Example */
data format_example;
   input id name $ age salary;
   format salary dollar10.2;
   datalines;
1 John 30 50000
2 Mary 25 60000
3 Alan 35 70000
;
run;

proc print data=format_example; run;

/* INFORMAT Statement Example */
data informat_example;
   input id name $ dob : date9.;
   format dob date9.;
   datalines;
1 John 01JAN1990
2 Mary 15FEB1985
3 Alan 20MAR1975
;
run;

proc print data=informat_example; run;

/* By Group Processing */
data heart;
   input id name $ age height weight;
   datalines;
1 John 15 60 120
2 Mary 16 62 130
3 Alan 17 65 140
4 Sarah 16 63 135
5 Michael 17 66 145
;
run;

proc sort data=heart out=sorted_class;
   by age;
run;

data by_group_example;
   set sorted_class;
   by age;
   if first.age then count = 0;
   count + 1;
   if last.age then output;
run;

proc print data=by_group_example; run;

/* Merge By Statements */
data students;
   input id name $ age;
   datalines;
1 John 15
2 Mary 16
3 Alan 17
;

data scores;
   input id math_score science_score;
   datalines;
1 85 90
2 88 95
4 75 80
;

data merged_data;
   merge students(in=a) scores(in=b);
   by id;
   if a and b; /* Keep only records where there's a match in both datasets */
run;

proc print data=merged_data; run;

/* Conditional Statements */
/* IF Statements */
data if_statements_example;
   input id name $ age;
   if age < 13 then age_group = "Child";
   else if age <= 18 then age_group = "Teenager";
   else age_group = "Adult";
   datalines;
1 John 15
2 Mary 16
3 Alan 17
;
run;

proc print data=if_statements_example; run;

/* DO Loops */
data do_loop_example;
   do i = 1 to 10;
      square = i**2;
      output;
   end;
run;

proc print data=do_loop_example; run;

/* char functions */

/* SCAN */
data scan_example;
   input sentence $50.;
   word = scan(sentence, 2, ' ');
   datalines;
This is an example
Another test case
;
run;

proc print data=scan_example; run;

/* SUBSTR */
data substr_example;
   input full_string $20.;
   extracted_part = substr(full_string, 1, 5);
   datalines;
HelloWorld
SASProgram
;
run;

proc print data=substr_example; run;

/* CATX */
data catx_example;
   part1 = "Hello";
   part2 = "World";
   combined = catx(' ', part1, part2);
run;

proc print data=catx_example; run;

/* COMPRESS */
data compress_example;
   input messy_string $20.;
   cleaned_string = compress(messy_string, ' ');
   datalines;
H e l l o W o r l d
S A S P r o g r a m
;
run;

proc print data=compress_example; run;

/* COUNTW */
data countw_example;
   input sentence $50.;
   word_count = countw(sentence, ' ');
   datalines;
This is an example
Count the words here
;
run;

proc print data=countw_example; run;

/* INDEX */
data index_example;
   input main_string $50. sub_string $10.;
   position = index(main_string, sub_string);
   datalines;
HelloWorld World
SASProgramming SAS
;
run;

proc print data=index_example; run;

/* STRIP */
data strip_example;
   input text $20.;
   stripped_text = strip(text);
   datalines;
   HelloWorld    
      SAS  
;
run;

proc print data=strip_example; run;

/* TRANWRD */
data tranwrd_example;
   input sentence $50.;
   new_sentence = tranwrd(sentence, 'SAS', 'Data');
   datalines;
I love SAS programming
SAS is powerful
;
run;

proc print data=tranwrd_example; run;

/* LENGTH */
data length_example;
   input text $20.;
   text_length = length(text);
   datalines;
HelloWorld
SAS
;
run;

proc print data=length_example; run;

/* MISSING */
data missing_example;
   input value $10.;
   is_missing = missing(value);
   datalines;
Hello
.
;
run;

proc print data=missing_example; run;

/* COUNT */
data count_example;
   input main_string $50.;
   count_sas = count(main_string, 'SAS');
   datalines;
I love SAS and SAS is great
No SAS here
;
run;

proc print data=count_example; run;

/* REVERSE */
data reverse_example;
   input text $20.;
   reversed_text = reverse(text);
   datalines;
HelloWorld
SASProgram
;
run;

proc print data=reverse_example; run;

/* PUT */
data put_example;
   input number 8.;
   char_version = put(number, 8.);
   datalines;
123
456
;
run;

proc print data=put_example; run;

/* CALL SYMPUT */
data symput_example;
   input value $10.;
   call symput('my_macro_var', value);
   datalines;
DynamicValue
;
run;

%put &=my_macro_var;

/* FETCHOBS */
data fetchobs_example;
   set heart;
   if _n_ = 5; /* Fetches the 5th observation */
run;

proc print data=fetchobs_example; run;

/* INPUT - Convert a character string to a numeric value */
data input_example;
   char_value = "123.45";
   num_value = input(char_value, best12.); /* Converts character to numeric */
run;

proc print data=input_example; run;

/* INTCK - Calculate the difference between two dates in specified intervals */
data intck_example;
   start_date = '01JAN2024'd;
   end_date = '01MAR2024'd;
   months_diff = intck('month', start_date, end_date); /* Difference in months */
   days_diff = intck('day', start_date, end_date);    /* Difference in days */
run;

proc print data=intck_example; run;

/* INTNX - Increment a date by a specified interval */
data intnx_example;
   base_date = '01JAN2024'd;
   next_month = intnx('month', base_date, 1);       /* Add 1 month */
   next_quarter = intnx('quarter', base_date, 1);  /* Add 1 quarter */
   formatted_next_month = put(next_month, date9.); /* Format the new date */
   formatted_next_quarter = put(next_quarter, date9.);
run;

proc print data=intnx_example; run;

/* PROC SORT */
proc sort data=heart out=sorted_class;
   by age;
run;

proc print data=sorted_class; run;

/* PROC TRANSPOSE */
proc transpose data=heart out=transposed_class;
   by name;
   var height weight;
run;

proc print data=transposed_class; run;

/* PROC FORMAT */
proc format;
   value agefmt
      low-12 = 'Child'
      13-19 = 'Teen'
      20-high = 'Adult';
run;

data formatted_class;
   set heart;
   age_group = put(age, agefmt.);
run;

proc print data=formatted_class; run;

/* PROC SQL - SQL Joins */
proc sql;
   create table sql_join as
   select a.name, a.age, b.height, b.weight
   from heart as a
   inner join heart as b
   on a.name = b.name;
quit;

proc print data=sql_join; run;

/* PROC SQL - INTO Clause */
proc sql;
   select name into :name_list separated by ', '
   from heart
   where age > 14;
quit;

%put &=name_list;

/* PROC COMPARE */
data compare_1;
   input id name $ age;
   datalines;
1 John 12
2 Sarah 13
3 Michael 14
;

data compare_2;
   input id name $ age;
   datalines;
1 John 12
2 Sarah 15
4 Emily 16
;

proc compare base=compare_1 compare=compare_2;
run;

/* PROC MEANS */
proc means data=heart mean median maxdec=2;
   var height weight;
run;

/* PROC FREQ */
proc freq data=heart;
   tables age gender / nocum;
run;

/* PROC REPORT */
proc report data=heart nowd;
   column height weight;
   define height / "Height (in)";
   define weight / "Weight (lbs)";
run;
