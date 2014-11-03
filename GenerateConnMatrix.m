function [A21] = GenerateConnMatrix(conduitList)

    usNodes = unique([conduitList(:).iup]);
    dsNodes = unique([conduitList(:).idn]);
    
    allNodes = unique([usNodes dsNodes]);
    nNodes = max(allNodes);
    
    A21 = zeros(nNodes, length(conduitList));
    
    for i = 1 : length(conduitList)
        A21(conduitList(i).iup, i) = -1;
        A21(conduitList(i).idn, i) = 1;
    end
end

