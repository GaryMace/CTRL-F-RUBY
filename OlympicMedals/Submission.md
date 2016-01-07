#*Object Oriented Programming - Assignment 3*
Student Name: Gary Mac Elhinney   
Student Number: 13465572


- **Country.rb**
	This object represents individual countries. Each country has a certain number of medals(Gold, Silver & Bronze), a name,
	a population and a score.

	A Country object simply is passed a line. That line is then parsed to obtain the information it requires. If the line being
	passed does not contain the correct information the program will abort.

	This class also has a mixin included that contains a hashmap of each countries GDP. It is used as part of the score calculation.

  - **to_s**
    ```
	Returns a string representing a Country object
    
	Working: Yes
    ```

  - **score**
    ```
   	Returns a Country objects score based on its number of golds and its GDP

    Working: Yes
    ```
- **MedalRankings.rb**
	The Medal Rankings class instanciates an array of Country objects. It will read in the medals.txt file and populate
	every country with it's relavent information. The methods in the file do some manipulation of this countries array to
	produce results.

  - **most_golds**
  	```
  	Returns the Country object with the most gold medals.

  	Working: Yes
  	```
  - **average_pop**
  	```
  	Returns the average population across all the Country objects as an integer.

  	Working: Yes
	```
  - **sort!**
  	```
  	Returns and overwrites the current '@countries' array as a sorted array based on the countries score.

  	Working: Yes
  	```

  - **to_s(n)**
  	```
  	Returns a string of all the countries up to (n)

  	Working: Yes
  	```
  - **each_single_gold_winner**
  	```
  	Yields each country to the block passed to this iterator if said country has exactly one gold and no
  	other medals.

  	Working: Yes
  	```
- **gdp.rb**
	```
	This ruby file includes a module mixin that is used in the Country class. The mixin includes a hashmap
	that contains the name and gdp of each country. A Countries name is used as a lookup within the hashmap and the
	corresponding value(gdp) is returned.

	Working: Yes
	```
