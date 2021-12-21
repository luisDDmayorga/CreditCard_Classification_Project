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
**Scenario**: The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card. This will allow the bank to design tailored marketing campaigns to specific clusters.

<a name="DT"></a>
## Data
The [data set](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/DataSets) we were provided with consists of:

- 18000 samples

- 2 labels: Yes or No

- 17 features: Customer Number,	Offer Accepted,	Reward,	Mailer Type,	Income Level,	Bank Accounts Open,	Overdraft Protection,	Credit Rating,	Credit Cards Held,	Homes Owned,	Household Size,	Own Your Home,	Average Balance,	Q1 Balance,	Q2 Balance,	Q3 Balance,	Q4 Balance.

<p align="center"><img width="1100" alt="Captura de pantalla 2021-11-18 a las 9 18 00" src="https://user-images.githubusercontent.com/90793442/142377840-204a9dce-02e7-4167-b9ab-90220374aec0.png"></p>

For further details on all features, please refer to the [notebook](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/Jupyter%20Notebook)
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
      
        <p align="center"><img width="600" alt="Screenshot 2021-11-17 at 16 38 24" src="https://user-images.githubusercontent.com/88676121/142231716-7e041f90-2ba6-4fd4-87ce-7efbd236a1e7.png"></p>

      - Plotted the data in a scatter matrix
        <p align="center"><img width="474" alt="Captura de pantalla 2021-11-17 a las 17 30 50" src="https://user-images.githubusercontent.com/90793442/142241466-dddd2344-5e8a-48c9-aff5-c1ca29687402.png"></p>

      - Dropped "Customer_Number" column as it was not relevant 
      - Looked for outliers in a boxplot

        <p align="center"><img width="600", height= "300" alt="Screenshot 2021-11-17 at 16 37 22" src="https://user-images.githubusercontent.com/88676121/142231613-a147b176-7fbc-41c2-a304-b4ff4328d6e0.png"></p>

   
  - Preparing data set for modeling:
      - Extracted numerical values
      - Tried 2 different scalers: Normalizer and Standard Scaler

        **Normalizer**
        
        <img width="926" alt="Screenshot 2021-11-17 at 16 29 06" src="https://user-images.githubusercontent.com/88676121/142230418-0bc99534-0582-43d6-a93b-746d8f2d860c.png">
        <p align="center"> <img width="474" alt="Captura de pantalla 2021-11-17 a las 17 35 29" src="https://user-images.githubusercontent.com/90793442/142242208-04a1363f-6846-4a06-be9b-a0356b44b9b8.png"></p>
       
       **Standard Scaler**
       
       <img width="923" alt="Captura de pantalla 2021-11-17 a las 17 53 23" src="https://user-images.githubusercontent.com/90793442/142245563-feef0d6e-22ee-4803-bc4f-4e2de0eea2d5.png">

       
       <p align="center"> <img width="474" alt="Captura de pantalla 2021-11-17 a las 17 55 06" src="https://user-images.githubusercontent.com/90793442/142245725-72d59255-d40b-4f0d-a833-6c48a5145b92.png"></p>

       
       
       

       - Extracting the dummies from categorical values
               
       - Isolation 'y' or target variable

       - Concatenating numerical and categorical values
            
       - Imported specific libraries to prepare for modeling

    
  - Tried different Machine learning models as follows:
  
      - _Model 1:_ Baseline model - Normalizer Scaler
      - _Model 2:_ SMOTE oversampling method
      - _Model 3:_ TomekLink undersampling ethod
      - _Model 4:_ Dropping quarterly balances
      - _Model 5:_ KNN
      - _Bonus Model 6:_ Using solely features that seem to have a direct impact on customer response according to an initial visualization in Tableau

**Tools**

Code: [Jupyter Notebook](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/Jupyter%20Notebook)

Vizualizations: [Tableau](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/Tableau) / Seaborn / Matplotlib

Database: [MySQL](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/SQL)

<a name="VI"></a>
## Visualizations

<p align="center"><img width="1118" alt="Captura de pantalla 2021-11-18 a las 9 46 39" src="https://user-images.githubusercontent.com/90793442/142381973-09960d8d-70a3-4c04-b823-57189edf4ab9.png"></p>

For further explorations please check:
- [Tableau](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/Tableau)
- [Presentation](https://github.com/luisDDmayorga/CreditCard_Classification_Project/tree/main/Presentation)

<a name="KT"></a>
## Key Takeaways

The best model we found was Model 5, right after applying the KNN method. It is able to predict if the bank customer will accept a credit card offer with an accuracy of 84%.

**Confusion Matrix:**

<p align="center"> <img width="450" alt="Captura de pantalla 2021-11-17 a las 17 57 47" src="https://user-images.githubusercontent.com/90793442/142246209-00e3fa51-68ab-4658-b063-f2f4bbc11255.png"></p>

**AUC:**

<p align="center"> <img width="450" alt="Captura de pantalla 2021-11-18 a las 11 34 57" src="https://user-images.githubusercontent.com/90793442/142425819-24a4f57f-3801-4511-9e0a-077a1449d4c3.png"></p>
