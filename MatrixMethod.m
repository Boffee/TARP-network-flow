function [H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

%% Initialization

[A21] = GenerateConnMatrix(Conduits);
A12 = A21';

nPipes = length(Conduits);
nNodes = size(A21, 1);
Hconstant = zeros(nNodes, 1);
Hconstant(dsNode) = yd;

Hcurrent = ones(size(Hconstant)) .* yd;
Qcurrent = ones(nPipes, 1) .* 10;

%hf = zeros(length(Conduits), 1);
dhf = zeros(nPipes);
dE = zeros(nPipes, 1);
%dq = zeros(nNodes, 1);


%% Convergence Loop

iter = 1;
maxIter = 1000;
tolerance = 1e-5;
maxError = 1;
while maxError > tolerance && iter < maxIter
    nodeInflow = zeros(nNodes, 1);
    qIn = zeros(nNodes, 1);
    qOut = zeros(nNodes, 1);
    
    for i = 1 : nPipes
        hf = (ComputeSf(k, Conduits(i), Qcurrent(i), Hcurrent(Conduits(i).iup)) ...
                    + ComputeSf(k, Conduits(i), Qcurrent(i), Hcurrent(Conduits(i).idn))) * 0.5 * Conduits(i).L;
        dhf(i, i) = (ComputeDSf(k, Conduits(i), Qcurrent(i), Hcurrent(Conduits(i).iup)) ...
                    + ComputeDSf(k, Conduits(i), Qcurrent(i), Hcurrent(Conduits(i).idn))) * 0.5 * Conduits(i).L;
        dE(i) = hf + Hcurrent(Conduits(i).idn) - Hcurrent(Conduits(i).iup);
        nodeInflow(Conduits(i).iup) = nodeInflow(Conduits(i).iup) + Conduits(i).Qin;
        qIn(Conduits(i).idn) = qIn(Conduits(i).idn) + Qcurrent(i);
        qOut(Conduits(i).iup) = qOut(Conduits(i).iup) + Qcurrent(i);
    end
 
    dq = qIn - qOut + nodeInflow;
    dq(dsNode) = dq(dsNode) - sum(nodeInflow);
    %dq(1) = Q - Qcurrent(1) - Qcurrent(3);
    %dq(2) = Qcurrent(1) - Qcurrent(2);
    %dq(3) = Qcurrent(2) + Qcurrent(3) - Q;
    
    A11 = dhf;
    
    lhs = [A11 A12; A21 zeros(nNodes,nNodes)];
   
    [delta] = pinv(lhs) * [-dE; -dq];
    
    deltaQ = delta(1:nPipes);
    deltaH = delta((nPipes+1):end);
    maxError = max(max(abs(deltaQ)), max(abs(deltaH)));
    
    Qcurrent = Qcurrent + deltaQ;
    Hcurrent = Hcurrent + deltaH;
    Hcurrent(Hconstant~=0) = Hconstant(Hconstant~=0);    
    
    iter = iter + 1;
end

numIter = iter;
H = Hcurrent;
Q = Qcurrent;

