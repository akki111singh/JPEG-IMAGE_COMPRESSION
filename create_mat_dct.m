function c = create_mat_dct() 
n=8;
m=8;
[u,v] = meshgrid(0:n-1, 0:m-1); 
c = sqrt(2 / n) * cos(pi * (2*u + 1) .* v / (2 * n)); 
c(1,:) = c(1,:) / sqrt(2);