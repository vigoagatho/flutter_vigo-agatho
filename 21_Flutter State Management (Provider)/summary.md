## Rangkuman Materi Flutter State Management (Provider)
Berikut adalah 3 poin rangkuman yang saya dapat dari materi diatas
- State merupakan data yang dapat dibaca saat pembuatan widget dan dapat berubah selagi widget sedang aktif, state secara eksklusif hanya di,iliki oleh StatefulWidget.
- Sebuah state atau kondisi dapat dibuat sebagai bagian property dari sebuah Map, state ini dapat digunakan pada widget saat melakukan build, sifat state yang dynamic membuat ia dapat dibuah datanya seiring pengerjaan build dari sebuah widget lewat method setState.
- Untuk sebuah state yang dapat digunakan oleh seluruh widget dalam project, kita akan menggunakan Global State. Global State sendiri memerlukan provider yang bisa di instalasi lewat penambahan package provider pada file pubspec.yaml.