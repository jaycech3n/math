<https://joshchen.io/math>

These are my (work-in-progress, often incomplete) online math notes, based on the excellent tool [Krater][1].

Notes (stored in `_notes`) are written in a combination of Markdown and LaTeX (see the Krater [readme][2] and [sample page][3] for the basics), with the following extra LaTeX-like functionality:

### Sections and numbering

```
{% section Heading %}
{% subsection Subheading %}
{% subsubsection Subsubheading %}
```
Turn on numbering with
`section-numbers: true`
in front matter.

### Theorem blocks

```
{% theorem Lévy reflection principle %}
    etc. etc.
{% endtheorem %}
```
generates the appropriate permalinked block and heading.
Optional numbering with `theorem-numbers: true` in front matter.

Also available are `lemma`, `proposition`, `definition`, `notation`, `remark`.

### Equation labels

```
{% equation choose-your-own-reference-name %}
```
after a display math block generates the appropriate numbered label.
There's currently no support for custom labels.

### Intra-document references

```
{% ref use-your-chosen-reference-names %}
```
for equation referencing, or
```
{% ref the full heading of a section/theorem block also works (case-insensitive) %}
```
Turning on numbering is suggested with the latter.

### Todo tags

`{% todo %}` or `{% todo write a note to self %}` for all your shopping list needs.



[1]: https://github.com/paolobrasolin/krater
[2]: https://github.com/paolobrasolin/krater/blob/main/README.md
[3]: https://github.com/paolobrasolin/krater/blob/main/index.md