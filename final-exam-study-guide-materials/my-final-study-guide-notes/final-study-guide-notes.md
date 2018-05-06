Study Guide - Final
================
Joren Moreno
May 4, 2018

``` r
knitr::opts_chunk$set(echo = TRUE, error = TRUE, comment = "", eval = TRUE)
```

### Rmd files

**Rmd** files are a special type of file, referred to as a *dynamic document*. It combines both the commands and the narrative of R code.

The structure of an `.Rmd` file can be divided in two parts: 1) a **YAML header**, and 2) the **body** of the document.

1.  *YAML header* consists of the first few lines at the top of the file. This header is established by a set of three dashes --- as delimiters (one starting set, and one ending set). This part of the file requires you to use YAML syntax (Yet Another Markup Language.) Within the delimiter sets of dashes, you specify settings (or metadata) that will apply to the entire document. Some of the common options are things like:

-   `title`
-   `author`
-   `date`
-   `output`

1.  The *body* of the document is everything below the YAML header. It consists of a mix of narrative and R code. All the text that is narrative is written in a markup syntax called **Markdown** (although you can also use LaTeX math notation). In turn, all the text that is code is written in R syntax inside *blocks of code.*

-   The header uses YAML syntax
-   The narrative in the body uses Markdown syntax.
-   The code and commands use R syntax.

### Markdown tutorial

-   *Italics* (italics)
-   **Bold** (bold)
-   Paragraphs:
    -   use two blank spaces at the end of the line or
    -   this is a line break
-   Headings: a hash `#` and a space makes a header. The more `#`, the smaller the header.

> Blockquotes: To create a blockquote, start a line with greater than `>` followed by an optional space. Blockquotes can be nested and can also contain other formatting. end of blockquote

-   Lists:
    -   unordered lists use asteriks `+`, or `-` as list markers
    -   ordered lists use numbers followed by a period `.` or right paren `)`
-   Links:
    -   links can either inline with the text, or placed at the bottom of the text as references. Link text is enclosed by square brackets `[]`, and for inline links, the link URL is enclosed by parens `()`.
-   Images:
    -   images are almost identical to links, but an image starts with an exclamation point `!`.
-   Code:
    -   `code`

    <!-- -->

        or use 3 backticks

-   Nested Lists
    -   Item
        1.  First subitem
        2.  Second subitem

### Data Types in R

-   Integer (whole numbers)
-   Double (real, decimal numbers)
-   Logical (boolean)
-   Character (strings)
-   Numeric (integer/real/double numbers)

### Coercion

If you mix different data values, R will **implicity coerce** them so they are ALL of the same type

``` r
#example 
a <- c(1,2,3,"four","five")
b <- c(TRUE,FALSE,3,4)
```

R provides a set of **explicit** coercion functions that allow you to "convert" one type of data into another:

-   as.character()
-   as.numeric()
-   as.integer()
-   as.logical()

### How does R coerce data types in vectors?

R follows two basic rules of implicit coercion

1.  If a character is present, R will coerce everything else to characters.
2.  If a vector contains logicals and numbers, R will convert the logicals to numbers (TRUE to 1, FALSE to 0)

Here is the general rule:

-   logical &lt; integer &lt; numeric &lt; complex &lt; character

### Special data values in R

-   `Null` = null object
-   `NA` = Not Available (missing value)
-   `Inf` = positive infinite
-   `-Inf` = negative infinite
-   `NaN` = Not a Number (different from NA)

### Subsetting

#### Numeric subsetting

``` r
x <- c(2,4,6,8)

# first 3 elements
x[1:3]
```

    [1] 2 4 6

``` r
# non-consecutive elements
x[c(1,3)]
```

    [1] 2 6

``` r
# different order
x[c(3,2,4,1)]
```

    [1] 6 4 8 2

**Logical subsetting** occurs when the vector of indices that you pass inside the brackets is a logical vector.

``` r
x <- c(2,4,6,8)
names(x) <- letters[1:4]
      
# first element
x[c(TRUE,FALSE,FALSE,FALSE)]
```

    a 
    2 

``` r
# elements equal to 2
x[x == 2]
```

    a 
    2 

``` r
# elements different to 2
x[x != 2]
```

    b c d 
    4 6 8 

``` r
# all elements
x[TRUE]
```

    a b c d 
    2 4 6 8 

``` r
# convert numbers as logicals 
x[as.logical(c(0,1,pi,-10))]
```

    b c d 
    4 6 8 

**Character subsetting** occurs with characters

``` r
# element names "a"
x["a"]
```

    a 
    2 

``` r
# "b" and "d"
x[c("b","d")]
```

    b d 
    4 8 

``` r
# "a" 5 times
x[rep("a",5)]
```

    a a a a a 
    2 2 2 2 2 

### Indexing

*Bracket notation for vectors*

-   To extract values from R object use brackets: \[\]
-   Inside the brackets specify vector(s) of indices
-   Use as many indices, separated by commas, as dimensions in the object
-   Vector(s) of indices can be *numbers, logicals*, and sometimes *characters*
-   df\[i,j\]: i is the row index, j is the column index

``` r
# example
list <-  list(
  c(1,2,3),
  matrix(1:9, nrow = 3, ncol = 3),
  list(1:2, c(TRUE,FALSE), c("a","b"))
) 
```

##### access list elements

``` r
# list[elem]

list[1]
```

    [[1]]
    [1] 1 2 3

##### access object of list element

``` r
# list[[elem]]

list[[1]]
```

    [1] 1 2 3

##### access object's elemets, of list element

``` r
# list[[elem]][obj]

list[[1]][2]
```

    [1] 2

``` r
list[[2]][1,1]
```

    [1] 1

``` r
list[[2]][,2]
```

    [1] 4 5 6

##### access object's elements, of list element

``` r
# list[[elem]][[obj]]

list[[3]][[1]]
```

    [1] 1 2

##### access element of object's elements, of list element

``` r
# list[[elem]][[obj]][ind]
  
list[[3]][[1]][1]
```

    [1] 1

``` r
list[[3]][[3]][c(1,2)]
```

    [1] "a" "b"

#### Dollar notation

##### access list named elements

``` r
lst <- list(
  vec = c(1,2,3),
  mat = matrix(1:9, nrow = 3, ncol = 3),
  lis = list(1:2, c(TRUE,FALSE), c("a","b"))
)

lst$vec
```

    [1] 1 2 3

##### access list named elements

``` r
lst$vec[2]
```

    [1] 2

``` r
lst$lis[[1]]
```

    [1] 1 2

### Recycling Rule & Vectorization

#### Recycling Example

``` r
x <- c(2,4,6,7)
x + 3
```

    [1]  5  7  9 10

-   Most functions that operate with vectors in R are vectorized functions. This means that an action is applied to all elements of the vector without the need to explicitly type commands to traverse all the elements.

### Object Names

There are certain rules you have to follow when creating objects and variables. Object names cannot start with a digit and cannot contain certain other characters such as a comma or a space. You will be wise to adopt a convention for demarcating words in names.

### Factors

Vectors, matrices, and arrays are atomic structures (they can only store one type of data)

-   A factor is a data structure designed to handle **categorical data**.
-   Use factor().
-   Factors are **internally stored as vectors of integers**.
-   Factors generally convert strings or characters, (i.e. "yes" to yes)
-   Under the hood, a factor is internally stored using two arrays (R vectors): one is an integer array containing the values of the categories, the other array is the "levels" which has the names of categories which are mapped to the integers.
-   `table()` is a function to get a table with the frequencies (i.e. counts) of the factor categories or *levels*
-   use `as.factor()` to force a vector to have a factor data structure

### Lists

-   A list is the most general data structure in r
-   Lists can contain any other type of data structure
-   Lists can even contain other lists
-   Lists are a special type of vector
-   Lists are vectors in the sense of being a one-dimensional object.
-   Lists are NOT atomic structures.

### Inspecting the data objects

-   `typeof()` type of storage of any object
-   `class()` gives you the class of the object
-   `str()` displays the structure of an object in a compact way
-   `mode()` gives the data type (as used in R)
-   `object.size()` gives an estimate of the memory space used by an object
-   `length()` gives the length (i.e. number of elements)
-   `head()` take a peek at the first elements
-   `tail()` take a peek at the last elements
-   `summary()` shows a summary of a given object

