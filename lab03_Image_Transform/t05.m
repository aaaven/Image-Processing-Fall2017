row_1=[-1,-1,-1,-1];
row_2=[1,0.5,-0.5,-1];
row_3=[1,-1,-1,1];
row_4=[0.5,-1,1,-0.5];

col_1=[-1;-1;-1;-1;];
col_2=[1;0.5;-0.5;-1;];
col_3=[1;-1;-1;1];
col_4=[0.5;-1;1;-0.5];

my_DCT_bases = DCT_bases( row_1,row_2,row_3,row_4,col_1,col_2,col_3,col_4 );

im_a=[255,0,0,0;
      255,0,0,0;
      255,0,0,0;
      255,0,0,0;];
  
im_b=[0,0,0,0;
      255,255,255,255;
      0,0,0,0;
      0,0,0,0;];
  
im_c=[255,0,0,0;
      0,255,0,0;
      0,0,255,0;
      0,0,0,255;];
  
im_a_DCT = projection_an_image_on_its_DCT_bases(im_a,my_DCT_bases);
im_b_DCT = projection_an_image_on_its_DCT_bases(im_b,my_DCT_bases);
im_c_DCT = projection_an_image_on_its_DCT_bases(im_c,my_DCT_bases);

fig = figure;
fig.OuterPosition = [100 100 1000,300];
subplot(1,3,1),imagesc(im_a_DCT),title('a');          
subplot(1,3,2),imagesc(im_b_DCT),title('b');
subplot(1,3,3),imagesc(im_c_DCT),title('c');
colormap gray(256);
print('images/t05_2D_dcf_coe','-dpng');



im_a_invert = recover_image( im_a_DCT,my_DCT_bases );
im_b_invert = recover_image( im_b_DCT,my_DCT_bases );
im_c_invert = recover_image( im_c_DCT,my_DCT_bases );

fig = figure;
fig.OuterPosition = [100 100 1000,300];
subplot(1,3,1),imagesc(im_a_invert),title('a');          
subplot(1,3,2),imagesc(im_b_invert),title('b');
subplot(1,3,3),imagesc(im_c_invert),title('c');
colormap gray(256);
print('images/t05_inverse','-dpng');
