% TUTORIAL FOR USING THE con() FUNCTION
%{

%% BASIC SETUP FOR USING con()

%% -- SETUP A FIGURE WITH A MESSAGING CONSOLE ANNOTATION AREA

fh1 = figure(1);
set(fh1,'OuterPosition',[550 400 1100 700],'Color',[1,1,1],'Tag','fh1')
hax1 = axes('Position',[.05 .22 .44 .7],'Color','none','XTick',[],'YTick',[]);
hax2 = axes('Position',[.53 .22 .44 .7],'Color','none','XTick',[],'YTick',[]);



%% -- CREATE AND WRITE SOMETHING TO THE ANNOTATION AREA

sp=sprintf(' ');   sp1=sprintf('>>'); 
sp2=sprintf('>>'); sp3=sprintf('>>');
sp4=sprintf('>>'); str = {' ', sp1,sp2,sp3,sp4};
ft = annotation(fh1,'textbox', [0.05,0.03,0.7,0.13],'String', str,'FontSize',14);
set(ft,'interpreter','none')


%% -- USE con() TO WRITE STUFF TO CONSOLE ANNOTATION AREA

    %-----------------------------------------------CON-----------
    con(sprintf('HELLO WORLD!'),0,ft);
    %-------------------------------------------------------------

    % AFTER ('HELLO WORLD!'), DO YOU SEE THAT "0" ?
    % YOU CAN CHANGE THAT VALUE TO SPECIFY HOW LONG CONSOLE 
    % WILL PAUSE AFTER EACH STATEMENT

    for x = 1:5;
    %-----------------------------------------------CON-----------
    con(sprintf('>> launching in... % 6.4g ',6-x),.3,ft);
    %-------------------------------------------------------------
    end

%}

%% -- FIGURE SETUP FOR CON MESSAGING
clc; close all; clear all;
fh1 = figure(1);
set(fh1,'OuterPosition',[550 400 1100 700],'Color',[1,1,1],'Tag','fh1')
hax1 = axes('Position',[.05 .22 .44 .7],'Color','none','XTick',[],'YTick',[]);
hax2 = axes('Position',[.53 .22 .44 .7],'Color','none','XTick',[],'YTick',[]);



%% -- SET ANNOTATION AREA IN FIGURE

sp=sprintf(' ');sp1=sprintf('>>'); sp2=sprintf('>>');sp3=sprintf('>>');sp4=sprintf('>>');
str = {' ', sp1,sp2,sp3,sp4};
ft = annotation(fh1,'textbox', [0.05,0.03,0.7,0.13],'String', str,'FontSize',14);
set(ft,'interpreter','none')



%% -- WRITE LAUNCH SEQUENCE TO CON

for x = 1:5;
    %-----------------------------------------------CON-----------
    con(sprintf('>> launching in... % 6.4g ',6-x),.3,ft);
    %-------------------------------------------------------------
end




%% -- PRINT HELLO WORLD

thismessage = 'world';

    %-----------------------------------------------CON-----------
    con(sprintf('hello %s !',thismessage),2,ft);
    %-------------------------------------------------------------



%% -- PLOT STUFF AND EXPLAIN WHAT'S HAPPENING IN CON

    %-----------------------------------------------CON-----------
    con(sprintf('world, let''s plot something'),2,ft);
    con(sprintf('how about a delaunay triangulation?'),2.5,ft);
    con(sprintf('first we need some random points'),2,ft);
    %-------------------------------------------------------------

x = rand(10,1);
y = rand(10,1);

    %-----------------------------------------------CON-----------
    con(sprintf('>> x = rand(10,1)'),.3,ft);
    con(sprintf('% 4.2g ',x),2,ft);
    con(sprintf('>> y = rand(10,1)'),.3,ft);
    con(sprintf('% 4.2g ',y),2,ft);
    %-------------------------------------------------------------


    %-----------------------------------------------CON-----------
    con(sprintf('now to perform the delaunay triangulation'),2,ft);
    %-------------------------------------------------------------

dt = delaunayTriangulation(x,y)

    %-----------------------------------------------CON-----------
    con(sprintf('>> dt = delaunayTriangulation(x,y);'),1,ft);
    %-------------------------------------------------------------


