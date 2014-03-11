function nesto
m=figure(1);

a(1:2,1)=[644 1];
a(1:2,2)=[590 1];
a(1:2,3)=[611 1];
a(1:2,4)=[582 1];
bar(a);
axis([0.5 1.5 500 700]);
title('Konaèna rješenja');
xlabel('Indeks grafa');
ylabel('Broj dodanih bridova');
legend('Genetski algoritam','Imunoloski algoritam','Mravlji algoritam','Mravlji algoritam "Blizanac"');
saveas(m,'Zajedno1000','png');
end