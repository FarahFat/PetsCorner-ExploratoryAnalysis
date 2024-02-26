SELECT * FROM Pets.petowners;
SELECT * FROM Pets.pets;
SELECT * FROM Pets.proceduresdetails
SELECT * FROM Pets.procedureshistory;

#1. List the names of all pet owners along with the names of their pets.
SELECT po.NAME as Owner_name, p.NAME as Pet_name
FROM petowners po
LEFT JOIN pets p ON po.OwnerID = p.OwnerID;

#2. List all pets and their owner names, including pets that don't have recorded owners.
SELECT p.NAME as Pet_name, po.NAME as Owner_name
FROM pets p
LEFT JOIN petowners po ON p.OwnerID = po.OwnerID;

#3. Combine the information of pets and their owners, including those pets without owners and owners without pets.
SELECT * FROM petowners po
LEFT JOIN pets p ON po.OwnerID = p.OwnerID
UNION
SELECT * FROM petowners po
RIGHT JOIN pets p ON po.OwnerID = p.OwnerID;

#4. Find the names of pets along with their owners' names and the details of the procedures they have undergone.
SELECT p.NAME AS Pet_name,po.NAME AS Owner_name,ph.ProcedureType AS procedure_details
FROM pets p
LEFT JOIN petowners po ON p.OwnerID = po.OwnerID
LEFT JOIN procedureshistory ph ON p.PetID = ph.PetID;
    
#5. List all pet owners and the number of dogs they own.
SELECT po.NAME as Owner_name, Count(PetID) as Number_of_Dogs
FROM petowners po
LEFT JOIN pets p ON po.OwnerID = p.OwnerID
WHERE p.Kind = 'Dog'
GROUP BY po.Name;

#6. Identify pets that have not had any procedures.
SELECT p.PetID, ph.PetID, ph.ProcedureType
FROM pets p
LEFT JOIN procedureshistory ph ON p.PetID = ph.PetID
WHERE ph.PetID IS NULL;

#7. Find the name of the oldest pet.
SELECT PetID, Name, Age
FROM pets
ORDER BY Age DESC, PetID
LIMIT 1;

#8. List all pets who had procedures that cost more than the average cost of all procedures.
SELECT *
FROM pets p
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
WHERE pd.Price > (
    SELECT AVG(Price)
    FROM proceduresdetails);

#9. Find the details of procedures performed on 'Cuddles'.
SELECT p.NAME,pd.*
FROM pets p
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
WHERE p.NAME = 'Cuddles';

#10. Create a list of pet owners along with the total cost they have spent on procedures and display only those who have spent above the average spending.
SELECT po.Name AS PetOwnerName, SUM(pd.Price) AS TotalCost
FROM petowners po
JOIN pets p ON po.OwnerID = p.OwnerID
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
GROUP BY po.Name
HAVING SUM(pd.Price) > (SELECT AVG(Price) FROM proceduresdetails);

#To verify Q10 
SELECT AVG(Price) AS AveragePrice
FROM proceduresdetails;


#11. List the pets who have undergone a procedure called 'VACCINATIONS'.
SELECT p.NAME as PetName,pd.ProcedureType
FROM pets p
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
WHERE pd.ProcedureType = 'VACCINATIONS';

#12. Find the owners of pets who have had a procedure called 'EMERGENCY'.
SELECT po.NAME as PetOwnerName, p.NAME as PetName, ph.ProcedureType as ProcedureType
FROM petowners po
JOIN pets p ON po.OwnerID = p.OwnerID
JOIN procedureshistory ph ON p.PetID = ph.PetID
WHERE ph.ProcedureType = 'EMERGENCY';

#To further verify Q12
SELECT ProcedureType,COUNT(PetID)
FROM procedureshistory
GROUP BY ProcedureType;
WHERE Description = 'Emergency';

#13. Calculate the total cost spent by each pet owner on procedures.
SELECT po.NAME as PetOwnerName, SUM(pd.Price) as TotalCost
FROM petowners po
JOIN pets p ON po.OwnerID = p.OwnerID
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
GROUP BY po.NAME;

#14. Count the number of pets of each kind.
SELECT Kind,COUNT(PetID)
FROM pets
GROUP BY Kind;

#15. Group pets by their kind and gender and count the number of pets in each group.
SELECT Kind,Gender,COUNT(PetID)
FROM pets
GROUP BY Kind, Gender;

#16. Show the average age of pets for each kind, but only for kinds that have more than 5 pets.
SELECT Kind, count(Kind) AS KindCount, round(AVG(Age),0) AS AvgAge
FROM pets
GROUP BY Kind
HAVING count(Kind)>5;

#17. Find the types of procedures that have an average cost greater than $50.
SELECT ProcedureType, AVG(Price) as AVGCost
FROM proceduresdetails
GROUP BY ProcedureType
HAVING AVG(Price) >50;

#18. Classify pets as 'Young', 'Adult', or 'Senior' based on their age. Age less then 3 Young, Age between 3and 8 Adult, else Senior.
SELECT Name AS PetName, 
    CASE
        WHEN Age < 3 THEN 'Young'
        WHEN Age BETWEEN 3 AND 8 THEN 'Adult'
        WHEN Age > 8 THEN 'Senior'
    END AS PetAgeGroup
FROM pets;


#19. Calculate the total spending of each pet owner on procedures, labeling them as 'Low Spender' for spending under $100, 'Moderate Spender' for spending between $100 and $500,and 'High Spender' for spending over $500.
SELECT po.Name AS PetOwnerName, SUM(pd.Price) AS TotalSpending,
    CASE
        WHEN SUM(pd.Price) < 100 THEN 'Low Spender'
        WHEN SUM(pd.Price) BETWEEN 100 AND 500 THEN 'Moderate Spender'
        WHEN SUM(pd.Price) > 500 THEN 'High Spender'
    END AS CustomerType
FROM petowners po
JOIN pets p ON po.OwnerID = p.OwnerID
JOIN procedureshistory ph ON p.PetID = ph.PetID
JOIN proceduresdetails pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
GROUP BY po.Name;


#20. Show the gender of pets with a custom label ('Boy' for male, 'Girl' for female).
SET SQL_SAFE_UPDATES=0;
UPDATE pets SET Gender = 'Boy' WHERE Gender = 'male';
UPDATE pets SET Gender = 'Girl' WHERE Gender = 'female';
SELECT * FROM pets;

#21. For each pet, display the pet's name, the number of procedures they've had,
SELECT p.Name as PetName, COUNT(ph.ProcedureSubCode) AS CountofProcedures
FROM pets p
JOIN procedureshistory ph ON p.PetID = ph.PetID
GROUP BY p.Name
ORDER BY COUNT(ph.ProcedureSubCode) DESC;