% I'M STILL WORKING ON THIS ONE - 
% ANYONE HAVE A BETTER IDEA FOR DISPLAYING 'dt' IN THE FIGURE CON
% OTHER THAN SOMETHING LIKE THIS...
%{
% Get instances of command window text
jDesktop = com.mathworks.mde.desk.MLDesktop.getInstance;
jCmdWin = jDesktop.getClient('Command Window');
jTextArea = jCmdWin.getComponent(0).getViewport.getView;
cwText = char(jTextArea.getText);
display(dt)
jTextArea = jCmdWin.getComponent(0).getViewport.getView;
cwText = char(jTextArea.getText);

    %-----------------------------------------------CON-----------
    con(sprintf('dt parameters: %s',cwText),1,ft);
    %-------------------------------------------------------------
%}


    %-----------------------------------------------CON-----------
    con(sprintf('lets plot this using triplot(dt)'),3,ft);
    con(sprintf('>> triplot(dt)'),0,ft);
    %-------------------------------------------------------------

    axes(hax1)
triplot(dt)
    hold on

    %-----------------------------------------------CON-----------
    con(sprintf('now lets apply labels to the vertices using text()'),3.5,ft);
    %-------------------------------------------------------------

vxlabels = arrayfun(@(n) {sprintf('P%d', n)}, (1:10)');
Hpl = text(x, y, vxlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
   'center', 'BackgroundColor', 'none');

    %-----------------------------------------------CON-----------
    con(sprintf('we can also add triangle labels using text()'),2,ft);
    %-------------------------------------------------------------

ic = incenter(dt);
numtri = size(dt,1);
trilabels = arrayfun(@(x) {sprintf('T%d', x)}, (1:numtri)');
Htl = text(ic(:,1), ic(:,2), trilabels, 'FontWeight', 'bold', ...
   'HorizontalAlignment', 'center', 'Color', 'blue');
hold off


    %-----------------------------------------------CON-----------
    con(sprintf('ok, all done with that plot'),3,ft);
    con(sprintf('lets make a similar one in 3D'),3,ft);
    con(sprintf(' '),2,ft);
    con(sprintf('first we need some arbitrary data from the gallery...'),3,ft);
    %-------------------------------------------------------------

x = gallery('uniformdata',[30 1],0);
y = gallery('uniformdata',[30 1],1);
z = gallery('uniformdata',[30 1],2);


    %-----------------------------------------------CON-----------
    con(sprintf('>> x = gallery(''uniformdata'',[30 1],0);'),.3,ft);
    con(sprintf('>> y = gallery(''uniformdata'',[30 1],1);'),.3,ft);
    con(sprintf('>> z = gallery(''uniformdata'',[30 1],2);'),3,ft);
    con(sprintf('again we can use the delaunayTriangulation() function'),3,ft);
    %-------------------------------------------------------------


DT = delaunayTriangulation(x,y,z)


    %-----------------------------------------------CON-----------
    con(sprintf('>> DT = delaunayTriangulation(x,y,z)'),2,ft);
    con(sprintf('and plot using tetramesh(DT)'),2,ft);
    con(sprintf('>> triplot(dt)'),0,ft);
    %-------------------------------------------------------------

    axes(hax2)
tetramesh(DT);


    %-----------------------------------------------CON-----------
    con(sprintf('neat :)'),2,ft);
    con(sprintf('lets specify the face colors'),3,ft);
    %-------------------------------------------------------------

faceColor  = [0.6875 0.8750 0.8984];

    %-----------------------------------------------CON-----------
    con(sprintf('>> faceColor  = [0.6875 0.8750 0.8984];'),1,ft);
    con(sprintf('and replot the polyhedron...'),2,ft);
    con(sprintf('>> tetramesh(DT,''FaceColor'',faceColor,''FaceAlpha'',0.3);'),0,ft);
    %-------------------------------------------------------------

    axes(hax2)
tetramesh(DT,'FaceColor',faceColor,'FaceAlpha',0.3);


    %-----------------------------------------------CON-----------
    con(sprintf('fantastic'),2,ft);
    con(sprintf('lets rotate this guy'),2,ft);
    %-------------------------------------------------------------


hax2view = hax2.View;

for vv = 1:360

    view([hax2view(1)+vv hax2view(2)])
    pause(.05)

    if vv == 100
    %-----------------------------------------------CON-----------
    con(sprintf('con messaging lets users know whats happening under the hood'),0,ft);
    %-------------------------------------------------------------
    elseif vv == 200
    %-----------------------------------------------CON-----------
    con(sprintf('and reinforces good literate programming practices'),0,ft);
    %-------------------------------------------------------------
    elseif vv == 300
    %-----------------------------------------------CON-----------
    con(sprintf('but remember - everything in moderation'),0,ft);
    %-------------------------------------------------------------
    end

end

    %-----------------------------------------------CON-----------
    con(sprintf('thanks for checking out my tutorial!'),5,ft);
    %-------------------------------------------------------------

close(gcf)



