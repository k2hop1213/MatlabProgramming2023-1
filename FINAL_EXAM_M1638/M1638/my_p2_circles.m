figure;

set(gcf, 'WindowButtonMotionFcn', @Move);
set(gcf, 'WindowButtonDownFcn', @Click); 

function Move(~, ~)
    
    currPoint = get(gca, 'CurrentPoint');
    x = currPoint(1, 1);
    y = currPoint(1, 2);
    
    r = rand(); 
    t = linspace(0, 2*pi, 100);
    x1 = x + r * cos(t);
    y1 = y + r * sin(t);
    patch(x1, y1, [rand() rand() rand()], 'FaceAlpha', 0.1, 'LineStyle', 'none');
    axis([-5 5 -5 5]);
    xticks([]);
    yticks([]);
    box on
end


function Click(~, ~)
    cla; 
end

