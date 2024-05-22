module DataAnalysis where
 
import UserManagement
import Data.List (sortOn, sortBy)
import Data.Ord (comparing) -- it creates a comparation function to sort the list
import Data.List (sortOn)-- to be able to sort the list
-- Function to calculate the average of a list of ages
averageAge :: [Customer] -> Double
averageAge customers =
 let ages = map (\customer -> age customer) customers -- Extract ages from the list of 

     totalAge = sum ages -- Calculate the sum of ages
     numCustomers = length ages -- Calculate the number of customers
 in fromIntegral totalAge / fromIntegral numCustomers -- Calculate the average age
 
-- Function to map the balance from a list of customers 
extractBalance :: [Customer] -> [Double]
extractBalance = map balance --map function takes each balance value of customers list to 
-- Function to calculate the average of a list of balances
averageB :: [Double] -> Double
-- calculates the average value of a list of Double values by summing them up and dividing 

averageB xs = sum xs / fromIntegral (length xs) 
-- Function to extract risk value from a risk note
valueRiskInFloat :: String -> Float 
valueRiskInFloat risk
 | risk == "High" = 3.0 -- Equivalent value of low
 | risk == "Medium" = 2.0 -- Equivalent value of medium
 | risk == "Low" = 1.0 -- Equivalent value of High 
-- Adjust the averageRisk function to use valueRisk
averageRisk :: [Customer] -> Float
averageRisk customers =
 let risks = map (valueRiskInFloat .riskNote) customers
     totalRisk = sum risks
     newCountRisk = fromIntegral(length risks)
 in totalRisk / newCountRisk
enumRiskNote :: Float -> String 
enumRiskNote avgRisk
 | avgRisk <= 1.0 = "Low" 
 | avgRisk <= 2.0 = "Medium"
 | otherwise = "High"
-- Function to list the top n customers with the highest balance
getTopCustomer :: (Customer -> Double) -> Int -> [Customer] -> [Customer]
getTopCustomer balance n = take n . reverse . sortOn balance