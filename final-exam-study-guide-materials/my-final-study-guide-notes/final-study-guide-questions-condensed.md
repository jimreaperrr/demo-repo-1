Study Guide - Final
================
Joren Moreno
May 7, 2018

Study Guide Questions
---------------------

1.  What are the main differences between R matrices and R data frames?

    **A data frame can contain different types of data (is NOT atomic), and it is internally stored as an R list. In contrast, a matrix is an array and is atomic (all values are of the same type).**

2.  Every time you quit R, a message pops-up with the following question: Save workspace image to /.RData?.

-   What is the so called workspace image? **The workspace is the workspace of your current session; it contains all the objects created during the session.**
-   What type of file is .RData?

**Any file with extension .RData is a file in Râs binary format.** **To load or import the contents of the binary file into your R session you use `load()`.**

-   What happens if you choose the Save option? **R saves your workspace image in the file .RData.**

1.  When knitting a file, what happens to those code chunks that use the option `echo = FALSE?` **The code in the chunk is not displayed in the knitted document.**

2.  When knitting a file, what happens to those code chunks that use the option `eval = FALSE?` **The code in the chunk is not evaluated.**

3.  When knitting a file, what happens to those code chunks that use the option `results = 'hide'?` **The output of the code is hidden (i.e. not displayed).**

4.  When knitting a file, what happens to those code chunks that use the option `comment = ""?` **The output of the code does not show the double hash \#\#.**

5.  The reading-table functions use the following parameters: *header*, *sep*, *dec*, *row.names*, *colClasses*, *stringsAsFactors*. Explain what they do, and give an example of the value that each of these parameters can take.

-   `header`: whether the ï¬le contains the names of the variables as its ï¬rst line.
-   `sep`: the ï¬eld separator character.
-   `dec`: character used for decimal points.
-   `row.names`: a vector of row names or a single number giving the column that contains the row names.
-   `colClasses`: vector of classes to be assumed for the columns.
-   `stringsAsFactors`: whether vectors should be converted to factors.

1.  Explain the concept of vectorization a.k.a. vectorized operations.

    **An operation is applied to all the elements of a vector.**

2.  Explain the concept of atomic structures in R.

    **Atomic means that all the elements inside a data object must be of the same mode (i.e. or the same type).**

3.  Explain the use of brackets \[ \] and parentheses ( ) in R.

    **Brackets are used to manipulate objects: for slicing, subscripting, or extracting values. Parenthesis are used when invoking a function.**

4.  Below is a list of possible names for an R vector. Some names are valid and some are invalid. Identify the invalid names, and explain why they are invalid.

<!-- -->

1.  3var\_name

-   **Error: unexpected symbol**
-   **Option a) is invalid because it starts with a number.**

1.  var\_name4
2.  \_var\_name

-   **Error: unexpected input**
-   **Option c) is invalid because it starts with an underscore; underscores should not appear at the beginning of a name.**

1.  .var\_name
2.  VarName
3.  var-name

-   **Error in var - name: could not find function "-&lt;"**
-   **Option f) is invalid because it contains a dash, which is reserved for the âminusâ or subtraction operator.**

1.  What are the different (data) types of missing values that R provides?

    `NA` (logical), `NA_integer_` (integer), `NA_real_` (real/double), `NA_character_` (character), and `NA_complex_` (complex)

2.  In RStudio, one of the panes has the tabs "Environment, History". What is the content of the "History" tab?

    **It shows the history of commands that you have been using.**

3.  In RStudio, one of the panes has the tabs âFiles, Plots, Packages, Help, Viewerâ. If you click on the âFilesâ tab you will see the files of your home directory. There, you should be able to see a file called .Rhistory. What does this file contain?

    **The .Rhistory file contains the history of commands that youâve typed in the current or older sessions**

4.  

-   What happens when you type: license()? **The text of the GNU General Public License is displayed.**
-   What happens when you type: contributors()? **Information about the authors of R and the list of contributors is displayed.**
-   What happens when you type: citation()? **Indications on how to cite R in publications.**
-   What happens when you type: demo()? **A series of demonstration plots are displayed.**

1.  A code chunk in an .Rmd ï¬le can be assigned a unique name by specifying a label inside the curly braces, like this: {r some-label}. When knitting a ï¬le, what happens if you have two diï¬erent code chunks with the same label?

**You get an error. You cannot have two diï¬erent code chunks with the same name. You can, however, use the same label of another chunk in an empty chunk (i.e. no code in it).**

1.  Data Dictionary

**Give one point for each variable in the dictionary. These should be at least the name of the variable and a brief description of its meaning and/or its units. Optionally there should also be information about the type of data, and what are possible values for characters (or factor) variables.**

1.  Why do typeof(sw\[\["weight"\]\]) and typeof(sw$weight) return "integer", while typeof(sw\["weight"\]) and typeof( sw\[,"weight"\]) return "list"?

**The first and second commands use \[\[ \]\] and $ which are the operators that extract the vector that forms the weight column.**

**The third and fourth commands use \[ \] and \[ , \], which are the operators that select the element but donât get access (inside) the vectors.**

1.  

<!-- -->

1.  \_\_\_ characters with special meaning, that do not match themselves literally **metacharacters**
2.  \_\_\_ match hexadecimal digits **\[:xdigit:\]**
3.  \_\_\_ match only one out of several characters **character class**
4.  \_\_\_ pattern describing a certain amount of text **regular expression**
5.  \_\_\_ used for escaping characters in R \*\* \\ \*\*
6.  \_\_\_ match the preceding token zero or more times **asterisk: \* **
7.  \_\_\_ typing it after an opening bracket negates the character class **caret: ^**
8.  \_\_\_ matches a single character **dot**
