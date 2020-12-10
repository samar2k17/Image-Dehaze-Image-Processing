function [darkchannel] = DarkChannel(I,height,width,patch_size)

darkchannel = zeros(height,width);
darkchannel_r = MinFilt(I(:,:,1),[patch_size patch_size]);
darkchannel_g = MinFilt(I(:,:,2),[patch_size patch_size]);
darkchannel_b = MinFilt(I(:,:,3),[patch_size patch_size]);
darkchannel_r(height,width)=0;
darkchannel_g(height,width)=0;
darkchannel_b(height,width)=0;
for index1 = 1:height
    for index2 = 1:width
        darkchannel(index1,index2) = min([darkchannel_r(index1,index2) darkchannel_g(index1,index2) darkchannel_b(index1,index2)]);
    end
end

darkchannel = double(darkchannel);

end
