# MSVMLAB

Multiclass support vector machine (MSVM) in MATLAB

The purpose is of this package is to facilitate research on multiclass SVMs. As such, the focus is on clarity rather than speed.

## Get started

1. Download and install [CVX: Matlab Software for Disciplined Convex Programming](http://cvxr.com/cvx/).
2. Download this repository and save all content to a folder named ``msvmlab`` (or something else).
3. Add the ``msvmlab`` folder and all its subfolders to path.
4. Open  ``demos/kernel_ww_svm_qp_demo1.m``  and run the script to compute the WW-SVM on a small example. This requires CVX.

## Directory structure

- ``datasets`` code for generating simple synthetic datasets
- ``solvers``
  - ``kernel_msvm``
  - ``linear_msvm``
  - ``subproblem_solvers`` subproblem solvers go here
- ``demos`` scripts that demonstrate the solvers on the synthetic datasets
- ``utilities`` kernel functions, involution code and other mathematical conveniences go here

## Code organization

The ``solvers`` directory contains both ``overall`` and ``subproblem`` solvers:

```
├── solvers/
│   ├── overall/        # overall solvers
│   │   ├── kernel_cs_svm_qp.m
│   │   ├── ...
│   ├── subproblem/     # subproblem solvers
│   │   ├── cs_subprob_an.m
│   │   ├── ...
│   │   ├── benchmarking/       # subproblem solver benchmarks
│   │   │   ├──  benchmark_cs.m
│   │   │   ├──   ...
```

Subproblem solvers are used in both kernel and linear overall solvers.

### Overall solver file naming convention

An overall solver file is named via the following formula:

``<kernel/linear>_<variant>_svm_<optimization technique>.m``

A "solver file" may have an empty string for ``<variant>`` and/or ``<optimization technique>``. This means that the file is an [abstract class](https://www.mathworks.com/help/matlab/matlab_oop/abstract-classes-and-interfaces.html), to be implemented concretely. For example, the file ``kernel_svm_qp.m`` contains code that is useful for both ``kernel_cs_svm_qp.m`` and ``kernel_ww_svm_qp.m`` two variants of MSVMS.

Below, we use ∅ to denote the empty string. 

- ``<kernel/linear>``  is equal to either ``{kernel, linear}``
- ``<variant>`` is one of ``{∅, cs, ww}`` where 
  - ``∅`` = abstract
  - ``cs`` = Crammer-Singer
  - ``ww`` = Weston-Watkins
- ``<optimization technique>`` is one of ``{∅, qp, dc, bcd, gdm}`` where
  - ``∅`` = abstract
  - ``qp`` = quadratic program solver
  - ``dc`` = decomposition method
  - ``bcd`` = block coordinate descent on the dual
  - ``gdm`` = GDmax


### Subproblem solver file naming convention

A subproblem solver file is named via the following formula:

``<variant>_subproblem_<optimization technique>.m``

where

- ``<variant>`` is one of ``{cs, ww}`` where 
  - ``cs`` = Crammer-Singer
  - ``ww`` = Weston-Watkins
- ``<optimization technique>`` is one of ``{an, qp}`` where
  - ``an`` = analytic exact solver
  - ``qp`` = quadratic program solver

## TODO list

- ``kernel_cs_svm_dc.m``
- ``kernel_svm_dc.m``
