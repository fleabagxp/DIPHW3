img = imread('D:\Users\fleabag\Documents\MATLAB\Image\Flower_Snack.pgm');
subplot(2,1,1)
imshow(img);
img2=255-img;

img2(img2>=30 & img2<=210) = 255;
title('PGM');





BW1 = im2bw(img); %Convert to binary image so the boundary can be traced
BW2 = imfill(BW1,'holes');
[Label,Total]=bwlabel(BW2);

Sdata=regionprops(Label,'BoundingBox');
imgc=imcrop(img2,Sdata(1).BoundingBox);
imgc2=imcrop(imgc,[150 150 1200 1200]);


%subplot(2,2,2)
%imshow(img2);
%subplot(2,2,3);
%imshow(BW2); hold on; 
%plot(b(:,2),b(:,1),'g','LineWidth',3);
%disp(img2)
sumarea = ((bwarea(255-imgc2)*(0.0264583333333334))/(2.60*10.^3));
disp(sumarea);



subplot(2,1,2);
imshow(imgc2);
title('Result');
