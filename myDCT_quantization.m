function res=myDCT_quantization(imDCT,qm,c)
res=imDCT./(c*qm);
res=round(res);
end