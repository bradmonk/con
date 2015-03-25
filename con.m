function [] = con(s1,p,ft)
%% con
% see 'example_con.m' for a full usage tutorail

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

assignin('base', 'spf', s1);
sp=sprintf(' ');
e1 = 'evalin(''caller'',''sp1=sp2;'');';
e2 = 'evalin(''caller'',''sp2=sp3;'');';
e3 = 'evalin(''caller'',''sp3=sp4;'');';
e4 = 'evalin(''caller'',''sp4=spf;'');';
e5 = 'evalin(''caller'',''ft.String={sp,sp1,sp2,sp3,sp4};'');';
evs = strcat(e1, e2, e3, e4, e5);

eval(evs);

disp(s1)

pause(p)

end

% conanon = @(ft,sp,spf,sp2,sp3,sp4) ...
% eval('
% evalin(''caller'',''sp1=sp2;''); evalin(''caller'',''sp2=sp3;''); 
% evalin(''caller'',''sp3=sp4;''); evalin(''caller'',''sp4=spf;''); 
% evalin(''caller'',''ft.String={sp,sp1,sp2,sp3,sp4};'');
% ');