%% eˣ Fonksiyonunun Yaklaşık Hesabı

clc; clear; close all;  % Çalışma alanını temizlenmesi.

% 1. Kullanıcıdan x değeri ve kullanılacak terim sayısının (n) alın.

x = input('x değerini giriniz: ');  
n = input('Kullanılacak terim sayisini (n) giriniz: ');   

% 2. For döngüsü kullanarak eˣ fonksiyonunu Taylor serisi ile hesaplayın.

toplam = 0 ;  % Taylor serisi toplamı için başlangıç değeri atanması. 

for i = 0 : n-1 
    terim = (x^i) / factorial(i);  % Taylor serisinin her teriminin hesaplanması.
    toplam = toplam + terim;  % Hesaplanan terimlerin toplama eklenmesi.
end

% 3. Sonucu MATLAB'ın yerleşik exp(x) fonksiyonu ile karşılaştırın.

gercek_deger = exp(x);  % MATLAB'ın hazır exp(x) fonksiyonu ile gerçek değeri hesaplama 

disp(['Taylor Serisi sonucu: ', num2str(toplam)]);  
disp(['Gerçek exp(x) değeri: ', num2str(gercek_deger)]);  

% 4. Grafik Çizimi

x_noktalari = -3:0.1:3;  % X ekseni için -3 ile 3 aralığında noktaların belirlenmesi.

y_gercek = exp(x_noktalari);  % Gerçek e^x fonksiyonunun bu aralıktaki değerlerinin hesaplanması.

taylor_grafik = zeros(size(x_noktalari));  

% Her bir x noktası için Taylor serisini hesaplanması.
for k = 1:length(x_noktalari)
    
    anlik_toplam = 0; 

    for m = 0 : n-1
        anlik_toplam = anlik_toplam + (x_noktalari(k)^m) / factorial(m);
    end
 
    taylor_grafik(k) = anlik_toplam;
end

figure(1);  % 1 Numaralı grafik penceresi açılması.

plot(x_noktalari, y_gercek, 'b-', 'LineWidth', 2);  % Gerçek e^x eğrisinin çizdirilmesi.

hold on; 

plot(x_noktalari, taylor_grafik, 'r--', 'LineWidth', 2);  % Taylor serisi ile bulunan yaklaşık eğrinin çizdirilmesi.

xlabel('x');  % x ekseni etiketi
ylabel('f(x)');  % y ekseni etiketi

legend('Gerçek e^x Eğrisi', 'Taylor Serisi Yaklaşımı');  % Grafik açıklaması

grid on;  % Grafiğe kareli arka plan eklenmesi
