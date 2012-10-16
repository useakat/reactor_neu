#!/bin/bash
    ./dchi2 $Lmin $Lmax $ndiv $P $V $R $Y ${Eres} $Eres_nl} ${mode}
    mv dchi2min_nh.dat dchi2min_nh_${Eres}.dat
    mv dchi2min_ih.dat dchi2min_ih_${Eres}.dat
    mv dchi2min_bestfit2ih.dat dchi2min_bestfit2ih_${Eres}.dat
    mv dchi2min_bestfit2nh.dat dchi2min_bestfit2nh_${Eres}.dat