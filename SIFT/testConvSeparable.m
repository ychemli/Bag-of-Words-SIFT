padding=1; % 0 = zero-padding, 1= recopie

I = imread('C:\Users\Yanis Chemli\Desktop\Cours\RDFIA\RDFIA TME 1\tools.gif');

hx=[-1 0 1];
hy=(1/4) * [1; 2; 1];

hx2 = (1/4)*[1 2 1];
hy2 = [-1; 0; 1];

% convloution 1 d selon l'axe des x
d = size(hx,2);
if(size(hx,1)~=1)
    'erreur filtre x pas de bonne dimension'
end

if(mod(d,2)~=1)
    'erreur filtre x paqs de taille impaire'
end

d1 = size(hy,1);

if(size(hy,2)~=1)
    'erreur filtre y pas de bonne dimension'
end

if(mod(d,2)~=1)
    'erreur filtre y paqs de taille impaire'
end

if(d1~=d)
    'erreur'
end


[n,m] = size(I);

t = (d-1)/2;

% Matrice de Toeplitz Tx : taille m+2*t,m
Tx = zeros(m+2*t,m);
for j=1:m 
    Tx(j:j+d-1,j) = hx';
end

Tx2 = zeros(m+2*t,m);
for j=1:m 
    Tx2(j:j+d-1,j) = hx2';
end

% Ip : padding sur les colonnes : taille n,m+2*t
Ip = zeros(n,m+2*t);
Ip(:,t+1:m+t) = I(:,:);

if(padding==1)
    for i=1:t
        Ip(:,i) = I(:,1);
        Ip(:,m+t+i) = I(:,m);
    end
end
% Calcul de la convolution selon le filtre hx
y = Ip * Tx;
y2 = Ip * Tx2;

% Padding de la r�ponse selon les lignes : yP taille n+2*t,m
yP = zeros(n+2*t,m);
yP(t+1:n+t,:)=y;

yP2(t+1:n+t,:)=y2;

if(padding==1)
    for i=1:t
        yP(i,:) = y(1,:);
        yP(n+t+i,:) = y(n,:);
    end
end

if(padding==1)
    for i=1:t
        yP2(i,:) = y2(1,:);
        yP2(n+t+i,:) = y2(n,:);
    end
end


% Matrice de Toeplitz Ty : taille n,n+2*t
Ty = zeros(n,n+2*t);

for i=1:n
    Ty(i,i:i+d-1) = hy';
end

for i=1:n
    Ty2(i,i:i+d-1) = hy2';
end

Ix = Ty * yP;
Iy = Ty2 * yP2;

figure(1);
imshow(Ix);
figure(2);
imshow(Iy);
figure(3);
imshow(Ix+Iy);