### R data frames

-   R data frames are special kinds of lists
-   Stored in R as a list of vectors (or factors)
-   Columns are typically atomic structures.
-   But since a data frame is a list, you can mix different types of columns.
-   Data frames are NOT matrices but they behave a lot like matrices

#### Retrieving data frame information: bracket notation

##### retrieving cells

``` r
df <- airquality

# a single cell
df[2,2]
```

    [1] 118

``` r
# various adjacent cells (permuted order)
df[5:1,6:4]
```

      Day Month Temp
    5   5     5   56
    4   4     5   62
    3   3     5   74
    2   2     5   72
    1   1     5   67

``` r
# non-adjacent cells
df[c(1,50,100), c(3,5)]
```

        Wind Month
    1    7.4     5
    50  11.5     6
    100 10.3     8

##### retrieving cells (excluding indices)

``` r
# various adjacent cells
df[-(1:5),-(4:6)]
```

        Ozone Solar.R Wind
    6      28      NA 14.9
    7      23     299  8.6
    8      19      99 13.8
    9       8      19 20.1
    10     NA     194  8.6
    11      7      NA  6.9
    12     16     256  9.7
    13     11     290  9.2
    14     14     274 10.9
    15     18      65 13.2
    16     14     334 11.5
    17     34     307 12.0
    18      6      78 18.4
    19     30     322 11.5
    20     11      44  9.7
    21      1       8  9.7
    22     11     320 16.6
    23      4      25  9.7
    24     32      92 12.0
    25     NA      66 16.6
    26     NA     266 14.9
    27     NA      NA  8.0
    28     23      13 12.0
    29     45     252 14.9
    30    115     223  5.7
    31     37     279  7.4
    32     NA     286  8.6
    33     NA     287  9.7
    34     NA     242 16.1
    35     NA     186  9.2
    36     NA     220  8.6
    37     NA     264 14.3
    38     29     127  9.7
    39     NA     273  6.9
    40     71     291 13.8
    41     39     323 11.5
    42     NA     259 10.9
    43     NA     250  9.2
    44     23     148  8.0
    45     NA     332 13.8
    46     NA     322 11.5
    47     21     191 14.9
    48     37     284 20.7
    49     20      37  9.2
    50     12     120 11.5
    51     13     137 10.3
    52     NA     150  6.3
    53     NA      59  1.7
    54     NA      91  4.6
    55     NA     250  6.3
    56     NA     135  8.0
    57     NA     127  8.0
    58     NA      47 10.3
    59     NA      98 11.5
    60     NA      31 14.9
    61     NA     138  8.0
    62    135     269  4.1
    63     49     248  9.2
    64     32     236  9.2
    65     NA     101 10.9
    66     64     175  4.6
    67     40     314 10.9
    68     77     276  5.1
    69     97     267  6.3
    70     97     272  5.7
    71     85     175  7.4
    72     NA     139  8.6
    73     10     264 14.3
    74     27     175 14.9
    75     NA     291 14.9
    76      7      48 14.3
    77     48     260  6.9
    78     35     274 10.3
    79     61     285  6.3
    80     79     187  5.1
    81     63     220 11.5
    82     16       7  6.9
    83     NA     258  9.7
    84     NA     295 11.5
    85     80     294  8.6
    86    108     223  8.0
    87     20      81  8.6
    88     52      82 12.0
    89     82     213  7.4
    90     50     275  7.4
    91     64     253  7.4
    92     59     254  9.2
    93     39      83  6.9
    94      9      24 13.8
    95     16      77  7.4
    96     78      NA  6.9
    97     35      NA  7.4
    98     66      NA  4.6
    99    122     255  4.0
    100    89     229 10.3
    101   110     207  8.0
    102    NA     222  8.6
    103    NA     137 11.5
    104    44     192 11.5
    105    28     273 11.5
    106    65     157  9.7
    107    NA      64 11.5
    108    22      71 10.3
    109    59      51  6.3
    110    23     115  7.4
    111    31     244 10.9
    112    44     190 10.3
    113    21     259 15.5
    114     9      36 14.3
    115    NA     255 12.6
    116    45     212  9.7
    117   168     238  3.4
    118    73     215  8.0
    119    NA     153  5.7
    120    76     203  9.7
    121   118     225  2.3
    122    84     237  6.3
    123    85     188  6.3
    124    96     167  6.9
    125    78     197  5.1
    126    73     183  2.8
    127    91     189  4.6
    128    47      95  7.4
    129    32      92 15.5
    130    20     252 10.9
    131    23     220 10.3
    132    21     230 10.9
    133    24     259  9.7
    134    44     236 14.9
    135    21     259 15.5
    136    28     238  6.3
    137     9      24 10.9
    138    13     112 11.5
    139    46     237  6.9
    140    18     224 13.8
    141    13      27 10.3
    142    24     238 10.3
    143    16     201  8.0
    144    13     238 12.6
    145    23      14  9.2
    146    36     139 10.3
    147     7      49 10.3
    148    14      20 16.6
    149    30     193  6.9
    150    NA     145 13.2
    151    14     191 14.3
    152    18     131  8.0
    153    20     223 11.5

``` r
# non-adjacent cells
df[-c(1,50,100), -c(3,5)]
```

        Ozone Solar.R Temp Day
    2      36     118   72   2
    3      12     149   74   3
    4      18     313   62   4
    5      NA      NA   56   5
    6      28      NA   66   6
    7      23     299   65   7
    8      19      99   59   8
    9       8      19   61   9
    10     NA     194   69  10
    11      7      NA   74  11
    12     16     256   69  12
    13     11     290   66  13
    14     14     274   68  14
    15     18      65   58  15
    16     14     334   64  16
    17     34     307   66  17
    18      6      78   57  18
    19     30     322   68  19
    20     11      44   62  20
    21      1       8   59  21
    22     11     320   73  22
    23      4      25   61  23
    24     32      92   61  24
    25     NA      66   57  25
    26     NA     266   58  26
    27     NA      NA   57  27
    28     23      13   67  28
    29     45     252   81  29
    30    115     223   79  30
    31     37     279   76  31
    32     NA     286   78   1
    33     NA     287   74   2
    34     NA     242   67   3
    35     NA     186   84   4
    36     NA     220   85   5
    37     NA     264   79   6
    38     29     127   82   7
    39     NA     273   87   8
    40     71     291   90   9
    41     39     323   87  10
    42     NA     259   93  11
    43     NA     250   92  12
    44     23     148   82  13
    45     NA     332   80  14
    46     NA     322   79  15
    47     21     191   77  16
    48     37     284   72  17
    49     20      37   65  18
    51     13     137   76  20
    52     NA     150   77  21
    53     NA      59   76  22
    54     NA      91   76  23
    55     NA     250   76  24
    56     NA     135   75  25
    57     NA     127   78  26
    58     NA      47   73  27
    59     NA      98   80  28
    60     NA      31   77  29
    61     NA     138   83  30
    62    135     269   84   1
    63     49     248   85   2
    64     32     236   81   3
    65     NA     101   84   4
    66     64     175   83   5
    67     40     314   83   6
    68     77     276   88   7
    69     97     267   92   8
    70     97     272   92   9
    71     85     175   89  10
    72     NA     139   82  11
    73     10     264   73  12
    74     27     175   81  13
    75     NA     291   91  14
    76      7      48   80  15
    77     48     260   81  16
    78     35     274   82  17
    79     61     285   84  18
    80     79     187   87  19
    81     63     220   85  20
    82     16       7   74  21
    83     NA     258   81  22
    84     NA     295   82  23
    85     80     294   86  24
    86    108     223   85  25
    87     20      81   82  26
    88     52      82   86  27
    89     82     213   88  28
    90     50     275   86  29
    91     64     253   83  30
    92     59     254   81  31
    93     39      83   81   1
    94      9      24   81   2
    95     16      77   82   3
    96     78      NA   86   4
    97     35      NA   85   5
    98     66      NA   87   6
    99    122     255   89   7
    101   110     207   90   9
    102    NA     222   92  10
    103    NA     137   86  11
    104    44     192   86  12
    105    28     273   82  13
    106    65     157   80  14
    107    NA      64   79  15
    108    22      71   77  16
    109    59      51   79  17
    110    23     115   76  18
    111    31     244   78  19
    112    44     190   78  20
    113    21     259   77  21
    114     9      36   72  22
    115    NA     255   75  23
    116    45     212   79  24
    117   168     238   81  25
    118    73     215   86  26
    119    NA     153   88  27
    120    76     203   97  28
    121   118     225   94  29
    122    84     237   96  30
    123    85     188   94  31
    124    96     167   91   1
    125    78     197   92   2
    126    73     183   93   3
    127    91     189   93   4
    128    47      95   87   5
    129    32      92   84   6
    130    20     252   80   7
    131    23     220   78   8
    132    21     230   75   9
    133    24     259   73  10
    134    44     236   81  11
    135    21     259   76  12
    136    28     238   77  13
    137     9      24   71  14
    138    13     112   71  15
    139    46     237   78  16
    140    18     224   67  17
    141    13      27   76  18
    142    24     238   68  19
    143    16     201   82  20
    144    13     238   64  21
    145    23      14   71  22
    146    36     139   81  23
    147     7      49   69  24
    148    14      20   63  25
    149    30     193   70  26
    150    NA     145   77  27
    151    14     191   75  28
    152    18     131   76  29
    153    20     223   68  30

