function [nodePos, nodeHandles] = initNetwork(parentTab)
    networkPanel = uipanel(parentTab,'Title','IoT Network Topology',...
                           'Position',[0.02 0.35 0.48 0.6],...
                           'FontSize',12,'FontWeight','bold','BackgroundColor','white');
    axNodes = axes('Parent',networkPanel,'Position',[0.1 0.1 0.85 0.85]);
    axis(axNodes,[0 10 0 10]); grid(axNodes,'on'); hold(axNodes,'on');
    title(axNodes,'Network Node Visualization','FontSize',11,'FontWeight','bold');
    xlabel(axNodes,'X Coordinate'); ylabel(axNodes,'Y Coordinate');
    
    nodePos = [1 2; 2 8; 3 5; 4 9; 5 3; 6 7; 7 4; 8 6; 9 8; 10 2];
    numNodes = size(nodePos,1);
    nodeColors = jet(numNodes);
    nodeHandles = gobjects(numNodes,1);
    
    for i=1:numNodes
        nodeHandles(i) = plot(axNodes,nodePos(i,1),nodePos(i,2),'o','MarkerSize',22,...
            'MarkerFaceColor',nodeColors(i,:),'MarkerEdgeColor','k','LineWidth',1.5);
        text(axNodes,nodePos(i,1)+0.25,nodePos(i,2),['N',num2str(i)],...
            'FontSize',9,'FontWeight','bold','Color','black');
    end
end