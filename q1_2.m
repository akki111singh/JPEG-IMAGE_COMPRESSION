clc; clear;
I = imread('LAKE.TIF');
I = double(I);
T = create_mat_dct();
I1=I(420:427,45:52);
I2=I(427:434,298:305);
I3=I(30:37,230:237);
imagesc(I3);colormap gray;
imdct1=myDCT(I1,T);
imdct2=myDCT(I2,T);
imdct3=myDCT(I3,T);

q_mtx = [   16 11 10 16 24 40 51 61; 
            12 12 14 19 26 58 60 55;
            14 13 16 24 40 57 69 56;
            14 17 22 29 51 87 80 62;
            18 22 37 56 68 109 103 77;
            24 35 55 64 81 104 113 92;
            49 64 78 87 103 121 120 101;
            72 92 95 98 112 100 103 99  ] ;
     
Q1=myDCT_quantization(imdct1,q_mtx,2);
Q2=myDCT_quantization(imdct2,q_mtx,2);
Q3=myDCT_quantization(imdct3,q_mtx,2);


DQ1=myDCT_dequantization(Q1,q_mtx,2);
DQ2=myDCT_dequantization(Q2,q_mtx,2);
DQ3=myDCT_dequantization(Q3,q_mtx,2);

figure;
imagesc(DQ1); colormap gray;
figure;
imagesc(DQ2); colormap gray;
figure;
imagesc(DQ3); colormap gray;