##### retrieving rows or columns

``` r
# rows
df[1,]
```

      Ozone Solar.R Wind Temp Month Day
    1    41     190  7.4   67     5   1

``` r
df[c(2,4,6),]
```

      Ozone Solar.R Wind Temp Month Day
    2    36     118  8.0   72     5   2
    4    18     313 11.5   62     5   4
    6    28      NA 14.9   66     5   6

``` r
# columns
df[,1]
```

      [1]  41  36  12  18  NA  28  23  19   8  NA   7  16  11  14  18  14  34
     [18]   6  30  11   1  11   4  32  NA  NA  NA  23  45 115  37  NA  NA  NA
     [35]  NA  NA  NA  29  NA  71  39  NA  NA  23  NA  NA  21  37  20  12  13
     [52]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA 135  49  32  NA  64  40  77
     [69]  97  97  85  NA  10  27  NA   7  48  35  61  79  63  16  NA  NA  80
     [86] 108  20  52  82  50  64  59  39   9  16  78  35  66 122  89 110  NA
    [103]  NA  44  28  65  NA  22  59  23  31  44  21   9  NA  45 168  73  NA
    [120]  76 118  84  85  96  78  73  91  47  32  20  23  21  24  44  21  28
    [137]   9  13  46  18  13  24  16  13  23  36   7  14  30  NA  14  18  20

``` r
df[,1:3]
```

        Ozone Solar.R Wind
    1      41     190  7.4
    2      36     118  8.0
    3      12     149 12.6
    4      18     313 11.5
    5      NA      NA 14.3
    6      28      NA 14.9
    7      23     299  8.6
    8      19      99 13.8
    9       8      19 20.1
    10     NA     194  8.6
    11      7      NA  6.9
    12     16     256  9.7
    13     11     290  9.2
    14     14     274 10.9
    15     18      65 13.2
    16     14     334 11.5
    17     34     307 12.0
    18      6      78 18.4
    19     30     322 11.5
    20     11      44  9.7
    21      1       8  9.7
    22     11     320 16.6
    23      4      25  9.7
    24     32      92 12.0
    25     NA      66 16.6
    26     NA     266 14.9
    27     NA      NA  8.0
    28     23      13 12.0
    29     45     252 14.9
    30    115     223  5.7
    31     37     279  7.4
    32     NA     286  8.6
    33     NA     287  9.7
    34     NA     242 16.1
    35     NA     186  9.2
    36     NA     220  8.6
    37     NA     264 14.3
    38     29     127  9.7
    39     NA     273  6.9
    40     71     291 13.8
    41     39     323 11.5
    42     NA     259 10.9
    43     NA     250  9.2
    44     23     148  8.0
    45     NA     332 13.8
    46     NA     322 11.5
    47     21     191 14.9
    48     37     284 20.7
    49     20      37  9.2
    50     12     120 11.5
    51     13     137 10.3
    52     NA     150  6.3
    53     NA      59  1.7
    54     NA      91  4.6
    55     NA     250  6.3
    56     NA     135  8.0
    57     NA     127  8.0
    58     NA      47 10.3
    59     NA      98 11.5
    60     NA      31 14.9
    61     NA     138  8.0
    62    135     269  4.1
    63     49     248  9.2
    64     32     236  9.2
    65     NA     101 10.9
    66     64     175  4.6
    67     40     314 10.9
    68     77     276  5.1
    69     97     267  6.3
    70     97     272  5.7
    71     85     175  7.4
    72     NA     139  8.6
    73     10     264 14.3
    74     27     175 14.9
    75     NA     291 14.9
    76      7      48 14.3
    77     48     260  6.9
    78     35     274 10.3
    79     61     285  6.3
    80     79     187  5.1
    81     63     220 11.5
    82     16       7  6.9
    83     NA     258  9.7
    84     NA     295 11.5
    85     80     294  8.6
    86    108     223  8.0
    87     20      81  8.6
    88     52      82 12.0
    89     82     213  7.4
    90     50     275  7.4
    91     64     253  7.4
    92     59     254  9.2
    93     39      83  6.9
    94      9      24 13.8
    95     16      77  7.4
    96     78      NA  6.9
    97     35      NA  7.4
    98     66      NA  4.6
    99    122     255  4.0
    100    89     229 10.3
    101   110     207  8.0
    102    NA     222  8.6
    103    NA     137 11.5
    104    44     192 11.5
    105    28     273 11.5
    106    65     157  9.7
    107    NA      64 11.5
    108    22      71 10.3
    109    59      51  6.3
    110    23     115  7.4
    111    31     244 10.9
    112    44     190 10.3
    113    21     259 15.5
    114     9      36 14.3
    115    NA     255 12.6
    116    45     212  9.7
    117   168     238  3.4
    118    73     215  8.0
    119    NA     153  5.7
    120    76     203  9.7
    121   118     225  2.3
    122    84     237  6.3
    123    85     188  6.3
    124    96     167  6.9
    125    78     197  5.1
    126    73     183  2.8
    127    91     189  4.6
    128    47      95  7.4
    129    32      92 15.5
    130    20     252 10.9
    131    23     220 10.3
    132    21     230 10.9
    133    24     259  9.7
    134    44     236 14.9
    135    21     259 15.5
    136    28     238  6.3
    137     9      24 10.9
    138    13     112 11.5
    139    46     237  6.9
    140    18     224 13.8
    141    13      27 10.3
    142    24     238 10.3
    143    16     201  8.0
    144    13     238 12.6
    145    23      14  9.2
    146    36     139 10.3
    147     7      49 10.3
    148    14      20 16.6
    149    30     193  6.9
    150    NA     145 13.2
    151    14     191 14.3
    152    18     131  8.0
    153    20     223 11.5

