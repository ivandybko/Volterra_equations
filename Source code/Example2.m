Ker = @(x, t) sin(x-t); % Определение функции ядра K(x, t)
func = @(x) sin(x)+cos(x); % Определение функции f(x)
[x,y] = Method_of_Averaging_Functional_Corrections(Ker, func, 0, 100, 0.1, 1000,0.00000001);
dlmwrite('/Users/ivandybko/Projects/Term paper Volterra equation/Data/Examples/example_ex2_MoAFC_0_100.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');
[x,y] = Quadrature_Method(Ker, func, 0, 100, 10000);
dlmwrite('/Users/ivandybko/Projects/Term paper Volterra equation/Data/Examples/example_ex2_Quadrature_0_100.txt', [x', y'], 'delimiter', '\t', 'precision', '%.16f');