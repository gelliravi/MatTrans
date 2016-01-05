function output = makeExtraVariables(casedata)

transIndex=find(casedata.branch(:,9)~=0);
ntrans=size(transIndex,1); 
nt=casedata.branch(:,1:5);
nb=size(casedata.bus,1);
ngen=size(casedata.gen,1); % ngen=size(gen)*[1 0]';
nline=size(find(casedata.branch(:,9)==0),1);
shuntIndex=find(casedata.bus(:,6)~=0 | casedata.bus(:,5)~=0 );
nshunt=size(shuntIndex,1); %This is max(size(BS),size(GS))
loadIndex=find(casedata.bus(:,3)~=0 | casedata.bus(:,4)~=0 );
ld=[casedata.bus(loadIndex,[1]) casedata.bus(loadIndex,[3,4])./casedata.baseMVA];
nload=size(loadIndex,1); % This size(PD>0)
lfl=[casedata.bus(:,[1,8:9]), zeros(size(casedata.bus,1),2), casedata.bus(:,[3:4])./casedata.baseMVA]; % Zeros are reserved for the generator values
lfl(casedata.gen(:,1),4:5)=casedata.gen(:,2:3)./casedata.baseMVA; % updated the generator values
wB=50*2*pi; % Frequency=50, To be made generic

%% Making the variables into Struct
variableValues = {nb; ngen; nline; ntrans; nshunt; nload; wB;ld; lfl; nt};

variableNames = {'nb'; 'ngen'; 'nline'; 'ntrans'; 'nshunt'; 'nload'; 'wB';'ld'; 'lfl'; 'nt'};
        
        output = [];
        for i=1:length(variableNames)
             output = setfield(output,char(variableNames(i)),cell2mat(variableValues(i)));
        end