``` r
# excluding indices: rows
df[-1,]
```

        Ozone Solar.R Wind Temp Month Day
    2      36     118  8.0   72     5   2
    3      12     149 12.6   74     5   3
    4      18     313 11.5   62     5   4
    5      NA      NA 14.3   56     5   5
    6      28      NA 14.9   66     5   6
    7      23     299  8.6   65     5   7
    8      19      99 13.8   59     5   8
    9       8      19 20.1   61     5   9
    10     NA     194  8.6   69     5  10
    11      7      NA  6.9   74     5  11
    12     16     256  9.7   69     5  12
    13     11     290  9.2   66     5  13
    14     14     274 10.9   68     5  14
    15     18      65 13.2   58     5  15
    16     14     334 11.5   64     5  16
    17     34     307 12.0   66     5  17
    18      6      78 18.4   57     5  18
    19     30     322 11.5   68     5  19
    20     11      44  9.7   62     5  20
    21      1       8  9.7   59     5  21
    22     11     320 16.6   73     5  22
    23      4      25  9.7   61     5  23
    24     32      92 12.0   61     5  24
    25     NA      66 16.6   57     5  25
    26     NA     266 14.9   58     5  26
    27     NA      NA  8.0   57     5  27
    28     23      13 12.0   67     5  28
    29     45     252 14.9   81     5  29
    30    115     223  5.7   79     5  30
    31     37     279  7.4   76     5  31
    32     NA     286  8.6   78     6   1
    33     NA     287  9.7   74     6   2
    34     NA     242 16.1   67     6   3
    35     NA     186  9.2   84     6   4
    36     NA     220  8.6   85     6   5
    37     NA     264 14.3   79     6   6
    38     29     127  9.7   82     6   7
    39     NA     273  6.9   87     6   8
    40     71     291 13.8   90     6   9
    41     39     323 11.5   87     6  10
    42     NA     259 10.9   93     6  11
    43     NA     250  9.2   92     6  12
    44     23     148  8.0   82     6  13
    45     NA     332 13.8   80     6  14
    46     NA     322 11.5   79     6  15
    47     21     191 14.9   77     6  16
    48     37     284 20.7   72     6  17
    49     20      37  9.2   65     6  18
    50     12     120 11.5   73     6  19
    51     13     137 10.3   76     6  20
    52     NA     150  6.3   77     6  21
    53     NA      59  1.7   76     6  22
    54     NA      91  4.6   76     6  23
    55     NA     250  6.3   76     6  24
    56     NA     135  8.0   75     6  25
    57     NA     127  8.0   78     6  26
    58     NA      47 10.3   73     6  27
    59     NA      98 11.5   80     6  28
    60     NA      31 14.9   77     6  29
    61     NA     138  8.0   83     6  30
    62    135     269  4.1   84     7   1
    63     49     248  9.2   85     7   2
    64     32     236  9.2   81     7   3
    65     NA     101 10.9   84     7   4
    66     64     175  4.6   83     7   5
    67     40     314 10.9   83     7   6
    68     77     276  5.1   88     7   7
    69     97     267  6.3   92     7   8
    70     97     272  5.7   92     7   9
    71     85     175  7.4   89     7  10
    72     NA     139  8.6   82     7  11
    73     10     264 14.3   73     7  12
    74     27     175 14.9   81     7  13
    75     NA     291 14.9   91     7  14
    76      7      48 14.3   80     7  15
    77     48     260  6.9   81     7  16
    78     35     274 10.3   82     7  17
    79     61     285  6.3   84     7  18
    80     79     187  5.1   87     7  19
    81     63     220 11.5   85     7  20
    82     16       7  6.9   74     7  21
    83     NA     258  9.7   81     7  22
    84     NA     295 11.5   82     7  23
    85     80     294  8.6   86     7  24
    86    108     223  8.0   85     7  25
    87     20      81  8.6   82     7  26
    88     52      82 12.0   86     7  27
    89     82     213  7.4   88     7  28
    90     50     275  7.4   86     7  29
    91     64     253  7.4   83     7  30
    92     59     254  9.2   81     7  31
    93     39      83  6.9   81     8   1
    94      9      24 13.8   81     8   2
    95     16      77  7.4   82     8   3
    96     78      NA  6.9   86     8   4
    97     35      NA  7.4   85     8   5
    98     66      NA  4.6   87     8   6
    99    122     255  4.0   89     8   7
    100    89     229 10.3   90     8   8
    101   110     207  8.0   90     8   9
    102    NA     222  8.6   92     8  10
    103    NA     137 11.5   86     8  11
    104    44     192 11.5   86     8  12
    105    28     273 11.5   82     8  13
    106    65     157  9.7   80     8  14
    107    NA      64 11.5   79     8  15
    108    22      71 10.3   77     8  16
    109    59      51  6.3   79     8  17
    110    23     115  7.4   76     8  18
    111    31     244 10.9   78     8  19
    112    44     190 10.3   78     8  20
    113    21     259 15.5   77     8  21
    114     9      36 14.3   72     8  22
    115    NA     255 12.6   75     8  23
    116    45     212  9.7   79     8  24
    117   168     238  3.4   81     8  25
    118    73     215  8.0   86     8  26
    119    NA     153  5.7   88     8  27
    120    76     203  9.7   97     8  28
    121   118     225  2.3   94     8  29
    122    84     237  6.3   96     8  30
    123    85     188  6.3   94     8  31
    124    96     167  6.9   91     9   1
    125    78     197  5.1   92     9   2
    126    73     183  2.8   93     9   3
    127    91     189  4.6   93     9   4
    128    47      95  7.4   87     9   5
    129    32      92 15.5   84     9   6
    130    20     252 10.9   80     9   7
    131    23     220 10.3   78     9   8
    132    21     230 10.9   75     9   9
    133    24     259  9.7   73     9  10
    134    44     236 14.9   81     9  11
    135    21     259 15.5   76     9  12
    136    28     238  6.3   77     9  13
    137     9      24 10.9   71     9  14
    138    13     112 11.5   71     9  15
    139    46     237  6.9   78     9  16
    140    18     224 13.8   67     9  17
    141    13      27 10.3   76     9  18
    142    24     238 10.3   68     9  19
    143    16     201  8.0   82     9  20
    144    13     238 12.6   64     9  21
    145    23      14  9.2   71     9  22
    146    36     139 10.3   81     9  23
    147     7      49 10.3   69     9  24
    148    14      20 16.6   63     9  25
    149    30     193  6.9   70     9  26
    150    NA     145 13.2   77     9  27
    151    14     191 14.3   75     9  28
    152    18     131  8.0   76     9  29
    153    20     223 11.5   68     9  30

