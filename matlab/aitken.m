%%
%aitken
clc, clear, close all
x0 = 0.5;
eps = 1e-8;

result_atiken = aitken_fun(x0, eps);

function result = aitken_fun(x, eps)
    count = 0;
    while 1
        x_pre = x;
        y = fun(x);
        z = fun(y);
        x = z - ((z-y) * (z-y) / (z - 2 * y + x_pre));
        count = count + 1;
        fprintf('round%2d: x_next = %f, x = %f, x_next - x = %.10f\n', count, x, x_pre, x-x_pre);
        result = fun(x);
        if ( abs(x - x_pre) < eps )
            fprintf('precision reached\n');
            break;
        end
    end
end
function value = fun(x)
    %value = ( (cos(0.5) * x - sin(x) + 1.0) / (1.0 + cos(0.5)) );
    value = 1 - sin(x);
end
    
