CREATE TABLE EMP (  
  E_Id INT PRIMARY KEY,  
  Name VARCHAR(50),  
  Salary Int 
);  
INSERT INTO employees (E_ID, Name, working_hour)  
VALUES  
  (1, Mike, 10),
  (2, John, 12),
  (3, Nancy, 10)
  (4, Lucy, 8);

select min(Salary) from   
(select distinct salary from Emp order by Salary desc)   
where rownum < 3;  

--2nd highest salary

select * from(  
select Name, Salary, dense_rank()   
over(order by Salary desc)rank from Emp)   
where rank = 2; 

--Nth highest salary

select * from Emp where Salary = ( select min( Salary ) from Emp   
            where  Salary IN (select distinct TOP N                                    
                                Salary from Emp order by Salary desc )                                
                                 )  ;
