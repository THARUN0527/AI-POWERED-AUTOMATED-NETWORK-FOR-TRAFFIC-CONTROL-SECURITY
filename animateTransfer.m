
function animateTransfer(srcNode,dstNode,nodePos,ax)
    nSteps=20;
    xStep=linspace(nodePos(srcNode,1),nodePos(dstNode,1),nSteps);
    yStep=linspace(nodePos(srcNode,2),nodePos(dstNode,2),nSteps);
    hMove=plot(ax,xStep(1),yStep(1),'ro','MarkerSize',10,'MarkerFaceColor','r');
    for k=2:nSteps
        set(hMove,'XData',xStep(k),'YData',yStep(k)); pause(0.05); drawnow;
    end
    delete(hMove);
end
