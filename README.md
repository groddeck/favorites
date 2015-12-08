# Challenge Description


The attached text file, "artist_lists_small.txt" contains the favorite musical artists of 1000 users from Last.FM. Each line is a list of up to 50 artists, formatted as follows:

<pre><code>Radiohead,Pulp,Morrissey,The Killers,Hieroglyphics,Blink 182,Paramore,Michael Jackson,Cher,Zedd\n
Band of Horses,Iggy Pop,A Tribe Called Quest,Radiohead,So Super Sam,Morrissey,Bowling for Soup\n
etc. </pre></code>

Develop a program that produces an output file containing a list of pairs of artists which appear **together** in at least fifty different lists. For example, in the above sample, Radiohead and Morrisey appear together twice, but every other pair appears only once.

## Goals

- Implement an application that reads an outside file 
- Implement an application that produces an output file of lists of popular paired artists
- Optimize run-time of an algorithm


## Expectations

- Your solution cannot store a list of all possible pairs of bands
- Your solution may return a best guess, i.e. lists which appear at least 50 times with high probability, as long as you explain why this tradeoff improves the performace of the algorithm
- Share project on GitHub
- Include in comments or in a separate file, a description of any optimizations you made and how they impact the run-time of the algorithm
- Spend no more than 2 days on the challenge


## Dataset Description

- **artist_lists_small.txt** - Each line is a list of favorite artists for a unique person who owns an account on Last.FM. Each artist is separated by a comma.
