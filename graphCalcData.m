function  c = graphCalcData( shearRate, viscosity, c )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
colorList= ['k' 'b' 'r'  'g' 'y' 'm' 'c' ];
hold on
for dataSet = 1 : c.numOfSheets
    minIndex = c.initialIndex(dataSet); %(dataSet - 1)* c.numPointsPerSheet +1;
    maxIndex = c.initialIndex(dataSet+1)-1;%(dataSet)* c.numPointsPerSheet;
    visc = viscosity( minIndex: maxIndex);
    eta = shearRate( minIndex: maxIndex);
    plot(log(eta),log(visc),colorList(dataSet))
    T = c.T(minIndex);
    P = c.P(minIndex);
    c.setsPlotted =c.setsPlotted+1;
    c.legendInfo{c.setsPlotted} = ['P= ' num2str(P) 'Bar T= ' num2str(T) '°C  calc']; 
end
hold off
legend(c.legendInfo)
ylabel('log \eta')
xlabel('log \gamma ')
ylim([4 7])

end