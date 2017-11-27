function Qmat = gen_qmat(N)
    Qmat = zeros(N);
    t = 1;s = 1;c = 0;
    while t < N
        s = s*2;
        t = t+s;
        c = c+1;
    end  
    Qmat(:) = s;
    for i = c:-1:1
        t = t - s;
        s = s/2;
        Qmat(1:t,1:t) = s;
    end
end