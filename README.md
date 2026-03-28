# Autoinstall

Mit der Autoinstall-Konfiguration soll es möglich sein, die Notebooks für die ehrenamtlichen Mitarbeiter nach der Rückgabe auf einen einheitlichen Stand zurückzusetzen.

## Ubuntu Version

[Ubuntu Cinnamon 24.04.4 "Noble Numbat" LTS](https://ubuntucinnamon.org/)

## Installationsanleitung

Short-URL mit der Konfiguration für die automatische Installation:

https://bit.ly/4bAPVET

## Passwort-Hash erstellen

```
openssl passwd -6 <password>
```

Beispiel:

```
$ openssl passwd -6 test
$6$.TmNy914nKh8AnBW$IIu./ASI2R1pnNY52EGJ33HU8TOexOTMXqvNUjg1igtMllYYMzuqRaiio4T/n0QE3bSbiw1VeS6g0aL6uRT9B.
```

## Anleitung zur Erstellung eines ISO-Images mit Autoinstall-Konfiguration

1. ISO-Image herunterladen

2. ISO-Image mounten

```
sudo mount -o loop <iso-image datei> <mount punkt>
```

3. ISO-Image extrahieren

```
rsync -a <mount punkt>/ <zielverzeichnis>
```

4. Autoinstall-Konfiguration `autoinstall.yaml` ins root-Verzeichnis des extrahierten ISO-Images kopieren

5. ISO-Image mit Autoinstall-Konfiguration erstellen

```
xorriso -as mkisofs -r -V "UBUNTU_KULTURLOGE" -o ../../ubuntu-24.04.4-kulturloge-autoinstall-desktop-amd64.iso -J -l -b boot/grub/i386-pc/eltorito.img -c boot.catalog -no-emul-boot -boot-load-size 4 -boot-info-table .
```