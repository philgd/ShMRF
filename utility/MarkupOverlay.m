function [rgb] = MarkupOverlay(I, V, z, win, d)
%% Plot slice z of image I overlaid with V. 
% d determined which dimension z should be selected from.
% Default value for d is 3.

% If d is specified, permute array so d is last
if nargin>4
    dims = [1 2 3];
    dims(d) = [];
    dims(3) = d;
    
    I = permute(I,dims);
    V = permute(V,dims);
end

% if win is specific, clip image to this
if nargin>3
   I=I(win(1):win(2),win(3):win(4),:);
   V=V(win(1):win(2),win(3):win(4),:);
end

alphaMask = 0.33.*repmat(squeeze(V(:,:,z)'),[1 1 3]);
I = repmat(squeeze(I(:,:,z))',[1 1 3]);

red = zeros(size(I,1),size(I,2),3);
red(:,:,1) = 1;

rgb = I.*(1-alphaMask) + red.*alphaMask;

end
