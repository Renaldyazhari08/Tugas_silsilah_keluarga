/*
 * Nama : Renaldy Azhari IMaduddin
 * Kelas : INformatika B
 * NIM : 2106020
 * Tugas silsilah keluarga lanjutan (Dikumpulkan pada tgl 23 maret 2023)
 */
laki_laki(david).
perempuan(amy).
laki_laki(jack).
perempuan(karen).
perempuan(liza).
laki_laki(john).
perempuan(susan).
laki_laki(ray).
perempuan(mary).
laki_laki(peter).
menikah(david, amy).
menikah(jack, karen).
menikah(john, susan).
ayah_dan_anak(david, liza).
ayah_dan_anak(david, john).
ayah_dan_anak(jack, susan).
ayah_dan_anak(jack, ray).
ayah_dan_anak(john, peter).
ayah_dan_anak(john, mary).
ibu_dan_anak(amy, liza).
ibu_dan_anak(amy, john).
ibu_dan_anak(karen, ray).
ibu_dan_anak(karen, susan).
ibu_dan_anak(susan, peter).
ibu_dan_anak(susan, mary).

apakah_ayah(X, Y):- ayah_dan_anak(X, Y). %Apakah x adalah ayah dari y
apakah_ibu(X, Y):- ibu_dan_anak(X, Y). %Apakah x adalah ibu dari y
apakah_anak(Y, X):- apakah_ibu(Y, X).
apakah_anak(Y, X):- apakah_ayah(Y, X).
apakah_menikah(X, Y):- menikah(X, Y), laki_laki(X), perempuan(Y). %Apakah X dan Y menikah? (X == laki_laki) (Y == Perempuan)
apakah_saudarakandung(A, B):- ayah_dan_anak(C, A), ayah_dan_anak(C, B).
apakah_saudarakandung(A, B):- ibu_dan_anak(C, A), ibu_dan_anak(C, B).
apakah_kakek(X, Z):- ibu_dan_anak(Y, Z), ayah_dan_anak(X, Y). %Apakah X adalah kakek dari Z
apakah_kakek(X, Z):- ayah_dan_anak(Y, Z), ayah_dan_anak(X, Y).
apakah_nenek(X, Z):- ibu_dan_anak(Y, Z), ibu_dan_anak(X, Y). %Apakah X adalah nenek dari Z
apakah_nenek(X, Z):- ayah_dan_anak(Y, Z), ibu_dan_anak(X, Y).
apakah_lakilaki(X):- laki_laki(X).
apakah_perempuan(X):- perempuan(X).
apakah_paman(X, Z):- apakah_ayah(Y, Z), apakah_saudarakandung(X, Y), laki_laki(X), not(ayah_dan_anak(X, Z)). %Apakah X adalah paman dari Z
apakah_paman(X, Z):- apakah_ibu(Y, Z), apakah_saudarakandung(X, Y), laki_laki(X). %Apakah X adalah paman dari Z
apakah_bibi(X, Z):- apakah_ayah(Y, Z), apakah_saudarakandung(X, Y), perempuan(X). %Apakah X adalah bibi dari Z
apakah_bibi(X, Z):- apakah_ibu(Y, Z), apakah_saudarakandung(X, Y), perempuan(X), not(ibu_dan_anak(X,Z)). %Apakah X adalah bibi dari Z
apakah_mertua(X, Z):- apakah_menikah(Y, Z), apakah_ayah(X, Y).%Apakah X adalah mertua dari Z
apakah_mertua(X, Z):- apakah_menikah(Y, Z), apakah_ibu(X, Y).%Apakah X adalah mertua dari Z
apakah_mertua(X, Z):- apakah_menikah(Z, Y), apakah_ayah(X, Y).%Apakah X adalah mertua dari Z
apakah_mertua(X, Z):- apakah_menikah(Z, Y), apakah_ibu(X, Y).%Apakah X adalah mertua dari Z
apakah_keponakan(Z, X):- apakah_paman(X, Z).
apakah_keponakan(Z, X):- apakah_bibi(X, Z).
apakah_ipar(X, Z):- apakah_menikah(X, Y), apakah_saudarakandung(Y, Z). %apakah X adalah saudara ipar dari Z
apakah_ipar(X, Z):- apakah_menikah(Y, X), apakah_saudarakandung(Y, Z).
apakah_menantu(Z, X):- apakah_mertua(X, Z).

% Apakah A dan Z Besan? (anak dari A dan Z saling menikah?) Ada 2^3
% permutasi kemungkinan :

apakah_besan(A, Z):- apakah_ayah(A, B), apakah_ayah(Z, Y), apakah_menikah(B, Y).
apakah_besan(A, Z):- apakah_ayah(A, B), apakah_ayah(Z, Y), apakah_menikah(Y, B).
apakah_besan(A, Z):- apakah_ayah(A, B), apakah_ibu(Z, Y), apakah_menikah(B, Y).
apakah_besan(A, Z):- apakah_ayah(A, B), apakah_ibu(Z, Y), apakah_menikah(Y, B).
apakah_besan(A, Z):- apakah_ibu(A, B), apakah_ayah(Z, Y), apakah_menikah(B, Y).
apakah_besan(A, Z):- apakah_ibu(A, B), apakah_ayah(Z, Y), apakah_menikah(Y, B).
apakah_besan(A, Z):- apakah_ibu(A, B), apakah_ibu(Z, Y), apakah_menikah(B, Y).
apakah_besan(A, Z):- apakah_ibu(A, B), apakah_ibu(Z, Y), apakah_menikah(Y, B).








