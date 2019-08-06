function hertzian_dipole

%% ´Å³¡
epsilon = 4*pi*1e-7 ;
c = 3*1e8 ;
mu = 1 / (c^2*epsilon) ;
freq = 10e8 ;
w = 2 * pi * freq ;

beta = w*sqrt(mu*epsilon) ;
I = 1 ;
l = 1 / freq * c ;
r = linspace(0 , 10 / freq * c , 200) ;
theta = linspace(0 , 2*pi , 200) ; % ×¢Òâ£º0<=theta<=2pi

[theta,r]=meshgrid(theta,r);

azimuth = (1i .* beta .* I .* l) ./ (4 .* pi .* r) .*...
    (1 + 1 ./ (1i .* beta .* r)) .* sin(theta) .* exp(-1i .* beta .* r) ;
azimuth = real(azimuth) ;
%% µÑ¿¨¶û
[xx,yy,zz]=sph2cart(azimuth,theta,r);
% subplot(2,2,1)
surf(xx,yy,zz);
hold

% quiver3(xx,yy,zz,xx,yy,zz)

% shading interp



