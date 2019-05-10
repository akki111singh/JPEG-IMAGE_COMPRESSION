function res=My_entropy(I)
%// Calculate PDF
h = imhist(I);
h = h / numel(I);
%// Set any entries in the PDF that are 0 to 1 so log calculation works
h(h == 0) = 1;

%// Calculate entropy
res = -sum(h.*log2(h));
end
