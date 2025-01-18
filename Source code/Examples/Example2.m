Ker = @(x, t) sin(x-t); % Определение функции ядра K(x, t)
func = @(x) sin(x)+cos(x); % Определение функции f(x)
[x,y] = Method_of_Averaging_Functional_Corrections(Ker, func, 0, 100, 0.1, 1000,0.00000001);
dlmwrite('example_ex2_MoAFC.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');
[x,y] = Quadrature_Method(Ker, func, 0, 100, 10000);
dlmwrite('example_ex2_Quadrature.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');