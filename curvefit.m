data = load('G:\lab 5\input.txt');
x = data(:,1);
y = data(:,2);

p1 = polyfit(x, y, 1); 
linear_eq_str = sprintf('y = %.2fx + %.2f', p1(1), p1(2));
fprintf('Linear Fit Coefficients: a1 = %.2f, b1 = %.2f\n', p1(1), p1(2));

p2 = polyfit(x, y, 2); 
quad_eq_str = sprintf('y = %.2fx^2 + (%.2f)x + %.2f', p2(1), p2(2), p2(3));
fprintf('Quadratic Fit Coefficients: a2 = %.2f, b2 = %.2f, c = %.2f\n', p2(1), p2(2), p2(3));

x_fit = linspace(min(x), max(x), 100);
y_linear = polyval(p1, x_fit);
y_quad = polyval(p2, x_fit);

plot(x, y, 'bo', 'DisplayName', 'Data Points'); hold on;
plot(x_fit, y_linear, 'r-', 'DisplayName', linear_eq_str);
plot(x_fit, y_quad, 'g-', 'DisplayName', quad_eq_str);
xlabel('X'); ylabel('Y'); title('Curve Fitting using Least Squares Method');
legend show; grid on; hold off;
text(min(x_fit), max(y_quad), linear_eq_str, 'FontSize', 12, 'Color', 'red');
text(min(x_fit), max(y_quad) - (max(y_quad)-min(y_quad))/10, quad_eq_str, 'FontSize', 12, 'Color', 'green');

fileID = fopen('G:\lab 5\fit_equations.txt', 'w');
fprintf(fileID, 'Linear Equation: %s\nQuadratic Equation: %s\n', linear_eq_str, quad_eq_str);
fclose(fileID);
