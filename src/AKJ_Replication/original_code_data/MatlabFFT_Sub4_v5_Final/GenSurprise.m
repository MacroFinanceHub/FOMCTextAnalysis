function [MonthData,MonthColHead] = GenSurprise(data,colheaders,MonthData,MonthColHead)

%computes monthly monetary surprise variables from daily FFF data and
%monthly FOMC data generated by 'ConvertToMonth'. Uses information about
%timing of rate change to genrate the Faust, Swanson, Wright (2004) policy
%surprise variable and a modified monthly expected policy varaible
%suggested by Angrist, Jorda and Kuersteiner (2012).

%FFF0 is the price of a federal funds futures maturing the same month, at
%market close
%FFF1 is the price of a federal funds futures maturing next month, at
%market close

% allocate workspace
AJK         = zeros(length(MonthData),1);
AJK0        = zeros(length(MonthData),1);
AJK1        = zeros(length(MonthData),1);
AJK2        = zeros(length(MonthData),1);
YCeFFr      = zeros(length(MonthData),1);
YC3M        = zeros(length(MonthData),1);
YC2Y        = zeros(length(MonthData),1);
YC5Y        = zeros(length(MonthData),1);
YC10Y       = zeros(length(MonthData),1);
YC32        = zeros(length(MonthData),1);
YC310       = zeros(length(MonthData),1);
LastChange  = zeros(length(MonthData),1);
LastChange1 = zeros(length(MonthData),1);
LastChange2 = zeros(length(MonthData),1);
LastChange3 = zeros(length(MonthData),1);
eFFr        = zeros(length(MonthData),1); %effective Federal Funds Rate
eFFrPM      = zeros(length(MonthData),1); %effective Federal Funds Rate prior month
FSW         = zeros(length(MonthData),1);
F           = zeros(length(MonthData),1);
r           = zeros(length(MonthData),1);
M3          = zeros(length(MonthData),1);
Y2          = zeros(length(MonthData),1);
Y5          = zeros(length(MonthData),1);
Y10         = zeros(length(MonthData),1);
FFC         = zeros(length(MonthData),1);
rFC         = zeros(length(MonthData),1);
sc          = zeros(length(MonthData),1);
monDum      = zeros(length(MonthData),11);


% extract dates of rate changes following FOMC meetings
DataYear    = MonthData(:,strcmp(MonthColHead,'Year'));
DataMonth   = MonthData(:,strcmp(MonthColHead,'Month'));

%this is the date of the change in the target rate
year    = MonthData(:,strcmp(MonthColHead,'ChangeYear'));
month   = MonthData(:,strcmp(MonthColHead,'ChangeMonth'));
day     = MonthData(:,strcmp(MonthColHead,'ChangeDay'));

%The variables FCYear, FCMonth, FCDay contain the date for the prediction
%variable closest to the meeting, or if there is no meeting for the
%corresponding month (DataYear,DataMonth) then the date is the last month
%prior to the Datamonth. 

FCyear    = MonthData(:,strcmp(MonthColHead,'DYear'));
FCmonth   = MonthData(:,strcmp(MonthColHead,'DMonth'));
FCday     = MonthData(:,strcmp(MonthColHead,'DDay'));


%generate a datapointer into the daily dataset to retrieve the Futures and
%interest data for the prediction
Dyear   = data(:,strcmp(colheaders,'Year'));
Dmonth  = data(:,strcmp(colheaders,'Month'));
Dday    = data(:,strcmp(colheaders,'Day'));
FOMCdy  = datenum(year,month,day);
Ddy     = datenum(Dyear,Dmonth,Dday);

% obtain pointers to columns with rate data in daily data file
colFF1    = strcmp(colheaders,'FFF1');
colFF0    = strcmp(colheaders,'FFF0');
colTR     = strcmp(colheaders,'Target Rate');
colM3     = strcmp(colheaders,'RIFLGFCM03');
colY2     = strcmp(colheaders,'RIFLGFCY02');
colY5     = strcmp(colheaders,'RIFLGFCY05');
colY10    = strcmp(colheaders,'RIFLGFCY10');
coleFFr   = strcmp(colheaders,'RIFSPFF');


LTRC      = 0;     %Keep track of last target rate change
LTRC1     = 0;
LTRC2     = 0;
LTRC3     = 0;

FOMC      = MonthData(:,strcmp(MonthColHead,'FOMC Meetings'));

