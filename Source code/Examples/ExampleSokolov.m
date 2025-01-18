Ker = @(x, t) - 1/4 .* sqrt(x + 3 .* t); % Определение функции ядра K(x, t)
func = @(x) 1 + x .* (1 + (7/18) .* sqrt(x) + (29/135) .* x.^(3/2)); % Определение функции f(x)
[x,y] = Method_of_Averaging_Functional_Corrections(Ker, func, 0, 25, 0.001, 10000,0.1)
dlmwrite('example_Sokolov_MoAFC.txt', [x', y'], 'delimiter', '\t', 'precision', '%.10f');
[x,y] = Quadrature_Method(Ker, func, 0, 50, 2000);
dlmwrite('example_Sokolov_Quadrature.txt', [x', y'], 'delimiter', '\t', 'precision', '%.10f');
