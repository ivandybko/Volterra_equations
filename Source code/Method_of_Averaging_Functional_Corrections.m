function [x, y] = Method_of_Averaging_Functional_Corrections(K, f, a, b, N, maxIter, tol)
% METHOD_OF_AVERAGING_FUNCTIONAL_CORRECTIONS
% Решение интегрального уравнения Вольтерра второго рода методом усреднения
% функциональных поправок.
%
% Входные параметры:
% K       - Функция ядра интегрального уравнения, @(x, xi)
% f       - Правая часть уравнения, @(x)
% a, b    - Границы интегрирования
% N       - Количество узлов сетки
% maxIter - Максимальное количество итераций
% tol     - Точность сходимости
%
% Выходные параметры:
% x       - Узлы сетки
% y       - Значения функции в узлах

% Узлы сетки
x = linspace(a, b, N + 1); % Разбиение области интегрирования
h = (b - a) / N; % Шаг сетки

% Начальное приближение
w_prev = arrayfun(f, x); % Начальное приближение в узлах сетки

% Итерационный процесс
for iter = 1:maxIter
    w_next = zeros(1, N + 1); % Следующее приближение
    for i = 1:N + 1
        xi = x(i);
        % Вычисление интеграла
        integral_value = integral(@(z) K(xi, z) .* interp1(x, w_prev, z, 'spline'), a, xi);
        % Обновление значения
        w_next(i) = f(xi) + integral_value;
    end
    % Проверка на сходимость
    if max(abs(w_next - w_prev)) < tol
        fprintf('Сходимость достигнута за %d итераций.\n', iter);
        break;
    end
    w_prev = w_next; % Переход к следующей итерации
end

% Проверка завершения итераций
if iter == maxIter && max(abs(w_next - w_prev)) >= tol
    warning('Метод не сошелся за %d итераций.', maxIter);
end

% Возвращаем значения в узлах
y = w_next;

% % Экспорт точек в файл
% outputFile = 'solution_points.txt';
% fileID = fopen(outputFile, 'w');
% fprintf(fileID, 'x\tw(x)\n');
% for i = 1:length(x)
%     fprintf(fileID, '%.6f\t%.6f\n', x(i), y(i));
% end
% fclose(fileID);
% fprintf('Решение сохранено в файл: %s\n', outputFile);

end
