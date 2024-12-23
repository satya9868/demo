data dev;
   input subjid$ testcd$ result;
   cards;
   1001  RBC  1000
   1001  WBC  3000
   1002  RBC  4000
   1002  WBC  3000
   1003  RBC  2000
   1003  WBC  3000
   ;
   
data qc;
   input subjid$ testcd$ result;
   cards;
   1001  RBC  1000
   1001  WBC  3000
   1002  RBC  4000
   1003  RBC  2000
   ;
 
proc compare base=dev compare=qc;
  id subjid;
run;
