# Exercise 6

In this exercise, you will practice reusing templates.

1.- Open HTML.xsl and review the document.

2.- Open CourseAsList.xsl for editing.

3.- Modify this document so that it imports or includes HTML.xsl.

4.- Notice that the lines below are not in the StartHTML template in CourseAsList.xsl. You will need to create another template that holds these lines.
```
<div id="courseNum">
<xsl:value-of select="/course/head/course_num"/>
</div>
<div id="courseLength">
<xsl:value-of select="/course/head/course_length"/>
</div>
<xsl:apply-templates select="/course/body/prerequisites"/>
<xsl:apply-templates select="/course/body/outline"/>
```

5.- To test your solution, transform XML101.xml against CourseAsList.xsl.
