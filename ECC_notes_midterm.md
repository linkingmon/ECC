## Chapter 1. Introduction
* Linear Code:  A code C is linear if all linear combinations of codewords are again codewords.
* Weight Enumerator: $W(x)=\sum_{j=0}^{n}w_jx^j$ ($w_j$ number of codewords with weight $j$)
* Minimum distance $d$: For general code, need to check all pairs. For Linear code, only need to check the minimum weight codeword.
* Error-correcting capability $t$: $\lfloor{}\frac{d-1}{2}\rfloor{}$
* Nearest-Neighbor Decoding: Codeword can be correctly recover if $wt(\bar{e})\leq{t}$, and $d-1$ errors can be detected.
* Erroneous decoding probability: Ex, for BSC with transition prob. $p$. $E=1-N_0(1-p)^n-N_1p(1-p)^{n-1}-...-N_tp^t(1-p)^{n-t}$, where $N_t$ is number of error patterns.

## Chapter 2. Introduction to Algebra
* **[Def 2.1]** A set $G$ on which a binary operation $∗$ is defined as a group if
1. **(結合律)** $\forall{a,b,c}\in{G}, a*(b*c)=(a*b)*c$
2. **(單位元素)** $\exist{e}\in{G},s.t.,a*e=e*a=a$
3. **(反元素)** $\forall{a},\exist{a'},s.t.,a*a'=a'*a=e$
* **(交換群)** A group G is commutative (abelian) if $\forall{a,b}\in{G},a*b=b*a$
* **[Ex 2.1]** $\mathbb{Z}$, $\mathbb{R}$ or $\mathbb{C}$ with $+,-,\times{}$ are additive groups but not multiplicative group. $\mathbb{R}\setminus\{0\}$ or $\mathbb{C}\setminus\{0\}$ with $+,-,\times{}$ are multiplicative groups.
* **[Thm 2.1]** $e$ in a group is unique.
* **[Thm 2.2]** $a'$ in a group is unique.
* **[Thm 2.3]** Let $H$ be a subset of $G$, $H$ is a subgroup if
1. $H$ is closed under $*$
2. For any $a$ in $H$, $a'$ is in $H$
* **[Def 2.2]** Let $H$ be a subgroup of $G$, for $a\in{G}$, $a*H$/$H*a$ are called the left/right coset of $H$
* **[Thm 2.4]** $|H|=|a*H|$ ($a*h_1=a*h_2\rightarrow{}h_1=h_2\rightarrow{}\leftarrow{}$)
* **[Thm 2.5]** No two element in different cosets of $H$ are identical ($a*h_a=b*h_b\rightarrow{}a=b*(h_b*h_a^{-1})\rightarrow{}\forall{a*h\in{}a*H},a*h=b*(h_b*h_a^{-1}*h)\in{b*H}\rightarrow{a*H\subset{b*H}}$)
* **[Thm 2.6]** $|H|\ |\ |G|$ and the partition $G/H$ is consist of $n/m$ cosets of $H$
* **[Def 2.3]** A set $F$ with two binary operations $+$ and $.$ is defined as a field if
1. **(加法群)** $F$ is commutative under $+$
2. **(乘法群)** $F\setminus\{0\}$ is commutative under $.$
3. **(分配律)** $\forall{a,b,c}\in{F},a.(b+c)=a.b+a.c$
* **[Ex 2.4]** $\{0,1,2,3\}$ with modulo-4 is not a field. ($2.2=0$)
* **[Ex 2.5]** $GF(p)=\{0,1,2,p-1\}$ with modulo-p is a prime field. ($(x,p)=1$)
* **[Def ]** For $GF(q)$, the smallest $\lambda$ such that $\sum_{i=1}^{\lambda}1=0$ is called the charateristic of $GF(q)$.
* **[Thm 2.7]** $\lambda$ is prime. ($\lambda=ml\rightarrow{}\leftarrow{}$)
* **[Def ]** For $a\in{}GF(q),a\neq{0}$, the order $n$ is the smallest integer such that $a^n=1$
* **[Thm 2.8]** For $a\in{}GF(q),a\neq{0}$, $a^{q-1}=1$ ($b_1b_2\dots{}b_{q-1}=a^{q-1}b_1b_2\dots{}b_{q-1}$)
* **[Thm 2.9]** $n|(q-1)$
* **[Def ]** $a$ is called a primitive element if order is $(q-1)$
* **[Def ]** $V$ is a vector space over field $F$ if
1. $V$ is a commutative additive group
2. For $a\in{F}$ and $\bar{v}\in{V}$, $a.\bar{v}\in{V}$
3. $a.(\bar{u}+\bar{v})=a.\bar{u}+a.\bar{v}$
4. $(a.b).\bar{v}=a.(b.\bar{v})$
5. $1.\bar{v}=\bar{v}$
* **[Def ]** Polynomial $p(x)$ over $GF(q)$ is irreducible if $p(x)$ is not divisible by any lower degree and non-zero polynomials. (Check if divisible for all polynomial with degree lower than $\lfloor{}\frac{\text{degree}}{2}\rfloor{}$)
* **[Thm 2.10]** For any irreducible $q(x)$ over $GF(2)$, $q(x)|x^{2^m-1}+1$
* **[Def ]** For any irreducible $q(x)$ over $GF(2)$, it is primitive if the least $n$ such that $q(x)|x^n+1$ is $2^m-1$
* **[Thm 2.11]** For all binary polynomial $f(x)$, $[f(x)]^{2^l}=[f(x^{2^l})]$
* **[Thm ]** For all polynomial $f(x)$ in $GF(p^m)$ and $p$ is prime, $[f(x)]^{p^m}=[f(x^{p^m})]$
* **[Def ]** A field $Y$ formed by taking modulo over irreducible polynomial $q(x)$ is called an extension field. (對於k次且係數是$GF(q)$的不可分解多項式，他的根不可能再$GF(q)$，他的根會存在於$GF(q^k)$之中)
* **[Ex ]** $x^2+1$ is irreducible in $\mathbb{R}$, $Y=\{ax+b,a,b\in{\mathbb{R}}\}$ is an extension field. Also, $i$ is the root such that $i^2+1=0$, so $C=\{ai+b,a,b\in{\mathbb{R}}\}$ is isomorphic to $Y$
* **[Def ]** If an irreducible $p(x)$ over $GF(q)$ contains a primitive element of $GF(q^m)$ as a root, $p(x)$ is a primitive polynomial.
* **[Ex. 2.7]** $p(x)=x^4+x+1$ is primitive over $GF(2)$, $\alpha\in{GF(2^4)}$
* **[Ex. ]** Factorizing $x^{15}+1$
* **[Thm 2.12]** For $\beta$ in an extension field of $GF(2)$ being a root of $f(x)$, $\beta^{2^l}$ is also a root of $f(x)$.
* **[Def ]** $\beta^{2^l}$ is called the conjigate of $\beta$ ($x^4+x+1$ has roots $\alpha^{1,2,4,8}$)
* **[Def ]** For $\beta\in{2^m}$, the minimum polynomial of $\beta$ is the smallest degree $\Phi(x)$ such that $\Phi(\beta)=0$
* **[Thm 2.14]** The minimum polynomial $\Phi(x)$ of $\beta$ is irreducible.
* **[Thm 2.15]** If $f(\beta)=0$ then $\Phi(x)|f(x)$ (minimum poly of $\alpha$ is $x^4+x+1$)
* **[Thm 2.16]** $\Phi(x)|(x^{2^m}+x)$
* **[Thm 2.18 (Irreducible polynomial)]** $f(x)=\prod{}_{i=0}^{e-1}(x+\beta^{2^i})$ 
* **[Thm 2.19] (Minimum polynomial)** $\Phi(x)=\prod{}_{i=0}^{e-1}(x+\beta^{2^i})$ ($e$ is the minimum integer such that $\beta=\beta^{2^e}$)
* **[Thm 2.21]** If $\beta$ is primitive element of $GF(2^m)$, all conjugates of $\beta$ is also primitive element of $GF(2^m)$ ($n2^i=l(2^m-1)\rightarrow{}n=2^m-1$)

## Chapter 3. Linear Block Codes
* $\bar{v}\in{}C$, $\bar{v}=\bar{u}G$, $G\in{\{0,1\}}^{k\times{n}}$ has rank $k$ generates $C$
* Systematic code $G=[P|I_k]$
* Dual code $C_d\perp{}C$ 
* Parity check matrix $H\in{\{0,1\}}^{(n-k)\times{n}}$ generates $C_d$ (systematic form $[I_{n-k}|P^T]$)
* Syndrome $\bar{s}=\bar{r}H^T=\bar{e}H^T$ is $(n-k)$ tuple. (For solving the linear equation, there will be $2^k$ solution. We choose the most probable one for decoding, this is the minimum weight codeword for BSC)
* **[Thm 3.2]** There exists a codeword with weight $l$ iff there exist $l$ columns in $H$ that sums up to zero.
* **[Cor 3.2]** The minimum weight of $C$ is equal to the smallest number of columns of $H$ that sums up to zero.
* **[Cor ]** For linear block code, $2^{n-k}$ error patterns can be correct and $2^n-2^k$ patterns can be detected 
* **[Cor ]** For linear block code capable of correcting $\lambda$ errors and detecting $l$ errors, $d_{min}\geq{}\lambda+l+1$
* **[Cor ]** For linear block code capable of correcting $v$ errors and $e$ erasures, $d_{min}\geq{}2v+e+1$
* **[Def ]** Standard array of linear block code
$\begin{matrix}
\bar{e_1}=0 & \bar{v_2} & \dots{} & \bar{v}_{2^{k}}\\
\bar{e_2} & \bar{e_2}+\bar{v_2} & \dots{} & \bar{e_2}+\bar{v}_{2^{k}}\\
\vdots{} & \vdots{} \\
\bar{e}_{2^{n-k}} & \bar{e}_{2^{n-k}}+\bar{v}_2  
\end{matrix}$
* **[Thm 3.6]** All cosets have the same syndrome
* **[Syndrome Decoding]** Compute $\bar{s}=\bar{r}H^T$. Find coset leader $\bar{e}_{l}$ of $\bar{s}$. Recover $\bar{v}=\bar{r}+\bar{e}_l$
* **[MacWilliams Identity]** Let $A(z)$ and $B(z)$ be weight enumerators of $C$ and $C_d$, then $A(z)=2^{-(n-k)}(1+z)^nB(\frac{1-z}{1+z})$
* **[Shorten Code]**
* **[Puncture Code]**
* **[Lengthening Code]**

## Chapter 4. Important Linear Block Codes
* **[Reed-Muller Code]** $RM(r,m)$ where $r\leq{m}$ is a $r$ order RM code with $n=2^m$, $k=1+C^m_1+\dots+C^m_r$, $d_{min}=2^{m-r}$
1. $\bar{v}_i=(0...01...10...01...1)$ all with consecutive $2^{i-1}$ (For $m=4$, $\bar{v}_0=1111111111111111$, $\bar{v}_1=0101010101010101$, $\bar{v}_2=0011001100110011$, $\bar{v}_3=0000111100001111$, $\bar{v}_3=0000000011111111$)
2. Product of $l\leq{r}$ distinct $\bar{v}$ forms basis of $C$ 
3. The weight of product of $l$ distinct $\bar{v}$ is $2^{m-l}$
4. $RM(0,m)\subset{}RM(1,m)\subset\dots\subset{}RM(r,m)$
5. $RM(m-r-1,m)$ is dual code of $RM(r,m)$
* **[Majority-Logic Decoding]**
* **[Golay Code]** (23,12,7) is a perfect code 
* **[Interleaved Code]** $v_0^{(1)}v_0^{(2))}...v_0^{(\lambda)}v_1^{(1)}...$
* **[Product Code]** $C_1\bigotimes{}C_2$

