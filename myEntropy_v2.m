%function [sym, prob,entropy,cr] = myEntropy(X)
function myEntropy_v2
clear all; close all; clc;
str = "hello world";
imrgb = imread('./peppers_rgb.png');
imgray = imread('./peppers_gray.png');
X = imrgb;

if isa(X,'string')% string input
    char_arr = char(X);
    num_arr = double(char_arr);
    [sym, freq,entropy,cr] = symbol_count(num_arr)
    bar(freq); set(gca,'xticklabel',num2cell(char(sym)));
    title('String'); xlabel('symbols');ylabel('freq');
elseif isa(X,'uint8')
    if size(X,3)==3 % color image input
        %convert RGB to YCbCr and only takes the CbCr
        imycbcr = rgb2ycbcr(X);
        y = imycbcr(:,:,1);
        cb = imycbcr(:,:,2);
        cr = imycbcr(:,:,3);
        [sym_y, freq_y,entropy_y,cr_y] = symbol_count(y);
        [sym_cb, freq_cb,entropy_cb,cr_cb] = symbol_count(cb);
        [sym_cr, freq_cr,entropy_cr,cr_cr] = symbol_count(cr);
        figure
        subplot(3,1,1);
        bar(sym_cb,freq_cb);title('Y');xlabel('symbols');ylabel('freq');
        subplot(3,1,2); 
        bar(sym_cb,freq_cb);title('Cb');xlabel('symbols');ylabel('freq');
        subplot(3,1,3); 
        bar(sym_cr,freq_cr);title('Cr'); xlabel('symbols');ylabel('freq');
    else % grayscale image input 
        [sym, freq,entropy,cr] = symbol_count(X);
        bar(sym,freq);title('Grayscale'); xlabel('symbols');ylabel('freq');
    end  
else
    disp("input is not of type string or 8-bit image");
end

    function [sym,freq,entropy,cr] = symbol_count(num_arr)
        entropy = 0;
        cr = 789;
        [sym,jj,kk] = unique(num_arr);
        freq = accumarray(kk,1);
        prob = freq/sum(freq);
        for i=1:numel(prob)
            entropy = entropy - (prob(i)*log2(prob(i)));
        end
        cr = (numel(num_arr)*(8/entropy));
    end

end

