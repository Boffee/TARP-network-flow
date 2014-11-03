
%% Specify Geometry here:

% CreateRectChannel(usNode, dsNode, dsZ, usZ, width, manningsN, length, inflowAtUpstreamNode);
C_a = CreateRectChannel(1, 3, 3, 4, 10, 0.01, 100, 100);
C_b = CreateRectChannel(2, 3, 3, 4, 10, 0.01, 100, 100);
C_c = CreateRectChannel(3, 4, 3, 3, 10, 0.01, 100, 0);
C_d = CreateRectChannel(5, 6, 2, 3, 10, 0.01, 100, 100);
C_e = CreateRectChannel(4, 6, 2, 3, 10, 0.01, 100, 0);
C_f = CreateRectChannel(4, 7, 2, 3, 10, 0.01, 100, 0);
C_g = CreateRectChannel(6, 8, 1, 2, 10, 0.01, 100, 0);
C_h = CreateRectChannel(7, 8, 1, 2, 10, 0.01, 100, 0);
C_i = CreateRectChannel(8, 9, 0, 1, 10, 0.01, 100, 0);


Conduits = [C_a C_b C_c C_d C_e C_f C_g C_h C_i];





%% Define parameters
k = 1;
yd = 1; % Downstream boundary water depth
dsNode = 9;
g = 9.81;


%% Run computation

[H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

