## Rangkuman Materi Flutter State Management (BLoC)
Berikut merupakan 3 poin rangkuman yang saya dapatkan dari materi diatas :
- BLoC merupakan state manager yang memanfaatkan metode pemisahan UI dengan Business logic, sehingga tiap tiap file kode dapat terlihat rapi dan terstruktur dengan ui dan state yang terpisah. Dengan demikian penggunaan BLoC dapat dikatakan simple powerfull dan testable.
- BLoC menerima event sebagai inputan dan kemudian di kelola dalam BLoC lalu menghasilkan state sebagai Output. Data yang masuk ke BLoC dokelola oleh Stream yang bekerja secara async dan merupakan aktor utama dalam BLoC.
- Efisiensi BLoC memudahkan penggunaan state dalam kode karena BLoC bersifat Global state sehingga bisa didaftarkan pada setiap widget yang memerlukan state tersebut.