``` r
# excluding indices: columns
df[,-1]
```

        Solar.R Wind Temp Month Day
    1       190  7.4   67     5   1
    2       118  8.0   72     5   2
    3       149 12.6   74     5   3
    4       313 11.5   62     5   4
    5        NA 14.3   56     5   5
    6        NA 14.9   66     5   6
    7       299  8.6   65     5   7
    8        99 13.8   59     5   8
    9        19 20.1   61     5   9
    10      194  8.6   69     5  10
    11       NA  6.9   74     5  11
    12      256  9.7   69     5  12
    13      290  9.2   66     5  13
    14      274 10.9   68     5  14
    15       65 13.2   58     5  15
    16      334 11.5   64     5  16
    17      307 12.0   66     5  17
    18       78 18.4   57     5  18
    19      322 11.5   68     5  19
    20       44  9.7   62     5  20
    21        8  9.7   59     5  21
    22      320 16.6   73     5  22
    23       25  9.7   61     5  23
    24       92 12.0   61     5  24
    25       66 16.6   57     5  25
    26      266 14.9   58     5  26
    27       NA  8.0   57     5  27
    28       13 12.0   67     5  28
    29      252 14.9   81     5  29
    30      223  5.7   79     5  30
    31      279  7.4   76     5  31
    32      286  8.6   78     6   1
    33      287  9.7   74     6   2
    34      242 16.1   67     6   3
    35      186  9.2   84     6   4
    36      220  8.6   85     6   5
    37      264 14.3   79     6   6
    38      127  9.7   82     6   7
    39      273  6.9   87     6   8
    40      291 13.8   90     6   9
    41      323 11.5   87     6  10
    42      259 10.9   93     6  11
    43      250  9.2   92     6  12
    44      148  8.0   82     6  13
    45      332 13.8   80     6  14
    46      322 11.5   79     6  15
    47      191 14.9   77     6  16
    48      284 20.7   72     6  17
    49       37  9.2   65     6  18
    50      120 11.5   73     6  19
    51      137 10.3   76     6  20
    52      150  6.3   77     6  21
    53       59  1.7   76     6  22
    54       91  4.6   76     6  23
    55      250  6.3   76     6  24
    56      135  8.0   75     6  25
    57      127  8.0   78     6  26
    58       47 10.3   73     6  27
    59       98 11.5   80     6  28
    60       31 14.9   77     6  29
    61      138  8.0   83     6  30
    62      269  4.1   84     7   1
    63      248  9.2   85     7   2
    64      236  9.2   81     7   3
    65      101 10.9   84     7   4
    66      175  4.6   83     7   5
    67      314 10.9   83     7   6
    68      276  5.1   88     7   7
    69      267  6.3   92     7   8
    70      272  5.7   92     7   9
    71      175  7.4   89     7  10
    72      139  8.6   82     7  11
    73      264 14.3   73     7  12
    74      175 14.9   81     7  13
    75      291 14.9   91     7  14
    76       48 14.3   80     7  15
    77      260  6.9   81     7  16
    78      274 10.3   82     7  17
    79      285  6.3   84     7  18
    80      187  5.1   87     7  19
    81      220 11.5   85     7  20
    82        7  6.9   74     7  21
    83      258  9.7   81     7  22
    84      295 11.5   82     7  23
    85      294  8.6   86     7  24
    86      223  8.0   85     7  25
    87       81  8.6   82     7  26
    88       82 12.0   86     7  27
    89      213  7.4   88     7  28
    90      275  7.4   86     7  29
    91      253  7.4   83     7  30
    92      254  9.2   81     7  31
    93       83  6.9   81     8   1
    94       24 13.8   81     8   2
    95       77  7.4   82     8   3
    96       NA  6.9   86     8   4
    97       NA  7.4   85     8   5
    98       NA  4.6   87     8   6
    99      255  4.0   89     8   7
    100     229 10.3   90     8   8
    101     207  8.0   90     8   9
    102     222  8.6   92     8  10
    103     137 11.5   86     8  11
    104     192 11.5   86     8  12
    105     273 11.5   82     8  13
    106     157  9.7   80     8  14
    107      64 11.5   79     8  15
    108      71 10.3   77     8  16
    109      51  6.3   79     8  17
    110     115  7.4   76     8  18
    111     244 10.9   78     8  19
    112     190 10.3   78     8  20
    113     259 15.5   77     8  21
    114      36 14.3   72     8  22
    115     255 12.6   75     8  23
    116     212  9.7   79     8  24
    117     238  3.4   81     8  25
    118     215  8.0   86     8  26
    119     153  5.7   88     8  27
    120     203  9.7   97     8  28
    121     225  2.3   94     8  29
    122     237  6.3   96     8  30
    123     188  6.3   94     8  31
    124     167  6.9   91     9   1
    125     197  5.1   92     9   2
    126     183  2.8   93     9   3
    127     189  4.6   93     9   4
    128      95  7.4   87     9   5
    129      92 15.5   84     9   6
    130     252 10.9   80     9   7
    131     220 10.3   78     9   8
    132     230 10.9   75     9   9
    133     259  9.7   73     9  10
    134     236 14.9   81     9  11
    135     259 15.5   76     9  12
    136     238  6.3   77     9  13
    137      24 10.9   71     9  14
    138     112 11.5   71     9  15
    139     237  6.9   78     9  16
    140     224 13.8   67     9  17
    141      27 10.3   76     9  18
    142     238 10.3   68     9  19
    143     201  8.0   82     9  20
    144     238 12.6   64     9  21
    145      14  9.2   71     9  22
    146     139 10.3   81     9  23
    147      49 10.3   69     9  24
    148      20 16.6   63     9  25
    149     193  6.9   70     9  26
    150     145 13.2   77     9  27
    151     191 14.3   75     9  28
    152     131  8.0   76     9  29
    153     223 11.5   68     9  30

``` r
# using column name Ozone

df[,"Ozone"]
```

      [1]  41  36  12  18  NA  28  23  19   8  NA   7  16  11  14  18  14  34
     [18]   6  30  11   1  11   4  32  NA  NA  NA  23  45 115  37  NA  NA  NA
     [35]  NA  NA  NA  29  NA  71  39  NA  NA  23  NA  NA  21  37  20  12  13
     [52]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA 135  49  32  NA  64  40  77
     [69]  97  97  85  NA  10  27  NA   7  48  35  61  79  63  16  NA  NA  80
     [86] 108  20  52  82  50  64  59  39   9  16  78  35  66 122  89 110  NA
    [103]  NA  44  28  65  NA  22  59  23  31  44  21   9  NA  45 168  73  NA
    [120]  76 118  84  85  96  78  73  91  47  32  20  23  21  24  44  21  28
    [137]   9  13  46  18  13  24  16  13  23  36   7  14  30  NA  14  18  20

``` r
# using column name wind and temp
df[,c("Wind","Temp")]
```

        Wind Temp
    1    7.4   67
    2    8.0   72
    3   12.6   74
    4   11.5   62
    5   14.3   56
    6   14.9   66
    7    8.6   65
    8   13.8   59
    9   20.1   61
    10   8.6   69
    11   6.9   74
    12   9.7   69
    13   9.2   66
    14  10.9   68
    15  13.2   58
    16  11.5   64
    17  12.0   66
    18  18.4   57
    19  11.5   68
    20   9.7   62
    21   9.7   59
    22  16.6   73
    23   9.7   61
    24  12.0   61
    25  16.6   57
    26  14.9   58
    27   8.0   57
    28  12.0   67
    29  14.9   81
    30   5.7   79
    31   7.4   76
    32   8.6   78
    33   9.7   74
    34  16.1   67
    35   9.2   84
    36   8.6   85
    37  14.3   79
    38   9.7   82
    39   6.9   87
    40  13.8   90
    41  11.5   87
    42  10.9   93
    43   9.2   92
    44   8.0   82
    45  13.8   80
    46  11.5   79
    47  14.9   77
    48  20.7   72
    49   9.2   65
    50  11.5   73
    51  10.3   76
    52   6.3   77
    53   1.7   76
    54   4.6   76
    55   6.3   76
    56   8.0   75
    57   8.0   78
    58  10.3   73
    59  11.5   80
    60  14.9   77
    61   8.0   83
    62   4.1   84
    63   9.2   85
    64   9.2   81
    65  10.9   84
    66   4.6   83
    67  10.9   83
    68   5.1   88
    69   6.3   92
    70   5.7   92
    71   7.4   89
    72   8.6   82
    73  14.3   73
    74  14.9   81
    75  14.9   91
    76  14.3   80
    77   6.9   81
    78  10.3   82
    79   6.3   84
    80   5.1   87
    81  11.5   85
    82   6.9   74
    83   9.7   81
    84  11.5   82
    85   8.6   86
    86   8.0   85
    87   8.6   82
    88  12.0   86
    89   7.4   88
    90   7.4   86
    91   7.4   83
    92   9.2   81
    93   6.9   81
    94  13.8   81
    95   7.4   82
    96   6.9   86
    97   7.4   85
    98   4.6   87
    99   4.0   89
    100 10.3   90
    101  8.0   90
    102  8.6   92
    103 11.5   86
    104 11.5   86
    105 11.5   82
    106  9.7   80
    107 11.5   79
    108 10.3   77
    109  6.3   79
    110  7.4   76
    111 10.9   78
    112 10.3   78
    113 15.5   77
    114 14.3   72
    115 12.6   75
    116  9.7   79
    117  3.4   81
    118  8.0   86
    119  5.7   88
    120  9.7   97
    121  2.3   94
    122  6.3   96
    123  6.3   94
    124  6.9   91
    125  5.1   92
    126  2.8   93
    127  4.6   93
    128  7.4   87
    129 15.5   84
    130 10.9   80
    131 10.3   78
    132 10.9   75
    133  9.7   73
    134 14.9   81
    135 15.5   76
    136  6.3   77
    137 10.9   71
    138 11.5   71
    139  6.9   78
    140 13.8   67
    141 10.3   76
    142 10.3   68
    143  8.0   82
    144 12.6   64
    145  9.2   71
    146 10.3   81
    147 10.3   69
    148 16.6   63
    149  6.9   70
    150 13.2   77
    151 14.3   75
    152  8.0   76
    153 11.5   68

###### retrieving rows (logical indexing)

