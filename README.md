# Numerical and Analytical Solutions for Volterra Integral Equations

This repository contains the implementations of analytical and numerical methods for solving **linear Volterra integral equations of the second kind**. These methods were developed and tested as part of a research project. The repository includes both mathematical formulations and their software implementations, highlighting practical applications and comparative performance analysis. All results are documented in a detailed [report](https://github.com/ivandybko/Volterra_equations/blob/ca0ab5e386d1dfe11d4cbcb67ef982a46405c7e5/Report.pdf) or summarized in a concise [presentation](https://github.com/ivandybko/Volterra_equations/blob/ca0ab5e386d1dfe11d4cbcb67ef982a46405c7e5/Presentation.pdf) for easy reference.

## Overview

This repository aims to provide efficient computational tools to solve these equations and analyze their accuracy.
The general form of the equation is:
```math
y(x) - \int_a^x K(x, t) y(t) \, dt = f(x)
```
where:
- $`y(x)`$ - unknown function,
- $`K(x,t)`$ - kernel function,
- $`f(x)`$ - known function (right-hand side).
## Features

- **Analytical Methods**:
  - Conversion to equivalent differential equations for degenerate kernels of form $` K(x,t) = \varphi(x) + \psi(x)(x-t)`$. [Wolfram Mathematica Notebook](https://github.com/ivandybko/Volterra_equations/blob/ca0ab5e386d1dfe11d4cbcb67ef982a46405c7e5/Source%20code/Equations%20with%20Kernel%20of%20the%20Form%20K(x%2Ct)%3D%CF%86(x)%2B%CF%88(x)(x%E2%88%92t).nb).
  - Solution method based on the Laplace transform for difference kernels $`$K(x,t)=K(x-t)$`$. [Wolfram Mathematica Notebook](https://github.com/ivandybko/Volterra_equations/blob/ca0ab5e386d1dfe11d4cbcb67ef982a46405c7e5/Source%20code/%20Solution%20Method%20for%20Integral%20Equations%20with%20Difference%20Kernel%20Based%20on%20the%20Laplace%20Transform.nb)

- **Numerical Methods**:
  - [**Quadrature Method**](https://github.com/ivandybko/Volterra_equations/blob/7217e0ebd0f53350ea7a8b5a916c844a651d4382/Source%20code/Quadrature_Method.m): Approximation using algebraic systems derived from quadrature formulas.
  - [**Method of Averaging Functional Corrections**](https://github.com/ivandybko/Volterra_equations/blob/7217e0ebd0f53350ea7a8b5a916c844a651d4382/Source%20code/Method_of_Averaging_Functional_Corrections.m): Iterative technique for enhanced accuracy, especially for smooth or singular kernels.

- **Comparison of Methods**:
  - Detailed accuracy analysis across examples with various kernel types and grid configurations.

## Results and Analysis

The methods were tested on a variety of equations to evaluate:
1. **Accuracy**: Measured by the norm of the error between numerical and analytical solutions.
2. **Efficiency**: Performance on intervals of varying lengths and grid resolutions.

### Key Observations
- The **Method of Averaging Functional Corrections** demonstrated superior accuracy for large intervals and finer grids.
- The **Quadrature Method** is computationally efficient but less accurate for extended domains.

## Examples

### [1. Simple Kernel](https://github.com/ivandybko/Volterra_equations/blob/7217e0ebd0f53350ea7a8b5a916c844a651d4382/Source%20code/Examples/Example1.m)
**Equation**: 
``` math 
y(x) - \int_0^x y(t) \, dt = 1 + \frac{x^2}{2}.
```
- **Analytical solution**: $` y(x) = 2e^x - x - 1 `$.
- **Observations**:
  - The method of averaging functional corrections (MoAFC) outperforms the quadrature method in terms of accuracy.
  - Increasing the interval length to $`[0, 20]`$ results in a noticeable drop in the accuracy of the quadrature method.
  - While increasing the number of nodes in MoAFC increases computational costs, it can also improve the accuracy of the calculations in certain cases.

### [2. Oscillatory Kernel](https://github.com/ivandybko/Volterra_equations/blob/7217e0ebd0f53350ea7a8b5a916c844a651d4382/Source%20code/Examples/Example2.m)
**Equation**:
``` math 
y(x) - \int_0^x \sin(x - t) y(t) \, dt = \sin(x) + \cos(x).
```
- **Analytical solution**: $` y(x) = x + 1 `$.
- **Observations**:
  - The method of averaging functional corrections (MoAFC) shows significantly higher accuracy than the quadrature method, especially on long intervals.
  - Based on the error graph of the MOFC method, the error approaches zero over most of the interval, indicating high precision.
  - Reducing the grid step results in a decrease in the accuracy of the method.

### [3. Sokolov's example](https://github.com/ivandybko/Volterra_equations/blob/7217e0ebd0f53350ea7a8b5a916c844a651d4382/Source%20code/Examples/ExampleSokolov.m)
**Equation**:
``` math 
y(x) + \frac{1}{4}  \int_0^x \sqrt{x + 3t} \; y(t) dt = 1 + x \left( 1 + \frac{7}{18} \sqrt{x} + \frac{29}{135} x^{\tfrac{3}{2}} \right).
```
- **Analytical solution**: $` y(x) = x + 1 `$.
- **Observations**:
  - The method of averaging functional corrections loses convergence for $`b > 18.5`$ at $`\varepsilon = 10^{-6}`$, where $`\varepsilon`$ is the convergence criterion for the iterative process, while the quadrature method maintains an acceptable solution accuracy.
  - Analysis reveals that on the interval $`[0, 10]`$, the error of the quadrature method reaches significant values, but on subsequent subintervals, it tends towards zero.

## Getting Started

### Prerequisites
- **MATLAB**: Required for numerical methods.
- **Wolfram Mathematica**: Needed for analytical solutions.

### Installation
Clone the repository:
```bash
git clone https://github.com/ivandybko/Volterra_equations.git
cd Volterra_equations
