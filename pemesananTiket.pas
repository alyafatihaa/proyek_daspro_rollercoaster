program tiketRollercoaster;
uses crt;

var
  nama, ulangi, konfirmasi : string;
  usia, tb : real;
  pilihanTiket : integer;
  hTiket, uangBayar, kembalian, uangKurang : real;

begin
  clrscr;
  writeln('SELAMAT DATANG DI WAHANA ROLLERCOASTER!');
  writeln;

  write('Apakah Anda ingin membeli tiket? (Ya/Tidak) : ');
  readln(konfirmasi);
  writeln;

  // Percabangan IF memeriksa apakah pengunjung ingin membeli tiket. 
  if ((konfirmasi = 'YA') or (konfirmasi = 'Ya') or (konfirmasi = 'ya')) then
  begin
    // REPEAT-UNTIL mengulang proses pemeriksaan pengunjung sampai pengguna menjawab "TIDAK".
    repeat
      
      write('Masukkan Nama : ');
      readln(nama);

      write('Masukkan Usia : ');
      readln(usia);
      while usia <= 0 do // WHILE memvalidasi usia agar nilainya harus lebih dari 0. 
      begin
        writeln('Usia TIDAK VALID!');
        write('Masukkan Usia : ');
        readln(usia);
      end;

      write('Masukkan Tinggi Badan (cm) : ');
      readln(tb);
      while tb <= 0 do // WHILE memvalidasi tinggi badan agar nilainya harus lebih dari 0.
      begin
        writeln('Tinggi Badan TIDAK VALID!');
        write('Masukkan Tinggi Badan (cm) : ');
        readln(tb);
      end;

      writeln;

      if (usia >= 12) and (tb >= 150) then
      begin
        writeln('Status : BOLEH NAIK!');
        writeln;

      
        writeln('Silahkan Pilih Tipe Tiket : ');
        writeln('1. Reguler (Rp 50.000)');
        writeln('2. VIP (Rp 100.000)');
        
        repeat //REPEAT-UNTIL memastikan pengguna memilih nomor tiket yang valid, yaitu 1 atau 2.
          write('Pilih Tiket Anda (1-2) : ');
          readln(pilihanTiket);

          case pilihanTiket of // CASE OF memilih harga tiket berdasarkan nomor pilihan pengguna.
            1 : hTiket := 50000;
            2 : hTiket := 100000;
          else
            writeln('Pilihan TIDAK VALID!');
          end;
        until (pilihanTiket = 1) or (pilihanTiket = 2);

        writeln;
        writeln('Total Bayar : Rp ', hTiket:0:0);

    
        repeat //Perulangan meminta pembayaran terus-menerus sampai uang yang dimasukkan mencukupi harga tiket.
          write('Masukkan Uang Pembayaran : Rp ');
          readln(uangBayar);
          
          // IF memeriksa kekurangan uang dan menghitung selisih antara harga tiket dengan uang pembayaran.
          if uangBayar < hTiket then
          begin
            uangKurang := hTiket - uangBayar;
            writeln('Uang Anda Kurang Rp ', uangKurang:0:0);
          end;
        until uangBayar >= hTiket;

        // Kembalian dihitung dari uang pembayaran dikurangi harga tiket.
        kembalian := uangBayar - hTiket;
        writeln('Uang Kembalian : Rp ', kembalian:0:0);
      end
      else
      begin
        // ELSE dijalankan jika salah satu atau kedua syarat keselamatan tidak terpenuhi.
        writeln('Status : MAAF, TIDAK BOLEH NAIK!');
        writeln('Alasan : Usia minimal 12 tahun dan Tinggi Badan minimal 150 cm.');
      end;

      writeln;
      write('Apakah Ingin Mengecek Pengunjung Lain? (Ya/Tidak) : ');
      readln(ulangi);

    // Program mengulang pemeriksaan pengunjung selama jawaban bukan "TIDAK" dalam variasi huruf yang ditentukan.
    until (ulangi = 'TIDAK') or (ulangi = 'Tidak') or (ulangi = 'tidak');
  end;

  clrscr;
  writeln('Terima Kasih Telah Berkunjung!');
  readln;
end.