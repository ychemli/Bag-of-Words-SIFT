function [sifts] = computeSIFTsImage(I)

delta = 8;
s=16;

%Calcule du gradient en chaque pixels de I

  Ix = convolution_separable(I, [-1 0 1], (1/4) * [1; 2; 1]);
  Iy = convolution_separable(I, (1/4)*[1 2 1], [-1; 0; 1]);

Ig = sqrt(Ix.^2+Iy.^2);
Ior = orientation( Ix, Iy , Ig);
Mg  = gaussSIFT(s);

r = denseSampling(I,s,delta);


S= zeros(1024,128);


for i = 1 : size(r,2)
    S(i,:)=computeSIFT(r(:,i),s,Ig,Ior,Mg);  
end

sifts = S;
end

