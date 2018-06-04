clear all;

%I = imread('C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1\Scene\kitchen\image_0001.jpg');
I = imread('C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\Scene\MITmountain\image_0001.jpg');

s = 16;
delta = 8;

r = denseSampling(I,s,delta);

sifts = computeSIFTsImage(I);

drawPatches(I,r,s,sifts.');
