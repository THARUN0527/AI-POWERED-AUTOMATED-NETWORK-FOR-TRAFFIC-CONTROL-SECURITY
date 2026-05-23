function [plots, analyticsData] = createGraphs(tab1, tab2)
    analyticsData.t=[]; analyticsData.pdrProposed=[]; analyticsData.pdrExisting=[];
    analyticsData.thrProposed=[]; analyticsData.thrExisting=[]; analyticsData.eedProposed=[]; analyticsData.eedExisting=[];
    analyticsData.faultRate=[];
    
    % Mini Graphs
    statsPanel = uipanel(tab1,'Title','Quick Performance Overview',...
                        'Position',[0.02 0.05 0.96 0.28],'FontSize',12,'FontWeight','bold','BackgroundColor','white');
    plots.axPDRmini = axes('Parent',statsPanel,'Position',[0.04 0.2 0.2 0.65]);
    plots.pdrMiniLine1 = plot(plots.axPDRmini,0,0,'-b','LineWidth',1.5); hold(plots.axPDRmini,'on');
    plots.pdrMiniLine2 = plot(plots.axPDRmini,0,0,'--r','LineWidth',1.5);
    
    plots.axTHRmini = axes('Parent',statsPanel,'Position',[0.28 0.2 0.2 0.65]);
    plots.thrMiniLine1 = plot(plots.axTHRmini,0,0,'-b','LineWidth',1.5); hold(plots.axTHRmini,'on');
    plots.thrMiniLine2 = plot(plots.axTHRmini,0,0,'--r','LineWidth',1.5);
    
    plots.axEEDmini = axes('Parent',statsPanel,'Position',[0.52 0.2 0.2 0.65]);
    plots.eedMiniLine1 = plot(plots.axEEDmini,0,0,'-b','LineWidth',1.5); hold(plots.axEEDmini,'on');
    plots.eedMiniLine2 = plot(plots.axEEDmini,0,0,'--r','LineWidth',1.5);
    
    plots.axFaultMini = axes('Parent',statsPanel,'Position',[0.76 0.2 0.2 0.65]);
    plots.faultMiniLine = plot(plots.axFaultMini,0,0,'-m','LineWidth',1.5);
    
    % Detailed Graphs
    analyticsPanel = uipanel(tab2,'Title','Detailed Performance Metrics',...
                        'Position',[0.02 0.02 0.96 0.96],'FontSize',12,'FontWeight','bold','BackgroundColor','white');
    plots.axPDR = axes('Parent',analyticsPanel,'Position',[0.07 0.63 0.4 0.3]);
    plots.pdrLine1 = plot(plots.axPDR,0,0,'-b','LineWidth',2); hold(plots.axPDR,'on');
    plots.pdrLine2 = plot(plots.axPDR,0,0,'--r','LineWidth',2);
    
    plots.axTHR = axes('Parent',analyticsPanel,'Position',[0.55 0.63 0.4 0.3]);
    plots.thrLine1 = plot(plots.axTHR,0,0,'-b','LineWidth',2); hold(plots.axTHR,'on');
    plots.thrLine2 = plot(plots.axTHR,0,0,'--r','LineWidth',2);
    
    plots.axEED = axes('Parent',analyticsPanel,'Position',[0.07 0.25 0.4 0.3]);
    plots.eedLine1 = plot(plots.axEED,0,0,'-b','LineWidth',2); hold(plots.axEED,'on');
    plots.eedLine2 = plot(plots.axEED,0,0,'--r','LineWidth',2);
    
    plots.axFault = axes('Parent',analyticsPanel,'Position',[0.55 0.25 0.4 0.3]);
    plots.faultLine = plot(plots.axFault,0,0,'-m','LineWidth',2);
end