## Chapter 5. Cyclic Codes
* **[Thm 5.1]** The nonzero code polynomialof minimum degree in a binary cyclic code is unique
* **[Thm 5.2]** Code polynomial $g(X)=g_0+g_1X+...+X^r$ has $g_0\neq{0}$
* **[Thm 5.3]** A polynomial $f(X)$ with degree less than or equal to $n-1$ is a code polynomial iff $g(X)|f(X)$
* **[Thm 5.4]** There exists one and only one code polynomial with degree $n-k$
* **[Thm 5.5]** $g(X)|(X^n+1)$
* **[Thm 5.6]** $g(X)|(X^n+1)$ and with degree $n-k$, then it generates a cyclic code.
* **[Systematic Encoding]**
1. $X^{n-k}u(X)$
2. $X^{n-k}u(X)=a(X)g(X)+b(X)$
3. systematic code polynomial: $X^{n-k}u(X)+b(X)$
* **[Cor ]** $G = \begin{bmatrix}
g_0 & g_1 & \dots{} & 0\\
0 & g_0 & \dots{} & 0\\
\vdots{} & \vdots{} & \ddots{} & \vdots{} \\
0 & 0 & \dots{} & g_{n-k}
\end{bmatrix}$ and $g_0=g_{n-k}=1$
* **[Thm 5.7]** Let $h(X)=(X^n+1)/g(X)$, then $C_d$ is cyclic and is generated by $X^kh(X^{-1})$
* **[Cor ]** $H = \begin{bmatrix}
h_k & h_{k-1} & \dots{} & 0\\
0 & h_k & \dots{} & 0\\
\vdots{} & \vdots{} & \ddots{} & \vdots{} \\
0 & 0 & \dots{} & h_0
\end{bmatrix}$ and $h_0=h_k=1$

