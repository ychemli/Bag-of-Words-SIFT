function [ bow nc ] = computeBow( sifts, clusters, matNormClusters)
    
    matNormClusters = repmat(matNormClusters,1,size(sifts,2));
    nc = assignementKMeans(sifts, clusters, matNormClusters);
    
    %Coding
    for i = 1:size(sifts.',1)   
        H(nc(i),i)=1;   
    end

    %Pooling
    for i = 1:size(H,1) 
        x= sum(H(i,:));
        bow(i) = x;    
    end
    
    bow = bow / size(sifts,2);
    bow = bow.';
    
   
end

