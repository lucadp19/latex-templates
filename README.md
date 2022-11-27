# latex-templates

This repo contains some `.cls` and `.sty` LaTeX files I use to write and compile
my university course notes. 

### Installation

To use this template you need a working LaTeX installation - either PdfLaTeX or
XeLaTeX for the time being. If you wish to use the XeLaTeX version, you will need
to download and install the [incomplete Neo Euler font](https://github.com/aliftype/euler-otf).

You may then copy and paste these files into your current working directory and
use them. If you are on Linux, you can instead paste them into `$HOME/texmf/tex/latex/local`
and use them as if they were an official LaTeX package. There probably exists
an analogous directory for Windows, but I don't know which one it is. 

### Bugs and issues

Since I've never sat down and cleaned up/tested all the code, there are bound to be
endless bugs lurking in the class or style files: open an issue here and I'll try
to fix them!

### The `notes.cls` file

The main file is `notes.cls`, which is forked from 
[@pfasante's attempt](https://github.com/pfasante/phd_thesis) at recreating [Aaron Turon's
PhD Thesis template](http://aturon.github.io/academic/). The class is based on
[Memoir](https://www.ctan.org/pkg/memoir), but adds some stylistic edits 
plus some code to automatically include my [LaTeX prelude](#prelude) and my 
[theorem styles](#theorem-styles); however, you can disable either of them (or both)
if you only want the general document styling.

To use this class, replace your `\documentclass` command with 

```
\documentclass[
  <OPTIONS>
]{notes}
```

The given options are as follows:

- `language` sets the document language, and it can be used to localise the theorem
  names,
- `colors` sets whether or not to show colors. This setting is *on* by default:
  to turn it off you need to give the option `colors=false`,
- `thmstyle` sets the theorem style; you may use `thmstyle=none` in order not
  to load any package related to theorem styling,
- `no-prelude` disables the automatically imported prelude.

All of the other specified options are passed to the underlying Memoir class: check the 
[Memoir manual](http://tug.ctan.org/tex-archive/macros/latex/contrib/memoir/memman.pdf) 
to see which options are allowed.
  
### Prelude

This file loads a lot of useful packages and defines tons of commonly used mathematical
symbols. It can be used independently of the `notes.cls` file and of the theorem styles,
and you can also substitute its contents and still use it as part of the `notes.cls` class. 

### Theorem styles

As with the preamble file, you can use these styles together with the `notes.cls`
class, or by themselves.

#### Theorem names

The `thm-styles/thm-colors-names.sty` file contains:

- the colors associated to each environment;
- the localised versions
  of the standard environment names (such as Theorem, Definition, etc) in both
  English and Italian. 
  
To add another language, simply copy the "Italian" section and edit the names and the language.

#### Theorem styles

Currently there are two possible theorem styles:

- a "boxed" theorem style (`thmstyle=boxed` in the `notes.cls` options)
- a "plain" theorem style (`thmstyle=simple` in the `notes.cls` options).

Regardless of the chosen style, you can use the environment in your LaTeX document
as follows: 

```
\begin{theorem}[A very important theorem][theorem-label]
  Important theorem statement
\end{theorem}
```

and then use the `cleveref` package to refer to the theorem with

```
\Cref{th:theorem-label}
```

You can check the environment names (such as `theorem`, `definition`, `lemma`, etc)
and label contractions used in references (such as `th`, `def`, `lem`, etc)
in either of the two style files, but they should be quite standard.

Since the environment interface is the same in both styles, you can seamlessly
switch between them: a document compiled in the *boxed* style can be recompiled
in the *plain* style without editing anything.

You can also integrate your theorem style files in the `notes.cls` by editing
the relevant section. However, unless your interface
is the same as the one explained before, you won't be able to switch between
my styles and your styles as easily.