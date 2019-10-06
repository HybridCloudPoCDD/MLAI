# Basic image classifier based on a pre-trained model.  

## Input files  
Two Categories: clean and rusted surface  
google search input files:    
 - metal pipe stainless  
 - pipe rusted  
 

## Usage  
Login into the **keras.ucs.local** linux box. (root/HPInvent123) 
Go to /root/MLAI/MOL_pipe/test directory  
Run the test.sh with one argument which is the URL of a jpg. The script will download the file into the current directory and run the analysis on it.  
**Example:  **  
./test.sh http://www.pankajflexibles.com/prd/metallic-double-lock-flexible-conduit-pipe.jpg  
 

Results:  
Let's check the corrosion!  
hajlitott-szog-karkoto-arany-szinu-61a.jpg  
    0.922  metal  
    0.078  rusted  

The result is a likelihood and a text based answer:  
"Metallic surface, no sign of corrosion" (75% higher likelihood)  
"I am not sure..." (25%-75% likelihood)  
"Corrosion on the surface" (below 25% likelihood)  