``` r
# records with Month 5
df[df$Month ==5,]
```

       Ozone Solar.R Wind Temp Month Day
    1     41     190  7.4   67     5   1
    2     36     118  8.0   72     5   2
    3     12     149 12.6   74     5   3
    4     18     313 11.5   62     5   4
    5     NA      NA 14.3   56     5   5
    6     28      NA 14.9   66     5   6
    7     23     299  8.6   65     5   7
    8     19      99 13.8   59     5   8
    9      8      19 20.1   61     5   9
    10    NA     194  8.6   69     5  10
    11     7      NA  6.9   74     5  11
    12    16     256  9.7   69     5  12
    13    11     290  9.2   66     5  13
    14    14     274 10.9   68     5  14
    15    18      65 13.2   58     5  15
    16    14     334 11.5   64     5  16
    17    34     307 12.0   66     5  17
    18     6      78 18.4   57     5  18
    19    30     322 11.5   68     5  19
    20    11      44  9.7   62     5  20
    21     1       8  9.7   59     5  21
    22    11     320 16.6   73     5  22
    23     4      25  9.7   61     5  23
    24    32      92 12.0   61     5  24
    25    NA      66 16.6   57     5  25
    26    NA     266 14.9   58     5  26
    27    NA      NA  8.0   57     5  27
    28    23      13 12.0   67     5  28
    29    45     252 14.9   81     5  29
    30   115     223  5.7   79     5  30
    31    37     279  7.4   76     5  31

``` r
# vector matching odd numbers
odds <- rep(c(TRUE,FALSE))
length <- nrow(df)

# even rows (logical negation)
df[-odds,]
```

        Ozone Solar.R Wind Temp Month Day
    2      36     118  8.0   72     5   2
    3      12     149 12.6   74     5   3
    4      18     313 11.5   62     5   4
    5      NA      NA 14.3   56     5   5
    6      28      NA 14.9   66     5   6
    7      23     299  8.6   65     5   7
    8      19      99 13.8   59     5   8
    9       8      19 20.1   61     5   9
    10     NA     194  8.6   69     5  10
    11      7      NA  6.9   74     5  11
    12     16     256  9.7   69     5  12
    13     11     290  9.2   66     5  13
    14     14     274 10.9   68     5  14
    15     18      65 13.2   58     5  15
    16     14     334 11.5   64     5  16
    17     34     307 12.0   66     5  17
    18      6      78 18.4   57     5  18
    19     30     322 11.5   68     5  19
    20     11      44  9.7   62     5  20
    21      1       8  9.7   59     5  21
    22     11     320 16.6   73     5  22
    23      4      25  9.7   61     5  23
    24     32      92 12.0   61     5  24
    25     NA      66 16.6   57     5  25
    26     NA     266 14.9   58     5  26
    27     NA      NA  8.0   57     5  27
    28     23      13 12.0   67     5  28
    29     45     252 14.9   81     5  29
    30    115     223  5.7   79     5  30
    31     37     279  7.4   76     5  31
    32     NA     286  8.6   78     6   1
    33     NA     287  9.7   74     6   2
    34     NA     242 16.1   67     6   3
    35     NA     186  9.2   84     6   4
    36     NA     220  8.6   85     6   5
    37     NA     264 14.3   79     6   6
    38     29     127  9.7   82     6   7
    39     NA     273  6.9   87     6   8
    40     71     291 13.8   90     6   9
    41     39     323 11.5   87     6  10
    42     NA     259 10.9   93     6  11
    43     NA     250  9.2   92     6  12
    44     23     148  8.0   82     6  13
    45     NA     332 13.8   80     6  14
    46     NA     322 11.5   79     6  15
    47     21     191 14.9   77     6  16
    48     37     284 20.7   72     6  17
    49     20      37  9.2   65     6  18
    50     12     120 11.5   73     6  19
    51     13     137 10.3   76     6  20
    52     NA     150  6.3   77     6  21
    53     NA      59  1.7   76     6  22
    54     NA      91  4.6   76     6  23
    55     NA     250  6.3   76     6  24
    56     NA     135  8.0   75     6  25
    57     NA     127  8.0   78     6  26
    58     NA      47 10.3   73     6  27
    59     NA      98 11.5   80     6  28
    60     NA      31 14.9   77     6  29
    61     NA     138  8.0   83     6  30
    62    135     269  4.1   84     7   1
    63     49     248  9.2   85     7   2
    64     32     236  9.2   81     7   3
    65     NA     101 10.9   84     7   4
    66     64     175  4.6   83     7   5
    67     40     314 10.9   83     7   6
    68     77     276  5.1   88     7   7
    69     97     267  6.3   92     7   8
    70     97     272  5.7   92     7   9
    71     85     175  7.4   89     7  10
    72     NA     139  8.6   82     7  11
    73     10     264 14.3   73     7  12
    74     27     175 14.9   81     7  13
    75     NA     291 14.9   91     7  14
    76      7      48 14.3   80     7  15
    77     48     260  6.9   81     7  16
    78     35     274 10.3   82     7  17
    79     61     285  6.3   84     7  18
    80     79     187  5.1   87     7  19
    81     63     220 11.5   85     7  20
    82     16       7  6.9   74     7  21
    83     NA     258  9.7   81     7  22
    84     NA     295 11.5   82     7  23
    85     80     294  8.6   86     7  24
    86    108     223  8.0   85     7  25
    87     20      81  8.6   82     7  26
    88     52      82 12.0   86     7  27
    89     82     213  7.4   88     7  28
    90     50     275  7.4   86     7  29
    91     64     253  7.4   83     7  30
    92     59     254  9.2   81     7  31
    93     39      83  6.9   81     8   1
    94      9      24 13.8   81     8   2
    95     16      77  7.4   82     8   3
    96     78      NA  6.9   86     8   4
    97     35      NA  7.4   85     8   5
    98     66      NA  4.6   87     8   6
    99    122     255  4.0   89     8   7
    100    89     229 10.3   90     8   8
    101   110     207  8.0   90     8   9
    102    NA     222  8.6   92     8  10
    103    NA     137 11.5   86     8  11
    104    44     192 11.5   86     8  12
    105    28     273 11.5   82     8  13
    106    65     157  9.7   80     8  14
    107    NA      64 11.5   79     8  15
    108    22      71 10.3   77     8  16
    109    59      51  6.3   79     8  17
    110    23     115  7.4   76     8  18
    111    31     244 10.9   78     8  19
    112    44     190 10.3   78     8  20
    113    21     259 15.5   77     8  21
    114     9      36 14.3   72     8  22
    115    NA     255 12.6   75     8  23
    116    45     212  9.7   79     8  24
    117   168     238  3.4   81     8  25
    118    73     215  8.0   86     8  26
    119    NA     153  5.7   88     8  27
    120    76     203  9.7   97     8  28
    121   118     225  2.3   94     8  29
    122    84     237  6.3   96     8  30
    123    85     188  6.3   94     8  31
    124    96     167  6.9   91     9   1
    125    78     197  5.1   92     9   2
    126    73     183  2.8   93     9   3
    127    91     189  4.6   93     9   4
    128    47      95  7.4   87     9   5
    129    32      92 15.5   84     9   6
    130    20     252 10.9   80     9   7
    131    23     220 10.3   78     9   8
    132    21     230 10.9   75     9   9
    133    24     259  9.7   73     9  10
    134    44     236 14.9   81     9  11
    135    21     259 15.5   76     9  12
    136    28     238  6.3   77     9  13
    137     9      24 10.9   71     9  14
    138    13     112 11.5   71     9  15
    139    46     237  6.9   78     9  16
    140    18     224 13.8   67     9  17
    141    13      27 10.3   76     9  18
    142    24     238 10.3   68     9  19
    143    16     201  8.0   82     9  20
    144    13     238 12.6   64     9  21
    145    23      14  9.2   71     9  22
    146    36     139 10.3   81     9  23
    147     7      49 10.3   69     9  24
    148    14      20 16.6   63     9  25
    149    30     193  6.9   70     9  26
    150    NA     145 13.2   77     9  27
    151    14     191 14.3   75     9  28
    152    18     131  8.0   76     9  29
    153    20     223 11.5   68     9  30

