# Total-Lines-Of-Code-in-Apex-Class

This is the Apex code which can be executed in anonymous windows for counting the lines of code of all Apex Classes in the org.

While getting the lines of code above logic does not consider blank lines, commented lines with "//", and debug statements, but it includes commented code between " /* " and " */ ". Also, Test classes are not included.

You can add Test by removing "(NOT Name like '%Test%')" from the SOQL query.

Note: This Snippet of code gives the result on the basis of CreatedDate in SOQL query(If there are many classes in the org which led to hit the limit).
