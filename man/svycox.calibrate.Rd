\name{svycox.calibrate}
\alias{svycox.calibrate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Checking the  calibration of a nomogram for a survey-weighted Cox
  model
}
\description{Checks the calibration of a nomogram for a survey-weighted
  Cox model.
}
\usage{svycox.calibrate(.nom, .timept = .nom$pred.at, .ngroup = 5)
}
    \arguments{
      \item{.nom}{a nomogram object from svycox.nomogram
      }
      \item{.timept}{the time point at which calibration will take
	place; defaults to the time value of the prediction axis in the
	nomogram
      }
      \item{.ngroup}{number of groups to be formed for validation
	purposes
      }
}
\value{
  returns a matrix of calibration values and plots them
}
\author{
Mithat Gonen, Marinela Capanu
}
\references{
Marinela Capanu, Mithat Gonen (2015). Building a Nomogram for Survey-Weighted Cox Models Using R. 
Journal of Statistical Software, Code Snippets, 64(1), 1-17. URL http://www.jstatsoft.org/v64/c01/.
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

svycox.calibrate(mynom)
  }


\keyword{survival}
\keyword{survey}
\keyword{nomogram}
