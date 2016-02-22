% This program is used to perform Histogram Equalization.
% Author : Ashwini Singh-PA 1 Computer Vision
% Input  : hazecity.png(RGB image)
% Output : hazecity.png(gray-scale image)

function[] =fn_HistogramEqualization(filename)

figure('name','ASHWINI SINGH: Histogram Equalization','NumberTitle','off')
data=imread(filename);                              % Read an Image
gray=rgb2gray(data);                                % Convert to gray scale
pixelCounts=zeros(1,256);       
for i=0:255
    pixelCounts(1,i+1)=size(gray(gray==i),1);       % Histogram (Occurrence of pixels)
end

total_no_pixels=size(gray,1)*size(gray,2);
X_axis=[0:255];
pdf = pixelCounts ./ total_no_pixels;               % PDF of image
sum=0;
for i=0:255
    sum=sum+pdf(1,i+1);                             % CDF of image
    pdf(1,i+1)=sum;
end

pdf1=round(pdf.*255);                               % To get Intensity of an image: multiply by maximum possible value (255)
Histo_Eq=uint8(zeros(size(gray,1),size(gray,2)));

for i=1:size(gray,1)
for j=1:size(gray,2)
            Histo_Eq(i,j)=pdf1(gray(i,j)+1);        % get the new Intensity of each pixel position
    end
end

imshow(Histo_Eq);

title('Histogram Equalization', 'Fontsize', 10);

end