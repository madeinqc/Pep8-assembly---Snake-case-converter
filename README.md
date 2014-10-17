Pep8-assembly---Snake-case-converter
====================================

First project for Pep8 assembly course.

This project was made for a university course where we had to make a Pep8 program that follow the following rules:

1. In snake_case, there's no upper case and the words are separated with underscores. Hence, every input with upper case is not modified.
	In
		> hello_world
	Out
		> hello_world
		
2. Upper cases are always converted to lower cases.
	In
		> HELLO_world
	Out
		> hello_world
		
3. When an upper case follow a lower case, we add an underscore before that upper case.
	In
		> HelloWorld
	Out
		> hello_world

4. When an upper case follow another upper case and is followed by a lower case, that upper case is converted to lower case and an underscore is inserted before.
	In
		> HELLOWWorld
	Out
		> hello_world
		
5. The other characters (symbols, numbers, whitespaces) are not modified.
	In
		> H3ll0WorId
	Out
		> h3ll0wor_id