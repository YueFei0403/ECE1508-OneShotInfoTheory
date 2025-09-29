function encoded = elias_delta_enc(x)
    base = floor(log2(x));
    n = 1 + base;
    b = x - 2^(base);
    bin_c = dec2bin(b,base) - 48;
    uni_c = [zeros(1,n) 1];
    encoded = [uni_c bin_c];
end