function [ y ] = linearFunction(x, p,extraTerms )

%y = sin(x* p(1)^2) +  cos(x *p(2));
y = p(1)*x+p(2);
y= y';
end

