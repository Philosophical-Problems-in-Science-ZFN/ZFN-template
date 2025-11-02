# ZFN – LaTeX template
Template for preparing articles for **_Philosophical Problems in Science_ (ZFN)**.

This repository contains a minimal working example (MWE) that shows how to
- load the journal class (`zfn.cls`),
- structure the article (title page, abstract, sections),
- add figures,
- add bibliography.

---

## 1. What’s in this repository?

| File | What it is |
|------|-------------|
| `zfn.cls` | The journal class – all formatting rules live here. **Do not edit** unless you know what you’re doing. |
| `sample-article.tex` | Minimal example showing how to use the class (title, authors, abstract, sections, citations). Start from this. |
| `sample-article.pdf` | The compiled version of `sample-article.tex` – use it to see what the output should look like. |
| `sample-bibliography.bib` | Example BibTeX/BibLaTeX database with entries used in the sample article. |
| `sample-image.pdf` | Example image used in the sample article. |
| `ZFN_transparent.pdf` | Journal logo used on the title page / in the sample. |
| `.gitignore` | Standard LaTeX ignores. |

---

## 2. Quick start

1. **Clone or download** this repo.
2. Open `sample-article.tex`.
3. Save it under a new name, e.g. `my-article.tex`.
4. Replace the metadata (title, authors, abstract).
5. Compile.

You should get something that looks like `sample-article.pdf`.

---

## 3. How to compile

The template is standard LaTeX and should compile with a typical toolchain.

**Recommended workflow:**

```bash
pdflatex sample-article.tex
biber sample-article
pdflatex sample-article.tex
pdflatex sample-article.tex
```
If compilation fails, check:

* that `zfn.cls` is in the **same directory** as your `.tex` file,
* that the bibliography file name in the `.tex` file matches `sample-bibliography.bib`,
* that you actually ran `biber`/`bibtex`.

---

## 4. Using the bibliography

The sample shows how to cite items from `sample-bibliography.bib`. Typical pattern:

```latex
As argued by \parencite{Urbanczyk2026}, ...
```

and single instance of

```latex
\printbibliography
```

at the end.

If you already have your own `.bib` file, just replace the sample one and change the line in the `.tex` file that loads it.

---

## 5. Figures

The sample uses `sample-image.pdf`. To add your own figure:

```latex
\begin{figure}[ht]
  \centering
  \includegraphics[width=\linewidth]{my-figure.pdf}
  \caption{My caption.}
  \label{fig:my-figure}
\end{figure}
```

Keep your figures in the same directory as the `.tex` file or set `\graphicspath{}`.

---

## 6. Structure of a ZFN article (as shown in the sample)

A typical article produced by the class has:

1. Title, authors, affiliations
2. Abstract
3. Keywords
4. Main text (sections, subsections)
5. Acknowledgements (optional)
6. Endnotes (if any)
7. References (generated from the `.bib` file)

Follow the structure in `sample-article.tex`.

---

## 7. Making a submission package

When you’re done, make a clean archive with:

* your main `.tex` file,
* your `.bib` file(s),
* all figures (`.pdf`, `.png`, …),
* compiled PDF file for reference

Example:

```text
my-zfn-submission/
├── my-article.tex
├── my-article.pdf
├── references.bib
├── fig1.pdf
└── fig2.pdf
```

Zip that directory and upload it during the submission it or submit each file separately according to the journal’s instructions.

---

## 8. Releases

Right now this repository has initial **v1.0.0 tag release** on GitHub.


---

## 9. Overleaf

You can also use the template on **Overleaf**:

1. Create new project → **Upload project**.
2. Upload all files from this repo.
3. Set `sample-article.tex` (or your renamed file) as **Main file**.
4. Compile.

---

## 10. License / contact

This repository mirrors the official template for **_Philosophical Problems in Science_ (ZFN)**.
If you spot an inconsistency between the compiled PDF and the journal’s current guidelines, report it in the GitHub repo’s *Issues* tab or contact the journal secretary at [info@zfn.edu.pl](mailto:info@zfn.edu.pl).