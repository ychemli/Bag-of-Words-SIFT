function [newcenters , erreur , movecenters ] = miseAjourKMeans( listPts, centers , nc)

newcenters = [];
erreur = [];

for i=1:size(centers,1)
    
    ind = find(nc == i);

	pointsClusteri = listPts(ind,:);

	pointsCenter =  mean(pointsClusteri,1);
	newcenters = [newcenters ; pointsCenter];
    
    erreurCourante(nc==i,:) = pointsClusteri - repmat(newcenters(i,:), size(pointsClusteri,1) ,1);


end

    diffcenters = (newcenters - centers).^2;
    squareDist = erreurCourante.^2;
    
    erreur = sum(squareDist(:));
    movecenters = sum(diffcenters(:));
    
    
end


