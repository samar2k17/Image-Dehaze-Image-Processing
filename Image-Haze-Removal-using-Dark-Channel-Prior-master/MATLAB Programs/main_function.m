close all;
clear;
 clc;

I = imread('train.png');
[height,width,~] = size(I);
figure;
imshow(uint8(I)); title(' original image');


patch_size = 7;    
patch_size1 = 41;   
omega = 0.93*255;   
epsilon = 10^-3;   
r = 81;             

%% dark channel

[darkchannel] = DarkChannel(I,height,width,patch_size);

figure;
imshow(uint8(darkchannel)); title(' dark channel');

%% atmospheric light A

[darkchannel1] = DarkChannel(I,height,width,patch_size1);
[A] = AtmosphericLight(I,darkchannel1,height,width);


%% transmission 

[transmission] = Transmission(omega,darkchannel,A);

figure;
imshow(uint8(transmission)); title(' transmission before refinement');

%% show the haze free image before refine
transmission_normalized = transmission/255;
result1 = zeros(height,width,3);
I1 = double(I);
result1(:,:,1) = (I1(:,:,1) - (1-transmission_normalized)*A)./transmission_normalized;
result1(:,:,2) = (I1(:,:,2) - (1-transmission_normalized)*A)./transmission_normalized;
result1(:,:,3) = (I1(:,:,3) - (1-transmission_normalized)*A)./transmission_normalized;
figure;
imshow(uint8(result1)); title(' haze free image without refinement');


%% guided filter transmission refinement

[filtered_transmission] = GuidedFilter(transmission_normalized,double(I)/255,r,epsilon);
figure;
imshow(filtered_transmission,[]); title(' guided filtered transmission');


%% show the haze free image after guided filtering
result2 = zeros(height,width,3);
result2(:,:,1) = (I1(:,:,1) - (1-filtered_transmission)*A)./filtered_transmission;
result2(:,:,2) = (I1(:,:,2) - (1-filtered_transmission)*A)./filtered_transmission;
result2(:,:,3) = (I1(:,:,3) - (1-filtered_transmission)*A)./filtered_transmission;
figure;
imshow(uint8(result2)); title(' haze free image after guided filtering');
figure;
subplot(2,1,1); imshow(uint8(I)); title(' hazy image');
subplot(2,1,2); imshow(uint8(result2)); title(' haze free image');
