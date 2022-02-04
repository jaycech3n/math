---
katex:
  macros:
    "\\Ix": "\\mathcal{I}_{\\prec x}"
    "\\Iex": "\\mathcal{I}_{\\preceq x}"
antex:
  preamble: >-
    \usepackage{amsmath, amsfonts, mathtools, stmaryrd, tikz-cd}
    \newcommand{\Ix}{\mathcal{I}_{\prec x}}
    \newcommand{\Iex}{\mathcal{I}_{\preceq x}}
    \newcommand{\ssl}{\!\sslash\!}
title:
  Reedy fibrations
---

# Reedy fibrations

The first part of this exposition mostly follows {% cite shulman:univalence:14 %}.

**Notation.**
We denote "$x$ (is) an object of $\mathcal C$" variously by $x \in \mathcal C$ or $x \in \mathrm{ob}(\mathcal C)$.
Similarly, "$f$ (is) an arrow of $\mathcal C$" may be denoted $f \in \mathcal C$ or $f \in \mathrm{mor}(\mathcal C)$, but we shall be careful to always disambiguate with the latter notation if there is a danger of confusion.

{% TODO: write a conventions file %}


## Inverse categories

**Definition.**
A binary relation $\prec$ may be placed on the collection of objects of any category $\mathcal C$ by defining $y \prec x$ if and only if there is an arrow $x \rightarrow y$ in $\mathcal C$.
An **inverse category** $\mathcal I$ is one for which $\prec$ is well-founded.

Given an inverse category $\mathcal I$, we can define the **degree** aka **rank $\rho(x)$ of an object $x$** of $\mathcal I$ by well-founded recursion in the usual way:
\\[
  \rho(x) \coloneqq \sup_{y \, \prec \, x} \big( \rho(y) + 1 \big).
\\]
The **rank $\rho(\mathcal I)$ of $\mathcal I$** itself is then
\\[
  \rho(\mathcal I) \coloneqq \sup_{x \, \in \, \mathcal I} \big( \rho(x) + 1 \big).
\\]

Equivalently, an inverse category $\mathcal I$ is one for which there is an ordinal $\lambda$ together with a rank function $\rho \colon \lambda \rightarrow \mathrm{ob}(\mathcal I)$, such that any nonidentity arrow $f \colon x \rightarrow y$ strictly lowers degree---$\rho(y) < \rho(x)$.

**Definition.**
For an inverse category $\mathcal I$ and $x \in \mathcal I$, the **$x$-truncated category $\Ix$** is the full subcategory of $\mathcal I$ on objects $y \prec x$.
We also use $\Iex$ to denote the full subcategory on $\Ix \cup \\{x\\}$, but do not bother to give it a name.


## Diagrams on inverse categories

**Notation.**
For a category $\mathcal C$ and $x \in \mathcal C$, let
{% tex %}$x \ssl \mathcal C${% endtex %}
denote the full subcategory of $x/\mathcal C$ without the object $\mathrm{1}_x \colon x \rightarrow x$.

Note that for inverse $\mathcal I$ and any $x \in \mathcal I$ there is the canonical "codomain" forgetful functor
{% tex %}$U \colon x \ssl \mathcal I \rightarrow \Ix${% endtex %}.

Now suppose we're given a category $\mathcal C$, an inverse category $\mathcal I$ and a diagram $A\_{\prec x} \colon \mathcal{I}\_{\prec x} \rightarrow \mathcal C$ on the truncated inverse category.
By unfolding definitions, we can see that (the data of) extensions of $A_{\prec x}$ to a diagram
\\[
  A_{\preceq x} \colon \Iex \rightarrow \mathcal C
\\]
are equivalently cones over
{% tex classes: [antex,display] %}
$
  A_{\prec x} \circ U \colon x \ssl \mathcal \mathcal I \rightarrow \mathcal C,
$
{% endtex %}
which are equivalently maps into
\\[ \lim(A_{\prec x} \circ U), \\]
provided this limit exists.

{% TODO: insert cone diagram here %}

**Definition.** Suppose we have a category $\mathcal C$, inverse category $\mathcal I$ and diagram $A \colon \mathcal J \rightarrow \mathcal C$ where $\mathcal J \subseteq \mathcal I$ is a subcategory containing $\Ix$.
The **matching object $M_xA$ (of $A$, on "level" $x$)** is the limit
\\[ M_xA \coloneqq \lim(A_{\prec x} \circ U), \\]
if it exists.

Thus, if the $x$-matching object for $A_{\prec x}$ exists, we can extend $A_{\prec x}$ to $x$ by simply giving an object $A_x$ and a map $A_x \rightarrow M_xA$ in $\mathcal I$.

Now we consider extensions of maps between inverse diagrams.
Suppose that
$A_{\preceq x},\ B_{\preceq x} \colon \Iex \rightarrow \mathcal C$
have $x$-matching objects $M\_xA,\ M_xB$, and that
$f_{\prec x} \colon A_{\prec x} \rightarrow B_{\prec x}$
is a natural transformation restricted to the respective $x$-truncations.
Then we can again check that extensions of $f_{\prec x}$ to maps
\\[
  f_{\preceq x} \colon A_{\preceq x} \rightarrow B_{\preceq x}
\\]
are equivalently lids of the square
{% tex classes: [antex,display] %}
\begin{tikzcd}
  A_x \ar[d] \ar[r, dashrightarrow] \ar[dr, phantom, "\circ" marking] & B_x \ar[d] \\
  M_xA \ar[r]                  & M_xB
\end{tikzcd}
{% endtex %}
(where the walls and base are the evident arrows), which are equivalently arrows
\\[
  A_x \xrightarrow{f_x} M_xA \times_{M_xB} B_x
\\]
such that
{% tex classes: [antex,display] %}
\begin{tikzcd}[row sep=small, column sep=tiny]
  A_x \ar[dd] \ar[dr, "f_x"] & \\
                             & M_xA \times_{M_xB} B_x \ar[dl] \\
  M_xA                       & 
\end{tikzcd}
{% endtex %}
commutes, assuming that the pullback exists.

{% TODO: Define Reedy fibrations and Reedy fibrant diagrams; need the notion of a fibration first %}


### References

{% bibliography --cited %}