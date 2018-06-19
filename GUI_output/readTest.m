
M = dlmread('offlog_re_sumoid_0_myid_49_1524475230NY.dat');
M = [M(:,1),M(:,2)];

a=xml2struct('MySUMONet_randTrips.net.xml')


%% SIMulation SUMO

 route=xml2struct('testmap.net.xml');
% contains(M(1,:),2)
% Search term must be a string array, character vector, or cell array of character vectors.



vei=[];
d=0
Cordinates=[zeros(length(laneIDs),6)]
Cordinates2d=[]

realRoad=[]
found=0
for i= 1:length(laneIDs)
    for j =1:length(route.net.edge) % timestep
        if(length(route.net.edge{j}.lane)>1)
            for k=1:length(route.net.edge{j})
                if(strcmp(route.net.edge{j}.lane{k}.Attributes.id,laneIDs(i)))
                    
                    % FOUND MATCHING
                    found=1;
                    cords=str2num(route.net.edge{j}.lane{k}.Attributes.shape);
                    for n=1:length(cords)
                        Cordinates(i,n)=cords(n);
                        
                        if(~mod(n,2))
                            Cordinates2d=[Cordinates2d; cords(n-1),cords(n)]
                        end
                        
                    end
                    d=d+1;
                end
            end
        else
            if(strcmp(route.net.edge{j}.lane.Attributes.id,laneIDs(i)))
                % found matching
                found=1
                
                
                cords=str2num(route.net.edge{j}.lane.Attributes.shape);
                for n=1:length(cords)
                    Cordinates(i,n)=cords(n);
                    
                    if(~mod(n,2))
                        Cordinates2d=[Cordinates2d; cords(n-1),cords(n)]
                    end
                    
                end
                d=d+1
            end
        end
        if(found && length(fieldnames(route.net.edge{j}.Attributes))>5)
            % kan liste opp to like
            cords=str2num(route.net.edge{j}.Attributes.shape);
            for n=1:length(cords)
                if(~mod(n,2))
                    realRoad=[realRoad; cords(n-1),cords(n)]
                end
            end
        end
        found=0;
    end
end



vei=[]
%for i=1:length(x1)   
%    vei =[vei RouteCar1(i,1) 0.01 RouteCar1(i,2)];
%    vei =[vei RouteCar1(i,1)+11 0.01 RouteCar1(i,2)];

%end
fileID = fopen('pointsSumo.txt','w');
fprintf(fileID,"[");
fprintf(fileID,'%6.2f %6.2f %6.2f, \n ',(vei));
fprintf(fileID,']');
fclose(fileID);
