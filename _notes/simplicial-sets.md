---
katex:
  macros:
antex:
  preamble: >-
    \usepackage{amsmath,amsfonts,amssymb,mathabx,tikz-cd}
    \newcommand{\defeq}{\coloneq}
    \newcommand{\op}{\mathrm{op}}
    \newcommand{\Set}{\mathrm{Set}}

theorem-numbers: false

title: Simplicial sets
---

# Simplicial sets

A bird's-eye overview to various topics around simplicial sets.

{% definition Standard simplex %}
The *standard simplex*
{% tex classes: [antex,display] %}
$
  \Delta^n \defeq \hom(-, [n]) \colon \Delta^\op \rightarrow \Set
$
{% endtex %}
is the simplicial set whose $k$-simplices are the (weakly) monotone maps $[k] \rightarrow [n]$.
Its face and degeneracy maps are given by postcomposition with the (co)face and (co)degeneracies of the simplex category $\Delta$.
{% enddefinition %}

The geometric intuition is that these are "vertex order preserving" maps from the $k$-simplex to the $n$-simplex.

{% definition $(n,i)$-horn %}
The *$n$-dimensional $i$-horn* $\Lambda^n_i$ for $0 \le i \le n$ is the subfunctor of $\Delta^n$ whose $k$-simplices neither map onto the geometric $n$-face nor the $i$-th $(n-1)$-face.
{% enddefinition %}

Explicitly, $(\Lambda^n_i)_k$ consists of those maps $f \colon \Delta([k], [n])$ whose image is not onto $\\{ 0, \dotsc, n \\} \setminus \\{ i \\}$.

{% section Simplicial nerve %}

{% definition Simplicial nerve %}
From a category $\mathcal C$ construct its *simplicial nerve*
{% tex classes: [antex,display] %}
$
  N(\mathcal C) \colon \Delta^\op \rightarrow \Set
$
{% endtex %}
whose $k$-simplices are given by
{% tex classes: [antex,display] %}
$
  N(\mathcal C)_k = \{ \text{$k$-chains of arrows} \ (c_0 \rightarrow \dotsb \rightarrow c_k) \ \text{in $\mathcal C$} \},
$
{% endtex %}
face maps {% tex %}$d_i \colon N(\mathcal C)_k \rightarrow N(\mathcal C)_{k-1}${% endtex %} by
{% tex classes: [antex,display] %}
$\begin{aligned}
  d_0(c_0 \rightarrow c_1 \rightarrow \dotsb \rightarrow c_k) & \defeq (c_1 \rightarrow \dotsb \rightarrow c_k) \\
  d_k(c_0 \rightarrow \dotsb \rightarrow c_{k-1} \rightarrow c_k) & \defeq (c_0 \rightarrow \dotsb \rightarrow c_{k-1}),
\end{aligned}$
{% endtex %}
for $0 < i < k$
{% tex classes: [antex,display] %}
$
  d_i(c_0 \rightarrow \dotsb \rightarrow c_{i-1} \xrightarrow{f} c_i \xrightarrow{g} c_{i+1} \rightarrow \dotsb \rightarrow c_k)
    \defeq (c_0 \rightarrow \dotsb \rightarrow c_{i-1} \xrightarrow{g \circ f} c_{i+1} \rightarrow \dotsb \rightarrow c_k),
$
{% endtex %}
and degeneracies {% tex %}$s_i \colon N(\mathcal C)_k \rightarrow N(\mathcal C)_{k+1}${% endtex %} by
{% tex classes: [antex,display] %}
$
  s_i(c_0 \rightarrow \dotsb \rightarrow c_i \rightarrow \dotsb \rightarrow c_k)
    \defeq (c_0 \rightarrow \dotsb \rightarrow c_i \xrightarrow{\mathrm{id}} c_i \rightarrow \dotsb \rightarrow c_k).
$
{% endtex %}
{% enddefinition %}

{% remark %}
The codomain {% tex %}$\Set${% endtex %} of the nerve may have to be a larger universe when $\mathcal C$ is not small.
{% endremark %}

The nerve $N(\mathcal C)$ "remembers" the structure of its generating category $\mathcal C$.
The $0$- and $1$-simplices of $N(\mathcal C)$ are the objects and arrows of $\mathcal C$.
$2$-simplices of $N(\mathcal C)$ encode the composition structure: a $2$-chain
\\[ u = (c_0 \xrightarrow{f} c_1 \xrightarrow{g} c_2) \\]
has $1$-faces
\\[ d_0 = g, \quad d_1 = g \circ f, \quad d_2 = f, \\]
and witnesses $d_1$ as a composition of its factors $d_0$, $d_2$.
By the construction of $N(\mathcal C)$, $u$ is the unique $2$-simplex having $f$ and $g$ as faces.