% work through monthly data, start in row 2, row 1 contains prior month
% information to form predictions
for i = 2:length(MonthData)
    % Find last day of previous month with data
    noD        = true;       
    priorMonth = mod(DataMonth(i)-1,12);
    if priorMonth == 0
        priorMonth = 12;
    end
   
    
    %record last change from previous loop
    LastChange(i)  = LTRC;
    LastChange1(i) = LTRC1;
    LastChange2(i) = LTRC2;
    LastChange3(i) = LTRC3;
    %update lastchange with the change information of the current loop.
    %This will be recorded above in the next iteration, thus LTRC is the
    %change one month prior
    
    %if MonthData(i,strcmp(MonthColHead,'FOMC Meetings'))
       %change variable LTRC to new change
       %to be used in subsequent month as LastChange variable
       LTRC3       = LTRC2;
       LTRC2       = LTRC1;
       LTRC1       = LTRC;
       %Load current month change in Target to LTRC, this will be used in
       %the next iteration of the loop in LastChange
       LTRC        = MonthData(i,strcmp(MonthColHead,'Change'));
    %end
    if priorMonth == 12
        Start      = datenum(DataYear(i)-1,priorMonth,eomday(DataYear(i)-1,priorMonth));
    else
        Start      = datenum(DataYear(i),priorMonth,eomday(DataYear(i),priorMonth));
    end
    FCStart    = datenum(FCyear(i),FCmonth(i),FCday(i));
    %This loop starts from the end of the prior month and moves back until
    %data is found in the daily data set
    while noD
             if ~isempty(find(Start==Ddy,1))
                 noD = false;
             else
                 Start = Start-1;
             end
    end
    
    % Load FFF1 and target rate at end of prior month from daily dataset
    F(i)      = data((Start==Ddy),colFF1);
    r(i)      = data((Start==Ddy),colTR);
    eFFrPM(i) = data((Start==Ddy),coleFFr);
    % Load Yield curve data
    M3(i)  = data((Start==Ddy),colM3);
    Y2(i)  = data((Start==Ddy),colY2);
    Y5(i)  = data((Start==Ddy),colY5);
    Y10(i) = data((Start==Ddy),colY10);
    
    
    % definition of most informative predictors for policy action
    if FOMC(i)==0 %eomday(FCyear(i),FCmonth(i))==FCday(i)
       %There is no FOMC meeting scheduled in the current month
       %if closest prediction date fall on last day of prior month then use
       %the one month ahead futures price
            FFC(i) = data((Start==Ddy),colFF1);
       %{
       if FCmonth(i)==DataMonth(i)
            FFC(i) = data((FCStart==Ddy),colFF0);
       else
            FFC(i) = data((FCStart==Ddy),colFF1);
       end
       %}     
    elseif DataMonth(i)~=FCmonth(i)
        %if there was an FOMC meeting but closest available p-score data is
        %in previous month then use 1 month ahead future FF1
        FFC(i) = data((FCStart==Ddy),colFF1);
    else
       %there is an FOMC meeting scheduled in the current month
       %if closest prediction date is within the month then use the current
       %month futures contract
       FFC(i) = data((FCStart==Ddy),colFF0);
    end
    rFC(i)  = data((FCStart==Ddy),colTR);
    eFFr(i) = data((FCStart==Ddy),coleFFr);
    
    if year(i) == 0
       % no meeting occurred
       FSW(i)  = 0;
       AJK0(i) = F(i) - r(i);
       AJK(i)  = FFC(i) - rFC(i);
       AJK1(i) = FFC(i) - rFC(i);
       AJK2(i) = FFC(i) - eFFr(i);
       YCeFFr(i) = eFFr(i) - rFC(i);
       YC3M(i) = M3(i) - eFFrPM(i);
       YC2Y(i) = Y2(i) - eFFrPM(i);
       YC5Y(i) = Y5(i) - eFFrPM(i);
       YC10Y(i)= Y10(i) - eFFrPM(i);
       YC310(i)= Y10(i) - M3(i);
       sc(i)   = 1;
    else
       m      = eomday(year(i),month(i)); %# of days in month of meeting
       %m1     = eomday(year(i+1),month(i+1)); %# of days in month after meeting
       
       if (year(i)>=1995 || (year(i)>=1994 && month(i)>=2) || (year(i)==1990 && month(i)==12))
           %meeting ended same day as change
           if m == day(i)
              scale  = m;
           else
              scale  = (m/(m-day(i)));
           end
       else
           d = day(i)-1;
           if m == d
              scale  = m;
           else
              scale  = (m/(m-d));
           end
       end       
       AJK1(i) = FFC(i) - rFC(i);
       AJK2(i) = FFC(i) - eFFr(i);
       YCeFFr(i) = eFFr(i) - rFC(i);
       AJK0(i) = F(i) - r(i);
       YC3M(i) = M3(i) - eFFrPM(i);
       YC2Y(i) = Y2(i) - eFFrPM(i);
       YC5Y(i) = Y5(i) - eFFrPM(i);
       YC10Y(i)= Y10(i) - eFFrPM(i);
       YC32(i) = Y2(i) - M3(i);
       YC310(i)= Y10(i) - M3(i);
       AJK(i)  = scale*(FFC(i)-rFC(i));       
       sc(i)   = scale;
       if day(i)>22 %if too close to month end, use next month future
          FF1d   = data(FOMCdy(i)==Ddy,colFF1); %FFF1 price on market close of day of Target chagne
          FF1d1  = data(find(FOMCdy(i)==Ddy)-1,colFF1); %FFF1 price the day before
          FSW(i) = scale*(FF1d-FF1d1);           
       else
          FF0d   = data(FOMCdy(i)==Ddy,colFF0); %FFF0 price on market close of day of Target chagne
          FF0d1  = data(find(FOMCdy(i)==Ddy)-1,colFF0); %FFF0 price the day before
          FSW(i) = scale*(FF0d-FF0d1);
       end
    end
    if DataMonth(i) ~= 1
        monDum(i,DataMonth(i)-1) = 1;
    end    
