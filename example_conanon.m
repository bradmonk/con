

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


%% -- CREATE ANON FUNCTION FOR CON MESSAGING
upcon = @(ft,sp,spf,sp2,sp3,sp4) ...
eval('evalin(''caller'',''sp1=sp2;''); evalin(''caller'',''sp2=sp3;''); evalin(''caller'',''sp3=sp4;''); evalin(''caller'',''sp4=spf;''); evalin(''caller'',''ft.String={sp,sp1,sp2,sp3,sp4};'');');


%% -- WRITE STUFF TO CON


% COUNT DOWN TO LAUNCH
for x = 1:5;
    %--- PRINT MESSAGE TO CON ---
    spf = sprintf('>> launching in... % 6.4g ',6-x);
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.3);
    %----------------------------
end



% PRINT HELLO WORLD
thismessage = 'world';

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('hello %s !',thismessage);
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(1);
    %----------------------------



% PLOT STUFF AND EXPLAIN WHAT'S HAPPENING IN CON

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('world, let''s plot something');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('how about a delaunay triangulation?');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('first we need some random points');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

x = rand(10,1);
y = rand(10,1);

    %--- PRINT MESSAGE TO CON ---
    spf = sprintf('>> x = rand(10,1)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.3);
    spf = sprintf('% 4.2g ',x);
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf = sprintf('>> y = rand(10,1)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.3);
    spf = sprintf('% 4.2g ',y);
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('now to perform the delaunay triangulation');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------


dt = delaunayTriangulation(x,y)

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('dt = delaunayTriangulation(x,y);');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(1);
    %----------------------------


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
    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('dt parameters: %s',cwText);
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.5);
    %----------------------------
%}


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('lets plot this using triplot(dt)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------

    axes(hax1)
triplot(dt)
    hold on

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('ok, just evoked triplot(dt)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(1.5);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('now lets apply labels to the vertices and triangles');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3.5);
    %----------------------------


vxlabels = arrayfun(@(n) {sprintf('P%d', n)}, (1:10)');
Hpl = text(x, y, vxlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
   'center', 'BackgroundColor', 'none');

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('just added vertex labels to the plot');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('now to apply triangle labels...');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------


ic = incenter(dt);
numtri = size(dt,1);
trilabels = arrayfun(@(x) {sprintf('T%d', x)}, (1:numtri)');
Htl = text(ic(:,1), ic(:,2), trilabels, 'FontWeight', 'bold', ...
   'HorizontalAlignment', 'center', 'Color', 'blue');
hold off

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('now to apply triangle labels...done');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------



    %--- PRINT MESSAGE TO CON ---
    spf=sprintf(' '); upcon(ft,sp,spf,sp2,sp3,sp4);
    spf=sprintf('that was fun; lets do it again in 3D');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    spf=sprintf(' '); upcon(ft,sp,spf,sp2,sp3,sp4);
    %----------------------------


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('first lets get some arbitrary data from the gallery...');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------

x = gallery('uniformdata',[30 1],0);
y = gallery('uniformdata',[30 1],1);
z = gallery('uniformdata',[30 1],2);


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('>> x = gallery(''uniformdata'',[30 1],0);');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.4);
    spf=sprintf('>> y = gallery(''uniformdata'',[30 1],1);');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.4);
    spf=sprintf('>> z = gallery(''uniformdata'',[30 1],2);');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('again we can use the delaunayTriangulation() function');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------


DT = delaunayTriangulation(x,y,z)


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('>> DT = delaunayTriangulation(x,y,z)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('time to plot using tetramesh(DT)');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    axes(hax2)
tetramesh(DT);

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('wow...');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('that is one ugly polyhedron');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('lets specify some face colors');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(3);
    %----------------------------

faceColor  = [0.6875 0.8750 0.8984];

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('>> faceColor  = [0.6875 0.8750 0.8984];');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('>> tetramesh(DT,''FaceColor'',faceColor,''FaceAlpha'',0.3);');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(.1);
    %----------------------------

    axes(hax2)
tetramesh(DT,'FaceColor',faceColor,'FaceAlpha',0.3);


    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('fantastic');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------

    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('lets rotate this son-of-a-gun...');
    upcon(ft,sp,spf,sp2,sp3,sp4); pause(2);
    %----------------------------


hax2view = hax2.View;

for vv = 1:360

    view([hax2view(1)+vv hax2view(2)])
    pause(.05)

    if vv == 100
    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('con messaging lets users know whats happening under the hood');
    upcon(ft,sp,spf,sp2,sp3,sp4);
    %----------------------------
    elseif vv == 200
    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('and reinforces good literate programming practices');
    upcon(ft,sp,spf,sp2,sp3,sp4);
    %----------------------------
    elseif vv == 300
    %--- PRINT MESSAGE TO CON ---
    spf=sprintf('but remember - everything in moderation');
    upcon(ft,sp,spf,sp2,sp3,sp4);
    %----------------------------
    end

end


%--- PRINT MESSAGE TO CON ---
spf=sprintf('thanks for checking out my tutorial!');
upcon(ft,sp,spf,sp2,sp3,sp4); pause(5);
%----------------------------

close(gcf)



