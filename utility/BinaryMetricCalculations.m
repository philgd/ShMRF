function [ scores ] = BinaryMetricCalculations( prediction, truth, mask )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if nargin<3
    mask = ones(size(prediction));
end

prediction = prediction(mask(:)>0);
truth = truth(mask(:)>0);

prediction = logical(prediction==1);
truth = logical(truth==1);

scores.TP = sum(prediction(:) & truth(:));
scores.TN = sum(~prediction(:) & ~truth(:));
scores.FP = sum(prediction(:) & ~truth(:));
scores.FN = sum(~prediction(:) & truth(:));

scores.Se = scores.TP / (scores.TP + scores.FN); % recall R
scores.Sp = scores.TN / (scores.TN + scores.FP);
scores.NPV = scores.TN / (scores.TN + scores.FN);
scores.PPV = scores.TP / (scores.TP + scores.FP);  % precision P
scores.Acc = (scores.TP+scores.TN)/(scores.TP + scores.FP + scores.FN + scores.TN); %A

scores.DSC = 2 * scores.TP / (2 * scores.TP + scores.FP + scores.FN);
scores.Jac = scores.TP / (scores.TP + scores.FP + scores.FN);
scores.MCC = ((scores.TP*scores.TN)-(scores.FP*scores.FN))/sqrt((scores.TP+scores.FP)*(scores.TP+scores.FN)*(scores.TN+scores.FP)*(scores.TN+scores.FN));

scores.VOI = -(entropy(prediction(:)) + entropy(truth(:)) - 2 * MutualInformation(truth(:),prediction(:)));

names = fieldnames(scores);
for i=1:numel(names)
    if ~isfinite(scores.(names{i}))
        scores.(names{i}) = 0;
    end
end

if nargin>2
    vol1 = zeros(size(mask));
    vol2 = vol1;
    vol1(mask==1) = prediction;
    vol2(mask==1) = truth;
    
    vol1Dist = bwdist(vol1);
    vol2Dist = bwdist(vol2);
    
    vol1Dist = vol1Dist(vol2(:)==1);
    vol2Dist = vol2Dist(vol1(:)==1);
    
    scores.H95 = prctile([vol1Dist(:); vol2Dist(:)],90);    
else
    scores.H95 = 0;
end

end

