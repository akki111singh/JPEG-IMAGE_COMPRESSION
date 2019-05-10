clc;clear;
I = imread('LAKE.TIF');
I=double(I);
T = create_mat_dct(); % dct matrix

func1 = @(block_struct) myDCT(block_struct.data,T);
imdct = blockproc(I,[8 8],func1);

q_mtx = [   16 11 10 16 24 40 51 61; 
            12 12 14 19 26 58 60 55;
            14 13 16 24 40 57 69 56;
            14 17 22 29 51 87 80 62;
            18 22 37 56 68 109 103 77;
            24 35 55 64 81 104 113 92;
            49 64 78 87 103 121 120 101;
            72 92 95 98 112 100 103 99  ] ;
    
func2 = @(block_struct) myDCT_quantization(block_struct.data,q_mtx,2);
Quant = blockproc(imdct,[8 8],func2);

func3 = @(block_struct) myDCT_dequantization(block_struct.data,q_mtx,2);

DeQuant = blockproc(Quant,[8 8],func3);
I2=DeQuant;
disp(My_entropy(I2));
disp(RMSE(I,I2));

imshowpair(I,I2,'montage');
