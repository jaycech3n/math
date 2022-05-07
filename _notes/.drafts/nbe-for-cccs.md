---
katex:
  macros:
antex:
  preamble: >-
    \usepackage{amsmath,amsfonts,amssymb,mathabx}
    \newcommand{\den}[1]{\ldbrack #1 \rdbrack}
    \newcommand{\defeq}{\coloneq}
    \newcommand{\pair}[1]{\langle #1 \rangle}

title: Normalization by evaluation for CCCs
---

# Normalization by evaluation for CCCs

In a cartesian closed category $\mathcal C$ we can interpret the simply typed $\lambda$-calculus thus:

+ Contexts $\Gamma$ and types $A$ are presented by objects {% tex %}$\den{\Gamma}, \den A \in \mathcal C${% endtex %}.
  The empty context is presented by the terminal object $\mathbf 1$.

+ Context extension $(\Gamma, x \colon A)$ is presented by {% tex %}$\den{\Gamma} \times \den A${% endtex %}.
  A context is hence presented by any product of the presentations of its types.

+ Terms-in-context $(\Gamma \vdash a \colon A)$ are presented by sections
  {% tex classes: [antex,display] %}
  $
    \den{\Gamma} \rightarrow \den{\Gamma} \times \den A
  $
  {% endtex %}
  of the projection {% tex %}$\den{\Gamma} \times \den A \xrightarrow{\pi_1} \den{\Gamma}${% endtex %},
  or equivalently, by arrows
  {% tex classes: [antex,display] %}
  $
    \den{\Gamma} \rightarrow \den A
  $
  {% endtex %}
  (the maps $\pi_2 \circ -$ and {% tex %}$\pair{\mathrm{id}, -}${% endtex %}
  are inverse isomorphisms between sections of $\pi_1$ and {% tex %}$\mathrm{hom}(\den{\Gamma}, \den A)${% endtex %}),
  so we (ab)use the same notation {% tex %}$\den a${% endtex %} for either of these presentations.

+ Substitution in terms is presented by composition of the appropriate arrows.
  Let $(\Gamma \vdash a \colon A)$ and $(\Gamma, x \colon A \vdash b \colon B)$ be terms in context.
  1. If these are presented as sections
    {% tex classes: [antex,display] %}
    $
      \den{\Gamma} \xrightarrow{\den a} \den{\Gamma} \times \den A, \quad
        \den{\Gamma} \times \den A \xrightarrow{\den b} \den{\Gamma} \times \den A \times \den B,
    $
    {% endtex %}
    then $(\Gamma \vdash b[a/x] \colon B)$ may also be presented as the section
    {% tex classes: [antex,display] %}
    $
      \pair{\pi_1 \circ \pi_1, \pi_2} \circ \den{b} \circ \den{a} \colon \den{\Gamma} \rightarrow \den{\Gamma} \times \den B.
    $
    {% endtex %}
  2. If they are instead presented by the second projections
    {% tex classes: [antex,display] %}
    $
      \den{\Gamma} \xrightarrow{\den a} \den A, \quad \den{\Gamma} \times A \xrightarrow{\den b} \den B,
    $
    {% endtex %}
    then $(\Gamma \vdash b[a/x] \colon B)$ is presented by
    {% tex %}$\den b \circ \pair{\mathrm{id}, \den a}${% endtex %}.
    This is just the second projection of the previous presentation (1).

The preceding discussion makes it clear that "presentation" {% tex %}$\den \cdot${% endtex %} is a *relation* instead of a function.
Different categorical presentations of the same syntactic entities, however, give equivalent data, in the sense that 