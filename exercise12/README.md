# Exercise 12

In this exercise, you will generate the FO document we have been working with in this lesson from an XML document using XSLT.

1.- Open HelloWorld.xml. You will see that it is a very simple XML document. 

2.- Open HelloWorld.xsl for editing.

3.- Finish this XSLT document so that it transforms HelloWorld.xml to output the equivalent of HelloWorld.fo shown earlier.

4.- To test your solution, transform HelloWorld.xml against HelloWorld.xsl and then run the result through an FO engine.
```
fop -xml HelloWorld.xml -xsl HelloWorld.xsl -pdf HelloWorld.pdf
```
