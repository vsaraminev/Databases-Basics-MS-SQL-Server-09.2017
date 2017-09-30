SELECT SUM(wizards.Diff) 
FROM 
(
SELECT 
FirstName, 
DepositAmount,
LEAD(FirstName) OVER (ORDER BY Id) AS wizard,
LEAD(DepositAmount) OVER (ORDER BY Id) AS deposit,
DepositAmount - LEAD(DepositAmount) OVER (ORDER BY Id) AS Diff 
FROM WizzardDeposits
) AS wizards
