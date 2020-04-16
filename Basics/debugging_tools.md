# Debugging tools in R

The primary tools for debugging in R are:

* traceback: Prints out the function call stack after an error occurs; does nothing if there is no error 
* debug: flags a function for debug mode which allows you to step through the execution of a function one line at a time 
* browser: Suspends the execution of the funtion whenever it is called and puts the function in debug mode
* trace: Allows you to insert debugging code into function at specific places 
* recover: Allows you to modify error behavious so that you can browser the function call stack 
