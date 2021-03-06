# Challenge Description


The attached text file, "artist_lists_small.txt" contains the favorite musical artists of 1000 users from Last.FM. Each line is a list of up to 50 artists, formatted as follows:

<pre><code>Radiohead,Pulp,Morrissey,The Killers,Hieroglyphics,Blink 182,Paramore,Michael Jackson,Cher,Zedd\n
Band of Horses,Iggy Pop,A Tribe Called Quest,Radiohead,So Super Sam,Morrissey,Bowling for Soup\n
etc. </pre></code>

Develop two programs that produce an output file containing a list of pairs of artists which appear **together** in at least fifty different lists. For example, in the above sample, Radiohead and Morrisey appear together twice, but every other pair appears only once.


## Goals

- Implement an application that reads the provided file
- Implement an application that produces an output file of lists of popular paired artists
- Be prepared to discuss optimizations and benchmarking by providing **two** different solutions
- You are welcome to use a known algorithm or create your own


## Expectations

- Written in Ruby
- Use [Bundler](http://bundler.io) for gem dependencies
- Code is tested with [RSpec](http://rspec.info/)
- Application is accesible by cloning it from a GitHub repository
- Solution cannot store a list of all possible pairs of bands
- Spend no more than 2 days on the challenge


## Dataset Description

- **artist_lists_small.txt** - Each line represents a list of favorite artists for a member of Last.FM. Each artist is separated by a comma. A new line indicates a different Last.FM member.


## Testing

- As mentioned, write tests using [RSpec](http://rspec.info/). The following command summons tests:

<pre><code>$ rspec spec</pre></code>
