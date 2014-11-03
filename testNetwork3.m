
%% Specify Geometry here:

% CreateRectChannel(usNode, dsNode, dsZ, usZ, width, manningsN, length, inflowAtUpstreamNode);
C_a = CreateRectChannel(1, 2, 3, 4, 10, 0.01, 100, 100);
C_b = CreateRectChannel(2, 3, 2, 3, 10, 0.01, 100, 0);
C_c = CreateRectChannel(2, 4, 1, 3, 10, 0.01, 100, 0);
C_d = CreateRectChannel(3, 5, 1, 2, 10, 0.01, 100, 0);
C_e = CreateRectChannel(4, 5, 1, 1, 10, 0.01, 100, 0);
C_f = CreateRectChannel(4, 6, 0, 1, 10, 0.01, 100, 0);
C_g = CreateRectChannel(5, 6, 0, 1, 10, 0.01, 100, 0);


Conduits = [C_a C_b C_c C_d C_e C_f C_g];





%% Define parameters
k = 1;
yd = 1; % Downstream boundary water depth
dsNode = 6;
g = 9.81;


%% Run computation

[H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

