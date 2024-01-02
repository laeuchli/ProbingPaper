loglog([32 64 128 256 512 1024],varZ,'o')
hold all
loglog([32 64 128 256 512 1024],vardssolvere1,'r.')
loglog([32 64 128 256 512 1024],vardssolvere2,'b.')

legend('Random', 'Our Method 10^-1', 'Our Method 10^-2')
%loglog([32 64 128 256 512 1024],vardssolvere1a,'rx')
%loglog([32 64 128 256 512 1024],vardssolvere2a,'bx')