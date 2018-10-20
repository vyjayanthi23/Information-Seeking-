/* Assignment 2 - 10/19/18*/
/* Vyjayanthi Kamath INFM 600 */

select * from candidate;
select * from committee;
select * from marylandcontributions;
select * from committee2candidate;

select * from marylandcontributions 
where ZIP_CODE = 20783
ORDER by TRANSACTION_AMT ASC;

select * from candidate
where CAND_ST = 'MD';

select distinct candidate.CAND_NAME, candidate.CAND_ID, committee2candidate.TRANSACTION_AMT from committee2candidate, candidate
where committee2candidate.CAND_ID = candidate.CAND_ID AND committee2candidate.STATE like '%MD' AND candidate.CAND_ST like '%MD%'
group by committee2candidate.TRANSACTION_AMT ASC;

select * from candidate
where CAND_ID like '%H2MD02160%'; 

/* candidate selected: RUPPERSBERGER, C.A. DUTCH, candidate id = H2MD02160, party = dem */

select TRANSACTION_AMT from committee2candidate
where CAND_ID like '%H2MD02160%'; /* displays all contributions made towards candidate */

select sum(TRANSACTION_AMT) from committee2candidate
where CAND_ID like '%H2MD02160' and TRANSACTION_AMT > 0;

/* total contribution to candidate is 21000 */

select distinct cand_id from committee2candidate;

select count(TRANSACTION_AMT) from committee2candidate
where TRANSACTION_AMT <0;

select c2c.CAND_ID, sum(c2c.TRANSACTION_AMT) as 'Total Contribution' from committee2candidate c2c 
left join candidate c ON c2c.CAND_ID = c.CAND_ID
where c.CAND_PTY_AFFILIATION LIKE '%DEM%' and c2c.TRANSACTION_AMT > 0
GROUP BY c2c.CAND_ID;

select distinct * from candidate
where CAND_ID like '%H2MD02160%';

/* Focus Area 2 */

select distinct CMTE_ID, NAME from committee2candidate
where CAND_ID like '%H2MD02160%';

/* C00411116
C00078451
C00163832
C00325092
C00109017
C00141002
C00144766
C00341602
C00096156
C00040998
C00227744
*/

select distinct OCCUPATION from marylandcontributions
where CMTE_ID like '%C00227744%' 
or CMTE_ID like '%C00163832%'
or CMTE_ID like '%C00040998%'
or CMTE_ID like '%C00096156%' 
or CMTE_ID like '%C00341602%'
or CMTE_ID like '%C00109017%' 
or CMTE_ID like '%C00078451%'
or CMTE_ID like '%C00141002%' 
or CMTE_ID like '%C00144766%' 
or CMTE_ID like '%C00078451%' 
or CMTE_ID like '%C00325092%';

select distinct OCCUPATION from marylandcontributions 
where  CMTE_ID NOT IN ('%C00227744%','%C00163832%','%C00040998%','%C00096156%','%C00341602%','%C00109017%',
'%C00078451%','%C00141002%','%C00144766%','%C00078451%','%C00325092%');












