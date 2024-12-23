data sales_data1;
    input Product $ Sales Cost; 
    datalines;
    A 500 200
    B 800 500
    C 450 200
    D 600 300
    ;
run;

data sales_data2;
    input A $ B$ Ses Cos; 
    datalines;
    A F 500 200
    B P 1800 500
    C Q 450 200
    B R 600 300
    ;
run;

data new_data;
set sales_data2;
combined_variable =  A||" "|| B;
run;

