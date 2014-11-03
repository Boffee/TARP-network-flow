
%% Specify Geometry here:

% CreateRectChannel(usNode, dsNode, dsZ, usZ, width, manningsN, length, inflowAtUpstreamNode);
C_1 = CreateRectChannel(1, 8, 1.705, 2.11, 11, 0.022, 1500, 10);
C_2 = CreateRectChannel(2, 8, 1.705, 2.11, 11, 0.022, 1500, 10);
C_3 = CreateRectChannel(3, 9, 1.705, 3.115, 11, 0.025, 3000, 10);
C_4 = CreateRectChannel(4, 9, 1.705, 3.115, 11, 0.025, 3000, 10);
C_5 = CreateRectChannel(5, 10, 1.5, 2.1, 11, 0.022, 2000, 10);
C_6 = CreateRectChannel(6, 10, 1.5, 2.1, 11, 0.022, 2000, 10);
C_7 = CreateRectChannel(7, 10, 1.5, 2.1, 11, 0.022, 2000, 10);
C_8 = CreateRectChannel(8, 11, 1.3, 1.705, 11, 0.022, 1500, 0);
C_9 = CreateRectChannel(9, 11, 1.3, 1.705, 11, 0.022, 1500, 0);
C_10 = CreateRectChannel( 10, 12, 0.9, 1.5, 11, 0.022, 2000, 0);
C_11 = CreateRectChannel( 11, 12, 0.9, 1.3, 10, 0.022, 1200, 0);
C_12 = CreateRectChannel( 11, 13, 0.4, 1.3, 20, 0.022, 3600, 0);
C_13 = CreateRectChannel( 12, 13, 0.4, 0.9, 20, 0.022, 2000, 0);
C_14 = CreateRectChannel( 13, 14, 0, 0.4, 30, 0.022, 2500, 0);


Conduits = [C_1 C_2 C_3 C_4 C_5 C_6 C_7 C_8 C_9 C_10 C_11 C_12 C_13 C_14];



%% Define parameters
k = 1;
yd = 2.5; % Downstream boundary water depth
dsNode = 14;
g = 9.81;


%% Run computation

[H, Q, numIter] = MatrixMethod(Conduits, k, g, yd, dsNode)

