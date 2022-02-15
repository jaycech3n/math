---
katex:
  macros:
    "\\Syn" : "\\mathrm{Syn}"
    "\\Type" : "\\mathrm{Type}"
antex:
  preamble:
    \usepackage{amsmath,amsfonts,mathtools,stmaryrd,tikz-cd,bbm}

title: Syntax, semantically; semantics, syntactically
---

# Syntax, semantically;<br>&nbsp;Semantics, syntactically

This short note is an exercise in points of view.
It briefly spells out something almost tautological---and yet important, see for instance [this discussion][1]---namely that
*the category of types of a type theory is equivalent to its syntactic display map category*.

In what follows we fix a Martin-Löf type theory $T$ with $\Pi$, $\Sigma$ and unit types, and definitional eta for $\Sigma$.
$T$ is (at first) meant to be treated syntactically, i.e. from a traditional proof theorist's point of view, in terms of its judgments, axioms and logical rules.

{% definition Syntactic display map category %}
The *syntactic display map category $\Syn$* of $T$ has contexts of $T$, formed from the empty context and context extension, as objects, and substitutions between contexts as arrows.
Its *display maps* are the context projections
$\Gamma, A \xtwoheadrightarrow{\pi_A} \Gamma$.
{% enddefinition %}

Pullbacks of display maps
$\Gamma, A \xtwoheadrightarrow{\pi_A} \Gamma$
along
$f \colon \Delta \rightarrow \Gamma$
are again display maps
\\[ \Delta, A[f/\Gamma] \xtwoheadrightarrow{\pi_A[f/\Gamma]} \Delta \\]
where $A[t/\Gamma]$ denotes the simultaneous substitution
$A[t_1/x_1, \dotsc, t_n/x_n]$
for
$\Gamma = (x_1 \colon \Gamma_1, \dotsc, x_n \colon \Gamma_n)$.

{% definition Category of types %}
The *category of types* $\Type$ of $T$ is the category of closed types of $T$ and functions between them.
{% enddefinition %}

The punchline is that {% ref syntactic display map category %} and {% ref category of types %} define the same thing.
Using a suggestive overloading of notation, we have the equivalences
\\[ \Syn \xrightleftarrows[\centerdot,]{\sum} \Type \\]
where $\sum\Gamma$ is defined inductively by

[1]: http://nlab-pages.s3.us-east-2.amazonaws.com/nlab/show/categorical%20model%20of%20dependent%20types#StandInForSyntax