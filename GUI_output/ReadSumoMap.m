
vei=[];
d=0
Cordinates=[zeros(length(laneIDs),6)]
Cordinates2d=[]
for i= 1:length(laneIDs)
    for j =1:length(route.net.edge) % timestep
        if(length(route.net.edge{j}.lane)>1)
            for k=1:length(route.net.edge{j})
                if(strcmp(route.net.edge{j}.lane{k}.Attributes.id,laneIDs(i)))
                    
                    % FOUND MATCHING
                    cords=str2num(route.net.edge{j}.lane{k}.Attributes.shape)
                    for n=1:length(cords)
                        Cordinates(i,n)=cords(n);
                        
                        if(~mod(n,2))
                            Cordinates2d=[Cordinates2d; cords(n-1),cords(n)]
                        end 
                        
                    end
                    d=d+1
                end
            end
        else
            if(strcmp(route.net.edge{j}.lane.Attributes.id,laneIDs(i)))
                route.net.edge{j}.lane.Attributes.shape
                    cords=str2num(route.net.edge{j}.lane.Attributes.shape)
                    for n=1:length(cords)
                        Cordinates(i,n)=cords(n);
                        
                        if(~mod(n,2))
                            Cordinates2d=[Cordinates2d; cords(n-1),cords(n)]
                        end 
                        
                    end
                    d=d+1
            end
        end
    end
end