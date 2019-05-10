function res=myDCT_dequantization(imqDCT,qm,c)
    r=imqDCT.*qm*c;
    F=create_mat_dct();
    res=F'*r*F;
end