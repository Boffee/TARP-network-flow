function [dSf] = ComputeDSf(k, C, Q, y)

    dSf = 2 * Q * (1 / (k / C.n * (C.A(y) / C.P(y))^(2/3) * C.A(y)))^2;

end
