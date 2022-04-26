\name{svycox.nomogram}
\alias{svycox.nomogram}
\title{Builds a nomogram for a survey-weighted Cox model}
\description{Builds a nomogram for a survey-weighted Cox model.}
\usage{svycox.nomogram(.design, .model, .data, pred.at, fun.lab)}
\arguments{
  \item{.design}{ represents a survey design object obtained with the package "survey" }
  \item{.model}{ indicates a Cox model specification }
  \item{.data}{ contains the data on which the model is to be fit (can not contain NAs) }
  \item{pred.at}{ specifies the time point at which the nomogram prediction axis will be drawn }
  \item{fun.lab}{ designate the label of the prediction axis }
}
\details{
     In addition to the inputs, this function expects the following: 
     1) the input dataset (.data) cannot contain NAs. You can accomplish this using the 
na.omit function. See example. 
     2) datadist must be set. See examples and the documentation for the rms package.
     3) survey design must have been saved in .design
     All of these requirements are explained in Capanu & Gonen (2015) in detail%%  
	 }
\value{
A list including elements
\item{nomog}{A nomogram object}
\item{preds}{predicted values from the model}
In addition to what is listed below, the design and the fitted survey weighted Cox model (svy.cox), 
as well as the timepoint at which the nomogram prediction axis will
be drawn (pred.at) are stored
}
\references{
Marinela Capanu, Mithat Gonen (2015). Building a Nomogram for Survey-Weighted Cox Models Using R. 
Journal of Statistical Software, Code Snippets, 64(1), 1-17. URL http://www.jstatsoft.org/v64/c01/.
}
\author{
Mithat Gonen, Marinela Capanu
}
\examples{
library(survey)
library(rms)
data(noNA)
dd=datadist(noNA)
options(datadist="dd")
dstr2=svydesign(id=~1, strata=~group, prob=~inv_weight, fpc=~ssize, data=noNA)
mynom=svycox.nomogram(.design=dstr2, .model=Surv(survival,surv_cens)~ECOG+liver_only+Alb+Hb+Age+
Differentiation+Gt_1_m1site+lymph_only, .data=noNA, pred.at=24, fun.lab="Prob of 2 Yr OS")
plot(mynom$nomog)
}
\keyword{survival}
\keyword{survey}
\keyword{nomogram}
