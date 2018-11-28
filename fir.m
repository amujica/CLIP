function [s] = fir (f)
h = [1/3 1/3 1/3];
s = filter(h,1,f);

end