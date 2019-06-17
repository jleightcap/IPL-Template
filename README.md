# LaTeX Templates 
A collection of personal LaTeX templates, used for rewriting notes, writing homework solutions, and writing lab reports.

## Package Dependencies
These templates try to include every possilbe case for my own personal use. The ideal use is to create a copy of the  needed `*.tex` template, delete any unneeded components easily, and start writing; rather than dealing with the LaTeX boilerplate.

* Chemical structures with `chemfig`
* Code blocks with `minted`
* Circuit diagrams with `circuitikz` (which loads `tikz`)
* Sheet Music with `musixtex`

## Notes
This template is mostly just 'stock' LaTeX.
* Boxed and formatted important expressions
## Homework
* **Page-dependent `fancyhdr` header/footer**
Header/footer can change depending on page using `ifthenelse`, defaults to a more detailed header on the first page and simpler header on the following pages.
* **Automatic problem numbering, with optional skips**
`\problem \problem \problem[5] \problem` → `Problem 1 Problem 2 Problem 5 Problem 6`
* **Automatic part numbering, with optional skips**
Setting `\parttype` to `\Roman`,
` \ppart \ppart \ppart[5] \ppart` → `Part I Part II Part IV Part VI`
* ***question* environment**
Italic gray text indented by a vertical line. Used if it is helpful to restate a question.

## Labs
Labs unfortunately mostly change format per professor. This means a 'common ancestor' template is very bare-bones, with the specific requirements added later on a class-by-class basis.
* University logo

## Editing Environment
I use vim with the `vimtex` and `vim-latex-live-preview` plugins, and `zathura` as a PDF viewer. This makes editing `*.tex` files a lost more like a WYSIWYG editor.

`utilisnips` makes wriitng a lot of the verbose LaTeX formatting much easier.

For the occasional figure, I either use `tikz` or `Inkscape`.

Here's an [excellent writeup](https://castel.dev/post/lecture-notes-1/) on making a LaTeX editing environment that allows editing fast enough to keep up with a lecture.

