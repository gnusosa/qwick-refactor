# qwick-refactor
Qwick Refactor exercise in Haskell

## Layout

The original file - * dosomething.js *

The Haskell solution file - * transform.hs *

## What doThingsAndStuff() does

The original function takes a list of elements, and selects strings.
From that selection it shuffles the list of strings based on the characters codes
after the first character after a space. So this means that it compares a string with spaces
against another string with spaces and rearranges the collection based on the different character codes.
At the end of the rearrange by codes it reverses the collection, and returns it.


For example

input:

```js
[
    "hea hea hea",
    "hello hello hello",
    "hee loo he",
    "her m e ",
    "her ro rro ro"
]
```

output:

```js
[
    "her ro rro ro",
    "her m e ",
    "hee loo he",
    "hello hello hello",
    "hea hea hea"
]
```

## The Haskell version

What the haskell `transform.hs` file does differently, is that it
calculates the index of the spaces and recursively checks for the
string differences char code by char code. See the function, `spacesDiff`.

As big differentiator too, is that we keep use tuples as means of trying to use the Zipper pattern,
to both keep the state of a working Zipper and the index of the first space found in the string.
See the function, `mkIdxTuples`

## Improvements

Given that I only worked on this for less than 2 hours, the other
improvement to work on is actually utilizing the `Zippers` pattern to
both handle the state of the collection being manipulated and the
strings with it corresponding index.

See https://learnyouahaskell.com/zippers#a-trail-of-breadcrumbs