``` r
# columns: look for these names
these <- c("Day","Wind","Rain","Temp","XY","Snow")

# query logical selection
Q <- names(df) %in% these 

# selecting corresponding columns
df[,Q]
```

        Wind Temp Day
    1    7.4   67   1
    2    8.0   72   2
    3   12.6   74   3
    4   11.5   62   4
    5   14.3   56   5
    6   14.9   66   6
    7    8.6   65   7
    8   13.8   59   8
    9   20.1   61   9
    10   8.6   69  10
    11   6.9   74  11
    12   9.7   69  12
    13   9.2   66  13
    14  10.9   68  14
    15  13.2   58  15
    16  11.5   64  16
    17  12.0   66  17
    18  18.4   57  18
    19  11.5   68  19
    20   9.7   62  20
    21   9.7   59  21
    22  16.6   73  22
    23   9.7   61  23
    24  12.0   61  24
    25  16.6   57  25
    26  14.9   58  26
    27   8.0   57  27
    28  12.0   67  28
    29  14.9   81  29
    30   5.7   79  30
    31   7.4   76  31
    32   8.6   78   1
    33   9.7   74   2
    34  16.1   67   3
    35   9.2   84   4
    36   8.6   85   5
    37  14.3   79   6
    38   9.7   82   7
    39   6.9   87   8
    40  13.8   90   9
    41  11.5   87  10
    42  10.9   93  11
    43   9.2   92  12
    44   8.0   82  13
    45  13.8   80  14
    46  11.5   79  15
    47  14.9   77  16
    48  20.7   72  17
    49   9.2   65  18
    50  11.5   73  19
    51  10.3   76  20
    52   6.3   77  21
    53   1.7   76  22
    54   4.6   76  23
    55   6.3   76  24
    56   8.0   75  25
    57   8.0   78  26
    58  10.3   73  27
    59  11.5   80  28
    60  14.9   77  29
    61   8.0   83  30
    62   4.1   84   1
    63   9.2   85   2
    64   9.2   81   3
    65  10.9   84   4
    66   4.6   83   5
    67  10.9   83   6
    68   5.1   88   7
    69   6.3   92   8
    70   5.7   92   9
    71   7.4   89  10
    72   8.6   82  11
    73  14.3   73  12
    74  14.9   81  13
    75  14.9   91  14
    76  14.3   80  15
    77   6.9   81  16
    78  10.3   82  17
    79   6.3   84  18
    80   5.1   87  19
    81  11.5   85  20
    82   6.9   74  21
    83   9.7   81  22
    84  11.5   82  23
    85   8.6   86  24
    86   8.0   85  25
    87   8.6   82  26
    88  12.0   86  27
    89   7.4   88  28
    90   7.4   86  29
    91   7.4   83  30
    92   9.2   81  31
    93   6.9   81   1
    94  13.8   81   2
    95   7.4   82   3
    96   6.9   86   4
    97   7.4   85   5
    98   4.6   87   6
    99   4.0   89   7
    100 10.3   90   8
    101  8.0   90   9
    102  8.6   92  10
    103 11.5   86  11
    104 11.5   86  12
    105 11.5   82  13
    106  9.7   80  14
    107 11.5   79  15
    108 10.3   77  16
    109  6.3   79  17
    110  7.4   76  18
    111 10.9   78  19
    112 10.3   78  20
    113 15.5   77  21
    114 14.3   72  22
    115 12.6   75  23
    116  9.7   79  24
    117  3.4   81  25
    118  8.0   86  26
    119  5.7   88  27
    120  9.7   97  28
    121  2.3   94  29
    122  6.3   96  30
    123  6.3   94  31
    124  6.9   91   1
    125  5.1   92   2
    126  2.8   93   3
    127  4.6   93   4
    128  7.4   87   5
    129 15.5   84   6
    130 10.9   80   7
    131 10.3   78   8
    132 10.9   75   9
    133  9.7   73  10
    134 14.9   81  11
    135 15.5   76  12
    136  6.3   77  13
    137 10.9   71  14
    138 11.5   71  15
    139  6.9   78  16
    140 13.8   67  17
    141 10.3   76  18
    142 10.3   68  19
    143  8.0   82  20
    144 12.6   64  21
    145  9.2   71  22
    146 10.3   81  23
    147 10.3   69  24
    148 16.6   63  25
    149  6.9   70  26
    150 13.2   77  27
    151 14.3   75  28
    152  8.0   76  29
    153 11.5   68  30

#### Retrieving data frame information: dollar notation (columns)

``` r
# column Ozone
df$Ozone
```

      [1]  41  36  12  18  NA  28  23  19   8  NA   7  16  11  14  18  14  34
     [18]   6  30  11   1  11   4  32  NA  NA  NA  23  45 115  37  NA  NA  NA
     [35]  NA  NA  NA  29  NA  71  39  NA  NA  23  NA  NA  21  37  20  12  13
     [52]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA 135  49  32  NA  64  40  77
     [69]  97  97  85  NA  10  27  NA   7  48  35  61  79  63  16  NA  NA  80
     [86] 108  20  52  82  50  64  59  39   9  16  78  35  66 122  89 110  NA
    [103]  NA  44  28  65  NA  22  59  23  31  44  21   9  NA  45 168  73  NA
    [120]  76 118  84  85  96  78  73  91  47  32  20  23  21  24  44  21  28
    [137]   9  13  46  18  13  24  16  13  23  36   7  14  30  NA  14  18  20

### Functions to inspect data frames

