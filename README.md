PetsCorner-ExploratoryAnalysis
This repo is focused on Exploratory Analysis for a Pet's store - PetsConer to gather insights into various aspects of the pet, pet owner, and procedure data.
With 3 Tables present: 
1. ProceduresHistory (1).xlsx
2. ProceduresDetails (1).xlsx
3. PetOwners (1).xlsx

Relationships:

PetOwners Table:
Primary Key: OwnerID
Other Fields: Name, Surname, StreetAddress, City, State, StateFull, ZipCode
Pets Table (Assumed based on SQL queries):

Pets Table 
Primary Key: PetID
Foreign Key: OwnerID (References PetOwners)
Other Fields: Name, Kind, Gender, Age, etc.
ProceduresHistory Table:

ProceduresHistory Table:
Foreign Key: PetID (References Pets)
Other Fields: Date, ProcedureType, ProcedureSubCode
ProceduresDetails Table:

ProceduresDetails Table:
Composite Key: ProcedureType, ProcedureSubCode
Other Fields: Description, Price

![image](https://github.com/FarahFat/PetsCorner-ExploratoryAnalysis/assets/159918297/9344377a-a20a-4fcf-a86d-3dc06044bd0c)

Based on the queries, insights were generated that addressed varying business cases in the following ways:

1. Customer Relationship Management (CRM):
Insight: By listing all pet owners alongside their pets, businesses can understand household compositions and schedule services accordingly.
Application: This insight allows for personalized follow-ups, appointment scheduling, and tailored communications that speak directly to the owner's needs, improving customer service and relationship management.
Service Optimization:

2. Service Optimization:
Insight: Procedures history can highlight which procedures are most common or bring in the most revenue.
Application: The business can use this information to streamline operations, allocate resources to high-demand services, and adjust pricing or offer promotions on less popular services to increase their uptake.
Targeted Marketing Strategies:

3. Targeted Marketing Strategies:
Insight: The combined data of pet owners, pets, and procedures can identify cross-selling and up-selling opportunities.
Application: Marketing campaigns can be specifically targeted to segments of the customer base, such as offering dental services to pet owners who frequently purchase grooming services but have never availed of dental care.
Spending Behavior Analysis:

4. Spending Behavior Analysis:
Insight: Queries that calculate the total spending per pet owner can identify high, medium, and low spenders.
Application: This segmentation enables the creation of loyalty programs or tiered service packages to encourage increased spending from low-tier customers and maintain the loyalty of high-tier customers.
Demographic Analysis:

5. Demographic Analysis:
Insight: Age and gender data for pets, coupled with procedure data, can reveal demographic trends such as life stage-specific service requirements.
Application: The business can develop and market service packages appropriate for different life stages of pets, such as puppy/kitten care bundles or senior pet health check-ups.
Operational Efficiency:

6. Operational Efficiency:
Insight: The frequency of procedures and their types can indicate peak usage times and popular services.
Application: This data helps in staffing decisions, inventory management, and scheduling optimization to improve overall operational efficiency.

All these insights are directly contributing to a strategic area of the business. CRM is enhanced by better understanding the customer base, service optimization is driven by demand and profitability data, targeted marketing is informed by customer segmentation, spending behavior analysis informs loyalty and pricing strategies, demographic analysis guides product development, and operational efficiency is improved by data-driven decision-making.