end

LastCFOMC = LastChange.*FOMC;
eFFrFOMC  = eFFr.*FOMC;
AJK1FOMC  = AJK1.*FOMC;
AJKFOMC   = AJK.*FOMC;
AJK       = AJK.*(1-FOMC);
AJK1      = AJK1.*(1-FOMC);
AJK1old    = AJK1 + AJK1FOMC;

DeltaM3   = M3 - lag(M3,1);
DeltaY2   = Y2 - lag(Y2,1);
DeltaY5   = Y5 - lag(Y5,1);
DeltaY10  = Y10 - lag(Y10,1);
DeltaY2(2,1) = 0; %set missing data to zero.
AJK0sq     = AJK0.^2;
AJKsq      = AJK.^2;
AJK1sq     = AJK1old.^2;
AJK1sqFOMC = AJK1FOMC.^2;
AJK2sq     = AJK2.^2;
AJK1cu     = AJK1old.^3;
AJK1qu     = AJK1old.^4;
AJK1qi     = AJK1old.^5;
AJK1qs     = AJK1old.^6;
YC3Msq     = YC3M.^2;
YC310sq    = YC310.^2;
YC2Ysq     = YC2Y.^2;


MonthData = [MonthData,...
                AJK0, AJK, AJK1,AJK0sq,AJKsq,AJK1sq,AJK1cu,AJK1qu,AJK1qi,AJK1qs,...
                AJK1old,...
                AJK2, AJK2sq,...
                AJKFOMC,AJK1FOMC,AJK1sqFOMC,...
                eFFr,eFFrPM,YCeFFr,eFFrFOMC,...
                YC3M,YC2Y,YC5Y,YC10Y,YC310,YC32,YC2Ysq,YC3Msq,YC310sq,...
                DeltaM3,DeltaY2,DeltaY5,DeltaY10,...
                M3,Y2,Y5,Y10,...
                LastChange,LastChange1,LastChange2,LastChange3,...
                LastCFOMC, FSW, F,r, FFC, rFC, sc,monDum];
MonthData = MonthData(2:end,:);
MonthColHead = [MonthColHead,...   
                    'AJK0','AJK','AJK1','AJK0sq','AJKsq','AJK1sq','AJK1cu','AJK1qu','AJK1qi','AJK1qs',...
                    'AJK1old',...
                    'AJK2','AJK2sq',...
                    'AJKFOMC','AJK1FOMC','AJK1sqFOMC',...
                    'eFFr','eFFrPM','YCeFFr','eFFrFOMC',...
                    'YC3M','YC2Y','YC5Y','YC10Y','YC310','YC32','YC2Ysq','YC3Msq','YC310sq',...
                    'DeltaM3','DeltaY2','DeltaY5','DeltaY10',...
                    'M3','Y2','Y5','Y10',...
                    'LastChange','LastChange1','LastChange2','LastChange3',...
                    'LastCFOMC',' FSW',' F','r',' FFC',' rFC','Scale',...
                    'month2','month3','month4',...
                    'month5','month6','month7','month8',...	
                    'month9','month10','month11','month12'];
return
       
       
   
    