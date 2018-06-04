% function [centres,erreur] = solutionKMeans(points,nombreDeCentres)
% crit = 1;
% 
% centres = randomSeed(points, nombreDeCentres);
% nc = assignementKMeans(points, centres);
%     
% [centres , erreur , ~ ] = miseAjourKMeans( points, centres , nc);
% 
% while(crit~=0)
%       
%     nc = assignementKMeans(points, centres);
%     
%     [centres , erreur , movecenters ] = miseAjourKMeans( points, centres , nc);
%     
%     crit=movecenters;
%     
%     
% end
% end

function [ centers, erreur ] = solutionKMeans( points, M, norms )
%SOLUTIONKMEANS Summary of this function goes here
%   Detailed explanation goes here
    centers = randomSeed(points, M);
    nc = assignementKMeans(points, centers, norms);
    [centers, erreur, movecenters] = updateKMeans(points, centers, nc);
    while movecenters > 0
        movecenters
        nc = assignementKMeans(points, centers, norms);
        [centers, erreur, movecenters] = updateKMeans(points, centers, nc);
    end
end