## Chapter 6. BCH & Reed-Solomon Codes
* **[Def 6.1 (Primitive BCH)]** 
1. A primitive $t$-error-correcting BCH code over $GF(q)$ of block length $n = q^m-1$ is a cyclic code with generator polynomial $g(X) $which contains $\alpha,\alpha^2,\dots{},\alpha^{2t}$ and their conjugates as roots.
2. $g(X)=LCM\{\Phi_1(X),\Phi_2(X),...,\Phi_{2t}(X)\}$
* **[Thm 6.1]** Let $f(X)$ be a polynomial over $GF(q)$. Let $\beta\in{}GF(q^m)$. If $\beta$ is a root of $f(X)$, then $\beta^q$ is also a root of $f(X)$ (That is $\Phi_i(X)=\Phi_{qi}(X)$)
* **[Ex 6.1]** $q=2,m=4,n=2^4-1$, let $\alpha$ be a primitive element $GF(2^4)$ and $1+\alpha+\alpha^4$
$\Phi_1(X)=1+X+X^4$ (偶數的$\Phi$和前面一樣了)
$\Phi_3(X)=1+X+X^2+X^3+X^4$
$\Phi_5(X)=1+X+X^2$
$\Phi_7(X)=1+X^3+X^4$
For $t=1$, $g(X)=\Phi_1(X)$ and (15,11,3) code.
For $t=2$, $g(X)=\Phi_1(X)\Phi_3(X)$ and (15,7,5) code.
For $t=3$, $g(X)=\Phi_1(X)\Phi_3(X)\Phi_5(X)$ and (15,5,7) code.
For $t=4$, $g(X)=\Phi_1(X)\Phi_3(X)\Phi_5(X)\Phi_7(X)$ and (15,1,15) code.
* **[Ex 6.2]** $n=63$, $GF(2^6)$
$\Phi_1(X)=1,2,4,8,16,32$
$\Phi_3(X)=3, 6, 12, 24, 48, 33$
$\Phi_5(X)= 5, 10, 20, 40, 17, 34$
$\Phi_7(X)= 7, 14, 28, 56, 49, 35$
$\Phi_9(X)= 9, 18, 36$
* **[Ex 6.3]** $q=4,m=2,n=4^2-1$, let $\alpha$ be a primitive element $GF(4^2)$ and $1+\alpha+\alpha^4$
$\Phi_1(X)=(X+\alpha)(X+\alpha^4)=X^2+X+\alpha^5$ 
$\Phi_2(X)=(X+\alpha^2)(X+\alpha^8)=X^2+X+\alpha^10$ 
$\Phi_3(X)=(X+\alpha^3)(X+\alpha^12)=X^2+\alpha^{10}X+1$
$\Phi_5(X)=X+\alpha^5$ ($\Phi_4$和前面一樣了)
For $t=1$, $g(X)=\Phi_1(X)\Phi_2(X)$ and (15,11,3) code. (兩個連續根)
For $t=2$, $g(X)=\Phi_1(X)\Phi_2(X)\Phi_3(X)$ and (15,9,5) code. (四個連續根)
* **[Ex 6.4]** $q=2,m=4,n=2^4-1,t=2$ and $1+\alpha+\alpha^4$
 $H = \begin{bmatrix}
