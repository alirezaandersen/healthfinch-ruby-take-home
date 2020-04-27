# Take home

This is a two part technical interview. In part one, you'll
familiarize yourself with a legacy codebase and write some basic tests
for it. In part two, we'll work together on this legacy codebase.

## Part one - take home

In preparation for our in-person pairing session, we'd like you to add
[characterization](https://en.wikipedia.org/wiki/Characterization_test)
[tests](https://blog.thecodewhisperer.com/permalink/surviving-legacy-code-with-golden-master-and-sampling)
(also sometimes known as Golden Master tests) to stabilize further
development. Please submit this to us before scheduling the next
portion of the interview.

Here is a key tip from the creator of this trivia game exercise around
characterization tests and this project:

> The Trivia Game has one feature that can help us quickly and easily
> generate some helpful characterization tests: it displays running
> commentary about the game on the console. After the first iteration
> of get to know the code a little, I invite people to spend 20
> minutes generating output for 10,000 different games (use a specific
> sequence of seeds for the random number generator!) as a Golden
> Master. They can use these game logs to build some confidence that
> changes haven't completely screwed up the code base by generating
> the game logs after a change, then comparing the test run against
> the Golden Master. I strongly recommend that you try this exercise
> yourself as a kata before you run your Legacy Code Retreat. You can
> figure it out! Just remember that the same seeds for random number
> generators from different languages on different machine
> architectures will generate different streams of numbers, so you
> can't just copy the game logs from one computer to another. I tried
> that.

(From https://legacycoderetreat.typepad.com/blog/2011/11/how-i-run-legacy-code-retreat.html)

The take home portion of this interview has two purposes. First, we
want you to get an introduction to the trivia codebase we'll be working
with so you are comfortable when we work together. Second, we want to
learn about how you approach improving complex legacy systems.

## Part two - working together

After we have a chance to look over your submission, we'll schedule a
time for you to pair with two of our engineers on this same
codebase. So please keep your work from Part One and make sure you are
able to run the tests you wrote during that section.

## Sources

The code for this exercise came from
https://github.com/jbrains/trivia.
