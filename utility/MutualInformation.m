function mi = MutualInformation(X,Y)
% Adapted from
%
% Wang, Yong, and Bao-Gang Hu. 
% "Derivations of normalized mutual information in binary classifications." 
% Fuzzy Systems and Knowledge Discovery, 2009. FSKD'09. 
% Sixth International Conference on. Vol. 1. IEEE, 2009.

TP = sum(X & Y);
FP = sum((~X) & Y);
FN = sum((~Y) & X);
TN = sum((~X) & (~Y));

mi = [
    -(TP+FN)/(TP+FP+TN+FN)*log2((TP+FN)/(TP+FP+TN+FN));
    -(FP+TN)/(TP+FP+TN+FN)*log2((FP+TN)/(TP+FP+TN+FN));
    (TP)/(TP+FP+TN+FN)*log2(TP/(TP+FP));
    (FP)/(TP+FP+TN+FN)*log2(FP/(TP+FP));
    (TN)/(TP+FP+TN+FN)*log2(TN/(TN+FN));
    (FN)/(TP+FP+TN+FN)*log2(FN/(TN+FN))];

mi = sum(mi(isfinite(mi))) ./ entropy(X);

if ~isfinite(mi)
    mi = 0;

end