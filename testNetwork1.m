
%% Specify Geometry here:

% CreateRectChannel(usNode, dsNode, dsZ, usZ, width, manningsN, length, inflowAtUpstreamNode);
C_a = CreateRectChannel(1, 2, 1, 2, 10, 0.01, 100, 100);
C_b = CreateRectChannel(1, 3, 1, 2, 10, 0.01, 100, 0);
C_c = CreateRectChannel(1, 4, 0, 2, 10, 0.01, 140, 0);
C_d = CreateRectChannel(2, 4, 0, 1, 10, 0.01, 100, 0);
C_e = CreateRectChannel(3, 4, 0, 1, 10, 0.01, 100, 0);

Conduits = [C_a C_b C_c C_d C_e];





%% Define parameters
k = 1;
yd = 1; % Downstream boundary water depth
dsNode = 4;
g = 9.81;


%% Run computation

[H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

