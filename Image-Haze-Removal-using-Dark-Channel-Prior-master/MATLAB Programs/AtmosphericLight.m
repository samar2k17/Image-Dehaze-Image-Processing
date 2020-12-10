function [A] = AtmosphericLight(I,darkchannel,height,width)
K = round(height*width*0.001);
X = darkchannel(:);
I_gray = rgb2gray(I); I_gray = I_gray(:);
[~,corrsepond_index] = sort(X,'descend');
corrsepond_index = corrsepond_index(1,:);
A = max(I_gray(corrsepond_index));
A = double(A);

end