-   `str()`: structure
-   `head()`: first rows
-   `tail()`: last rows
-   `summary()`: descriptive statistics
-   `dim()`: dimensions (\# rows, \# columns)
-   `nrow()`: number of rows
-   `ncol()`: number of columns
-   `names()`: column names
-   `colnames()`: column names
-   `rownames()`: row names
-   `dimnames()`: list with row and column names

### Functions to import tables

-   **read.table()**
-   **read.delim()**
-   **read.csv(), read.csv2()**
-   **read.fwf()**

#### Strings and Factors

By default, strings are converted to factors when loading data frames.

This is the wrong default.

Use `stringsAsFactors = FALSE`

You should always explicitly convert strings into factors later

### dplyr functions

-   `filter`: filter by some specific value.
-   `select`: select certain columns
-   `slice`: select certain rows
-   `group_by`: sort rows by a column name
-   `summarise`: reduce variables to values
-   `aggregate`: aggregate info
-   `arrange`: reorder rows; use `desc()` to obtain descending order
-   `mutate`: add new variables

#### pipelines `%>%` (dplyr & ggplot)

-   Pipelines make multiple dplyr operations easier to read
-   ex: x %&gt;% f(y) turns into f(x,y) so that you can pass outputs as inputs from left-to-right.
-   You can mix the `%>%` operator to chain dplyr commands with ggplot commands (and other R commands)

### ggplot functions (data frames only)

-   `ggplot()` initializes a "ggplot" object; You specify the data set (data frame) with data
-   geoms are geometric objects
    -   `geom_point()` indicates the type of geometric object
    -   `geom_bar()`, `geom_point()`
-   `aes()` maps aesthetic attributes to variables
    -   shape, transparency(alpha), color, fill, linetype
-   faceting
-   themes
-   smoothers
-   scales defines how your data will be plotted
-   saving
    -   `ggsave(object,file = "path/to/figure/filename.png")`

### gitbash commands

-   `wc`: count lines, words, and bytes
-   `wc -l`: count number of lines
-   `head -n 10`: inspect first 10 rows
-   `tail -n 10`: inspect last 10 rows
-   `less`: see contents with a paginator
-   `cut`: select columns
    -   `d`: field delimiter
    -   `f`: column numbers
    -   `c`: characters
-   `pwd`: print working directory
-   `cd`: change directory (move to another directly)
-   `mv`: rename file(s)
-   `cp`: copy file(s)
-   `touch`: create a new (empty) file
-   `rm`: delete file(s)
-   `mkdir`: create a new directory
-   `ls`: list files and directories
-   `curl -O`: download files
-   `cat`: output the contents of a file
-   `grep`: output all occurrences of "text" inside a file
-   `sort`: sort lines of data
    -   `-r`: reverse order
    -   `-u`: unique values
    -   `-n`: numerical order
    -   `-d`: dictionary order (alphabetical)
    -   `-t`: use commas for delimiters
    -   `-k`: sort lines based on a specific column
-   `uniq`:
    -   `-c`: frequencies of the unique values
-   `|`: the bash shell equivalent to the `%>%` command in dplyr
-   `>`: redirects output to a file
-   `>>`: append a file with new information

#### gitbash command examples

    # select third column (-f 3) specifying field-delimiter (-d ",")
    cut -d "," -f 3 datafile.csv

    # redirect above code output to a new file and display it
    cut -d "," -f 3 datafile.csv > newdatafile.txt

    cat newdatafile.txt

    # sort unique occurences

    sort -u newdatafile.txt

    # get unique frequencies

    sort newdatafile.txt | uniq -c

    # one pipeline of unique position frequencies

    cut -d "," -f 3 datafile.csv | tail +2 | sort | uniq -c

### Main Unix Concepts

-   At any given time we are inside a directory.
-   The current directory is the working directory
-   When a new R session is started, a working directory will be associated to the session.
-   When a terminal is started the working directory is the home directory.

#### Paths

-   Each file and directory has a unique name in the filesystem called a path.
-   Absolute Paths: an absolute pathname begins with the root directory and follows the tree branch by branch.
-   Relative Paths: a relative pathname begins at some working directory, moving either up or down the tree.

#### Creating files

3 main ways to create files:

-   Using a text editor
-   Direct output (from command) to a file
-   Using the command `touch`

Note: text editor =/ word processor

#### Spreadsheet inconveniences

-   Excel files (.xls) are NOT text files
-   They are enriched files with added format elements.
-   Cannot be opened with a text editior.
-   You depend on proprietary software.

#### Character Delimited Text

-   A common way to store data in tabular form is via text files.
-   To store the data we need a way to separate data values
-   Each line represents a "row"
-   The idea of columns is conveyed with delimiters.

#### Plain Text Formats

-   There are 2 main subtypes of plain text format, depending on how the separated values are identified in a row.

1.  Delimited formats
2.  Fixed-width formats

#### Advantages

-   Simplicity
-   Common formats (csv,tsv,txt,dat,etc...)
-   Can be opened and modified with a text editor.
-   Can also be opened in spreadsheet software.
-   Easy to understand for most users.
-   Can be read in data analysis software.

### Functions

#### Function anatomy

    some_name <- function(arguments) {
      body
    }

#### Documenting Functions

-   Roxygen comments

``` r
#' @title
#' @description what the function does
#' @param the inputs or arguments
#' @return what is the output
```

#### Naming functions

-   Function names cannot begin with a number, an underscore, or have hyphennated names.
-   sometimes `.hidden` are seen, which are hidden functions

#### Function output

The value of a function can be established in two ways: - As the last evaluated simple expression (in the body of the function) - An explicitly **returned** value via `return()`

### R expressions

Before talking about conditional structures and loops, we must first talk about **expressions**.

R programs are made up of expressions. These can be either *simple* expressions or *compound* expressions. Compound expressions consist of simple expressions separated by semicolons or newlines, and grouped within braces.


    # structure of a compound expression
    # with simple expressions separated by semicolons
    {expression_1; expression_2; ...; expression_n}

    # structure of a compound expression
    # with simple expressions separated by newlines
    {
      expression_1
      expression_2
      expression_n
    }

``` r
# simple expressions separated by semicolons
{"first"; 1; 2; 3; "last"}
```

    [1] "last"

``` r
# Every expression in R has a value: the value of the last evaluated statement
```

### Conditionals: if-then-else statements

    if (condition) {
    # do something
    } else {
    # do something else
    }

`if` statements can be written in different forms, depending on the types of expressions that are evaluated. If the expressions of both the *True* part and the *False* part are simple expressions, the if-then-else can be simplified as:

    if (condition) expression_1 else expression_2

-   The above statement is hard to read! Braces are better!

#### Switch case examples

``` r
# Convert the day of the week into a number.
day <- "Tuesday" # Change this value!

if (day == 'Sunday') {
  num_day <- 1
} else if (day == "Monday") {
  num_day <- 2
} else if (day == "Tuesday") {
  num_day <- 3
} else if (day == "Wednesday") {
  num_day <- 4
} else if (day == "Thursday") {
  num_day <- 5
} else if (day == "Friday") {
  num_day <- 6
} else if (day == "Saturday") {
  num_day <- 7
}

num_day
```

    [1] 3

#### switch case examples

``` r
# Convert the day of the week into a number.
day <- "Tuesday" # Change this value!

switch(day, # The expression to be evaluated.
  Sunday = 1,
  Monday = 2,
  Tuesday = 3,
  Wednesday = 4,
  Thursday = 5,
  Friday = 6,
  Saturday = 7,
  NA) # an (optional) default value if there are no matches
```

    [1] 3

#### switch case examples

``` r
# Convert a number into a day of the week.
day_num <- 3 # Change this value!

switch(day_num,
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday")
```

    [1] "Tuesday"

#### Function `stop()`

``` r
# example of using the stop function
circle_area <- function(radius = 1) {
  if (radius < 0) {
    stop("radius must be positive")
  }
  pi * radius^2
}

# this should work
circle_area(1)
```

    [1] 3.141593

``` r
# this should not work
circle_area(-1)
```

    Error in circle_area(-1): radius must be positive

### Loops

**Iteration** \* Three types of loops: `for`,`repeat`,`while`

#### for loops

-   often we want to repeatedly carry out some computation a **fixed** number of times.
-   For instance, repeat an operation for each element of a vector.
-   In R this can be done with a `for` loop.
-   `for` loops are used when **we know exactly how many times** we want the code to repeat

##### anatomy

    for (iterator in times) {
      do_something
    }

    # for loops and next statement (skip an iteration)
    for (iterator in times) { 
      expr1
      expr2
      if (condition) {
        next
      }
      expr3
      expr4
    }

    # nested loops (loops in loops!)
    for (iterator1 in times1) { 
      for (iterator2 in times2) {
        expr1
        expr2
        ...
      }
    }

##### example

``` r
prices <- c(2.50, 2.95, 3.45, 3.25)

for (i in 1:4) {
  cat("Price", i, "is", prices[i], "\n")
}
```

    Price 1 is 2.5 
    Price 2 is 2.95 
    Price 3 is 3.45 
    Price 4 is 3.25 

``` r
# skip iteration
x <- 2

for (i in 1:5) {
  y <- x * i
  if (y == 8) {
    next
  }
  print(y)
}
```

    [1] 2
    [1] 4
    [1] 6
    [1] 10

``` r
# nested loops
# some matrix
A <- matrix(1:12, nrow = 3, ncol = 4)
# reciprocal of values less than 6
for (i in 1:nrow(A)) { 
  for (j in 1:ncol(A)) {
    if (A[i,j] < 6) A[i,j] <- 1 / A[i,j] 
  }
}

A
```

              [,1] [,2] [,3] [,4]
    [1,] 1.0000000 0.25    7   10
    [2,] 0.5000000 0.20    8   11
    [3,] 0.3333333 6.00    9   12

#### repeat loops

`repeat` executes the same code over and over until a stop condition is met:

    repeat { 
      # keep
      # doing
      # something
      if (stop_condition) {
        break
      }
    }

##### using `break` to stop any potential infinite loops

``` r
value <- 2

# skip iterations

repeat {
  value <- value * 2
  print(value)
  if (value == 16) {
    value <- value * 2
    next
  }
  if (value > 80) break 
}
```

    [1] 4
    [1] 8
    [1] 16
    [1] 64
    [1] 128

#### while loops: repeats computations until a condition is false

    while (condition) { 
      # keep
      # doing
      # something
      # until
      # condition is FALSE
    }

-   `while` loops are backward repeat loops
-   `while` checks first and then attempts to execute
-   computations are carried out for as long as the condition is true
-   the loop stops when the condition is FALSE
-   If you enter an infinite loop, break it by pressing `ESC` key

``` r
value <- 2

while (value < 40) { 
  value <- value * 2 
  print(value)
}
```

    [1] 4
    [1] 8
    [1] 16
    [1] 32
    [1] 64

##### Repeat, While, For

-   If you don't know the number of times something will be done, you can use either `repeat` or `while`
-   `while` evaluates the condition at the beginning
-   `repeat` executes operations until a stop condition is met
-   If you know the number of times that something will be done, use `for`
-   `for` needs an *iterator* and a vector of *times*
