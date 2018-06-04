baseDir = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\Scene\';
baseDirDes = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\SIFTs\';
nomDico = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\SIFTs\dictionnaire.mat';

load 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\SIFTs\patchmin.mat'

[ I, nomim, sifts ] = randomImageDes( baseDir, baseDirDes );
load(nomDico);

matNormClusters = repmat(sum(clusters.^2,2),1,size(sifts,2));

[bow, nc] = computeBow( sifts, clusters, matNormClusters );

visuBoW(I, patchmin, bow, nc, nomim);