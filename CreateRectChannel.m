function C = CreateRectChannel(nodeUp, nodeDown, zd, zu, width, n, length, Qin)
    C.A = @(y) y * width; % Area: depth * width
    C.zu = zu; % upstream Z
    C.zd = zd; % downstream Z
    C.iup = nodeUp;
    C.idn = nodeDown;
    C.n = n; % Manning's N
    C.L = length; % Length
    C.P = @(y) 2*y + width; % Wetted perimeter function
    C.Qin = Qin; % additional outside inflow
end

