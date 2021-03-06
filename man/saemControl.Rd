% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nlmixr.R
\name{saemControl}
\alias{saemControl}
\title{Control Options for SAEM}
\usage{
saemControl(
  seed = 99,
  nBurn = 200,
  nEm = 300,
  nmc = 3,
  nu = c(2, 2, 2),
  atol = 1e-06,
  rtol = 1e-04,
  method = "liblsoda",
  transitAbs = FALSE,
  print = 1,
  trace = 0,
  covMethod = c("linFim", "fim", "r,s", "r", "s", ""),
  calcTables = TRUE,
  logLik = FALSE,
  nnodes.gq = 3,
  nsd.gq = 1.6,
  optExpression = FALSE,
  maxsteps = 100000L,
  adjObf = TRUE,
  sum.prod = FALSE,
  addProp = c("combined2", "combined1"),
  singleOde = TRUE,
  tol = 1e-06,
  itmax = 30,
  type = c("nelder-mead", "newuoa"),
  powRange = 10,
  lambdaRange = 3,
  loadSymengine = FALSE,
  ...
)
}
\arguments{
\item{seed}{Random Seed for SAEM step.  (Needs to be set for
reproducibility.)  By default this is 99.}

\item{nBurn}{Number of iterations in the Stochastic Approximation
(SA), or burn-in step. This is equivalent to Monolix's \code{K_0} or \code{K_b}.}

\item{nEm}{Number of iterations in the Expectation-Maximization
(EM) Step. This is equivalent to Monolix's \code{K_1}.}

\item{nmc}{Number of Markov Chains. By default this is 3.  When
you increase the number of chains the numerical integration by
MC method will be more accurate at the cost of more
computation.  In Monolix this is equivalent to \code{L}}

\item{nu}{This is a vector of 3 integers. They represent the
    numbers of transitions of the three different kernels used in
    the Hasting-Metropolis algorithm.  The default value is \code{c(2,2,2)},
    representing 40 for each transition initially (each value is
    multiplied by 20).

    The first value represents the initial number of multi-variate
    Gibbs samples are taken from a normal distribution.

    The second value represents the number of uni-variate, or multi-
    dimensional random walk Gibbs samples are taken.

    The third value represents the number of bootstrap/reshuffling or
    uni-dimensional random samples are taken.}

\item{atol}{a numeric absolute tolerance (1e-8 by default) used
by the ODE solver to determine if a good solution has been
achieved;  This is also used in the solved linear model to check
if prior doses do not add anything to the solution.}

\item{rtol}{a numeric relative tolerance (1e-6 by default) used
by the ODE solver to determine if a good solution has been
achieved. This is also used in the solved linear model to check
 if prior doses do not add anything to the solution.}

\item{method}{The method for solving ODEs.  Currently this supports:

\itemize{
\item \code{"liblsoda"} thread safe lsoda.  This supports parallel
           thread-based solving, and ignores user Jacobian specification.
\item \code{"lsoda"} -- LSODA solver.  Does not support parallel thread-based
      solving, but allows user Jacobian specification.
\item \code{"dop853"} -- DOP853 solver.  Does not support parallel thread-based
        solving nor user Jacobain specification
\item \code{"indLin"} -- Solving through inductive linearization.  The RxODE dll
        must be setup specially to use this solving routine.
}}

\item{transitAbs}{boolean indicating if this is a transit
compartment absorption}

\item{print}{The number it iterations that are completed before
anything is printed to the console.  By default, this is 1.}

\item{trace}{An integer indicating if you want to trace(1) the
SAEM algorithm process.  Useful for debugging, but not for
typical fitting.}

\item{covMethod}{Method for calculating covariance.  In this
    discussion, R is the Hessian matrix of the objective
    function. The S matrix is the sum of each individual's
    gradient cross-product (evaluated at the individual empirical
    Bayes estimates).

 "\code{linFim}" Use the Linearized Fisher Information Matrix to calculate the covariance.

 "\code{fim}" Use the SAEM-calculated Fisher Information Matrix to calculate the covariance.

 "\code{r,s}" Uses the sandwich matrix to calculate the covariance, that is: \eqn{R^-1 \times S \times R^-1}

 "\code{r}" Uses the Hessian matrix to calculate the covariance as \eqn{2\times R^-1}

 "\code{s}" Uses the crossproduct matrix to calculate the covariance as \eqn{4\times S^-1}

 "" Does not calculate the covariance step.}

\item{calcTables}{This boolean is to determine if the foceiFit
will calculate tables. By default this is \code{TRUE}}

\item{logLik}{boolean indicating that log-likelihood should be
calculate by Gaussian quadrature.}

\item{nnodes.gq}{number of nodes to use for the Gaussian
quadrature when computing the likelihood with this method
(defaults to 1, equivalent to the Laplaclian likelihood)}

\item{nsd.gq}{span (in SD) over which to integrate when computing
the likelihood by Gaussian quadrature. Defaults to 3 (eg 3
times the SD)}

\item{optExpression}{Optimize the RxODE expression to speed up
calculation. By default this is turned on.}

\item{maxsteps}{maximum number of (internally defined) steps allowed
during one call to the solver. (5000 by default)}

\item{adjObf}{is a boolean to indicate if the objective function
should be adjusted to be closer to NONMEM's default objective
function.  By default this is \code{TRUE}}

\item{sum.prod}{Take the RxODE model and use more precise products/sums.
Increases solving accuracy and solving time.}

\item{addProp}{one of "combined1" and "combined2"; These are the
  two forms of additive+proportional errors supported by
  monolix/nonmem:

combined1: transform(y)=transform(f)+(a+b*f^c)*eps

combined2: transform(y)=transform(f)+(a^2+b^2*f^(2c))*eps}

\item{singleOde}{This option allows a single ode model to include
the PK parameter information instead of splitting it into a
function and a RxODE model}

\item{tol}{This is the tolerance for the regression models used
for complex residual errors (ie add+prop etc)}

\item{itmax}{This is the maximum number of iterations for the
regression models used for complex residual errors.  The number
of iterations is itmax*number of parameters}

\item{type}{indicates the type of optimization for the residuals; Can be one of c("nelder-mead", "newuoa")}

\item{powRange}{This indicates the range that powers can take for residual errors;  By default this is 10 indicating the range is c(1/10, 10) or c(0.1,10)}

\item{lambdaRange}{This indicates the range that Box-Cox and Yeo-Johnson parameters are constrained to be;  The default is 3 indicating the range (-3,3)}

\item{loadSymengine}{Boolean indicating if the model should be
loaded into symengine.  This cause all the ODEs to be collapsed
into one expression that is eventually optimized if
\code{optExpression} is \code{TRUE}.}

\item{...}{Other arguments to control SAEM.}
}
\value{
List of options to be used in \code{\link{nlmixr}} fit for
    SAEM.
}
\description{
Control Options for SAEM
}
\author{
Wenping Wang & Matthew L. Fidler
}
