# LaTeX Templates 
A collection of personal LaTeX templates, used for rewriting notes, writing homework solutions, and writing lab reports.

# Packages
The base `*.tex` files include as few packages as possible, with the idea that each class will require a different set of packages. The included packages are the only packages needed to compile the base document.

## Notes
* **University logo** 
free advertisement, I guess
* **Boxed and formatted expressions using `mdframed`**

    Colored boxes for highlighting in `question`, `answer`, and `result` environments
* **Automatic lecture numbering, with optional skips**

    `\lecture \lecture[3] \lecture` → `Lecture #1 Lecture #3 Lecture #4`
* **Seperate `.tex` files per lecture using `standalone`**

    For modularity, each lecture occupies its own `.tex` file which is imported into the main `Notes.tex` file. All packages and defined functions/environments are imported from `Notes.tex` into the individual lecture files, so each lecture's file is very clean and easy to navigate.

    For some editors (vim+vimtex), compiling the lecture files is functionally equivalent to compiling the whole `Notes.tex` file. However, I haven't been able to replicate this in Texmaker where a preview is only rendered correctly when compiling from `Notes.tex`.

    An included `newlec.sh` script automates the process of adding a new lecture. A new lecture file is created and appropriately imported in the `Notes.tex` file. I use this script with keybindings for each class, so I can begin editing a new lecture instantly. With this, the minimal setup to start a new class is only
    ```
    $ cp -r Notes CLASS && cd CLASS
    $ ./newlec.sh
    ```

![Notes](/Examples/Notes.png)
## Homework
* **Page-dependent `fancyhdr` header/footer**

    Header/footer can change depending on page using `ifthenelse`, defaults to a more detailed header on the first page and simpler header on the following pages.
* **Automatic problem numbering, with optional skips**
    
    `\problem \problem[3] \problem` → `Problem 1 Problem 3 Problem 4`
* **Automatic part numbering, with optional skips**

    Setting `\parttype` to `\alph`,

    ` \ppart \ppart[3] \ppart` → `Part a Part c Part d`
* ***question* environment**

    Italic gray text indented by a vertical line. Used if it is helpful to restate a question.

![Homework](/Examples/Homework.png)
## Labs
Labs unfortunately mostly change format per professor. This means a 'common ancestor' template is very bare-bones, with the specific requirements added later on a class-by-class basis.