A $3$-simplex
\\[ c_0 \xrightarrow{f} c_1 \xrightarrow{g} c_2 \xrightarrow{h} c_3 \\]
has $2$-faces
{% tex classes: [antex,display] %}
$\begin{aligned}
  d_0 &= (c_1 \xrightarrow{g} c_2 \xrightarrow{h} c_3) \\
  d_1 &= (c_0 \xrightarrow{g \circ f} c_2 \xrightarrow{h} c_3) \\
  d_2 &= (c_0 \xrightarrow{f} c_1 \xrightarrow{h \circ g} c_3) \\
  d_3 &= (c_0 \xrightarrow{f} c_1 \xrightarrow{g} c_2)
\end{aligned}$.
{% endtex %}
Associativity of composition gives rise to the "inner" simplicial identity $d_1 d_2 = d_1 d_1$.

Thus, given a simplicial set $K$ that is known to be the nerve of some category $\mathcal C$, we recover $\mathcal C$ (up to isomorphism) by setting $\mathrm{ob}(\mathcal C) = N(\mathcal C)_0$ and $\mathrm{arr}(\mathcal C) = N(\mathcal C)_1$.
The identity arrow on $c \in N(\mathcal C)_0$ is the degeneracy $s_0(c) \in N(\mathcal C)_1$, and the appropriate simplicial identities give the identity laws.
Composition is defined by the partial operation
{% tex classes: [antex,display] %}
$
  \circ \colon N(\mathcal C)_1 \times N(\mathcal C)_1 \rightharpoonup N(\mathcal C)_1
$
{% endtex %}
on the arrows by setting
{% tex classes: [antex,display] %}
$
  d_0 u \circ d_2 u \defeq d_1 u
$
{% endtex %}
for each $2$-simplex $u \in N(\mathcal C)_2$.
Observe that this is a function only if (and if) $K$ has unique $(2,1)$-horn fillers, which holds since $K$ is the nerve of some category.
Associativity of composition defined in this way holds, again by dint of the simplicial identities.

A strengthening of the observations above gives the following lemma {% cite lurie:2009:htt -L proposition -l 1.1.2.2 %}:

{% lemma %}
A simplicial set $K$ is (equivalent to) the nerve $N(\mathcal C)$ of some category $\mathcal C$ if and only if it satisfies the unique inner horn filling condition: for any $n$, $0 < i < n$ and map $f$ of simplicial sets,
{% tex classes: [antex,display] %}
\begin{tikzcd}
  \Lambda^n_i \ar[r, "f"] \ar[d, hookrightarrow] & K \\
  \Delta^n \ar[ur, dashrightarrow, swap, "\exists !"]
\end{tikzcd}
{% endtex %}
there's a unique dotted arrow such that the above diagram commutes.
{% endlemma %}

{% proof %}
(Sketch).
A horn $\Lambda^n_i \rightarrow N(\mathcal C)$ is given by a graded family (over $k$) of $k$-chains (indexed by {% tex %}$(\Lambda^n_i)_k${% endtex %}), compatible with the face and degeneracy maps.
In particular, it's generated (with the face and degeneracies) by a set of $n$-many $(n-1)$-chains compatible under face maps; in particular, on
\\[ c_0, \dotsc, c_n, \\]
where the $1$-simplices $c_j \rightarrow c_{j+1}$ are known, and the missing $(n-1)$-face is the one that omits $c_i$.

Claim: if this horn is *inner* then there's one way to (re)construct an $(n-1)$-chain
\\[ c_0 \rightarrow \dotsb \rightarrow c_{i-1} \xrightarrow{?} c_{i+1} \rightarrow \dotsb \rightarrow c_n \\]
compatible with the face maps, basically because the $1$-simplices are all known. Then the $n$-chain of all these arrows is the unique chain filling the horn.

Conversely, given $K$ that uniquely fills inner horns, form $\mathcal C$ from $K$ by setting $\mathrm{ob}(\mathcal C) = K_0$ and $\mathrm{arr}(\mathcal C) = K_1$.
As previously discussed, the identity and composition structures follow from the degeneracies, $K_2$ and $K_3$, and well-definedness is a consequence of unique horn fillers.

Then we have a map $K \rightarrow N(\mathcal C)$, essentially by construction, and can show it's an isomorphism.
{% endproof %}

It's unreasonable to expect the outer horn filling condition for nerves; for instance, a horn
\\[ \Lambda^2_0 \rightarrow N(\mathcal C) \\]
is a diagram
{% tex classes: [antex,display] %}
\begin{tikzcd}[row sep=small, column sep=small]
  c_0 \ar[r] \ar[d] & c_2 \\
  c_1 &
\end{tikzcd}
{% endtex %}

Requiring fillers of all such horns is tantamount to saying that every arrow in $\mathcal C$ extends along any other arrow, which is generally true only for groupoids.
A similar thing holds for $\Lambda^2_2$.

The nerve construction is a functor $N \colon \mathrm{Cat} \rightarrow \mathrm{sSet}$.


### References

{% bibliography --cited %}
