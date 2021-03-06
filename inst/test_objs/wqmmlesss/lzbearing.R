data.ld <-
structure(list(megacycles = c(17.88, 28.92, 33, 41.52, 42.12, 
45.6, 48.4, 51.84, 51.96, 54.12, 55.56, 67.8, 68.64, 68.64, 68.88, 
84.12, 93.12, 98.64, 105.12, 105.84, 127.92, 128.04, 173.4)), class = c("life.data", 
"data.frame"), row.names = c(NA, -23L), right.censor.names = "a,alive,c,censor,censored,end,mend,noreport,r,r-censored,right-censored,removed,right,rightcensored,s,survived,survive,suspend,suspended,2", left.censor.names = "l,l-censored,left-censored,left,leftcensored,start,mstart,3", interval.censor.names = "b,bin,i,interval,i-censored,intervalcensored,interval-censored,4", failure.censor.names = "event,exact,d,dead,died,f,fail,failed,failure,report,repair,repaired,replaced,replacement,1", sinterval.censor.names = "s,sinterval,smallinterval,small-interval,5", response.column = c(megacycles = "megacycles"), data.title = "lzbearing", time.units = c(megacycles = "megacycles"), data.note = "")
debug1 <-
FALSE
distribution <-
"lognormal"
distribution.number <-
4
dummy <-
c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1)
e <-
c(1e-04, 1e-04)
escale <-
10000
explan.vars <-
NULL
gamthr <-
c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0)
int <-
1
intercept <-
TRUE
intercept.increment <-
1
ivec <-
c(number.case = 23, nter = 1, nyresp = 1, ntyresp = 0, distribution.number = 4, 
lcheck = 0, nparm = 2, int = 1, maxit = 500, kprint = 0, ierfit = 0, 
iervcv = 0)
kprint <-
0
likelihood.method <-
"smoothed"
mathsoft.gamthr <-
c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0)
maxit <-
500
ndscrat <-
91
niscrat <-
6
non.pos.resp <-
c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
FALSE, FALSE, FALSE, FALSE, FALSE)
nparm <-
2
nter <-
1
ntyresp <-
0
number.cases <-
23L
nyresp <-
1L
oldClasses <-
"life.data"
param.names <-
c("mu", "sigma")
parameter.fixed <-
c(FALSE, FALSE)
regression <-
FALSE
relationship <-
NULL
rvec <-
c(0, escale = 10000, log.likelihood = 0)
startna <-
c(TRUE, TRUE)
test <-
1
the.case.weights <-
c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1)
the.censor.codes <-
c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1)
the.truncation.codes <-
c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1)
the.xmat <-
structure(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
1, 1, 1, 1, 1, 1), .Dim = c(23L, 1L))
theta.start <-
c(4.15079430835416, 0.531522157942684)
theta.start.comp <-
c(`(Intercept)` = 4.15079430835416, the.quantiles = 0.531522157942684
)
tyresp <-
c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0)
yresp <-
structure(c(17.88, 28.92, 33, 41.52, 42.12, 45.6, 48.4, 51.84, 
51.96, 54.12, 55.56, 67.8, 68.64, 68.64, 68.88, 84.12, 93.12, 
98.64, 105.12, 105.84, 127.92, 128.04, 173.4), .Dim = c(23L, 
1L), .Dimnames = list(NULL, c(megacycles = "megacycles")))
zout <-
list(ivec = c(23L, 1L, 1L, 0L, 4L, 0L, 2L, 1L, 500L, 0L, 0L, 
0L), rvec = structure(c(0, 10000, -113.128555297852), Csingle = TRUE), 
    number.cases = 23L, nparm = 2L, xmat = structure(c(1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1), Csingle = TRUE), yresp = structure(c(2.88368272781372, 
    3.36453342437744, 3.49650764465332, 3.72617530822754, 3.74052262306213, 
    3.81990766525269, 3.87949991226196, 3.94816207885742, 3.95047426223755, 
    3.99120378494263, 4.01746368408203, 4.21656227111816, 4.22887563705444, 
    4.22887563705444, 4.23236560821533, 4.43224430084229, 4.5338888168335, 
    4.59147691726685, 4.65510272979736, 4.66192865371704, 4.85140514373779, 
    4.85234260559082, 5.15560102462769), Csingle = TRUE), structure(c(1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), Csingle = TRUE), tyresp = structure(c(0, 
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0, 0), Csingle = TRUE), truncation.codes = structure(c(1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1, 1), Csingle = TRUE), parameter.fixed = c(FALSE, FALSE
    ), e = structure(c(1.0000000116861e-07, 1.0000000116861e-07
    ), Csingle = TRUE), ndscrat = c(-0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    -0.208514414057075, -0.208514414057075, -0.208514414057075, 
    4.79583152331272, 0, 4.79583152331272, 1, -1, 0, 0, 1, 4.15038271495072, 
    0.521686511301696, -19.9045362581729, 0.521686511301696, 
    -1.36051587783986e-08, -2.93016192979802e-07, 0.0118329050467015, 
    -1.75121991808526e-11, -1.75121991808526e-11, 0.00591645258233364, 
    0.272156816074135, 8.39855568740642e-11, 8.39855568740642e-11, 
    0.00591645258233364, -19.9045362581729, -0.650688424565605, 
    -19.9045362581729, -0.650688424565605, 5.33411272097007e-08, 
    1.0000000116861e-07, 0.0133172589486956, 0.0331510910020451, 
    0.0400541338237817, 0, 0, 0.0301649201115103, 3.79061404487402e-09, 
    0, 0, 0, 0, -19.9045362581729, 0.521686511301696, -3.15450128495075e-10, 
    1, 1, 3.15450128495075e-10, 45.9999995414122, 1.65436122510606e-24, 
    9.8227697740672e-25, 1, 0.00591645258233364, 0, 8.39855568740641e-11, 
    0.272156816074135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
    0, 0), niscrat = c(1L, 2L, 0L, 1L, 2L, 0L), theta.hat = structure(c(4.15038251876831, 
    0.521686494350433), Csingle = TRUE), first.derivative = structure(c(-1.36051587773522e-08, 
    -2.93016199748308e-07), Csingle = TRUE), vcv.matrix = structure(c(0.0118329050019383, 
    -1.75122000234396e-11, -1.75122000234396e-11, 0.00591645250096917
    ), Csingle = TRUE), correlation.matrix = structure(c(1, -2.09297623676719e-09, 
    -2.09297623676719e-09, 1), Csingle = TRUE), residuals = structure(c(0.088205449283123, 
    0.22171488404274, 0.285536050796509, 0.443460643291473, 0.455825865268707, 
    0.530744552612305, 0.594969928264618, 0.678664326667786, 
    0.681678950786591, 0.737032175064087, 0.77508145570755, 1.13525462150574, 
    1.16236877441406, 1.16236877441406, 1.17017078399658, 1.71650314331055, 
    2.08574795722961, 2.32917904853821, 2.63129878044128, 2.66595387458801, 
    3.83343720436096, 3.84033203125, 6.86792993545532), Csingle = TRUE), 
    fitted.values.and.deviance = structure(c(63.4582824707031, 
    63.4582824707031, 63.4582824707031, 63.4582824707031, 63.4582824707031, 
    63.4582824707031, 63.4582824707031, 63.4582824707031, 63.4582824707031, 
    63.4582824707031, 63.4582824707031, 63.4582824707031, 63.4582824707031, 
    63.4582824707031, 63.4582824707031, 63.4582824707031, 63.4582824707031, 
    63.4582824707031, 63.4582824707031, 63.4582824707031, 63.4582824707031, 
    63.4582824707031, 63.4582824707031, -6.09973478317261, -4.76734828948975, 
    -4.55024719238281, -4.32502889633179, -4.31739139556885, 
    -4.28880262374878, -4.28255748748779, -4.29154014587402, 
    -4.29214429855347, -4.3060040473938, -4.31817197799683, -4.49285888671875, 
    -4.50844478607178, -4.50844478607178, -4.51296377182007, 
    -4.84645080566406, -5.07234525680542, -5.21717548370361, 
    -5.39135932922363, -5.41092967987061, -6.02250337600708, 
    -6.02585697174072, -7.28025102615356, -2.42808651924133, 
    -1.50636303424835, -1.25338697433472, -0.813146233558655, 
    -0.78564441204071, -0.633474409580231, -0.519244432449341, 
    -0.387628644704819, -0.383196502923965, -0.305123716592789, 
    -0.254787176847458, 0.126856938004494, 0.150459945201874, 
    0.150459945201874, 0.157149732112885, 0.540289223194122, 
    0.735127508640289, 0.845515847206116, 0.96747761964798, 0.980561971664429, 
    1.34376180171967, 1.34555888175964, 1.9268627166748, 1, 1, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 1), Csingle = TRUE))
