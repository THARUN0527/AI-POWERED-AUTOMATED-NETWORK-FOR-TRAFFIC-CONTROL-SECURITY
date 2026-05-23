function [analyticsData, nodeHandles] = performTransfer(controls, nodePos, nodeHandles, analyticsData, plots)
    srcNode = controls.sourceNodeDropdown.Value;
    dstNode = controls.destNodeDropdown.Value;
    
    if srcNode==dstNode
        errordlg('Source and destination cannot be the same','Error'); return;
    end
    
    % Highlight and Animate
    origSrc = get(nodeHandles(srcNode),'MarkerFaceColor');
    origDst = get(nodeHandles(dstNode),'MarkerFaceColor');
    set(nodeHandles(srcNode),'MarkerFaceColor',[1 0.8 0.8]);
    set(nodeHandles(dstNode),'MarkerFaceColor',[0.8 1 0.8]);
    drawnow;
    
    animateTransfer(srcNode,dstNode,nodePos,plots.axPDRmini);
    
    % Distance-based metrics
    dist = norm(nodePos(srcNode,:)-nodePos(dstNode,:));
    isFault = dist>5;
    
    % Update Fault List
    if isFault
        msg = sprintf('FAULT: Transfer failed from Node %d to Node %d',srcNode,dstNode);
        set(nodeHandles(dstNode),'MarkerFaceColor','r');
    else
        msg = sprintf('SUCCESS: Data transferred from Node %d to Node %d',srcNode,dstNode);
        set(nodeHandles(dstNode),'MarkerFaceColor','g');
    end
    controls.faultList.String = [controls.faultList.String; {msg}];
    
    % Update analytics data
    analyticsData.t = [analyticsData.t length(analyticsData.t)+1];
    analyticsData.pdrProposed = [analyticsData.pdrProposed 100-2*dist];
    analyticsData.pdrExisting = [analyticsData.pdrExisting 95-2.5*dist];
    analyticsData.thrProposed = [analyticsData.thrProposed 10-0.5*dist];
    analyticsData.thrExisting = [analyticsData.thrExisting 9-0.6*dist];
    analyticsData.eedProposed = [analyticsData.eedProposed 20+5*dist];
    analyticsData.eedExisting = [analyticsData.eedExisting 25+6*dist];
    faults = sum(cellfun(@(x) contains(x,'FAULT'), controls.faultList.String));
    analyticsData.faultRate = [analyticsData.faultRate faults/length(analyticsData.t)*100];
    
    % Update Plots
    updatePlots(analyticsData, plots);
    
    set(nodeHandles(srcNode),'MarkerFaceColor',origSrc);
    if ~isFault, pause(0.3); set(nodeHandles(dstNode),'MarkerFaceColor',origDst); end
end

 