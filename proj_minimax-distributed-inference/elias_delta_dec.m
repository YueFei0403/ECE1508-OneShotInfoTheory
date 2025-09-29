function decoded = elias_delta_dec(y)
    m = 1;
    while 1
        if y(m) == 0
            break
        end
        m = m+1;
    end
    % Reading m more bits and dropping ALL
    ytmp = y(m:2*m+1);
    yflip = flip(ytmp);
    y_prepnd = [1 yflip];
    
    n=0;  L = length(y_prepnd);
    for i=1:L
        if y_prepnd(i) == 1
            n = n + 2^(i-1);
        end
    end
    decoded = floor(n);
end