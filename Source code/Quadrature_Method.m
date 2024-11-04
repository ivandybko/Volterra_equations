
function [x,y] = Quadrature_Method(K, f, a, b, N)

    %   N - число точек дискретизации
    h = (b - a) / (N - 1);
    x = a + h * (0:N-1);
    y = zeros(1, N);
    A_ii = (1/2) * h;
    y(1)=f(x(1));
    for i = 2:N
        sum_val = 0;
        for j = 1:i-1
            if j == 1 || j == i
                A_ij = h/2;
            else
                A_ij = h;
            end
            sum_val = sum_val + A_ij * K(x(i), x(j)) * y(j);
        end
        y(i) = (f(x(i)) + sum_val) / (1 - A_ii * K(x(i), x(i)));
    end
end


