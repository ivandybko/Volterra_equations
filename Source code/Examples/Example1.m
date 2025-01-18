Ker = @(x, t) ones(size(x)); % Определение функции ядра K(x, t)
func = @(x) 1 + (x.^2)/2; % Определение функции f(x)
[x,y] = Method_of_Averaging_Functional_Corrections(Ker, func, 0, 20, 0.005, 1000,0.000001);
dlmwrite('example_ex1_MoAFC.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');
[x,y] = Quadrature_Method(Ker, func, 0, 20, 20000);
dlmwrite('example_ex1_Quadrature.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');
