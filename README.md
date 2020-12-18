# taeglich.sh

Einfaches Führen eines Tagebuches. 

## Arbeitsweise

Dieses Script hilft Dir, schnell und einfach mit vim ein Tagebuch zu führen. 
Du solltest die Variable NOTES_DIRECTORY anpassen. Hier notierst Du, wo Deine Dateien gespeichert werden. 
Das script erzeugt diese Struktur:

```
── 2017
│   └── 2017-12.md
├── 2018
│   ├── 2018-01.md
│   ├── 2018-02.md
│   ├── 2018-03.md
│   ├── 2018-04.md
│   ├── 2018-05.md
│   ├── 2018-08.md
│   ├── 2018-11.md
│   └── 2018-12.md
├── 2019
│   ├── 2019-01.md
│   ├── 2019-02.md
│   ├── 2019-05.md
│   ├── 2019-06.md
│   ├── 2019-08.md
│   ├── 2019-09.md
│   ├── 2019-10.md
│   └── 2019-11.md
└── 2020
    ├── 2020-03.md
    ├── 2020-04.md
    ├── 2020-05.md
    ├── 2020-06.md
    └── 2020-12.md
```
Die Dateien selbst haben dieses Format:

``` 
# YYYY-MM-DD

- 
``` 
# TODO:

- [ ] Wenn eine Datei neu angelegt wird, werden auch drei Umbrüche erstellt. Das muss raus. 
