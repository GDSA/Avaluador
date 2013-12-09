%%


ans = csvimport('sed2013_task2_dataset_train_gs.csv');
%% Comparem si és correcte o no la classificació.
asn1 = csvimport('dades.csv');

n = length(ans);
m = length(asn1);
IN=[1 2 3 4 5 6 7 8 9];
OUT=[NaN NaN NaN NaN NaN NaN NaN NaN NaN];

for k = 1:m
    [id clase_pre] = spacecuter(asn1(k));
    evento_pre = strcat(clase_pre);


for i = 2:n
[on clase_tro] = spacecuter(ans(i));
ev =troba(id, on);
if (ev == length(id))
    evento = strcat(clase_tro);
    IN(k+9) = avaluat(evento_pre);
    OUT(k+9) = avaluat(evento);
      break;
end
end
end


%%

g1 = [IN];
g2 = [OUT];
[C,order] = confusionmat(g1,g2)
Pr=0;
C
Re=0;
Fscore=0;

%% Avaluacio de les dades
for l = 1:9
PV=C(l,l);
PF=0;
NF=0;
for j = 1:9
   PF=PF+C(l,j);
   NF=NF+C(j,l);
end
  PF=PF-C(l,l);
  NF=NF-C(l,l);
Pr(l) = (PV/(PV+PF))
Re(l) = (PV/(PV+NF))
Fscore(l) = 2*((Pr(l)*Re(l))/(Pr(l)+Re(l)))

end

f = figure('Position',[400 400 800 500]);
dat = C; 
cnames = {'Concert','Conference','Exhibition','Fashion','Non_event','Others','Protest','Sports','Theatre'};
rnames = {'Concert','Conference','Exhibition','Fashion','Non_event','Others','Protest','Sports','Theatre'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,'RowName',rnames,'Position',[30 200 700 200 ]);
set(t,'ColumnWidth',{50})

%f = figure('Position',[400 500 800 400]);
dat = [Pr]; 
rnames = {'Precision'};
cnames = {'Concert','Conference','Exhibition','Fashion','Non_event','Others','Protest','Sports','Theatre'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,'RowName',rnames,'Position',[30 0 700 50]);
set(t,'ColumnWidth',{50})

%f = figure('Position',[400 500 800 400]);
dat = [Re]; 
rnames = {'Recall'};
%cnames = {'Concert','Conference','Exhibition','Fashion','Non_event','Others','Protest','Sports','Theatre'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,'RowName',rnames,'Position',[30 50 700 50]);
set(t,'ColumnWidth',{50})

%f = figure('Position',[400 500 800 400]);
dat = [Fscore];

rnames = {'F-score'};
%cnames = {'Concert','Conference','Exhibition','Fashion','Non_event','Others','Protest','Sports','Theatre'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,'RowName',rnames,'Position',[30 100 700 50]);
set(t,'ColumnWidth',{50})
%%

figure(2);
subplot(3,1,1);
plot(Pr);
subplot(3,1,2);
plot(Re);
subplot(3,1,3);
plot(Fscore);

%% Normal Mutual Information

 MIhat = MutualInfo(C,C)

