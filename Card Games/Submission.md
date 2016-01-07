#*Object Oriented Programming - Assignment 2* 
Student Name: Gary Mac Elhinney   
Student Number: 13465572


- **Card.rb**
	This object defines a Card object that takes a symbol as it's rank. It allows public access 
	to its rank.
	
  - **initialize(rank)**
    ```
	Takes in symbol to be used as this card's rank e.g. Card.new(:Ace), where :Ace is the rank
    
	Working: Yes
    ```
  - **to_s**
    ```
    Implicit method automatically invoked when we print a card object
	
    Working : Yes
    ```

- **Hand.rb**
	```
	Hand is the main super class in this class. All its subclasses inherit it's methods. It gives public
	access to @cards_in_hand, @max_hand and @hand, primarily for use within the test class hand_test.rb.
	
	Class hand has two subclasses, *TwoCard* and *FiveCard*. 
	*TwoCard* has two subclasses:
		- Liar
		- Idiot
	*FiveCard* also has two subclasses:
		- Light
		- Spider
	
	```
	
	- **initialize**
	```
		Takes a hand size as input. In our case we will just pass 2 or 5 from the initialize of
		*TwoCard* and *FiveCard*.
	
		Working: Yes
	```
	
	- **add_card(card)**
	```
	Simply adds a given card to the end of the instance variable @hand, which is an array of cards
	and adds one to @cards_in_hand counter. If the hand is full dont add the card
	
	Working: Yes
	```
	
	- **complete?**
	```
	Returns a boolean seeing if current number in @cards_in_hand is equal @max_hand.
	
	Working: Yes
	```
	
	- **contains?(card)**
	```
	Returns a boolean if @hand array contains given 'card'
	
	Working: Yes
	```
  
	- **value(card)**
	```
	This method is passed a card object. It then gets the corresponding value in the card
	games' hashmap based on the rank of the card.
	
	Working: Yes
	```
	
	- **evaluate**
	```
	Gets the max and min card ranks in a games hand and divides by two, returning a float 
	value.
	
	Three of four game hands use this same algorithm so we put it in the main super class 'Hand',
	we will override it later only in Spider which requires a different evaluate method.
	
	Working: Yes
	```
	
	- **remove_card(card)**
	```
	This method is primarily used so that we can test add_card(card) in the test class 'hand_test.rb'
	It also allows us to just remove a card if for some reason it is required.
	
	Working: Yes
	```
	- **FiveCard & TwoCard**
	```
	Both these classes work the same only that FiveCard takes 5 cards as a parameter as appose to 2 in TwoCard.
	They both invoker 'super()', which for these subclasses invokes the initialize method of 'Hand'. This is known as 
	chaining.
	
	Working: Yes
	```
	
	- **Liar, Idiot & Light**
	```
	These classes are all very similar, they all have the same set of methods since they inherit them from the super class 'Hand'.
	They main difference is the different values assigned to each symbol within the hash maps they contain.
	
	All Working: Yes
	```

	- **Spider**
	```
	This class is mainly different from the other three tyes of hands because it overrides the evaluate method from 'Hand'. 
	
	- **evaluate**
	```
	Instead of finding a max and min / 2 this method will first order the '@hand' array by means of it's value from the hash
	map. It then gets the overall median of the '@hand' array and returns it.
	
	Working: Yes
	```
	
- **Alltests_Test.rb**
  ```
  Simply issues all the test contained in hand_test.rb and card_test.rb
  Both hand_test.rb and card_test.rb contain tests that are invoked on each of the methods, classes and instance variables
  to ensure that they work as they are supposed to.
  
  All 22 asserts pass their tests.
  
  Working: Yes
  ```