module RiskManagement where  
 
import UserManagement  
-- function to list high risk customers under the minimum acceptable  balance value   
thresHoldBalance :: Int -> [Customer] -> [Customer]  
thresHoldBalance threshold customers = [c | c <- customers, isHighAndBelowThreshold c]  
 where  
   isHighAndBelowThreshold :: Customer -> Bool  
   isHighAndBelowThreshold customer = riskNote customer == "High" && balance customer < fromIntegral threshold 