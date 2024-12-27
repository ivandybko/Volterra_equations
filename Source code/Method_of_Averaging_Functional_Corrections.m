function [x_grid, y_final] = Method_of_Averaging_Functional_Corrections(K, phi, a, b, h, max_iter, tol)
    % Решение интегрального уравнения Вольтерра второго рода
    % a, b - границы интервала [a, b]
    % h - шаг сетки
    % K - ядро интеграла, функция двух переменных K(x, t)
    % phi - правая часть уравнения, функция phi(x)
    % max_iter - максимальное число итераций
    % tol - допустимая погрешность между итерациями

    % Задаем сетку
    x_grid = a:h:b;
    N = length(x_grid);
    
    % Начальное приближение для y
    y_prev = phi(x_grid); % phi(x) задается в точках сетки
    y_final = y_prev;
    
    x_points = a:h:a+h;  
    D=1-integral2(K,a,a+h,a,@(x) x)/h;

    % Начальная поправка
    delta_prev = zeros(1, N); 

    % Интегрированное ядро K1(x)
    K1 = @(x) arrayfun(@(x_val) integral(@(xi) K(x_val, xi), a, a+h,'ArrayValued',true), x);

    a_prev=integral(phi,a,a+h)\h\D;
    % Итерационный процесс
    for n = 2:max_iter
        y_new = zeros(1, N);
        delta_new = zeros(1, N);
        
        % Рассчет поправочного коэффициента a_n
        % integral_dbl = 0;
        % for i = 1:N
        %     x = x_grid(i);
        %     integral_dbl = integral_dbl + integral(@(xi) ...
        %         (K(x, xi) - K1(x)) .* (interp1(x_grid, delta_prev, xi, 'linear', 0)), a, a + h);
        % end
        % a_n = integral_dbl / (h*D);
        integrand = @(x, xi) (K(x, xi) - K1(x)).* (interp1(x_grid, delta_prev, x, 'spline', 0) - a_prev);
        a_n = integral2(integrand,a,a+h,a, a+h)/h/D;
        % Вычисление нового y и поправки delta
        for i = 1:N
            x = x_grid(i);
            int1 = integral(@(xi) K(x, xi) .* interp1(x_grid, y_prev, xi, 'spline', 0), a, x);
            int2 = integral(@(xi) (K(x, xi) - K1(x)) .* ...
                (interp1(x_grid, delta_prev, xi, 'spline', 0) - a_n), a, a + h);
            delta_new(i) = int2 + h * a_n * K1(x);
            y_new(i) = phi(x) + int1 + delta_new(i);
        end
        a_prev=a_n;
        % Проверка на сходимость
        if max(abs(y_new - y_prev)) < tol
            y_final = y_new;
            disp(['Converged in ', num2str(n), ' iterations.']);
            return;
        end

        % Обновление для следующей итерации
        y_prev = y_new;
        delta_prev = delta_new;
    end

    disp('Maximum iterations reached without convergence.');
    y_final = y_prev;
end
