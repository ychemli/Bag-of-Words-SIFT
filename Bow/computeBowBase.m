baseDir = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\Scene\';
baseDirDes = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\SIFTs\';

baseDirBow = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\TME 3-4\Bags\';
nomDico = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1-2\SIFTs\dictionnaire.mat';

load(nomDico);

[ I, nomim, sifts ] = randomImageDes( baseDir, baseDirDes );

nbSiftsParImage = size(sifts,2);

matNormClusters = sum(clusters.^2,2);

categorie = categories();

for index=1:15
    
    cat = categorie{index};

    direc = strcat(baseDir,cat,'/');
    listima =dir([direc '*.jpg'] );
    n = length(listima); 
    
    for num=1:n
        sifts = loadSift(cat, num, baseDirDes);

        matNormClusters = repmat(sum(clusters.^2,2),1,size(sifts,2));
        [bow, nb] = computeBow(sifts, clusters, matNormClusters);
        
        desname = strcat(path2bow,listima(num).name(1:length(listima(num).name)-4),'.mat');
        
        save(desname,'bow');
        
    end
   
    
end

