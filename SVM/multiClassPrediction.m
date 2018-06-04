function [ confusionMatrix , nGoodCat ] = multiClassPrediction( predictclassifieurs , imCatTest )
nCat = 15;
nGoodCat = zeros(size(imCatTest));
confusionMatrix = zeros(nCat);
[ ~ , maxInd ] = max( predictclassifieurs, [], 1 );
nbItest = 0;
nbItest = imCatTest(1);
confusionMatrix(1,:) = histc(maxInd(1:nbItest),1:nCat);
nGoodCat(1) = confusionMatrix(1,1);
for i=2:nCat
nbItest2 = nbItest;
nbItest = nbItest + imCatTest(i);
confusionMatrix(i,:) = histc(maxInd(nbItest2+1:nbItest),1:nCat);
nGoodCat(i) = confusionMatrix(i,i);
end
confusionMatrix = confusionMatrix ./ repmat(imCatTest,1,nCat).* 100 ;
nGoodCat = nGoodCat ./ imCatTest .* 100;
nGoodCat = nGoodCat';
end