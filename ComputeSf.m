function [Sf] = ComputeSf(k, C, Q, y)

    Sf = (Q / (k / C.n * (C.A(y) / C.P(y))^(2/3) * C.A(y)))^2;

end
