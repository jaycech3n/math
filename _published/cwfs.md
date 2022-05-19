---
katex:
  macros:
antex:
  preamble: >-
    \usepackage{amsmath,amsfonts,amssymb,mathabx,tikz-cd,stmaryrd}
    \newcommand{\defeq}{\coloneq}
    \newcommand{\op}{\mathrm{op}}
    \newcommand{\Set}{\mathrm{Set}}
    \newcommand{\Fam}{\mathrm{Fam}}
    \newcommand{\Ty}{\mathrm{Ty}}
    \newcommand{\Tm}{\mathrm{Tm}}
    \newcommand{\ext}{\mathrm{ext}}
    \newcommand{\slice}[2]{#1_{/#2}}

theorem-numbers: false

title: Categories with families
---

# Categories with families

{% section Indexed presentation %}

{% definition Category with families %}
A *category with families (CwF)* {% tex %}$(\mathcal C, \mathbf 1, \Ty, \Tm, \ext)${% endtex %} consists of the following data:
+ $\mathcal C$, a category of *contexts* and *substitutions*
+ $\mathbf 1 \in \mathcal C$, a choice of terminal object
+ {% tex %}$\Ty \colon \mathcal C^\op \rightarrow \Set${% endtex %}
+ {% tex %}$\Tm \colon (\int_{\mathcal C} \Ty)^\op \rightarrow \Set${% endtex %}
+ {% tex %}$
    \ext \colon \prod_{\Gamma \in \mathcal C} \prod_{A \in \Ty \, \Gamma}
      \, (\text{choice of terminal object in $\int_{\slice{\mathcal C}{\Gamma}} \Tm(\mathrm{dom}(-), A[-])$})
  ${% endtex %}

where the actions of {% tex %}$\Ty${% endtex %} and {% tex %}$\Tm${% endtex %} on morphisms $f$ are both denoted $-[f]$.
{% enddefinition %}

The terminal object {% tex %}$\ext \, \Gamma A${% endtex %} is simply a categorical packaging-up of the context extension operation, consisting of a context $\Gamma.A$, projection morphism $p_A \colon \Gamma.A \rightarrow \Gamma$ and term {% tex %}$\upsilon_A \in \Tm(\Gamma.A, A[p_A])${% endtex %}, such that the usual universal property is satisfied (see e.g. {% cite hofmann:1997:syntax-semantics %}).

The structure of a CwF can be (and is frequently) presented as an essentially/generalized algebraic theory.
Via the usual definition of a morphism of models of EATs/GATs, one has the notion of a *CwF morphism*.
Here we state this more explicitly for our more categorical formulation.
We use the following proposition, easily checked:

{% proposition %}
Let {% tex %}$P \colon \mathcal D^{\op} \rightarrow \Set${% endtex %} be a presheaf on $\mathcal D$.
Then any functor {% tex %}$F \colon \mathcal C^{\op} \rightarrow \mathcal D^{\op}${% endtex %} induces a functor
\\[ \int_{\mathcal C} P \circ F \xrightarrow{F^\ast} \int_{\mathcal D} P \\]
on the categories of elements, given by "reindexing". {% todo What's the standard terminology? I don't know. %}
That is,
{% tex classes: [antex,display] %}
$
  F^\ast \colon
    \begin{gathered}
      \begin{tikzcd}
        (c \in \mathcal C, x \in PFc) \ar[d, "\ (f \colon c \rightarrow c' \, \mid \, x = PFfy)"] \\
        (c' \in \mathcal C, y \in PFc')
      \end{tikzcd}
    \end{gathered}
    \longmapsto
    \begin{gathered}
      \begin{tikzcd}
        (Fc, x) \ar[d, "\ (Ff \colon Fc \rightarrow Fc' \, \mid \, x = PFfy)"] \\
        (Fc, y)
      \end{tikzcd}
    \end{gathered}
$
{% endtex %}
{% endproposition %}

{% definition Morphism of CwFs %}
A morphism of CwFs
{% tex classes: [antex,display] %}
$
  \tau \colon (\mathcal C, \mathbf 1, \Ty, \Tm, \ext) \rightarrow (\mathcal C^\prime, \mathbf 1^\prime, \Ty^\prime, \Tm^\prime, \ext^\prime)
$
{% endtex %}
consists of the following data:
+ $F \colon \mathcal C \rightarrow \mathcal C^\prime$ preserving the chosen terminal objects $\mathbf 1, \mathbf 1^\prime$
+ {% tex %}$\tau_\Ty \colon \Ty \Rightarrow \Ty^\prime \circ F^\op${% endtex %},
  a natural transformation on presheaves {% tex %}$\mathcal C^\op \rightarrow \Set${% endtex %}
+ {% tex %}$\tau_\Tm \colon \Tm \Rightarrow \Tm^\prime \circ \big( (F^\op)^\ast \circ \int_{\mathcal C} \tau_\Ty \big)^\op ${% endtex %},
  a natural transformation on presheaves {% tex %}$(\int_{\mathcal C} \Ty)^\op \rightarrow \Set${% endtex %}

such that for every $\Gamma \in \mathcal C$ and {% tex %}$A \in \Ty \, \Gamma${% endtex %} the canonically induced map
{% tex classes: [antex,display] %}
$
  \int_{\slice{\mathcal C}{\Gamma}} \Tm(\mathrm{dom}(-), A[-])
    \rightarrow
    \int_{\slice{\mathcal C^\prime}{F\Gamma}} \Tm^\prime(\mathrm{dom}(-), (\tau_{\Ty \, \Gamma}A)[-]^\prime)
$
{% endtex %}
(strictly) preserves the terminal objects chosen by {% tex %}$\ext${% endtex %}, {% tex %}$\ext^\prime${% endtex %}.
{% enddefinition %}

Spelling out this last part above, this means in particular that
{% tex classes: [antex,display] %}
$\begin{gathered}
  F(\Gamma.A) = F\Gamma.(\tau_\Ty A), \\
  F(p_A) = p_{\tau_\Ty A}, \\
  \tau_\Tm(\upsilon_A) = \upsilon_{\tau_\Ty A},
\end{gathered}$
{% endtex %}
and a similar equation for weakening of substitutions.

{% remark %}
From the {% tex %}$\ext${% endtex %} data of a CwF we can form a (strict) functor
{% tex classes: [antex,display] %}
$
  -.- \colon \int_{\mathcal C} \Ty \rightarrow \mathcal C^\shortrightarrow
$
{% endtex %}
into the category of pullbacks of $\mathcal C$, sending $(\Gamma, A)$ to the projection $\Gamma.A \xrightarrow{p_A} \Gamma$
and $f \colon (\Delta, A[f]) \rightarrow (\Gamma, A)$ to the unique pullback of $p_A$ along $f$.
Uniqueness is by terminality, which also gives strictness of this functor.
{% endremark %}


{% section Fibered presentation %}

{% definition Category of families of sets %}
{% tex %}$\Fam${% endtex %} is the category whose objects {% tex %}$(A_i)_{i \in I}${% endtex %} are set-indexed families of sets, and whose arrows {% tex %}$(A_i)_{i \in I} \rightarrow (B_j)_{j \in J}${% endtex %} consist of pairs
\\[ \big(f \colon I \rightarrow J, (f_i \colon A_i \rightarrow B_{f(i)})_{i \in I}\big), \\]
i.e. maps respecting the fibers of the family.
Composition of arrows is fiberwise.
{% enddefinition %}

{% tex %}$\Fam${% endtex %} is equivalent to {% tex %}$\Set^I${% endtex %} (where $I$ is the walking arrow) via the usual family-fibration correspondence (see e.g. {% cite capriotti:2013:families-fibrations %} for a nice quick introduction):
objects of {% tex %}$\Set^I${% endtex %} are diagrams $A \rightarrow I$ of sets, and arrows
{% tex classes: [antex,display] %}
\begin{tikzcd}
  \coprod_{i \in I} A_i \simeq A \ar[r] \ar[d] & B \simeq \coprod_{j \in J} B_j \ar[d] \\
  I \ar[r, "f", swap] & J
\end{tikzcd}
{% endtex %}
from $A \rightarrow I$ to $B \rightarrow J$ are fiber-preserving maps on the total spaces $A$, $B$.

(To be continued.)


### References

{% bibliography --cited %}
