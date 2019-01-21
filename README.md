# aws-cost-estimator
estimate the cost of a running AWS instance

## Intro

This is an extremely simlpe script that estimates the cost of a running AWS instance. It takes into account the I/O for the instance, the storage used for the instance and the instance base cost.

### Installation

```
$ curl https://raw.githubusercontent.com/pconwell/aws-cost-estimator/master/cost-estimate.sh > estimator.sh
$ chmod +x ./estimator.sh
$ ./estimator.sh
```
