function [sym, freq,entropy,cr] = myEntropy(X)

if isa(X,'string') || isa(X,'char')% string input
    char_arr = char(X);
    num_arr = double(char_arr);
    [sym, freq,entropy,cr] = symbol_count(num_arr);
elseif isa(X,'uint8')
    [sym, freq,entropy,cr] = symbol_count(X);
else
    disp("input is not of type string or 8-bit image");
end

    function [sym,freq,entropy,cr] = symbol_count(num_arr)
        entropy = 0;
        [sym,jj,kk] = unique(num_arr);
        freq = accumarray(kk,1);
        prob = freq/sum(freq);
        for i=1:numel(prob)
            entropy = entropy - (prob(i)*log2(prob(i)));
        end
        cr = (numel(num_arr)*(8/entropy));
    end

end

