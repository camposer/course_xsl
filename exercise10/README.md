# Exercise 10

In this exercise, you will write two user-defined functions that are called from within
your stylesheet.

1.- Open BeatlesUDF.xsl for editing. It uses as input the familiar Beatles document BeatlesUDF.xml from previous exercises.

2.- Write a function that tests whether a Beatle is fake. It should take as a parameter a beatle element, and return a Boolean value (of type xs:boolean. Use the as attribute to indicate the return type and the type of the parameter.

3.- Write another function that constructs an a (link) element for a Beatle. It should also take as a parameter a beatle element, but this function should return the a element. The a element's href attribute should contain the URL, and the contents of a should be the first and last names of the Beatle. For example:
```
<a href="http://www.paulmccartney.com">
Paul McCartney
</a>
```

4.- To test your solution, transform BeatlesUDF.xml against BeatlesUDF.xsl. The fake Beatle should have a red background color, and the links should show up with the Beatles' first and last names.
