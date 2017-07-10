clc
clear all
x = 1:100;
p = [1 10];
myFunct = @linearFunction;
y = feval(myFunct,x, p);
figure(1)
plot(x,y)

y_guess = feval(myFunct,x, [0.5 15]);
hold on
plot(x,y_guess,'r')

P_1 = lm(myFunct,[0.5 15],x,y)
figure(1)
y_guess = feval(myFunct,x, P_1);
hold on
plot(x,y_guess,'gx')