function [ nc ] = assignementKMeans(sifts, clusters, matNormClusters)
    distances = matNormClusters + repmat(sum(sifts.^2),size(clusters,1),1) - 2 * clusters * double(sifts);
    [~, nc] = min(distances, [], 1);
end
