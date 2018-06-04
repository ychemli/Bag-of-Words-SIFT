clear all;

I = imread('C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\Scene\MITmountain\image_0001.jpg');
%I = marche;

s = 16;
delta = 8;

% figure(1);
% imshow(I);

r = denseSampling(I,s,delta);
drawRectsImage(I,r,s);

  Ix = convolution_separable(I, [-1 0 1], (1/4) * [1; 2; 1]);
  Iy = convolution_separable(I, (1/4)*[1 2 1], [-1; 0; 1]);


Ig = sqrt(Ix.^2+Iy.^2);
Ior = orientation( Ix, Iy , Ig);

Mg  = gaussSIFT(s);


patch = [25;225];
%patch = [80,173, randi(size(Ig,1))-s ; 200,250,randi(size(Ig,2))-s];

% sift = computeSIFT(patch, s, Ig, Ior, Mg);
% visuSIFT( I, Ig,Ior, patch, 'Image de test',s,sift );


 sift = computeSIFT2( s , Ig(patch(1):patch(1)+s-1,patch(2):patch(2)+s-1), Ior(patch(1):patch(1)+s-1,patch(2):patch(2)+s-1), Mg );
figure(2);
 visuSIFT( I, Ig,Ior, patch, 'Image de test',s,sift );

% for i=1:3
% 
% sift  = computeSIFT2( s , Ig(patch(1,i):patch(1,i)+s-1,patch(2,i):patch(2,i)+s-1), Ior(patch(1,i):patch(1,i)+s-1,patch(2,i):patch(2,i)+s-1), Mg );
% visuSIFT( I, Ig,Ior, [patch(1,i);patch(2,i)], 'Image de test',s,sift );
% 
% end






