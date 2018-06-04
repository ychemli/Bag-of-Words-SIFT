function [ values, w, b ] = trainTest( train, test, y )
model = svmtrain(y,train, '-c 1000 -t linear');
[w, b] = getPrimalSVMParameters(model);
values = test * w + repmat(b, size(test,1), 1);
end

