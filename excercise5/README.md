# Excercise 5

In this exercise, you will practice using xsl:apply-templates.

1.- Open BeatlesTemplates.xsl.

2.- There is already an xsl:template that matches the document node. Within this template, add two xsl:apply-templates, one that matches real Beatles and one that matches fake Beatles.

3.- After the initial xsl:template, create new templates for the beatle
elements and for firstname and lastname elements.

- Note that there should separate templates for real Beatles and for fake
Beatles.
- The real beatles should be enclosed in <Real></Real> tags.
- The fake beatles should be enclosed in <Fake></Fake> tags.
- The first names should be enclosed in <FirstName></FirstName> tags.
- The last names should be enclosed in <LastName></LastName> tags.

4.- To test your solution, transform BeatlesTemplates.xml against BeatlesTemplates.xsl.
