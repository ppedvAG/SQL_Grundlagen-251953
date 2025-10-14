/*
	Datentypen in SQL: 3 Große Gruppen

	1. Charakter/String Datentypen
	char(10) = 'Hallo' => 10 Byte an Speicherplatz werden immer belegt
	varchar(10) = 'Hallo' => 5 Byte Speicherplatz => belegt nur so viel wie das Wort lang ist

	nchar(10) => Verwendet Unicode => 10 Byte + 2 Byte extra für Unicode
	nvarchar() => Verwendet Unicode => 10 Byte + 2 Byte extra für Unicode

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB groß
	varchar(8000) & nvarchar(4000)


	2. Numerische Datentypen
	tinyint = 8 Bit = 1 Byte = 255
	smallint = 16 Bit = 2 Byte = 32k
	int = 32 Bit = 4 Byte = 2,14Mrd
	bigint = 64 Bit = 8 Byte = 9,2 Trillionen ca.

	bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool!

	decimal(x, y) = x Ziffern sind es gesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt, davon sind 2 Nachkommastellen
	=> 12345678,90
	money = ca 9,2 Trillionen
	smallmoney = ca. 214 Tausend

	float(n) = bis 53
	1-24 = 7 Stellen präzise runden = 4 Byte
	25-53 = 15 Stellen präzise runden = 8 Byte

	real = 4 Byte



	3. Datum/Zeit Datentypen
	time = hh:mm:ss.nnnnnnn (00:00:00:0000000 - 23:59:59.9999999)
	date = YYYY-MM-DD (0001-01-01 - 9999-12-31)
	datetime = date + time in Milisekunden 
			   YYYY-MM-DD hh:mm:ss.mmm 
			   (1753-01-01 00:00:00.000 - 9999-12-31 23:59:59.997)
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn 
				(0001-01-01 00:00:00.0000000 9999-12-31 23:59:59.9999999
	smalldatetime = YYYY-MM-DD hh:mm:ss
					(1900-01-01 00:00:00 - 2079-06-06 23:59:59)
*/