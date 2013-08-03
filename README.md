Joke
====

Joke minimal Rake for fun #irresponsibleruby

Once upon a time ....  
A good friend asked me to help him to implement a Build tool, for his Job Interview. *GL my friend*   
The recruiter was interested in his ability to build tests and he you handle recursion.   
I told him:    
  you could use Topological Sort (more generic approach ) or build one simple specific recursion just to solve the dependencies.

How I decided to solve the question ?  
 - everyday on my journey to the job I waste 45 minutes so I decided to build this 'tool' for fun insipired by the job interview :).
 
 I called **JOKE** ( Job + Rake ) = Joke :)

*Here is the challenge:*

````
The Challenge

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


#### TODO
 - Tests
 - Fix MANY MANY Bugs


#### How to use ?
 
````
  git clone  https://github.com/tdantas/Joke.git
  cd joke
  ./bin/joke deploy
   
````
