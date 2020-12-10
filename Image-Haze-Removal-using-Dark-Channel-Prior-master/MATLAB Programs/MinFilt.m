function Y = MinFilt(X,N)
Y = VanHerkMin(X,N(1),'row');
Y = VanHerkMin(Y,N(2),'column');
    
end