# Fonctionnement du JDK
Cours outil dev
Lp MiAR Nantes

## Prérequis
A la racine du projet:
git colne https://github.com/iluwatar/java-design-patterns.git

https://www.slf4j.org/download.html version 1.7.25 dans le dossier lib/

Architecture de départ:
```
|-jar  
|-MANIFEST_LOOP.MF  
| |-MANIFEST.MF  
|  
|-java-design-patterns  
| |-depot git ...  
|  
|-lib  
| |-slf4j-1.7.25  
|  
|-temp  
|  
|-bridge.sh
|-loop.sh
|-README.MD
```

## bridge.sh
contient toute les commande des question fonctionnant avec bridge.

## loop.sh
créer les .class et les jar de tout les projet possible.
