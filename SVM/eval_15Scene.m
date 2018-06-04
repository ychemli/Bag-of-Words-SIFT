pathBow = 'C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\TME 3-4\Bags\';

K = 1001 + 1001*4 + 1001*16;
nTrain = 100;
nbCat = 15;
T = 5;

[imCat, imCatTest] = NbImCatAllTest(pathBow, nTrain);
nTestTotal = sum(imCatTest); 
predictclassifieurs = zeros(nbCat, nTestTotal);
results = zeros(T,nbCat);

for t=1:T
    [train, test] = loadData(nTrain, imCat, pathBow, K);
    
    for i=1:nbCat
        [y, ytest] = labelsTrainTest(nTrain, nTestTotal, imCat, i);
        [values] = trainTest(train, test, y);
        predictclassifieurs(i,:) = values;
    end
    
    [matConf, txCat] = multiClassPrediction(predictclassifieurs, imCatTest);
    results(t,:) = txCat;
    if t == T
        figure();
        subplot(2,1,1);
        plot(txCat);
        subplot(2,1,2);
        imagesc(matConf);
        mean(txCat)
        std(txCat)
    end
end

