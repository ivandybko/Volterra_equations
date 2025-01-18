Ker = @(x, t) - 1/4 .* sqrt(x + 3 .* t); % Определение функции ядра K(x, t)
func = @(x) 1 + x .* (1 + (7/18) .* sqrt(x) + (29/135) .* x.^(3/2)); % Определение функции f(x)
[x,y] = Method_of_Averaging_Functional_Corrections(Ker, func, 0, 18.5, 0.005, 10000,0.000001)
dlmwrite('/Users/ivandybko/Projects/Term paper Volterra equation/Data/Examples/example_Sokolov_MoAFC_0_18.5.txt', [x', y'], 'delimiter', '\t', 'precision', '%.10f');
[x,y] = Quadrature_Method(Ker, func, 0, 50, 2000);
dlmwrite('/Users/ivandybko/Projects/Term paper Volterra equation/Data/Examples/example_Sokolov_Quadrature_0_50.txt', [x', y'], 'delimiter', '\t', 'precision', '%.10f');
