
%% Specify Geometry here:

% CreateRectChannel(usNode, dsNode, dsZ, usZ, width, manningsN, length, inflowAtUpstreamNOde);
C_a = CreateRectChannel(1, 2, 0, 1, 10, 0.01, 100, 100);
C_b = CreateRectChannel(2, 3, 1, 2, 10, 0.01, 100, 0);
C_c = CreateRectChannel(1, 3, 0, 2, 10, 0.01, 200, 0);

Conduits = [C_a C_b C_c];





%% Define parameters
k = 1;
yd = 1; % Downstream boundary water depth
dsNode = 3;
g = 9.81;


%% Run computation

[H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

