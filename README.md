Joke
====

Joke is a internal DSL based on RAKE #irresponsibleruby  
Take a Look  [Jokefile](https://github.com/tdantas/Joke/blob/master/Jokefile)

###  Context  
A good friend asked me to help him to implement a Build tool, for his Job Interview. *GL my friend*   
Read the Interview below

I told him:    
  You could use Topological Sort ( more generic approach ) or build one simple specific recursion just to solve the dependencies.

Inspired by Rake DSL, I decied to create my own Internal DSL.   
Why ??   
When I like something, I will read the code, study and try to reproduce. Just because I liked it :D     

I called **JOKE** ( Job + Rake ) = Joke :)

### How to use ? ( #irresponsibleruby )
 
````
  $ git clone  https://github.com/tdantas/Joke.git
  $ cd joke
  $ bundle install
  $ bundle exec joke deploy
     
````

Options

	$ bundle exec joke -h
	joke [options] job_name
      -j, --jokefile PATH              path to Jokefile
      -l, --list                       list jobs descriptions (TODO)
      -v, --version                    Print version and exit
      -h, --help                       Show help


### How to Test ?

Why not use the JOKE to run our tests ?  
*( Need more coverage tests, can you help me ? )*
  

	bundle exec joke rspec



===

# The Interview

````

Imagine we have a list of jobs, each represented by a character.  
Because certain jobs must be done before others, a job may have a dependency on another job.
For example, a may depend on b, meaning the final sequence of jobs should place b before a. 
If a has no dependency, the position of a in the final sequence does not matter.


  	* Given you’re passed an empty string (no jobs), the result should be an empty sequence

  	* Given the following job structure:
  	
  	  	a =>
  	
  	 The result should be a sequence consisting of a single job a.
  	 
  	* Given the following job structure:
      	a => 
      	b => 
      	c =>
     
      The result should be a sequence containing all three jobs abc in no significant order.
      
   	* Given the following job structure:
   		a =>
		b => c 
		c => 
	  
	  The result should be a sequence that positions c before b, containing all three jobs abc.	 
	  

	* Given the following job structure:
		a =>
		b => c
		c => f
		d => a
		e => b
		f =>
	 
	  The result should be a sequence that positions 
           f before c,
           c before b,
           b before e
           and a before d containing all six jobs abcdef.
	 
	* Given the following job structure:
		a => a
		b =>
		c =>

	 The result should be an error stating that jobs can’t depend on themselves. 
	
	* Given the following job structure:
	
		a =>
		b => c
		c => f
		d => a
		e =>
		f => b
	 The result should be an error stating that jobs can’t have circular dependencies.
````