1 & \alpha & \alpha^2 & \dots{} & \alpha^{14}\\
1 & \alpha^3 & \alpha^6 & \dots{} & \alpha^{42}
\end{bmatrix}\in\{0,1\}^{8\times{}15}$
* **[Thm 6.2 (BCH bound)]** For a cyclic code $C$ of length $n = q^m-1$ which contains $\alpha,\alpha^2,\dots{},\alpha^{2t}$ as roots of its generator polynomials, its minimum distance is at least $2t + 1$. (If $\delta\leq{2t}$, $det(H_{\delta})\neq{}0$)
* **[Cor 6.2]** The true minimum distance of $C$ may be greater than its BCH bound.
* **[Def 6.2 (Non-Primitive BCH)]** Let $n|(q^m-1)$, the element $\beta\in{}GF(q^m)$ is a primitive nth root of unity if $\beta$n=1$
* **[Def 6.3 (Non-Primitive BCH)]** A BCH code of length over $GF(q)$ with design distance $d_0$ is generate by $g(X)$ that contains $\beta^{l_0},\beta^{l_1},\dots{},\beta^{l_0+d_0-2}$ as roots.
* **[Ex 6.5]** $\alpha$ be a primitive of $GF(2^{11})$. Let $\beta=\alpha^{89}$, then $\beta$ is the 23rd root of unity.
$K_1=\{1, 2, 4, 8, 16, 9, 18, 13, 3, 6, 12\}$
$K_5=\{5, 10, 20, 17, 11, 22, 21, 19, 15, 7, 14\}$ (從下一個沒有的根開始)
* **[Ex 6.6]** $\Phi_1$ has $d_0=5$ (4個連續根), but have true MD as 7.
* **[Def 6.4 (Reed-Solomon Code)]** A nonbinray BCH code with $n=q-1$ and $n-k=2t$ and $d_{min}=2t+1$ (Let $\alpha$ be primitive element of $GF(q=p^s)$, $g(X)=(X-\alpha^l)...(X-\alpha^{l+2t-1})$)
* **[Thm 6.3 (Singleton Bound)]** If $C$ is a $(n,k,d)$ linear code, $n-k\geq{d-1}$ ($G=[I_k|P]$, then each codeword has weight no greater then n-k+1)
* **[Def 6.5 (MDS code)]** $C$ is a $(n,k,d)$ maximum distance separable code if $d=n-k+1$ (RS is MDS, and used for correcting burst errors)
* **[Def 6.6 (RS code alternative definition)]**
1. $\begin{bmatrix}a_0\\a_1\\\vdots{}\\ a_{n-1}\end{bmatrix}=\begin{bmatrix}
1 & 1 & \dots{} & 1\\
1 & \alpha & \dots{} & \alpha^{n-1}\\
\vdots{} & \vdots{} & \ddots{} & \vdots{} \\
1 & \alpha^{n-1} & \dots{} & (\alpha^{n-1})^{n-1}
\end{bmatrix}\begin{bmatrix}A_0\\A_1\\\vdots{}\\A_{n-1}\end{bmatrix}$ (DFT)
* **[Thm 6.4]** $E_i=F_iG_i$ then $e_j=\frac{1}{n}\sum_{l=0}^{n-1}f_{((j-l))}g_l$
* **[Thm 6.5]** Def 6.4 and 6.6 are equivalent.