# Credit Card Classification Project


## Creating a model able to predict how likely is a bank customer to accept or decline an offer for a credit card
<p align="center"><img width="471" alt="Captura de pantalla 2021-11-17 a las 17 15 27" src="https://user-images.githubusercontent.com/90793442/142238448-c538e49b-b537-4a07-9757-880ff766f045.png"></p>


## Table of contents
- [Project Brief](#PB)
- [Data](#DT)
- [Process & Tools](#PT)
- [Visualization](#VI) 
- [Key Takeaways](#KT)
<a name="PB"></a>
## Project Brief
**Scenario**: The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card. This will allow the bank to design tailored marketing campaings to specific clusters.

<a name="DT"></a>
## Data
The [data set]() we were provided with consists of:

- 18000 samples

- 2 labels: Yes or No

- 17 features: Customer Number,	Offer Accepted,	Reward,	Mailer Type,	Income Level,	Bank Accounts Open,	Overdraft Protection,	Credit Rating,	Credit Cards Held,	Homes Owned,	Household Size,	Own Your Home,	Average Balance,	Q1 Balance,	Q2 Balance,	Q3 Balance,	Q4 Balance.


For further details on all features, please refer to the [notebook]()
<a name="PT"></a>
## Process & Tools

**Process**

Our process included the following steps:

  - Define and prioritize daily tasks with Trello

  - Initial view of data set in python importing the necessary dictionaries and pulling up csv file
  
  - Started SQL tasks where we created a database and completed the listed queries

  - Imported database from SQL to Python with standarised headers and free of nulls

  - EDA with Python: 
      - Dropped decimals and converting numerical columns into integers 
      - Analyzed Categorical Values 
      - Analyzed Correlations using a correlation matrix 
      
        <p align="left"><img width="600" alt="Screenshot 2021-11-17 at 16 38 24" src="https://user-images.githubusercontent.com/88676121/142231716-7e041f90-2ba6-4fd4-87ce-7efbd236a1e7.png"></p>

      - Plotted the data in a scatter matrix
        <p align="left"><img width="474" alt="Captura de pantalla 2021-11-17 a las 17 30 50" src="https://user-images.githubusercontent.com/90793442/142241466-dddd2344-5e8a-48c9-aff5-c1ca29687402.png"></p>

      - Dropped "Customer_Number" column as it was not relevant 
      - Looked for outliers in a boxplot

        <p align="left"><img width="600", height= "300" alt="Screenshot 2021-11-17 at 16 37 22" src="https://user-images.githubusercontent.com/88676121/142231613-a147b176-7fbc-41c2-a304-b4ff4328d6e0.png"></p>

   
  - Preparing data set for modeling:
      - Extracted numerical values
      - Tried 2 different scalers: Normalizer and Standard Scaler

        **Normalizer**
        
        <img width="926" alt="Screenshot 2021-11-17 at 16 29 06" src="https://user-images.githubusercontent.com/88676121/142230418-0bc99534-0582-43d6-a93b-746d8f2d860c.png">

        **Standard Scaler**
        
        <img width="923" alt="Screenshot 2021-11-17 at 16 30 22" src="https://user-images.githubusercontent.com/88676121/142230441-266f7fa8-eaa2-4432-9934-8c2b68657583.png">

       - Extracting the dummies from categorical values
               
       - Isolation 'y' or target variable

       - Concatenating numerical and categorical values
            
       - Imported specific libraries to prepare for modeling

    
  - Tried different Machine learning models as follows:
  
      - Model 1: Logistic regression benchmark
      - Model 2: SMOTE oversampling method
      - Model 3: TomekLink undersampling ethod
      - Model 4: Dropping quarterly balances
      - Model 5: KNN
      - Bonus Model 6: Using solely features that seem to have a direct impact on customer response according to an initial visualization in Tableau

**Tools**

Code: [Jupyter Notebook]()

Vizualizations: [Tableau]() / Seaborn / Matplotlib

Database: [MySQL]()

<a name="VI"></a>
## Visualizations

[Tableau]()

![image](https://user-images.githubusercontent.com/88676121/142222259-f6a5af63-512a-4ca3-9b5f-237946037da7.png)

<a name="KT"></a>
## Key Takeaways

The best model we found was Model 5, right after applying the KNN method. This is able to predict if a bank customer will accept a credit card offer with an accuracy of 84%.
