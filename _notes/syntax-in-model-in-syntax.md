---
katex:
  macros:
    "\\Syn" : "\\mathrm{Syn}"
    "\\Type" : "\\mathrm{Type}"
antex:
  preamble: >-
    \usepackage{amsmath,amsfonts,amssymb,mathtools,stmaryrd,bbm}

title: Syntax in model in syntax
---

# Syntax in model in syntax

This short fragment is an exercise in points of view.
It briefly sketches something almost tautological---and yet important, see for instance [this discussion][1]---namely that
*the category of types of a type theory is equivalent to its syntactic display map category*.

In what follows we fix a Martin-Löf type theory $T$ with $\Pi$, $\Sigma$ and unit type {%tex%}$\mathbbm 1${%endtex%}, and definitional eta for $\Sigma$.
$T$ is (at first) meant to be treated syntactically, i.e. from a traditional proof theorist's point of view, in terms of its judgments, axioms and logical rules.

{% definition Syntactic display map category %}
The *syntactic display map category $\Syn$* of $T$ has contexts of $T$, formed from the empty context and context extension, as objects, and substitutions between contexts as arrows.
Its *display maps* are the context projections
$\Gamma, A \xtwoheadrightarrow{p_A} \Gamma$.
{% enddefinition %}

Pullbacks of display maps
$\Gamma, A \xtwoheadrightarrow{p_A} \Gamma$
along
$f \colon \Delta \rightarrow \Gamma$
are again display maps
\\[ \Delta, A[f/\Gamma] \xtwoheadrightarrow{p_A[f/\Gamma]} \Delta \\]
where $A[t/\Gamma]$ denotes the simultaneous substitution
$A[t_1/x_1, \dotsc, t_n/x_n]$
for
$\Gamma = (x_1 \colon \Gamma_1, \dotsc, x_n \colon \Gamma_n)$.

{% definition Category of types %}
The *category of types* $\Type$ of $T$ is the category of closed types of $T$ and functions between them.
{% enddefinition %}

The point is that {% ref syntactic display map category %} and {% ref category of types %} define the same thing.
Using a suggestive overloading of notation, we have the equivalences
\\[ \Syn \xrightleftarrows[\centerdot,]{\tilde\Sigma} \Type \\]
where $\tilde\Sigma$ is defined inductively on objects by
{% tex classes: [antex,display] %}
$
\begin{aligned}
  \tilde\Sigma(\centerdot) &= \mathbbm 1 \\
  \tilde\Sigma(\Gamma, A) &= \sum_{\vec{x} \colon \tilde\Sigma\Gamma} A(\vec x)
\end{aligned}
$
{% endtex %}
and on arrows $f \colon \Gamma \rightarrow \Delta$ by
{% tex classes: [antex,display] %}
$
\begin{gathered}
  \tilde\Sigma f \colon \tilde\Sigma\Gamma \rightarrow \tilde\Sigma\Delta, \\
  \tilde\Sigma f (\vec x) = (f_1(\vec x), \dotsc, f_m(\vec x))
\end{gathered}
$
{% endtex %}
where $f = (\Gamma \vdash f_1 \colon \Delta_1, \dotsc, f_m \colon \Delta_m)$.
Note that we're implicitly left-associative for convenience.

The inverse $\centerdot, \colon \Type \rightarrow \Syn$ is given by
{% tex classes: [antex,display] %}
$
\begin{gathered}
  A \mapsto \centerdot, A \\
  (f \colon A \rightarrow B) \mapsto (x \colon A \vdash f(x) \colon B).
\end{gathered}
$
{% endtex %}

Now we can check that $(\tilde\Sigma \circ \centerdot,)$ and $(\centerdot, \circ \tilde\Sigma)$ are both naturally isomorphic to the identity functors.
For the latter, use
{% tex classes: [antex,display] %}
$
\begin{gathered}
  \theta_\Gamma \colon \centerdot, \tilde\Sigma\Gamma \rightarrow \Gamma \\
  \theta_\Gamma = (x \colon \tilde\Sigma\Gamma \vdash \pi_1 x \colon \Gamma_1, \dotsc, \pi_n x \colon \Gamma_n)
\end{gathered}
$
{% endtex %}
and observe that definitional eta is needed for this to be an isomorphism in $\Syn$.


[1]: http://nlab-pages.s3.us-east-2.amazonaws.com/nlab/show/categorical%20model%20of%20dependent%20types#StandInForSyntax