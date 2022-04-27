\name{svycox.validate}
\alias{svycox.validate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Validating a nomogram for a survey-weighted Cox model
}
\description{
Validates a nomogram for a survey-weighted Cox model using bootstrap.
}
\usage{
svycox.validate(.boot.index, .nom, .data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{.boot.index}{
a matrix of bootstrap sample indicators with the number of rows the same as the number of rows 
in the data on which the nomogram was created and the number of columns being the number of 
bootstrap samples}
  \item{.nom}{
a nomogram object returned from svycox.nomogram
}
  \item{.data}{
contains the dataset on which the validation will take place
}
}
\details{
Note that generating the bootstrap sample is design dependent and it is not part of the function. 
The user has to generate the bootstrap samples consistent with the   design used. An example of how 
the bootstrap sample was generated for the dataset is presented in the reference below. }
\value{
   prints the estimated optimism and returns the vector of optimism values for each bootstrap sample 
which can be used to summarize the validation with the measure of choice
}
\references{
Marinela Capanu, Mithat Gonen (2015). Building a Nomogram for Survey-Weighted Cox Models Using R. 
Journal of Statistical Software, Code Snippets, 64(1), 1-17. URL https://www.jstatsoft.org/v64/c01/.
}
\examples{bootit=200
library(survey)
library(rms)
data(noNA)
dd=datadist(noNA)
options(datadist="dd")
dstr2=svydesign(id=~1, strata=~group, prob=~inv_weight, fpc=~ssize, data=noNA)
mynom=svycox.nomogram(.design=dstr2, .model=Surv(survival,surv_cens)~ECOG+liver_only+Alb+Hb+Age+
Differentiation+Gt_1_m1site+lymph_only, .data=noNA, pred.at=24, fun.lab="Prob of 2 Yr OS")

cases=which(noNA$group=="long")
controls=which(noNA$group=="<24")
boot.index=matrix(NA,nrow(noNA),bootit)
for(i in 1:bootit){
boot.index[,i]=c(sample(cases,replace=TRUE),sample(controls,replace=TRUE))
}
myval=svycox.validate(boot.index,mynom,noNA)  
}
\keyword{survival}
\keyword{survey}
\keyword{nomogram}

